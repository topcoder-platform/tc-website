package com.topcoder.ejb.AuthenticationServices;



public final class GroupUser implements java.io.Serializable { 


  private Group group;
  private int userId;
  private String modified;


  public GroupUser() {
    group = new Group();
    userId = 0;
    modified = "";
  }


  //Set
  public void setGroup(Group group) {
    this.group = group;
  }


  public void setUserId(int userId) {
    this.userId = userId;
  }


  public void setModified(String modified) {
  this.modified = modified;
  }


  // Get
  public Group getGroup() {
    return group;
  }


  public int getUserId() {
    return userId;
  }


  public String getModified() {
    return modified;
  }


}

