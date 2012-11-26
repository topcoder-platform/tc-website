/*
 * AbstractSubmission.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.User;

import java.io.Serializable;
import java.net.URL;


/**
 * This class provides the functionality common to both initial submission
 * and final submission within this application.
 *
 * @author FatClimber
 * @version 1.0
 */
public abstract class AbstractSubmission implements Serializable {
    private long id;
    private URL url;
    private String messagePMReview;
    private String messagePMScreening;
    private User submitter;
    private Project project;
    private boolean isRemoved;

    /** dirtyFlag */
    protected boolean dirtyFlag = false;
    private long requestorId;
    private long versionId;

    /**
     * Creates a new AbstractSubmission object.
     *
     * @param id DOCUMENT ME!
     * @param url DOCUMENT ME!
     * @param messagePMReview DOCUMENT ME!
     * @param messagePMScreening DOCUMENT ME!
     * @param submitter DOCUMENT ME!
     * @param project DOCUMENT ME!
     * @param requestorId DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public AbstractSubmission(long id, URL url, String messagePMReview, String messagePMScreening,
                              User submitter, Project project, boolean isRemoved, long requestorId, long versionId) {
        this.id = id;
        this.url = url;
        this.messagePMReview = messagePMReview;
        this.messagePMScreening = messagePMScreening;
        this.submitter = submitter;
        this.project = project;
        this.isRemoved = isRemoved;
        this.requestorId = requestorId;
        this.versionId = versionId;
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
     * Return the id for this submission.
     * </p>
     *
     * @return id of this submission.
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
     * Return the URL of this submission.
     * </p>
     *
     * @return a String with the URL of this submission.
     */
    public URL getURL() {
        return url;
    }

    /**
     * <p>
     * Set the URL of this submission.
     * </p>
     *
     * @param url The URL of this submission.
     */
    public void setURL(URL url) {
        this.url = url;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the review message of project manager.
     * </p>
     *
     * @return a String with the review message of project manager.
     */
    public String getPMReviewMessage() {
        return messagePMReview;
    }

    /**
     * <p>
     * Set the review message of project manager.
     * </p>
     *
     * @param message The review message of project manager.
     */
    public void setPMReviewMessage(String message) {
        if (!message.equals(this.messagePMReview)) {
            this.messagePMReview = message;
            this.dirtyFlag = true;
        }
    }

    /**
     * <p>
     * Return the screening message of project manager.
     * </p>
     *
     * @return a String with the screening message of project manager.
     */
    public String getPMScreeningMessage() {
        return messagePMScreening;
    }

    /**
     * <p>
     * Set the screening message of project manager.
     * </p>
     *
     * @param message The screening message of project manager.
     */
    public void setPMScreeningMessage(String message) {
        if (!message.equals(this.messagePMScreening)) {
            this.messagePMScreening = message;
            this.dirtyFlag = true;
        }
    }

    /**
     * <p>
     * Return the submitter.
     * </p>
     *
     * @return the submitter.
     */
    public User getSubmitter() {
        return submitter;
    }

    /**
     * <p>
     * Return whether this submission is removed.
     * </p>
     *
     * @return true if the submission is removed, otherwise false.
     */
    public boolean isRemoved() {
        return isRemoved;
    }

    /**
     * <p>
     * Set whether this submission is removed.
     * </p>
     *
     * @param isCompleted Whether this submission is removed.
     */
    public void setRemoved(boolean isRemoved) {
        this.isRemoved = isRemoved;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the project related to this submission.
     * </p>
     *
     * @return Project the related project.
     */
    public Project getProject() {
        return project;
    }

    /**
     * <p>
     * Check if the submission is submitted.
     * </p>
     *
     * @return true if submitted, false otherwise
     */
    public boolean isSubmitted() {
        if (this.id == -1) {
            return false;
        } else {
            return true;
        }
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof AbstractSubmission)) {
            return false;
        }

        AbstractSubmission submission = (AbstractSubmission) o;

        return submission.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
