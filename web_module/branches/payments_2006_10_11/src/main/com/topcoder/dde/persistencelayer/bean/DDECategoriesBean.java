package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the categories table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDECategoriesBean extends DDEBaseDescStatusNameBean {

    /**
     * Creates a new instance.
     */
    public DDECategoriesBean() {
    }

    /**
     * Gets the parent category id.
     *
     * @return  parent category id.
     */
    public abstract Long getParentCategoryId();

    /**
     * Sets the parent category id.
     *
     * @param parentCategoryId  parent category id.
     */
    public abstract void setParentCategoryId(Long parentCategoryId);

    /**
     * Creates an entity object.
     *
     * @param parentCategoryId      parent category id.
     * @param name                  name.
     * @param description           description.
     * @param statusId              status id.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(Long parentCategoryId, String name, String description, long statusId) throws CreateException {
        ejbCreate(name, description, statusId);
        setParentCategoryId(parentCategoryId);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param parentCategoryId      parent category id.
     * @param name                  name.
     * @param description           description.
     * @param statusId              status id.
     */
    public void ejbPostCreate(Long parentCategoryId, String name, String description, long statusId) {
    }

}
