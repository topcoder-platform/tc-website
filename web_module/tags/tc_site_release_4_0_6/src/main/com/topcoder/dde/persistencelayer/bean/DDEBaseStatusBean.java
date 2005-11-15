package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;

/**
 * The base bean implementation class representing the CMP bean with the status id CMP field.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEBaseStatusBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    DDEBaseStatusBean() {
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
     * Used for creating an entity object.
     *
     * @param statusId              status id.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    void create(long statusId) throws CreateException {
        setPrimaryKey();
        setStatusId(statusId);
    }

}
