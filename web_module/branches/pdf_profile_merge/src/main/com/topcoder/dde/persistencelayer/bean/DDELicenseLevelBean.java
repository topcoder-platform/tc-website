package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the license_level table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDELicenseLevelBean extends DDEBaseDescriptionBean {

    /**
     * Creates a new instance.
     */
    public DDELicenseLevelBean() {
    }

    /**
     * Gets the price multiplier.
     *
     * @return  price multiplier.
     */
    public abstract double getPriceMultiplier();

    /**
     * Sets the price multiplier.
     *
     * @param priceMultiplier   price multiplier.
     */
    public abstract void setPriceMultiplier(double priceMultiplier);

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
     * @param priceMultiplier       price multiplier.
     * @param description           description.
     * @param statusId              status id.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(double priceMultiplier, String description, long statusId) throws CreateException {
        ejbCreate(description);
        setPriceMultiplier(priceMultiplier);
        setStatusId(statusId);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param priceMultiplier       price multiplier.
     * @param description           description.
     * @param statusId              status id.
     */
    public void ejbPostCreate(double priceMultiplier, String description, long statusId) {
    }

}
