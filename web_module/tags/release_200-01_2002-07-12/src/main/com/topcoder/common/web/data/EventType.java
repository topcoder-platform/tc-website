package com.topcoder.common.web.data;

import java.io.Serializable;
import java.sql.Date;

import com.topcoder.common.web.xml.*;

public class EventType implements Serializable, Base {

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
      result.addTag( new ValueTag("EventTypeId", EventTypeId) );
      result.addTag( new ValueTag("EventDesc", EventTypeDesc) );
    } catch (Exception e)  {
      throw new Exception("common.EventTypeAttriubtes getXML ERROR: " + e);
    }
    return result;
  }
  
}

