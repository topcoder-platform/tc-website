package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentType;
import com.topcoder.web.ejb.pacts.assignmentdocuments.User;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 *
 * @author  pulky
 */
public class AddGlobalADSubmit extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws Exception {
        long userId = 0;
        long templateId = 0;
        
        try {
            userId = getLongParameter(USER_ID);
        } catch (IllegalArgumentException iae) {
        }            

        if (userId == 0) {
            throw new IllegalArgumentException("Missing parameter " + USER_ID);
        }

        try {
            templateId = getLongParameter("assignment_document_template_id");
        } catch (IllegalArgumentException iae) {
        }            

        if (templateId == 0) {
            throw new IllegalArgumentException("Missing parameter assignment_document_template_id");
        }

        DataInterfaceBean dib = new DataInterfaceBean();
        
        AssignmentDocument ad = new AssignmentDocument();
        ad.setUser(new User(userId));
        ad.setStatus(new AssignmentDocumentStatus(AssignmentDocumentStatus.AFFIRMED_STATUS_ID));
        ad.setType(new AssignmentDocumentType(AssignmentDocumentType.GLOBAL_TYPE_ID));
        dib.addAssignmentDocument(ad, templateId);

        setNextPage(Links.viewUser(userId));
        setIsNextPageInContext(false);
    }
}
