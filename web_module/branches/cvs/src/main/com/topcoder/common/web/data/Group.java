package com.topcoder.common.web.data;

import java.io.Serializable;
import java.util.ArrayList;
import com.topcoder.common.web.xml.*;
import com.topcoder.common.Log;


public final class Group extends SecureObject
  implements Serializable, Base, PermissionAssignee {

  private String groupDesc;
  private String modified;

  public Group () {
    super();
    groupDesc = "";
  }

/*
  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    GroupAttributes result = null;
    try {
      result = new GroupAttributes();
      result.setSId( getSId() );
      result.setSIdType( getSIdType() );
      result.setPermissions( (ArrayList) getPermissions().clone() );
      result.setGroupDesc( getGroupDesc() );
      result.setModified( getModified() );
    } catch (Exception e) {
      Log.msg("common.attr.GroupAttributes:clone:ERROR:\n"+e);
    }
    return result;
  }
*/


  //Set
  public void setGroups(ArrayList groups) throws Exception {
    //required by interface
  }

  public void setGroupId(int groupId) {
    setSId(groupId);
  }

  public void setGroupDesc(String groupDesc) {
  this.groupDesc = groupDesc;
  }

  // Get
  public ArrayList getGroups() {
    //required by interface...
    return null; 
  }

  public int getGroupId() {
    return super.getSId();
  }

  public String getGroupDesc() {
    return groupDesc;
  }
  
  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("Group");
      result.addTag( new ValueTag("GroupId", super.getSId()) );
      result.addTag( new ValueTag("SIdType", super.getSIdType()) );
      result.addTag( new ValueTag("Modified", super.getModified()) );
      result.addTag( new ValueTag("GroupDesc", groupDesc) );
      result.addTag( RecordTag.getListXML("Permissions", getPermissions()));
    } catch (Exception e)  {
      throw new Exception("common.web.data.Group:getXML:ERROR:\n"+e);
    }
    return result;
  }
}

