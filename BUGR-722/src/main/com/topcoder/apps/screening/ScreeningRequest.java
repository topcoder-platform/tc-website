/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening;

/**
 * <strong>Purpose</strong>:
 * Abstract class for a screening request
 *
 * @author WishingBone, pulky
 * @version 1.0.1
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
     * The artifact id.
     */
    private long artifactId = -1;

    /**
     * The artifact path on file system.
     */
    private String artifactPath = null;

    /**
     * The project type.
     */
    private ProjectType projectType = null;

    /**
     * Create a request with all variables.
     *
     * @param submitterId the submitter id.
     * @param artifactId artifact id.
     * @param artifactPath the artifact path on file system.
     * @param projectType the project type.
     */
    public ScreeningRequest(long taskId, long submitterId, long artifactId, String artifactPath, ProjectType projectType) {
        this.taskId = taskId;
        this.submitterId = submitterId;
        this.artifactId = artifactId;
        this.artifactPath = artifactPath;
        this.projectType = projectType;
    }

    public long getTaskId() {
        return this.taskId;
    }

    public void setTaskId(long taskId) {
        this.taskId = taskId;
    }

    public long getSubmitterId() {
        return this.submitterId;
    }

    public long getArtifactId() {
        return this.artifactId;
    }

    public String getArtifactPath() {
        return this.artifactPath;
    }

    public ProjectType getProjectType() {
        return this.projectType;
    }

}
