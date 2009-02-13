package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.catalog.ComponentManagerBean;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;
import com.topcoder.dde.persistencelayer.keys.CompForumXrefKey;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the comp_jive_category_xref table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDECompForumXrefBean extends DDEBaseCompVersionsBean {
    
    /**
     * Creates a new instance.
     */
    public DDECompForumXrefBean() {
    }
    
    /**
     * Gets the category id.
     *
     * @return category id.
     */
    public abstract long getCategoryId();

    /**
     * Sets the category id.
     *
     * @param categoryId       category id.
     */
    public abstract void setCategoryId(long categoryId);
    
    /**
     * Gets the component version id.
     *
     * @return component version id.
     */
    public abstract long getCompVersId();

    /**
     * Sets the component version id.
     *
     * @param compVersId       component version id.
     */
    public abstract void setCompVersId(long compVersId);

    /**
     * Creates an entity object.
     *
     * @param categoryId			category id.
     * @param compVersId            component version id.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public CompForumXrefKey ejbCreate(long categoryId, long compVersId) throws CreateException {
        setCategoryId(categoryId);
        setCompVersId(compVersId);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param categoryId			category id.
     * @param compVersId            component version id.
     */
    public void ejbPostCreate(long categoryId, long compVersId) {
    }

}
