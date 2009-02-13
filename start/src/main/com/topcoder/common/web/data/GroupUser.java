package com.topcoder.common.web.data;


import java.io.Serializable;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.xml.*;


public final class GroupUser implements Serializable, Base { 


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

  
  public RecordTag getXML() throws TCException {
    RecordTag result = null;
    try {
      result = new RecordTag ( "GroupUser" );
      result.addTag ( group.getXML() );
      result.addTag ( new ValueTag("UserId", userId) );
      result.addTag ( new ValueTag("Modified", modified) );
    } catch ( Exception e )  {
      throw new TCException ( "common.web.data.GroupUser:getXML:ERROR:\n"+e );
    }
    return result;
  }


}

