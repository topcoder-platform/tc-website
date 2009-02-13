/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.document.AggregationApproval;
import com.topcoder.apps.review.document.AggregationReview;
import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.document.Appeal;
import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.FinalFixSubmission;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.document.TestCase;
import com.topcoder.apps.review.persistence.Common;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.PhaseInstance;
import com.topcoder.apps.review.projecttracker.PhaseManager;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.ProjectType;
import com.topcoder.apps.review.projecttracker.Role;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserRole;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Comparator;
import java.util.Map;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

/**
 * This Model provides business logic through which users administers projects (only for admins).
 *
 * @author adic
 * @version 1.0
 */
public class ProjectAdministration implements Model {

    /**
     * Epsilon for double calculations.
     */
    private static final double EPS = 1e-10;

    /**
     * The number of reviewers (3 currently).
     */
    private static final double REVIEWER_COUNT = 3;

    /**
     * The minimum score that allows a submitter to win.
     */
    private static double minscore = -1;

    /**
     * Method for the administration of a project. The front-end passes an instance of a Project in which the front-end
     * made changes and the business logic calls the persistance layer to save the new data. This method is available
     * only for admins.
     *
     * The changes in the project are detected and if the user roles, phase or timeline are changed then a mail
     * notification is sent to the users associated with the project. Phase and timeline changes cause everyone
     * involved to be notified while role changes notify only reviewers and PMs.
     *
     * The security manager permissions are affected by the role changes (they are assigned/removed accordingly).
     * Also when the project closed all permissions are removed.
     *
     * When phase changes from screening to review, it is checked if all non-removed submission have scorecards
     * with all yes (at objective questions) and if there is at least one non-removed submission.
     *
     * When the phase changes from review to aggregations, the winner of the component competition is calculated and
     * set. Mails are sent to all submitters.
     *
     * The method can be used to modify the state of submissions (passed in the Data object).
     * When submissions are removed (setRemoved(true)) mails are sent to the corresponding submitters.
     *
     * @param data a ProjectData object with the populated user, project, reason and optionally a submissions array
     *
     * @return a SuccessResult if the actions described above completed successfully
     *         a FailureResult object if the data object is not populated correctly or if the user is not an admin
     *         a FailureResult if when going to aggregation phase there aren't any submissions, a submission does not
     *         have exactly 3 completed scorecards. there is a tie at the top or the winner does not have a score above
     *         75.0
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        LogHelper.logModel(this, data);

        if (!(data instanceof ProjectData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected ProjectData");
        }

        ProjectData projectData = (ProjectData) data;

        SecurityEnabledUser user = projectData.getUser();
        if (user == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user, you have to login first");
        }

        UserTransaction ut = null;
        boolean shouldRollback = false;

        try {
            Project newProject = projectData.getProject();

            // only admins and PMs can administer projects
            if (!PermissionHelper.isAdmin(user) && !RoleHelper.isProductManager(user, newProject)) {
                return new FailureResult("You have to be admin / PM to do project administration");
            }

            // enforce the completion of a non-empty reason for the change
            if (projectData.getReason() == null || projectData.getReason().trim().length() == 0) {
                return new FailureResult("You must include a non-empty reason for making any change to the project");
            }

            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            Project oldProject = projectTracker.getProjectById(newProject.getId(), user.getTCSubject());
            if (newProject.getId() != oldProject.getId()) {
                return new FailureResult("PL problem: the old project and the new project have different ids");
            }

            List mailQueue = new ArrayList();

            // check if we have valid submissions when moving from screening to review
            DocumentManagerLocal documentManager = EJBHelper.getDocumentManager();
            if ((oldProject.getCurrentPhase().getId() == Phase.ID_SCREENING || EJBHelper.isTestMode())
                    && newProject.getCurrentPhase().getId() == Phase.ID_REVIEW) {

                InitialSubmission[] submissions
                    = documentManager.getInitialSubmissions(newProject, false, user.getTCSubject());

                // we must have at least one submission
                if (submissions == null || submissions.length < 1) {
                    return new FailureResult("Cannot move to review without submissions");
                }

                // check if all screening scorecards are PM reviewed
                ScreeningScorecard[] scorecards =
                    documentManager.getScreeningScorecard(newProject, user.getTCSubject());
                for (int i = 0; i < scorecards.length; i++) {
                    if (!scorecards[i].isPMReviewed()) {
                        return new FailureResult(scorecards[i].getSubmission().getSubmitter().getHandle()
                                                 + "'s scorecard is not PM reviewed");
                    }
                }

                //build a set of the top 5 scores, for use in advancing to review
                /*ArrayList scores = new ArrayList();

                for(int i = 0; i < submissions.length; i++) {
                    if (!submissions[i].isRemoved()) {
                        for (int j = 0; j < scorecards.length; j++) {
                            if (scorecards[j].getSubmission().equals(submissions[i]) && scorecards[j].isCompleted()) {
                                double minscore = ConfigHelper.getMinimumScore();
                                if (scorecards[j].getPassed() && scorecards[j].getScore() >= minscore) {
                                    scores.add(new Double(scorecards[j].getScore()));
                                }
                            }
                        }
                    }
                }

                //sort list
                Collections.sort(scores);
                Collections.reverse(scores);
                //remove all but top five scores.  No need to check ties, this will gaurentee they advance
                while(scores.size() > 5) {
                    scores.remove(5);
                }*/

