package com.topcoder.common.web.data;

import java.io.Serializable;
import java.sql.Timestamp;

public class EventVerify implements Serializable {

    private int EventId;
    private int EventTypeId;
    private String EventDesc;
    private String Status;
    private Timestamp startRegistration;
    private Timestamp endRegistration;

    public EventVerify() {
        EventTypeId = 0;
        EventId = 0;
        EventDesc = "";
        Status = "";
    }

// set
    public void setEventTypeId(int EventTypeId) {
        this.EventTypeId = EventTypeId;
    }

    public void setEventId(int EventId) {
        this.EventId = EventId;
    }

    public void setEventDesc(String EventDesc) {
        this.EventDesc = EventDesc;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public void setStartRegistration(Timestamp startRegistration) {
        this.startRegistration = startRegistration;
    }

    public void setEndRegistration(Timestamp endRegistration) {
        this.endRegistration = endRegistration;
    }

// get
    public String getStatus() {
        return Status;
    }

    public int getEventId() {
        return EventId;
    }

    public int getEventTypeId() {
        return EventTypeId;
    }

    public String getEventDesc() {
        return EventDesc;
    }

    public Timestamp getStartRegistration() {
        return this.startRegistration;
    }

    public Timestamp getEndRegistration() {
        return this.endRegistration;
    }

}
