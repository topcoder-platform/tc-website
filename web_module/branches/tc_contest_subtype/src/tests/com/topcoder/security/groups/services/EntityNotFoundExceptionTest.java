/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services;

import static org.junit.Assert.*;

import org.junit.Test;

import com.topcoder.util.errorhandling.ExceptionData;

/**
 * <p>
 * Unit test for {@link EntityNotFoundException} class.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Module Assembly - Topcoder Security Groups Backend Initial
 *          Assembly v1.0)
 * @since 1.0
 */
public class EntityNotFoundExceptionTest {

    /**
     * <p>
     * Represents a detail message.
     * </p>
     */
    private static final String DETAIL_MESSAGE = "detail";

    /**
     * <p>
     * Represents an error cause.
     * </p>
     */
    private static final Throwable CAUSE = new Exception("UnitTests");

    /**
     * <p>
     * Represents the exception data.
     * </p>
     */
    private static final ExceptionData EXCEPTION_DATA = new ExceptionData();

    /**
     * <p>
     * Represents the application code set in exception data.
     * </p>
     */
    private static final String APPLICATION_CODE = "Accuracy";

    /**
     * <p>
     * Initializes the exception data.
     * </p>
     */
    static {
        EXCEPTION_DATA.setApplicationCode(APPLICATION_CODE);
    }

    /**
     * <p>
     * Tests accuracy of <code>EntityNotFoundException(String)</code>
     * constructor.<br>
     * The detail error message should be properly set.
     * </p>
     */
    @Test
    public void testEntityNotFoundExceptionString() {
        EntityNotFoundException exception = new EntityNotFoundException(
                DETAIL_MESSAGE);

        // Verify that there is a detail message
        assertNotNull("Should have message.", exception.getMessage());
        assertEquals("Detailed error message should be identical.",
                DETAIL_MESSAGE, exception.getMessage());
    }

    /**
     * <p>
     * Tests accuracy of <code>EntityNotFoundException(String, Throwable)</code>
     * constructor.<br>
     * The detail error message and the original cause of error should be
     * properly set.
     * </p>
     */
    @Test
    public void testEntityNotFoundExceptionStringThrowable() {
        EntityNotFoundException exception = new EntityNotFoundException(
                DETAIL_MESSAGE, CAUSE);

        // Verify that there is a detail message
        assertNotNull("Should have message.", exception.getMessage());
        assertEquals(
                "Detailed error message with cause should be properly set.",
                DETAIL_MESSAGE, exception.getMessage());

        // Verify that there is a cause
        assertNotNull("Should have cause.", exception.getCause());
        assertSame("Cause should be identical.", CAUSE, exception.getCause());
    }

    /**
     * <p>
     * Tests accuracy of
     * <code>EntityNotFoundException(String, ExceptionData)</code> constructor.<br>
     * The detail error message and the exception data should be properly set.
     * </p>
     */
    @Test
    public void testEntityNotFoundExceptionStringExceptionData() {
        EntityNotFoundException exception = new EntityNotFoundException(
                DETAIL_MESSAGE, EXCEPTION_DATA);

        // Verify that there is a detail message
        assertNotNull("Should have message.", exception.getMessage());
        assertEquals(
                "Detailed error message with cause should be properly set.",
                DETAIL_MESSAGE, exception.getMessage());

        // Verify that the exception data is correctly set.
        assertNotNull("Application code should not null.",
                exception.getApplicationCode());
        assertEquals("Exception data is not set.", APPLICATION_CODE,
                exception.getApplicationCode());
    }

    /**
     * <p>
     * Tests accuracy of
     * <code>EntityNotFoundException(String, Throwable, ExceptionData)</code>
     * constructor.<br>
     * The detail error message, the cause exception and the exception data
     * should be properly set.
     * </p>
     */
    @Test
    public void testEntityNotFoundExceptionStringThrowableExceptionData() {

        EntityNotFoundException exception = new EntityNotFoundException(
                DETAIL_MESSAGE, CAUSE, EXCEPTION_DATA);

        // Verify that there is a detail message
        assertNotNull("Should have message.", exception.getMessage());
        assertEquals(
                "Detailed error message with cause should be properly set.",
                DETAIL_MESSAGE, exception.getMessage());

        // Verify that the exception data is correctly set.
        assertNotNull("Application code should not null.",
                exception.getApplicationCode());
        assertEquals("Exception data is not set.", APPLICATION_CODE,
                exception.getApplicationCode());

        // Verify that there is a cause
        assertNotNull("Should have cause.", exception.getCause());
        assertSame("Cause should be identical.", CAUSE, exception.getCause());
    }

}
