/*
 * MyUser.java 1.0 7/1/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.HashMap;

import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.TCPermission;
import com.topcoder.security.policy.PermissionCollection;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;

/**
 * <p>An implementation of User used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyUser extends SecurityEnabledUser {
    /**
     * <p>Count of the number of users created, used for id's</p>
     */
    private static int count = 0;

    /**
     * <p>Creates a new instance of User with the given username
     * and password.  This user is registered with MyUserManager
     * and MyLoginImpl.</p>
     *
     * @param username the username of the new user
     * @param password the password associated with the username
     */
    public MyUser(String username, String password) {
        super(count, "TC" + username, username, username,
                username + "@testuser.com", new PermissionCollection(),
                new TCSubject(count));

        count++;
        MyUserManager.addUser(getTCSubject(), this);
        MyLoginImpl.addLogin(username, password, getTCSubject());
    }

    /**
     * <p>Assigns the specified permission to this user.</p>
     *
     * @param permission the permission to assign to this user.
     * @return none
     */
    public void addPermission(TCPermission permission) {
        getPermissions().addPermission(permission);
        MyPolicyImpl.addPermission(getTCSubject(), permission);
    }
}
