package com.topcoder.web.common.model;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.topcoder.web.tc.Constants;


/**
 * @author cucu
 */
@SuppressWarnings("serial")
public class IntroEvent extends Event  {
    private School school = null;
    private Long roundId = null;
    private Long forumId = null;
    private TimeZone timeZone = null;
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

    public TimeZone getTimeZone() {
        return timeZone;
    }

    public void setTimezone(TimeZone timeZone) {
        this.timeZone = timeZone;
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

    public String getFirstPlacePrize() {
        return getConfig(new Long(Constants.FIRST_PLACE_PROP_ID));
    }

    public String getSecondPlacePrize() {
        return getConfig(new Long(Constants.SECOND_PLACE_PROP_ID));
    }

    public String getThirdPlacePrize() {
        return getConfig(new Long(Constants.THIRD_PLACE_PROP_ID));
    }

    public String getLocation() {
        return getConfig(new Long(Constants.LOCATION_PROP_ID));
    }

    public int getEventStartDelta() {
        return Integer.parseInt(getConfig(new Long(Constants.EVENT_START_PROP_ID)));
    }
    
    public int getEventEndDelta() {
        return Integer.parseInt(getConfig(new Long(Constants.EVENT_END_PROP_ID)));
    }

    public int getResultsDelta() {
        return Integer.parseInt(getConfig(new Long(Constants.RESULTS_PROP_ID)));
    }

    public String getPagesBase() {
        return getConfig(new Long(Constants.PAGES_BASE_PROP_ID));
    }
   

}
