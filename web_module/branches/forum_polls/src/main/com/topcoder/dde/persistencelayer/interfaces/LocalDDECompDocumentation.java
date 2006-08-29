package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the comp_documentation table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompDocumentation extends EJBLocalObject {

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
     * Gets compVersions (CMR).
     *
     * @return compVersions.
     */
    LocalDDECompVersions getCompVersions();

    /**
     * Gets the document name.
     *
     * @return document name.
     */
    String getDocumentName();

    /**
     * Sets the document name.
     *
     * @param documentName  document name.
     */
    void setDocumentName(String documentName);

    /**
     * Gets the document type id.
     *
     * @return document type id.
     */
    long getDocumentTypeId();

    /**
     * Sets the document type id.
     *
     * @param documentTypeId    document type id.
     */
    void setDocumentTypeId(long documentTypeId);

}
