package com.topcoder.web.common;

import javax.ejb.EJBException;

public class RowNotFoundException extends EJBException {
    public RowNotFoundException() {
        super();
    }

    public RowNotFoundException(String message) {
        super(message);
    }
}
