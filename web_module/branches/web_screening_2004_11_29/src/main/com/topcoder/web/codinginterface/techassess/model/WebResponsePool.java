package com.topcoder.web.codinginterface.techassess.model;

import com.topcoder.shared.messaging.ResponsePool;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.web.common.TCResponse;

import java.io.Serializable;
import java.io.IOException;


/**
 * User: dok
 * Date: Dec 15, 2004
 * Time: 4:26:15 PM
 */
public class WebResponsePool extends ResponsePool {

    public WebResponsePool() {
        super();
    }

    public WebResponsePool(int waitTime) {
        super(waitTime);
    }

    public synchronized Serializable get(int timeoutLength, String correlationId, TCResponse response) throws TimeOutException {
        long startTime = System.currentTimeMillis();
        long endTime = startTime + timeoutLength;
        while (System.currentTimeMillis() < endTime) {

            if (responseMap.containsKey(correlationId)) {
                try {
                    Thread.sleep(10000);
                } catch (InterruptedException e) {

                }
                return (Serializable) responseMap.get(correlationId);
            } else {
                try {
                    response.getWriter().print("X");
                    response.flushBuffer();
                    Thread.sleep(10000);
                    wait(waitTime);
                } catch (InterruptedException e) {
                    //ignore
                } catch (IOException e) {
                    //ignore this too.  if it happens a lot, they'll just timeout
                }
            }
        }
        dropList.add(correlationId);
        throw new TimeOutException();
    }


}
