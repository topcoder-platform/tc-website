package com.topcoder.web.common;

import com.topcoder.shared.util.TCException;

/**
 * BaseProcessor exception for TCWeb Tool
 *
 * @author Grimicus
 * @version 1.0
 */
public class TCWebException extends TCException {

    /**
     * Default Constructor
     */
    public TCWebException() {
        super();
    }

    /**
     * <p>
     * Constructor taking a string message
     * </p>
     *
     * @param message - the message of the exception
     */
    public TCWebException(String message) {
        super(message);
    }

    /**
     * <p>
     * Constructor taking a nested exception
     * </p>
     *
     * @param nestedException the nested exception
     */
    public TCWebException(Throwable nestedException) {
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
    public TCWebException(String message, Throwable nestedException) {
        super(message, nestedException);
    }

}
