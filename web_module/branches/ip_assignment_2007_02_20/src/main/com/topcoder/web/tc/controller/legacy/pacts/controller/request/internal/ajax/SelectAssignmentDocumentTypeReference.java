package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ajax;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.AssignmentDocumentType;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author  pulky
 */
public class SelectAssignmentDocumentTypeReference extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        try {
            Long type = new Long(getRequest().getParameter("assignment_document_type_id"));

            if (type.equals(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID)) {
                getRequest().setAttribute("reference_description", "Enter search text for component name:");
            } else if (type.equals(AssignmentDocumentType.STUDIO_CONTEST_TYPE_ID)) {
                getRequest().setAttribute("reference_description", "Enter search text for studio contest name:");
            }
            setNextPage(INTERNAL_AJAX_SELECT_ASSIGNMENT_DOCUMENT_TYPE_REFERENCE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

