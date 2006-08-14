package com.topcoder.web.common;

import com.topcoder.shared.util.logging.Logger;
import org.hibernate.Session;

/**
 * This implementation uses the session-per-conversation strategy.
 * Therefore, it's appropriate when you have a conversation, or a series
 * of http requests working on the same data, followed by a final commit
 * to the database.  For instance, a registration process.  However, the
 * hibernate session is stored in the http session, so this can turn into a memory
 * problem if one loads a lot of data and it just hangs around taking up
 * app server resources.
 *
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 17, 2006
 */
public abstract class LongHibernateProcessor extends BaseProcessor {
    protected static final Logger log = Logger.getLogger(LongHibernateProcessor.class);
    public static final String HIBERNATE_SESSION_KEY = "hibernate_session";
    public static final String END_OF_CONVERSATION_FLAG = "end_of_conversation";
    public static final String ACTIVE_CONVERSATION_FLAG = "active_conversation";

    protected void businessProcessing() throws Exception {
        log.debug("sessionid: " + getRequest().getSession().getId());

        try {

            beginCommunication();
            // Do the work...
            dbProcessing();

            // End or continue the long-running conversation?
            if (getRequest().getAttribute(END_OF_CONVERSATION_FLAG) != null) {
                closeConversation();
            } else if (getRequest().getAttribute(ACTIVE_CONVERSATION_FLAG) != null) {
                endCommunication();
            }

/*
        } catch (StaleObjectStateException staleEx) {
            log.error("This interceptor does not implement optimistic concurrency control!");
            log.error("Your application will not work until you add compensation actions!");
            // Rollback, close everything, possibly compensate for any permanent changes
            // during the conversation, and finally restart business conversation. Maybe
            // give the user of the application a chance to merge some of his work with
            // fresh data... what you do here depends on your applications design.
            throw staleEx;
*/
        } catch (Exception e) {
//            log.debug("printing the stack from base");
            //e.printStackTrace();
            exceptionCallBack();
            handleException(e);
            throw e;
        } catch (Throwable ex) {
            exceptionCallBack();
            handleException(ex);
            throw new Exception(ex);
        }
    }

    protected void markForCommit() {
        log.debug("mark the end of the conversation");
        getRequest().setAttribute(END_OF_CONVERSATION_FLAG, String.valueOf(true));
    }

    /**
     * End a single exchange in a long running conversation of exchanges
     */
    protected void endCommunication() {
        HibernateUtils.commit();
        Session hibernateSession = ExtendedThreadLocalSessionContext.unbind(HibernateUtils.getFactory());
        getRequest().getSession().setAttribute(HIBERNATE_SESSION_KEY, hibernateSession);
    }

    /**
     * Either begin a conversation, or resume an existing one.
     */
    protected void beginCommunication() {
        Session hibernateSession =
                (Session) getRequest().getSession().getAttribute(HIBERNATE_SESSION_KEY);
        if (hibernateSession != null) {
            ExtendedThreadLocalSessionContext.bind(hibernateSession);
        }

        //log.debug("Starting a database transaction");
        HibernateUtils.begin();
        getRequest().setAttribute(ACTIVE_CONVERSATION_FLAG, String.valueOf(true));

    }

    /**
     * End a conversation.  This will persist changes to the db, and wrap things up.
     */
    protected void closeConversation() {
        //only close if there is something to close
        if (String.valueOf(true).equals(getRequest().getAttribute(ACTIVE_CONVERSATION_FLAG))) {
            HibernateUtils.getSession().flush();
            HibernateUtils.commit();
            HibernateUtils.getSession().close(); // Unbind is automatic here

            //we're creating a new session to handle the case that the request processing invalidated the session
            //there's no way to check, so this is what we're doing.
            getRequest().removeAttribute(END_OF_CONVERSATION_FLAG);
            getRequest().removeAttribute(ACTIVE_CONVERSATION_FLAG);
            try {
                getRequest().getSession().setAttribute(HIBERNATE_SESSION_KEY, null);
            } catch (Exception e) {
                log.error("problem nulling out the hibernate session key: " + e.getMessage());
            }
        } else if (HibernateUtils.getSession().isOpen()) {
            log.error("we're not closing a conversation that has an open session");
        }
    }


    protected void handleException(Throwable e) {
        try {
            if (HibernateUtils.getSession().getTransaction().isActive()) {
//                log.debug("Trying to rollback database transaction after exception");
                HibernateUtils.rollback();
            }
        } finally {
//            log.error("Cleanup after exception!");

            // Cleanup
//            log.debug("Closing and unbinding Session from thread");
            HibernateUtils.getSession().close(); // Unbind is automatic here

//            log.debug("Removing Session from HttpSession");
            getRequest().getSession().setAttribute(HIBERNATE_SESSION_KEY, null);

        }

    }

    /**
     * This method should be implemented by child classes if they
     * need to do some processing in the case that there is an exception while
     * attempting to persist data etc.  The default implementation is empty
     */
    protected void exceptionCallBack() {

    }


    protected abstract void dbProcessing() throws Exception;


}
