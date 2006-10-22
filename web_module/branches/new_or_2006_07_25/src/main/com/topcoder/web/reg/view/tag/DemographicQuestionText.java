package com.topcoder.web.reg.view.tag;

import com.topcoder.web.common.model.DemographicResponse;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class DemographicQuestionText extends TagSupport {
    private DemographicResponse response = null;

    public void setResponse(DemographicResponse response) {
        this.response = response;
    }

    public int doStartTag() throws JspException {
        try {
            pageContext.getOut().print(response.getQuestion().getText());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

    public int doEndTag() throws JspException {
        response = null;
        return super.doEndTag();
    }
}
