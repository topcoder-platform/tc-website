/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDERoles;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the user_role table.
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
public abstract class DDEUserRoleBean extends DDEBaseCompVersionsBean {

    /**
     * Creates a new instance.
     */
    public DDEUserRoleBean() {
    }

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
     * Gets the role addition description.
     *
     * @return role addition description.
     * @since 1.0.1
     */
    public abstract String getDescription();

    /**
     * Sets the role addition description.
     *
     * @param description role addition description.
     * @since 1.0.1
     */
    public abstract void setDescription(String description);

    /**
     * Gets the roles (CMR).
     *
     * @return roles.
     */
    public abstract LocalDDERoles getRoles();

    /**
     * Sets the roles (CMR).
     *
     * @param roles     roles.
     */
    public abstract void setRoles(LocalDDERoles roles);

    /**
     * Creates an entity object.
     *
     * @param description           role addition description.
     * @param userMaster            userMaster.
     * @param compVersions          compVersions.
     * @param roles                 roles.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(String description, LocalDDEUserMaster userMaster,
        LocalDDECompVersions compVersions, LocalDDERoles roles)
            throws CreateException {
        setPrimaryKey();
        setDescription(description);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param description           role addition description.
     * @param userMaster            userMaster.
     * @param compVersions          compVersions.
     * @param roles                 roles.
     */
    public void ejbPostCreate(String description, LocalDDEUserMaster userMaster,
        LocalDDECompVersions compVersions, LocalDDERoles roles) {
        setUserMaster(userMaster);
        setCompVersions(compVersions);
        setRoles(roles);
    }

}
