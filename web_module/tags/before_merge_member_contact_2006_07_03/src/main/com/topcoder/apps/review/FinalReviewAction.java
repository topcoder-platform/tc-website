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
 * Extends from <strong>ReviewAction</strong> that let the user submit final
 * review.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class FinalReviewAction extends ReviewAction {

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
        log(Level.INFO, "FinalReviewAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        String action = Constants.ACTION_VIEW;
        if (request.getParameter(Constants.ACTION_KEY) != null) {
            action = request.getParameter(Constants.ACTION_KEY).toString();
        }

        // Call the business layer
        BusinessDelegate businessDelegate = new BusinessDelegate();
        FinalReviewData data = new FinalReviewData(orpd, null);
        ResultData result = businessDelegate.finalReview(data);

        if (result instanceof SuccessResult) {
            FinalReviewRetrieval frr = (FinalReviewRetrieval) result;
            // Populate the form
            form = new FinalReviewForm();
            ((FinalReviewForm) form).fromReview(frr.getFinalReview());
            if (Constants.ACTION_EDIT.equals(action) && frr.getFinalReview().isCompleted()) {
                action = Constants.ACTION_VIEW;
            }
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
