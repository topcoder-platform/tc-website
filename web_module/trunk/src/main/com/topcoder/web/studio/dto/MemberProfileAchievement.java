/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>A DTO for details on submission by this member profile to a single achievement.</p>
 *
 * @author tangzx
 * @version 1.0
 */
public class MemberProfileAchievement implements Serializable {
    private String name;

    private String desc;

    private Date awardTime;

    private int achievementRuleId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Date getAwardTime() {
        return awardTime;
    }

    public void setAwardTime(Date awardTime) {
        this.awardTime = awardTime;
    }

    public int getAchievementRuleId() {
        return achievementRuleId;
    }

    public void setAchievementRuleId(int achievementRuleId) {
        this.achievementRuleId = achievementRuleId;
    }
}
