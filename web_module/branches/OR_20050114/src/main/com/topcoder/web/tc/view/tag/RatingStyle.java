package com.topcoder.web.tc.view.tag;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.JspException;
import java.io.IOException;

public class RatingStyle extends TagSupport {
    private int rating = 0;

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int doStartTag() throws JspException {
        return SKIP_BODY;
    }


    public int doEndTag() throws JspException {

        String styleClass = "coderTextOrange";
        if (rating > 2199) {
            styleClass = "coderTextRed";
        } else if (rating > 1499 && rating < 2200) {
            styleClass = "coderTextYellow";
        } else if (rating > 1199 && rating < 1500) {
            styleClass = "coderTextBlue";
        } else if (rating > 899 && rating < 1200) {
            styleClass = "coderTextGreen";
        } else if (rating > 0 && rating < 900) {
            styleClass = "coderTextGray";
        } else if (rating == 0) {
            styleClass = "coderTextWhite";
        }

        try {
            pageContext.getOut().println(styleClass);
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }

        return EVAL_PAGE;
    }


}
