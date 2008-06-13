package com.topcoder.web.admin.controller.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.ejb.survey.Answer;
import com.topcoder.web.ejb.survey.SurveyQuestion;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use only in connection with a TopCoder competition.
 *
 * @author dok
 * @version $Id$
 *          Create Date: Jun 13, 2008
 */
public class CreateCondorcetAnswers extends Base {


    protected void businessProcessing() throws Exception {
        String sId = getRequest().getParameter(Constants.SURVEY_ID);

        SurveyQuestion surveyQuestion = (SurveyQuestion) createEJB(getInitialContext(), SurveyQuestion.class);
        ResultSetContainer questions = surveyQuestion.getQuestions(new Long(sId), DBMS.OLTP_DATASOURCE_NAME);
        Answer answer = (Answer) createEJB(getInitialContext(), Answer.class);

        for (int i = 0; i < questions.size(); i++) {
            if (i == 0) {
                answer.createAnswer(questions.get(i).getLongItem("question_id"),
                        String.valueOf(i + 1) + " - Most Preferred", i + 1, DBMS.OLTP_DATASOURCE_NAME);
            } else if (i == questions.size() - 1) {
                answer.createAnswer(questions.get(i).getLongItem("question_id"),
                        String.valueOf(i + 1) + " - Least Preferred", i + 1, DBMS.OLTP_DATASOURCE_NAME);
            } else {
                answer.createAnswer(questions.get(i).getLongItem("question_id"),
                        String.valueOf(i + 1), i + 1, DBMS.OLTP_DATASOURCE_NAME);
            }

        }
        setNextPage(getSessionInfo().getServletPath() + "?" + com.topcoder.web.studio.Constants.MODULE_KEY +
                "=ViewSurvey&" + Constants.SURVEY_ID + "=" + sId);

        setIsNextPageInContext(false);
    }


}
