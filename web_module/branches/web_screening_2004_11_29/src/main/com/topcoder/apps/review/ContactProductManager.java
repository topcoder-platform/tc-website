/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;

/**
 * This Model provides business logic through which users contact a product manager.
 *
 * @author adic
 * @version 1.0
 */
public class ContactProductManager implements Model {

    /**
     * Sends a mail to the product manager of a project.
     *
     * @param data an ContactPMData object with the populated user, subject and message text
     *
     * @return a SuccessResult if the mail was sent successfully
     *         a FailureResult object if the data object is not populated correctly or if the user does not have
     *         permission for that project
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        LogHelper.logModel(this, data);

        if (!(data instanceof ContactPMData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected ContactPMData");
        }

        ContactPMData contactPMData = (ContactPMData) data;

        SecurityEnabledUser user = contactPMData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = contactPMData.getProject();
        if (userProjectInfo == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null project");
        }

        if (contactPMData.getSubject() == null || contactPMData.getMessageText() == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null subject or message");
        }

        try {
            // check permission
            if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasProjectPermission(user, userProjectInfo)) {
                return new FailureResult("You don't have permission to send mail to the PM");
            }

            // send mail
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            User pm = projectTracker.getProject(userProjectInfo, user.getTCSubject()).getProjectManager();
            MailHelper.sendMail(user, pm, "Online Review: " + userProjectInfo.getProjectName() + " "
                                    + contactPMData.getSubject(), contactPMData.getMessageText());

            return new SuccessResult();

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

