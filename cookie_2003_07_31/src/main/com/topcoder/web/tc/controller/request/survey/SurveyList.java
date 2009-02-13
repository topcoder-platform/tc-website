package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.shared.dataAccess.Request;

public class SurveyList extends Base {
    protected void businessProcessing() throws TCWebException {
        Request r = new Request();
        r.setContentHandle("survey_list");
        try {
            getRequest().setAttribute("surveyList", getDataAccess().getData(r).get("survey_list"));
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        setNextPage(Constants.SURVEY_LIST);
        setIsNextPageInContext(true);
    }



}
