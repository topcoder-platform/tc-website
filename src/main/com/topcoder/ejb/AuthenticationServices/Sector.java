package com.topcoder.ejb.AuthenticationServices;


public class Sector implements java.io.Serializable {

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
  

}

