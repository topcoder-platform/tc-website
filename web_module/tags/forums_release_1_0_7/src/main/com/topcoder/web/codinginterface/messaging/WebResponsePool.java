package com.topcoder.web.codinginterface.messaging;

import com.topcoder.shared.messaging.ResponsePool;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.web.common.TCResponse;

import java.io.IOException;
import java.io.Serializable;


/**
 * Provides a way to asynchronously receive messages from a queue including the ability
 * to wait for a specified period of time only, and then quit.
 * User: dok
 * Date: Dec 15, 2004
 * Time: 4:26:15 PM
 */
public class WebResponsePool extends ResponsePool {
    private static final String SPACE =
            "                                                  " +
            "                                                  ";  //100 spaces

    private int DEFAULT_PRINT_WAIT = 500;
    public WebResponsePool() {
        super();
    }

    public WebResponsePool(int waitTime) {
        super(waitTime);
    }

    /**
     * Polls the response pool for <code>timeoutLength</code> milliseconds for
     * a message associated with the <cocde>correlationId</code> while polling
     * it periodically writes some text to the response object to be sure that
     * client browsers stay alive.
     *
     * If it is found, the response is removed from the pool and returned.
     * @param timeoutLength
     * @param correlationId
     * @param response
     * @return
     * @throws TimeOutException
     */

    public synchronized Serializable get(int timeoutLength, String correlationId, TCResponse response) throws TimeOutException {
        long startTime = System.currentTimeMillis();
        long endTime = startTime + timeoutLength;
        long lastPrint = 0;
        waitList.add(correlationId);
        while (System.currentTimeMillis() < endTime) {
            if (pool.exists(correlationId)) {
                return get(correlationId);
            } else {
                try {
                    //print something out to the client every DEFAULT_PRINT_WAIT so that it doesn't time out
                    long curr = System.currentTimeMillis();
                    if ((lastPrint+DEFAULT_PRINT_WAIT)<curr) {
                        response.getWriter().print(SPACE);
                        response.getWriter().flush();
                        lastPrint =curr;
                    }
                    wait(waitTime);
                } catch (InterruptedException e) {
                    //ignore
                } catch (IOException e) {
                    //ignore this too.  if it happens a lot, they'll just timeout
                }
            }
        }
        //get it and ignore it cuz we don't care
        get(correlationId);
        throw new TimeOutException();
    }


}
