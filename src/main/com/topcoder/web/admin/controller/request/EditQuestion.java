package com.topcoder.web.admin.controller.request;

import com.topcoder.web.admin.Constants;
import com.topcoder.web.ejb.survey.Question;
import com.topcoder.web.ejb.survey.Answer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.Request;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 9, 2005
 */
public class EditQuestion extends Base {


    protected void businessProcessing() throws Exception {
        String sId = getRequest().getParameter(Constants.SURVEY_ID);
        String qId = getRequest().getParameter(Constants.QUESTION_ID);
        setDefault(Constants.SURVEY_ID, sId);
        getRequest().setAttribute(Constants.SURVEY_ID, sId);
        if (!StringUtils.checkNull(qId).equals("")) {
            long id = Long.parseLong(qId);
            Question question = (Question)createEJB(getInitialContext(), Question.class);
            setDefault(Constants.QUESTION_ID, qId);
            getRequest().setAttribute(Constants.QUESTION_ID, qId);
            loadAnswers(id);
            setDefault(Constants.KEYWORD, question.getKeyword(id, DBMS.OLTP_DATASOURCE_NAME));
            setDefault(Constants.QUESTION_STYLE,String.valueOf(question.getQuestionStyleId(id, DBMS.OLTP_DATASOURCE_NAME)));
            setDefault(Constants.QUESTION_TYPE,String.valueOf(question.getQuestionTypeId(id, DBMS.OLTP_DATASOURCE_NAME)));
            setDefault(Constants.QUESTION_STATUS,String.valueOf(question.getStatusId(id, DBMS.OLTP_DATASOURCE_NAME)));
            setDefault(Constants.QUESTION_TEXT,String.valueOf(question.getText(id, DBMS.OLTP_DATASOURCE_NAME)));
            setDefault(Constants.REQUIRED, String.valueOf(question.isRequired(id, DBMS.OLTP_DATASOURCE_NAME)));
            Answer answer = (Answer)createEJB(getInitialContext(), Answer.class);
            getRequest().setAttribute("answers", answer.getAnswers(id, DBMS.OLTP_DATASOURCE_NAME));
        }
        loadQuestionTypeList();
        loadQuestionStyleList();
        loadStatusList();
        setNextPage("/editQuestion.jsp");
        setIsNextPageInContext(true);
    }

    protected void loadQuestionTypeList() throws Exception {
        Request r = new Request();
        r.setContentHandle("question_type_list");
        getRequest().setAttribute("question_type_list", getDataAccess().getData(r).get("question_type_list"));
    }

    protected void loadQuestionStyleList() throws Exception {
        Request r = new Request();
        r.setContentHandle("question_style_list");
        getRequest().setAttribute("question_style_list", getDataAccess().getData(r).get("question_style_list"));
    }

    protected void loadStatusList() throws Exception {
        Request r = new Request();
        r.setContentHandle("status_list");
        getRequest().setAttribute("status_list", getDataAccess().getData(r).get("status_list"));
    }

    protected void loadAnswers(long questionId) throws Exception {
        Answer a = (Answer)createEJB(getInitialContext(), Answer.class);
        getRequest().setAttribute("answers", a.getAnswers(questionId, DBMS.OLTP_DATASOURCE_NAME));
    }


}
