package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;
import java.sql.Timestamp;

/**
 * The local interface representing the CMP bean for the comp_reviews table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompReviews extends EJBLocalObject {

    /**
     * Gets the review time.
     *
     * @return review time.
     */
    Timestamp getReviewTime();

    /**
     * Sets the review time.
     *
     * @param reviewTime    review time.
     */
    void setReviewTime(Timestamp reviewTime);

    /**
     * Gets the userMaster (CMR).
     *
     * @return userMaster.
     */
    LocalDDEUserMaster getUserMaster();

    /**
     * Gets the rating.
     *
     * @return rating.
     */
    int getRating();

    /**
     * Sets the rating.
     *
     * @param rating    rating.
     */
    void setRating(int rating);

    /**
     * Gets the comments.
     *
     * @return comments.
     */
    String getComments();

    /**
     * Sets the comments.
     *
     * @param comments  comments.
     */
    void setComments(String comments);

    /**
     * Gets compVersions (CMR).
     *
     * @return compVersions.
     */
    LocalDDECompVersions getCompVersions();

}
