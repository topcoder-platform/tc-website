package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the comp_keywords table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDECompKeywordsBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDECompKeywordsBean() {
    }

    /**
     * Gets the keyword.
     *
     * @return keyword.
     */
    public abstract String getKeyword();

    /**
     * Sets the keyword.
     *
     * @param keyword   keyword.
     */
    public abstract void setKeyword(String keyword);

    /**
     * Gets an instance of LocalDDECompCatalog (CMR).
     *
     * @return an instance of LocalDDECompCatalog.
     */
    public abstract LocalDDECompCatalog getCompCatalog();

    /**
     * Sets an instance of LocalDDECompCatalog (CMR).
     *
     * @param compCatalog   compCatalog.
     */
    public abstract void setCompCatalog(LocalDDECompCatalog compCatalog);

    /**
     * Creates an entity object.
     *
     * @param keyword               keyword.
     * @param compCatalog           compCatalog.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(String keyword, LocalDDECompCatalog compCatalog) throws CreateException {
        setPrimaryKey();
        setKeyword(keyword);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param keyword               keyword.
     * @param compCatalog           compCatalog.
     */
    public void ejbPostCreate(String keyword, LocalDDECompCatalog compCatalog) {
        setCompCatalog(compCatalog);
    }

}
