/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.mockup;

import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;

import java.util.Arrays;
import java.util.Collection;

/**
 * Mockup implementation of the PrincipalManager EJB.
 *
 * @author adic
 * @version 1.0
 */
public class PrincipalManagerMockup extends EJBBase implements PrincipalMgrRemote {

    public Collection getRoles(TCSubject requestor) {
        return Arrays.asList(MockupData.rolePrincipals);
    }

    public Collection getUsers(TCSubject p1) {
        return null;
    }

    public TCSubject getUserSubject(long p1) {
        return null;
    }

    public void assignRole(GroupPrincipal p1, RolePrincipal p2, TCSubject p3) {
    }

    public RolePrincipal createRole(String p1, TCSubject p2) {
        return null;
    }

    public void removeRole(RolePrincipal p1, TCSubject p2) {
    }

    public void removeUser(UserPrincipal p1, TCSubject p2) {
    }

    public String getPassword(long p1) {
        return null;
    }

    public void unAssignRole(UserPrincipal p1, RolePrincipal p2, TCSubject p3) {
    }

    public UserPrincipal editPassword(UserPrincipal p1, String p2, TCSubject p3) {
        return null;
    }

    public void unAssignRole(GroupPrincipal p1, RolePrincipal p2, TCSubject p3) {
    }

    public Collection getGroups(TCSubject p1) {
        return null;
    }

    public UserPrincipal createUser(String p1, String p2, TCSubject p3) {
        return null;
    }

    public GroupPrincipal getGroup(long p1) {
        return null;
    }

    public GroupPrincipal createGroup(String p1, TCSubject p2) {
        return null;
    }

    public UserPrincipal getUser(String p1) {
        return null;
    }

    public void assignRole(UserPrincipal p1, RolePrincipal p2, TCSubject p3) {
    }

    public void removeGroup(GroupPrincipal p1, TCSubject p2) {
    }

    public RolePrincipal getRole(long p1) {
        return null;
    }

    public void addUserToGroup(GroupPrincipal p1, UserPrincipal p2, TCSubject p3) {
    }

    public UserPrincipal getUser(long p1) {
        return null;
    }

    public void removeUserFromGroup(GroupPrincipal p1, UserPrincipal p2, TCSubject p3) {
    }

}

