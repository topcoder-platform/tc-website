package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.model.Question;
import com.topcoder.web.tc.model.Survey;

import java.util.*;
import java.sql.Timestamp;

public abstract class SurveyData extends Base {

    protected List questionInfo;
    protected Survey survey;

    protected abstract List makeAnswerInfo(long questionId) throws Exception;

    protected abstract void surveyProcessing() throws Exception;

    protected final void businessProcessing() throws TCWebException {
        long surveyId;
        try {
            surveyId = Long.parseLong(getRequest().getParameter(Constants.SURVEY_ID));
        } catch (NullPointerException e) {
            throw new NavigationException("Invalid Request, missing required information.");
        }

        try {
            survey = createSurvey(surveyId);
            if (survey == null) {
                throw new NavigationException("Invalid Request, survey does not exist.");
            } else {
                log.debug("found survey " + survey.getId() + " " + survey.getName());
                getRequest().setAttribute("surveyInfo", survey);
                questionInfo = getQuestionInfo(surveyId);
                getRequest().setAttribute("questionInfo", questionInfo);
            }
            surveyProcessing();
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected List getQuestionInfo(long surveyId) throws Exception {
        log.debug("getQuestionInfo: " + surveyId);
        Request r = new Request();
        r.setContentHandle("survey_questions");
        r.setProperty("sid", String.valueOf(surveyId));
        DataAccessInt dataAccess = getDataAccess(true);
        Map qMap = dataAccess.getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("question_list");

        log.debug("got " + questions.size() + " questions");

        ResultSetContainer.ResultSetRow question = null;
        List questionList = new ArrayList(questions.size());
        for (Iterator it = questions.iterator(); it.hasNext();) {
            question = (ResultSetContainer.ResultSetRow) it.next();
            questionList.add(makeQuestion(question));
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
        if (rsc != null && !rsc.isEmpty()) {
            ret = new Survey();
            ret.setId(rsc.getRow(0).getLongItem("survey_id"));
            ret.setName(rsc.getRow(0).getStringItem("name"));
            ret.setStatusId(rsc.getRow(0).getIntItem("status_id"));
            ret.setText(rsc.getRow(0).getStringItem("text"));
            ret.setStartDate(new Date(((Timestamp)rsc.getItem(0, "start_date").getResultData()).getTime()));
            ret.setEndDate(new Date(((Timestamp)rsc.getItem(0, "end_date").getResultData()).getTime()));
            ret.setResultsViewable(rsc.getRow(0).getIntItem("results_viewable")==1);
        }
        return ret;
    }

    protected Question makeQuestion(ResultSetContainer.ResultSetRow row) throws Exception {
        Question q = new Question();
        q.setId(row.getLongItem("question_id"));
        q.setStyleId(row.getIntItem("question_style_id"));
        q.setTypeId(row.getIntItem("question_type_id"));
        q.setText(row.getStringItem("question_text"));
        q.setRequired(row.getIntItem("is_required") == 1);
        q.setImagePath(row.getStringItem("image"));
        q.setLink(row.getStringItem("link"));
        q.setAnswerInfo(makeAnswerInfo(q.getId()));
        return q;
    }

}
