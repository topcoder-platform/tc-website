package com.topcoder.common.web.data;

import java.io.Serializable;
import com.topcoder.common.web.xml.*;
import com.topcoder.common.Log;

public final class AccessLevel implements Serializable, Base {

  private int AccessLevelId;
  private String AccessLevelDescription;
  private String Modified;

  public AccessLevel() {
    AccessLevelId = 0;
    AccessLevelDescription = "";
    Modified = "";
  }

  public AccessLevel ( int AccessLevelId, String AccessLevelDescription, String Modified ) {
    this.AccessLevelId = AccessLevelId;
    this.AccessLevelDescription = AccessLevelDescription;
    this.Modified = Modified;
  }

/*
  public Object clone() 
    throws CloneNotSupportedException, OutOfMemoryError {
    AccessLevelAttributes result = null;
    try {
      result = new AccessLevelAttributes();
      result.setAccessLevelId( getAccessLevelId() );
      result.setAccessLevelDescription( getAccessLevelDescription() );
      result.setModified( getModified() );
    } catch (Exception e) {
      Log.msg("common.attr.AccessLevelAttributes:clone:ERROR:\n"+e);
    }
    return result;
  }
*/

  //Set
  public void setAccessLevelId(int AccessLevelId) {
    this.AccessLevelId = AccessLevelId;
  }

  public void setAccessLevelDescription(String AccessLevelDescription) {
  this.AccessLevelDescription = AccessLevelDescription;
  }

  public void setModified(String Modified) {
    this.Modified = Modified;
  }

  // Get
  public int getAccessLevelId() {
    return AccessLevelId;
  }

  public String getAccessLevelDescription() {
    return AccessLevelDescription;
  }
  
  public String getModified() {
    return Modified;
  }

  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("AccessLevel");
      result.addTag( new ValueTag("AccessLevelId", AccessLevelId) );
      result.addTag( new ValueTag("AccessLevelDescription", AccessLevelDescription) );
      result.addTag( new ValueTag("Modified", Modified) );
    }catch (Exception e)  {
      throw new Exception("common.web.data.AccessLevel getXML ERROR: " + e);
    }
    return result;
  }
}

