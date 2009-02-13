/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

/**
 * <strong>Purpose</strong>:
 * This is an exception class inherited from IllegalArgumentException. It is thrown in response to a submission
 * identifier argument being passed to one of the QueryInterface methods with a wrong value.
 *
 * @author TheCois
 * @author WishingBone
 * @version 1.0
 */
public class InvalidSubmissionIdException extends IllegalArgumentException {

    /**
     * <strong>Purpose</strong>:
     * The value of the identifier passed to the method that threw this exception.
     *
     * <strong>Valid Args</strong>:
     * An integer value. This value is invalid with respect to the method that threw the exception.
     */
    private long id = -1;

    /**
     * <strong>Purpose</strong>:
     * Instanciates this class with an explanatory message for the exception.
     *
     * <strong>Valid Args</strong>:
     * A non-null String.
     *
     * @param msg An explanatory message for the exception.
     */
    public InvalidSubmissionIdException(String msg) {
        super(msg);
    }

    /**
     * <strong>Purpose</strong>:
     * Instanciates this class with an explanatory message for the exception and the value that triggered this
     * exception throw.
     *
     * <strong>Valid Args</strong>:
     * An integer value and a non-null String.
     *
     * @param id The value that caused this exception to be thrown.
     * @param msg An explanatory message for the exception.
     */
    public InvalidSubmissionIdException(long id, String msg) {
        super(msg);
        this.id = id;
    }

    /**
     * <strong>Purpose</strong>:
     * Getter for the id attribute.
     *
     * <strong>Valid Return Values</strong>:
     * An integer value.
     *
     * @return The value that caused this exception to be thrown.
     */
    public long getId() {
        return this.id;
    }

}

