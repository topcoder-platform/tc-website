package com.topcoder.web.common;

import javax.servlet.http.HttpServletRequest;

public class TCRequestFactory {
    public static TCRequest createRequest(HttpServletRequest r) {
        //we only have one implementation right now, just just return it
        return new SimpleRequest(r);
    }
}
