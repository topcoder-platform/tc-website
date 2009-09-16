package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ajax;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Validates the assignment document.
 * The result is stored in attribute result
 *
 * @author pulky
 */
public class ValidateAssignmentDocument extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws Exception {
        clearErrors();
        
        Boolean valid = Boolean.TRUE;
        
        if (!hasParameter("submission_title") || getRequest().getParameter("submission_title").trim().length() == 0) {
            addError("error", "Please enter a text for the submission title.");
        }

        if (!hasParameter("search_list")) {
            addError("error", "Please enter a reference for the assignment document.");
        }

        if (hasErrors()) {
            valid = Boolean.FALSE;
        }
        
        getRequest().setAttribute("validationResult", new BasicResult(valid.booleanValue(), ""));

        setNextPage(INTERNAL_AJAX_VALIDATE_ASSIGNMENT_DOCUMENT);
        setIsNextPageInContext(true);
    }
}
