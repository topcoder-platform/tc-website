package com.topcoder.web.aolicq.view.tags;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.WebConstants;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/*
 * @author mtong
 * @date 8/26/05
 *
 * Returns a link to the given forum, displaying its message count.
 */

public class ForumLinkTag extends TagSupport {
    private long forumID;
    private String message;

    public ForumLinkTag() {
        super();
        init();
    }

    public int doStartTag() throws JspException {
        StringBuffer ret = new StringBuffer(150);

        ret.append("<a");
        StringBuffer url = new StringBuffer();
        url.append("http://").append(ApplicationServer.AOLICQ_SERVER_NAME).append("/forums");
        url.append("?module=ThreadList&amp;").append(WebConstants.FORUM_ID).append("=").append(forumID);
        ret.append(" href=\"").append(url).append("\"");
        ret.append(">");

        ret.append(this.message);

        ret.append("</a>");

        try {
            pageContext.getOut().print(ret.toString());
        } catch (Exception e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

    public void setForumID(long forumID) {
        this.forumID = forumID;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    protected void init() {
        forumID = -1;
        message = "Discuss this";
    }

    public int doEndTag() throws JspException {
        init();
        return super.doEndTag();
    }
}
