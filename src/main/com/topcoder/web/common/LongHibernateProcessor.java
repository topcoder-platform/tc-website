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
            exceptionCallBack();
            handleException(e);
            throw e;
        } catch (Throwable ex) {
            exceptionCallBack();
            handleException(ex);
            throw new Exception(ex);
        }
    }

    public void postProcessing() throws Exception {
        // End or continue the long-running conversation?
        if (String.valueOf(true).equals(getRequest().getAttribute(END_OF_CONVERSATION_FLAG))) {
            closeConversation();
        } else if (String.valueOf(true).equals(getRequest().getAttribute(ACTIVE_CONVERSATION_FLAG))) {
            endCommunication();
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
        log.debug("end communication");
        HibernateUtils.commit();
        Session hibernateSession = ExtendedThreadLocalSessionContext.unbind(HibernateUtils.getFactory());
        getRequest().getSession().setAttribute(HIBERNATE_SESSION_KEY, hibernateSession);
    }

    /**
     * Either begin a conversation, or resume an existing one.
     */
    protected void beginCommunication() {
        log.debug("bgin communication");
        if (String.valueOf(true).equals(getRequest().getAttribute(ACTIVE_CONVERSATION_FLAG))) {
            throw new RuntimeException("Active conversation exists, can not start another");
        } else {
            Session hibernateSession =
                    (Session) getRequest().getSession().getAttribute(HIBERNATE_SESSION_KEY);
            if (hibernateSession != null) {
                log.debug("bind existing hibernate session");
                ExtendedThreadLocalSessionContext.bind(hibernateSession);
            }

            //log.debug("Starting a database transaction");
            HibernateUtils.begin();
            getRequest().setAttribute(ACTIVE_CONVERSATION_FLAG, String.valueOf(true));
        }

    }

    /**
     * End a conversation.  This will persist changes to the db, and wrap things up.
     */
    protected void closeConversation() {
        log.debug("close conversation");
        //only close if there is something to close
        if (String.valueOf(true).equals(getRequest().getAttribute(ACTIVE_CONVERSATION_FLAG))) {
            HibernateUtils.getSession().flush();
            HibernateUtils.commit();
            HibernateUtils.closeSession(); // Unbind is automatic here
            cleanup();

        } else if (HibernateUtils.getSession().isOpen()) {
            log.error("we're not closing a conversation that has an open session");
        }
    }


    protected void handleException(Throwable e) {
        try {
            if (HibernateUtils.getSession().getTransaction().isActive()) {
                HibernateUtils.rollback();
            }
        } finally {
            HibernateUtils.closeSession(); // Unbind is automatic here
            cleanup();
        }

    }

    private void cleanup() {
        log.debug("cleanup");
        getRequest().removeAttribute(END_OF_CONVERSATION_FLAG);
        getRequest().removeAttribute(ACTIVE_CONVERSATION_FLAG);
        //getRequest().getSession().removeAttribute(HIBERNATE_SESSION_KEY);
        getRequest().getSession().setAttribute(HIBERNATE_SESSION_KEY, null);
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
