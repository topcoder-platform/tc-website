package com.topcoder.web.codinginterface.techassess.model;

import com.topcoder.shared.messaging.QueueResponseManager;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.web.common.TCResponse;

import javax.naming.Context;
import java.io.Serializable;

/**
 * This class is used in the case where you want to wait for a response from a JMS Queue.
 * It takes care of waiting for the response to a message for a specified period of time.
 * This would be very straight forward, but we want to solve the case where message A
 * and message B are dispathed in that order, but A takes a long time to come back.  The
 * response to B should be received without waiting for A to come back.
 *
 * When you create an instance of <code>WebQueueResponseManager</code> a thread is created
 * that polls the queue.  When it gets a message, it either puts it into a <code>WebResponsePool</code>
 * or, if the response is old, it is thrown out as it is no longer relevant.

 * User: dok
 * Date: Dec 15, 2004
 * Time: 4:40:15 PM
 */
public class WebQueueResponseManager extends QueueResponseManager {

    public WebQueueResponseManager(String factoryName, String queueName,
                                   Context ctx, String selector) {
        super(factoryName, queueName, ctx, selector, new WebResponsePool());
    }

    public WebQueueResponseManager(String factoryName, String queueName,
                                   Context ctx, String selector, WebResponsePool responses) {
        super(factoryName, queueName, ctx, selector, responses);
    }

    /**
     * Gets a message from the queue and writes to the response object to
     * keep the client request alive while we're waiting.
     * @param waitTime
     * @param correlationId
     * @param response
     * @return
     * @throws com.topcoder.shared.messaging.TimeOutException
     */
    public Serializable receive(int waitTime, String correlationId, TCResponse response) throws TimeOutException {
        return ((WebResponsePool) responses).get(waitTime, correlationId, response);
    }


}
