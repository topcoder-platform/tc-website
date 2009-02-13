package com.topcoder.web.common;

public class RowNotFoundException extends Exception {
    public RowNotFoundException() {
        super();
    }

    public RowNotFoundException(String message) {
        super(message);
    }
}
