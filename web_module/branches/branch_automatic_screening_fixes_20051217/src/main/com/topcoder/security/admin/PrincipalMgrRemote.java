package com.topcoder.security.admin;

import com.topcoder.security.*;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.Collection;

/**
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PrincipalMgrRemote extends EJBObject {

    public abstract Collection getUsers(TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract UserPrincipal getUser(String s)
            throws RemoteException, GeneralSecurityException, NoSuchUserException;

    public abstract UserPrincipal getUser(long l)
            throws RemoteException, GeneralSecurityException, NoSuchUserException;

    public abstract TCSubject getUserSubject(long l)
            throws RemoteException, GeneralSecurityException, NoSuchUserException;

    public abstract String getPassword(long l)
            throws RemoteException, GeneralSecurityException, NoSuchUserException;

    public abstract UserPrincipal createUser(String username, String password, TCSubject requestor)
            throws RemoteException, GeneralSecurityException;

    public abstract void removeUser(UserPrincipal userprincipal, TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract UserPrincipal editPassword(UserPrincipal userprincipal, String s, TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract Collection getGroups(TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract GroupPrincipal getGroup(long l)
            throws RemoteException, GeneralSecurityException, NoSuchGroupException;

    public abstract GroupPrincipal createGroup(String s, TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract void removeGroup(GroupPrincipal groupprincipal, TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract void addUserToGroup(GroupPrincipal groupprincipal, UserPrincipal userprincipal, TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract void removeUserFromGroup(GroupPrincipal groupprincipal, UserPrincipal userprincipal, TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract Collection getRoles(TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract RolePrincipal getRole(long l)
            throws RemoteException, GeneralSecurityException, NoSuchRoleException;

    public abstract RolePrincipal createRole(String s, TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract void removeRole(RolePrincipal roleprincipal, TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract void assignRole(UserPrincipal userprincipal, RolePrincipal roleprincipal, TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract void unAssignRole(UserPrincipal userprincipal, RolePrincipal roleprincipal, TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract void assignRole(GroupPrincipal groupprincipal, RolePrincipal roleprincipal, TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;

    public abstract void unAssignRole(GroupPrincipal groupprincipal, RolePrincipal roleprincipal, TCSubject tcsubject)
            throws RemoteException, GeneralSecurityException;
}