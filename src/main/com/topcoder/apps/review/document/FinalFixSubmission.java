/*
 * FinalFixSubmission.java
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
 * This interface of a final fix submission is instantiable (as a
 * concrete interface) and is provided to allow for current implementation
 * differences between the different submission types (including
 * persistence layer implementation) and to allow for future
 * differentiation between final fix and other submission types.
 *
 * @author FatClimber
 * @version 1.0
 */
public class FinalFixSubmission extends AbstractSubmission implements Serializable {
    /** SUBMISSION_TYPE */
    public static final int SUBMISSION_TYPE = 2;

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
    public FinalFixSubmission(long id, URL url, String messagePMReview, String messagePMScreening,
                              User submitter, Project project, boolean isRemoved, long requestorId, long versionId) {
        super(id, url, messagePMReview, messagePMScreening, submitter, project, isRemoved, requestorId, versionId);
    }
}
