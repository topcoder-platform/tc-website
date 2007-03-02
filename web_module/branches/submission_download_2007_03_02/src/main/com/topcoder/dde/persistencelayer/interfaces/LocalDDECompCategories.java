package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the comp_categories table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompCategories extends EJBLocalObject {

    /**
     * Gets an instance of LocalDDECategories (CMR).
     *
     * @return an instance of LocalDDECategories.
     */
    LocalDDECategories getCategories();

    /**
     * Gets an instance of LocalDDECompCatalog (CMR).
     *
     * @return an instance of LocalDDECompCatalog.
     */
    LocalDDECompCatalog getCompCatalog();

}
