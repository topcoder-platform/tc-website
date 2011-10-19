/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.util.log.Level;
import org.apache.struts.action.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that saves the aggregation review.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class SaveAggregationReviewAction extends ReviewAction {

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
        log(Level.INFO, "SaveAggregationReviewAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        AggregationReviewForm arForm = (AggregationReviewForm) form;

        // Check valid token
        if (!isTokenValid(request)) {
            request.getSession().removeAttribute(mapping.getAttribute());
            errors.add(ActionErrors.GLOBAL_ERROR,
                    new ActionError("error.transaction.token"));
            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            forwards.addForward(mapping.findForward(Constants.FAILURE_KEY));
            return null;
        } else {
            // Call the business layer
            AggregationReviewData data = arForm.toReviewData(orpd);
            ResultData result = new BusinessDelegate().aggregationReview(data);

            if (result instanceof SuccessResult) {
                request.getSession().removeAttribute(mapping.getAttribute());
                resetToken(request);
            }

            AutoPilot.aggregationReview(data);

            return result;
        }
    }
}
