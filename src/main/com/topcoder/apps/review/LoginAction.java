/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.util.log.Level;
import org.apache.struts.action.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Extends from <strong>BaseAction</strong> that validates a user login.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class LoginAction extends BaseAction {

    // --------------------------------------------------------- Public Methods

    /**
     * Process the specified HTTP request, and create the corresponding HTTP
     * response (or forward to another web component that will create it).
     * Return an <code>ActionForward</code> instance describing where and how
     * control should be forwarded, or <code>null</code> if the response has
     * already been completed.
     *
     * @param mapping The ActionMapping used to select this instance
     * @param form The optional ActionForm bean for this request (if any)
     * @param request The HTTP request we are processing
     * @param response The HTTP response we are creating
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet exception occurs
     */
    public ActionForward perform(ActionMapping mapping,
                                 ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response)
            throws IOException, ServletException {

        // Validate the request parameters specified by the user
        ActionErrors errors = new ActionErrors();

        try {
            // Create the LoginData from the submitted form
            LoginData data = ((LoginForm) form).toLoginData();

            // Call the business logic layer
            ResultData result = new BusinessDelegate().login(data);
            if (result instanceof FailureResult) {
                log(Level.ERROR, "FailureResult.getCause(): "
                        + String.valueOf(((FailureResult) result).getCause()));
                if (((FailureResult) result).getMessage() != null) {
                    errors.add(ActionErrors.GLOBAL_ERROR,
                            new ActionError(Constants.MESSAGE_ERROR_KEY,
                                    ((FailureResult) result).getMessage()));
                } else {
                    errors.add(ActionErrors.GLOBAL_ERROR,
                            new ActionError("error.general"));
                }
            }

            // Report any errors we have discovered back to the original form
            if (!errors.empty()) {
                saveErrors(request, errors);
                return (mapping.findForward(Constants.LOGIN_KEY));
            } else {
                // Save our logged-in user in the session
                HttpSession session = request.getSession();
                SecurityEnabledUser user = ((LoginResult) result).getUser();

                session.setAttribute(Constants.USER_KEY, user);
                session.setAttribute(Constants.UTILITY_KEY,
                        new UtilityBean(user));

                log(Level.INFO, "LoginAction: User '" + data.getUserName()
                        + "' logged on in session " + session.getId());

                // Remove the obsolete form bean
                if (mapping.getAttribute() != null) {
                    request.removeAttribute(mapping.getAttribute());
                }

                // Forward control to the specified success URI
                return (mapping.findForward(Constants.SUCCESS_KEY));
            }
        } catch (Exception e) {
            e.printStackTrace();
            errors.add(ActionErrors.GLOBAL_ERROR, new ActionError("error.general"));
            saveErrors(request, errors);
            return (mapping.findForward(Constants.LOGIN_KEY));
        }
    }
}
