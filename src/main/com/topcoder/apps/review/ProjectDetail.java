/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;

/**
 * This Model provides business logic through which users view project details.
 *
 * @author adic
 * @version 1.0
 */
public class ProjectDetail implements Model {

    /**
     * Method for getting all the details of a project. Available for admins and anyone with project permission.
     * It also retrieves the screening and review scorecards for a project. An admin can see all scorecards,
     * a reviewer can see his scorecards and all other scorecards if they are completed, a submitter can see only his
     * scorecards if they are completed.
     *
     * @param data a OnlineReviewProjectData object with the populated user, project (user info project)
     *
     * @return a ProjectRetrieval if the project was retrieved successfully containing the project and scorecards
     *         a FailureResult object if the data object is not populated correctly or if the user doesn't have
     *         project permission
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {

        LogHelper.logModel(this, data);

        if (!(data instanceof OnlineReviewProjectData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected OnlineReviewProjectData");
        }

        OnlineReviewProjectData onlineReviewProjectData = (OnlineReviewProjectData) data;

        SecurityEnabledUser user = onlineReviewProjectData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserProjectInfo userProjectInfo = onlineReviewProjectData.getProject();
        if (userProjectInfo == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null project");
        }

        try {
            // check permission
            if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasProjectPermission(user, userProjectInfo)) {
                return new FailureResult("You don't have permission to view this project");
            }

            // get project
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            Project project = projectTracker.getProject(onlineReviewProjectData.getProject(), user.getTCSubject());

            // get the scorecards
            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            ScreeningScorecard[] screeningScorecards = documentManager.getScreeningScorecard(project, user.getTCSubject());
            ReviewScorecard[] reviewScorecards = documentManager.getReviewScorecard(project, user.getTCSubject());

            // get testcases if in review phase
            TestCase[] testCases = null;
            if (project.getCurrentPhase().getId() == Phase.ID_REVIEW) {
                testCases = documentManager.getTestCases(project, -1, user.getTCSubject());
            }

            // strip screening & review scorecards
            int j = strip(project, user, screeningScorecards);
            int k = strip(project, user, reviewScorecards);

            // compose the scorecards for the result
            AbstractScorecard[] temp = new AbstractScorecard[j + k];
            System.arraycopy(screeningScorecards, 0, temp, 0, j);
            System.arraycopy(reviewScorecards, 0, temp, j, k);

            // compose the submissions for the result
            AbstractSubmission[] submissions = documentManager.getInitialSubmissions(project, false, user.getTCSubject());
            AbstractSubmission finalfix = documentManager.getFinalFixSubmission(project, user.getTCSubject());
            if (finalfix != null) {
                AbstractSubmission[] temp2 = new AbstractSubmission[submissions.length + 1];
                System.arraycopy(submissions, 0, temp2, 0, submissions.length);
                temp2[submissions.length] = finalfix;
                submissions = temp2;
            }

            // Get scorecard template id:s
            long[] templateId = projectTracker.getProjectTemplates(project.getId());

            return new ProjectRetrieval(project, temp, submissions, testCases, templateId);

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

    /**
     * Strips an array of the scorecards a user should not see:
     *
     * - an admin / PM can see anything
     * - a reviewer can see his scorecard and all completed scorecards
     * - a submitter can see his scorecards if they are completed
     *
     * The valid scorecards are moved to the beginning of the array and their count is returned.
     *
     * @param project the project
     * @param user the user
     * @param scorecards the array of scorecards
     *
     * @return the count of remaining scorecards
     *
     * @exception Exception propagate any exceptions to the caller
     */
    static int strip(Project project, SecurityEnabledUser user, AbstractScorecard[] scorecards) throws Exception {
        // get the user role in this project
        UserRole[] roles = project.getParticipants();
        boolean isAdmin = PermissionHelper.isAdmin(user);
        boolean isSubmitter = false;
        boolean isSubmitterOnly = RoleHelper.isSubmitterOnly(user, project);
        boolean isReviewer = false;
        for (int i = 0; i < roles.length; i++) {
            if (null != roles[i].getUser() && roles[i].getUser().getId() == user.getId()) {
                isAdmin |= RoleHelper.isProductManager(roles[i]);
                isSubmitter |= RoleHelper.isSubmitter(roles[i]);
                isReviewer |= RoleHelper.isReviewer(roles[i]) || RoleHelper.isScreener(roles[i])
                        || RoleHelper.isAggregator(roles[i]) || RoleHelper.isFinalReviewer(roles[i]);
            }
        }

        // a "true" submitter must have the submitter user role (checked above) and must have a submission
        /*
        // Commented to not strip scorecards with missing non-removed submissions! /FatClimber
        InitialSubmission[] submissions = EJBHelper.getDocumentManager().getInitialSubmissions(project, user.getTCSubject());
        isSubmitter &= submissions != null
                    && submissions.length == 1
                    && submissions[0].getSubmitter().getId() == user.getId()
                    && submissions[0].isSubmitted();
        */
        boolean isScreen = PhaseHelper.canScreen(project);
        boolean isReview = PhaseHelper.canReview(project);

        // strip scorecards
        int j = 0;
        for (int i = 0; i < scorecards.length; i++) {

            // a submitter cannot see the screening scorecard during the screening phase
            if (isSubmitterOnly && isScreen && scorecards[i] instanceof ScreeningScorecard) {
                continue;
            }
            // a submitter cannot see the review scorecard during the screening or review phases
            if (isSubmitterOnly && (isScreen || isReview) && scorecards[i] instanceof ReviewScorecard) {
                continue;
            }

            // admins can see all scorecards
            boolean ok = isAdmin;
            // reviewers can see his scorecards and all completed scorecards
            ok |= isReviewer && (scorecards[i].isCompleted() || scorecards[i].getAuthor().getId() == user.getId());
            // submitters can see only his scorecards if they are completed
            ok |= isSubmitter && scorecards[i].isCompleted()
                    && scorecards[i].getSubmission().getSubmitter().getId() == user.getId();
            // submitters can see all scorecards during appeals phase
            ok |= isSubmitter && project.getCurrentPhase().getId() == Phase.ID_APPEALS;

            // by cucu
            // submitters can see all scorecards during appeals response phase
            ok |= isSubmitter && project.getCurrentPhase().getId() == Phase.ID_APPEALS_RESPONSE;

            if (ok) {
                scorecards[j++] = scorecards[i];
            }
        }

        return j;
    }

}

