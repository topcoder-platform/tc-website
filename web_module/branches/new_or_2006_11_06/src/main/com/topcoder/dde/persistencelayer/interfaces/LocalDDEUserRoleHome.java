/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the user_role table.
 *
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * Description attribute was added.
 * </li>
 * <li>
 * tcsrating attribute was eliminated.
 * </li>
 * </ol>
 *
 * @version 1.0.1
 * @author Timur Zambalayev, pulky
 */
public interface LocalDDEUserRoleHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDEUserRoleEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDEUserRole findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param description           Role addition description.
     * @param userMaster            userMaster.
     * @param compVersions          compVersions.
     * @param roles                 roles.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDEUserRole create(String description, LocalDDEUserMaster userMaster,
        LocalDDECompVersions compVersions, LocalDDERoles roles)
            throws CreateException;

    /**
     * Returns a Collection of LocalDDEUserRole with the given compVersions id.
     *
     * @param compVersId            compVersions id.
     * @return a Collection of local interfaces (LocalDDEUserRole).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByCompVersId(long compVersId) throws FinderException;

    /**
     * Returns a Collection of LocalDDEUserRole with the given role id.
     *
     * @param roleId                role id.
     * @return a Collection of local interfaces (LocalDDEUserRole).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByRoleId(long roleId) throws FinderException;

    /**
     * Returns a Collection of LocalDDEUserRole with the given login id.
     *
     * @param loginId               login id.
     * @return a Collection of local interfaces (LocalDDEUserRole).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByLoginId(long loginId) throws FinderException;

}
