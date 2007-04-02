package com.topcoder.web.common.model;

import java.io.Serializable;

/**
 * @author cucu
= */
public class IntroEventConfig extends Base {

    protected Identifier id = new Identifier();
    protected String value = null;

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
        private Long propertyId = null;


        public Identifier() {

        }


        public Identifier(IntroEvent introEvent, Long propertyId) {
            this.introEvent = introEvent;
            this.propertyId = propertyId;
        }


        public IntroEvent getIntroEvent() {
            return introEvent;
        }


        public void setIntroEvent(IntroEvent introEvent) {
            this.introEvent = introEvent;
        }


        public Long getPropertyId() {
            return propertyId;
        }


        public void setPropertyId(Long propertyId) {
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
