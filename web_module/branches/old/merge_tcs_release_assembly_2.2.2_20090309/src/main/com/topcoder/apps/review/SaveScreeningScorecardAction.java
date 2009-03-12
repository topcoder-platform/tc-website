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
 * Extends from <strong>ReviewAction</strong> that save the screening scorecard.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class SaveScreeningScorecardAction extends ReviewAction {

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
        log(Level.INFO, "SaveScreeningScorecardAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        ScreeningScorecardForm ssForm = (ScreeningScorecardForm) form;
        String action = ssForm.getAction();
        ScreeningData data = null;
        ResultData result = null;

        if (Constants.ACTION_ADD.equals(action)) {
            ssForm.addResponse(ssForm.getQuestionIndex(),
                    ssForm.getResponseIndex());
            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            forwards.addForward(mapping.findForward(Constants.EDIT_KEY));
            // Call the business layer
//            data = ssForm.toScreeningData(orpd);
//            result = new BusinessDelegate().screeningScorecard(data);
//            return result;
            return new SuccessResult();
        } else if (Constants.ACTION_DELETE.equals(action)) {
            ssForm.deleteResponse(ssForm.getQuestionIndex(),
                    ssForm.getResponseIndex());
            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            forwards.addForward(mapping.findForward(Constants.EDIT_KEY));
            // Call the business layer
//            data = ssForm.toScreeningData(orpd);
//            result = new BusinessDelegate().screeningScorecard(data);
//            return result;
            return new SuccessResult();
        } else {
            // Call the business layer
            data = ssForm.toScreeningData(orpd);
            result = new BusinessDelegate().screeningScorecard(data);

            if (result instanceof SuccessResult) {
                request.getSession().removeAttribute(mapping.getAttribute());
            }

            AutoPilot.screeningEmail(data);

            return result;
        }
    }
}
