/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.Appeal;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.Role;
import com.topcoder.apps.review.projecttracker.UserRole;
import com.topcoder.util.log.Level;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForwards;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that let the user edit the review
 * scorecard.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class ReviewScorecardAction extends ReviewAction {

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
        log(Level.INFO, "EditReviewScorecardAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        String action = Constants.ACTION_VIEW;
        if (request.getParameter(Constants.ACTION_KEY) != null) {
            action = request.getParameter(Constants.ACTION_KEY).toString();
        }

        // Get the id parameter
        long rid = -1;
        long sid = -1;
        try {
            rid = Long.parseLong(String.valueOf(request.getParameter(Constants.REVIEWER_ID_KEY)));
            sid = Long.parseLong(String.valueOf(request.getParameter(Constants.SUBMITTER_ID_KEY)));
        } catch (NumberFormatException e) {
            rid = -1;
            sid = -1;
        }

        // Call the business layer
        ReviewData data = new ReviewData(orpd, sid, rid, null);
        ResultData result = new BusinessDelegate().reviewScorecard(data);

        if (result instanceof ReviewScorecardRetrieval) {
            ReviewScorecardRetrieval rsr = (ReviewScorecardRetrieval) result;
            // Populate the form
            form = new ReviewScorecardForm();
            ((ReviewScorecardForm) form).fromScorecard(rsr.getScoreCard());
            if (Constants.ACTION_EDIT.equals(action) && rsr.getScoreCard().isCompleted()) {
                action = Constants.ACTION_VIEW;
            }
            ((ReviewScorecardForm) form).setAction(action);

            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            if (Constants.ACTION_EDIT.equals(action)
                    || Constants.ACTION_ADMIN.equals(action)) {
                forwards.addForward(mapping.findForward(Constants.EDIT_KEY));
                request.getSession().setAttribute(mapping.getAttribute(), form);
            } else if (Constants.ACTION_POPUP.equals(action)) {
                forwards.addForward(mapping.findForward(Constants.POPUP_KEY));
                request.setAttribute(mapping.getAttribute(), form);
            } else {
                forwards.addForward(mapping.findForward(Constants.VIEW_KEY));
                request.setAttribute(mapping.getAttribute(), form);
            }
        }
        UserRole[] roles = orpd.getProject().getUserRoles();
        boolean isSubmitter = false;
        for (int i = 0; i < roles.length; i++) {
            if (null != roles[i].getUser() && roles[i].getUser().getId() == orpd.getUser().getId()) {
                isSubmitter |= roles[i].getRole().getId() == Role.ID_DESIGNER_DEVELOPER;
            }
        }
/*   by cucu
        if (Constants.ACTION_VIEW.equals(action) &&
                orpd.getProject().getCurrentPhaseInstance().getPhase().getId() == Phase.ID_APPEALS &&
                isSubmitter) {*/

        long phase = orpd.getProject().getCurrentPhaseInstance().getPhase().getId();
        if (Constants.ACTION_VIEW.equals(action) &&
                (phase == Phase.ID_APPEALS || phase == Phase.ID_APPEALS_RESPONSE) &&
                isSubmitter) {
            AppealData aData = new AppealData(orpd, null, -1, -1);
            ResultData rData = new BusinessDelegate().appealProject(aData);
            Appeal[] appealArr = ((AppealsRetrieval) rData).getAppeals();
            HashMap appeals = new HashMap();
            for (int i = 0; i < appealArr.length; i++) {
                appeals.put(new Long(appealArr[i].getQuestion().getId()), appealArr[i]);
            }
            request.setAttribute(Constants.APPEAL_LIST_KEY, appeals);
        }
        return result;
    }
}
