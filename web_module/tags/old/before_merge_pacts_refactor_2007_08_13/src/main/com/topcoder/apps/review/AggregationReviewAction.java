/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AggregationReview;
import com.topcoder.util.log.Level;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForwards;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that let the user review the
 * aggregation.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class AggregationReviewAction extends ReviewAction {

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
        log(Level.INFO, "AggregationReviewAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        long rid = -1;
        String action = Constants.ACTION_VIEW;
        if (request.getParameter(Constants.ACTION_KEY) != null) {
            action = request.getParameter(Constants.ACTION_KEY).toString();
        }

        // Get the id parameter
        try {
            rid = Long.parseLong
                    (String.valueOf(request.getParameter(Constants.REVIEWER_ID_KEY)));
        } catch (NumberFormatException e) {
            rid = -1;
        }

        // Call the business layer
        BusinessDelegate businessDelegate = new BusinessDelegate();
        AggregationReviewData data = new AggregationReviewData(orpd, null);
        ResultData result = businessDelegate.aggregationReview(data);

        if (result instanceof SuccessResult) {
            UtilityBean utility = (UtilityBean) request.getSession().getAttribute(Constants.UTILITY_KEY);
            AggregationReviewRetrieval arr = (AggregationReviewRetrieval) result;
            AggregationReview ar = null;

            if (utility.getAdmin() && rid >= 0) {
                for (int i = 0; i < arr.getAggregationReviews().length; i++) {
                    if (arr.getAggregationReviews()[i].getReviewer().getId() == rid) {
                        ar = arr.getAggregationReviews()[i];
                    }
                }
            } else {
                ar = arr.getAggregationReviews()[0];
            }

            // Populate the form
            form = new AggregationReviewForm();
            ((AggregationReviewForm) form).fromReview(ar);
            // Remove these lines to let the reviewers submit agg. review again.
            // if (Constants.ACTION_EDIT.equals(action) && ar.isCompleted()) {
            //     action = Constants.ACTION_VIEW;
            // }
            ((AggregationReviewForm) form).setAction(action);
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
