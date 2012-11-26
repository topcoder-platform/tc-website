/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

/**
 * <strong>Purpose</strong>:
 * Simple implementation of ScreeningData.
 *
 * @author WishingBone
 * @version 1.0
 */
public class SimpleScreeningData implements ScreeningData {

    /**
     * <strong>Purpose</strong>:
     * The dynamic text of a screening log.
     */
    private String text = "";

    /**
     * <strong>Purpose</strong>:
     * The response code of a screening log.
     */
    private long id;

    /**
     * <strong>Purpose</strong>:
     * Create a SimpleScreeningData.
     *
     * @param id the response code database identifier.
     */
    public SimpleScreeningData(long id) {
        this.setResponseId(id);
    }

    /**
     * <strong>Purpose</strong>:
     * Create a SimpleScreeningData.
     *
     * @param text The dynamic response text.
     * @param id the response code database identifier.
     */
    public SimpleScreeningData(String text, long id) {
        this.setResponseText(text);
        this.setResponseId(id);
    }

    /**
     * <strong>Purpose</strong>:
     * Sets the message that will be logged when the object is passed to the ScreeningLogger.
     *
     * <strong>Valid Args</strong>:
     * A non-null String.
     *
     * @param text The dynamic response text.
     */
    public void setResponseText(String text) {
        this.text = text;
    }

    /**
     * <strong>Purpose</strong>:
     * Obtains the message that will be logged when this object is passed to the ScreeningLogger.
     *
     * <strong>Valid Return Values</strong>:
     * A string.
     *
     * @return The dynamic response text.
     */
    public String getResponseText() {
        return this.text;
    }

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
    public void setResponseId(long id) {
        this.id = id;
    }

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
    public long getResponseId() {
        return this.id;
    }

}
