package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.Question;
import com.topcoder.web.tc.model.Survey;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Map;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.List;

public abstract class SurveyData extends Base {

    protected List questionInfo;
    protected Survey survey;

    protected abstract List makeAnswerInfo(long surveyId, long questionId) throws Exception;

    protected abstract void surveyProcessing() throws Exception;

    protected final void businessProcessing() throws TCWebException {
        long surveyId;
        try {
            surveyId = Long.parseLong(getRequest().getParameter(Constants.SURVEY_ID));
        } catch (NullPointerException e) {
            throw new NavigationException("Request is missing survey parameter");
        }

        try {
            survey = createSurvey(surveyId);
            if (survey==null) {
                throw new NavigationException("Survey doesn't exist");
            } else {
                getRequest().setAttribute("surveyInfo", survey);
                questionInfo = getQuestionInfo(surveyId);
                getRequest().setAttribute("questionInfo", questionInfo);
            }
            surveyProcessing();
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected List getQuestionInfo(long surveyId) throws Exception {
        Request r = new Request();
        r.setContentHandle("survey_questions");
        r.setProperty("sid", String.valueOf(surveyId));
        DataAccessInt dataAccess = getDataAccess(true);
        Map qMap = dataAccess.getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("question_list");

        Question q = null;
        ResultSetContainer.ResultSetRow question = null;
        List questionList = new ArrayList(questions.size());
        for (Iterator it = questions.iterator(); it.hasNext();) {
            question = (ResultSetContainer.ResultSetRow) it.next();
            q = new Question();
            q.setId(question.getLongItem("question_id"));
            q.setStyleId(question.getIntItem("question_style_id"));
            q.setTypeId(question.getIntItem("question_type_id"));
            q.setText(question.getStringItem("question_text"));
            q.setAnswerInfo(makeAnswerInfo(surveyId, q.getId()));
            questionList.add(q);
        }
        return questionList;
    }

    protected final Survey createSurvey(long surveyId) throws Exception {
        Request r = new Request();
        r.setContentHandle("survey_info");
        r.setProperty("sid", String.valueOf(surveyId));
        //chaching should be ok, i don't think the actual survey will change much
        DataAccessInt dataAccess = getDataAccess(true);
        Map map = dataAccess.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) map.get("survey_info");
        Survey ret = null;
        if (rsc!=null && !rsc.isEmpty()) {
            ret = new Survey();
            ret.setId(rsc.getRow(0).getLongItem("survey_id"));
            ret.setName(rsc.getRow(0).getStringItem("name"));
            ret.setStatusId(rsc.getRow(0).getIntItem("status_id"));
            ret.setText(rsc.getRow(0).getStringItem("text"));
        }
        return ret;
    }

}
