package com.topcoder.web.tc.controller.legacy.pacts.messaging.handler;


/**
 * MessageHandlerFactory.java
 *
 * Created on October 18, 2001, 8:43 PM
 */

import com.topcoder.shared.util.DBMS;

/**
 *************************************************************************************
 * The MessageHandlerFactory class returns a handle to the a new message handler
 * of the specified type.
 * <br>
 * @author Alex Roman
 *************************************************************************************
 */
public class MessageHandlerFactory {

    /**
     * getMessageHandler returns a handle to a MessageHandler for a specific
     * type of queue.
     *
     * @param name             A string prepresenting the queue name.
     * @return MessageHandler  A handle to the message handler.
     */
    public static MessageHandler getMessageHandler(String name) throws Exception {
        MessageHandler mh = null;

        if (name.compareTo(DBMS.PACTS_QUEUE) == 0) {
            mh = new PactsMessageHandler();
        } else {
            throw new Exception("ERROR GETTING MESSAGE HANDLER: INVALID QUEUE NAME: " + name);
        }

        return (mh);
    }
}
