package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;

/**
 * The base bean implementation class representing the CMP bean with the description CMP field and the status id CMP field.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEBaseDescStatusBean extends DDEBaseDescriptionBean {

    /**
     * Creates a new instance.
     */
    public DDEBaseDescStatusBean() {
    }

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
     * @param description           description.
     * @param statusId              status id.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(String description, long statusId) throws CreateException {
        ejbCreate(description);
        setStatusId(statusId);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param description           description.
     * @param statusId              status id.
     */
    public void ejbPostCreate(String description, long statusId) {
    }

}
