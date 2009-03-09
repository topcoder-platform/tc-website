/**
 * Copyright (c) 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.shared.util.logging.Logger;

/**
 * Helper class for checking the role of a user.
 *
 * @author adic
 * @version 1.0
 */
class RoleHelper {
    
    static private Logger log = Logger.getLogger(RoleHelper.class);

    /**
     * Constructor (inhibits outside instantiation).
     */
    private RoleHelper() {
    }

    /**
     * Check if a user role is submitter.
     *
     * @param role the role to check
     *
     * @return whether the user role is a submitter or not.
     */
    static boolean isSubmitter(UserRole role) {
        return role.getRole().getId() == Role.ID_DESIGNER_DEVELOPER;
    }

    /**
     * Check if a user role is screener.
     *
     * @param role the role to check
     *
     * @return whether the user role is a screenr or not.
     */
    static boolean isScreener(UserRole role) {
        return role.getRole().getId() == Role.ID_PRIMARY_SCREENER;
    }

    /**
     * Check if a user role is reviewer.
     *
     * @param role the role to check
     *
     * @return whether the user role is a reviewer or not.
     */
    static boolean isReviewer(UserRole role) {
        return role.getRole().getId() == Role.ID_REVIEWER;
    }

    /**
     * Check if a user role is aggregator.
     *
     * @param role the role to check
     *
     * @return whether the user role is an aggregator or not.
     */
    static boolean isAggregator(UserRole role) {
        return role.getRole().getId() == Role.ID_AGGREGATOR;
    }

    /**
     * Check if a user role is final reviewer.
     *
     * @param role the role to check
     *
     * @return whether the user role is a final reviewer or not.
     */
    static boolean isFinalReviewer(UserRole role) {
        return role.getRole().getId() == Role.ID_FINAL_REVIEWER;
    }

    /**
     * Check if a user is final reviewer for a project.
     *
     * @param user the user
     * @param project the project
     *
     * @return whether the user is a final reviewer or not for the project.
     *
     */
    static boolean isFinalReviewer(User user, Project project) {
        UserRole[] userRoles = project.getParticipants();
        for (int i = 0; i < userRoles.length; i++) {
            if (user.equals(userRoles[i].getUser()) && isFinalReviewer(userRoles[i])) {
                return true;
            }
        }
        return false;
    }

    /**
     * Check if a user role is product manager.
     *
     * @param role the role to check
     *
     * @return whether the user role is a product manager or not.
     */
    static boolean isProductManager(UserRole role) {
        return role.getRole().getId() == Role.ID_PRODUCT_MANAGER;
    }

    /**
     * Check if a user is product manager for a project.
     *
     * @param user the user
     * @param project the project
     *
     * @return whether the user is a product manager or not for the project.
     *
     */
    static boolean isProductManager(User user, UserProjectInfo project) {
        UserRole[] userRoles = project.getUserRoles();
        for (int i = 0; i < userRoles.length; i++) {
            if (user.equals(userRoles[i].getUser()) && userRoles[i].getRole().getId() == Role.ID_PRODUCT_MANAGER) {
                return true;
            }
        }
        return false;
    }

    /**
     * Check if a user is product manager for a project.
     *
     * @param user the user
     * @param project the project
     *
     * @return whether the user is a product manager or not for the project.
     *
     */
    static boolean isProductManager(User user, Project project) {
        UserRole[] userRoles = project.getParticipants();
        for (int i = 0; i < userRoles.length; i++) {
            if (user.equals(userRoles[i].getUser()) && isProductManager(userRoles[i])) {
                return true;
            }
        }
        return false;
    }

    static long getSubmitterUserRoleId(User user, UserRole[] roles) {
        // get the user role id
        //LogHelper.log("looking at " + roles.length + " roles");
        for (int i = 0; i < roles.length; i++) {
            log.debug("looking at role " + roles[i].getRole().getName() + ", " +
                    (roles[i].getUser() == null ? "null" : roles[i].getUser().getHandle()) +
                    " (for " + user.getHandle() + ")");
            if (RoleHelper.isSubmitter(roles[i]) && user.equals(roles[i].getUser())) {
                return roles[i].getId();
            }
        }
        return -1;
    }

    static long getReviewerUserRoleId(User user, UserRole[] roles) {
        // get the user role id
        //LogHelper.log("looking at " + roles.length + " roles");
        for (int i = 0; i < roles.length; i++) {
            log.debug("looking at role " + roles[i].getRole().getName() + ", " +
                    (roles[i].getUser() == null ? "null" : roles[i].getUser().getHandle()) +
                    " (for " + user.getHandle() + ")");
            if (RoleHelper.isReviewer(roles[i]) && user.equals(roles[i].getUser())) {
                return roles[i].getId();
            }
        }
        return -1;
    }

    /**
     * Determine is the user has ONLY the submitter role for the given project.
     *
     * @param user the user
     * @param project the project
     *
     * @return true is the user has exactly one role in this project and it is a submitter role
     *         false is the user has no roles at all or has other role(s) besides submitter role
     *
     * @exception Exception propagate exceptions
     */
    static boolean isSubmitterOnly(User user, /*UserProjectInfo projinfo,*/ Project project)
            throws Exception {
        // determine if the user has only the role of submitter
        boolean isSubmitterOnly = false;
        UserRole[] roles = /*projinfo != null ? projinfo.getUserRoles() :*/ project.getParticipants();
        for (int k = 0; k < roles.length; k++) {
            if (user.equals(roles[k].getUser())) {
                if (RoleHelper.isSubmitter(roles[k])) {
                    // found the submitter role
                    isSubmitterOnly = true;
                } else {
                    // the user is something else than submitter, so break
                    isSubmitterOnly = false;
                    break;
                }
            }
        }
        return isSubmitterOnly;
    }

    /**
     * Determines if a user is a "fake" submitter for a project.
     * A fake submitter is a user who has exactly one role, the submitter role, nothing else, and
     * did not submit for the project. Basically it is a user who inquired for a project but did
     * not submit, and did not get later on other roles (such a reviewer).
     *
     * @param    user the user
     * @param    project the project
     * @param    inquirer the user inquiring (a PM usually, needed for submission retrival)
     *
     * @return whether it is a "fake" submitter or not
     *
     * @exception   Exception
     */
    static boolean isFakeSubmitter(User user, Project project, SecurityEnabledUser inquirer)
            throws Exception {
        // if the user has only submitter role, check if he did submit
        if (isSubmitterOnly(user, project)) {
            //if (project == null) {
            //    project = EJBHelper.getProjectTracker().getProject(projinfo, inquirer.getTCSubject());
            //}
            InitialSubmission[] submissions =
                    EJBHelper.getDocumentManager().getInitialSubmissions(project, false, inquirer.getTCSubject());
            boolean foundSubmission = false;
            for (int i = 0; i < submissions.length; i++) {
                if (submissions[i].getSubmitter().getId() == user.getId() && submissions[i].isSubmitted()) {
                    foundSubmission = true;
                    break;
                }
            }
            return !foundSubmission;
        }

        return false;
    }

}

