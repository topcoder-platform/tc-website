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
 * Extends from <strong>ReviewAction</strong> that let the user save
 * an appeal to a queston in a scorecard.
 * </p>
 *
 * @author FatClimber
 * @version 1.0
 */
public final class SaveAppealAction extends ReviewAction {

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
        log(Level.INFO, "SaveAppealAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        long qid = -1;
        try {
            qid = Long.parseLong(String.valueOf(request.getParameter(Constants.QUESTION_ID_KEY)));
        } catch (NumberFormatException e) {
            qid = -1;
        }

        // Was this transaction cancelled?
        if (isCancelled(request)) {
            ActionForward forward = null;

            request.getSession().removeAttribute(mapping.getAttribute());
            if (orpd.getUser().getId() == ((AppealForm) form).getAppeal().getAppealer().getId()) {
                forward = mapping.findForward("cancelAppealer");
                forward = new ActionForward(forward.getPath() + "?" +
                        Constants.ACTION_KEY +
                        "view" + "&" +
                        Constants.ID_KEY + "=" +
                        orpd.getProject().getId() + "&" +
                        Constants.REVIEWER_ID_KEY + "=" +
                        ((AppealForm) form).getAppeal().getReviewer().getId() + "&" +
                        Constants.SUBMITTER_ID_KEY + "=" +
                        ((AppealForm) form).getAppeal().getSubmitter().getId(), true);
                forward.setName(Constants.CANCEL_KEY);
                forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
                forwards.addForward(forward);
            } else if (orpd.getUser().getId() == ((AppealForm) form).getAppeal().getReviewer().getId()) {
                forward = mapping.findForward(Constants.CANCEL_KEY);
                forward = new ActionForward(forward.getPath() + "?" +
                        Constants.ID_KEY + "=" +
                        orpd.getProject().getId(), true);
                forward.setName(Constants.CANCEL_KEY);
                forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
                forwards.addForward(forward);
            }
            return null;
        } else {
            // Call the business layer
            BusinessDelegate businessDelegate = new BusinessDelegate();
            AppealData data = ((AppealForm) form).toAppealData(orpd);
            ResultData result = businessDelegate.appealProject(data);

            if (result instanceof SuccessResult) {
                request.getSession().removeAttribute(mapping.getAttribute());
            }

            if (orpd.getUser().getId() == ((AppealForm) form).getAppeal().getReviewer().getId()) {
                //check autopilot
                AutoPilot.appeal(data);
            }

            return result;
        }
    }
}
