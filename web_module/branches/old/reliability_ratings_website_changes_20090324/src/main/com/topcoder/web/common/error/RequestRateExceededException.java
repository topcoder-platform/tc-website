package com.topcoder.web.common.error;

import com.topcoder.web.common.NavigationException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Oct 3, 2006
 */
public class RequestRateExceededException extends NavigationException {

    private String sessionId;
    private String handle;

    public RequestRateExceededException(String sessionId) {
        super("Request rate has exceeded allowable limit.");
        this.handle = "unknown";
        this.sessionId = sessionId;
        this.isVerbose = false;
    }

    public RequestRateExceededException(String sessionId, String handle) {
        super("Request rate has exceeded allowable limit.");
        this.sessionId = sessionId;
        this.handle = handle;
        this.isVerbose = false;
    }

    public String getSessionId() {
        return sessionId;
    }

    public String getHandle() {
        return handle;
    }

}
