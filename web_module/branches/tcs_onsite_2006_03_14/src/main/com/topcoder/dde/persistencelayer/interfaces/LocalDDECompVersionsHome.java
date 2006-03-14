package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.sql.Timestamp;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the comp_versions table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompVersionsHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDECompVersionsEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompVersions findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param version               version.
     * @param createTime            create time.
     * @param phaseId               phase id.
     * @param phaseTime             phase time.
     * @param price                 price.
     * @param comments              comments.
     * @param compCatalog           compCatalog.
     * @param versionText           version text.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDECompVersions create(long version, Timestamp createTime, long phaseId, Timestamp phaseTime, double price,
                                String comments, LocalDDECompCatalog compCatalog, String versionText) throws CreateException;

    /**
     * Returns a instance of LocalDDECompVersions with the given component id and version.
     *
     * @param componentId           component id.
     * @param version               version.
     * @return a local interface (LocalDDECompVersions).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompVersions findByComponentIdAndVersion(long componentId, long version) throws FinderException;

    /**
     * Returns a Collection of LocalDDECompVersions with the given component id.
     *
     * @param componentId           component id.
     * @return a Collection of local interfaces (LocalDDECompVersions).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByComponentId(long componentId) throws FinderException;

}
