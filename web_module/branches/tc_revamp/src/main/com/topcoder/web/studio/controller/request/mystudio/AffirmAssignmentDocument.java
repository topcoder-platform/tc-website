package com.topcoder.web.studio.controller.request.mystudio;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.controller.request.PactsServicesLocator;

/**
 *
 * @author  pulky
 */
public class AffirmAssignmentDocument extends BaseProcessor  {

    protected void businessProcessing() throws TCWebException {
        if (userLoggedIn()) {
            long assignment_document_id = Long.parseLong(getRequest().getParameter(Constants.ASSIGNMENT_DOCUMENT_ID));
    
            try {
                AssignmentDocument ad = PactsServicesLocator.getService().getAssignmentDocument(assignment_document_id);
                getRequest().setAttribute(Constants.RESULT_KEY, ad);
    
                // check that the assignment document belongs to the logged user.
                if (ad == null || ad.getUser().getId().longValue() != getUser().getId()) {
                    throw new IllegalArgumentException("Assignment Document not found");  
                }
    
                if (!ad.getStatus().getId().equals(AssignmentDocumentStatus.PENDING_STATUS_ID)) {
                    throw new IllegalArgumentException("Assignment Document should be pending");  
                }
    
//                Boolean hasHardCopy = PactsServicesLocator.getService()
//                    .hasHardCopyAssignmentDocumentByUserId(ad.getUser().getId().longValue(), 
//                        ad.getType().getId().longValue());
//    
//                if (!hasHardCopy.booleanValue()) {
//                    throw new IllegalArgumentException("You must send a hard copy of the Assignment Document before you can use this system to affirm");  
//                }
                
                PactsServicesLocator.getService().affirmAssignmentDocument(ad);
                
                setNextPage("/mystudio/?module=AssignmentDocumentHistory");
                setIsNextPageInContext(true);
            } catch (Exception e) {
                throw new TCWebException(e);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}

