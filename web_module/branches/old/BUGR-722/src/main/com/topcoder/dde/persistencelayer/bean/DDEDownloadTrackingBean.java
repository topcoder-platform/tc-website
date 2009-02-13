package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompDownload;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDELicenseLevel;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;

import javax.ejb.CreateException;
import javax.ejb.FinderException;

import java.sql.Timestamp;

/**
 * The bean implementation class representing the CMP bean for the download_tracking table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEDownloadTrackingBean extends DDEBaseCompVersionsBean {

    /**
     * Creates a new instance.
     */
    public DDEDownloadTrackingBean() {
    }

    /**
     * Gets the userMaster (CMR).
     *
     * @return userMaster.
     */
    public abstract LocalDDEUserMaster getUserMaster();

    /**
     * Sets the userMaster (CMR).
     *
     * @param userMaster    userMaster.
     */
    public abstract void setUserMaster(LocalDDEUserMaster userMaster);

    /**
     * Gets the unit cost.
     *
     * @return unit cost.
     */
    public abstract long getUnitCost();

    /**
     * Sets the unit cost.
     *
     * @param unitCost
     */
    public abstract void setUnitCost(long unitCost);

    /**
     * Gets the price.
     *
     * @return  price.
     */
    public abstract double getPrice();

    /**
     * Sets the price.
     *
     * @param price     price.
     */
    public abstract void setPrice(double price);

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
     * Gets licenseLevel (CMR).
     *
     * @return  licenseLevel.
     */
    public abstract LocalDDELicenseLevel getLicenseLevel();

    /**
     * Sets licenseLevel (CMR).
     *
     * @param licenseLevel  licenseLevel.
     */
    public abstract void setLicenseLevel(LocalDDELicenseLevel licenseLevel);

    /**
     * Gets compDownload (CMR).
     *
     * @return  compDownload.
     */
    public abstract LocalDDECompDownload getCompDownload();

    /**
     * Sets compDownload (CMR).
     *
     * @param compDownload  compDownload.
     */
    public abstract void setCompDownload(LocalDDECompDownload compDownload);

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
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(double price, Timestamp createTime, LocalDDECompVersions compVersions, LocalDDEUserMaster userMaster,
                          LocalDDELicenseLevel licenseLevel, LocalDDECompDownload compDownload, long unitCost) throws CreateException {
        setPrimaryKey();
        setPrice(price);
        setUnitCost(unitCost);
        setCreateTime(createTime);
        return null;
    }

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
     */
    public void ejbPostCreate(double price, Timestamp createTime, LocalDDECompVersions compVersions, LocalDDEUserMaster userMaster,
                              LocalDDELicenseLevel licenseLevel, LocalDDECompDownload compDownload, long unitCost) {
        setCompVersions(compVersions);
        setUserMaster(userMaster);
        setLicenseLevel(licenseLevel);
        setCompDownload(compDownload);
    }

    /**
     * Select methods. These are implemented by the container. 
     *
     * These methods are NOT exposed in the bean's home interface.
     */
    public abstract int ejbSelectNumberComponentDownloadsByUserId(long userId) throws FinderException;


    
    /**
     * Begin buisness logic methods that use select methods.
     * 
     * These methods are exposed in the bean's home interfaces.
     */
    
    /**
     * Finds the number of downloads for a particular user id
     * 
     * @param userId the user id to look for
     * @return the number of downloads for the specified user
     * @throws FinderException an application level error occurred during the find operation.
     */
    public int ejbHomeNumberComponentDownloadsByUserId(long userId) throws FinderException {
        return this.ejbSelectNumberComponentDownloadsByUserId(userId);
    }

}
