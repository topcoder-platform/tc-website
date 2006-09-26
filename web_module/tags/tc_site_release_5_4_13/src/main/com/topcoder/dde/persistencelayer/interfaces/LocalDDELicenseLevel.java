package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the license_level table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDELicenseLevel extends EJBLocalObject {

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
     * Gets the price multiplier.
     *
     * @return  price multiplier.
     */
    double getPriceMultiplier();

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
     * Sets the price multiplier.
     *
     * @param priceMultiplier   price multiplier.
     */
    void setPriceMultiplier(double priceMultiplier);

}
