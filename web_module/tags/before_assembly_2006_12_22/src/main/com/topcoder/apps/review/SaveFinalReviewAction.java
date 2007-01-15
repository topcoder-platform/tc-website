/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.FixItem;
import com.topcoder.util.log.Level;
import org.apache.struts.action.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <strong>Purpose</strong>:
 * Extends from <strong>ReviewAction</strong> that saves the final review.
 *
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * Added save and finish later functionality.
 * </li>
 * </ol>
 *
 * @author TCSDEVELOPER, pulky
 * @version 1.0.1
 */
public final class SaveFinalReviewAction extends ReviewAction {

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
        log(Level.INFO, "SaveFinalReviewAction: User '"
                        + orpd.getUser().getHandle() + "' in session "
                        + request.getSession().getId());

        FinalReviewForm frForm = (FinalReviewForm) form;

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
            FinalReviewData data = frForm.toReviewData(orpd);
            ResultData result = new BusinessDelegate().finalReview(data);

            if (result instanceof SuccessResult)  {
                request.getSession().removeAttribute(mapping.getAttribute());
                resetToken(request);

                // only continues process when the worksheet is completed
                if (data.getFinalReview().isCompleted()) {
                    // If final fixes are not approved, mails will be sent and the project will go back to final fixes
                    if (data.getFinalReview().isApproved()) {
                        AutoPilot.finalReviewEmail(data);
                    } else {
                        // Count how many not fixed items are
                        FixItem[] items = data.getFinalReview().getFixCheckList();
    
                        int notFixedItems = 0;
    
                        for (int i = 0; i < items.length; i++)
                            if (items[i].getFinalFixStatus().getId() == 1) { // fix constant!
                                notFixedItems++;
                            }
    
                        AutoPilot.finalReviewFailed(data, notFixedItems, data.getFinalReview().getComments());
                    }
                }
            }
            
            return result;
        }
    }
}
