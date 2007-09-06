package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;
import java.sql.Timestamp;

/**
 * The local interface representing the CMP bean for the comp_catalog table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompCatalog extends EJBLocalObject {

    /**
     * Gets the current version.
     *
     * @return current version.
     */
    long getCurrentVersion();

    /**
     * Sets the current version.
     *
     * @param currentVersion    current version.
     */
    void setCurrentVersion(long currentVersion);

    /**
     * Sets the root category.
     *
     * @param rootCategory    root category.
     */
    void setRootCategory(long rootCategory);


    /**
     * Gets the root category.
     *
     * @return root category
     */
    long getRootCategory();


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
     * Gets the create time.
     *
     * @return create time.
     */
    Timestamp getCreateTime();

    /**
     * Gets the component name.
     *
     * @return component name.
     */
    String getComponentName();

    /**
     * Sets the component name.
     *
     * @param componentName     component name.
     */
    void setComponentName(String componentName);

    /**
     * Gets the status id.
     *
     * @return  status id.
     */
    long getStatusId();

    /**
     * Sets the status id.
     *
     * @param statusId  status id.
     */
    void setStatusId(long statusId);

    /**
     * Gets the short description.
     *
     * @return  short description.
     */
    String getShortDesc();

    /**
     * Sets the short description.
     *
     * @param shortDesc     short description.
     */
    void setShortDesc(String shortDesc);

    /**
     * Gets the function description.
     *
     * @return  function description.
     */
    String getFunctionDesc();

    /**
     * Sets the function description.
     *
     * @param functionDesc  function description.
     */
    void setFunctionDesc(String functionDesc);

}
