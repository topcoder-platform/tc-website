/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening;

import com.topcoder.apps.review.EJBHelper;
import com.topcoder.apps.review.security.*;
import com.topcoder.apps.screening.security.*;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.policy.PolicyRemote;
import javax.ejb.CreateException;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import com.topcoder.shared.security.User;

/**
 * Helper class for checking permissions.
 *
 * @author pulky
 * @version 1.0.0
 */
public class PermissionHelper {

    /**
     * Constructor (inhibits outside instantiation).
     */
    private PermissionHelper() {
    }

    /**
     * Checks if a user has admin permission.
     *
     * @param user the user
     *
     * @return whether the user has admin permission or not
=    */
    public static final boolean isAdmin(User user) throws RemoteException, NamingException, CreateException,
            GeneralSecurityException {
        TCSubject subject = getSubject(user.getUserName(), user.getId());
        PolicyRemote policy = EJBHelper.getPolicy();
        return policy.checkPermission(subject, new AdminPermission());
    }

    /**
     * Checks if a user has application specification submit permission.
     *
     * @param user the user
     *
     * @return whether the user has specification submit permission or not
=    */
    static public final boolean hasSpecificationSubmitPermission(User user) throws RemoteException,
            NamingException, CreateException, GeneralSecurityException {
        TCSubject subject = getSubject(user.getUserName(), user.getId());
        PolicyRemote policy = EJBHelper.getPolicy();
        return policy.checkPermission(subject, new SubmitSpecificationPermission());
    }

    /**
     * Helper method to get a TCSubject from the username and userid.
     *
     * @param userName the username
     * @param userId the userid
     *
     * @return TCSubject representing the user.
=    */
    private static TCSubject getSubject(String userName, long userId) {
        TCSubject subject = new TCSubject(userId);
        subject.addPrincipal(new UserPrincipal(userName, userId));

        return subject;
    }
}

