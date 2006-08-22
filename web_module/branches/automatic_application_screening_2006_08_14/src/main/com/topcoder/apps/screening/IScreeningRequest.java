package com.topcoder.apps.screening;

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
     * Get the submission version id.
     *
     * @return the submission version id.
     */
    public abstract long getSubmissionVId();

    /**
     * Get the submission path on file system.
     *
     * @return the submission path on file system.
     */
    public abstract String getSubmissionPath();

    /**
     * Get the project type.
     *
     * @return the project type.
     */
    public abstract ProjectType getProjectType();

}