package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.Question;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Map;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.List;

public abstract class SurveyData extends Base {
    protected void businessProcessing() throws TCWebException {
        long surveyId;
        try {
            surveyId = Long.parseLong(getRequest().getParameter(Constants.SURVEY_ID));
        } catch (NullPointerException e) {
            throw new NavigationException("Request is missing survey parameter");
        }

        Request r = new Request();
        r.setContentHandle("survey_questions");
        r.setProperty("sid", String.valueOf(surveyId));
        try {
            DataAccessInt dataAccess = getDataAccess();
            Map qMap = dataAccess.getData(r);
            ResultSetContainer questions = (ResultSetContainer)qMap.get("question_list");


            Question q = null;
            ResultSetContainer.ResultSetRow question = null;
            List questionList = new ArrayList(questions.size());
            for (Iterator it=questions.iterator(); it.hasNext();) {
                question = (ResultSetContainer.ResultSetRow)it.next();
                q = new Question();
                q.setId(question.getLongItem("question_id"));
                q.setStyleId(question.getIntItem("question_style_id"));
                q.setTypeId(question.getIntItem("question_type_id"));
                q.setText(question.getStringItem("question_text"));
                q.setAnswerInfo(makeAnswerInfo(surveyId, q.getId()));
                questionList.add(q);
            }
            getRequest().setAttribute("questionInfo", questionList);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
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
