/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.util.log.Level;
import org.apache.struts.action.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that let the admin remove the
 * submission.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class RemoveSubmissionAction extends ReviewAction {

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
        log(Level.INFO, "RemoveSubmissionAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        String action = null;
        long sid = -1;

        // Get the id parameter
        try {
            sid = Long.parseLong
                    (request.getParameter(Constants.SUBMITTER_ID_KEY).toString());
        } catch (NumberFormatException e) {
            sid = -1;
        }

        // Get the action parameter
        if (request.getParameter(Constants.ACTION_KEY) != null) {
            action = request.getParameter(Constants.ACTION_KEY).toString();
        }

        // Call business layer
        BusinessDelegate businessDelegate = new BusinessDelegate();
        ResultData result = businessDelegate.projectDetail(orpd);
        AbstractSubmission submission = null;

        if (result instanceof SuccessResult) {
            ProjectRetrieval pr = (ProjectRetrieval) result;

            if (pr.getSubmissions() != null) {
                for (int i = 0; i < pr.getSubmissions().length; i++) {
                    if (pr.getSubmissions()[i].getSubmitter().getId() == sid) {
                        submission = pr.getSubmissions()[i];
                        break;
                    }
                }
            }

            if (submission == null) {
                return new FailureResult("No submission found!");
            } else {
                if (Constants.ACTION_DELETE.equals(action)) {
                    Object reason = request.getParameter("reason");

                    if (reason == null || reason.toString().trim().equals("")) {
                        errors.add(ActionErrors.GLOBAL_ERROR,
                                new ActionError("error.reason.required"));

                        forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
                        forwards.addForward(mapping.findForward(Constants.FAILURE_KEY));
                        return null;
                    } else {
                        ProjectData data = new ProjectData(orpd, pr.getProject(), reason.toString().trim(),
                                pr.getSubmissions());
                        submission.setRemoved(true);
                        result = businessDelegate.projectAdmin(data);
                    }
                } else {
                    request.setAttribute(Constants.SUBMISSION_KEY, submission);
                    forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
                    forwards.addForward(mapping.findForward(Constants.EDIT_KEY));
                }
            }
        }

        return result;
    }
}
