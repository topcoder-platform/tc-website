/*
 * Copyright (C) 2005-2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.view.tags;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.WebConstants;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * <p>A custom JSP tag used to render the link to forum related to contest.</p>
 *
 * <p>
 *   Version 1.1 (Studio Contest Detail Pages assembly) Change notes:
 *   <ol>
 *     <li>Updated Serial version UID.</li>
 *     <li>Added {@link #styleClass()} property.</li>
 *   </ol>
 * </p>
 *
 * @author mtong, TCSDEVELOPER
 * @version 1.1
 */
public class ForumLinkTag extends TagSupport {
    private long forumID;
    private String message;

    /**
     * <p>A <code>String</code> providing the optional style class.</p>
     */
    private String styleClass;

    public ForumLinkTag() {
        super();
        init();
    }

    public int doStartTag() throws JspException {
        StringBuffer ret = new StringBuffer(150);

        ret.append("<a");
        StringBuffer url = new StringBuffer();
        url.append("http://").append(ApplicationServer.STUDIO_SERVER_NAME).append("/forums");
        url.append("?module=ThreadList&amp;").append(WebConstants.FORUM_ID).append("=").append(forumID);
        ret.append(" href=\"").append(url).append("\"");
        if (getStyleClass() != null) {
            ret.append(" class=\"").append(getStyleClass()).append("\"");
        }
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

    /**
     * <p>Gets the  optional style class.</p>
     *
     * @return a <code>String</code> providing the  optional style class.
     * @since 1.1
     */
    public String getStyleClass() {
        return this.styleClass;
    }

    /**
     * <p>Sets the  optional style class.</p>
     *
     * @param styleClass a <code>String</code> providing the  optional style class.
     * @since 1.1
     */
    public void setStyleClass(String styleClass) {
        this.styleClass = styleClass;
    }
}
