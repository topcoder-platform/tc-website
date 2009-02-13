package com.topcoder.web.oracle.scoring;

import com.topcoder.web.common.TCWebException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 27, 2007
 */
public class GeneralScoringException extends TCWebException {

    /**
     * Default Constructor
     */
    public GeneralScoringException() {
        super();
    }

    /**
     * <p/>
     * Constructor taking a string message
     * </p>
     *
     * @param message - the message of the exception
     */
    public GeneralScoringException(String message) {
        super(message);
    }

    /**
     * <p/>
     * Constructor taking a nested exception
     * </p>
     *
     * @param nestedException the nested exception
     */
    public GeneralScoringException(Throwable nestedException) {
        super(nestedException);
    }

    /**
     * <p/>
     * Constructor taking a nested exception and a string
     * </p>
     *
     * @param message         the message of this exception
     * @param nestedException the nested exception
     */
    public GeneralScoringException(String message, Throwable nestedException) {
        super(message, nestedException);
    }
    
}
