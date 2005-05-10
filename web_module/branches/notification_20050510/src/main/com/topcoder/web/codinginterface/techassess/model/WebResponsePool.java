package com.topcoder.web.codinginterface.techassess.model;

import com.topcoder.shared.messaging.ResponsePool;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.web.common.TCResponse;

import java.io.IOException;
import java.io.Serializable;


/**
 * User: dok
 * Date: Dec 15, 2004
 * Time: 4:26:15 PM
 */
public class WebResponsePool extends ResponsePool {

    private int DEFAULT_PRINT_WAIT = 500;
    public WebResponsePool() {
        super();
    }

    public WebResponsePool(int waitTime) {
        super(waitTime);
    }

    public synchronized Serializable get(int timeoutLength, String correlationId, TCResponse response) throws TimeOutException {
        long startTime = System.currentTimeMillis();
        long endTime = startTime + timeoutLength;
        long lastPrint = 0;
        while (System.currentTimeMillis() < endTime) {

            if (responseMap.containsKey(correlationId)) {
                return (Serializable) responseMap.get(correlationId);
            } else {
                try {
                    //print something out to the client every DEFAULT_PRINT_WAIT so that it doesn't time out
                    long curr = System.currentTimeMillis();
                    if ((lastPrint+DEFAULT_PRINT_WAIT)<curr) {
                        response.getWriter().print("                   ");
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
        dropList.add(correlationId);
        throw new TimeOutException();
    }


}
