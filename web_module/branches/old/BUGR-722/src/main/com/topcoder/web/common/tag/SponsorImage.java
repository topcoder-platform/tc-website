package com.topcoder.web.common.tag;

import com.topcoder.web.common.model.ImageInfo;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * @author  dok
 * @version  $Revision: 43633 $ $Date$
 * Create Date: Jan 27, 2005
 */
public class SponsorImage extends TagSupport {

    private ImageInfo imageObject = null;
    private String alt = null;
    private String vspace = null;
    private String border = null;
    private String ifNull = null;
    private boolean newWindow = true;


    public void setImage(String image) {
        this.imageObject = (ImageInfo) pageContext.findAttribute(image);
    }

    public void setImageObject(ImageInfo image) {
        this.imageObject = image;
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

    public void setNewWindow(String newWindow) {
        this.newWindow = String.valueOf(true).equals(newWindow);
    }


    public int doStartTag() throws JspException {

        if (imageObject!=null) {
            StringBuffer buffer = new StringBuffer();
            if (imageObject.getLink()!=null) {
                buffer.append("<a href=\"");
                buffer.append(imageObject.getLink());
                buffer.append("\"");
                if (newWindow) {
                    buffer.append(" target=\"_blank\"");
                }
                buffer.append(">");
            }
            buffer.append("<img src=\"");
            buffer.append(imageObject.getSrc() == null ? "" : imageObject.getSrc());
            buffer.append("\"");
            if (alt != null) {
                buffer.append(" alt=\"" + alt + "\"");
            }
            if (imageObject.getHeight() >= 0) {
                buffer.append(" height=\"" + imageObject.getHeight() + "\"");
            }
            if (imageObject.getWidth() >= 0) {
                buffer.append(" width=\"" + imageObject.getWidth() + "\"");
            }

            if (vspace != null) {
                buffer.append(" vspace=\"" + vspace + "\"");
            }

            if (border != null) {
                buffer.append(" border=\"" + border + "\"");
            }

            buffer.append(" />");
            if (imageObject.getLink()!=null) {
                buffer.append("</a>");
            }

            try {
                pageContext.getOut().println(buffer.toString());
            } catch (IOException e) {
                throw new JspException(e.getMessage());
            }
        } else if (ifNull!=null) {
            try {
                pageContext.getOut().println(ifNull);
            } catch (IOException e) {
                throw new JspException(e.getMessage());
            }

        }

        return EVAL_BODY_INCLUDE;
    }

    public int doEndTag() throws JspException {
        this.imageObject = null;
        this.alt = null;
        this.vspace = null;
        this.border = null;
        this.ifNull = null;
        this.newWindow = true;
        return super.doEndTag();
    }


}
