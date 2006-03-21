package com.topcoder.web.privatelabel.view.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.DemographicQuestion;
import com.topcoder.web.common.model.DemographicResponse;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.Map;

public class DemographicAnswerText extends TagSupport {
    protected static Logger log = Logger.getLogger(DemographicAnswerText.class);
    private DemographicResponse response = null;
    private Map questions = null;

    public void setResponse(DemographicResponse response) {
        this.response = response;
    }

    public void setQuestions(Map questions) {
        this.questions = questions;
    }

    public int doStartTag() throws JspException {
        try {
            DemographicQuestion question = (DemographicQuestion) questions.get(new Long(response.getQuestionId()));
            String ret = "";

            if (question.getAnswerType() == DemographicQuestion.FREE_FORM) {
                ret = response.getText();
            } else if (question.getAnswerType() == DemographicQuestion.SINGLE_SELECT ||
                    question.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                ret = question.getAnswer(response.getAnswerId()).getText();
            }
            pageContext.getOut().print(ret);
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

    public int doEndTag() throws JspException {
        response=null;
        questions=null;
        return super.doEndTag();
    }

}