package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;

public class Results extends SurveyData {
    protected void businessProcessing() throws TCWebException {
        super.businessProcessing();
        setNextPage(Constants.SURVEY_RESULTS);
        setIsNextPageInContext(true);
    }
}
