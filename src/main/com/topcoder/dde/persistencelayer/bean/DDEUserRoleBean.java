package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDERoles;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the user_role table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
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
     * Gets the TCS rating.
     *
     * @return TCS rating.
     */
    public abstract int getTcsRating();

    /**
     * Sets the TCS rating.
     *
     * @param tcsRating     TCS rating.
     */
    public abstract void setTcsRating(int tcsRating);

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
     * @param tcsRating             TCS rating.
     * @param userMaster            userMaster.
     * @param compVersions          compVersions.
     * @param roles                 roles.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(int tcsRating, LocalDDEUserMaster userMaster, LocalDDECompVersions compVersions, LocalDDERoles roles)
            throws CreateException {
        setPrimaryKey();
        setTcsRating(tcsRating);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param tcsRating             TCS rating.
     * @param userMaster            userMaster.
     * @param compVersions          compVersions.
     * @param roles                 roles.
     */
    public void ejbPostCreate(int tcsRating, LocalDDEUserMaster userMaster, LocalDDECompVersions compVersions,
                              LocalDDERoles roles) {
        setUserMaster(userMaster);
        setCompVersions(compVersions);
        setRoles(roles);
    }

}
