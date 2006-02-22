package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;
import java.sql.Timestamp;

/**
 * The bean implementation class representing the CMP bean for the comp_catalog table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDECompCatalogBean extends DDEBaseDescStatusBean {

    /**
     * Creates a new instance.
     */
    public DDECompCatalogBean() {
    }

    /**
     * Gets the current version.
     *
     * @return current version.
     */
    public abstract long getCurrentVersion();

    /**
     * Sets the root category.
     *
     * @param rootCategory    root category.
     */
    public abstract void setRootCategory(long rootCategory);


    /**
     * Gets the root category.
     *
     * @return root category
     */
    public abstract long getRootCategory();


    /**
     * Sets the current version.
     *
     * @param currentVersion    current version.
     */
    public abstract void setCurrentVersion(long currentVersion);

    /**
     * Gets the short description.
     *
     * @return  short description.
     */
    public abstract String getShortDesc();

    /**
     * Sets the short description.
     *
     * @param shortDesc     short description.
     */
    public abstract void setShortDesc(String shortDesc);

    /**
     * Gets the component name.
     *
     * @return component name.
     */
    public abstract String getComponentName();

    /**
     * Sets the component name.
     *
     * @param componentName     component name.
     */
    public abstract void setComponentName(String componentName);

    /**
     * Gets the function description.
     *
     * @return  function description.
     */
    public abstract String getFunctionDesc();

    /**
     * Sets the function description.
     *
     * @param functionDesc  function description.
     */
    public abstract void setFunctionDesc(String functionDesc);

    /**
     * Gets the create time.
     *
     * @return create time.
     */
    public abstract Timestamp getCreateTime();

    /**
     * Sets the create time.
     *
     * @param createTime    create time.
     */
    public abstract void setCreateTime(Timestamp createTime);

    /**
     * Creates an entity object.
     *
     * @param currentVersion        current version.
     * @param componentName         component name.
     * @param description           description.
     * @param createTime            create time.
     * @param statusId              status id.
     * @param shortDesc             short description.
     * @param functionDesc          function description.
     * @param rootCategory          root category
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(long currentVersion, String componentName, String description, Timestamp createTime, long statusId,
                          String shortDesc, String functionDesc, long rootCategory) throws CreateException {
        ejbCreate(description, statusId);
        setCurrentVersion(currentVersion);
        setShortDesc(shortDesc);
        setComponentName(componentName);
        setFunctionDesc(functionDesc);
        setCreateTime(createTime);
        setRootCategory(rootCategory);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param currentVersion        current version.
     * @param componentName         component name.
     * @param description           description.
     * @param createTime            create time.
     * @param statusId              status id.
     * @param shortDesc             short description.
     * @param functionDesc          function description.
     * @param rootCategory          root category
     */
    public void ejbPostCreate(long currentVersion, String componentName, String description, Timestamp createTime, long statusId,
                              String shortDesc, String functionDesc, long rootCategory) {
    }
}
