/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

import com.topcoder.util.errorhandling.BaseRuntimeException;

/**
 * <strong>Purpose</strong>:
 * This is an exception class inherited from BaseRuntimeException. It is thrown in response to one of the
 * QueryInterface methods being called and not being able to perform its function due to a problem occuring
 * at the database level. It implements the exception chaining paradigm.
 *
 * @author TheCois
 * @author WishingBone
 * @version 1.0
 */
public class DatabaseException extends BaseRuntimeException {

    /**
     * <strong>Purpose</strong>:
     * Instanciates this class with an explanatory message for the exception.
     *
     * <strong>Valid Args</strong>:
     * A non-null String.
     *
     * @param msg An explanatory message for the exception.
     */
    public DatabaseException(String msg) {
        super(msg);
    }

    /**
     * <strong>Purpose</strong>:
     * Instanciates this class with an explanatory message for the exception and the exception that triggered
     * an exception of this class' type to be thrown.
     *
     * <strong>Valid Args</strong>:
     * A non-null String and a Throwable object.
     *
     * @param msg An explanatory message for the exception.
     * @param inner The exception that was originally thrown.
     */
    public DatabaseException(String msg, Throwable inner) {
        super(msg, inner);
    }

}
