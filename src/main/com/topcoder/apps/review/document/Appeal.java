/*
 * Appeal.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.persistence.Common;
import com.topcoder.apps.review.projecttracker.User;

import java.io.Serializable;


/**
 * Corresponds to one appeal.
 *
 * @author FatClimber
 * @version 1.0
 */
public class Appeal implements Serializable {
    private long id;
    private String appealText;
    private String appealResponse;
    private boolean isResolved;
    private ScorecardQuestion question;
    private User appealer;
    private User submitter;
    private User reviewer;
    private long submissionId;
    private long appealerSubmissionId;
    private boolean dirtyFlag = false;
    private long versionId;

    /**
     * Constructor
     *
     * @param id DOCUMENT ME!
     * @param finalFixStatus DOCUMENT ME!
     * @param aggregationResponse DOCUMENT ME!
     */
    public Appeal(long id, String appealText, String appealResponse,
                  boolean isResolved, ScorecardQuestion question,
                  User appealer, User submitter, User reviewer,
                  long submissionId, long appealerSubmissionId,
                  long versionId) {
        this.id = id;
        this.appealText = appealText;
        this.appealResponse = appealResponse;
        this.isResolved = isResolved;
        this.question = question;
        this.appealer = appealer;
        this.submitter = submitter;
        this.reviewer = reviewer;
        this.submissionId = submissionId;
        this.appealerSubmissionId = appealerSubmissionId;
        this.versionId = versionId;
        if (id == -1) {
            this.dirtyFlag = true;
        }
    }

    public Appeal() {
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
     * Return the id of the fixitem.
     * </p>
     *
     * @return the id of the fixitem.
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
     * @return Returns the appealer.
     */
    public User getAppealer() {
        return appealer;
    }

    /**
     * @param appealer The appealer to set.
     */
    public void setAppealer(User appealer) {
        this.appealer = appealer;
        this.dirtyFlag = true;
    }

    /**
     * @return Returns the appealResponse.
     */
    public String getAppealResponse() {
        return appealResponse;
    }

    /**
     * @param appealResponse The appealResponse to set.
     */
    public void setAppealResponse(String appealResponse) {
        if (!Common.equals(this.appealResponse, appealResponse)) {
            this.appealResponse = appealResponse;
            this.dirtyFlag = true;
        }
    }

    /**
     * @return Returns the appealText.
     */
    public String getAppealText() {
        return appealText;
    }

    /**
     * @param appealText The appealText to set.
     */
    public void setAppealText(String appealText) {
        if (!Common.equals(this.appealText, appealText)) {
            this.appealText = appealText;
            this.dirtyFlag = true;
        }
    }

    /**
     * @return Returns the isResolved.
     */
    public boolean isResolved() {
        return isResolved;
    }

    /**
     * @param isResolved The isResolved to set.
     */
    public void setResolved(boolean isResolved) {
        if (!(this.isResolved == isResolved)) {
            this.isResolved = isResolved;
            this.dirtyFlag = true;
        }
    }

    /**
     * @return Returns the question.
     */
    public ScorecardQuestion getQuestion() {
        return question;
    }

    /**
     * @param question The question to set.
     */
    public void setQuestion(ScorecardQuestion question) {
        this.question = question;
    }

    /**
     * @return Returns the reviewer.
     */
    public User getReviewer() {
        return reviewer;
    }

    /**
     * @param reviewer The reviewer to set.
     */
    public void setReviewer(User reviewer) {
        this.reviewer = reviewer;
    }

    /**
     * @return Returns the submitter.
     */
    public User getSubmitter() {
        return submitter;
    }

    /**
     * @param submitter The submitter to set.
     */
    public void setSubmitter(User submitter) {
        this.submitter = submitter;
    }

    /**
     * @return Returns the submissionId.
     */
    public long getSubmissionId() {
        return submissionId;
    }

    /**
     * @param submissionId The submissionId to set.
     */
    public void setSubmissionId(long submissionId) {
        this.submissionId = submissionId;
    }

    /**
     * @return Returns the appealerSubmissionId.
     */
    public long getAppealerSubmissionId() {
        return appealerSubmissionId;
    }

    /**
     * @param appealerSubmissionId The appealerSubmissionId to set.
     */
    public void setAppealerSubmissionId(long appealerSubmissionId) {
        this.appealerSubmissionId = appealerSubmissionId;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof Appeal)) {
            return false;
        }

        Appeal appeal = (Appeal) o;

        return appeal.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }

}
