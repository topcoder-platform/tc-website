package com.topcoder.ejb.AuthenticationServices;


public final class AccessLevel implements java.io.Serializable {

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


}

