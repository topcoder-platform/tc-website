/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.badge;

import java.util.Date;

/**
 * <p>
 * This class is an OO representation of an achievement badge.
 * </p>
 * <p>
 * <strong>Thread Safety: </strong> It's mutable and not thread safe.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 * @since 1.0
 */
public class BadgeDTO {
    
    /**
     * Achievement rule name
     */
    private String achievementName;
    
    /**
     * Achievement rule id.
     */
    private long achievementId;
    
    /**
     * Achievement type, be it Studio, Copilot or Software.
     */
    private String achievementType;
    
    /**
     * Indicate if the badge is assigned automatically.
     */
    private boolean isAutomated;
    
    /**
     * Date of the earning.
     */
    private Date earnedDate;

    /**
     * <p>
     * Getter of achievementName field.
     * </p>
     *
     * @return the achievementName
     */
    public String getAchievementName() {
        return achievementName;
    }

    /**
     * <p>
     * Setter of achievementName field.
     * </p>
     *
     * @param achievementName the achievementName to set
     */
    public void setAchievementName(String achievementName) {
        this.achievementName = achievementName;
    }

    /**
     * <p>
     * Getter of achievementId field.
     * </p>
     *
     * @return the achievementId
     */
    public long getAchievementId() {
        return achievementId;
    }

    /**
     * <p>
     * Setter of achievementId field.
     * </p>
     *
     * @param achievementId the achievementId to set
     */
    public void setAchievementId(long achievementId) {
        this.achievementId = achievementId;
    }

    /**
     * <p>
     * Getter of achievementType field.
     * </p>
     *
     * @return the achievementType
     */
    public String getAchievementType() {
        return achievementType;
    }

    /**
     * <p>
     * Setter of achievementType field.
     * </p>
     *
     * @param achievementType the achievementType to set
     */
    public void setAchievementType(String achievementType) {
        this.achievementType = achievementType;
    }

    /**
     * <p>
     * Getter of isAutomated field.
     * </p>
     *
     * @return the isAutomated
     */
    public boolean isAutomated() {
        return isAutomated;
    }

    /**
     * <p>
     * Setter of isAutomated field.
     * </p>
     *
     * @param isAutomated the isAutomated to set
     */
    public void setAutomated(boolean isAutomated) {
        this.isAutomated = isAutomated;
    }

    /**
     * <p>
     * Getter of earnedDate field.
     * </p>
     *
     * @return the earnedDate
     */
    public Date getEarnedDate() {
        return earnedDate;
    }

    /**
     * <p>
     * Setter of earnedDate field.
     * </p>
     *
     * @param earnedDate the earnedDate to set
     */
    public void setEarnedDate(Date earnedDate) {
        this.earnedDate = earnedDate;
    }
}
