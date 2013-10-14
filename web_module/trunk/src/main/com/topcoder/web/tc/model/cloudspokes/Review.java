/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.model.cloudspokes;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * The entity model to represent a CloudSpokes Challenge Review. It has annotations to use by the jackson
 * to deserialize json string to the instance of this class.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0 (Release Assembly - TopCoder and CloudSpokes Platform Integration Phase 1)
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Review implements Serializable {

    /**
     * The name of the challenge.
     */
    @JsonProperty("name")
    private String name;

    /**
     * The id of the challenge.
     */
    @JsonProperty("challenge_id")
    private long challengeId;

    /**
     * The review data.
     */
    @JsonProperty("review_date")
    private Date reviewDate;

    /**
     * The review position number.
     */
    @JsonProperty("number_of_reviewers")
    private int reviewNumber;

    /**
     * The submission number.
     */
    @JsonProperty("submissions")
    private int submissionNumber;

    /**
     * Gets the name.
     *
     * @return the name.
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name.
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the review date.
     *
     * @return the review date.
     */
    public Date getReviewDate() {
        return reviewDate;
    }

    /**
     * Sets the review date.
     *
     * @param reviewDate the review date.
     */
    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }

    /**
     * Gets the review number.
     *
     * @return the review number.
     */
    public int getReviewNumber() {
        return reviewNumber;
    }

    /**
     * Sets the review number.
     *
     * @param reviewNumber the review number.
     */
    public void setReviewNumber(int reviewNumber) {
        this.reviewNumber = reviewNumber;
    }

    /**
     * Gets the challenge id.
     *
     * @return the challenge id.
     */
    public long getChallengeId() {
        return challengeId;
    }

    /**
     * Sets the challenge id.
     *
     * @param challengeId the challenge id.
     */
    public void setChallengeId(long challengeId) {
        this.challengeId = challengeId;
    }

    /**
     * Gets the submission number.
     *
     * @return the submission number.
     */
    public int getSubmissionNumber() {
        return submissionNumber;
    }

    /**
     * Sets the submission number.
     *
     * @param submissionNumber the submission number.
     */
    public void setSubmissionNumber(int submissionNumber) {
        this.submissionNumber = submissionNumber;
    }
}
