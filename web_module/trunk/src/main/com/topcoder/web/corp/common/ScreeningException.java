package com.topcoder.web.corp.common;

import com.topcoder.web.common.TCWebException;

/**
 * Base exception for Screening Tool
 * 
 * @author Grimicus
 * @version 1.0
 */
public class ScreeningException extends TCWebException
{
    /**
     * Default Constructor
     */
    public ScreeningException()
    {
        super();
    }
    
    /**
     * <p>
     * Constructor taking a string message
     * </p>
     *
     * @param message - the message of the exception
     */
    public ScreeningException(String message)
    {
        super(message);
    }

    /**
     * <p>
     * Constructor taking a nested exception
     * </p>
     *
     * @param nestedException the nested exception
     */
    public ScreeningException(Throwable nestedException)
    {
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
    public ScreeningException(String message, Throwable nestedException)
    {
        super(message, nestedException);
    }
}