                int count = 0;
                String message = "";
                for (int i = 0; i < submissions.length; i++) {
                    if (!submissions[i].isRemoved()) {
                        count++;

                        // check if all objective yes / no questions responses are yes
                        boolean ok = false;
                        for (int j = 0; j < scorecards.length; j++) {
                            if (scorecards[j].getSubmission().equals(submissions[i]) && scorecards[j].isCompleted()) {
                                ok = true;
                                double minscore = ConfigHelper.getMinimumScore();
                                if ((scorecards[j].getPassed() && scorecards[j].getScore() >= minscore) || ((InitialSubmission)submissions[i]).isAdvancedToReview() ) {
                                    InitialSubmission sub = scorecards[j].getSubmission();
                                    sub.setPassedScreening(true);
                                    //sub.setAdvancedToReview(true);
                                    documentManager.saveInitialSubmission(sub, user.getTCSubject());
                                }
//                                ok = true;
//                                ScorecardQuestion[] questions = scorecards[j].getQuestions();
//                                for (int k = 0; k < questions.length; k++) {
//                                    // look at yes / no questions only
//                                    if (questions[k].getClass() == ScorecardQuestion.class) {
//                                        if (questions[k].getEvaluation().getId() == Evaluation.ID_NO) {
//                                            ok = false;
//                                            break;
//                                        }
//                                    }
//                                }
//                                if (!ok) {
//                                    break;
//                                }
                            }
                        }

                        if (!ok) {
                            if (message.length() > 0) {
                                message += ", ";
                            }
                            message += submissions[i].getSubmitter().getHandle() + "'s";
                        }
                    } else {
                        mailQueue.add(new ResultsMail(user, submissions[i].getSubmitter(), 0, MailHelper.PLACE_SCREENING_FAIL, newProject));
                    }
                }

                if (message.length() > 0) {
                    return new FailureResult(message + " submission(s) either do(es) not have a screening scorecard "
                                             + "or has(have) a NO objective question evaluation so it should be removed");
                }

                // we must have at least one non-removed submission
                if (count < 1) {
                    return new FailureResult("Cannot move to review without any passing submissions");
                }
            } // end of checking valid submissions when moving from screening to review


            // check if all test case review have been submitted before going from reviews
            // Check that all testcases are uploaded (if development project)
            if (oldProject.getCurrentPhase().getId() == Phase.ID_REVIEW &&
                    (newProject.getCurrentPhase().getId() == Phase.ID_APPEALS ||
                     newProject.getCurrentPhase().getId() == Phase.ID_AGGREGATION)) {

                if (newProject.getProjectType().getId() == ProjectType.ID_DEVELOPMENT) {
                    // Check that all testcases are uploaded (if development project)
                    UserRole[] newRoles = newProject.getParticipants();
                    int nrReviewers = 0;
                    for (int i = 0; i < newRoles.length; i++) {
                        if (newRoles[i].getRole().getId() == Role.ID_REVIEWER) {
                            nrReviewers++;
                        }
                    }
                    TestCase[] testcases = documentManager.getTestCases(newProject, -1, user.getTCSubject());
                    if (testcases.length != nrReviewers) {
                        return new FailureResult("Cannot move from review without having one testcase-upload per reviewer");
                    }
                }
                /* this comment disables test case review completion enforcement

                // for dev projects
                if (newProject.getProjectType().getId() == ProjectType.ID_DEVELOPMENT) {
                    com.topcoder.apps.review.document.TestCaseReview[] testCaseReviews =
                            documentManager.getTestCaseReview(newProject, user.getTCSubject());

                    // there must be 6 documents (3 reviewers reviewing each other)
                    if (testCaseReviews.length != 6) {
                        return new FailureResult("There must be exactly 6 test case reviews instead of "
                                                 + testCaseReviews.length);
                    }

                    // and each one must be completed and marked as approved
                    for (int i = 0; i < testCaseReviews.length; i++) {
                        LogHelper.log("### " + testCaseReviews[i].isCompleted()
                                      + " " + testCaseReviews[i].getTestCaseApproval().getName());
                        //if (!testCaseReviews[i].isCompleted()) {
                        //    return new FailureResult(testCaseReviews[i].getReviewer().getHandle()
                        //                             + "'s test case review for "
                        //                             + testCaseReviews[i].getReviewee().getHandle() + " is not completed");
                        //}

                        if (testCaseReviews[i].getTestCaseApproval().getId() != TestCaseApproval.ID_APPROVED) {
                            return new FailureResult(testCaseReviews[i].getReviewer().getHandle()
                                                     + " did not approve "
                                                     + testCaseReviews[i].getReviewee().getHandle() + "'s test cases");
                        }
                    }
                }*/
            }

            // When moving to aggregation
            // check if there is an aggregator
            // check that all appeals are resolved
            UserRole[] newRoles = newProject.getParticipants();
