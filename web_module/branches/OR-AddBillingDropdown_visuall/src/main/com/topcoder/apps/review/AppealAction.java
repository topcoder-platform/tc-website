/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.Appeal;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.util.log.Level;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForwards;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.topcoder.apps.review.AppealHelper;

/**
 * <strong>Purpose</strong>:
 * Extends from <strong>ReviewAction</strong> that let the user appeal
 * a quesiton in a scorecard.
 *
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * Changed constraint to permit appeals edition in appeals phase. (this is ruled by a
 * configuration that allows or deny the edition)
 * </li>
 * </ol>
 *
 * Version 1.0.2 Change notes:
 * <ol>
 * <li>
 * Changed constraint to permit appeals edition in appeals phase only when project is
 * marked as not allowing appeals responses during appeals phase.
 * </li>
 * </ol>
 *
 * @author FatClimber, pulky
 * @version 1.0.2
 */
public final class AppealAction extends ReviewAction {

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
        log(Level.INFO, "AppealAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        long qid = -1;
        long aid = -1;
        //long aid = orpd.getUser().getId();
        try {
            qid = Long.parseLong(String.valueOf(request.getParameter(Constants.QUESTION_ID_KEY)));
        } catch (NumberFormatException e) {
            qid = -1;
        }
        try {
            aid = Long.parseLong(String.valueOf(request.getParameter(Constants.APPEALER_ID_KEY)));
        } catch (NumberFormatException e) {
            aid = -1;
        }

        String action = Constants.ACTION_VIEW;
        if (request.getParameter(Constants.ACTION_KEY) != null) {
            action = request.getParameter(Constants.ACTION_KEY).toString();
        }

        // Call the business layer
        BusinessDelegate businessDelegate = new BusinessDelegate();
        AppealData data = new AppealData(orpd, null, aid, qid);
        ResultData result = businessDelegate.appealProject(data);

        if (result instanceof SuccessResult) {
            AppealsRetrieval ar = (AppealsRetrieval) result;
            Appeal[] appeals = ar.getAppeals();
            Appeal appeal = ar.getAppeals()[0];

            // Populate the form
            form = new AppealForm();
            ((AppealForm) form).fromAppeal(appeal, orpd.getProject().getId());
            ((AppealForm) form).setProject(orpd.getProject());

            // sets requests attributes
            AppealHelper.setAppealPageAttributes(appeal, request, orpd);

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