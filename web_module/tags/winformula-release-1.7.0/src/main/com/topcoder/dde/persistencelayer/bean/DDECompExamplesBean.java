package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the comp_examples table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDECompExamplesBean extends DDEBaseDescriptionBean {

    /**
     * Creates a new instance.
     */
    public DDECompExamplesBean() {
    }

    /**
     * Gets the url.
     *
     * @return url.
     */
    public abstract String getUrl();

    /**
     * Sets the url.
     *
     * @param url   url.
     */
    public abstract void setUrl(String url);

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

    /**
     * Creates an entity object.
     *
     * @param url                   url.
     * @param description           description.
     * @param compVersions          compVersions.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(String url, String description, LocalDDECompVersions compVersions) throws CreateException {
        ejbCreate(description);
        setUrl(url);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param url                   url.
     * @param description           description.
     * @param compVersions          compVersions.
     */
    public void ejbPostCreate(String url, String description, LocalDDECompVersions compVersions) {
        setCompVersions(compVersions);
    }

}
