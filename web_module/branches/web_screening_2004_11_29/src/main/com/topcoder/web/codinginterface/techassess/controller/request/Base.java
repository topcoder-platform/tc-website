package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.codinginterface.techassess.model.WebQueueResponseManager;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.messaging.QueueResponseManager;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.shared.netCommon.messages.Message;

import java.util.HashMap;
import java.io.PrintWriter;
import java.io.IOException;

/**
 * User: dok
 * Date: Dec 10, 2004
 */
public abstract class Base extends BaseProcessor {
    private QueueMessageSender sender;
    private WebQueueResponseManager receiver;


    public void setReceiver(WebQueueResponseManager receiver) {
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

        Message ret = null;
        getResponse().setStatus(500);
        getResponse().setContentType("text/html");
        try {
            PrintWriter out = getResponse().getWriter();
            out.println("<html><head><title>Wait page</title></head><body><table><tr><td>");
            ret = (Message)receiver.receive(waitTime, correlationId, getResponse());
            out.println("</td></tr></table></body></html>");
            out.flush();
        } catch (IOException e) {
            //todo do something with this
        }

        return ret;
    }




}

