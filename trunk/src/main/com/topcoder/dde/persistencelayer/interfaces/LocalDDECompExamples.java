package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the comp_examples table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompExamples extends EJBLocalObject {

    /**
     * Gets the url.
     *
     * @return url.
     */
    String getUrl();

    /**
     * Sets the url.
     *
     * @param url   url.
     */
    void setUrl(String url);

    /**
     * Gets the description.
     *
     * @return  description.
     */
    String getDescription();

    /**
     * Sets the description.
     *
     * @param description   description.
     */
    void setDescription(String description);

    /**
     * Gets compVersions (CMR).
     *
     * @return compVersions.
     */
    LocalDDECompVersions getCompVersions();

}
