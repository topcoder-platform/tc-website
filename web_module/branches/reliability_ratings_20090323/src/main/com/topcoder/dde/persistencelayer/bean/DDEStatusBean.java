package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the status table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEStatusBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDEStatusBean() {
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
     * @param key                   the primary key.
     * @param description           description.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(long key, String description) throws CreateException {
        setPrimaryKey(key);
        setDescription(description);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param key                   the primary key.
     * @param description           description.
     */
    public void ejbPostCreate(long key, String description) {
    }

}
