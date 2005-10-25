package com.topcoder.security.admin;

import com.topcoder.security.*;

import java.util.Collection;

/**
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PrincipalMgrLocal extends javax.ejb.EJBLocalObject {

    public abstract Collection getUsers(TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract UserPrincipal getUser(String s)
            throws GeneralSecurityException, NoSuchUserException;

    public abstract UserPrincipal getUser(long l)
            throws GeneralSecurityException, NoSuchUserException;

    public abstract TCSubject getUserSubject(long l)
            throws GeneralSecurityException, NoSuchUserException;

    public abstract String getPassword(long l)
            throws GeneralSecurityException, NoSuchUserException;

    public abstract UserPrincipal createUser(String username, String password, TCSubject requestor)
            throws GeneralSecurityException;

    public abstract void removeUser(UserPrincipal userprincipal, TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract UserPrincipal editPassword(UserPrincipal userprincipal, String s, TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract Collection getGroups(TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract GroupPrincipal getGroup(long l)
            throws GeneralSecurityException, NoSuchGroupException;

    public abstract GroupPrincipal createGroup(String s, TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract void removeGroup(GroupPrincipal groupprincipal, TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract void addUserToGroup(GroupPrincipal groupprincipal, UserPrincipal userprincipal, TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract void removeUserFromGroup(GroupPrincipal groupprincipal, UserPrincipal userprincipal, TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract Collection getRoles(TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract RolePrincipal getRole(long l)
            throws GeneralSecurityException, NoSuchRoleException;

    public abstract RolePrincipal createRole(String s, TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract void removeRole(RolePrincipal roleprincipal, TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract void assignRole(UserPrincipal userprincipal, RolePrincipal roleprincipal, TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract void unAssignRole(UserPrincipal userprincipal, RolePrincipal roleprincipal, TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract void assignRole(GroupPrincipal groupprincipal, RolePrincipal roleprincipal, TCSubject tcsubject)
            throws GeneralSecurityException;

    public abstract void unAssignRole(GroupPrincipal groupprincipal, RolePrincipal roleprincipal, TCSubject tcsubject)
            throws GeneralSecurityException;
}