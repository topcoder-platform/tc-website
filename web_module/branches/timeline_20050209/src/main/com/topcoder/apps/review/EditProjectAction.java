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
 * Extends from <strong>ReviewAction</strong> that let the admin edit project
 * information.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class EditProjectAction extends ReviewAction {

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
        log(Level.INFO, "EditProjectAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());


        String action = null;
        if (request.getParameter(Constants.ACTION_KEY) != null) {
            action = request.getParameter(Constants.ACTION_KEY).toString();
        } else if (form != null) {
            action = ((ProjectForm) form).getAction();
        }

        // If the action is store timeline or cancel timeline, we don´t have to load again
        // the project from the database because it is already in form.
        if (Constants.ACTION_STORE.equals(action) || Constants.ACTION_CANCEL.equals(action)) {
            ((ProjectForm) form).backFromTimeline();

            ((ProjectForm) form).setAction(Constants.ACTION_EDIT);
            return new SuccessResult();
        }

        // Call the business layer
        BusinessDelegate businessDelegate = new BusinessDelegate();
        ResultData result = businessDelegate.projectDetail(orpd);

        if (result instanceof SuccessResult) {

            ProjectRetrieval pr = (ProjectRetrieval) result;
            // Populate the form
            form = new ProjectForm();
            ProjectForm myForm = (ProjectForm) form;
            myForm.fromProject(pr.getProject());

            ScorecardTemplate[] templates = businessDelegate.getScorecardTemplates();
            myForm.setScorecardTemplates(templates);

            request.getSession().setAttribute(mapping.getAttribute(), form);

            saveToken(request);

            if (Constants.ACTION_TERMINATE.equals(action)) {
                ((ProjectForm) form).setAction(Constants.ACTION_TERMINATE);
                forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
                forwards.addForward(mapping.findForward(Constants.TERMINATE_KEY));
            } else {
                ((ProjectForm) form).setAction(Constants.ACTION_EDIT);
            }
        }

        return result;
    }
}
