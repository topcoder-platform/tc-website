/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectStatus;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

/**
 * Helper class for checking the phase of a project. The purpose is to isolate the identification of phases
 * by IDS in a single place to allow easy modifications.
 *
 * @author adic
 * @version 1.0
 */
class PhaseHelper {

    /**
     * Constructor (inhibits outside instantiation).
     */
    private PhaseHelper() {
    }

    /**
     * Checks if a project is in submit phase.
     *
     * @param project the project
     *
     * @return whether the project is in the submit phase
     */
    static boolean canSubmit(Project project) {
        return project.getCurrentPhase().getId() == Phase.ID_SUBMISSION;
    }

    /**
     * Checks if a project is in submit phase.
     *
     * @param project the project
     *
     * @return whether the project is in the submit phase
     */
    static boolean canSubmit(UserProjectInfo project) {
        return project.getCurrentPhaseInstance().getPhase().getId() == Phase.ID_SUBMISSION;
    }

    /**
     * Checks if a project is in screen phase.
     *
     * @param project the project
     *
     * @return whether the project is in the screen phase
     */
    //static boolean canScreen(UserProjectInfo project) {
    //    return project.getCurrentPhaseInstance().getPhase().getId() == Phase.ID_SCREENING;
    //}

    /**
     * Checks if a project is in screen phase.
     *
     * @param project the project
     *
     * @return whether the project is in the screen phase
     */
    static boolean canScreen(Project project) {
        return project.getCurrentPhase().getId() == Phase.ID_SCREENING;
    }

    /**
     * Checks if a project is in screening phase.
     *
     * @param project the project
     *
     * @return whether the project is in the screening phase
     */
    static boolean canScreen(UserProjectInfo project) {
        return project.getCurrentPhaseInstance().getPhase().getId() == Phase.ID_SCREENING;
    }

    /**
     * Checks if a project is in review phase.
     *
     * @param project the project
     *
     * @return whether the project is in the review phase
     */
    static boolean canReview(Project project) {
        return project.getCurrentPhase().getId() == Phase.ID_REVIEW;
    }

    /**
     * Checks if a project is in aggregation phase or
     * in aggregation review phase.
     * @param project the project
     *
     * @return whether the project is in the aggregation phase
     */
    static boolean canAggregate(Project project) {
        return (project.getCurrentPhase().getId() == Phase.ID_AGGREGATION) ||
                (project.getCurrentPhase().getId() == Phase.ID_AGGREGATION_REVIEW);
    }

    /**
     * Checks if a project is in aggregation review phase.
     *
     * @param project the project
     *
     * @return whether the project is in the aggregation review phase
     */
    static boolean canReviewAggregate(Project project) {
        return project.getCurrentPhase().getId() == Phase.ID_AGGREGATION_REVIEW;
    }

    /**
     * Checks if a project is in final fix submission phase.
     *
     * @param project the project
     *
     * @return whether the project is in the final fix submission phase
     */
    static boolean canSubmitFinalFix(Project project) {
        return project.getCurrentPhase().getId() == Phase.ID_FINAL_FIXES;
    }

    /**
     * Checks if a project is in final review phase.
     *
     * @param project the project
     *
     * @return whether the project is in the final review phase
     */
    static boolean canFinalReview(Project project) {
        return project.getCurrentPhase().getId() == Phase.ID_FINAL_REVIEW;
    }

    /**
     * Checks if a project is closed.
     *
     * @param projectInfo the project
     *
     * @return whether the project is closed
     */
    static boolean isClosed(UserProjectInfo projectInfo) {
        return projectInfo.getProjectStatus().getId() == ProjectStatus.ID_TERMINATED
                || projectInfo.getProjectStatus().getId() == ProjectStatus.ID_COMPLETED;
    }

    /**
     * Checks if a project is closed.
     *
     * @param project the project
     *
     * @return whether the project is closed
     */
    static boolean isClosed(Project project) {
        return project.getProjectStatus().getId() == ProjectStatus.ID_TERMINATED;
    }

}

