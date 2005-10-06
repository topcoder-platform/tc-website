/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

/**
 * <strong>Purpose</strong>:
 * This is an exception class inherited from IllegalArgumentException. It is thrown in response to a project name
 * argument being passed to one of the QueryInterface methods with a wrong value.
 *
 * @author TheCois
 * @author WishingBone
 * @version 1.0
 */
public class InvalidProjectNameException extends IllegalArgumentException {

    /**
     * <strong>Purpose</strong>:
     * The value of the project name passed to the method that threw this exception.
     *
     * <strong>Valid Args</strong>:
     * A String value. This value is an invalid project name.
     */
    private String name = "";

    /**
     * <strong>Purpose</strong>:
     * Instanciates this class with an explanatory message for the exception.
     *
     * <strong>Valid Args</strong>:
     * A non-null String.
     *
     * @param msg An explanatory message for the exception.
     */
    public InvalidProjectNameException(String msg) {
        super(msg);
    }

    /**
     * <strong>Purpose</strong>:
     * Instanciates this class with an explanatory message for the exception and the value that triggered this
     * exception throw.
     *
     * <strong>Valid Args</strong>:
     * A String value for the project name and a non-null String for the message.
     *
     * @param name The value that caused this exception to be thrown.
     * @param msg An explanatory message for the exception.
     */
    public InvalidProjectNameException(String name, String msg) {
        super(msg);
        this.name = name;
    }

    /**
     * <strong>Purpose</strong>:
     * Getter for the name attribute.
     *
     * <strong>Valid Return Values</strong>:
     * A String value.
     *
     * @return The value that caused this exception to be thrown
     */
    public String getName() {
        return this.name;
    }

}
