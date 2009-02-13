/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
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
 * Extends from <strong>ReviewAction</strong> that saves the review scorecard.
 * </p>
 *
 * <p>
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * The call to <code>AutoPilot.reviewEmail()</code> was commented and instead <code>AutoPilot.reviewFromScorecard()
 * </code> was added. It will handle the new automated phase change and timeline update.
 * </li>
 * </ol>
 * </p>
 *
 * @author TCSDEVELOPER, pulky
 * @version 1.0.1
 */
public final class SaveReviewScorecardAction extends ReviewAction {

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
        log(Level.INFO, "SaveReviewScorecardAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        ReviewScorecardForm rsForm = (ReviewScorecardForm) form;
        String action = rsForm.getAction();
        ReviewData data = null;
        ResultData result = null;

        if (Constants.ACTION_ADD.equals(action)) {
            rsForm.addResponse(rsForm.getQuestionIndex(),
                    rsForm.getResponseIndex());
            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            forwards.addForward(mapping.findForward(Constants.EDIT_KEY));
            // Call the business layer
//            data = rsForm.toReviewData(orpd);
//            result = new BusinessDelegate().reviewScorecard(data);
//            return result;
            return new SuccessResult();
        } else if (Constants.ACTION_DELETE.equals(action)) {
            rsForm.deleteResponse(rsForm.getQuestionIndex(),
                    rsForm.getResponseIndex());
            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            forwards.addForward(mapping.findForward(Constants.EDIT_KEY));
            // Call the business layer
//            data = rsForm.toReviewData(orpd);
//            result = new BusinessDelegate().reviewScorecard(data);
//            return result;
            return new SuccessResult();
        } else {
            // Call the business layer
            data = rsForm.toReviewData(orpd);
            result = new BusinessDelegate().reviewScorecard(data);

            //AutoPilot.reviewEmail(data);
            AutoPilot.reviewFromScorecard(data);

            if (result instanceof SuccessResult) {
                request.getSession().removeAttribute(mapping.getAttribute());
            }

            return result;
        }
    }
}
