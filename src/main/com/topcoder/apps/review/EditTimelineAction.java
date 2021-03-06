/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.ScorecardTemplate;
import com.topcoder.util.log.Level;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForwards;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that let the admin edit project timeline
 * information.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class EditTimelineAction extends ReviewAction {

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
        log(Level.INFO, "EditTimelineAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        String action = request.getParameter(Constants.ACTION_KEY);

        if (action == null) {
            return new FailureResult("No action provided");
        }

        ResultData result = new SuccessResult();

        if (Constants.ACTION_STORE.equals(action)) {
            log(Level.INFO, "store timeline");
            result = ((ProjectForm) form).refreshTimeline();
            if (!(result instanceof SuccessResult)) {
                return result;
            }

            result = ((ProjectForm) form).commitTimeline();
            if (!(result instanceof SuccessResult)) {
                return result;
            }

            request.getSession().setAttribute(mapping.getAttribute(), form);

            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            forwards.addForward(mapping.findForward(Constants.STORE_KEY));


        } else if (Constants.ACTION_REFRESH.equals(action)) {
            log(Level.INFO, "refresh timeline");

            result = ((ProjectForm) form).refreshTimeline();
            if (!(result instanceof SuccessResult)) {
                return result;
            }

            request.getSession().setAttribute(mapping.getAttribute(), form);

            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            forwards.addForward(mapping.findForward(Constants.REFRESH_KEY));

        } else if (Constants.ACTION_LOAD.equals(action)) {
            log(Level.INFO, "load timeline");
            result = ((ProjectForm) form).editTimeline();
            if (!(result instanceof SuccessResult)) {
                return result;
            }

            request.getSession().setAttribute(mapping.getAttribute(), form);

        } else if (Constants.ACTION_CANCEL.equals(action)) {
            log(Level.INFO, "cancel timeline");

            request.getSession().setAttribute(mapping.getAttribute(), form);

            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            forwards.addForward(mapping.findForward(Constants.CANCEL_KEY));
        }


        return result;

    }
}
