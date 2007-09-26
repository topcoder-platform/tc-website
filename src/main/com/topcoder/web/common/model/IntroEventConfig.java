package com.topcoder.web.common.model;

import java.io.Serializable;

/**
 * @author cucu
 */
public class IntroEventConfig extends Base {

    protected Identifier id = new Identifier();
    protected String value = null;

    public static final Integer RECRUITER_NAME_PROP_ID = 1;
    public static final Integer FIRST_PLACE_PROP_ID = 2;
    public static final Integer SECOND_PLACE_PROP_ID = 3;
    public static final Integer THIRD_PLACE_PROP_ID = 4;
    public static final Integer LOCATION_PROP_ID = 5;
    public static final Integer EVENT_START_PROP_ID = 6;
    public static final Integer EVENT_END_PROP_ID = 7;
    public static final Integer RESULTS_PROP_ID = 8;
    public static final Integer PAGES_BASE_PROP_ID = 11;
    public static final Integer SHOW_RESULTS_PROP_ID = 13;
    public static final Integer PRESENTATION_PROP_ID = 14;
    public static final Integer FOOD_PROP_ID = 15;
    public static final Integer PRIZES_PROP_ID = 16;
    public static final Integer FOOD_PRESENTATION_PROP_ID = 17;
    public static final Integer LECTURE_DATE = 18;
    public static final Integer LECTURE_START_TIME = 19;
    public static final Integer LECTURE_END_TIME = 20;
    public static final Integer LECTURE_LOCATION = 21;

    @Deprecated
    public static final Integer ROUND_START_PROP_ID = 9;

    @Deprecated
    public static final Integer ROUND_END_PROP_ID = 10;

    public IntroEventConfig() {
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public static class Identifier implements Serializable {

        private IntroEvent introEvent = null;
        private Integer propertyId = null;


        public Identifier() {

        }


        public Identifier(IntroEvent introEvent, Integer propertyId) {
            this.introEvent = introEvent;
            this.propertyId = propertyId;
        }


        public IntroEvent getIntroEvent() {
            return introEvent;
        }


        public void setIntroEvent(IntroEvent introEvent) {
            this.introEvent = introEvent;
        }


        public Integer getPropertyId() {
            return propertyId;
        }


        public void setPropertyId(Integer propertyId) {
            this.propertyId = propertyId;
        }


        public boolean equals(Object o) {

            if (o == null || !(o instanceof IntroEventConfig.Identifier)) {
                return false;
            }
            IntroEventConfig.Identifier iec = (IntroEventConfig.Identifier) o;
            return iec.getIntroEvent().getId().equals(this.getIntroEvent().getId())
                    && iec.getPropertyId().equals(this.getPropertyId());
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(getIntroEvent().getId());
            buf.append(" ");
            buf.append(getPropertyId());
            return buf.toString().hashCode();
        }
    }


}
