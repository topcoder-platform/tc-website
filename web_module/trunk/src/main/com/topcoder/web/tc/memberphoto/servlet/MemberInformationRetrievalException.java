/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.memberphoto.servlet;

import com.topcoder.util.errorhandling.BaseCriticalException;
import com.topcoder.util.errorhandling.ExceptionData;

/**
 * <p>
 * This exception is thrown from <code>MemberInformationRetriever</code>
 * interface and its implementation if they fail to retrieve the member
 * information.
 * </p>
 * <p>
 * <strong>Thread safety:</strong> This class is not thread safe since the
 * parent class is not thread safe.
 * </p>
 * @author AleaActaEst, microsky
 * @version 1.0
 */
@SuppressWarnings("serial")
public class MemberInformationRetrievalException extends BaseCriticalException {
    /**
     * <p>
     * Creates a new instance of this exception with the given message.
     * </p>
     * @param message the detailed error message of this exception
     */
    public MemberInformationRetrievalException(String message) {
        super(message);
    }

    /**
     * <p>
     * Creates a new instance of this exception with the given message and
     * cause.
     * </p>
     * @param message the detailed error message of this exception
     * @param cause the inner cause of this exception
     */
    public MemberInformationRetrievalException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * <p>
     * Creates a new instance of this exception with the given message and data.
     * </p>
     * @param message the detailed error message of this exception
     * @param data the data for this exception, if this is null, a new
     *            ExceptionData will be automatically used instead
     */
    public MemberInformationRetrievalException(String message,
            ExceptionData data) {
        super(message, data);
    }

    /**
     * <p>
     * Creates a new instance of this exception with the given message, cause
     * and data.
     * </p>
     * @param message the detailed error message of this exception
     * @param cause the inner cause of this exception
     * @param data the data for this exception, if this is null, a new
     *            ExceptionData will be automatically used instead
     */
    public MemberInformationRetrievalException(String message, Throwable cause,
            ExceptionData data) {
        super(message, cause, data);
    }
}
