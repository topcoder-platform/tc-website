package com.topcoder.web.screening.common;

/**
 *
 * @author Porgery
 * @author Grimicus
 */
public class PermissionDeniedException extends ScreeningException {
    
    /**
     * Default Constructor
     */
    public PermissionDeniedException()
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
    public PermissionDeniedException(String message)
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
    public PermissionDeniedException(Throwable nestedException)
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
    public PermissionDeniedException(String message, Throwable nestedException)
    {
        super(message, nestedException);
    }
    
}
