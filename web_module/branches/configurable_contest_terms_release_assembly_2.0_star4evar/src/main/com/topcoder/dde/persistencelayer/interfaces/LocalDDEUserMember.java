package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the user_member table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEUserMember extends EJBLocalObject {

    /**
     * Gets the userMaster (CMR).
     *
     * @return userMaster.
     */
    LocalDDEUserMaster getUserMaster();

    /**
     * Gets the TC rating.
     *
     * @return TC rating.
     */
    int getTcRating();

    /**
     * Gets the TCS rating.
     *
     * @return TCS rating.
     */
    int getTcsRating();

}
