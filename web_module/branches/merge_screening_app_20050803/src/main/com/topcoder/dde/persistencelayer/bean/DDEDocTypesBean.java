package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the doc_types table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEDocTypesBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDEDocTypesBean() {
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
     * Gets the status id.
     *
     * @return  status id.
     */
    public abstract long getStatusId();

    /**
     * Sets the status id.
     *
     * @param statusId  status id.
     */
    public abstract void setStatusId(long statusId);

    /**
     * Creates an entity object.
     *
     * @param key                   the primary key.
     * @param description           description.
     * @param statusId              status id.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(long key, String description, long statusId) throws CreateException {
        setPrimaryKey(key);
        setDescription(description);
        setStatusId(statusId);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param key                   the primary key.
     * @param description           description.
     * @param statusId              status id.
     */
    public void ejbPostCreate(long key, String description, long statusId) {
    }

}
