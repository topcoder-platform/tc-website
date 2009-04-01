package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the user_contact table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEUserContact extends EJBLocalObject {

    /**
     * Gets the userMaster (CMR).
     *
     * @return userMaster.
     */
    LocalDDEUserMaster getUserMaster();

    /**
     * Gets the contact info.
     *
     * @return contact info.
     */
    String getContactInfo();

    /**
     * Gets the contact type (CMR).
     *
     * @return contactType.
     */
    LocalDDEContactType getContactType();

}
