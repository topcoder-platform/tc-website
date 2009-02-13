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
 * Shows screening responses to the user.
 *
 * @author WishingBone
 * @version 1.0
 */
public class ShowScreeningAction extends ReviewAction {

    /**
     * <p>
     * Call the business logic layer and return the submission file.
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
        log(Level.INFO, "ShowScreeningAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        long sid = -1;
        try {
            sid = Long.parseLong(String.valueOf(request.getParameter(Constants.SUBMISSION_ID_KEY)));
        } catch (NumberFormatException e) {
            sid = -1;
        }
        long vid = -1;
        try {
            vid = Long.parseLong(String.valueOf(request.getParameter(Constants.VERSION_ID_KEY)));
        } catch (NumberFormatException e) {
            vid = -1;
        }

        // Call the business layer
        BusinessDelegate businessDelegate = new BusinessDelegate();
        SubmissionDownloadData data = new SubmissionDownloadData(orpd, sid);
        data.setVersionId(vid);
        ResultData result = businessDelegate.showScreening(data);

        if (result instanceof SuccessResult) {
            ScreeningRetrieval screening = (ScreeningRetrieval) result;
            String forward = null;
            if (!"refresh".equals(String.valueOf(request.getParameter(Constants.ACTION_KEY)))) {
                forward = Constants.VIEW_KEY;
            } else if (!screening.isDone()) {
                request.setAttribute("vid", new Long(screening.getVersionId()));
                forward = Constants.REFRESH_KEY;
            } else if (screening.getFatalErrors().length > 0) {
                forward = Constants.ERROR_KEY;
            } else if (screening.getWarnings().length > 0) {
                forward = Constants.WARNING_KEY;
            } else {
                forward = Constants.SUCCESS_KEY;
            }
            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            forwards.addForward(mapping.findForward(forward));

            if (screening.getWarnings().length > 0) {
                request.setAttribute(Constants.WARNING_LIST_KEY, screening.getWarnings());
            }
            if (screening.getFatalErrors().length > 0) {
                request.setAttribute(Constants.ERROR_LIST_KEY, screening.getFatalErrors());
            }
        }

        return result;
    }
}
