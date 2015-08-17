package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;

public class Event implements Serializable, TagRenderer {

    private int EventId;
    private int EventTypeId;
    private String EventDesc;
    private String Status;
    private EventType eventType;

    public Event() {
        EventTypeId = 0;
        EventId = 0;
        EventDesc = "";
        Status = "";
        eventType = new EventType();
    }

// set
    public void setEventTypeId(int EventTypeId) {
        this.EventTypeId = EventTypeId;
    }

    public void setEventId(int EventId) {
        this.EventId = EventId;
    }

    public void setEventType(EventType eventType) {
        this.eventType = eventType;
    }

    public void setEventDesc(String EventDesc) {
        this.EventDesc = EventDesc;
    }

    public void setStatus(String Status) {
        this.Status = Status;
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

    public EventType getEventType() {
        return eventType;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Event");
            result.addTag(new ValueTag("EventId", EventId));
            result.addTag(new ValueTag("EventTypeId", EventTypeId));
            result.addTag(new ValueTag("EventDesc", EventDesc));
            result.addTag(new ValueTag("Status", Status));
            result.addTag(eventType.getXML());
        } catch (Exception e) {
            throw new Exception("common.Event getXML ERROR: " + e);
        }
        return result;
    }

}

