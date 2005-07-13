/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumThread;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

import java.util.Iterator;

/**
 * @author mtong
 *
 * Given a message ID, redirects the message request to the appropriate Thread view.
 */
public class Message extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();

        String threadView = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_VIEW));
		long messageID = Long.parseLong(getRequest().getParameter(ForumConstants.MESSAGE_ID));
		ForumMessage message = forumFactory.getMessage(messageID);
		ForumThread thread = message.getForumThread();

		StringBuffer urlNext = new StringBuffer();
		urlNext.append("?module=Thread&").append(ForumConstants.THREAD_ID).append("=").append(thread.getID());
		if (threadView.equals("flat") ||
                (threadView.equals("") && (authToken.isAnonymous() || user.getProperty("jiveThreadMode") == null) && ForumConstants.DEFAULT_GUEST_THREAD_VIEW.equals("flat")) ||
                (threadView.equals("") && user.getProperty("jiveThreadMode").equals("flat"))) {
			int messageIdx = 0;
			Iterator messageIter = thread.getMessages();
			while (messageIter.hasNext()) {
			    if (((ForumMessage)messageIter.next()).getID() == messageID) {
			    	break;
			    }
			    messageIdx++;
			}

            int messageRange = ForumConstants.DEFAULT_MESSAGE_RANGE;
            if (user != null) {
                try {
                    messageRange = Integer.parseInt(user.getProperty("jiveMessageRange"));
                } catch (Exception ignored) {}
            }
			int startIdx = (messageIdx/messageRange)*messageRange;
			urlNext.append("&").append(ForumConstants.START_IDX).append("=").append(startIdx);
		} else if (threadView.equals("tree") ||
                (threadView.equals("") && (authToken.isAnonymous() || user.getProperty("jiveThreadMode") == null) && ForumConstants.DEFAULT_GUEST_THREAD_VIEW.equals("tree")) ||
                (threadView.equals("") && user.getProperty("jiveThreadMode").equals("tree"))) {
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
}