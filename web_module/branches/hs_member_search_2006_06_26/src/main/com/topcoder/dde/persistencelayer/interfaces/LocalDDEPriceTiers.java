package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the price_tiers table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEPriceTiers extends EJBLocalObject {

    /**
     * Gets the dicsount percent.
     *
     * @return  discount percent.
     */
    double getDiscountPercent();

}
