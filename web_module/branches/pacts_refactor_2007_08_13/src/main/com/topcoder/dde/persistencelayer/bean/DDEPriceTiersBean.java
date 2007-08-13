package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the price_tiers table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEPriceTiersBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDEPriceTiersBean() {
    }

    /**
     * Gets the discount percent.
     *
     * @return  discount percent.
     */
    public abstract double getDiscountPercent();

    /**
     * Sets the discount percent.
     *
     * @param discountPercent   discount percent.
     */
    public abstract void setDiscountPercent(double discountPercent);

    /**
     * Creates an entity object.
     *
     * @param discountPercent       discount percent.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(double discountPercent) throws CreateException {
        setPrimaryKey();
        setDiscountPercent(discountPercent);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param discountPercent       discount percent.
     */
    public void ejbPostCreate(double discountPercent) {
    }

}
