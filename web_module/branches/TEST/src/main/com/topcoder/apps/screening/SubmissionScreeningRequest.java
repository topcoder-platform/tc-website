/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening;

/**
 * <strong>Purpose</strong>:
 * Submission implementation for the Screening Request
 *
 * @author pulky
 * @version 1.0.0
 */
public class SubmissionScreeningRequest extends ScreeningRequest {

    /**
     * Constructor.
     *
     * @param taskId The screening task Id
     * @param submitterId The submitter Id
     * @param artifactId The submission version Id
     * @param artifactPath The submission path
     * @param projectType the screening project type
     */
    public SubmissionScreeningRequest(long taskId, long submitterId, long artifactId,
            String artifactPath, ProjectType projectType) {
        super(taskId, submitterId, artifactId, artifactPath, projectType);
    }

}
