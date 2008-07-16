package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the comp_dependencies table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDECompDependenciesBean extends DDEBaseCompVersionsBean {

    /**
     * Creates a new instance.
     */
    public DDECompDependenciesBean() {
    }

    /**
     * Gets childCompVersions (CMR).
     *
     * @return childCompVersions.
     */
    public abstract LocalDDECompVersions getChildCompVersions();

    /**
     * Gets the child compVersions (CMR).
     *
     * @param compVersions  child compVersions.
     */
    public abstract void setChildCompVersions(LocalDDECompVersions compVersions);

    /**
     * Creates an entity object.
     *
     * @param version               version.
     * @param childVersion          childVersion.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(LocalDDECompVersions version, LocalDDECompVersions childVersion) throws CreateException {
        setPrimaryKey();
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param version               version.
     * @param childVersion          childVersion.
     */
    public void ejbPostCreate(LocalDDECompVersions version, LocalDDECompVersions childVersion) {
        setCompVersions(version);
        setChildCompVersions(childVersion);
    }

}
