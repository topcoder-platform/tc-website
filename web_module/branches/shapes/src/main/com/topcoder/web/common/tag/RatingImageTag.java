package com.topcoder.web.common.tag;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.JspException;
import java.io.IOException;

public class RatingImageTag extends TagSupport {
    private int id;

    public void setId(int id) {
        this.id = id;
    }

    public int doStartTag() throws JspException {

        try {
            String style = "";
            pageContext.getOut().print(style);
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }
}
