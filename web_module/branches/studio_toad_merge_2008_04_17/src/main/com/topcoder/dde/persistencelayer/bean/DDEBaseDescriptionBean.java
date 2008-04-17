package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;

/**
 * The base bean implementation class representing the CMP bean with the description CMP field.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEBaseDescriptionBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDEBaseDescriptionBean() {
    }

    /**
     * Gets the description.
     *
     * @return  description.
     */
    public abstract String getDescription();

    /**
     * Sets the description.
     *
     * @param description   description.
     */
    public abstract void setDescription(String description);

    /**
     * Creates an entity object.
     *
     * @param description           description.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(String description) throws CreateException {
        setPrimaryKey();
        setDescription(description);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param description           description.
     */
    public void ejbPostCreate(String description) {
    }

}
