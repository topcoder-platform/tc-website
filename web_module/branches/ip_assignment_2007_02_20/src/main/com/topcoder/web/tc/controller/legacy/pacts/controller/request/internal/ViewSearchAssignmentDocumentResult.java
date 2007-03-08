package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.List;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 *
 * @author  pulky
 */
public class ViewSearchAssignmentDocumentResult extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws Exception {
            DataInterfaceBean dib = new DataInterfaceBean();

            log.info("3");
            // Give the JSP the list of assignment document Types
            List assignmentDocumentTypes = dib.getAssignmentDocumentTypes();
            getRequest().setAttribute(ASSIGNMENT_DOCUMENT_TYPE_LIST, assignmentDocumentTypes);

            // Give the JSP the list of assignment document status
            List assignmentDocumentStatus = dib.getAssignmentDocumentStatus();
            getRequest().setAttribute(ASSIGNMENT_DOCUMENT_STATUS_LIST, assignmentDocumentStatus);
            log.info("4");

            setDefault("reference_id", "0");
            getRequest().setAttribute("reference_description", "Enter search text for reference:");

            setNextPage(INTERNAL_ADD_ASSIGNMENT_DOCUMENT_JSP);
            setIsNextPageInContext(true);
    }
}
