package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.AssignmentDocument;
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

            // check that the assignment document belongs to the logged user.
            if (ad == null) {
                throw new IllegalArgumentException("Assignment Document not found");  
            }
            
            if (ad.getUser().getId().longValue() != getUser().getId()) {
                throw new IllegalArgumentException("This AD doesn't belong to the logged user");  
            }
            
            getRequest().setAttribute(PACTS_INTERNAL_RESULT, ad);

            setNextPage(INTERNAL_ASSIGNMENT_DOCUMENT_JSP);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

