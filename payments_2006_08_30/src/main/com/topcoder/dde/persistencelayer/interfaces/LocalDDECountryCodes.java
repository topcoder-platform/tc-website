package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the country_codes table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECountryCodes extends EJBLocalObject {

    /**
     * Gets the description.
     *
     * @return  description.
     */
    String getDescription();

}