/* by cucu
            if ((oldProject.getCurrentPhase().getId() == Phase.ID_REVIEW ||
                    oldProject.getCurrentPhase().getId() == Phase.ID_APPEALS)
                    && newProject.getCurrentPhase().getId() == Phase.ID_AGGREGATION) {
*/
            if ((oldProject.getCurrentPhase().getId() == Phase.ID_REVIEW ||
                    oldProject.getCurrentPhase().getId() == Phase.ID_APPEALS ||
                    oldProject.getCurrentPhase().getId() == Phase.ID_APPEALS_RESPONSE)
                    && newProject.getCurrentPhase().getId() == Phase.ID_AGGREGATION) {

                // check if we have an aggregator
                boolean aggregatorExists = false;
                for (int i = 0; i < newRoles.length; i++) {
                    if (RoleHelper.isAggregator(newRoles[i]) && newRoles[i].getUser() != null) {
                        aggregatorExists = true;
                        break;
                    }
                }
                if (!aggregatorExists) {
                    return new FailureResult("Can't move to aggregation without having the aggregator set");
                }

                // check that all appeals are resolved
                Appeal[] appeals = documentManager.getAppeals(newProject, -1, -1, user.getTCSubject());
                for (int i = 0; i < appeals.length; i++) {
                    if (!appeals[i].isResolved()) {
                        return new FailureResult("Can't move to aggregation with unresolved appeals");
                    }
                }
            } // end of checking when moving to aggregation

            // check if aggregation is completed
            if (oldProject.getCurrentPhase().getId() == Phase.ID_AGGREGATION
                        && newProject.getCurrentPhase().getId() == Phase.ID_AGGREGATION_REVIEW) {
                if (!documentManager.getAggregation(newProject, user.getTCSubject()).isCompleted()) {
                    return new FailureResult("Aggregation is not completed yet");
                }
            }

            // check if aggregation reviews are completed and approve the aggregation
            if (oldProject.getCurrentPhase().getId() == Phase.ID_AGGREGATION_REVIEW
                        && newProject.getCurrentPhase().getId() == Phase.ID_FINAL_FIXES) {
                AggregationReview[] revs = documentManager.getAggregationReview(newProject, user.getTCSubject());
                for (int i = 0; i < revs.length; i++) {
                    if (!revs[i].isCompleted()) {
                        return new FailureResult("An aggregation review is not completed yet");
                    }
                    if (revs[i].getStatus().getId() != AggregationApproval.ID_APPROVED) {
                        return new FailureResult("The aggregation is not approved by an aggregation review");
                    }
                }
            }

            // protect DB integrity using transactions in case one of the DB update operations fails
            // WARNING: return statements are not permitted without rollbacking
            // the transaction first
            if (!EJBHelper.isTestMode()) {
                Context initial = new InitialContext();
                ut = (UserTransaction) initial.lookup("UserTransaction");
                try {
                    LogHelper.log("before begin, ut.getStatus(): " + ut.getStatus());
                } catch (SystemException e) {
                }
                shouldRollback = true;
                ut.begin();
                try {
                    LogHelper.log("after begin, ut.getStatus(): " + ut.getStatus());
                } catch (SystemException e) {
                }
            }

            // set winner when phase changes from review to aggregation
            PrincipalMgrRemote principalMgr = EJBHelper.getPrincipalMgr();
