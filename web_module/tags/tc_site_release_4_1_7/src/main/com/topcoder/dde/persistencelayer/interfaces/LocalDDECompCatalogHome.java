package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.sql.Timestamp;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the comp_catalog table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompCatalogHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDECompCatalogEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompCatalog findByPrimaryKey(Long key) throws FinderException;

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
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDECompCatalog create(long currentVersion, String componentName, String description, Timestamp createTime, long statusId,
                               String shortDesc, String functionDesc, long rootCategory) throws CreateException;

    /**
     * Returns a Collection of active LocalDDECompCatalog with the given version.
     *
     * @param version               version.
     * @return a Collection of local interfaces (LocalDDECompCatalog).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByCurrentVersionActive(long version) throws FinderException;

    /**
     * Returns a Collection of LocalDDECompCatalog with the given status id.
     *
     * @param statusId              status id.
     * @return a Collection of local interfaces (LocalDDECompCatalog).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByStatusId(long statusId) throws FinderException;

    /**
     * Returns a Collection of LocalDDECompCatalog objects with the given catalog and status
     * @param catalogId
     * @param statusId
     * @return
     * @throws FinderException
     */
    Collection findByCatalogAndStatus(long catalogId, long statusId) throws FinderException;

}
