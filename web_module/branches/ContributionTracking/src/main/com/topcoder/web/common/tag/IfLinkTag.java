package com.topcoder.web.common.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * If the condition is true, it shows a link with the text specified.
 * If it's false, it just shows the text.
 * This can be used, for example, to create menues where the current option doesn't have a link.
 * 
 * @author  Cucu
 */
public class IfLinkTag extends TagSupport {

    private String link = "";
    private String text = "";
    private boolean useLink = false;
    private String styleClass = "";

    public void setText(String text) {
        this.text = text;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public void setStyleClass(String styleClass) {
        this.styleClass = styleClass;
    }


    public void setUseLink(String useLink) {
        this.useLink = "true".equalsIgnoreCase(useLink);

    }

    public int doStartTag() throws JspException {
        StringBuffer buf = new StringBuffer(100);
        if (useLink) {
            buf.append("<a href=\"" + link + "\" ");
            if (!"".equals(styleClass)) {
                buf.append("class=\"" + styleClass + "\" ");
            }
            buf.append(" >" + text + "</a>");
        } else {
            buf.append(text);
        }
        
        try {
            pageContext.getOut().print(buf.toString());
        } catch (IOException e) {
            throw new JspException(e);
        }
        return SKIP_BODY;
    }


    public int doEndTag() throws JspException {
        this.link = "";
        this.text = "";
        this.useLink = false;
        this.styleClass = "";
        return super.doEndTag();
    }


}
