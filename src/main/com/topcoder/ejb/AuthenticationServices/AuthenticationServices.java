package com.topcoder.ejb.AuthenticationServices;

import javax.ejb.*;
import java.util.*;
import java.rmi.RemoteException;


public interface AuthenticationServices extends EJBObject {

  public boolean validHandle(String userName) 
    throws RemoteException; 

  public boolean agreed (int sectorId, int userId) 
    throws RemoteException; 

  public Authentication getActivation(int coderId) 
    throws RemoteException;

  public Authentication getCredentials(String firstName, 
    String lastName, String email) 
    throws RemoteException;

  public Authentication authenticate(String userName, String password) 
    throws RemoteException; 

  public Map getLikeUsers ( String userName )
    throws RemoteException;

  public void insertSectorAccess ( int sectorId, int userId, String authorized )
    throws RemoteException;

  public void insertSectorAgreement ( int sectorId, int userId )
    throws RemoteException;

  public Permission getSectorPermission ( Sector sector, PermissionAssignee assignee )
    throws RemoteException;

  public boolean isStaff ( PermissionAssignee assignee )
    throws RemoteException;

}
