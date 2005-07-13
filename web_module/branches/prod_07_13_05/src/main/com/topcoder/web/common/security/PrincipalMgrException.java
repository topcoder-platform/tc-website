package com.topcoder.web.common.security;

import com.topcoder.web.common.TCWebException;

public class PrincipalMgrException extends TCWebException {
    public PrincipalMgrException() {
    }

    public PrincipalMgrException(String message) {
        super(message);
    }

    public PrincipalMgrException(Throwable t) {
        super(t);
    }

    public PrincipalMgrException(String message, Throwable t) {
        super(message, t);
    }
}
