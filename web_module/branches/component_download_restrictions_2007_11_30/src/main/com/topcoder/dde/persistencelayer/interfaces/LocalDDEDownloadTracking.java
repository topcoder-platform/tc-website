package com.topcoder.dde.persistencelayer.interfaces;

import java.sql.Timestamp;

import javax.ejb.EJBLocalObject;
import javax.ejb.FinderException;

/**
 * The local interface representing the CMP bean for the download_tracking table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEDownloadTracking extends EJBLocalObject {

    /**
     * Gets the userMaster (CMR).
     *
     * @return userMaster.
     */
    LocalDDEUserMaster getUserMaster();

    /**
     * Gets compVersions (CMR).
     *
     * @return compVersions.
     */
    LocalDDECompVersions getCompVersions();

    /**
     * Gets the create time.
     *
     * @return create time.
     */
    Timestamp getCreateTime();

    /**
     * Gets the price.
     *
     * @return  price.
     */
    double getPrice();

    /**
     * Gets licenseLevel (CMR).
     *
     * @return  licenseLevel.
     */
    LocalDDELicenseLevel getLicenseLevel();

    /**
     * Gets compDownload (CMR).
     *
     * @return  compDownload.
     */
    LocalDDECompDownload getCompDownload();

    /**
     * Gets the unit cost.
     *
     * @return unit cost.
     */
    long getUnitCost();

    int ejbHomeNumberDownloadsByUserIdComponentId(long userId, long componentId) throws FinderException;
        
}

