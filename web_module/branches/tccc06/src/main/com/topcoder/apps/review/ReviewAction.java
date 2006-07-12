/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.security.TCSubject;
import com.topcoder.util.log.Level;
import org.apache.struts.action.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Extends from <strong>BaseAction</strong> that provides validity checking.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public abstract class ReviewAction extends BaseAction {

    // --------------------------------------------------------- Public Methods

    /**
     * Process the specified HTTP request, and create the corresponding HTTP
     * response (or forward to another web component that will create it).
     * Return an <code>ActionForward</code> instance describing where and how
     * control should be forwarded, or <code>null</code> if the response has
     * already been completed.
     *
     * @return the forward action.
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
        ActionForward forward = mapping.findForward(Constants.SUCCESS_KEY);
        ActionErrors errors = new ActionErrors();
        UserProjectInfo info = null;

        if (mapping.getParameter() != null && mapping.getParameter().equals("public")) {
            ActionForwards forwards = new ActionForwards();
            ResultData result = null;

            // Call the business logic
            forwards.addForward(mapping.findForward(Constants.SUCCESS_KEY));
            SecurityEnabledUser user = new SecurityEnabledUser(155846, "gt494", "gt494", "gt494", "gt494", null, new TCSubject(155846));
            info = new UserProjectInfo(1, null, null, null, null, null, null, null);
            result = executeLogic(mapping, form, request, response, errors, forwards,
                    new OnlineReviewProjectData(user, info));
            request.getSession().setAttribute("public", "public");
            return mapping.findForward("view");
        }

        try {
            // Get data from the session
            HttpSession session = request.getSession();
            UserProjectInfo[] infos = (UserProjectInfo[]) session.getAttribute(Constants.PROJECT_LIST_KEY);
            SecurityEnabledUser user = (SecurityEnabledUser) session.getAttribute(Constants.USER_KEY);
            UtilityBean utility = (UtilityBean) session.getAttribute(Constants.UTILITY_KEY);

            // Get the id parameter
            long id = -1;
            try {
                Object obj = request.getParameter(Constants.ID_KEY);
                if (obj != null) {
                    id = Long.parseLong(obj.toString());
                }
            } catch (NumberFormatException e) {
                id = -1;
            }

            if (id == -1 && form instanceof ReviewForm) {
                id = ((ReviewForm) form).getId();
            }

            // Check the validity
            if (user == null || utility == null) {
                // Login needed
                errors.add(ActionErrors.GLOBAL_ERROR,
                        new ActionError("error.login.required"));
                forward = mapping.findForward(Constants.LOGIN_KEY);
            } else if (infos == null) {
                // Can't find the project
                errors.add(ActionErrors.GLOBAL_ERROR,
                        new ActionError("error.project.notFound"));
                forward = mapping.findForward(Constants.FAILURE_KEY);
            } else {
                for (int i = 0; i < infos.length; i++) {
                    if (infos[i].getId() == id) {
                        info = infos[i];
                    }
                }

                if (info == null) {
                    // Can't find the project
                    errors.add(ActionErrors.GLOBAL_ERROR,
                            new ActionError("error.project.notFound"));
                    forward = mapping.findForward(Constants.FAILURE_KEY);
                } else {
                    ActionForwards forwards = new ActionForwards();
                    ResultData result = null;
                    String[] names = null;

                    request.getSession().setAttribute(Constants.PROJECT_INFO_KEY, info);

                    // Call the business logic
                    forwards.addForward(mapping.findForward(Constants.SUCCESS_KEY));
                    result = executeLogic(mapping, form, request, response, errors, forwards,
                            new OnlineReviewProjectData(user, info));
                    names = forwards.findForwards();
                    if (names.length > 0) {
                        forward = forwards.findForward(names[0]);
                    } else {
                        forward = null;
                    }

                    // Check the result
                    if (result instanceof FailureResult) {
                        log(Level.ERROR, "FailureResult.getCause(): "
                                + String.valueOf(((FailureResult) result).getCause())
                                + " for User '" + user.getHandle()
                                + "' in session " + request.getSession().getId());
                        if (((FailureResult) result).getMessage() != null) {
                            // Save the error from business layer
                            String msg = ((FailureResult) result).getMessage();
                            ActionError error = new ActionError(Constants.MESSAGE_ERROR_KEY, msg);
                            errors.add(ActionErrors.GLOBAL_ERROR, error);
                        } else {
                            // General error
                            errors.add(ActionErrors.GLOBAL_ERROR, new ActionError("error.general"));
                        }
                        forward = mapping.findForward(Constants.FAILURE_KEY);
                    }
                }
            }

            // Report any errors we have discovered back to the original form
            if (!errors.empty()) {
                saveErrors(request, errors);
                if (info != null) {
                    request.getSession().setAttribute(Constants.PROJECT_INFO_KEY, info);
                }
            }

            // Forward control to the specified URI
            return forward;
        } catch (Exception e) {
            e.printStackTrace();
            errors.add(ActionErrors.GLOBAL_ERROR, new ActionError("error.general"));
            saveErrors(request, errors);
            if (info != null) {
                request.getSession().setAttribute(Constants.PROJECT_INFO_KEY, info);
            }
            return (mapping.findForward(Constants.FAILURE_KEY));
        }
    }

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
    public abstract ResultData executeLogic(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response,
                                            ActionErrors errors,
                                            ActionForwards forwards,
                                            OnlineReviewProjectData orpd);
}