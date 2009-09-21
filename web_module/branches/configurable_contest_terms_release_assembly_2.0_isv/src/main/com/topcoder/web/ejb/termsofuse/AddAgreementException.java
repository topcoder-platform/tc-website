/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.termsofuse;

/**
 * <p>A custom exception to be thrown in case recording the user agreement to terms of use has failed for some reason.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Configurable Contest Terms Release Assembly v2.0
 */
public class AddAgreementException extends RuntimeException {

    /**
     * <p>An enumeration over possible causes of the error.</p>
     */
    public static enum Reason {
        /**
         * <p>Indicates that requested terms of use could not be found.</p>
         */
        INVALID_TERMS,

        /**
         * <p>Indicates that requested user could not be found.</p>
         */
        INVALID_USER,

        /**
         * <p>Indicates that requested user already agreed to specified terms..</p>
         */
        DUPLICATE_AGREEMENT
    }

    /**
     * <p>A <code>Reason</code> referencing the cause of this error.</p>
     */
    private Reason reason = null;

    /**
     * <p>Constructs new <code>AddAgreementException</code> instance with specified reason.</p>
     *
     * @param reason a <code>Reason</code> referencing the cause of this exception.
     */
    public AddAgreementException(Reason reason) {
        this.reason = reason;
    }

    /**
     * <p>Gets the reason for this exception.</p>
     *
     * @return a <code>Reason</code> referencing the cause of this exception.
     */
    public Reason getReason() {
        return this.reason;
    }
}
