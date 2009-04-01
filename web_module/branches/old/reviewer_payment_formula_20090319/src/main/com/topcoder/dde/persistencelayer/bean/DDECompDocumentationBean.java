package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the comp_documentation table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDECompDocumentationBean extends DDEBaseCompVersionsBean {

    /**
     * Creates a new instance.
     */
    public DDECompDocumentationBean() {
    }

    /**
     * Gets the document name.
     *
     * @return document name.
     */
    public abstract String getDocumentName();

    /**
     * Sets the document name.
     *
     * @param documentName  document name.
     */
    public abstract void setDocumentName(String documentName);

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
     * Gets the document type id.
     *
     * @return document type id.
     */
    public abstract long getDocumentTypeId();

    /**
     * Sets the document type id.
     *
     * @param documentTypeId    document type id.
     */
    public abstract void setDocumentTypeId(long documentTypeId);

    /**
     * Creates an entity object.
     *
     * @param documentTypeId        document type id.
     * @param documentName          document name.
     * @param url                   url.
     * @param compVersions          compVersions.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(long documentTypeId, String documentName, String url, LocalDDECompVersions compVersions)
            throws CreateException {
        setPrimaryKey();
        setDocumentTypeId(documentTypeId);
        setDocumentName(documentName);
        setUrl(url);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param documentTypeId        document type id.
     * @param documentName          document name.
     * @param url                   url.
     * @param compVersions          compVersions.
     */
    public void ejbPostCreate(long documentTypeId, String documentName, String url, LocalDDECompVersions compVersions) {
        setCompVersions(compVersions);
    }

}
