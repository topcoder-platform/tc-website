package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ajax;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Validates the assignment document.
 * The result is stored in attribute result
 *
 * @author pulky
 */
public class ValidateAssignmentDocument extends ShortHibernateProcessor implements PactsConstants {

    protected void dbProcessing() throws Exception {
        clearErrors();
        
        if (!hasParameter("assignment_document_text") || getRequest().getParameter("assignment_document_text").trim().length() == 0) {
            addError("error", "Please enter a text for the assignment document.");
        }

        if (!hasParameter("search_list")) {
            addError("error", "Please enter a reference for the assignment document.");
        }

        getRequest().setAttribute("validationResult", new BasicResult(false, "Invalid Assignment Document"));

        setNextPage(INTERNAL_AJAX_VALIDATE_ASSIGNMENT_DOCUMENT);
        setIsNextPageInContext(true);
    }
}
