package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;

/**
 * The base bean implementation class representing the CMP bean with the description CMP field, the status id CMP field and
 * the name CMP field.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEBaseDescStatusNameBean extends DDEBaseDescStatusBean {

    /**
     * Creates a new instance.
     */
    public DDEBaseDescStatusNameBean() {
    }

    /**
     * Gets the name.
     *
     * @return  name.
     */
    public abstract String getName();

    /**
     * Sets the name.
     *
     * @param name  name.
     */
    public abstract void setName(String name);

    /**
     * Creates an entity object.
     *
     * @param name                  name.
     * @param description           description.
     * @param statusId              status id.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(String name, String description, long statusId) throws CreateException {
        ejbCreate(description, statusId);
        setName(name);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param name                  name.
     * @param description           description.
     * @param statusId              status id.
     */
    public void ejbPostCreate(String name, String description, long statusId) {
    }

}
