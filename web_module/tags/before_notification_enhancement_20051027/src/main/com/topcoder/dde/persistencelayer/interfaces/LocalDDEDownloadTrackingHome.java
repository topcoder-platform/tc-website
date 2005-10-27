package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.sql.Timestamp;

/**
 * The local home interface representing the CMP bean for the download_tracking table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEDownloadTrackingHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDEDownloadTrackingEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDEDownloadTracking findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param price                 price.
     * @param createTime            create time.
     * @param compVersions          compVersions.
     * @param userMaster            userMaster.
     * @param licenseLevel          licenseLevel.
     * @param compDownload          compDownload.
     * @param unitCost              unitCost.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDEDownloadTracking create(double price, Timestamp createTime, LocalDDECompVersions compVersions,
                                    LocalDDEUserMaster userMaster, LocalDDELicenseLevel licenseLevel, LocalDDECompDownload compDownload, long unitCost)
            throws CreateException;

}
