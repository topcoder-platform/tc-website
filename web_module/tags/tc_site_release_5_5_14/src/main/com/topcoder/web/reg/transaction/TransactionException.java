package com.topcoder.web.reg.transaction;

import com.topcoder.web.common.TCWebException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public class TransactionException extends TCWebException {

    /**
     * Default Constructor
     */
    public TransactionException() {
        super();
    }

    /**
     * <p>
     * Constructor taking a string message
     * </p>
     *
     * @param message - the message of the exception
     */
    public TransactionException(String message) {
        super(message);
    }

    /**
     * <p>
     * Constructor taking a nested exception
     * </p>
     *
     * @param nestedException the nested exception
     */
    public TransactionException(Throwable nestedException) {
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
    public TransactionException(String message, Throwable nestedException) {
        super(message, nestedException);
    }


}
