package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the categories table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECategoriesHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDECategoriesEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECategories findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param parentCategoryId      parent category id.
     * @param name                  name.
     * @param description           description.
     * @param statusId              status id.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDECategories create(Long parentCategoryId, String name, String description, long statusId) throws CreateException;

    /**
     * Returns all active (statusId>0) categories.
     *
     * @return a Collection of local interfaces (LocalDDECategories).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findAllActive() throws FinderException;

    /**
     * Returns a Collection of active (statusId>0) LocalDDECategories with the given parent category id.
     *
     * @param parentCategoryId      parent category id.
     * @return a Collection of local interfaces (LocalDDECategories).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByParentCategoryId(Long parentCategoryId) throws FinderException;

}
