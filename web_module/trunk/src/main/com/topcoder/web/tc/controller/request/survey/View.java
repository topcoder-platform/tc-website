package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.Answer;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

public class View extends SurveyData {
    protected void businessProcessing() throws TCWebException {
        super.businessProcessing();
        setNextPage(Constants.SURVEY_VIEW);
        setIsNextPageInContext(true);
    }

    protected List makeAnswerInfo(long surveyId, long questionId) throws Exception {
        Request responseRequest = new Request();
        DataAccessInt dataAccess = getDataAccess();
        responseRequest.setContentHandle("survey_responses");
        responseRequest.setProperty("sid", String.valueOf(surveyId));
        responseRequest.setProperty("qid", String.valueOf(questionId));
        ResultSetContainer rsc = (ResultSetContainer)dataAccess.getData(responseRequest).get("response_info");
        List ret = null;
        if (rsc==null) {
            ret = new ArrayList();
        } else {
            ResultSetContainer.ResultSetRow row = null;
            Answer a = null;
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow)it.next();
                a = new Answer();
                a.setId(row.getLongItem("answer_id"));
                a.setQuestionId(row.getLongItem("question_id"));
                a.setSort(row.getIntItem("sort"));
                a.setText(row.getStringItem("answer_text"));
                ret.add(a);
            }
        }

        return ret;
    }

}
