package com.topcoder.ejb.AuthenticationServices;


public class Group 
  extends SecureObject 
  implements java.io.Serializable, PermissionAssignee {


  private String groupDesc;
  private String modified;


  public Group () {
    super();
    groupDesc = "";
  }


  //Set
  public void setGroups ( java.util.ArrayList groups ) throws Exception {
    //required by interface
  }

  public void setGroupId(int groupId) {
    setSId(groupId);
  }

  public void setGroupDesc(String groupDesc) {
  this.groupDesc = groupDesc;
  }


  // Get
  public java.util.ArrayList getGroups() {
    //required by interface...
    return null; 
  }

  public int getGroupId() {
    return super.getSId();
  }

  public String getGroupDesc() {
    return groupDesc;
  }


  
}

