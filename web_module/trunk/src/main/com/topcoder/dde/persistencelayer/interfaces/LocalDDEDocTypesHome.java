package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;

/**
 * The local home interface representing the CMP bean for the doc_types table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEDocTypesHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDEDocTypesEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDEDocTypes findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param key                   the primary key.
     * @param description           description.
     * @param statusId              status id.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDEDocTypes create(long key, String description, long statusId) throws CreateException;

}
