package com.topcoder.web.common.tag;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.JspException;
import java.io.IOException;

public class RatingStyleTag extends TagSupport {
    private int rating;

    private static final String[] styles =
            {"coderTextOrange", "coderTextWhite", "coderTextGray", "coderTextBlue", "coderTextYellow", "coderTexxtRed"};


    public void setRating(int rating) {
        this.rating = rating;
    }

    public int doStartTag() throws JspException {

        try {
            String style = null;
            if (rating < 0) style = styles[0];
            else if (rating == 0) style = styles[1];
            else if (rating > 0 && rating < 900) style = styles[1];
            else if (rating > 899 && rating < 1200) style = styles[2];
            else if (rating > 1199 && rating < 1500) style = styles[3];
            else if (rating > 1499 && rating < 2200) style = styles[4];
            else if (rating > 2199) style = styles[5];
            pageContext.getOut().print(style);
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }
}
