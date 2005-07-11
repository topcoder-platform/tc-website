/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.ProjectType;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.util.log.Level;
import org.apache.struts.action.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Extends from <strong>BaseAction</strong> to show the scores for a component
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class ComponentScoresAction extends BaseAction {

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
     * @return the forward action.
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet exception occurs
     */
    public ActionForward perform(ActionMapping mapping,
                                 ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response)
            throws IOException, ServletException {

        // Create the UserData from the session
        HttpSession session = request.getSession();

log(Level.INFO, "QQ pid=" + request.getParameter("pid"));

        request.setAttribute("pid", request.getParameter("pid"));

        return mapping.findForward(Constants.SUCCESS_KEY);


/*
        SecurityEnabledUser user =
                (SecurityEnabledUser) session.getAttribute(Constants.USER_KEY);
        UtilityBean utility =
                (UtilityBean) session.getAttribute(Constants.UTILITY_KEY);

        // Call the business logic layer
        ActionForward forward = null;
        ProjectType[] projectTypes = null;
        UserProjectInfo[] projects = null;

        if (user == null || utility == null) {
            // Login needed
            errors.add(ActionErrors.GLOBAL_ERROR,
                    new ActionError("error.login.required"));
            forward = mapping.findForward(Constants.LOGIN_KEY);
        } else {
            BusinessDelegate businessDelegate = new BusinessDelegate();
            ActionData data = new OnlineReviewData(user);
            ResultData result = null;

            // Get the project list and store them into session
            if (utility.getAdmin()) {
                log(Level.DEBUG, "they're an admin");
                if (request.getParameter(Constants.ALL_KEY) == null) {
                    result = businessDelegate.viewMyOpenProjects(data);
                    utility.setViewAllProjects(false);
                } else {
                    // All projects for admin
                    result = businessDelegate.viewAllOpenProjects(data);
                    utility.setViewAllProjects(true);
                }
                if (result instanceof SuccessResult) {
                    ProjectsRetrieval pr = (ProjectsRetrieval) result;
                    projects = pr.getProjects();
                    session.setAttribute(Constants.PROJECT_LIST_KEY, projects);
                }
            } else {
                log(Level.DEBUG, "before viewMyOpenProjects(data) call");
                result = businessDelegate.viewMyOpenProjects(data);
                log(Level.DEBUG, "after viewMyOpenProjects(data) call");
                if (result instanceof SuccessResult) {
                    projects = ((ProjectsRetrieval) result).getProjects();
                    session.setAttribute(Constants.PROJECT_LIST_KEY, projects);
                }
            }

            projectTypes = businessDelegate.getProjectTypes();

            if (!(result instanceof SuccessResult)) {
                if (result instanceof FailureResult
                        && ((FailureResult) result).getMessage() != null) {
                    errors.add(ActionErrors.GLOBAL_ERROR,
                            new ActionError(Constants.MESSAGE_ERROR_KEY, ((FailureResult) result).getMessage()));
                } else {
                    errors.add(ActionErrors.GLOBAL_ERROR,
                            new ActionError("error.general"));
                }
                forward = mapping.findForward(Constants.FAILURE_KEY);
            }
        }

        // Report any errors we have discovered back to the original form
        if (!errors.empty()) {
            saveErrors(request, errors);
        } else {
            OpenProjectBean[] bean = new OpenProjectBean[projectTypes.length];

            log(Level.INFO, "ViewOpenProjectsAction: User '"
                    + user.getHandle() + "' in session "
                    + session.getId());

            // Save the projects info in the session
            for (int i = 0; i < projectTypes.length; i++) {
                bean[i] = new OpenProjectBean(projectTypes[i], projects);
            }

            request.setAttribute(Constants.PROJECT_TYPE_KEY, bean);

            // Forward control to the specified success URI
            forward = mapping.findForward(Constants.SUCCESS_KEY);
        }

        // Forward control to the specified URI
        return forward;
        */
    }

}
