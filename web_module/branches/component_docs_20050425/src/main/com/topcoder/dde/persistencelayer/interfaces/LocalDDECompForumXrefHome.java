package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the comp_forum_xref table.
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
    LocalDDECompForumXref findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param forumId               forum id.
     * @param forumType             forum type.
     * @param compVersions          compVersions.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDECompForumXref create(long forumId, int forumType, LocalDDECompVersions compVersions) throws CreateException;

    /**
     * Returns a Collection of LocalDDECompForumXref with the given compVersions id.
     *
     * @param compVersId            compVersions id.
     * @return a Collection of local interfaces (LocalDDECompForumXref).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByCompVersId(long compVersId) throws FinderException;

    /**
     * Returns a Collection of LocalDDECompForumXref with the given forum id.
     *
     * @param forumId               forum id.
     * @return a Collection of local interfaces (LocalDDECompForumXref).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByForumId(long forumId) throws FinderException;

    /**
     * Returns a Collection of LocalDDECompForumXref with the given compVersions id and forum type.
     *
     * @param compVersId            compVersions id.
     * @param forumType             forum type.
     * @return a Collection of local interfaces (LocalDDECompForumXref).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByCompVersIdAndType(long compVersId, int forumType) throws FinderException;

    /**
     * Returns an instance of LocalDDECompForumXref with the given compVersions id and forum id.
     *
     * @param compVersId            compVersions id.
     * @param forumId               forum id.
     * @return a local interface (LocalDDECompForumXref).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompForumXref findByCompVersIdAndForumId(long compVersId, long forumId) throws FinderException;

}
