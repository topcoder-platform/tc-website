package com.topcoder.ejb.AuthenticationServices;

import javax.ejb.*;
import java.util.*;
import java.rmi.RemoteException;

/**
 * The interface for the AuthenticationServices EJB.
 * This stateless session EJB controls logins, security, and loading of user information.
 */
public interface AuthenticationServices extends EJBObject {

 /**
  * Returns true for a valid user name.
  * @param handle the Handle.
  * @return boolean true for a valid user name.
  */
  public boolean validHandle(String userName) 
    throws RemoteException; 

 /**
  * Returns true for sector agreement
  * @param sectorId the id for the security sector
  * @param userId the user's id.
  * @return boolean true for a sector agreement
  */
  public boolean agreed (int sectorId, int userId) 
    throws RemoteException; 

 /**
  * Returns the activation code for a valid coder_id.
  * @param coderId the user's id.
  * @return an Authentication object representing the coder's credentials
  */
  public Authentication getActivation(int coderId) 
    throws RemoteException;

 /**
  * Returns a user's credentials for a valid firstName, lastName, and email.
  * (used to create an email for a forgotten password)
  * @param firstName the user's first name.
  * @param lastName the user's last name.
  * @param email the user's email address.
  * @return an Authentication object representing the coder's credentials
  */
  public Authentication getCredentials(String firstName, 
    String lastName, String email) 
    throws RemoteException;

 /**
  * Returns the authentication object for a given handle and password.
  * @param handle the user's name.
  * @param password the user's password.
  * @return an Authentication object.
  */
  public Authentication authenticate(String userName, String password) 
    throws RemoteException; 

 /**
  * Returns a Map of UserId/Handle Entries with like user names.
  * Originally used to lookup handles when users pick the 
  * member who referred them.
  * @param handle the Handle.
  * @return Map of UserId keys and Handle values.
  */
  public Map getLikeUsers ( String userName )
    throws RemoteException;

 /**
  * Inserts a record in sector access for a given sector, user.
  * @param sectorId the secured area.
  * @param userId the user's id. 
  * @param authorized the authorized status of the sector access.
  */
  public void insertSectorAccess ( int sectorId, int userId, String authorized )
    throws RemoteException;

 /**
  * Inserts a record into sector agreement to indicate that a user agreed to the terms of the sector.
  * @param sectorId the secured area.
  * @param userId the user's id.
  */
  public void insertSectorAgreement ( int sectorId, int userId )
    throws RemoteException;

 /**
  * Given a secured sector and a permission assignee, this method returns the highest level
  * of permission granted for that sector.
  * @param sector -- the secured area.
  * @param the permission assignee (usually a user).
  * @return the highest permission granted for the given sector/assignee combo.
  */
  public Permission getSectorPermission ( Sector sector, PermissionAssignee assignee )
    throws RemoteException;

 /**
  * Determines if a given permission assignee is a member of the administrative staff.
  * @param assignee -- the user.
  * @return boolean true if assignee is TopCoder staff.
  */
  public boolean isStaff ( PermissionAssignee assignee )
    throws RemoteException;

 /**
  * Loads a User object from the DB for the given user id.
  * @param a valid user id.
  * @return a populated user object.
  */
  public User loadUser ( int userId )
    throws RemoteException;

}
