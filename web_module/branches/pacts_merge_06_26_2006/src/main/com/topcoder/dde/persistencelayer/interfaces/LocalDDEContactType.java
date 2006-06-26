package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the contact_type table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEContactType extends EJBLocalObject {

    /**
     * Gets the description.
     *
     * @return  description.
     */
    String getDescription();

    /**
     * Gets the status id.
     *
     * @return  status id.
     */
    long getStatusId();

}
