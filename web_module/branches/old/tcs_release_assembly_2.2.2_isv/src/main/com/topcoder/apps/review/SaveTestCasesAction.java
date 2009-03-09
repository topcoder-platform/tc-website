/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review;

import com.topcoder.util.log.Level;
import com.topcoder.web.common.MultipartRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForwards;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that saves the reviewer's testcases.
 * </p>
 *
 * <p>
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * A call to <code>AutoPilot.reviewFromTestcase()</code> was added. It will handle the new automated phase change
 * and timeline update.
 * </li>
 * </ol>
 * </p>
 *
 * @author FatClimber, pulky
 * @version 1.0.1
 */
public final class SaveTestCasesAction extends ReviewAction {

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
        log(Level.INFO, "SaveTestCasesAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        // Call the business logic

        try {
            BusinessDelegate businessDelegate = new BusinessDelegate();
            MultipartRequest upload = new MultipartRequest(request);
            ResultData result = null;
            SolutionData data = null;

            InputStream is = upload.getUploadedFile("testcases").getInputStream();
            String name = upload.getUploadedFile("testcases").getRemoteFileName();
            data = new SolutionData(orpd, is, name);

            result = businessDelegate.submitTestCases(data);
            AutoPilot.reviewFromTestcase(data);

            return result;
        } catch (Exception e) {
            return new FailureResult(e);
        }
    }
}
