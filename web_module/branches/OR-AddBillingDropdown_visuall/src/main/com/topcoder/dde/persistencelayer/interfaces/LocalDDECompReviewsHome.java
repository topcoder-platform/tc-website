package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.sql.Timestamp;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the comp_reviews table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompReviewsHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDECompReviewsEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompReviews findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param reviewTime            review time.
     * @param rating                rating.
     * @param comments              comments.
     * @param compVersions          compVersions.
     * @param userMaster            userMaster.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDECompReviews create(Timestamp reviewTime, int rating, String comments, LocalDDECompVersions compVersions,
                               LocalDDEUserMaster userMaster) throws CreateException;

    /**
     * Returns an Collection of LocalDDECompReviews with the given compVersions id.
     *
     * @param compVersId            compVersId.
     * @return a Collection of local interfaces (LocalDDECompReviews).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByCompVersId(long compVersId) throws FinderException;

}
