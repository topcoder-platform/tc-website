package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentType;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 *
 * @author  pulky
 */
public class ViewSearchAssignmentDocumentResult extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws Exception {
        DataInterfaceBean dib = new DataInterfaceBean();

        Map searchCriteria = new HashMap();
        String param;
       
        param = getRequest().getParameter(USER_ID);
        if (param != null && !param.equals("")) {
            searchCriteria.put(USER_ID, param);
        }
        param = getRequest().getParameter("user_handle");
        if (param != null && !param.equals("")) {
            searchCriteria.put(HANDLE, "%" + param + "%");
        }
        param = getRequest().getParameter("submission_title");
        if (param != null && !param.equals("")) {
            searchCriteria.put(SUBMISSION_TITLE, "%" + param + "%");
        }
        param = getRequest().getParameter("assignment_document_type_id");
        if (param != null && !param.equals("") && !param.equals("0")) {
            searchCriteria.put(TYPE, param);

            String param2 = getRequest().getParameter("search_list");
            if (param2 != null && !param2.equals("") && !param.equals("0")) {
                if (param.equals(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID.toString())) {
                    searchCriteria.put(COMPONENT_PROJECT, param2);
                } else if (param.equals(AssignmentDocumentType.STUDIO_CONTEST_TYPE_ID.toString())) {
                    searchCriteria.put(STUDIO_CONTEST, param2);
                }
            }
        }
        param = getRequest().getParameter("assignment_document_status_id");
        if (param != null && !param.equals("") && !param.equals("0")) {
            searchCriteria.put(STATUS, param);
        }
        param = getRequest().getParameter("create_date_from");
        if (param != null && !param.equals("")) {
            searchCriteria.put(EARLIEST_CREATION_DATE, param);
        }
        param = getRequest().getParameter("create_date_to");
        if (param != null && !param.equals("")) {
            searchCriteria.put(LATEST_CREATION_DATE, param);
        }
        param = getRequest().getParameter("modify_date_from");
        if (param != null && !param.equals("")) {
            searchCriteria.put(EARLIEST_MODIFICATION_DATE, param);
        }
        param = getRequest().getParameter("modify_date_to");
        if (param != null && !param.equals("")) {
            searchCriteria.put(LATEST_MODIFICATION_DATE, param);
        }
        param = getRequest().getParameter("expire_date_from");
        if (param != null && !param.equals("")) {
            searchCriteria.put(EARLIEST_EXPIRE_DATE, param);
        }
        param = getRequest().getParameter("expire_date_to");
        if (param != null && !param.equals("")) {
            searchCriteria.put(LATEST_EXPIRE_DATE, param);
        }
        param = getRequest().getParameter("affirmed_date_from");
        if (param != null && !param.equals("")) {
            searchCriteria.put(EARLIEST_AFFIRM_DATE, param);
        }
        param = getRequest().getParameter("affirmed_date_to");
        if (param != null && !param.equals("")) {
            searchCriteria.put(LATEST_AFFIRM_DATE, param);
        }
        
        List result = dib.findAssignmentDocument(searchCriteria);

        getRequest().setAttribute("result", result);

        setNextPage(INTERNAL_LIST_ASSIGNMENT_DOCUMENT_JSP);
        setIsNextPageInContext(true);
    }
}
