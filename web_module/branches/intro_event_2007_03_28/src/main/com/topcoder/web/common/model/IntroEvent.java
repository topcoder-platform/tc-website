package com.topcoder.web.common.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.topcoder.web.tc.Constants;


/**
 * @author cucu
 */
public class IntroEvent extends Event  {
    private School school = null;
    private Long roundId = null;
    private Long forumId = null;
    private TimeZone timezone = null;
    private Image image = null;
    private Long eligibilityCommandId = null;
    private Set<IntroEventConfig> config;
    private Map<Long, String> configMap = null;
    
    public Long getEligibilityCommandId() {
        return eligibilityCommandId;
    }

    public void setEligibilityCommandId(Long eligibilityCommandId) {
        this.eligibilityCommandId = eligibilityCommandId;
    }

    public Long getForumId() {
        return forumId;
    }

    public void setForumId(Long forumId) {
        this.forumId = forumId;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public Long getRoundId() {
        return roundId;
    }

    public void setRoundId(Long roundId) {
        this.roundId = roundId;
    }

    public TimeZone getTimezone() {
        return timezone;
    }

    public void setTimezone(TimeZone timezone) {
        this.timezone = timezone;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public Set<IntroEventConfig> getConfig() {
        return config;
    }

    public void setConfig(Set<IntroEventConfig> config) {
        this.config = config;
        configMap = null;
    }

    public String getConfig(Long typeId) {
        if (configMap == null) {
            configMap = new HashMap<Long, String>();
            for (IntroEventConfig iec : getConfig()) {
                configMap.put(iec.getId().getPropertyId(), iec.getValue());
            }
        }
        return configMap.get(typeId);
    }

    public String getRecruiterName() {
        return getConfig(new Long(Constants.RECRUITER_NAME_PROP_ID));
    }

    public int getRoundStart() {
        return Integer.parseInt(getConfig(new Long(Constants.ROUND_START_PROP_ID)));
    }
    /*
    public static final int FIRST_PLACE_PROP_ID = 2;
    public static final int SECOND_PLACE_PROP_ID = 3;
    public static final int THIRD_PLACE_PROP_ID = 4;
    public static final int LOCATION_PROP_ID = 5;
    public static final int EVENT_START_PROP_ID = 6;
    public static final int EVENT_END_PROP_ID = 7;
    public static final int RESULTS_PROP_ID = 8;
    public static final int ROUND_START_PROP_ID = 9;
    public static final int ROUND_END_PROP_ID = 10;
    public static final int PAGES_BASE_PROP_ID = 11;
    */

}
