package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.List;

public class Results extends SurveyData {
    protected void surveyProcessing() throws TCWebException {
        setNextPage(Constants.SURVEY_RESULTS);
        setIsNextPageInContext(true);
    }

    protected List makeAnswerInfo(long surveyId, long questionId) throws Exception {
        Request responseRequest = new Request();
        DataAccessInt dataAccess = getDataAccess();
        responseRequest.setContentHandle("survey_responses");
        responseRequest.setProperty("sid", String.valueOf(surveyId));
        responseRequest.setProperty("qid", String.valueOf(questionId));
        return (ResultSetContainer)dataAccess.getData(responseRequest).get("response_info");
    }


}
