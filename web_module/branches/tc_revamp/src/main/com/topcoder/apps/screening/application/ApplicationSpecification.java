/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening.application;

import java.net.URL;
import java.sql.Timestamp;

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

    private URL specificationUrl;

    private boolean screened;

    private int passedAutoScreening;

    private long specificationUploaderId;

    private long specificationTypeId;

    private String remoteFilename;

    private Timestamp uploadDate;

    /**
     * @param specificationId
     * @param specificationUploaderId
     * @param specificationTypeId
     * @param screened
     * @param passedAutoScreening
     * @param specificationUrl
     * @param remoteFilename
     * @param uploadDate
     */
    public ApplicationSpecification(long specificationId, long specificationUploaderId,
            long specificationTypeId, boolean screened, int passedAutoScreening, URL specificationUrl,
            String remoteFilename, Timestamp uploadDate) {
        super();
        this.specificationId = specificationId;
        this.specificationUploaderId = specificationUploaderId;
        this.specificationTypeId = specificationTypeId;
        this.screened = screened;
        this.passedAutoScreening = passedAutoScreening;
        this.specificationUrl = specificationUrl;
        this.remoteFilename = remoteFilename;
        this.uploadDate = uploadDate;
    }

    /**
     * @return Returns the remoteFilename.
     */
    public String getRemoteFilename() {
        return remoteFilename;
    }

    /**
     * @param remoteFilename The remoteFilename to set.
     */
    public void setRemoteFilename(String remoteFilename) {
        this.remoteFilename = remoteFilename;
    }

    /**
     * @return Returns the uploadDate.
     */
    public Timestamp getUploadDate() {
        return uploadDate;
    }

    /**
     * @param uploadDate The uploadDate to set.
     */
    public void setUploadDate(Timestamp uploadDate) {
        this.uploadDate = uploadDate;
    }

    /**
     * @return Returns the screened.
     */
    public boolean getScreened() {
        return screened;
    }

    /**
     * @param screened The screened to set.
     */
    public void setScreened(boolean screened) {
        this.screened = screened;
    }

    /**
     * @return Returns the specificationUrl.
     */
    public URL getSpecificationUrl() {
        return specificationUrl;
    }

    /**
     * @param specificationUrl The specificationUrl to set.
     */
    public void setSpecificationUrl(URL specificationUrl) {
        this.specificationUrl = specificationUrl;
    }

    /**
     * @return Returns the specificationId.
     */
    public int getPassedAutoScreening() {
        return passedAutoScreening;
    }

    /**
     * @param specificationId The specificationId to set.
     */
    public void setPassedAutoScreening(int passedAutoScreening) {
        this.passedAutoScreening = passedAutoScreening;
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

