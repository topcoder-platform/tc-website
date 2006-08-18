/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

/**
 * <strong>Purpose</strong>:
 * This is much of a data class that will be used for selection in case multiple tasks exist.
 *
 * @author WishingBone
 * @version 1.0
 */
public abstract class ScreeningRequest implements IScreeningRequest {

    /**
     * The task id.
     */
    private long taskId = -1;

    /**
     * The submitter id.
     */
    private long submitterId = -1;

    /**
     * The submission version id.
     */
    private long submissionVId = -1;

    /**
     * The submission path on file system.
     */
    private String submissionPath = null;

    /**
     * The project type.
     */
    private ProjectType projectType = null;

    /**
     * Create a request with all variables.
     *
     * @param submitterId the submitter id.
     * @param submissionVId submission version id.
     * @param submissionPath the submission path on file system.
     * @param projectType the project type.
     */
    public ScreeningRequest(long taskId, long submitterId, long submissionVId, String submissionPath, ProjectType projectType) {
        this.taskId = taskId;
        this.submitterId = submitterId;
        this.submissionVId = submissionVId;
        this.submissionPath = submissionPath;
        this.projectType = projectType;
    }

    /* (non-Javadoc)
     * @see com.topcoder.apps.screening.IScreeningRequest#getTaskId()
     */
    public long getTaskId() {
        return this.taskId;
    }

    /* (non-Javadoc)
     * @see com.topcoder.apps.screening.IScreeningRequest#getTaskId()
     */
    public void setTaskId(long taskId) {
        this.taskId = taskId;
    }

    /* (non-Javadoc)
     * @see com.topcoder.apps.screening.IScreeningRequest#getSubmitterId()
     */
    public long getSubmitterId() {
        return this.submitterId;
    }

    /* (non-Javadoc)
     * @see com.topcoder.apps.screening.IScreeningRequest#getSubmissionVId()
     */
    public long getSubmissionVId() {
        return this.submissionVId;
    }

    /* (non-Javadoc)
     * @see com.topcoder.apps.screening.IScreeningRequest#getSubmissionPath()
     */
    public String getSubmissionPath() {
        return this.submissionPath;
    }

    /* (non-Javadoc)
     * @see com.topcoder.apps.screening.IScreeningRequest#getProjectType()
     */
    public ProjectType getProjectType() {
        return this.projectType;
    }

}
