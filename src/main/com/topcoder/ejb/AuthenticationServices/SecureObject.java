package com.topcoder.ejb.AuthenticationServices;


public abstract class SecureObject implements java.io.Serializable {


  private int SId;
  private String SIdType;
  private String Modified;
  private java.util.ArrayList Permissions;


  public SecureObject() {
    SId = 0;
    SIdType = "";
    Modified = "";
    Permissions = new java.util.ArrayList();
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

  public void setPermissions(java.util.ArrayList Permissions) {
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
  
  public java.util.ArrayList getPermissions() {
    return Permissions;
  }
  

}

