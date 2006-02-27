/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractScorecard;
import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.util.log.Level;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForwards;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;

/**
 * <strong>Purpose</strong>:
 * Extends from <strong>ReviewAction</strong> that let the admin review the
 * submission.
 *
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * Added configurable max number of scores for marking screening as passed. (was hardcoded with 5)
 * </li>
 * </ol>
 *
 * @author TCSDEVELOPER, pulky
 * @version 1.0.1
 */
public final class ProjectManagerReviewAction extends ReviewAction {

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
        log(Level.INFO, "ProjectManagerReviewAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        long sid = -1;

        // Get the id parameter
        try {
            sid = Long.parseLong
                    (String.valueOf(request.getParameter(Constants.SUBMITTER_ID_KEY)));
        } catch (NumberFormatException e) {
            sid = -1;
        }

        // Call business layer
        BusinessDelegate businessDelegate = new BusinessDelegate();
        ResultData result = businessDelegate.projectDetail(orpd);
        AbstractSubmission submission = null;

        if (result instanceof SuccessResult) {
            ProjectRetrieval pr = (ProjectRetrieval) result;

            if (pr.getSubmissions() != null) {
                for (int i = 0; i < pr.getSubmissions().length; i++) {
                    if (pr.getSubmissions()[i].getSubmitter().getId() == sid) {
                        submission = pr.getSubmissions()[i];
                        break;
                    }
                }
            }

            if (submission == null) {
                return new FailureResult("No submission found!");
            } else {
                form = new SubmissionForm();
                ((SubmissionForm) form).fromSubmission(submission, pr.getSubmissions(), pr.getScorecards());

                //set advanced flag if screening
                if (((SubmissionForm) form).getIsScreening()) {
                    //build scores array
                    //get top "maxNumberPassingScores" scores first
                    ArrayList scores = new ArrayList();

                    AbstractScorecard[] scorecards = pr.getScorecards();

                    double minscore;
                    try {
                        minscore = ConfigHelper.getMinimumScore();
                    } catch (Exception e) {
                        minscore = 75;
                    }

                    int maxNumberPassingScores;
                    try {
                        maxNumberPassingScores = ConfigHelper.getMaxNumberPassingScores();
                    } catch (Exception e) {
                        maxNumberPassingScores = ConfigHelper.MAX_NUMBER_PASSING_SCORES_DEFAULT;
                    }

                    for (int i = 0; i < pr.getSubmissions().length; i++) {
                        if (!pr.getSubmissions()[i].isRemoved()) {
                            for (int j = 0; j < scorecards.length; j++) {
                                if (scorecards[j].getSubmission().equals(pr.getSubmissions()[i]) &&
                                    scorecards[j].isCompleted()) {
                                    if (scorecards[j] instanceof ScreeningScorecard) {
                                        if (((ScreeningScorecard) scorecards[j]).getPassed() &&
                                            scorecards[j].getScore() >= minscore) {
                                            scores.add(new Double(scorecards[j].getScore()));
                                        }
                                    }
                                }
                            }
                        }
                    }

                    //sort list
                    Collections.sort(scores);
                    Collections.reverse(scores);
                    //remove all but top "maxNumberPassingScores" scores.  No need to check ties,
                    //this will gaurentee they advance
                    while (scores.size() > maxNumberPassingScores) {
                        scores.remove(maxNumberPassingScores);
                    }

                    for (int i = 0; i < ((SubmissionForm) form).getScorecards().length; i++) {
                        AbstractScorecard scorecard = ((SubmissionForm) form).getScorecards()[i];
                        if (scorecard.getSubmission().getSubmitter().getId() == sid) {
                            if (scorecard.isPMReviewed() == false) {
                                if (scores.contains(new Double(scorecard.getScore()))) {
                                    ((SubmissionForm) form).setAdvanced(true);
                                } else {
                                    ((SubmissionForm) form).setAdvanced(false);
                                }
                            } else {
                                ((SubmissionForm) form).setAdvanced(
                                    ((InitialSubmission) scorecard.getSubmission()).isAdvancedToReview());
                            }

                        }
                    }
                }

                request.getSession().setAttribute(mapping.getAttribute(), form);

                saveToken(request);

                forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
                forwards.addForward(mapping.findForward(Constants.EDIT_KEY));
            }
        }

        return result;
    }
}