/* by cucu
            if (((oldProject.getCurrentPhase().getId() == Phase.ID_REVIEW ||
                    oldProject.getCurrentPhase().getId() == Phase.ID_APPEALS || EJBHelper.isTestMode())
                        && newProject.getCurrentPhase().getId() == Phase.ID_AGGREGATION)
                    || (oldProject.getCurrentPhase().getId() == Phase.ID_AGGREGATION_REVIEW
                        && newProject.getCurrentPhase().getId() == Phase.ID_FINAL_FIXES)) {
*/
            if (((oldProject.getCurrentPhase().getId() == Phase.ID_REVIEW ||
                    oldProject.getCurrentPhase().getId() == Phase.ID_APPEALS ||
                    oldProject.getCurrentPhase().getId() == Phase.ID_APPEALS_RESPONSE ||
                    EJBHelper.isTestMode())
                        && newProject.getCurrentPhase().getId() == Phase.ID_AGGREGATION)
                    || (oldProject.getCurrentPhase().getId() == Phase.ID_AGGREGATION_REVIEW
                        && newProject.getCurrentPhase().getId() == Phase.ID_FINAL_FIXES)) {


                InitialSubmission[] submissions =
                    documentManager.getInitialSubmissions(oldProject, false, user.getTCSubject());
                if (submissions == null || submissions.length < 1) {
                    handleRollback(shouldRollback, ut);
                    return new FailureResult("Cannot establish the winner because there are no submissions");
                }

                // iterate submissions and find the winner
                //Item[] items = new Item[submissions.length];
                List itemList = new LinkedList();

                double max = -1.0;
                User winner = null;
                final ReviewScorecard[] scorecards = documentManager.getReviewScorecard(newProject, user.getTCSubject());

                for (int i = 0; i < submissions.length; i++) {
                    //added advanced to review - rfairfax 10-26
                    if (!submissions[i].isRemoved() && submissions[i].isAdvancedToReview()) {
                        // compute the average of the scorecards for the current submission
                        double sum = 0.0;
                        int count = 0;
                        for (int j = 0; j < scorecards.length; j++) {
                            if (scorecards[j].getSubmission().equals(submissions[i]) && scorecards[j].isCompleted()) {
                                count++;
                                sum += scorecards[j].getScore();
                            }
                        }

                        // we must have exactly REVIEWER_COUNT scorecards
                        if (count != REVIEWER_COUNT) {
                            handleRollback(shouldRollback, ut);
                            return new FailureResult("Cannot establish winner because "
                                    + submissions[i].getSubmitter().getHandle() + " has " + count
                                    + " review scorecards instead of " + REVIEWER_COUNT + ".");
                        }

                        // we cannot set the winner if there is a tie
                        //ties are now being handled below
                        /*
                        if (Math.abs(sum / count - max) < EPS) {
                            handleRollback(shouldRollback, ut);
                            return new FailureResult("Cannot establish winner because there is a tie between "
                                    + winner.getHandle() + " and " + submissions[i].getSubmitter().getHandle());
                        }*/

                        // update winner
                        if ((sum / count) > max) {
                            max = sum / count;
                            winner = submissions[i].getSubmitter();
                        }

                        Item item = new Item(sum / count, submissions[i]);
                        itemList.add(item);
                    } else {
                        submissions[i].setPlacement(-1);
                        submissions[i].setFinalScore(-1);
                        documentManager.saveInitialSubmission(submissions[i], user.getTCSubject());
                    }
                }
                Item[] items = (Item[])itemList.toArray(new Item[itemList.size()]);

                // the winner must have at least MINSCORE (75.0 currently)
                if (minscore < 0) {
                    minscore = ConfigHelper.getMinimumScore();
                }
                if (max < minscore) {
                    handleRollback(shouldRollback, ut);
                    return new FailureResult("Cannot establish winner because the maximum score is below " + minscore);
                }

                Arrays.sort(items, new Comparator() {
                            public int compare(Object obj1, Object obj2) {
                                if(Double.compare(((Item) obj2).getScore(),
                                        ((Item) obj1).getScore()) == 0)
                                {
                                    //break ties
                                    int[] vals = new int[2];
                                    for(int y = 0; y < scorecards.length; y++)
                                    {
                                            if(scorecards[y].getSubmission().equals(((Item)obj1).getSubmission()) && scorecards[y].isCompleted())
                                            {
                                                    double scr = scorecards[y].getScore();
                                                    boolean good = true;
                                                    for(int z = 0; z < scorecards.length; z++)
                                                    {
                                                        if((!scorecards[z].getSubmission().equals(((Item)obj1).getSubmission())) && scorecards[z].isCompleted()
                                                            && scorecards[z].getAuthor().getId() == scorecards[y].getAuthor().getId() && (scr - scorecards[z].getScore()) < EPS
                                                            && scorecards[z].getSubmission().getSubmitter().getId() == ((Item)obj2).getSubmission().getSubmitter().getId())
                                                        {
                                                            good = false;
                                                        }
                                                    }
                                                    if(good)
                                                        vals[0]++;
                                            }

                                            if(scorecards[y].getSubmission().equals(((Item)obj2).getSubmission()) && scorecards[y].isCompleted())
                                            {
                                                    double scr = scorecards[y].getScore();
                                                    boolean good = true;
                                                    for(int z = 0; z < scorecards.length; z++)
                                                    {
                                                        if((!scorecards[z].getSubmission().equals(((Item)obj2).getSubmission())) && scorecards[z].isCompleted()
                                                            && scorecards[z].getAuthor().getId() == scorecards[y].getAuthor().getId() && (scr - scorecards[z].getScore()) < EPS
                                                            && scorecards[z].getSubmission().getSubmitter().getId() == ((Item)obj1).getSubmission().getSubmitter().getId())
                                                        {
                                                            good = false;
                                                        }
                                                    }
                                                    if(good)
                                                        vals[1]++;
                                            }
                                    }
                                    System.out.println(((Item)obj1).getSubmission().getSubmitter().getHandle() + "=" + vals[0]);
                                    System.out.println(((Item)obj2).getSubmission().getSubmitter().getHandle() + "=" + vals[1]);
                                    return vals[1] - vals[0];
                                }
                                return Double.compare(((Item) obj2).getScore(),
                                        ((Item) obj1).getScore());
                            }});


                winner = items[0].getSubmission().getSubmitter();

                // set winner and assign permission to submit final fix for winner
                newProject.setWinner(winner);

                // give the winner final fix submit permission
                UserPrincipal userPrincipal = principalMgr.getUser(winner.getId());
                RolePrincipal rolePrincipal = getRolePrincipal(null, newProject, user.getTCSubject());
                principalMgr.unAssignRole(userPrincipal, rolePrincipal, user.getTCSubject());
                principalMgr.assignRole(userPrincipal, rolePrincipal, user.getTCSubject());


                for (int i = 0; i < items.length; i++) {
                    InitialSubmission sub = items[i].getSubmission();
                    sub.setPlacement(i+1);
                    sub.setFinalScore((float)items[i].getScore());
                    documentManager.saveInitialSubmission(sub, user.getTCSubject());
                    if (newProject.getCurrentPhase().getId() == Phase.ID_FINAL_FIXES) {
                        //mailQueue.add(new ProjectChangeMail(user, items[i].getSubmission().getSubmitter(), oldProject, newProject,
                        //                             projectData.getReason(), MailHelper.RESULT_NOTIFICATION));
                        mailQueue.add(new ResultsMail(user, items[i].getSubmission().getSubmitter(),
                                                  items[i].getScore(), i + 1, newProject));
                    }
                }
            } // END of set winner when phase changes from review/appeals to aggregation


            int changeType = MailHelper.NO_CHANGE;

            // detect phase change
            if (!newProject.getCurrentPhase().equals(oldProject.getCurrentPhase())) {
                changeType |= MailHelper.PHASE_CHANGE;
            }

            // detect timeline change
            PhaseInstance[] oldTimeLine = oldProject.getTimeline();
            PhaseInstance[] newTimeLine = newProject.getTimeline();
            for (int i = 0; i < oldTimeLine.length && i < newTimeLine.length; i++) {
                if (!equals(oldTimeLine[i].getStartDate(), newTimeLine[i].getStartDate())
                        || !equals(oldTimeLine[i].getEndDate(), newTimeLine[i].getEndDate())) {
                    changeType |= MailHelper.TIMELINE_CHANGE;
                    break;
                }
            }

            // detect user roles change
            boolean isRoleChange = false;
            UserRole[] oldRoles = oldProject.getParticipants();
            HashSet submitterSet = new HashSet();
            for (int i = 0; i < newRoles.length; i++) {
                if (newRoles[i].getRole().getId() == Role.ID_DESIGNER_DEVELOPER &&
                        newRoles[i].getUser() != null) {
                    submitterSet.add(newRoles[i].getUser());
                }
            }
            HashSet problemSet = new HashSet();
            for (int i = 0; i < oldRoles.length && i < newRoles.length; i++) {
                if (!oldRoles[i].getRole().equals(newRoles[i].getRole())
                        || !equals(newRoles[i].getUser(), oldRoles[i].getUser())) {
                    changeType |= MailHelper.ROLE_CHANGE;
                    isRoleChange = true;
                    if (submitterSet.contains(newRoles[i].getUser())) {
                        problemSet.add(newRoles[i].getUser());
                    }
                }
            }
            if (projectData.getSubmitterRemoval() && !problemSet.isEmpty()) {
                LogHelper.log("Remove submitter roles");
                UserRole[] keepRoles = new UserRole[newRoles.length - problemSet.size()];
                int j=0;
                for (int i = 0; i < newRoles.length; i++) {
                    if (!(newRoles[i].getRole().getId() == Role.ID_DESIGNER_DEVELOPER &&
                            newRoles[i].getUser() != null &&
                            problemSet.contains(newRoles[i].getUser()))) {
                        keepRoles[j++] = newRoles[i];
                    }
                }
                newProject.setParticipants(keepRoles);
                newRoles = keepRoles;
            } else if (!problemSet.isEmpty()) {
                projectData.setSubmitterRemoval(true);
                handleRollback(shouldRollback, ut);
                return new SubmitterRemovalResult(problemSet);
            }

