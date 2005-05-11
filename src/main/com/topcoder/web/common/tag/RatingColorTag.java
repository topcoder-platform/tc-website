/*
 * RatingColorTag.java
 *
 * Created on May 4, 2005, 9:26 AM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.common.tag;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 *
 * @author rfairfax
 */
public class RatingColorTag extends BodyTagSupport {
    private int rating;
    private String cssclass = "";
    private boolean darkBG = true;

    private static final String[] lightStyles =
            {"coderTextOrange", "coderTextBlack", "coderTextGray",
             "coderTextGreen", "coderTextBlue", "coderTextYellow", "coderTextRed"};

    private static final String[] darkStyles =
            {"coderTextOrange", "coderTextWhite", "coderTextGray",
             "coderTextGreen", "coderTextBlue", "coderTextYellow", "coderTextRed"};

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setRating(String rating) {
        this.rating = Integer.parseInt(rating);
    }

    public void setClass(String cssclass) {
        this.cssclass = cssclass;
    }

    public void setDarkBG(String s) {
        this.darkBG = (s.toLowerCase().trim().equals("true"));
    }

    public int doStartTag() throws JspException {

        try { 
            //check for css override
            boolean bCSSOverride = false;
            if (cssclass != null && !cssclass.equals("")) {
                bCSSOverride = true;
            }

            StringBuffer output = new StringBuffer();
            output.append("<span class=\"");

            if (bCSSOverride) {
                output.append(cssclass);
            } else {
                output.append(getRatingCSS(rating));
            }

            output.append("\">");

            pageContext.getOut().print(output.toString());
        } catch (Exception e) {
            throw new JspException(e.getMessage());
        }
        return EVAL_BODY_TAG;
    }
    
    public int doAfterBody() throws JspException {
        try {
            if (bodyContent != null) {
                bodyContent.writeOut(getPreviousOut());
            }
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }
    
    public int doEndTag() throws JspException {
        try {
            pageContext.getOut().print("</span>");
        } catch (Exception e) {
            throw new JspException(e.getMessage());
        }
        return super.doEndTag();
    }

    private String getRatingCSS(int rating) {
        if (rating < 0)
            return darkBG ? lightStyles[0] : darkStyles[0];
        else if (rating == 0)
            return darkBG ? lightStyles[1] : darkStyles[1];
        else if (rating > 0 && rating < 900)
            return darkBG ? lightStyles[2] : darkStyles[2];
        else if (rating > 899 && rating < 1200)
            return darkBG ? lightStyles[3] : darkStyles[3];
        else if (rating > 1199 && rating < 1500)
            return darkBG ? lightStyles[4] : darkStyles[4];
        else if (rating > 1499 && rating < 2200)
            return darkBG ? lightStyles[5] : darkStyles[5];
        else if (rating > 2199) return darkBG ? lightStyles[6] : darkStyles[6];
        return "";
    }
}
