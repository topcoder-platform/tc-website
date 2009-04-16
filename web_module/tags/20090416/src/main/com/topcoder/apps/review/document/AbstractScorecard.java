/*
 * AbstractScorecard.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.User;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * Class common to both screening and review scorecards
 * within this application.
 *
 * @author FatClimber
 * @version 1.0
 */
public abstract class AbstractScorecard implements Serializable {
    /** Doc */
    protected long id;

    /** Doc */
    protected boolean isCompleted;

    /** Doc */
    protected boolean isPMReviewed;

    /** Doc */
    protected ScorecardQuestion[] scorecardQuestion;

    /** Doc */
    protected User author;

    /** Doc */
    protected Project project;

    /** Doc */
    protected InitialSubmission submission;

    /** Doc */
    protected double score;

    protected double raw_score;

    protected Timestamp pm_review_timestamp;

    /** Dirtyflag */
    protected boolean dirtyFlag = false;
    private long requestorId;
    private long versionId;

    /**
     *
     */
    public AbstractScorecard(long id, boolean isCompleted, boolean isPMReviewed,
                             ScorecardQuestion[] scorecardQuestion, User author, Project project,
                             InitialSubmission submission, double score, long requestorId, long versionId, double raw_score, Timestamp pm_review_timestamp) {
        this.id = id;
        this.isCompleted = isCompleted;
        this.isPMReviewed = isPMReviewed;
        this.scorecardQuestion = scorecardQuestion;
        this.author = author;
        this.project = project;
        this.submission = submission;
        this.score = score;
        this.requestorId = requestorId;
        this.versionId = versionId;
        this.raw_score = raw_score;
        this.pm_review_timestamp = pm_review_timestamp;
        if (id == -1) {
            dirtyFlag = true;
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected long getRequestorId() {
        return requestorId;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected boolean getDirty() {
        return dirtyFlag;
    }

    /**
     * @param id
     */
    protected void setDirty(boolean dirtyFlag) {
        this.dirtyFlag = dirtyFlag;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected long getVersionId() {
        return versionId;
    }

    /**
     * @param vid
     */
    protected void setVersionId(long vid) {
        this.versionId = vid;
    }

    /**
     * <p>
     * Return the id for this scorecard.
     * </p>
     *
     * @return id of this scorecard.
     */
    public long getId() {
        return id;
    }

    /**
     * @param id
     */
    protected void setId(long id) {
        this.id = id;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return whether this scorecard is completed.
     * </p>
     *
     * @return true if the scorecard is completed, otherwise false.
     */
    public boolean isCompleted() {
        return isCompleted;
    }

    /**
     * <p>
     * Set whether this scorecard is completed.
     * </p>
     *
     * @param isCompleted Whether this scorecard is completed.
     */
    public void setCompleted(boolean isCompleted) {
        this.isCompleted = isCompleted;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return whether the project manager has reviewed this scorecard.
     * </p>
     *
     * @return true if the project manager has reviewed this scorecard,
     * otherwise false.
     */
    public boolean isPMReviewed() {
        return isPMReviewed;
    }

    /**
     * <p>
     * Set whether the project manager has reviewed this scorecard.
     * </p>
     *
     * @param isPMReviewed Whether the project manager has reviewed
     * this scorecard.
     */
    public void setPMReviewed(boolean isPMReviewed) {
        this.isPMReviewed = isPMReviewed;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the questions in this scorecard.
     * </p>
     *
     * @return a ScorecardQuestion[] with the questions in this scorecard.
     */
    public ScorecardQuestion[] getQuestions() {
        return scorecardQuestion;
    }

    /**
     * <p>
     * Return the author of this scorecard.
     * </p>
     *
     * @return a User with the author of this scorecard.
     */
    public User getAuthor() {
        return author;
    }

    /**
     * <p>
     * Return the project related to this scorecard.
     * </p>
     *
     * @return a Project with the project related to this scorecard.
     */
    public Project getProject() {
        return project;
    }

    /**
     * <p>
     * Return the submission related to this scorecard.
     * </p>
     *
     * @return a InitialSubmission with the submission related to this
     * scorecard.
     */
    public InitialSubmission getSubmission() {
        return submission;
    }

    /**
     * <p>
     * Return the score of this scorecard.
     * </p>
     *
     * @return the score of this scorecard.
     */
    public double getScore() {
        return score;
    }

    /**
     * <p>
     * Set the score of this scorecard.
     * </p>
     *
     * @param score The score to be set.
     */
    public void setScore(double score) {
        this.score = score;
        this.dirtyFlag = true;
    }

    /**
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof AbstractScorecard)) {
            return false;
        }

        AbstractScorecard scorecard = (AbstractScorecard) o;

        return scorecard.getId() == this.id;
    }

    public Timestamp getPMReviewTimestamp() {
        return pm_review_timestamp;
    }

    public void setPMReviewTimestamp(Timestamp pm_review_timestamp) {
        this.pm_review_timestamp = pm_review_timestamp;
        this.dirtyFlag = true;
    }

    public double getRawScore() {
        return raw_score;
    }

    public void setRawScore(double raw_score) {
        this.raw_score = raw_score;
        this.dirtyFlag = true;
    }

    /**
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
