/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AggregationReview;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.User;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * Java bean for admin the aggregation reviews.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class AdminAggregationReviewBean {

    // ------------------------------------------------ Instance Variables

    /**
     * The aggregation review.
     */
    private AggregationReview review = null;

    /**
     * The reviewer.
     */
    private User reviewer = null;

    /**
     * The map for generating the URL parameters.
     */
    private Map mapping = new HashMap();

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>AdminAggregationReviewBean</code> class.
     * </p>
     *
     * @param project The related project.
     * @param reviewer The reviewer to be set.
     * @param reviews The aggregation reviews to be set.
     */
    public AdminAggregationReviewBean(Project project,
                                      User reviewer,
                                      AggregationReview[] reviews) {
        this.reviewer = reviewer;
        if (reviews != null) {
            for (int i = 0; i < reviews.length; i++) {
                if (reviews[i].getReviewer().getId() == reviewer.getId()) {
                    review = reviews[i];
                }
            }
        }

        mapping.put(Constants.ID_KEY, new Long(project.getId()));
        mapping.put(Constants.REVIEWER_ID_KEY, new Long(reviewer.getId()));
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
     * Return the aggregation review.
     * </p>
     *
     * @return the aggregation review.
     */
    public AggregationReview getReview() {
        return review;
    }

    /**
     * <p>
     * Return whether the aggregation review exists.
     * </p>
     *
     * @return whether the aggregation review exists.
     */
    public boolean getExists() {
        return (review != null);
    }

    /**
     * <p>
     * Return whether the PM has reviewed.
     * </p>
     *
     * @return whether the PM has reviewed.
     */
    public boolean getIsPMReviewed() {
        if (review != null) {
            return review.isPMReviewed();
        } else {
            return false;
        }
    }
}