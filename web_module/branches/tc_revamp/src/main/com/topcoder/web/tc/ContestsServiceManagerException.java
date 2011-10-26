/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc;

import com.topcoder.util.errorhandling.BaseException;
import com.topcoder.util.errorhandling.ExceptionData;

/**
 * <p>
 * This exception is thrown to indicate that error occurs while performing service.
 * </p>
 * <p>
 * The class is not thread safe because its super-class is not thread safe.
 * </p>
 * @author flytoj2ee, duxiaoyang
 * @version 1.0
 */
public class ContestsServiceManagerException extends BaseException {

    /**
     * Represents the serial version id of this class.
     */
    private static final long serialVersionUID = -8970699116872440589L;

    /**
     * <p>
     * Creates an instance of this exception with given error message.
     * </p>
     * @param message
     *            the error message.
     */
    public ContestsServiceManagerException(String message) {
        super(message);
    }

    /**
     * <p>
     * Creates an instance of this exception with given error message and root cause.
     * </p>
     * @param message
     *            the error message.
     * @param cause
     *            the cause of this exception.
     */
    public ContestsServiceManagerException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * <p>
     * Creates an instance of this exception with given error message and exception data.
     * </p>
     * @param message
     *            the error message.
     * @param exceptionData
     *            the exception data.
     */
    public ContestsServiceManagerException(String message, ExceptionData exceptionData) {
        super(message, exceptionData);
    }

    /**
     * <p>
     * Creates an instance of this exception with given error message, root cause, and exception data.
     * </p>
     * @param message
     *            the error message.
     * @param cause
     *            the cause of this exception.
     * @param exceptionData
     *            the exception data.
     */
    public ContestsServiceManagerException(String message, Throwable cause, ExceptionData exceptionData) {
        super(message, cause, exceptionData);
    }
}
