package com.topcoder.common.web.data;

import com.topcoder.common.web.xml.*;
import com.topcoder.common.Log;
import java.io.Serializable;

public class Sector implements Serializable, Base {
  

  private int SectorId;
  private String SectorDesc;
  private String Modified;

  public Sector() {
    SectorId = 0;
    SectorDesc = "";
    Modified="";
  }

  public Sector( int SectorId, String SectorDesc, String Modified ) {
    this.SectorId   = SectorId;
    this.SectorDesc = SectorDesc;
    this.Modified   = Modified;
  }

/*
  public Object clone() 
    throws CloneNotSupportedException, OutOfMemoryError {
    SectorAttributes result = null;
    try {
      result = new SectorAttributes();
      result.setSectorId( getSectorId() );
      result.setSectorDesc( getSectorDesc() );
      result.setModified( getModified() );
    } catch (Exception e) {
      Log.msg("common.attr.SectorAttributes:clone:ERROR:\n"+e);
    }
    return result;
  }
*/


  //Set
  public void setSectorId(int SectorId) {
    this.SectorId = SectorId;
  }

  public void setSectorDesc(String SectorDesc) {
    this.SectorDesc = SectorDesc;
  }

  public void setModified(String Modified) {
    this.Modified = Modified;
  }

  // Get
  public int getSectorId() {
    return SectorId;
  }

  public String getSectorDesc() {
    return SectorDesc;
  }
  
  public String getModified() {
    return Modified;
  }
  
  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("Sector");
      result.addTag( new ValueTag("SectorId", SectorId) );
      result.addTag( new ValueTag("SectorDesc", SectorDesc) );
      result.addTag( new ValueTag("Modified", Modified) );
    }catch (Exception e)  {
      throw new Exception("common.web.data.Sector getXML ERROR: " + e);
    }
    return result;
  }
}

