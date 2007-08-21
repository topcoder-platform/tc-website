/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.projecttracker.Phase;
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
import java.util.List;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that reads and renders the list of
 * review scorecards for this project.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class ReviewScorecardListAction extends ReviewAction {

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
        log(Level.INFO, "ReviewScorecardListAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        // Call the business logic
        ResultData result =
                new BusinessDelegate().getReviewList(new ReviewScorecardsData(orpd));
        String action = Constants.ACTION_EDIT;
        if (request.getParameter(Constants.ACTION_KEY) != null) {
            action = request.getParameter(Constants.ACTION_KEY).toString();
        }

        if (result instanceof ReviewScorecardsRetrieval) {
            ReviewScorecardsRetrieval rsr = (ReviewScorecardsRetrieval) result;
            List list = new ArrayList();
            ReviewScorecard[] scorecards = null;

            UserRole[] roles = orpd.getProject().getUserRoles();
            boolean isSubmitter = false;
            boolean isReviewer = false;
            for (int i = 0; i < roles.length; i++) {
                if (null != roles[i].getUser() && roles[i].getUser().getId() == orpd.getUser().getId()) {
                    isSubmitter |= roles[i].getRole().getId() == Role.ID_DESIGNER_DEVELOPER;
                    isReviewer |= roles[i].getRole().getId() == Role.ID_REVIEWER;
                }
            }
            // Get the scorecard list
            for (int i = 0; i < rsr.getScorecards().length; i++) {
/* by cucu
                if (rsr.getScorecards()[i].getAuthor().getId() == orpd.getUser().getId()
                        || rsr.getScorecards()[i].getSubmission().getSubmitter().getId() == orpd.getUser().getId()
                        || (isSubmitter & orpd.getProject().getCurrentPhaseInstance().getPhase().getId() == Phase.ID_APPEALS)) {
*/
                if (rsr.getScorecards()[i].getAuthor().getId() == orpd.getUser().getId()
                        || rsr.getScorecards()[i].getSubmission().getSubmitter().getId() == orpd.getUser().getId()
                        || (isSubmitter && (
                        (orpd.getProject().getCurrentPhaseInstance().getPhase().getId() == Phase.ID_APPEALS) ||
                        (orpd.getProject().getCurrentPhaseInstance().getPhase().getId() == Phase.ID_APPEALS_RESPONSE)))) {
                    list.add(rsr.getScorecards()[i]);
                }
            }
            scorecards = new ReviewScorecard[list.size()];
            list.toArray(scorecards);

            // Populate the session
            request.setAttribute(Constants.ACTION_KEY, action);
            request.setAttribute(Constants.SCORECARD_LIST_KEY, scorecards);

            if (orpd.getProject().getProjectType().getId() == ProjectType.ID_DEVELOPMENT &&
                    orpd.getProject().getCurrentPhaseInstance().getPhase().getId() == Phase.ID_REVIEW &&
                    isReviewer) {
                request.setAttribute(Constants.UPLOAD_TESTCASES_KEY, new Boolean(true));
            }
        }

        return result;
    }
}
