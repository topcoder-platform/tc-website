package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

public class SurveyList extends Base {
    protected void businessProcessing() throws TCWebException {
        Request r = new Request();
        try {
            r.setContentHandle("survey_list");
            r.setProperty("cr", String.valueOf(getAuthentication().getActiveUser().getId()));
            getRequest().setAttribute("surveyList", getDataAccess().getData(r).get("survey_list"));
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        setNextPage(Constants.SURVEY_LIST);
        setIsNextPageInContext(true);
    }


}
