package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;
import java.sql.Timestamp;

/**
 * The local interface representing the CMP bean for the comp_versions table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompVersions extends EJBLocalObject {

    /**
     * Gets the version.
     *
     * @return version.
     */
    long getVersion();

    /**
     * Gets the create time.
     *
     * @return create time.
     */
    Timestamp getCreateTime();

    /**
     * Gets the phase time.
     *
     * @return phase time.
     */
    Timestamp getPhaseTime();

    /**
     * Sets the phase time.
     *
     * @param phaseTime     phase time.
     */
    void setPhaseTime(Timestamp phaseTime);

    /**
     * Gets the price.
     *
     * @return price.
     */
    double getPrice();

    /**
     * Sets the price.
     *
     * @param price price.
     */
    void setPrice(double price);

    /**
     * Gets the comments.
     *
     * @return comments.
     */
    String getComments();

    /**
     * Sets the comments.
     *
     * @param comments  comments.
     */
    void setComments(String comments);

    /**
     * Gets an instance of LocalDDECompCatalog (CMR).
     *
     * @return an instance of LocalDDECompCatalog.
     */
    LocalDDECompCatalog getCompCatalog();

    /**
     * Gets the phase id.
     *
     * @return phase id.
     */
    long getPhaseId();

    /**
     * Sets the phase id.
     *
     * @param phaseId   phase id.
     */
    void setPhaseId(long phaseId);

    /**
     * Gets the version text.
     *
     * @return  version text.
     */
    String getVersionText();

    /**
     * Sets the version text.
     *
     * @param versionText   version text.
     */
    void setVersionText(String versionText);

}
