package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;

public class EventType implements Serializable, TagRenderer {

    private int EventTypeId;
    private String EventTypeDesc;

    public EventType() {
        EventTypeId = 0;
        EventTypeDesc = "";
    }

// set
    public void setEventTypeId(int EventTypeId) {
        this.EventTypeId = EventTypeId;
    }

    public void setEventTypeDesc(String EventTypeDesc) {
        this.EventTypeDesc = EventTypeDesc;
    }
// get
    public int getEventTypeId() {
        return EventTypeId;
    }

    public String getEventTypeDesc() {
        return EventTypeDesc;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("EventType");
            result.addTag(new ValueTag("EventTypeId", EventTypeId));
            result.addTag(new ValueTag("EventDesc", EventTypeDesc));
        } catch (Exception e) {
            throw new Exception("common.EventTypeAttriubtes getXML ERROR: " + e);
        }
        return result;
    }

}

