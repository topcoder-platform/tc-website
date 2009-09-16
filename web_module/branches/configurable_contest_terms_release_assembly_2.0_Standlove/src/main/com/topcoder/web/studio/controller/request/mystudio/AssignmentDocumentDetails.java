package com.topcoder.web.studio.controller.request.mystudio;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.controller.request.PactsServicesLocator;

/**
 *
 * @author  pulky
 */
public class AssignmentDocumentDetails extends BaseProcessor {
    
    protected void businessProcessing() throws TCWebException {
        if (userLoggedIn()) {
            long assignment_document_id = Long.parseLong(getRequest().getParameter(Constants.ASSIGNMENT_DOCUMENT_ID));
    
            try {
                AssignmentDocument ad = PactsServicesLocator.getService()
                    .getAssignmentDocument(assignment_document_id);
                
                getRequest().setAttribute(Constants.RESULT_KEY, ad);
    
                // check that the assignment document belongs to the logged user.
                if (ad == null) {
                    throw new IllegalArgumentException("Assignment Document not found");  
                }
                
                if (ad.getUser().getId().longValue() != getUser().getId()) {
                    throw new IllegalArgumentException("This AD doesn't belong to the logged user");  
                }
                
                Boolean hasHardCopy = PactsServicesLocator.getService()
                    .hasHardCopyAssignmentDocumentByUserId(ad.getUser().getId().longValue(), 
                        ad.getType().getId().longValue());
    
                getRequest().setAttribute("has_hard_copy", hasHardCopy);
                
                setNextPage("/mystudio/assignmentDocumentDetails.jsp");
                setIsNextPageInContext(true);
            } catch (Exception e) {
                throw new TCWebException(e);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}

