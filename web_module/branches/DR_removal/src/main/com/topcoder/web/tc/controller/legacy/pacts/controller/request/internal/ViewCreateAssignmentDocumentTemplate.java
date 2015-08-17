package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.List;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Aug 5, 2005
 */
public class ViewCreateAssignmentDocumentTemplate extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {

        try {
            DataInterfaceBean dib = new DataInterfaceBean();
            List types = dib.getAssignmentDocumentTypes();
            getRequest().setAttribute(ASSIGNMENT_DOCUMENT_TYPE_LIST, types);
            setNextPage(INTERNAL_CREATE_ASSIGNMENT_DOCUMENT_TEMPLATE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

