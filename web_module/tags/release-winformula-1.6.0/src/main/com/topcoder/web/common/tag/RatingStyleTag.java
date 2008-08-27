package com.topcoder.web.common.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class RatingStyleTag extends TagSupport {
    private int rating;

    private static final String[] styles =
            {"coderTextOrange", "coderTextWhite", "coderTextGray", "coderTextGreen", "coderTextBlue", "coderTextYellow", "coderTextRed"};


    public void setRating(int rating) {
        this.rating = rating;
    }

    public int doStartTag() throws JspException {

        try {
            String style = null;
            if (rating < 0)
                style = styles[0];
            else if (rating == 0)
                style = styles[1];
            else if (rating > 0 && rating < 900)
                style = styles[2];
            else if (rating > 899 && rating < 1200)
                style = styles[3];
            else if (rating > 1199 && rating < 1500)
                style = styles[4];
            else if (rating > 1499 && rating < 2200)
                style = styles[5];
            else if (rating > 2199) style = styles[6];
            pageContext.getOut().print(style);
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

    /**
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     */
    public int doEndTag() throws JspException {
        this.rating = 0;
        return super.doEndTag();
    }
}
