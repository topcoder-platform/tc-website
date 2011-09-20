/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.util.log.Level;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForwards;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that let the user edit the
 * screening scorecard.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class ScreeningScorecardAction extends ReviewAction {

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
        log(Level.INFO, "ScreeningScorecardAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        String action = Constants.ACTION_VIEW;
        if (request.getParameter(Constants.ACTION_KEY) != null) {
            action = request.getParameter(Constants.ACTION_KEY).toString();
        }

        // Get the id parameter
        long sid = -1;
        try {
            sid = Long.parseLong(String.valueOf(request.getParameter(Constants.SUBMITTER_ID_KEY)));
        } catch (NumberFormatException e) {
            sid = -1;
        }
        if (sid < 0) {
            sid = orpd.getUser().getId();
        }

        // Call the business layer
        ScreeningData data = new ScreeningData(orpd, sid, null);
        ResultData result = new BusinessDelegate().screeningScorecard(data);

        if (result instanceof SuccessResult) {
            ScreeningScorecardRetrieval ssr = (ScreeningScorecardRetrieval) result;
            // Populate the form
            form = new ScreeningScorecardForm();
            ((ScreeningScorecardForm) form).fromScorecard(ssr.getScoreCard());
            if (Constants.ACTION_EDIT.equals(action) && ssr.getScoreCard().isCompleted()) {
                action = Constants.ACTION_VIEW;
            }
            ((ScreeningScorecardForm) form).setAction(action);

            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            if (Constants.ACTION_EDIT.equals(action)
                    || Constants.ACTION_ADMIN.equals(action)) {
                forwards.addForward(mapping.findForward(Constants.EDIT_KEY));
                request.getSession().setAttribute(mapping.getAttribute(), form);
            } else {
                forwards.addForward(mapping.findForward(Constants.VIEW_KEY));
                request.setAttribute(mapping.getAttribute(), form);
            }
        }

        return result;
    }
}
