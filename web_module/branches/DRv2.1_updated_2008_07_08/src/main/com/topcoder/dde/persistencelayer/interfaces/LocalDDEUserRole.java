/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the user_role table.
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
public interface LocalDDEUserRole extends EJBLocalObject {

    /**
     * Gets the role addition description.
     *
     * @return role addition description.
     * @since 1.0.1
     */
    String getDescription();

    /**
     * Gets the userMaster (CMR).
     *
     * @return userMaster.
     */
    LocalDDEUserMaster getUserMaster();

    /**
     * Gets the roles (CMR).
     *
     * @return roles.
     */
    LocalDDERoles getRoles();

    /**
     * Gets compVersions (CMR).
     *
     * @return compVersions.
     */
    LocalDDECompVersions getCompVersions();

}
