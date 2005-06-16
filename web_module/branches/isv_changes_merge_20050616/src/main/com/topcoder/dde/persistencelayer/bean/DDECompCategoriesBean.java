package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECategories;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the comp_categories table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDECompCategoriesBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDECompCategoriesBean() {
    }

    /**
     * Gets an instance of LocalDDECategories (CMR).
     *
     * @return an instance of LocalDDECategories.
     */
    public abstract LocalDDECategories getCategories();

    /**
     * Sets an instance of LocalDDECategories (CMR).
     *
     * @param categories    categories.
     */
    public abstract void setCategories(LocalDDECategories categories);

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
     * @param catalog               compCatalog.
     * @param categories            categories.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(LocalDDECompCatalog catalog, LocalDDECategories categories) throws CreateException {
        setPrimaryKey();
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param catalog               compCatalog.
     * @param categories            categories.
     */
    public void ejbPostCreate(LocalDDECompCatalog catalog, LocalDDECategories categories) {
        setCompCatalog(catalog);
        setCategories(categories);
    }

}
