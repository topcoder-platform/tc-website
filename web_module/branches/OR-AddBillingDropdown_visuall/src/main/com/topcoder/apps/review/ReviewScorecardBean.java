/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.User;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * Java bean for the review scorecard.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ReviewScorecardBean {

    // ------------------------------------------------ Instance Variables

    /**
     * The reviewer.
     */
    private User reviewer = null;

    /**
     * The submitter.
     */
    private User submitter = null;

    /**
     * The project id.
     */
    private long projectId = -1;

    /**
     * The map for generating the URL parameters.
     */
    private Map mapping = new HashMap();

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>ReviewScorecardBean</code> class.
     * </p>
     *
     * @param reviewer The reviewer to be set.
     * @param submitter The submitter to be set.
     * @param projectId The project id to be set.
     */
    public ReviewScorecardBean(User reviewer, User submitter, long projectId) {
        this.reviewer = reviewer;
        this.submitter = submitter;
        this.projectId = projectId;

        mapping.put(Constants.ID_KEY, new Long(projectId));
        mapping.put(Constants.REVIEWER_ID_KEY, new Long(reviewer.getId()));
        mapping.put(Constants.SUBMITTER_ID_KEY, new Long(submitter.getId()));
    }

    // ----------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the mapping for generating the URL parameters.
     * </p>
     *
     * @return the mapping for generating the URL parameters.
     */
    public Map getMapping() {
        return mapping;
    }

    /**
     * <p>
     * Return the reviewer.
     * </p>
     *
     * @return the reviewer.
     */
    public User getReviewer() {
        return reviewer;
    }

    /**
     * <p>
     * Return the submitter.
     * </p>
     *
     * @return the submitter.
     */
    public User getSubmitter() {
        return submitter;
    }
}