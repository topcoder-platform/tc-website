package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;

/**
 * The local home interface representing the CMP bean for the contact_type table.
 *
 * @version     1.0
 * @author      David Messinger
 */
public interface LocalDDEComponentInquiryHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDEComponentInquiryEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDEComponentInquiry findByPrimaryKey(Long key) throws FinderException;


    /**
     * Creates an entity object.
     *
     * @param componentId      the component being inquired about
     * @param userId           the user inquiring about the component
     * @param rating           the user's TopCoder rating
     * @param comments         the comments about the inquiry
     * @param agreedToTerms    if the user agreed to terms
     * @param phase            the component's phase at time of inquiry
     * @param tcUserId         the user's topcoder id
     * @param version          component's current version
     *
     * @return  the component's phase at time of inquiry
     */
    LocalDDEComponentInquiry create(long componentId, long userId, long rating, String comments, boolean agreedToTerms, long phase, long tcUserId, long version, long projectId) throws CreateException;


}
