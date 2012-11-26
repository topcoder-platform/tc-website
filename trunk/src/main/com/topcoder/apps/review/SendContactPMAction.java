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
 * Extends from <strong>ReviewAction</strong> that sends the contact message
 * to the project manager.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class SendContactPMAction extends ReviewAction {

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
        log(Level.INFO, "SendContactPMAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        // Was this transaction cancelled?
        if (isCancelled(request)) {
            ActionForward forward = null;

            request.getSession().removeAttribute(mapping.getAttribute());
            forward = mapping.findForward(Constants.CANCEL_KEY);
            forward = new ActionForward(forward.getPath() + "?" +
                    Constants.ID_KEY + "=" +
                    orpd.getProject().getId(), true);
            forward.setName(Constants.CANCEL_KEY);
            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            forwards.addForward(forward);
            return null;
        } else {
            if (!isTokenValid(request)) {
                errors.add(ActionErrors.GLOBAL_ERROR,
                        new ActionError("error.transaction.token"));
                forwards.addForward(mapping.findForward(Constants.FAILURE_KEY));
                return null;
            } else {
                ContactPMData data =
                        ((ContactPMForm) form).toContactPMData(orpd);
                ResultData result = new BusinessDelegate().sendContactPM(data);

                if (result instanceof SuccessResult) {
                    request.getSession().removeAttribute(mapping.getAttribute());
                    resetToken(request);
                }

                return result;
            }
        }
    }
}
