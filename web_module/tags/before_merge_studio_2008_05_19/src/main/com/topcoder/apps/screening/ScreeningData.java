/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

/**
 * <strong>Purpose</strong>:
 * The interface that defines the contract to be met by classes used to log auto-screening information. Each step
 * of the auto-screening process ends in success or failure. The corresponding response code and dynamic text will
 * be set using a class implementing this interface.
 *
 * @author TheCois
 * @author WishingBone
 * @version 1.0
 */
public interface ScreeningData {

    /**
     * <strong>Purpose</strong>:
     * Sets the message that will be logged when the object is passed to the ScreeningLogger.
     *
     * <strong>Valid Args</strong>:
     * A non-null String.
     *
     * @param text The dynamic response text.
     */
    void setResponseText(String text);

    /**
     * <strong>Purpose</strong>:
     * Obtains the message that will be logged when this object is passed to the ScreeningLogger.
     *
     * <strong>Valid Return Values</strong>:
     * A string.
     *
     * @return The dynamic response text.
     */
    String getResponseText();

    /**
     * <strong>Purpose</strong>:
     * Sets the database identifier for the response code that will be logged when the object is passed to
     * the ScreeningLogger.
     *
     * <strong>Valid Args</strong>:
     * An integer.
     *
     * @param id the response code database identifier.
     */
    void setResponseId(long id);

    /**
     * <strong>Purpose</strong>:
     * Obtains the database identifier of the response code that will be logged when this object is passed to
     * the ScreeningLogger.
     *
     * <strong>Valid Return Values</strong>:
     * An integer.
     *
     * @return A response code database identifier.
     */
    long getResponseId();

}
