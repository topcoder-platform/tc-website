package com.topcoder.web.tc.view.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class SponsorImage extends TagSupport {

    private String src;
    private String height;
    private String width;
    private String vspace;
    private String border;
    private String alt;
    private String hspace;
    private String href;
    private String styleClass;
    private String align;

    public void setSrc(String src) {
        this.src = src;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public void setVspace(String vspace) {
        this.vspace = vspace;
    }

    public void setBorder(String border) {
        this.border = border;
    }

    public void setAlt(String alt) {
        this.alt = alt;
    }

    public void setHspace(String hspace) {
        this.hspace = hspace;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public void setClass(String styleClass) {
        this.styleClass = styleClass;
    }

    public void setAlign(String align) {
        this.align = align;
    }

    public int doStartTag() throws JspException {
        return SKIP_BODY;
    }


    public int doEndTag() throws JspException {

        StringBuffer buffer = new StringBuffer(200);
        if (src != null) {
            if (href != null) {
                buffer.append("<a href=\"");
                buffer.append(href);
                buffer.append("\" ");
                if (styleClass != null) {
                    buffer.append("class=\"");
                    buffer.append(styleClass);
                    buffer.append("\" ");
                }
                buffer.append(">");
            }
            buffer.append("<img src=\"");
            buffer.append(src);
            buffer.append("\"");

            if (alt != null) {
                buffer.append(" alt=\"" + alt + "\"");
            }

            if (height != null) {
                buffer.append(" height=\"" + height + "\"");
            }

            if (width != null) {
                buffer.append(" width=\"" + width + "\"");
            }

            if (vspace != null) {
                buffer.append(" vspace=\"" + vspace + "\"");
            }

            if (hspace != null) {
                buffer.append(" hspace=\"" + hspace + "\"");
            }

            if (border != null) {
                buffer.append(" border=\"" + border + "\"");
            }
            buffer.append(" />");
            if (href != null) {
                buffer.append("</a>");
            }
        }

        try {
            pageContext.getOut().println(buffer.toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }

        return EVAL_PAGE;
    }
}
