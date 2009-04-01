/*
 * InitialSubmission.java
 *
 * Copyright ? 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.User;

import java.io.Serializable;
import java.net.URL;


/**
 * This interface of an initial submission is instantiable (as a
 * concrete interface) and is provided to allow for current implementation
 * differences between the different submission types (including
 * persistence layer implementation) and to allow for future
 * differentiation between initial and other submission types.
 *
 * @author FatClimber
 * @version 1.0
 */
public class InitialSubmission extends AbstractSubmission implements Serializable {
    /** SUBMISSION_TYPE */
    public static final int SUBMISSION_TYPE = 1;

    private float finalScore;
    private int placement;
    private boolean passedScreening;
    private boolean advancedToReview;

    /**
     * DOCUMENT ME!
     *
     * @param id DOCUMENT ME!
     * @param url
     * @param messagePMReview
     * @param messagePMScreening
     * @param submitter
     * @param project DOCUMENT ME!
     * @param requestorId DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public InitialSubmission(long id, URL url, String messagePMReview, String messagePMScreening,
                             User submitter, Project project, boolean isRemoved, float finalScore, int placement, boolean passedScreening,
                             boolean advancedToReview, long requestorId, long versionId) {
        super(id, url, messagePMReview, messagePMScreening, submitter, project, isRemoved, requestorId, versionId);
        this.finalScore = finalScore;
        this.placement = placement;
        this.passedScreening = passedScreening;
        this.advancedToReview = advancedToReview;
    }

    /**
     * @return Returns the finalScore.
     */
    public float getFinalScore() {
        return finalScore;
    }

    /**
     * @param finalScore The finalScore to set.
     */
    public void setFinalScore(float finalScore) {
        if (this.finalScore != finalScore) {
            this.dirtyFlag = true;
            this.finalScore = finalScore;
        }
    }

    /**
     * @return Returns the placement.
     */
    public int getPlacement() {
        return placement;
    }

    /**
     * @param placement The placement to set.
     */
    public void setPlacement(int placement) {
        if (this.placement != placement) {
            this.dirtyFlag = true;
            this.placement = placement;
        }
    }

    /**
     * @return Returns the passedScreening.
     */
    public boolean isPassedScreening() {
        return passedScreening;
    }

    public boolean isAdvancedToReview() {
        return advancedToReview;
    }

    public void setAdvancedToReview(boolean advancedToReview) {
        //if(this.advancedToReview != advancedToReview) {
        this.advancedToReview = advancedToReview;
        this.dirtyFlag = true;
        //}
    }

    /**
     * @param passedScreening The passedScreening to set.
     */
    public void setPassedScreening(boolean passedScreening) {
        if (this.passedScreening != passedScreening) {
            this.dirtyFlag = true;
            this.passedScreening = passedScreening;
        }
    }
}
