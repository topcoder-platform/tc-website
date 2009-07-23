package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;

import com.topcoder.dde.persistencelayer.keys.CompForumXrefKey;

import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the comp_jive_category_xref table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompForumXrefHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDECompForumXrefEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompForumXref findByPrimaryKey(CompForumXrefKey key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param categoryId            category id.
     * @param compVersId            component version id.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDECompForumXref create(long categoryId, long compVersId) throws CreateException;

    /**
     * Returns a Collection of LocalDDECompForumXref with the given compVersions id.
     *
     * @param compVersId            compVersions id.
     * @return a Collection of local interfaces (LocalDDECompForumXref).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByCompVersId(long compVersId) throws FinderException;

    /**
     * Returns a Collection of LocalDDECompCategoryXref with the given category id.
     *
     * @param categoryId            category id.
     * @return a Collection of local interfaces (LocalDDECompForumXref).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByCategoryId(long categoryId) throws FinderException;

    /**
     * Returns an instance of LocalDDECompForumXref with the given compVersions id and category id.
     *
     * @param compVersId            compVersions id.
     * @param categoryId            category id.
     * @return a local interface (LocalDDECompForumXref).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompForumXref findByCompVersIdAndCategoryId(long compVersId, long categoryId) throws FinderException;
}