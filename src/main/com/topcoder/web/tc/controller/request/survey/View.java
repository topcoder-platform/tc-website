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
        getRequest().setAttribute(Constants.SURVEY_ID, new Long(surveyId));
        setNextPage(Constants.SURVEY_VIEW);
        setIsNextPageInContext(true);
    }

    protected List makeAnswerInfo(long surveyId, long questionId) throws Exception {
        log.debug("makeAnswerInfo called");
        Request req = new Request();
        DataAccessInt dataAccess = getDataAccess();
        req.setContentHandle("answers");
        req.setProperty("qid", String.valueOf(questionId));
        ResultSetContainer rsc = (ResultSetContainer)dataAccess.getData(req).get("answer_info");
        List ret = null;
        if (rsc==null) {
            ret = new ArrayList(0);
        } else {
            ret = new ArrayList(rsc.size());
            ResultSetContainer.ResultSetRow row = null;
            Answer a = null;
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow)it.next();
                a = new Answer();
                a.setId(row.getLongItem("answer_id"));
                a.setQuestionId(row.getLongItem("question_id"));
                a.setSort(row.getIntItem("sort_order"));
                a.setText(row.getStringItem("answer_text"));
                ret.add(a);
            }
        }

        return ret;
    }

}
