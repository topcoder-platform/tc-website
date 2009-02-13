package com.topcoder.web.codinginterface.techassess.model;

import com.topcoder.shared.messaging.QueueResponseManager;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.web.common.TCResponse;

import javax.naming.Context;
import java.io.Serializable;

/**
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
        return ((WebResponsePool)responses).get(waitTime, correlationId, response);
    }


}
