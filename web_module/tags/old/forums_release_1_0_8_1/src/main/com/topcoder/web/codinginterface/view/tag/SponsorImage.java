package com.topcoder.web.codinginterface.view.tag;

import com.topcoder.web.common.model.ImageInfo;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 27, 2005
 */
public class SponsorImage extends TagSupport {

    private ImageInfo image = null;
    private String alt = null;
    private String vspace = null;
    private String border = null;
    private String ifNull = null;

    public void setImage(ImageInfo image) {
        this.image = image;
    }

    public void setImage(String image) {
        this.image = (ImageInfo) pageContext.findAttribute(image);
    }

    public void setAlt(String alt) {
        this.alt = alt;
    }

    public void setVspace(String vspace) {
        this.vspace = vspace;
    }

    public void setBorder(String border) {
        this.border = border;
    }

    public void setIfNull(String ifNull) {
        this.ifNull = ifNull;
    }


    public int doStartTag() throws JspException {

        if (image!=null) {
            StringBuffer buffer = new StringBuffer(200);
            if (image.getLink()!=null) {
                buffer.append("<a href=\"");
                buffer.append(image.getLink());
                buffer.append("\">");
            }
            buffer.append("<img src=\"");
            buffer.append(image.getSrc() == null ? "" : image.getSrc());
            buffer.append("\"");
            if (alt != null) {
                buffer.append(" alt=\"" + alt + "\"");
            }
            if (image.getHeight() >= 0) {
                buffer.append(" height=\"" + image.getHeight() + "\"");
            }
            if (image.getWidth() >= 0) {
                buffer.append(" width=\"" + image.getWidth() + "\"");
            }

            if (vspace != null) {
                buffer.append(" vspace=\"" + vspace + "\"");
            }

            if (border != null) {
                buffer.append(" border=\"" + border + "\"");
            }

            buffer.append(" />");
            if (image.getLink()!=null) {
                buffer.append("</a>");
            }

            try {
                pageContext.getOut().println(buffer.toString());
            } catch (IOException e) {
                throw new JspException(e.getMessage());
            }

        } else {
            if (ifNull!=null) {
                try {
                    pageContext.getOut().println(ifNull);
                } catch (IOException e) {
                    throw new JspException(e.getMessage());
                }
            }
        }

        return EVAL_BODY_INCLUDE;
    }

    public int doEndTag() throws JspException {
        this.image = null;
        this.alt = null;
        this.vspace = null;
        this.border = null;
        this.ifNull = null;
        return super.doEndTag();
    }


}
