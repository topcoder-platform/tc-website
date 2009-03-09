package com.topcoder.web.reg.view.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.DemographicQuestion;
import com.topcoder.web.common.model.DemographicResponse;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class DemographicAnswerText extends TagSupport {
    protected static Logger log = Logger.getLogger(com.topcoder.web.reg.view.tag.DemographicAnswerText.class);
    private DemographicResponse response = null;

    public void setResponse(DemographicResponse response) {
        this.response = response;
    }

    public int doStartTag() throws JspException {
        try {
            DemographicQuestion question = response.getQuestion();
            String ret = "";

            if (question.isFreeForm()) {
                ret = response.getResponse();
            } else if (question.isSingleSelect() || question.isMultipleSelect()) {
                ret = response.getAnswer().getText();
            }
            pageContext.getOut().print(ret);
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
