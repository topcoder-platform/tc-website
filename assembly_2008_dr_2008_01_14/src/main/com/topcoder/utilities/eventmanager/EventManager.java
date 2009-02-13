package com.topcoder.utilities.eventmanager;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.ejb.userevent.UserEvent;

import javax.naming.InitialContext;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.Iterator;

/**
 * @author dok
 * Date: Apr 2, 2004
 */
public class EventManager {

    private static Logger log = Logger.getLogger(EventManager.class);

    public static void main(String[] args) {
        try {
            ResultSetContainer events = getUnprocessedEvents();
            ResultSetContainer.ResultSetRow event = null;
            long userEventId = 0;
            long userId = 0;
            String handler = null;
            InitialContext ctx = null;
            try {
                ctx = TCContext.getInitial();
                UserEvent userEvent = (UserEvent) BaseProcessor.createEJB(ctx, UserEvent.class);
                for (Iterator it = events.iterator(); it.hasNext();) {
                    event = (ResultSetContainer.ResultSetRow) it.next();
                    userEventId = event.getLongItem("user_event_id");
                    userId = event.getLongItem("user_id");
                    handler = event.getStringItem("event_handler");
                    try {
                        processEvent(handler, userId);
                        userEvent.setUserEventStatus(userEventId,
                                Constants.PROCESSING_COMPLETE, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    } catch (Exception e) {
                        userEvent.setUserEventStatus(userEventId,
                                Constants.PROCESSING_FAILED, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                        notify(userEventId, userId, handler, e);
                    }
                }
            } finally {
                BaseProcessor.close(ctx);
            }

        } catch (Exception e) {
            notify("Fatal Error: ", e);
        }
    }

    private static ResultSetContainer getUnprocessedEvents() throws Exception {
        InitialContext ctx = null;
        try {
            ctx = TCContext.getInitial();
            UserEvent userEvent = (UserEvent) BaseProcessor.createEJB(ctx, UserEvent.class);
            return userEvent.getUserEventsByStatus(Constants.READY_FOR_PROCESSING,
                    DBMS.COMMON_OLTP_DATASOURCE_NAME);
        } finally {
            BaseProcessor.close(ctx);
        }

    }

    private static void processEvent(String event, long userId) throws Exception {
        try {
            Class eventClass = Class.forName(event);
            EventHandler handler = (EventHandler) eventClass.newInstance();

            handler.process(userId);

        } catch (ClassNotFoundException cnfe) {
            throw new Exception("Could not find class: " + event);
        } catch (InstantiationException e) {
            throw new Exception("Could not instantiate: " + event);
        } catch (IllegalAccessException e) {
            throw new Exception("Illegal Access: " + event);
        }
    }


    private static void notify(long userEventId, long userId, String handler, Throwable t) {
        StringBuffer message = new StringBuffer(1000);
        message.append("There was an error:\n");
        message.append("user_event_id: ").append(userEventId).append("\n");
        message.append("user: ").append(userId).append("\n");
        message.append("handler: ").append(handler).append("\n\n");
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        t.printStackTrace(new PrintStream(baos));
        message.append(baos.toString());
        notify(message.toString());
    }

    private static void notify(String body, Throwable t) {
        StringBuffer message = new StringBuffer(1000);
        message.append(body);
        message.append("\n\n");
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        t.printStackTrace(new PrintStream(baos));
        message.append(baos.toString());
        notify(message.toString());

    }


    private static void notify(String body) {
        log.error(body);
        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject("User Event Processor Error");

        mail.setBody(body);
        try {
            mail.addToAddress(Constants.ERROR_EMAIL, TCSEmailMessage.TO);
            mail.setFromAddress("service@topcoder.com");
            EmailEngine.send(mail);
        } catch (Exception e) {
            log.error("Couldn't send erorr email\n" + body, e);
        }

    }

}
