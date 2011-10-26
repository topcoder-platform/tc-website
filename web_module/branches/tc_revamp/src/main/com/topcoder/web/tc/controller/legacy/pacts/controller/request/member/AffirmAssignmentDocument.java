package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 *
 * @author  pulky
 */
public class AffirmAssignmentDocument extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        if (userLoggedIn()) {
            long assignment_document_id = Long.parseLong(getRequest().getParameter(ASSIGNMENT_DOCUMENT_ID));
    
            try {
                DataInterfaceBean bean = new DataInterfaceBean();
    
                AssignmentDocument ad = bean.getAssignmentDocument(assignment_document_id);
                getRequest().setAttribute(PACTS_INTERNAL_RESULT, ad);
    
                // check that the assignment document belongs to the logged user.
                if (ad == null || ad.getUser().getId().longValue() != getUser().getId()) {
                    throw new IllegalArgumentException("Assignment Document not found");  
                }
    
                if (!ad.getStatus().getId().equals(AssignmentDocumentStatus.PENDING_STATUS_ID)) {
                    throw new IllegalArgumentException("Assignment Document should be pending");  
                }
    
//                Boolean hasHardCopy = bean.hasHardCopyAssignmentDocumentByUserId(ad.getUser().getId().longValue(), 
//                        ad.getType().getId().longValue());
//    
//                if (!hasHardCopy.booleanValue()) {
//                    throw new IllegalArgumentException("You must send a hard copy of the Assignment Document before you can use this system to affirm");  
//                }
    
                bean.affirmAssignmentDocument(ad);
                
                setNextPage("/PactsMemberServlet?module=AssignmentDocumentHistory");
                setIsNextPageInContext(true);
            } catch (Exception e) {
                throw new TCWebException(e);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}

