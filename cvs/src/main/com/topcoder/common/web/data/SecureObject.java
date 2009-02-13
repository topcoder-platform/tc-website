package com.topcoder.common.web.data;

import com.topcoder.common.web.xml.*;
import com.topcoder.common.web.data.*;
import java.io.Serializable;
import java.util.ArrayList;


public abstract class SecureObject
  implements Serializable, Base {

  private int SId;
  private String SIdType;
  private String Modified;
  private ArrayList Permissions;

  public SecureObject() {
    SId = 0;
    SIdType = "";
    Modified = "";
    Permissions = new ArrayList();
  }

  //Set
  public void setSId(int SId) {
    this.SId = SId;
  }

  public void setSIdType(String SIdType) {
    this.SIdType = SIdType;
  }

  public void setModified(String Modified) {
    this.Modified = Modified;
  }

  public void setPermissions(ArrayList Permissions) {
    this.Permissions = Permissions;
  }

  // Get
  public int getSId() {
    return SId;
  }

  public String getSIdType() {
    return SIdType;
  }
  
  public String getModified() {
    return Modified;
  }
  
  public ArrayList getPermissions() {
    return Permissions;
  }
  
  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = getSecureObjectXML();
    } catch (Exception e) {
      throw new Exception("common.web.data.SecureObject:getXML:ERROR:\n"+e);
    }
    return result;
  }

  protected RecordTag getSecureObjectXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("SecureObject");
      result.addTag( new ValueTag("SId", SId) );
      result.addTag( new ValueTag("SIdType", SIdType) );
      result.addTag( new ValueTag("Modified", Modified) );
      for (int i=0; i<Permissions.size(); i++) {
        Permission permission = (Permission) Permissions.get(i);
        result.addTag( permission.getXML() );
      }
    }catch (Exception e)  {
      throw new Exception("common.web.data.SecureObject getSecureObjectXML ERROR: " + e);
    }
    return result;

  }

}

