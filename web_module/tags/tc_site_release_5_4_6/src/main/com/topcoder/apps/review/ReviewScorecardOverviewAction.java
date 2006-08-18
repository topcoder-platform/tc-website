/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.util.log.Level;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForwards;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that renders the information
 * of the overview of review scorecards.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class ReviewScorecardOverviewAction extends ReviewAction {

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
        log(Level.INFO, "ReviewScorecardOverviewAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        long sid = -1;

        // Get the id parameter
        try {
            sid = Long.parseLong
                    (request.getParameter(Constants.SUBMITTER_ID_KEY).toString());
        } catch (NumberFormatException e) {
            sid = -1;
        }

        // Call business layer
        BusinessDelegate businessDelegate = new BusinessDelegate();
        //ResultData result = businessDelegate.projectDetail(orpd);
        ReviewScorecardsData rsData = new ReviewScorecardsData(orpd);
        rsData.setRetrieveQuestions(true);
        ResultData result =
                businessDelegate.getReviewList(rsData);
        AbstractSubmission submission = null;

        if (result instanceof SuccessResult) {
            //ProjectRetrieval pr = (ProjectRetrieval) result;
            ReviewScorecardsRetrieval rsr = (ReviewScorecardsRetrieval) result;

//            if (pr.getSubmissions() != null) {
//                for (int i = 0; i < pr.getSubmissions().length; i++) {
//                    if (pr.getSubmissions()[i].getSubmitter().getId() == sid) {
//                        submission = pr.getSubmissions()[i];
//                        break;
//                    }
//                }
//            }
            submission = rsr.getScorecards()[0].getSubmission();

            if (submission == null) {
                return new FailureResult("No submission found!");
            } else {
//                AdminReviewScorecardBean bean =
//                    new AdminReviewScorecardBean(pr.getProject(),
//                            submission,
//                            pr.getScorecards());
                AdminReviewScorecardBean bean =
                        new AdminReviewScorecardBean(rsr.getScorecards()[0].getProject(),
                                submission,
                                rsr.getScorecards());
                if (bean.getAvgScoreReady()) {
                    request.setAttribute(Constants.REVIEW_LIST_KEY, bean);
                } else {
                    return new FailureResult("Not all review scorecards are completed!");
                }
            }
        }
        return result;
    }
}
