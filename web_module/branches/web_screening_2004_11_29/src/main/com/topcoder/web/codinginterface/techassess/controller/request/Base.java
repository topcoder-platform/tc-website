package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.messaging.QueueResponseManager;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.shared.netCommon.messages.Message;

import java.util.HashMap;

/**
 * User: dok
 * Date: Dec 10, 2004
 */
public abstract class Base extends BaseProcessor {
    private QueueMessageSender sender;
    private QueueResponseManager receiver;


    public void setReceiver(QueueResponseManager receiver) {
        this.receiver = receiver;
    }

    public void setSender(QueueMessageSender sender) {
        this.sender = sender;
    }

    protected String send(Message m) {
        //todo if it becomes a problem, we may want to change
        //todo the behavior so that we don't wait indefinately
        String messageId = sender.sendMessageGetID(new HashMap(), m);
        return messageId;
    }

    protected Message receive(int waitTime, String correlationId) throws TimeOutException {
        return (Message)receiver.receive(waitTime, correlationId);
    }




}

