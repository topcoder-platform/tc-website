package com.topcoder.ejb.AuthenticationServices;


public class Permission implements java.io.Serializable {


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


}

