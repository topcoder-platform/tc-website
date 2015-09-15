package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.List;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author  pulky
 */
public class CreateAssignmentDocumentTemplate extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        try {
            DataInterfaceBean dib = new DataInterfaceBean();
            List types = dib.getAssignmentDocumentTypes();
            getRequest().setAttribute(ASSIGNMENT_DOCUMENT_TYPE_LIST, types);
            setNextPage(INTERNAL_CREATE_ASSIGNMENT_DOCUMENT_TEMPLATE);
            setIsNextPageInContext(true);

            if (!StringUtils.checkNull(getRequest().getParameter(ASSIGNMENT_DOCUMENT_TEMPLATE_TEXT)).equals("") &&
                    !StringUtils.checkNull(getRequest().getParameter("assignment_document_template_name")).equals("") &&
                    !StringUtils.checkNull(getRequest().getParameter("assignment_document_type_id")).trim().equals("")) {
                DataInterfaceBean bean = new DataInterfaceBean();
                bean.createAssignmentDocumentTemplate(Integer.parseInt(getRequest().getParameter("assignment_document_type_id")),
                        getRequest().getParameter(ASSIGNMENT_DOCUMENT_TEMPLATE_TEXT),
                        getRequest().getParameter("assignment_document_template_name"));
                addError("error", "Success");
            } else {
                addError("error", "Text and name must not be null and you must select an assignment document type");
            }
        } catch (NumberFormatException e) {
            addError("error", "Please select an assignment document type");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
