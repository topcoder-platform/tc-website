package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 *
 * @author  pulky
 */
public class ViewAssignmentDocument extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        long assignment_document_id = Long.parseLong(getRequest().getParameter(ASSIGNMENT_DOCUMENT_ID));

        try {
            DataInterfaceBean bean = new DataInterfaceBean();

            AssignmentDocument ad = bean.getAssignmentDocument(assignment_document_id);

            getRequest().setAttribute(PACTS_INTERNAL_RESULT, ad);

            setNextPage(INTERNAL_ASSIGNMENT_DOCUMENT_JSP);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

