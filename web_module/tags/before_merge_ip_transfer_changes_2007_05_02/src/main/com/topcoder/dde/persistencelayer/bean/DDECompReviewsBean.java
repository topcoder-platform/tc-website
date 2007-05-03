package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;

import javax.ejb.CreateException;
import java.sql.Timestamp;

/**
 * The bean implementation class representing the CMP bean for the comp_reviews table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDECompReviewsBean extends DDEBaseCompVersionsBean {

    /**
     * Creates a new instance.
     */
    public DDECompReviewsBean() {
    }

    /**
     * Gets the review time.
     *
     * @return review time.
     */
    public abstract Timestamp getReviewTime();

    /**
     * Sets the review time.
     *
     * @param reviewTime    review time.
     */
    public abstract void setReviewTime(Timestamp reviewTime);

    /**
     * Gets the userMaster (CMR).
     *
     * @return userMaster.
     */
    public abstract LocalDDEUserMaster getUserMaster();

    /**
     * Sets the userMaster (CMR).
     *
     * @param userMaster    userMaster.
     */
    public abstract void setUserMaster(LocalDDEUserMaster userMaster);

    /**
     * Gets the rating.
     *
     * @return rating.
     */
    public abstract int getRating();

    /**
     * Sets the rating.
     *
     * @param rating    rating.
     */
    public abstract void setRating(int rating);

    /**
     * Gets the comments.
     *
     * @return comments.
     */
    public abstract String getComments();

    /**
     * Sets the comments.
     *
     * @param comments  comments.
     */
    public abstract void setComments(String comments);

    /**
     * Creates an entity object.
     *
     * @param reviewTime            review time.
     * @param rating                rating.
     * @param comments              comments.
     * @param compVersions          compVersions.
     * @param userMaster            userMaster.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(Timestamp reviewTime, int rating, String comments, LocalDDECompVersions compVersions,
                          LocalDDEUserMaster userMaster) throws CreateException {
        setPrimaryKey();
        setReviewTime(reviewTime);
        setRating(rating);
        setComments(comments);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param reviewTime            review time.
     * @param rating                rating.
     * @param comments              comments.
     * @param compVersions          compVersions.
     * @param userMaster            userMaster.
     */
    public void ejbPostCreate(Timestamp reviewTime, int rating, String comments, LocalDDECompVersions compVersions,
                              LocalDDEUserMaster userMaster) {
        setCompVersions(compVersions);
        setUserMaster(userMaster);
    }

}
