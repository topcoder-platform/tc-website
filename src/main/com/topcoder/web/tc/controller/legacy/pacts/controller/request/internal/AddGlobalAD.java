package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.List;

import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentTemplate;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentType;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;

/**
 *
 * @author  pulky
 */
public class AddGlobalAD extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws Exception {
        long userId = 0;
        
        try {
            userId = getLongParameter(USER_ID);
        } catch (IllegalArgumentException iae) {
        }            

        if (userId == 0) {
            throw new IllegalArgumentException("Missing parameter " + USER_ID);
        }

        DataInterfaceBean dib = new DataInterfaceBean();

        List<AssignmentDocumentTemplate> adtl = dib.getAssignmentDocumentTemplate(AssignmentDocumentType.GLOBAL_TYPE_ID, false);
        getRequest().setAttribute(ASSIGNMENT_DOCUMENT_TEMPLATE_LIST, adtl);

        getRequest().setAttribute("user", new UserProfileHeader(dib.getUserProfileHeader(userId)));

        setDefault("assignment_document_status_id", String.valueOf(AssignmentDocumentStatus.AFFIRMED_STATUS_ID));

        setNextPage(INTERNAL_ADD_GLOBAL_AD_JSP);
        setIsNextPageInContext(true);
    }
}
