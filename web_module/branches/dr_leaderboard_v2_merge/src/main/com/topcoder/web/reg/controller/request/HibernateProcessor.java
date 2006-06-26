package com.topcoder.web.reg.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.reg.HibernateUtils;
import com.topcoder.web.reg.controller.ExtendedThreadLocalSessionContext;
import com.topcoder.web.reg.dao.DAOFactory;
import com.topcoder.web.reg.dao.Util;
import org.hibernate.Session;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 17, 2006
 */
public abstract class HibernateProcessor extends BaseProcessor {
    public static final String HIBERNATE_SESSION_KEY = "hibernate_session";
    public static final String END_OF_CONVERSATION_FLAG = "end_of_conversation";
    public static final String ACTIVE_CONVERSATION_FLAG = "active_conversation";
    private DAOFactory factory = null;

    protected void businessProcessing() throws Exception {
        log.debug("sessionid: " + getRequest().getSession().getId());

        try {

            beginCommunication();
            // Do the work...
            dbProcessing();

            // End or continue the long-running conversation?
            if (getRequest().getAttribute(END_OF_CONVERSATION_FLAG) != null) {
                closeConversation();
            } else if (getRequest().getAttribute(ACTIVE_CONVERSATION_FLAG)!=null) {
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
            handleException(e);
            throw e;
        } catch (Throwable ex) {
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
//                log.debug("Committing database transaction");
        HibernateUtils.commit();

//                 log.debug("Unbinding Session from thread");
        Session hibernateSession = ExtendedThreadLocalSessionContext.unbind(HibernateUtils.getFactory());

//                 log.debug("Storing Session in the HttpSession");
        getRequest().getSession().setAttribute(HIBERNATE_SESSION_KEY, hibernateSession);

//                 log.debug("> Returning to user in conversation");

    }

    /**
     * Either begin a conversation, or resume an existing one.
     */
    protected void beginCommunication() {
        Session hibernateSession =
                (Session) getRequest().getSession().getAttribute(HIBERNATE_SESSION_KEY);
        if (hibernateSession != null) {
            //log.debug("< Continuing conversation");
            ExtendedThreadLocalSessionContext.bind(hibernateSession);
        } else {
            //log.debug(">>> New conversation");
        }

        //log.debug("Starting a database transaction");
        HibernateUtils.begin();
        getRequest().setAttribute(ACTIVE_CONVERSATION_FLAG, String.valueOf(true));

    }

    /**
     * End a conversation.  This will persist changes to the db, and wrap things up.
     */
    protected void closeConversation() {
//                log.debug("Flushing Session");
        HibernateUtils.getSession().flush();

//                log.debug("Committing the database transaction");
        HibernateUtils.commit();

//                log.debug("Closing and unbinding Session from thread");
        HibernateUtils.getSession().close(); // Unbind is automatic here

//                log.debug("Removing Session from HttpSession");
        //we're creating a new session to handle the case that the request processing invalidated the session
        //there's no way to check, so this is what we're doing.
        getRequest().removeAttribute(END_OF_CONVERSATION_FLAG);
        getRequest().removeAttribute(ACTIVE_CONVERSATION_FLAG);
        try {
            getRequest().getSession().setAttribute(HIBERNATE_SESSION_KEY, null);
        } catch (Exception e) {
            log.error("problem nulling out the hibernate session key: " + e.getMessage());
        }

//                log.debug("<<< End of conversation");
    }


    private void handleException(Throwable e) {
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

    protected DAOFactory getFactory() {
        if (factory == null) {
            factory = Util.getFactory();
        }
        return factory;
    }


    protected abstract void dbProcessing() throws Exception;


}
