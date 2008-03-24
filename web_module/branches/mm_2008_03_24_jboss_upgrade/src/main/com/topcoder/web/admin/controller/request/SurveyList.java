package com.topcoder.web.admin.controller.request;

import com.topcoder.shared.dataAccess.Request;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 9, 2005
 */
public class SurveyList extends Base {

    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("admin_survey_list");
        getRequest().setAttribute("admin_survey_list", getDataAccess().getData(r).get("admin_survey_list"));
        setNextPage("/surveyList.jsp");
        setIsNextPageInContext(true);

    }
}
