/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.util.log.Level;
import com.topcoder.web.common.MultipartRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForwards;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that saves the user's solution.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class SaveSolutionAction extends ReviewAction {

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
        log(Level.INFO, "SaveSolutionAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        // Call the business logic

        try {
            BusinessDelegate businessDelegate = new BusinessDelegate();
            MultipartRequest upload = new MultipartRequest(request);
            ResultData result = null;
            SolutionData data = null;
//            File file = new File("" + upload.getUploadedFile("submission").getFile().getParent()
//                                    + File.separator + orpd.getUser().getId() + "_"
//                                    + upload.getUploadedFile("submission").getFile().getName());

            //upload.getUploadedFile("submission").getFile().renameTo(file);
            InputStream is = upload.getUploadedFile("submission").getInputStream();
            String name = upload.getUploadedFile("submission").getRemoteFileName();
            data = new SolutionData(orpd, is, name);

            if (orpd.getProject().getCurrentPhaseInstance().getPhase().getId() == Constants.PHASE_SUBMISSION) {
                result = businessDelegate.submitSolution(data);

                //////////////////////////////////////////////////////////////////////////////////////////////////////
                // Added by WishingBone - Automated Screening
                if (result instanceof SuccessResult) {
                    ScreeningRetrieval screening = (ScreeningRetrieval) result;
                    forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
                    String forward = null;
                    if (!screening.isDone()) {
                        forwards.addForward(new ActionForward("showScreening.do?action=refresh&id=" + orpd.getProject().getId() + "&vid=" + screening.getVersionId(), true));
                    } else if (screening.getFatalErrors().length > 0) {
                        forward = Constants.ERROR_KEY;
                    } else if (screening.getWarnings().length > 0) {
                        forward = Constants.WARNING_KEY;
                    } else {
                        forward = Constants.SUCCESS_KEY;
                    }
                    if (forward != null) {
                        forwards.addForward(mapping.findForward(forward));
                    }
                    if (screening.getWarnings().length > 0) {
                        request.setAttribute(Constants.WARNING_LIST_KEY, screening.getWarnings());
                    }
                    if (screening.getFatalErrors().length > 0) {
                        request.setAttribute(Constants.ERROR_LIST_KEY, screening.getFatalErrors());
                    }
                }
                //////////////////////////////////////////////////////////////////////////////////////////////////////

            } else {
                result = businessDelegate.submitFinalFix(data);

                if (result instanceof SuccessResult) {
                    AutoPilot.finalFixes(data);
                }
            }
            return result;
        } catch (Exception e) {
            return new FailureResult(e);
        }
    }
}
