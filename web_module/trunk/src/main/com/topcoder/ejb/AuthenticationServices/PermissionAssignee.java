package com.topcoder.ejb.AuthenticationServices;


public interface PermissionAssignee {

  public int getSId ();

  public String getSIdType ();

  public java.util.ArrayList getPermissions () throws Exception;

  public void setPermissions ( java.util.ArrayList Permissions ) throws Exception;

  public void setGroups ( java.util.ArrayList Groups ) throws Exception;

  public java.util.ArrayList getGroups ();

}
