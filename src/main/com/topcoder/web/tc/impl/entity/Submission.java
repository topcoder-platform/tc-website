/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;

/**
 * <p>
 * This class is simply the Java mapped class for table 'submission', so that this table can be used in HQL.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class Submission implements Serializable {
    /**
     * <p>
     * The submission id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setSubmissionId(), getSubmissionId().
     * </p>
     */
    private long submissionId;

    /**
     * <p>
     * The upload id. It has both getter and setter. It can be any value. It does not need to be initialized
     * when the instance is created. It is used in setUploadId(), getUploadId().
     * </p>
     */
    private long uploadId;

    /**
     * <p>
     * The submission type id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setSubmissionTypeId(), getSubmissionTypeId().
     * </p>
     */
    private long submissionTypeId;

    /**
     * <p>
     * The submission status id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setSubmissionStatusId(),
     * getSubmissionStatusId().
     * </p>
     */
    private long submissionStatusId;

    /**
     * <p>
     * The screening score. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in getScreeningScore(), setScreeningScore().
     * </p>
     */
    private double screeningScore;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public Submission() {
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
     * Getter method for screeningScore, simply return the value of the namesake field.
     * </p>
     *
     * @return the screeningScore
     */
    public double getScreeningScore() {
        return screeningScore;
    }

    /**
     * <p>
     * Setter method for the screeningScore, simply set the value to the namesake field.
     * </p>
     *
     * @param screeningScore
     *            the screeningScore to set
     */
    public void setScreeningScore(double screeningScore) {
        this.screeningScore = screeningScore;
    }

    /**
     * <p>
     * Getter method for uploadId, simply return the value of the namesake field.
     * </p>
     *
     * @return the uploadId
     */
    public long getUploadId() {
        return uploadId;
    }

    /**
     * <p>
     * Setter method for the uploadId, simply set the value to the namesake field.
     * </p>
     *
     * @param uploadId
     *            the uploadId to set
     */
    public void setUploadId(long uploadId) {
        this.uploadId = uploadId;
    }

    /**
     * <p>
     * Getter method for submissionTypeId, simply return the value of the namesake field.
     * </p>
     *
     * @return the submissionTypeId
     */
    public long getSubmissionTypeId() {
        return submissionTypeId;
    }

    /**
     * <p>
     * Setter method for the submissionTypeId, simply set the value to the namesake field.
     * </p>
     *
     * @param submissionTypeId
     *            the submissionTypeId to set
     */
    public void setSubmissionTypeId(long submissionTypeId) {
        this.submissionTypeId = submissionTypeId;
    }

    /**
     * <p>
     * Getter method for submissionStatusId, simply return the value of the namesake field.
     * </p>
     *
     * @return the submissionStatusId
     */
    public long getSubmissionStatusId() {
        return submissionStatusId;
    }

    /**
     * <p>
     * Setter method for the submissionStatusId, simply set the value to the namesake field.
     * </p>
     *
     * @param submissionStatusId
     *            the submissionStatusId to set
     */
    public void setSubmissionStatusId(long submissionStatusId) {
        this.submissionStatusId = submissionStatusId;
    }

}
