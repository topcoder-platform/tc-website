package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.List;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 *
 * @author  pulky
 */
public class SearchAssignmentDocument extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws Exception {
            DataInterfaceBean dib = new DataInterfaceBean();

            // Give the JSP the list of assignment document Types
            List assignmentDocumentTypes = dib.getAssignmentDocumentTypes();
            getRequest().setAttribute(ASSIGNMENT_DOCUMENT_TYPE_LIST, assignmentDocumentTypes);

            // Give the JSP the list of assignment document status
            List assignmentDocumentStatus = dib.getAssignmentDocumentStatus();
            getRequest().setAttribute(ASSIGNMENT_DOCUMENT_STATUS_LIST, assignmentDocumentStatus);

            setDefault("reference_id", "0");
            getRequest().setAttribute("reference_description", "");

            setNextPage(INTERNAL_SEARCH_ASSIGNMENT_DOCUMENT_JSP);
            setIsNextPageInContext(true);
    }
}
