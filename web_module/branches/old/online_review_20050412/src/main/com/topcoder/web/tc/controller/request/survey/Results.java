package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.Question;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class Results extends SurveyData {
    protected void surveyProcessing() throws TCWebException {
        //we're assuming that the survey had some questions associated with
        //it originally, and the got pruned because they were all free
        //form questions
        if (questionInfo.isEmpty()) {
            setNextPage(Constants.SURVEY_THANKS);
            setIsNextPageInContext(true);
        } else {
            setNextPage(Constants.SURVEY_RESULTS);
            setIsNextPageInContext(true);

        }
    }

    protected List makeAnswerInfo(long questionId) throws Exception {
        Request responseRequest = new Request();
        DataAccessInt dataAccess = getDataAccess();
        responseRequest.setContentHandle("survey_responses");
        responseRequest.setProperty("qid", String.valueOf(questionId));
        return (ResultSetContainer) dataAccess.getData(responseRequest).get("response_info");
    }

    protected final List getQuestionInfo(long surveyId) throws Exception {
        Request r = new Request();
        r.setContentHandle("survey_questions");
        r.setProperty("sid", String.valueOf(surveyId));
        //response data has to be live, no cache
        DataAccessInt dataAccess = getDataAccess();
        Map qMap = dataAccess.getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("question_list");

        ResultSetContainer.ResultSetRow question = null;
        List questionList = new ArrayList(questions.size());
        for (Iterator it = questions.iterator(); it.hasNext();) {
            question = (ResultSetContainer.ResultSetRow) it.next();
            int temp = question.getIntItem("question_style_id");
            if (!Question.isFreeForm(temp) && question.getIntItem("question_type_id") != Question.GENERAL_DO_NOT_SHOW_RESULTS_TYPE) {
                questionList.add(makeQuestion(question));
            }
        }
        return questionList;
    }

}
