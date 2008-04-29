package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the comp_keywords table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompKeywords extends EJBLocalObject {

    /**
     * Gets the keyword.
     *
     * @return keyword.
     */
    String getKeyword();

    /**
     * Gets an instance of LocalDDECompCatalog (CMR).
     *
     * @return an instance of LocalDDECompCatalog.
     */
    LocalDDECompCatalog getCompCatalog();

}
