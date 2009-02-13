package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the user_technologies table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEUserTechnologies extends EJBLocalObject {

    /**
     * Gets the userMaster (CMR).
     *
     * @return userMaster.
     */
    LocalDDEUserMaster getUserMaster();

    /**
     * Gets the rating.
     *
     * @return rating.
     */
    int getRating();

    /**
     * Gets the months.
     *
     * @return months.
     */
    int getMonths();

    /**
     * Gets the technologyTypes (CMR).
     *
     * @return technologyTypes.
     */
    LocalDDETechnologyTypes getTechnologyTypes();

}
