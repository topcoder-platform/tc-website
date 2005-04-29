package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;

import javax.ejb.CreateException;
import java.sql.Timestamp;

/**
 * The bean implementation class representing the CMP bean for the comp_versions table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDECompVersionsBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDECompVersionsBean() {
    }

    /**
     * Gets the version.
     *
     * @return version.
     */
    public abstract long getVersion();

    /**
     * Sets the version.
     *
     * @param version   version.
     */
    public abstract void setVersion(long version);

    /**
     * Gets the version text.
     *
     * @return  version text.
     */
    public abstract String getVersionText();

    /**
     * Sets the version text.
     *
     * @param versionText   version text.
     */
    public abstract void setVersionText(String versionText);

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
     * Gets the phase time.
     *
     * @return phase time.
     */
    public abstract Timestamp getPhaseTime();

    /**
     * Sets the phase time.
     *
     * @param phaseTime     phase time.
     */
    public abstract void setPhaseTime(Timestamp phaseTime);

    /**
     * Gets the price.
     *
     * @return price.
     */
    public abstract double getPrice();

    /**
     * Sets the price.
     *
     * @param price price.
     */
    public abstract void setPrice(double price);

    /**
     * Gets the comments.
     *
     * @return comments.
     */
    public abstract String getComments();

    /**
     * Sets the comments.
     *
     * @param comments  comments.
     */
    public abstract void setComments(String comments);

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
     * Gets the phase id.
     *
     * @return phase id.
     */
    public abstract long getPhaseId();

    /**
     * Sets the phase id.
     *
     * @param phaseId   phase id.
     */
    public abstract void setPhaseId(long phaseId);

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
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(long version, Timestamp createTime, long phaseId, Timestamp phaseTime, double price, String comments,
                          LocalDDECompCatalog compCatalog, String versionText) throws CreateException {
        setPrimaryKey();
        setVersion(version);
        setVersionText(versionText);
        setCreateTime(createTime);
        setPhaseId(phaseId);
        setPhaseTime(phaseTime);
        setPrice(price);
        setComments(comments);
        return null;
    }

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
     */
    public void ejbPostCreate(long version, Timestamp createTime, long phaseId, Timestamp phaseTime, double price, String comments,
                              LocalDDECompCatalog compCatalog, String versionText) {
        setCompCatalog(compCatalog);
    }

}