/*
            if ((changeType & MailHelper.PHASE_CHANGE) != MailHelper.NO_CHANGE) {
                LogHelper.log("PHASE CHANGE DETECTED");
            }
            if ((changeType & MailHelper.TIMELINE_CHANGE) != MailHelper.NO_CHANGE) {
                LogHelper.log("TIMELINE CHANGE DETECTED");
            }
            if ((changeType & MailHelper.ROLE_CHANGE) != MailHelper.NO_CHANGE) {
                LogHelper.log("ROLE CHANGE DETECTED");
            }
            LogHelper.log("CHANGE TYPE = " + changeType);
 */

            // if all old roles are unassigned then set the weekly notification flag to false
            // (in case it isn't set that way by default for a new project)
            boolean allNulls = true;
            for (int i = 0; i < oldRoles.length; i++) {
                if (oldRoles[i].getUser() != null) {
                    allNulls = false;
                    break;
                }
            }
            if (allNulls) {
                newProject.setNotificationSent(false);
            }

            boolean sendRoleChangeNotifications = isRoleChange;

            // if the weekly notification have not yet been sent then no role change notifications should be sent yet
            // so clear the role change flags
            if (!newProject.isNotificationSent()) {
                sendRoleChangeNotifications = false;
                // clear the bit corresponding to role change
                // (set it using OR then clear it by using XOR)
                changeType = (changeType | MailHelper.ROLE_CHANGE) ^ MailHelper.ROLE_CHANGE;
            }

            // send notifications
            if (changeType != MailHelper.NO_CHANGE) {
                // get the set of users to notify
                HashSet users = new HashSet();
                for (int i = 0; i < oldRoles.length; i++) {
                    // when the roles change only the reviewers / PM should be notified
                    // when phase / timeline change everyone is notified
                    if ((!sendRoleChangeNotifications || RoleHelper.isReviewer(oldRoles[i])
                             || RoleHelper.isProductManager(oldRoles[i])) && oldRoles[i].getUser() != null) {
                        users.add(oldRoles[i].getUser());
                    }
                }
                for (int i = 0; i < newRoles.length; i++) {
                    // when the roles change only the reviewers / PM should be notified
                    // when phase / timeline change everyone is notified
                    if ((!sendRoleChangeNotifications || RoleHelper.isReviewer(newRoles[i])
                             || RoleHelper.isProductManager(newRoles[i])) && newRoles[i].getUser() != null) {
                        users.add(newRoles[i].getUser());
                    }
                }
                // notify the admin that made the change too
                users.add(user);

                // set notifications
                for (Iterator it = users.iterator(); it.hasNext();) {
                    User rev = (User) it.next();
                    // after the review phase do not send mails to losers (non-winners)
                    PhaseManager phaseManager = (PhaseManager) Common.getFromCache("PhaseManager");
/* by cucu
                      if (newProject.getCurrentPhase().getOrder() > phaseManager.getPhase(Phase.ID_APPEALS).getOrder()
                                && RoleHelper.isSubmitterOnly(rev, newProject)
                                && !rev.equals(newProject.getWinner())) {
*/
                      if (newProject.getCurrentPhase().getOrder() > phaseManager.getPhase(Phase.ID_APPEALS_RESPONSE).getOrder()
                                && RoleHelper.isSubmitterOnly(rev, newProject)
                                && !rev.equals(newProject.getWinner())) {
                        LogHelper.log("Not sending mail to submitter " + rev.getHandle()
                                    + " because the phase is past review and he is not a winner");
                    // do not send mails to "fake" submitters
                    } else if (!RoleHelper.isFakeSubmitter(rev, newProject, user)) {
                        mailQueue.add(new ProjectChangeMail(
                                      user, rev, oldProject, newProject, projectData.getReason(), changeType));
                    }
                }
            }

            HashSet removeSet = new HashSet();
            HashSet addSet = new HashSet();
            HashMap newRolesMap = new HashMap();
            HashMap oldRolesMap = new HashMap();
            boolean closed = !PhaseHelper.isClosed(oldProject) && PhaseHelper.isClosed(newProject);

            if (!closed) {
                for (int i = 0; i < newRoles.length; i++) {
                    newRolesMap.put(new Long(newRoles[i].getId()), newRoles[i]);
                }
                for (int i = 0; i < oldRoles.length; i++) {
                    oldRolesMap.put(new Long(oldRoles[i].getId()), oldRoles[i]);
                    if (newRolesMap.containsKey(new Long(oldRoles[i].getId()))) {
                        UserRole newUserRole = (UserRole)newRolesMap.get(new Long(oldRoles[i].getId()));
                        if (!equals(oldRoles[i].getUser(), newUserRole.getUser())) {
                            if (oldRoles[i].getUser() != null) {
                                removeSet.add(oldRoles[i]);
                            }
                            if (newUserRole != null) {
                                addSet.add(newUserRole);
                            }
                        }
                    } else if (oldRoles[i].getUser() != null){
                        removeSet.add(oldRoles[i]);
                    }
                }
                for (int i = 0; i < newRoles.length; i++) {
                    if (!oldRolesMap.containsKey(new Long(newRoles[i].getId()))) {
                        if (newRoles[i].getUser() != null)
                            addSet.add(newRoles[i]);
                    }
                }
            } else {
                for (int i = 0; i < oldRoles.length; i++) {
                    removeSet.add(oldRoles[i]);
                }
            }

            // remove permission for old reviewers and remove all permission if project closes
            if (isRoleChange || closed) {
                // remove old permissions
//                for (int i = 0; i < oldRoles.length; i++) {
                for (Iterator iter = removeSet.iterator(); iter.hasNext();) {
                    UserRole removeUserRole = (UserRole) iter.next();
                    if (removeUserRole.getUser() != null) {
                        // remove permission for the current role
                        UserPrincipal userPrincipal = principalMgr.getUser(removeUserRole.getUser().getId());
                        RolePrincipal rolePrincipal = getRolePrincipal(removeUserRole, oldProject, user.getTCSubject());
                        if (rolePrincipal != null) {
                            principalMgr.unAssignRole(userPrincipal, rolePrincipal, user.getTCSubject());
                            LogHelper.log(userPrincipal.getName() + " has lost role " + rolePrincipal.getName());

                            // remove the generic View Project permission
                            String roleName = oldProject.getName() + " " + oldProject.getVersion() + " " +
                                    oldProject.getProjectType().getName() + " " + "View Project";
                            rolePrincipal = getRolePrincipal(roleName, user.getTCSubject());
                            principalMgr.unAssignRole(userPrincipal, rolePrincipal, user.getTCSubject());
                            LogHelper.log(userPrincipal.getName() + " has lost role " + rolePrincipal.getName());
                        }
                    }
                }

                //  add new permissions
                if (!closed) {
//                    for (int i = 0; i < newRoles.length; i++) {
                    for (Iterator iter = addSet.iterator(); iter.hasNext();) {
                        UserRole addUserRole = (UserRole) iter.next();
                        if (addUserRole.getUser() != null) {
                            // add permission for the current role
                            UserPrincipal userPrincipal = principalMgr.getUser(addUserRole.getUser().getId());
                            RolePrincipal rolePrincipal =
                                getRolePrincipal(addUserRole, newProject, user.getTCSubject());
                            if (rolePrincipal != null) {
                                // unassign and assign in case the user already had the role
                                principalMgr.unAssignRole(userPrincipal, rolePrincipal, user.getTCSubject());
                                principalMgr.assignRole(userPrincipal, rolePrincipal, user.getTCSubject());
                                LogHelper.log(userPrincipal.getName() + " has got role " + rolePrincipal.getName());

                                // add the generic View Project permission
                                String roleName = oldProject.getName() + " " + oldProject.getVersion() + " " +
                                        oldProject.getProjectType().getName() + " " + "View Project";
                                rolePrincipal = getRolePrincipal(roleName, user.getTCSubject());
                                // unassign and assign in case the user already had the role
                                principalMgr.unAssignRole(userPrincipal, rolePrincipal, user.getTCSubject());
                                principalMgr.assignRole(userPrincipal, rolePrincipal, user.getTCSubject());
                                LogHelper.log(userPrincipal.getName() + " has got role " + rolePrincipal.getName());

                                // add the forum permission
                                roleName = "ForumUser " + oldProject.getForumId();
                                rolePrincipal = getRolePrincipal(roleName, user.getTCSubject());
                                // unassign and assign in case the user already had the role
                                principalMgr.unAssignRole(userPrincipal, rolePrincipal, user.getTCSubject());
                                principalMgr.assignRole(userPrincipal, rolePrincipal, user.getTCSubject());
                                LogHelper.log(userPrincipal.getName() + " has got role " + rolePrincipal.getName());
                            }
                        }
                    }
                }
            }

            // when phase goes back from aggregation review to aggregation, set aggregation and aggregation reviews
            // to non-completed to give the reviewers the opportunity to change them
            if (oldProject.getCurrentPhase().getId() == Phase.ID_AGGREGATION_REVIEW
                        && newProject.getCurrentPhase().getId() == Phase.ID_AGGREGATION) {
                AggregationWorksheet aw = documentManager.getAggregation(newProject, user.getTCSubject());
                aw.setCompleted(false);
                documentManager.saveAggregation(aw, user.getTCSubject());
                AggregationReview[] revs = documentManager.getAggregationReview(newProject, user.getTCSubject());
                for (int i = 0; i < revs.length; i++) {
                    revs[i].setCompleted(false);
                    documentManager.saveAggregationReview(revs[i], user.getTCSubject());
                }
            }

            // save project
            projectTracker.saveProject(newProject, projectData.getReason(),
                    user.getTCSubject());

            // save submissions
            AbstractSubmission[] submissions = projectData.getSubmissions();
            if (submissions != null) {
                for (int i = 0; i < submissions.length; i++) {
                    if (submissions[i] instanceof InitialSubmission) {
                        documentManager.saveInitialSubmission((InitialSubmission) submissions[i], user.getTCSubject());
                    } else if (submissions[i] instanceof FinalFixSubmission) {
                        documentManager.saveFinalFixSubmission(
                            (FinalFixSubmission) submissions[i], user.getTCSubject());
                    }
                }
            }

            if (ut != null) {
                ut.commit();
                shouldRollback = false;
                LogHelper.log("Changes committed successfully");
            }

            LogHelper.log("SendMail-flag: " + projectData.getSendMail());
            if (projectData.getSendMail()) {
                LogHelper.log("Sending mails ...");
                // everything finished successfully so we can send mail notifications
                for (Iterator it = mailQueue.iterator(); it.hasNext();) {
                    Object obj = it.next();
                    if (obj instanceof ProjectChangeMail) {
                        ProjectChangeMail mail = (ProjectChangeMail) obj;
                        MailHelper.projectChangeMail(
                            mail.from, mail.to, mail.newProject, mail.reason);
                    } else {
                        ResultsMail mail = (ResultsMail) obj;
                        MailHelper.resultsMail(mail.from, mail.to, mail.score, mail.place, mail.project);
                    }
                }
            }

            return new SuccessResult();

        // throw RuntimeExceptions and Errors, wrap other exceptions in FailureResult
        } catch (RuntimeException e) {
            handleRollback(shouldRollback, ut);
            LogHelper.log("", e);
            throw e;
        } catch (Error e) {
            handleRollback(shouldRollback, ut);
            LogHelper.log("", e);
            throw e;
        } catch (Exception e) {
            handleRollback(shouldRollback, ut);
            return new FailureResult(e);
        }
    }

    private void handleRollback(boolean shouldRollback, UserTransaction ut) {
        if (!shouldRollback) {
            LogHelper.log("No changes made or changes committed ... no rollback");
            if (ut != null) {
                try {
                    LogHelper.log("ut.getStatus(): " + ut.getStatus());
                } catch (SystemException e) {
                }
            }
        }
        else if (ut != null) {
            try {
                LogHelper.log("Rolling back transaction ... hope it works");
                try {
                    LogHelper.log("ut.getStatus(): " + ut.getStatus());
                } catch (SystemException e) {
                }
                ut.rollback();
                try {
                    LogHelper.log("ut.getStatus(): " + ut.getStatus());
                } catch (SystemException e) {
                }
            } catch (Exception e) {
                LogHelper.log("ProjectAdministration rollback exception: ", e);
            }
        }
    }

    private String getRolePrefix(Project project) {
        return project.getName() + " " + project.getVersion() + " " + project.getProjectType().getName() + " ";
    }

    /**
     * Get the security manager role principal corresponding to a application user role in a project.
     *
     * @param userRole the user role
     * @param project the project
     * @param requestor the user making the request
     *
     * @return the role principal or null if there isn't such role
     *
     * @exception Exception remoting and EJB related
     *
     */
    private RolePrincipal getRolePrincipal(UserRole userRole, Project project, TCSubject requestor) throws Exception {
        String prefix = getRolePrefix(project);
        if (userRole == null) {
            return getRolePrincipal(prefix + "Submit Final Fix", requestor);
        } else if (RoleHelper.isSubmitter(userRole)) {
            return getRolePrincipal(prefix + "Submit", requestor);
        } else if (RoleHelper.isScreener(userRole)) {
            return getRolePrincipal(prefix + "Screen", requestor);
        } else if (RoleHelper.isReviewer(userRole)) {
            return getRolePrincipal(prefix + "Review", requestor);
        } else if (RoleHelper.isAggregator(userRole)) {
            return getRolePrincipal(prefix + "Aggregation", requestor);
        } else if (RoleHelper.isFinalReviewer(userRole)) {
            return getRolePrincipal(prefix + "Final Review", requestor);
        }
        return null;
    }

    /**
     * Cache for the roles obtained by the expensive PrincipalMgr getRoles method.
     */
    private static Map rolesCache = Collections.synchronizedMap(new HashMap());

    /**
     * Get the security manager role principal corresponding to a role name.
     *
     * @param roleName the role name
     * @param requestor the user making the request
     *
     * @return the role principal
     *
     * @exception Exception remoting and EJB related
     */
    private RolePrincipal getRolePrincipal(String roleName, TCSubject requestor) throws Exception {
        RolePrincipal result = (RolePrincipal) rolesCache.get(roleName);
        if (result == null) {
            PrincipalMgrRemote principalMgr = EJBHelper.getPrincipalMgr();
            for (Iterator it = principalMgr.getRoles(requestor).iterator(); it.hasNext();) {
                RolePrincipal rolePrincipal = (RolePrincipal) it.next();
                rolesCache.put(rolePrincipal.getName(), rolePrincipal);
            }
            result = (RolePrincipal) rolesCache.get(roleName);
            if (result == null) {
                LogHelper.log("Role cache contents:");
                for (Iterator it = rolesCache.keySet().iterator(); it.hasNext();) {
                    System.err.println((String) it.next());
                }
                throw new GeneralSecurityException("Cannot find role " + roleName);
            }
        }
        return result;
    }

    /**
     * Tests if two Objects are equal taking nulls into consideration.
     *
     * @param a an object
     * @param b an object
     *
     * @return whether the Objects are equal or not
     */
    static boolean equals(Object a, Object b) {
        return a == b || (a != null && a.equals(b));
    }

}

