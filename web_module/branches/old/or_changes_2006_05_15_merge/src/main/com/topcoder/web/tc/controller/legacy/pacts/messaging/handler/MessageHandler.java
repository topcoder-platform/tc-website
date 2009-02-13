package com.topcoder.web.tc.controller.legacy.pacts.messaging.handler;

/**
 * MessageHandler.java
 *
 * Created on October 18, 2001, 8:43 PM
 */

import javax.jms.ObjectMessage;

/**
 *************************************************************************************
 * The MessageHandler class holds a handle to message recievers. It is responsible for
 * dispatching messages to the correct reciever.
 * <br>
 * @author Alex Roman
 *************************************************************************************
 */
public interface MessageHandler {

    /**
     * processMessage handles the message passed to it. On completion, a success/failure
     * status is returned.
     *
     * @param msg             The message retrieve off the queue.
     * @return boolean        Processing status (true/false)
     */
    public boolean processMessage(ObjectMessage msg);
}
