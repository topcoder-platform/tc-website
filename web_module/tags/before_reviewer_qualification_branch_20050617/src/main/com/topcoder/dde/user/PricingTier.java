package com.topcoder.dde.user;

import java.io.Serializable;

/**
 * PricingTier contains pricing information for a user's company.  This
 * information includes an id for referencing the pricing tier in the
 * database and any company specific dicount information.
 */
public class PricingTier implements Serializable {

    private long id;
    private double discount;

    /**
     * Construct a PricingTier object.
     *
     * @param id The primary key id that references this pricing tier in
     *           the database.
     * @param discount The discount that should be applied to this company's
     *                 purchases.
     */
    public PricingTier(long id, double discount) {
        this.id = id;
        this.discount = discount;
    }

    public long getId() {
        return id;
    }

    public double getDiscount() {
        return discount;
    }
}
