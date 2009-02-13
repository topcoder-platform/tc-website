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
public class ScreeningRequest {

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
    public ScreeningRequest(long submitterId, long submissionVId, String submissionPath, ProjectType projectType) {
        this.submitterId = submitterId;
        this.submissionVId = submissionVId;
        this.submissionPath = submissionPath;
        this.projectType = projectType;
    }

    /**
     * Get the submitter id.
     *
     * @return the submitter id.
     */
    public long getSubmitterId() {
        return this.submitterId;
    }

    /**
     * Get the submission version id.
     *
     * @return the submission version id.
     */
    public long getSubmissionVId() {
        return this.submissionVId;
    }

    /**
     * Get the submission path on file system.
     *
     * @return the submission path on file system.
     */
    public String getSubmissionPath() {
        return this.submissionPath;
    }

    /**
     * Get the project type.
     *
     * @return the project type.
     */
    public ProjectType getProjectType() {
        return this.projectType;
    }

}
