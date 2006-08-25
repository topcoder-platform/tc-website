/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.screening;

import com.topcoder.apps.review.EJBHelper;
import com.topcoder.apps.review.security.*;
import com.topcoder.apps.screening.security.*;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.PolicyRemote;
import javax.ejb.CreateException;
import javax.naming.NamingException;
import java.rmi.RemoteException;

/**
 * Helper class for checking permissions.
 *
 * @author adic
 * @version 1.0
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
     *
     * @throws NamingException thrown from the EJB calling code
     * @throws RemoteException thrown from the EJB calling code
     * @throws CreateException thrown from the EJB calling code
     * @throws GeneralSecurityException if an security manager exception occurs
     */
    public static final boolean isAdmin(TCSubject subject) throws RemoteException, NamingException, CreateException,
            GeneralSecurityException {
        PolicyRemote policy = EJBHelper.getPolicy();
        return policy.checkPermission(subject, new AdminPermission());
    }

    /**
     * Checks if a user has submit permission for a project.
     *
     * @param user the user
     * @param project the project to check permission for
     *
     * @return whether the user has submit permission or not
     *
     * @throws NamingException thrown from the EJB calling code
     * @throws RemoteException thrown from the EJB calling code
     * @throws CreateException thrown from the EJB calling code
     * @throws GeneralSecurityException if an security manager exception occurs
     */
    static public final boolean hasSpecificationSubmitPermission(TCSubject subject) throws RemoteException,
            NamingException, CreateException, GeneralSecurityException {
        PolicyRemote policy = EJBHelper.getPolicy();

        System.out.println("subject.getUserId() :" + subject.getUserId());
        System.out.println("SubmitSpecificationPermission.class.getName() :" + SubmitSpecificationPermission.class.getName());

        return policy.checkPermission(subject, new SubmitSpecificationPermission());
    }
}

