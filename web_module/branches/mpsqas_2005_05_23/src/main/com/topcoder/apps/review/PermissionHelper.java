/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.security.*;
import com.topcoder.security.GeneralSecurityException;
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
class PermissionHelper {

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
    static final boolean isAdmin(SecurityEnabledUser user) throws RemoteException, NamingException, CreateException,
            GeneralSecurityException {
        PolicyRemote policy = EJBHelper.getPolicy();
        return policy.checkPermission(user.getTCSubject(), new AdminPermission());
    }

    /**
     * Checks if a user has project view permission.
     *
     * @param user the user
     * @param project the project to check permission for
     *
     * @return whether the user has project permission or not
     *
     * @throws NamingException thrown from the EJB calling code
     * @throws RemoteException thrown from the EJB calling code
     * @throws CreateException thrown from the EJB calling code
     * @throws GeneralSecurityException if an security manager exception occurs
     */
    static final boolean hasProjectPermission(SecurityEnabledUser user, UserProjectInfo project) throws RemoteException,
            NamingException, CreateException, GeneralSecurityException {
        PolicyRemote policy = EJBHelper.getPolicy();
        return policy.checkPermission(user.getTCSubject(), new ViewProjectPermission(project.getId()));
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
    static final boolean hasSubmitPermission(SecurityEnabledUser user, UserProjectInfo project) throws RemoteException,
            NamingException, CreateException, GeneralSecurityException {
        PolicyRemote policy = EJBHelper.getPolicy();
        return policy.checkPermission(user.getTCSubject(), new SubmitPermission(project.getId()));
    }

    /**
     * Checks if a user has submit final fix permission for a project.
     *
     * @param user the user
     * @param project the project to check permission for
     *
     * @return whether the user has submit final fix permission or not
     *
     * @throws NamingException thrown from the EJB calling code
     * @throws RemoteException thrown from the EJB calling code
     * @throws CreateException thrown from the EJB calling code
     * @throws GeneralSecurityException if an security manager exception occurs
     */
    static final boolean hasSubmitFinalFixPermission(SecurityEnabledUser user, UserProjectInfo project)
            throws RemoteException, NamingException, CreateException, GeneralSecurityException {
        PolicyRemote policy = EJBHelper.getPolicy();
        return policy.checkPermission(user.getTCSubject(), new SubmitFinalFixPermission(project.getId()));
    }

    /**
     * Checks if a user has screen permission for a project.
     *
     * @param user the user
     * @param project the project to check permission for
     *
     * @return whether the user has screen permission or not
     *
     * @throws NamingException thrown from the EJB calling code
     * @throws RemoteException thrown from the EJB calling code
     * @throws CreateException thrown from the EJB calling code
     * @throws GeneralSecurityException if an security manager exception occurs
     */
    static final boolean hasScreenPermission(SecurityEnabledUser user, UserProjectInfo project) throws RemoteException,
            NamingException, CreateException, GeneralSecurityException {
        PolicyRemote policy = EJBHelper.getPolicy();
        return policy.checkPermission(user.getTCSubject(), new ScreenPermission(project.getId()));
    }

    /**
     * Checks if a user has review permission for a project.
     *
     * @param user the user
     * @param project the project to check permission for
     *
     * @return whether the user has review permission or not
     *
     * @throws NamingException thrown from the EJB calling code
     * @throws RemoteException thrown from the EJB calling code
     * @throws CreateException thrown from the EJB calling code
     * @throws GeneralSecurityException if an security manager exception occurs
     */
    static final boolean hasReviewPermission(SecurityEnabledUser user, UserProjectInfo project) throws RemoteException,
            NamingException, CreateException, GeneralSecurityException {
        PolicyRemote policy = EJBHelper.getPolicy();
        return policy.checkPermission(user.getTCSubject(), new ReviewPermission(project.getId()));
    }

    /**
     * Checks if a user has aggregation permission for a project.
     *
     * @param user the user
     * @param project the project to check permission for
     *
     * @return whether the user has aggregation permission or not
     *
     * @throws NamingException thrown from the EJB calling code
     * @throws RemoteException thrown from the EJB calling code
     * @throws CreateException thrown from the EJB calling code
     * @throws GeneralSecurityException if an security manager exception occurs
     */
    static final boolean hasAggregationPermission(SecurityEnabledUser user, UserProjectInfo project)
            throws RemoteException, NamingException, CreateException, GeneralSecurityException {
        PolicyRemote policy = EJBHelper.getPolicy();
        return policy.checkPermission(user.getTCSubject(), new AggregationPermission(project.getId()));
    }

    /**
     * Checks if a user has final review permission for a project.
     *
     * @param user the user
     * @param project the project to check permission for
     *
     * @return whether the user has final review permission or not
     *
     * @throws NamingException thrown from the EJB calling code
     * @throws RemoteException thrown from the EJB calling code
     * @throws CreateException thrown from the EJB calling code
     * @throws GeneralSecurityException if an security manager exception occurs
     */
    static final boolean hasFinalReviewPermission(SecurityEnabledUser user, UserProjectInfo project)
            throws RemoteException, NamingException, CreateException, GeneralSecurityException {
        PolicyRemote policy = EJBHelper.getPolicy();
        return policy.checkPermission(user.getTCSubject(), new FinalReviewPermission(project.getId()));
    }

    /**
     * Checks if a user has any reviewer permission for a project.
     *
     * @param user the user
     * @param project the project to check permission for
     *
     * @return whether the user has any reviewer permission or not
     *
     * @throws NamingException thrown from the EJB calling code
     * @throws RemoteException thrown from the EJB calling code
     * @throws CreateException thrown from the EJB calling code
     * @throws GeneralSecurityException if an security manager exception occurs
     */
    static final boolean hasAnyReviewerPermission(SecurityEnabledUser user, UserProjectInfo project)
            throws RemoteException, NamingException, CreateException, GeneralSecurityException {
        return hasScreenPermission(user, project) || hasReviewPermission(user, project)
                || hasAggregationPermission(user, project) || hasFinalReviewPermission(user, project);
    }

}

