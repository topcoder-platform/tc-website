/**
 *
 */
package com.topcoder.apps.screening;

/**
 * @author pwolfus
 *
 */
public class SpecificationScreeningRequest extends ScreeningRequest {

    /**
     * @param submitterId
     * @param submissionVId
     * @param submissionPath
     * @param projectType
     */
    public SpecificationScreeningRequest(long taskId, long submitterId, long submissionVId,
            String submissionPath, ProjectType projectType) {
        super(taskId, submitterId, submissionVId, submissionPath, projectType);
        // TODO Auto-generated constructor stub
    }

}
