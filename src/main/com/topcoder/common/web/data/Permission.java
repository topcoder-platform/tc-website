package com.topcoder.common.web.data;

import java.io.Serializable;
import com.topcoder.common.web.xml.*;
import com.topcoder.common.Log;

public class Permission implements Serializable, Base {
  

  private int SId;
  private Sector Sector;
  private AccessLevel AccessLevel;
  private String Modified;

  public Permission() {
    SId = 0;
    Sector = new Sector();
    AccessLevel = new AccessLevel();
    Modified="";
  }

/*
  public Object clone() 
    throws CloneNotSupportedException, OutOfMemoryError {
    Permission result = null;
    try {
      result = new Permission();
      result.setSId( getSId() );
      result.setSector( (Sector) getSector().clone() );
      result.setAccessLevel( (AccessLevel) getAccessLevel().clone() );
      result.setModified( getModified() );
    } catch (Exception e) {
      Log.msg("common.attr.Permission:clone:ERROR:\n"+e);
    }
    return result;
  } 
*/


  //Set
  public void setSId(int SId) {
    this.SId = SId;
  }

  public void setSector(Sector Sector) {
    this.Sector = Sector;
  }

  public void setAccessLevel(AccessLevel AccessLevel) {
    this.AccessLevel = AccessLevel;
  }

  public void setModified(String Modified) {
    this.Modified = Modified;
  }

  // Get
  public int getSId() {
    return SId;
  }

  public Sector getSector() {
    return Sector;
  }

  public AccessLevel getAccessLevel() {
    return AccessLevel;
  }

  public String getModified() {
    return Modified;
  }

  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("Permission");
      result.addTag( new ValueTag("SId", SId) );
      result.addTag( Sector.getXML() );
      result.addTag( AccessLevel.getXML() );
      result.addTag( new ValueTag("Modified", Modified) );
    }catch (Exception e)  {
      throw new Exception("common.web.data.Permission getXML ERROR: " + e);
    }
    return result;
  }
}