/**
 * Used to store a (submission, score) pair for sorting.
 */
class Item implements Comparable {

    /**
     * The score.
     */
    private double score = 0;

    /**
     * The initial submission.
     */
    private InitialSubmission subm = null;

    /**
     * Constructor.
     *
     * @param score the score
     * @param subm the initial submission
     */
    Item(double score, InitialSubmission subm) {
        this.score = score;
        this.subm = subm;
    }

    /**
     * Get the submission.
     *
     * @return the submission
     */
    InitialSubmission getSubmission() {
        return subm;
    }

    /**
     * Get the score.
     *
     * @return the score
     */
    double getScore() {
        return score;
    }

    /**
     * Reverse comparison of two Item objects based on the score.
     *
     * @param obj the object to compare to
     *
     * @return <0 if this is greater
     *         0 if this is equal
     *         >0 if this is smaller
     */
    public int compareTo(Object obj) {
        return Double.compare(((Item) obj).score, score);
    }

}

class ProjectChangeMail {
    ProjectChangeMail(SecurityEnabledUser from, User to, Project oldProject, Project newProject, String reason, int changeType) {
        this.from = from;
        this.to = to;
        this.oldProject = oldProject;
        this.newProject = newProject;
        this.reason = reason;
        this.changeType = changeType;
    }
    SecurityEnabledUser from;
    User to;
    Project oldProject;
    Project newProject;
    String reason;
    int changeType;
}

class ResultsMail {
    ResultsMail(SecurityEnabledUser from, User to, double score, int place, Project project) {
        this.from = from;
        this.to = to;
        this.score = score;
        this.place = place;
        this.project = project;
    }
    SecurityEnabledUser from;
    User to;
    double score;
    int place;
    Project project;
}

