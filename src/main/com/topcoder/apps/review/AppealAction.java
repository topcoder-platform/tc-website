/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.Appeal;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.util.log.Level;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForwards;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that let the user appeal
 * a quesiton in a scorecard.
 * </p>
 *
 * @author FatClimber
 * @version 1.0
 */
public final class AppealAction extends ReviewAction {

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
        log(Level.INFO, "AppealAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        long qid = -1;
        long aid = -1;
        //long aid = orpd.getUser().getId();
        try {
            qid = Long.parseLong(String.valueOf(request.getParameter(Constants.QUESTION_ID_KEY)));
        } catch (NumberFormatException e) {
            qid = -1;
        }
        try {
            aid = Long.parseLong(String.valueOf(request.getParameter(Constants.APPEALER_ID_KEY)));
        } catch (NumberFormatException e) {
            aid = -1;
        }

        String action = Constants.ACTION_VIEW;
        if (request.getParameter(Constants.ACTION_KEY) != null) {
            action = request.getParameter(Constants.ACTION_KEY).toString();
        }

        // Call the business layer
        BusinessDelegate businessDelegate = new BusinessDelegate();
        AppealData data = new AppealData(orpd, null, aid, qid);
        ResultData result = businessDelegate.appealProject(data);

        if (result instanceof SuccessResult)  {
            AppealsRetrieval ar = (AppealsRetrieval) result;
            Appeal[] appeals = ar.getAppeals();
            Appeal appeal = ar.getAppeals()[0];

            // Populate the form
            form = new AppealForm();
            ((AppealForm) form).fromAppeal(appeal, orpd.getProject().getId());
            ((AppealForm)form).setProject(orpd.getProject());

/* by cucu
            if (appeal.getAppealer().getId() == orpd.getUser().getId() &&
                    appeal.getId() == -1) {
                request.setAttribute("appealerEdit", new Boolean(true));
            } else if (appeal.getReviewer().getId() == orpd.getUser().getId() &&
                    !appeal.isResolved()) {
                request.setAttribute("reviewerEdit", new Boolean(true));
            }
*/
            long phaseId = orpd.getProject().getCurrentPhaseInstance().getPhase().getId();
            if (appeal.getAppealer().getId() == orpd.getUser().getId() &&
                    appeal.getId() == -1 && phaseId == Phase.ID_APPEALS) {
                request.setAttribute("appealerEdit", new Boolean(true));
            } else if (appeal.getReviewer().getId() == orpd.getUser().getId() &&
                    !appeal.isResolved() && phaseId == Phase.ID_APPEALS_RESPONSE) {
                request.setAttribute("reviewerEdit", new Boolean(true));
            }

/*
            if (Constants.ACTION_EDIT.equals(action) && ar.getWorksheet().isCompleted()) {
                action = Constants.ACTION_VIEW;
            }
            */
            //((AppealForm) form).setAction(action);

            request.getSession().setAttribute(mapping.getAttribute(), form);

            saveToken(request);

            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            if (Constants.ACTION_EDIT.equals(action)
                    || Constants.ACTION_ADMIN.equals(action)) {
                forwards.addForward(mapping.findForward(Constants.EDIT_KEY));
            } else {
                forwards.addForward(mapping.findForward(Constants.VIEW_KEY));
            }
        }

        return result;
    }
}
