package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the user_role table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEUserRole extends EJBLocalObject {

    /**
     * Gets the TCS rating.
     *
     * @return TCS rating.
     */
    int getTcsRating();

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
