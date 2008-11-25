/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.shared.util.logging.Logger;

/**
 * This Model provides business logic through which users view test cases.
 *
 * @author adic
 * @version 1.0
 */
public class TestCaseReview implements Model {

    static private Logger log = Logger.getLogger(TestCaseReview.class);
    
    /**
     * Allows an admin or a reviewer to retrieve the test case review document and allows an admin or reviewer to
     * submit one.
     *
     * @param data a TestCaseReviewData object with the populated user and testcase review
     *        if the testcase review is null then a request for the document is performed
     *        if not, the passed testcase review is saved into the document manager
     *
     * @return a SuccessResult if the document was saved successfully
     *         a TestCaseReviewRetrieval containing the requested document
     *         a FailureResult object if the data object is not populated correctly or if the user does not have
     *         permissions
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        log.debug("Starting request to model class TestCaseReview ...");

        if (!(data instanceof TestCaseReviewData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected TestCaseReviewData");
        }

        TestCaseReviewData testCaseReviewData = (TestCaseReviewData) data;

        SecurityEnabledUser user = testCaseReviewData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = testCaseReviewData.getProject();
        if (userProjectInfo == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null project");
        }

        try {
            // check permission
            if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasReviewPermission(user, userProjectInfo)) {
                return new FailureResult("You cannot perform test case review for this project");
            }

            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            Project project = projectTracker.getProject(userProjectInfo, user.getTCSubject());

            if (testCaseReviewData.getTestCaseReviews() == null) {
                // get the TestCaseReview for the front-end
                com.topcoder.apps.review.document.TestCaseReview[] testCaseReviews =
                        documentManager.getTestCaseReview(project, user.getTCSubject());

                if (testCaseReviews != null) {
                    return new TestCaseReviewRetrieval(testCaseReviews);
                } else {
                    return new FailureResult("Cannot get the test case reviews");
                }
            } else {
                // check project phase
                if (!PhaseHelper.canReview(project)) {
                    return new FailureResult("You can review only during the review phase");
                }

                // save the TestCaseReview
                com.topcoder.apps.review.document.TestCaseReview[] testCaseReviews
                        = testCaseReviewData.getTestCaseReviews();
                for (int i = 0; i < testCaseReviews.length; i++) {
                    //LogHelper.log("### setting completed to true from " + testCaseReviews[i].isCompleted());
                    //testCaseReviews[i].setCompleted(true);
                    documentManager.saveTestCaseReview(testCaseReviews[i], user.getTCSubject());
                }
                return new SuccessResult();
            }

            // throw RuntimeExceptions and Errors, wrap other exceptions in FailureResult
        } catch (RuntimeException e) {
            log.error("", e);
            throw e;
        } catch (Error e) {
            log.error("", e);
            throw e;
        } catch (Exception e) {
            return new FailureResult(e);
        }
    }

}

