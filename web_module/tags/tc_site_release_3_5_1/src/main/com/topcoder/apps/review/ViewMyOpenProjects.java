/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

/**
 * This Model provides business logic through which users view their open projects.
 *
 * @author adic
 * @version 1.0
 */
public class ViewMyOpenProjects implements Model {

    /**
     * Retrieves all the opened projects associated with a user (is which the user has any role - submitted, reviewer,
     * product manager).
     *
     * @param data an OnlineReviewData object with the populated user
     *
     * @return a ProjectsRetrieval object populated with an array of the requested projects
     *         a FailureResult object if the data object is not populated correctly
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        LogHelper.logModel(this, data);

        if (!(data instanceof OnlineReviewData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected OnlineReviewData");
        }

        OnlineReviewData onlineReviewData = (OnlineReviewData) data;

        SecurityEnabledUser user = onlineReviewData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        try {
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            //DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            UserProjectInfo[] projects = projectTracker.getProjectInfo(user.getTCSubject());

            // strip closed projects
            int j = 0;
            for (int i = 0; i < projects.length; i++) {
                if (!PhaseHelper.isClosed(projects[i])) {

                    // in non-submit phase we have to filter projects for 'fake' submitters
/*
                    if (!PhaseHelper.canSubmit(projects[i])) {
                        // determine if the user has only the role of submitter
                        boolean isSubmitterOnly = false;
                        UserRole[] roles = projects[i].getUserRoles();
                        for (int k = 0; k < roles.length; k++) {
                            if (roles[k].getUser().equals(user)) {
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

                        // Commented out / FatClimber
                        // if the user has only submitter role, check if he did submit
//                        if (isSubmitterOnly) {
//                            Project project = projectTracker.getProject(projects[i], user.getTCSubject());
//                            InitialSubmission[] submissions =
//                                documentManager.getInitialSubmissions(project, user.getTCSubject());
//                            if (submissions == null
//                                    || submissions.length != 1
//                                    || submissions[0].getSubmitter().getId() != user.getId()
//                                    || !submissions[0].isSubmitted()) {
//                                // if he did not submit then we skip this project
//                                LogHelper.log("Stripped project " + project.getName()
//                                              + " for 'fake' submitter " + user.getHandle());
//                                continue;
//                            }
//                        }
                    }
*/

                    // for admins the project tracker returns all projects so we have to retain only those for which
                    // the admin is a product manager
                    boolean isPM = RoleHelper.isProductManager(user, projects[i]);
                    if (!PermissionHelper.isAdmin(user) || isPM) {
                        projects[j++] = projects[i];
                    }
                }
            }
            UserProjectInfo[] temp = new UserProjectInfo[j];
            System.arraycopy(projects, 0, temp, 0, j);

            return new ProjectsRetrieval(temp);

            // throw RuntimeExceptions and Errors, wrap other exceptions in FailureResult
        } catch (RuntimeException e) {
            LogHelper.log("", e);
            throw e;
        } catch (Error e) {
            LogHelper.log("", e);
            throw e;
        } catch (Exception e) {
            return new FailureResult(e);
        }
    }

}

