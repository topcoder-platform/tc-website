package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ajax;

import java.util.Map;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentType;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author  pulky
 */
public class SelectAssignmentDocumentTypeReference extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        DataInterfaceBean dib = new DataInterfaceBean();

        Map map = null;
        try {
            Long type = new Long(getRequest().getParameter("assignment_document_type_id"));
            String search = getRequest().getParameter("search_text");
            if (type.equals(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID)) {
                if (search != null) {
                    map = dib.findProjects("%" + search + "%");
                    if (((ResultSetContainer)map.get(COMPONENT_PROJECT_LIST)).size() > 0) {
                        getRequest().setAttribute("search_values", map.get(COMPONENT_PROJECT_LIST));
                        getRequest().setAttribute("reference_description", "Please select a component project from the list:");
                        getRequest().setAttribute("field_text", "project_desc");
                        getRequest().setAttribute("field_value", "project_id");
                    } else {
                        getRequest().setAttribute("reference_description", "Enter search text for component name:");
                    }
                } else {
                    getRequest().setAttribute("reference_description", "Enter search text for component name:");
                }
            } else if (type.equals(AssignmentDocumentType.STUDIO_CONTEST_TYPE_ID)) {
                if (search != null) {
                    map = dib.findStudioContests("%" + search + "%");
                    if (((ResultSetContainer)map.get(STUDIO_CONTEST_LIST)).size() > 0) {
                        getRequest().setAttribute("search_values", map.get(STUDIO_CONTEST_LIST));
                        getRequest().setAttribute("reference_description", "Please select a studio contest from the list:");
                        getRequest().setAttribute("field_text", "name");
                        getRequest().setAttribute("field_value", "contest_id");
                    } else {
                        getRequest().setAttribute("reference_description", "Enter search text for studio contest name:");
                    }
                } else {
                    getRequest().setAttribute("reference_description", "Enter search text for studio contest name:");
                }
            }
            if (hasParameter("search_list")) {
                getRequest().setAttribute("search_list", StringUtils.htmlEncode(getRequest().getParameter("search_list")));
            }
            
            setNextPage(INTERNAL_AJAX_SELECT_ASSIGNMENT_DOCUMENT_TYPE_REFERENCE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

