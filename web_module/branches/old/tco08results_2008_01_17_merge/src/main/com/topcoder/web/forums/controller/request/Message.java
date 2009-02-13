/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumThread;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

import java.util.Iterator;

/**
 * @author mtong
 *         <p/>
 *         Given a message ID, redirects the message request to the appropriate Thread view.
 */
public class Message extends ForumsProcessor {
    protected void businessProcessing() throws Exception {
        super.businessProcessing();

        String threadView = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_VIEW));
        long messageID = Long.parseLong(getRequest().getParameter(ForumConstants.MESSAGE_ID));
        ForumMessage message;
        ForumThread thread;
        try {
            message = forumFactory.getMessage(messageID);
            thread = message.getForumThread();
        } catch (UnauthorizedException ue) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        StringBuffer urlNext = new StringBuffer(getSessionInfo().getServletPath());
        urlNext.append("?module=Thread&").append(ForumConstants.THREAD_ID).append("=").append(thread.getID());
        if (isSelectedView(threadView, "flat") || isSelectedView(threadView, "flat_new")) {
            int messageIdx = 0;
            Iterator messageIter = thread.getMessages();
            while (messageIter.hasNext()) {
                if (((ForumMessage) messageIter.next()).getID() == messageID) {
                    break;
                }
                messageIdx++;
            }
            if (isSelectedView(threadView, "flat_new")) {
                messageIdx = thread.getMessageCount() - messageIdx - 1;
            }

            int messageRange = JiveGlobals.getJiveIntProperty("skin.default.defaultMessagesPerPage",
                    ForumConstants.DEFAULT_MESSAGE_RANGE);
            if (user != null) {
                try {
                    messageRange = Integer.parseInt(user.getProperty("jiveMessageRange"));
                } catch (Exception ignored) {
                }
            }
            int startIdx = (messageIdx / messageRange) * messageRange;
            urlNext.append("&").append(ForumConstants.START_IDX).append("=").append(startIdx);
        } else if (isSelectedView(threadView, "tree")) {
            urlNext.append("&").append(ForumConstants.MESSAGE_ID).append("=").append(messageID);
        }

        urlNext.append("&mc=").append(thread.getMessageCount());
        if (!threadView.equals("")) {
            urlNext.append("&").append(ForumConstants.THREAD_VIEW).append("=").append(threadView);
        }
        urlNext.append("#").append(messageID);

        setNextPage(urlNext.toString());
        setIsNextPageInContext(false);
    }

    private boolean isSelectedView(String threadView, String view) {
        return (threadView.equals(view) ||
                (threadView.equals("") && (authToken.isAnonymous() || user.getProperty("jiveThreadMode") == null) && ForumConstants.DEFAULT_GUEST_THREAD_VIEW.equals(view)) ||
                (threadView.equals("") && user != null && view != null && view.equals(user.getProperty("jiveThreadMode"))));
    }
}