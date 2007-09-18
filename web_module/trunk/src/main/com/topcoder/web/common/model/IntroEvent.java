package com.topcoder.web.common.model;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;


/**
 * @author cucu
 */
public class IntroEvent extends Event {
    private School school = null;
    private Long roundId = null;
    private Long forumId = null;
    private TimeZone timeZone = null;
    private Image image = null;
    private Long eligibilityCommandId = null;
    private Map<Integer, IntroEventConfig> config = new HashMap<Integer, IntroEventConfig>();

    // formula fields
    private Timestamp roundStart = null;
    private Timestamp roundEnd = null;
    private String roundName = null;


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

    public Map<Integer, IntroEventConfig> getConfig() {
        return Collections.unmodifiableMap(config);
    }

    public IntroEventConfig getConfig(Integer typeId) {
        return config.get(typeId);
    }

    public void addConfig(IntroEventConfig iec) {
        config.put(iec.getId().getPropertyId(), iec);
    }

    public void updateConfig(IntroEventConfig iec) {
        config.remove(iec.getId().getPropertyId());
        config.put(iec.getId().getPropertyId(), iec);
    }


    public String getRecruiterName() {
        return getConfig(IntroEventConfig.RECRUITER_NAME_PROP_ID).getValue();
    }

    public String getFirstPlacePrize() {
        return getConfig(IntroEventConfig.FIRST_PLACE_PROP_ID).getValue();
    }

    public String getSecondPlacePrize() {
        return getConfig(IntroEventConfig.SECOND_PLACE_PROP_ID).getValue();
    }

    public String getThirdPlacePrize() {
        return getConfig(IntroEventConfig.THIRD_PLACE_PROP_ID).getValue();
    }

    public String getLocation() {
        return getConfig(IntroEventConfig.LOCATION_PROP_ID).getValue();
    }

    public int getEventStartDelta() {
        return Integer.parseInt(getConfig(IntroEventConfig.EVENT_START_PROP_ID).getValue());
    }

    public int getEventEndDelta() {
        return Integer.parseInt(getConfig(IntroEventConfig.EVENT_END_PROP_ID).getValue());
    }

    public int getResultsDelta() {
        return Integer.parseInt(getConfig(IntroEventConfig.RESULTS_PROP_ID).getValue());
    }

    public String getPagesBase() {
        return getConfig(IntroEventConfig.PAGES_BASE_PROP_ID).getValue();
    }

    public Timestamp getRoundStart() {
        return roundStart;
    }

    public Timestamp getRoundEnd() {
        return roundEnd;
    }

    public String getRoundName() {
        return roundName;
    }

}
