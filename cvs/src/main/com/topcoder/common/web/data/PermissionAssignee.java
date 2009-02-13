package com.topcoder.common.web.data;

import java.util.ArrayList;
import com.topcoder.common.web.xml.*;

public interface PermissionAssignee {

  public int getSId();

  public String getSIdType();

  public ArrayList getPermissions()
    throws Exception;

  public void setPermissions(ArrayList Permissions)
    throws Exception;

  public void setGroups(ArrayList Groups)
    throws Exception;

  public ArrayList getGroups();

  public RecordTag getXML() 
    throws Exception;

}
