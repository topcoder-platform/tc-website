package com.topcoder.web.common.error;

import com.topcoder.web.common.TCWebException;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 2, 2006
 */
public class HibernateInitializationException extends TCWebException {

    /**
     * Default Constructor
     */
    public HibernateInitializationException() {
        super();
    }

    /**
     * <p>
     * Constructor taking a string message
     * </p>
     *
     * @param message - the message of the exception
     */
    public HibernateInitializationException(String message) {
        super(message);
    }

    /**
     * <p>
     * Constructor taking a nested exception
     * </p>
     *
     * @param nestedException the nested exception
     */
    public HibernateInitializationException(Throwable nestedException) {
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
    public HibernateInitializationException(String message, Throwable nestedException) {
        super(message, nestedException);
    }


}
