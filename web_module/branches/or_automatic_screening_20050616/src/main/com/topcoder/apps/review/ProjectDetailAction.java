/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectType;
import com.topcoder.apps.review.projecttracker.Role;
import com.topcoder.apps.review.projecttracker.UserRole;
import com.topcoder.util.log.Level;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForwards;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that renders the information
 * of the specified project.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class ProjectDetailAction extends ReviewAction {

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Call the business logic layer and set session if possible.
     * </p>
     *
     * @return the result data.
     *
     * @param mapping The ActionMapping used to select this instance
     * @param form The optional ActionForm bean for this request (if any)
     * @param request The HTTP request we are processing
     * @param response The HTTP response we are creating
     * @param errors The action errors in calling the logic layer.
     * @param forwards The action forwards from calling the logic layer.
     * @param orpd The OnlineReviewProjectData to create the action data.
     */
    public ResultData executeLogic(ActionMapping mapping,
                                   ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response,
                                   ActionErrors errors,
                                   ActionForwards forwards,
                                   OnlineReviewProjectData orpd) {

        log(Level.INFO, "ProjectDetailAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        // Call business layer
        BusinessDelegate businessDelegate = new BusinessDelegate();
        ResultData result = businessDelegate.projectDetail(orpd);

        if (result instanceof SuccessResult) {
            UtilityBean utility = (UtilityBean) request.getSession().getAttribute(Constants.UTILITY_KEY);
            ProjectRetrieval pr = (ProjectRetrieval) result;

            boolean isAdmin = utility.getAdmin();
            boolean isPM = orpd.getUser().equals(pr.getProject().getProjectManager());
            long phaseId = pr.getProject().getCurrentPhase().getId();
            String action = String.valueOf(request.getParameter(Constants.ACTION_KEY));
            AbstractSubmission[] submissions = null;
            int len = pr.getSubmissions().length;

            //////////////////////////////////////////////////////////////////////////////////////////////////////////
            // Added by WishingBone - Automated Screening
            if (pr.getHistory() != null && pr.getHistory().length > 0 &&
                (String.valueOf(Constants.PHASE_SUBMISSION).equals(action) ||
                 pr.getProject().getCurrentPhase().getId() == Constants.PHASE_SUBMISSION)) {
                request.setAttribute(Constants.HISTORY_LIST_KEY, pr.getHistory());
            }
            //////////////////////////////////////////////////////////////////////////////////////////////////////////

            // Classify the initial submissions and final submission
            if (len > 0 && pr.getSubmissions()[len - 1] instanceof FinalFixSubmission) {
                submissions = new AbstractSubmission[len - 1];
                for (int i = 0; i < len - 1; i++) {
                    submissions[i] = pr.getSubmissions()[i];
                }
            } else {
                submissions = pr.getSubmissions();
            }


            // Find out whether the user has submitted solution
            utility.setSubmitted(false);
            for (int i = 0; i < pr.getSubmissions().length; i++) {
                if (orpd.getUser().equals(pr.getSubmissions()[i].getSubmitter())
                        && pr.getSubmissions()[i].isSubmitted()) {
                    utility.setSubmitted(true);
                    request.setAttribute(Constants.SUBMISSION_KEY, pr.getSubmissions()[i]);

                    // If a final submission exists for the user, the sumbission ID passed for downloanding
                    // will be -1 so it downloads the final submission and not the initial
                    if ((len > 0) && (pr.getSubmissions()[len - 1] instanceof FinalFixSubmission) &&
                         orpd.getUser().equals(pr.getSubmissions()[len - 1].getSubmitter())
                        && pr.getSubmissions()[len - 1].isSubmitted()) {
                        request.setAttribute(Constants.SUBMISSION_ID_KEY, new Long(-1));
                    } else {
                        request.setAttribute(Constants.SUBMISSION_ID_KEY, new Long(pr.getSubmissions()[i].getId()));
                    }

                    break;
                }
            }

            if (!utility.getSubmitted()) {
                for (int i = 0; i < pr.getScorecards().length; i++) {
                    if (orpd.getUser().equals(pr.getScorecards()[i].getSubmission().getSubmitter())) {
                        utility.setSubmitted(true);
                        break;
                    }
                }
            }

            boolean isReviewer = false;
            utility.setBoard(false);
            for (int i = 0; i < pr.getProject().getParticipants().length; i++) {
                long roleId = pr.getProject().getParticipants()[i].getRole().getId();
                if (roleId != Constants.ROLE_DESINGER_DEVELOPER && roleId != Constants.ROLE_REMOVED
                        && orpd.getUser().equals(pr.getProject().getParticipants()[i].getUser())) {
                    utility.setBoard(true);
                }
                if (roleId == Constants.ROLE_REVIEWER &&
                        orpd.getUser().equals(pr.getProject().getParticipants()[i].getUser())) {
                    isReviewer = true;
                }
            }

            // Populate sessions
            if (isAdmin || isPM) {
                ProjectForm pForm = new ProjectForm();
                pForm.fromProject(pr.getProject());

                ScorecardTemplate[] templates = businessDelegate.getScorecardTemplates();
                pForm.setScorecardTemplates(templates);

                pForm.setAction(Constants.ACTION_VIEW);
                if (String.valueOf(Constants.PHASE_SUBMISSION).equals(action)) {
                    phaseId = Constants.PHASE_SUBMISSION;
                    pForm.setAction(Constants.ACTION_PARTIAL);
                } else if (String.valueOf(Constants.PHASE_SCREENING).equals(action)) {
                    phaseId = Constants.PHASE_SCREENING;
                    pForm.setAction(Constants.ACTION_PARTIAL);
                } else if (String.valueOf(Constants.PHASE_REVIEW).equals(action)) {
                    phaseId = Constants.PHASE_REVIEW;
                    pForm.setAction(Constants.ACTION_PARTIAL);
                } else if (String.valueOf(Constants.PHASE_APPEALS).equals(action)) {
                    phaseId = Constants.PHASE_APPEALS;
                    pForm.setAction(Constants.ACTION_PARTIAL);
                } else if (String.valueOf(Constants.PHASE_FINAL_FIX).equals(action)) {
                    phaseId = Constants.PHASE_FINAL_FIX;
                    pForm.setAction(Constants.ACTION_PARTIAL);
                }

                request.setAttribute(Constants.PROJECT_KEY, pForm);

                forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
                forwards.addForward(mapping.findForward(Constants.ADMIN_KEY));
            } else {
                ProjectForm pForm = new ProjectForm();
                pForm.fromProject(pr.getProject());
                pForm.setAction(Constants.ACTION_VIEW);

                request.setAttribute(Constants.PROJECT_KEY, pForm);
            }

            // More sessions
            utility.setNotice(null);
            if (phaseId == Constants.PHASE_SUBMISSION) {
                if (isAdmin || isPM) {
                    request.setAttribute(Constants.SUBMISSION_LIST_KEY, submissions);
                }
            } else if (phaseId == Constants.PHASE_SCREENING) {
                if (isAdmin || isPM) {
                    //hork up scorecards by setting advanced to review flag
                    //flag is set if scorecard isn't PM reviewed, and it in top 5 overall scores

                    //get top 5 scores first
                    ArrayList scores = new ArrayList();

                    AbstractScorecard[] scorecards = pr.getScorecards();

                    double minscore;
                    try {
                        minscore = ConfigHelper.getMinimumScore();
                    } catch (Exception e) {
                        minscore = 75;
                    }

                    for (int i = 0; i < submissions.length; i++) {
                        if (!submissions[i].isRemoved()) {
                            for (int j = 0; j < scorecards.length; j++) {
                                if (scorecards[j] instanceof ScreeningScorecard && scorecards[j].getSubmission().equals(submissions[i]) && scorecards[j].isCompleted()) {
                                    if (((ScreeningScorecard) scorecards[j]).getPassed() && scorecards[j].getScore() >= minscore) {
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
                    while (scores.size() > 5) {
                        scores.remove(5);
                    }

                    for (int i = 0; i < submissions.length; i++) {
                        if (!submissions[i].isRemoved()) {
                            for (int j = 0; j < scorecards.length; j++) {
                                if (scorecards[j] instanceof ScreeningScorecard && scorecards[j].getSubmission().equals(submissions[i]) && scorecards[j].isCompleted() && !scorecards[j].isPMReviewed()) {
                                    if (((ScreeningScorecard) scorecards[j]).getPassed() && scores.contains(new Double(scorecards[j].getScore()))) {
                                        ((InitialSubmission) submissions[i]).setAdvancedToReview(true);
                                    } else {
                                        ((InitialSubmission) submissions[i]).setAdvancedToReview(false);
                                    }
                                }
                            }
                        }
                    }

                    AdminScreeningScorecardBean[] beans =
                            new AdminScreeningScorecardBean[submissions.length];
                    for (int i = 0; i < submissions.length; i++) {
                        beans[i] = new AdminScreeningScorecardBean(submissions[i],
                                pr.getScorecards());
                    }
                    request.setAttribute(Constants.SCREENING_LIST_KEY, beans);
                }
                if (pr.getScorecards() != null) {
                    for (int i = 0; i < pr.getScorecards().length; i++) {
                        if (!pr.getScorecards()[i].isCompleted()) {
                            String arg0 =
                                    messages.getMessage("prompt.screeningScorecards");
                            String notice =
                                    messages.getMessage("prompt.incompleteTemplate", arg0);

                            utility.setNotice(notice);
                            break;
                        }
                    }
                }
            } else if (phaseId == Constants.PHASE_REVIEW) {
                if (isAdmin || isPM) {
                    List beansList = new LinkedList();
                    for (int i = 0; i < submissions.length; i++) {
                        //added advanced to review - rfairfax 10-26
                        if (((InitialSubmission) submissions[i]).isAdvancedToReview()) {
                            AdminReviewScorecardBean adminBean =
                                    new AdminReviewScorecardBean(pr.getProject(),
                                            submissions[i],
                                            pr.getScorecards());
                            beansList.add(adminBean);
                        }
                    }
                    AdminReviewScorecardBean[] beans = (AdminReviewScorecardBean[])
                            beansList.toArray(new AdminReviewScorecardBean[beansList.size()]);
                    request.setAttribute(Constants.REVIEW_LIST_KEY, beans);
                }
                if (pr.getScorecards() != null) {
                    for (int i = 0; i < pr.getScorecards().length; i++) {
                        AbstractScorecard scorecard = pr.getScorecards()[i];

                        if (scorecard instanceof ReviewScorecard && !scorecard.isCompleted()) {
                            String arg0 =
                                    messages.getMessage("prompt.reviewScorecards");
                            String notice =
                                    messages.getMessage("prompt.incompleteTemplate", arg0);

                            utility.setNotice(notice);
                            break;
                        }
                    }
                }
                Project project = pr.getProject();
                if (project.getProjectType().getId() == ProjectType.ID_DEVELOPMENT) {
                    // Check that all testcases are uploaded (if development project)
                    TestCase[] testcases = pr.getTestCases();
                    if (isAdmin || isPM) {
                        UserRole[] roles = project.getParticipants();
                        int nrReviewers = 0;
                        for (int i = 0; i < roles.length; i++) {
                            if (roles[i].getRole().getId() == Role.ID_REVIEWER) {
                                nrReviewers++;
                            }
                        }
                        if (testcases != null && testcases.length != nrReviewers) {
                            String notice = utility.getNotice();
                            if (notice == null)
                                notice = "";
                            else
                                notice += "\n";
                            notice += messages.getMessage("prompt.missingTestcases");
                            utility.setNotice(notice);
                        }
                    } else if (isReviewer) {
                        boolean isMissing = true;
                        for (int i = 0; i < testcases.length; i++) {
                            if (testcases[i].getReviewer().getId() == orpd.getUser().getId() &&
                                    testcases[i].getId() != -1) {
                                isMissing = false;
                                break;
                            }
                        }
                        if (isMissing) {
                            String notice = utility.getNotice();
                            if (notice == null)
                                notice = "";
                            else
                                notice += "\n";
                            notice += messages.getMessage("prompt.missingTestcases");
                            utility.setNotice(notice);
                        }
                    }
                }
/* by cucu
            } else if (phaseId == Constants.PHASE_APPEALS) {
                AppealData aData = new AppealData(orpd, null, -1, -1);
                AppealsRetrieval ar = (AppealsRetrieval)businessDelegate.appealProject(aData);
                Appeal[] appeals = ar.getAppeals();

                // check that all appeals are resolved
                for (int i = 0; i < appeals.length; i++) {
                    if (!appeals[i].isResolved() &&
                            (isAdmin || isPM || (isReviewer &&
                                    orpd.getUser().getId() == appeals[i].getReviewer().getId()))) {
                        String notice =
                            messages.getMessage("prompt.unresolvedAppeals");
                        utility.setNotice(notice);
                        break;
                    }
                }

                request.setAttribute(Constants.APPEAL_LIST_KEY, appeals);
*/
            } else if (phaseId == Constants.PHASE_APPEALS) {
                AppealData aData = new AppealData(orpd, null, -1, -1);
                AppealsRetrieval ar = (AppealsRetrieval) businessDelegate.appealProject(aData);
                Appeal[] appeals = ar.getAppeals();
                request.setAttribute(Constants.APPEAL_LIST_KEY, appeals);

            } else if (phaseId == Constants.PHASE_APPEALS_RESPONSE) {
                AppealData aData = new AppealData(orpd, null, -1, -1);
                AppealsRetrieval ar = (AppealsRetrieval) businessDelegate.appealProject(aData);
                Appeal[] appeals = ar.getAppeals();

                // check that all appeals are resolved
                for (int i = 0; i < appeals.length; i++) {
                    if (!appeals[i].isResolved() &&
                            (isAdmin || isPM || (isReviewer &&
                            orpd.getUser().getId() == appeals[i].getReviewer().getId()))) {
                        String notice =
                                messages.getMessage("prompt.unresolvedAppeals");
                        utility.setNotice(notice);
                        break;
                    }
                }

                request.setAttribute(Constants.APPEAL_LIST_KEY, appeals);
// end by cucu


            } else if (phaseId == Constants.PHASE_AGGREGATION) {
                AggregationData data = new AggregationData(orpd, null);
                result = businessDelegate.aggregationWorksheet(data);
                if (result instanceof SuccessResult) {
                    AggregationWorksheetRetrieval awr =
                            (AggregationWorksheetRetrieval) result;
                    if (isAdmin || isPM) {
                        request.setAttribute(Constants.AGGREGATION_KEY,
                                awr.getWorksheet());
                    }
                    if (awr.getWorksheet() != null) {
                        if (!awr.getWorksheet().isCompleted()) {
                            String arg0 =
                                    messages.getMessage("prompt.aggregationWorksheet");
                            String notice =
                                    messages.getMessage("prompt.incompleteTemplate", arg0);

                            utility.setNotice(notice);
                        }
                    }
                } else if (!isAdmin && !isPM) {
                    return null;
                }
            } else if (phaseId == Constants.PHASE_AGG_REVIEW) {
                AggregationReviewData data =
                        new AggregationReviewData(orpd, null);
                result = businessDelegate.aggregationReview(data);
                if (result instanceof SuccessResult) {
                    AggregationReviewRetrieval arr =
                            (AggregationReviewRetrieval) result;
                    if (isAdmin || isPM) {
                        List list = new ArrayList();
                        AdminAggregationReviewBean[] beans = null;

                        for (int i = 0; i < pr.getProject().getParticipants().length; i++) {
                            if (pr.getProject().getParticipants()[i].getRole().getId()
                                    == Constants.ROLE_REVIEWER) {
                                list.add(new AdminAggregationReviewBean(pr.getProject(),
                                        pr.getProject().getParticipants()[i].getUser(),
                                        arr.getAggregationReviews()));
                            }
                        }
                        beans = new AdminAggregationReviewBean[list.size()];
                        list.toArray(beans);

                        request.setAttribute(Constants.AGG_REVIEW_LIST_KEY, beans);
                    }
                    if (arr.getAggregationReviews() != null) {
                        for (int i = 0; i < arr.getAggregationReviews().length; i++) {
                            if (!arr.getAggregationReviews()[i].isCompleted()) {
                                String arg0 =
                                        messages.getMessage("prompt.aggregationReview");
                                String notice =
                                        messages.getMessage("prompt.incompleteTemplate", arg0);

                                utility.setNotice(notice);
                                break;
                            }
                        }
                    }
                } else if (!isAdmin && !isPM) {
                    return null;
                }
            } else if (phaseId == Constants.PHASE_FINAL_FIX) {
                if (isAdmin || isPM) {
                    int idx = pr.getSubmissions().length - 1;
                    if (idx >= 0 && pr.getSubmissions()[idx] instanceof FinalFixSubmission) {
                        request.setAttribute(Constants.FINAL_FIX_KEY,
                                String.valueOf(pr.getProject().getId()));
                    } else {
                        request.setAttribute(Constants.FINAL_FIX_KEY,
                                new Boolean(false));
                        String arg0 =
                                messages.getMessage("prompt.finalFix");
                        String notice =
                                messages.getMessage("prompt.incompleteTemplate", arg0);

                        utility.setNotice(notice);
                    }
                }
            } else if (phaseId == Constants.PHASE_FINAL_REVIEW) {
                boolean isFinalReviewer = RoleHelper.isFinalReviewer(orpd.getUser(), pr.getProject());
                if (isFinalReviewer) {
                    int idx = pr.getSubmissions().length - 1;
                    if (idx >= 0 && pr.getSubmissions()[idx] instanceof FinalFixSubmission) {
                        request.setAttribute(Constants.FINAL_FIX_KEY,
                                String.valueOf(pr.getProject().getId()));
                    } else {
                        request.setAttribute(Constants.FINAL_FIX_KEY,
                                new Boolean(false));
                    }
                }

                FinalReviewData data = new FinalReviewData(orpd, null);
                data.setRetrieveFull(false);
                result = businessDelegate.finalReview(data);
                if (result instanceof SuccessResult) {
                    FinalReviewRetrieval frr =
                            (FinalReviewRetrieval) result;
                    if (isAdmin || isPM) {
                        request.setAttribute(Constants.FINAL_REVIEW_KEY,
                                frr.getFinalReview());
                    }
                    if (frr.getFinalReview() != null) {
                        if (!frr.getFinalReview().isCompleted()) {
                            String arg0 =
                                    messages.getMessage("prompt.finalReview");
                            String notice =
                                    messages.getMessage("prompt.incompleteTemplate", arg0);

                            utility.setNotice(notice);
                        }
                    }
                } else {
                    if (isAdmin || isPM) {
                        request.setAttribute(Constants.FINAL_REVIEW_KEY,
                                new Boolean(false));
                    }
                    return null;
                }
            }
        }

        return result;
    }
}
