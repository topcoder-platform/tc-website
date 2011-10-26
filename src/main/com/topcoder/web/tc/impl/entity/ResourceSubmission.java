/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;

/**
 * <p>
 * This class is simply the Java mapped class for table resource_submission, so that this table can be used in
 * HQL.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class ResourceSubmission implements Serializable {
    /**
     * <p>
     * The submission id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setSubmissionId(), getSubmissionId().
     * </p>
     */
    private long submissionId;

    /**
     * <p>
     * The resource id. It has both getter and setter. It can be any value. It does not need to be initialized
     * when the instance is created. It is used in setResourceId(), getResourceId().
     * </p>
     */
    private long resourceId;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public ResourceSubmission() {
        // Empty
    }

    /**
     * <p>
     * Getter method for submissionId, simply return the value of the namesake field.
     * </p>
     *
     * @return the submissionId
     */
    public long getSubmissionId() {
        return submissionId;
    }

    /**
     * <p>
     * Setter method for the submissionId, simply set the value to the namesake field.
     * </p>
     *
     * @param submissionId
     *            the submissionId to set
     */
    public void setSubmissionId(long submissionId) {
        this.submissionId = submissionId;
    }

    /**
     * <p>
     * Getter method for resourceId, simply return the value of the namesake field.
     * </p>
     *
     * @return the resourceId
     */
    public long getResourceId() {
        return resourceId;
    }

    /**
     * <p>
     * Setter method for the resourceId, simply set the value to the namesake field.
     * </p>
     *
     * @param resourceId
     *            the resourceId to set
     */
    public void setResourceId(long resourceId) {
        this.resourceId = resourceId;
    }
}
