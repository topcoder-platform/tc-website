package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the comp_technology table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompTechnology extends EJBLocalObject {

    /**
     * Gets compVersions (CMR).
     *
     * @return compVersions.
     */
    LocalDDECompVersions getCompVersions();

    /**
     * Gets the technologyTypes (CMR).
     *
     * @return technologyTypes.
     */
    LocalDDETechnologyTypes getTechnologyTypes();

}
