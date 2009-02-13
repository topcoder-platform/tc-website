package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the status table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEStatus extends EJBLocalObject {

    /**
     * Gets the description.
     *
     * @return  description.
     */
    String getDescription();

    /**
     * Sets the description.
     *
     * @param description   description.
     */
    void setDescription(String description);

}
