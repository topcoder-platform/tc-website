package com.topcoder.web.privatelabel.view.tag;

import com.topcoder.web.common.model.DemographicQuestion;
import com.topcoder.web.common.model.DemographicResponse;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.Map;

public class DemographicQuestionText extends TagSupport {
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
            pageContext.getOut().print(question.getText());
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
