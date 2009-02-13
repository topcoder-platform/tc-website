package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the price_tiers table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEPriceTiersHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDEPriceTiersEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDEPriceTiers findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param discountPercent       discount percent.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDEPriceTiers create(double discountPercent) throws CreateException;

    /**
     * Returns a Collection of all instances of LocalDDEPriceTiers.
     *
     * @return a Collection of local interfaces (LocalDDEPriceTiers).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findAll() throws FinderException;

}
