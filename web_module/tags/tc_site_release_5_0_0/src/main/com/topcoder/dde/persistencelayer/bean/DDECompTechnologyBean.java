package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDETechnologyTypes;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the comp_technology table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDECompTechnologyBean extends DDEBaseCompVersionsBean {

    /**
     * Creates a new instance.
     */
    public DDECompTechnologyBean() {
    }

    /**
     * Gets the technologyTypes (CMR).
     *
     * @return technologyTypes.
     */
    public abstract LocalDDETechnologyTypes getTechnologyTypes();

    /**
     * Sets the technologyTypes (CMR).
     *
     * @param technologyTypes   technologyTypes.
     */
    public abstract void setTechnologyTypes(LocalDDETechnologyTypes technologyTypes);

    /**
     * Creates an entity object.
     *
     * @param compVersions          compVersions.
     * @param technologyTypes       technologyTypes.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(LocalDDECompVersions compVersions, LocalDDETechnologyTypes technologyTypes) throws CreateException {
        setPrimaryKey();
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param compVersions          compVersions.
     * @param technologyTypes       technologyTypes.
     */
    public void ejbPostCreate(LocalDDECompVersions compVersions, LocalDDETechnologyTypes technologyTypes) {
        setCompVersions(compVersions);
        setTechnologyTypes(technologyTypes);
    }

}
