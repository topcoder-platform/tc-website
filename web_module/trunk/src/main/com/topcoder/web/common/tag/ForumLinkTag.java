package com.topcoder.web.common.tag;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.forums.ForumConstants;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.forum.ForumFactory;
import com.jivesoftware.forum.Forum;

import javax.servlet.jsp.tagext.TagSupport;

/* 
 * @author mtong
 * @date 8/26/05
 * 
 * Returns a link to the given forum, displaying its message count.
 */

public class ForumLinkTag extends TagSupport {
    private long forumID = -1;
    private String message = "";

    public int doStartTag() {
        StringBuffer ret = new StringBuffer(150);

        ret.append("<A");
        StringBuffer url = new StringBuffer();
        url.append("http://").append(ApplicationServer.FORUMS_SERVER_NAME).append("/");
        url.append("?module=ThreadList&").append(ForumConstants.FORUM_ID).append("=").append(forumID);
        ret.append(" HREF=\"").append(url).append("\" ");

        ret.append(">");
        
        ForumFactory forumFactory = ForumFactory.getInstance(AuthFactory.getAnonymousAuthToken());
        try {
            Forum forum = forumFactory.getForum(forumID);
            ret.append(this.message).append(" (").append(forum.getMessageCount()).append(" comments)");
        } catch (Exception ignored) {}

        ret.append("</A>");

        try {
            pageContext.getOut().print(ret.toString());
        } catch (java.io.IOException ioe) {
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
        this.forumID = -1;
        this.message = "Discuss";
    }
}
