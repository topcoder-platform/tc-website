package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the comp_categories table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompCategoriesHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDECompCategoriesEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompCategories findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param catalog               compCatalog.
     * @param categories            categories.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDECompCategories create(LocalDDECompCatalog catalog, LocalDDECategories categories) throws CreateException;

    /**
     * Returns a Collection of LocalDDECompCategories with the given component id.
     *
     * @param componentId           component id.
     * @return a Collection of local interfaces (LocalDDECompCategories).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByComponentId(long componentId) throws FinderException;

    /**
     * Returns a Collection of LocalDDECompCategories with the given category id.
     *
     * @param categoryId            category id.
     * @return a Collection of local interfaces (LocalDDECompCategories).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByCategoryId(long categoryId) throws FinderException;

    /**
     * Returns a entity object (LocalDDECompCategories) with the given component id and category id.
     *
     * @param componentId           component id.
     * @param categoryId            category id.
     * @return a local interface (LocalDDECompCategories).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompCategories findByComponentIdAndCategoryId(long componentId, long categoryId) throws FinderException;

}
