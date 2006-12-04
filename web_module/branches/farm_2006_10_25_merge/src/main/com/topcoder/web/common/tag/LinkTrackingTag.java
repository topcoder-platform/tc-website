package com.topcoder.web.common.tag;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.StringUtils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public class LinkTrackingTag extends TagSupport {
    private String link = "";
    private String refer = "";
    private String styleClass = "";


    public void setLink(String link) {
        this.link = link;
    }

    public void setStyleClass(String styleClass) {
        this.styleClass = styleClass;
    }


    public void setRefer(String refer) {
        this.refer = refer;
    }

    public int doStartTag() throws JspException {
        StringBuffer buf = new StringBuffer(100);
        buf.append("http://");
        buf.append(ApplicationServer.SERVER_NAME);
        buf.append("/tc?module=LinkTracking&amp;link=");
        buf.append(StringUtils.replace(link, "&", "%26"));
        buf.append("&amp;refer=").append(refer);
        try {
            pageContext.getOut().print(buf.toString());
        } catch (IOException e) {
            throw new JspException(e);
        }
        return SKIP_BODY;
    }


    public int doEndTag() throws JspException {
        this.link = "";
        this.refer = "";
        this.styleClass = "";
        return super.doEndTag();
    }


}

