package com.topcoder.web.screening.security;

import com.topcoder.web.screening.common.ScreeningException;

public class PrincipalMgrException extends ScreeningException {
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
