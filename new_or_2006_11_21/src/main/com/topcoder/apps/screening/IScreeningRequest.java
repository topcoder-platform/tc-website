/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening;

/**
 * <strong>Purpose</strong>:
 * Interface for screening artifacts
 *
 * @author pulky
 * @version 1.0.1
 */
public interface IScreeningRequest {

    /**
     * Get the task id.
     *
     * @return the task id.
     */
    public abstract long getTaskId();

    /**
     * Get the task id.
     *
     * @return the task id.
     */
    public void setTaskId(long taskId);

    /**
     * Get the submitter id.
     *
     * @return the submitter id.
     */
    public abstract long getSubmitterId();

    /**
     * Get the artifact id.
     *
     * @return the artifact id.
     */
    public abstract long getArtifactId();

    /**
     * Get the artifact path on file system.
     *
     * @return the artifact path on file system.
     */
    public abstract String getArtifactPath();

    /**
     * Get the project type.
     *
     * @return the project type.
     */
    public abstract ProjectType getProjectType();

}