package com.topcoder.ejb.AuthenticationServices;


public class UserType implements java.io.Serializable, Cloneable {

  private int UserTypeId;
  private String UserTypeDesc;
  private String Modified;


  public UserType() {
    UserTypeId = 0;
    UserTypeDesc = "";
    Modified = "";
  }


  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    UserType result = null;
    try {
      result = new UserType();
      result.setUserTypeId( getUserTypeId() );
      result.setUserTypeDesc( getUserTypeDesc() );
      result.setModified( getModified() );
    } catch (Exception e) {
      e.printStackTrace();
    }
    return result;
  }


  //Set
  public void setUserTypeId(int UserTypeId) {
    this.UserTypeId = UserTypeId;
  }

  public void setUserTypeDesc(String UserTypeDesc) {
    this.UserTypeDesc = UserTypeDesc;
  }

  public void setModified(String Modified) {
    this.Modified = Modified;
  }


  // Get
  public int getUserTypeId() {
    return UserTypeId;
  }

  public String getUserTypeDesc() {
    return UserTypeDesc;
  }

  public String getModified() {
    return Modified;
  }

  
}
