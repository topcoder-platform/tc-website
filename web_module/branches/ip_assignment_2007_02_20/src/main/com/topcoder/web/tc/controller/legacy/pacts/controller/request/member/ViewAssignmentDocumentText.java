package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.AssignmentDocument;
import com.topcoder.web.common.model.AssignmentDocumentStatus;
import com.topcoder.web.common.model.AssignmentDocumentTemplate;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 *
 * @author  pulky
 */
public class ViewAssignmentDocumentText extends BaseProcessor implements PactsConstants {

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

            // if ad status is pending, the stored text is empty and therefore the template needs to be retrieved and transformed.
            if ((ad.getText() == null || ad.getText().trim().length() == 0) && 
                 ad.getStatus().getId().equals(AssignmentDocumentStatus.PENDING_STATUS_ID)) {
                AssignmentDocumentTemplate adt = bean.getAssignmentDocumentTemplate(ad.getType().getId().longValue());
                ad.setText(adt.transformTemplate(ad));
            }
            
            getResponse().setStatus(200);
            getResponse().setContentType("text/html");
            getResponse().getWriter().print(ad.getText());
            getResponse().flushBuffer();
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

