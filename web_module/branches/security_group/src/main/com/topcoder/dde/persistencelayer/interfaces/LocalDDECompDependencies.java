package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the comp_dependencies table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompDependencies extends EJBLocalObject {

    /**
     * Gets compVersions (CMR).
     *
     * @return compVersions.
     */
    LocalDDECompVersions getCompVersions();

    /**
     * Gets childCompVersions (CMR).
     *
     * @return childCompVersions.
     */
    LocalDDECompVersions getChildCompVersions();

}
