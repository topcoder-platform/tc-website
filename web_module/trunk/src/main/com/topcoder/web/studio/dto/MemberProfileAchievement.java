/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>A DTO for details on submission by this member profile to a single achievement.</p>
 *
 * @author tangzx, TrePe
 * @version 1.1
 */
public class MemberProfileAchievement implements Serializable {
    /**
     * <p>Name of achievement.</p>
     */
    private String name;

    /**
     * <p>Description of achievement.</p>
     */
    private String desc;

    /**
     * <p>Date and time of achievement.</p>
     */
    private Date awardTime;

    /**
     * <p>Rule id (from user_achievement_rule table) of achievement.</p>
     */
    private int achievementRuleId;

    /**
     * <p>Whether achievement can be earned multiple times.</p>
     */
    private boolean hasCurrentlyAt;

    /**
     * <p>Gets achievement name.</p>
     *
     * @return name of achievement.
     */
    public String getName() {
        return name;
    }

    /**
     * <p>Sets achievement name.</p>
     *
     * @param name achievement name.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * <p>Gets achievement description.</p>
     *
     * @return description of achievement.
     */
    public String getDesc() {
        return desc;
    }

    /**
     * <p>Sets achievement description.</p>
     *
     * @param desc achievement description.
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     * <p>Gets achievement earned date.</p>
     *
     * @return earned date of achievement.
     */
    public Date getAwardTime() {
        return awardTime;
    }

    /**
     * <p>Sets achievement earned date.</p>
     *
     * @param awardTime achievement earned date.
     */
    public void setAwardTime(Date awardTime) {
        this.awardTime = awardTime;
    }

    /**
     * <p>Gets achievement rule id.</p>
     *
     * @return rule id of achievement.
     */
    public int getAchievementRuleId() {
        return achievementRuleId;
    }

    /**
     * <p>Sets achievement rule id.</p>
     *
     * @param achievementRuleId achievement rule id.
     */
    public void setAchievementRuleId(int achievementRuleId) {
        this.achievementRuleId = achievementRuleId;
    }

    /**
     * <p>Gets whether achievement can be earned multiple times.</p>
     *
     * @return whether achievement can be earned multiple times.
     * @since 1.1
     */
    public boolean getHasCurrentlyAt() {
        return hasCurrentlyAt;
    }

    /**
     * <p>Sets whether achievement can be earned multiple times.</p>
     *
     * @param hasCurrentlyAt whether achievement can be earned multiple times.
     * @since 1.1
     */
    public void setHasCurrentlyAt(boolean hasCurrentlyAt) {
        this.hasCurrentlyAt = hasCurrentlyAt;
    }
}
