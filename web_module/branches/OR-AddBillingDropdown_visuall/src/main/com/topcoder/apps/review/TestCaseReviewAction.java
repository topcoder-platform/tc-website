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
 * <p>
 * Extends from <strong>ReviewAction</strong> that let the user review test
 * cases.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class TestCaseReviewAction extends ReviewAction {

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
        log(Level.INFO, "TestCaseReviewAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        // Call the business layer
        TestCaseReviewData data = new TestCaseReviewData(orpd, null);
        ResultData result = new BusinessDelegate().testCaseReviews(data);

        if (result instanceof SuccessResult) {
            TestCaseReviewRetrieval tcrr = (TestCaseReviewRetrieval) result;
            // Populate the form
            form = new TestCaseReviewForm();
            ((TestCaseReviewForm) form).fromTestCaseReviews(tcrr.getTestCaseReviews(), orpd.getUser());
            request.getSession().setAttribute(mapping.getAttribute(), form);

            saveToken(request);

            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            forwards.addForward(mapping.findForward(Constants.EDIT_KEY));
        }

        return result;
    }
}
