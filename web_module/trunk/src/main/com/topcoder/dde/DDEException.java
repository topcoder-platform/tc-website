/*
 * DDEException.java
 * 19 July 2002
 * 0.001
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde;

import com.topcoder.util.TCException;

/**
 * <code>DDEException</code> is the superclass of checked exceptions that are
 * specific to the Distributed Development Environment.
 *
 * @version 0.001, 19 July 2002
 * @author  Albert Mao
 */
public class DDEException extends TCException {


    /**
     * Constructs a new <code>DDEException</code> with
     * <code>null</code> as its detail message.
     */
    public DDEException() {
        super();
    }

    /**
     * Constructs a new <code>DDEException</code> with the
     * specified detail message.
     *
     * @param message the detail message
     */
    public DDEException(String message) {
        super(message);
    }


}
