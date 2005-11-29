package com.topcoder.web.admin.controller.request;

import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.ejb.survey.Question;
import com.topcoder.web.ejb.survey.Answer;
import com.topcoder.web.ejb.survey.SurveyQuestion;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;

import javax.transaction.TransactionManager;
import javax.transaction.Status;
import java.util.Arrays;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 9, 2005
 */
public class UpdateQuestion extends EditQuestion {

    protected void businessProcessing() throws Exception {

        String sId = getRequest().getParameter(Constants.SURVEY_ID);
        String qId = getRequest().getParameter(Constants.QUESTION_ID);
        String keyword = StringUtils.checkNull(getRequest().getParameter(Constants.KEYWORD));
        String style = StringUtils.checkNull(getRequest().getParameter(Constants.QUESTION_STYLE));
        String type = StringUtils.checkNull(getRequest().getParameter(Constants.QUESTION_TYPE));
        String status = StringUtils.checkNull(getRequest().getParameter(Constants.QUESTION_STATUS));
        String text = StringUtils.checkNull(getRequest().getParameter(Constants.QUESTION_TEXT));
        String required = StringUtils.checkNull(getRequest().getParameter(Constants.REQUIRED));

        if (keyword.equals("")) {
            addError(Constants.KEYWORD, "You must fill in a keyword");
        }
        if (style.equals("")) {
            addError(Constants.QUESTION_STYLE, "You must choose a question style");
        } else {
            //make sure style is valid
        }
        if (type.equals("")) {
            addError(Constants.QUESTION_TYPE, "You must choose a question type");
        } else {
            //make sure type is valid
        }
        if (status.equals("")) {
            addError(Constants.QUESTION_STATUS, "You must choose a status");
        } else {
            if (StringUtils.isNumber(status)) {
                int stat = Integer.parseInt(status);
                if (!(Arrays.binarySearch(Constants.ACTIVE_STATUSES, stat) >= 0
                        || Arrays.binarySearch(Constants.INACTIVE_STATUSES, stat) >= 0)) {
                    addError(Constants.SURVEY_STATUS, "Invalid status provided");
                }
            } else {
                addError(Constants.SURVEY_STATUS, "Invalid status provided");
            }

        }

        if (text.equals("")) {
            addError(Constants.QUESTION_TEXT, "You must enter text");
        }


        if (hasErrors()) {
            setDefault(Constants.SURVEY_ID, sId);
            setDefault(Constants.QUESTION_ID, qId);
            setDefault(Constants.KEYWORD, keyword);
            setDefault(Constants.QUESTION_STYLE, style);
            setDefault(Constants.QUESTION_TYPE, type);
            setDefault(Constants.QUESTION_STATUS, status);
            setDefault(Constants.QUESTION_TEXT, text);
            setDefault(Constants.REQUIRED, String.valueOf("on".equals(required)));
            Answer answer = (Answer) createEJB(getInitialContext(), Answer.class);
            getRequest().setAttribute("answers", answer.getAnswers(Long.parseLong(qId), DBMS.OLTP_DATASOURCE_NAME));
            loadQuestionTypeList();
            loadQuestionStyleList();
            loadStatusList();
            if (StringUtils.isNumber(qId)) {
                loadAnswers(Long.parseLong(qId));
            }
            setNextPage("/editQuestion.jsp");
            setIsNextPageInContext(true);
        } else {
            TransactionManager tm = null;
            try {

                Question question = (Question) createEJB(getInitialContext(), Question.class);
                tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                tm.begin();
                long questionId = 0;
                if (StringUtils.checkNull(qId).equals("")) {
                    questionId = question.createQuestion(text, Integer.parseInt(status), keyword,
                            Integer.parseInt(type), Integer.parseInt(style), "on".equals(required),
                            DBMS.JTS_OLTP_DATASOURCE_NAME);
                    SurveyQuestion surveyQuestion = (SurveyQuestion)createEJB(getInitialContext(), SurveyQuestion.class);
                    surveyQuestion.createSurveyQuestion(Long.parseLong(sId), questionId, DBMS.JTS_OLTP_DATASOURCE_NAME);
                } else {
                    questionId = Long.parseLong(qId);
                    question.setText(questionId, text, DBMS.JTS_OLTP_DATASOURCE_NAME);
                    question.setKeyword(questionId, keyword, DBMS.JTS_OLTP_DATASOURCE_NAME);
                    question.setQuestionStyleId(questionId, Integer.parseInt(style), DBMS.JTS_OLTP_DATASOURCE_NAME);
                    question.setQuestionTypeId(questionId, Integer.parseInt(type), DBMS.JTS_OLTP_DATASOURCE_NAME);
                    question.setRequired(questionId, "on".equals(required), DBMS.JTS_OLTP_DATASOURCE_NAME);
                    question.setStatusId(questionId, Integer.parseInt(status), DBMS.JTS_OLTP_DATASOURCE_NAME);
                }

                tm.commit();

                SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                setNextPage(info.getServletPath() + "?module=EditQuestion&" + Constants.QUESTION_ID + "=" +
                        questionId + "&"+Constants.SURVEY_ID+"="+sId);
                setIsNextPageInContext(false);
            } catch (Exception e) {
                if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                    tm.rollback();
                }
                throw e;
            }
        }
    }

}
