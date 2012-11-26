package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;

/**
 * The base bean implementation class representing the CMP bean with the compVersions CMR field.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEBaseCompVersionsBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDEBaseCompVersionsBean() {
    }

    /**
     * Gets compVersions (CMR).
     *
     * @return compVersions.
     */
    public abstract LocalDDECompVersions getCompVersions();

    /**
     * Sets compVersions (CMR).
     *
     * @param compVersions  compVersions.
     */
    public abstract void setCompVersions(LocalDDECompVersions compVersions);

}
