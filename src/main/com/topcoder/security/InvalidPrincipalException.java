package com.topcoder.security;

/**
 * Thrown when a principal is not defined in the database.
 *
 * @author Heather Van Aelst
 * @version 0.1
 */

//currently not used

public class InvalidPrincipalException extends GeneralSecurityException {

    /**
     * Class constructor
     */
    public InvalidPrincipalException() {
        super();
    }

    /**
     * Class constructor
     *
     * @param message Constructs theInvalidPrincipalException with the
     *                specified message that describes the exception
     */
    public InvalidPrincipalException(String message) {
        super(message);
    }
}
