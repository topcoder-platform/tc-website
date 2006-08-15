package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the technology_types table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDETechnologyTypes extends EJBLocalObject {

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

    /**
     * Gets the status id.
     *
     * @return  status id.
     */
    long getStatusId();

    /**
     * Sets the status id.
     *
     * @param statusId  status id.
     */
    void setStatusId(long statusId);

    /**
     * Gets the name.
     *
     * @return  name.
     */
    String getName();

    /**
     * Sets the name.
     *
     * @param name  name.
     */
    void setName(String name);

}
