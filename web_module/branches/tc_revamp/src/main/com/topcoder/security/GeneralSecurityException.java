package com.topcoder.security;

import com.topcoder.util.errorhandling.BaseException;

/**
 * A general exception for the security manager. All security related
 * exceptions should subclass from this exception.
 *
 * @author Heather Van Aelst
 * @version 0.1
 */
public class GeneralSecurityException extends BaseException {


    /**
     * The nested exception.  The exception that this class is wrapped around.
     */
    private Throwable nestedException;

    /**
     * Default Constructor
     */
    public GeneralSecurityException() {
        super();
    }

    /**
     * <p>
     * Constructor taking a string message
     * </p>
     *
     * @param message - the message of the exception
     */
    public GeneralSecurityException(String message) {
        super(message);
    }

    /**
     * <p>
     * Constructor taking a nested exception
     * </p>
     *
     * @param nestedException the nested exception
     */
    public GeneralSecurityException(Throwable nestedException) {
        super(nestedException);
    }

    /**
     * <p>
     * Constructor taking a nested exception and a string
     * </p>
     *
     * @param message the message of this exception
     * @param nestedException the nested exception
     */
    public GeneralSecurityException(String message, Throwable nestedException) {
        super(message, nestedException);
    }


}
