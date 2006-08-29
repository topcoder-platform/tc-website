/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening.application;

/**
 * ApplicationSpecification Bean.
 *
 * @author pulky
 * @version 1.0.0
 */
public class ApplicationSpecification {

    public static final long UNDEFINED_ID = -1;

    public static final long APPLICATION_SPECIFICATION = 1;

    private long specificationId;

    private long specificationUploaderId;

    private long specificationTypeId;

    /**
     * @param specificationId
     * @param specificationUploaderId
     * @param specificationTypeId
     */
    public ApplicationSpecification(long specificationId, long specificationUploaderId, long specificationTypeId) {
        super();
        this.specificationId = specificationId;
        this.specificationUploaderId = specificationUploaderId;
        this.specificationTypeId = specificationTypeId;
    }

    /**
     * @return Returns the specificationId.
     */
    public long getSpecificationId() {
        return specificationId;
    }

    /**
     * @param specificationId The specificationId to set.
     */
    public void setSpecificationId(long specificationId) {
        this.specificationId = specificationId;
    }

    /**
     * @return Returns the specificationTypeId.
     */
    public long getSpecificationTypeId() {
        return specificationTypeId;
    }

    /**
     * @param specificationTypeId The specificationTypeId to set.
     */
    public void setSpecificationTypeId(long specificationTypeId) {
        this.specificationTypeId = specificationTypeId;
    }

    /**
     * @return Returns the specificationUploaderId.
     */
    public long getSpecificationUploaderId() {
        return specificationUploaderId;
    }

    /**
     * @param specificationUploaderId The specificationUploaderId to set.
     */
    public void setSpecificationUploaderId(long specificationUploaderId) {
        this.specificationUploaderId = specificationUploaderId;
    }
}

