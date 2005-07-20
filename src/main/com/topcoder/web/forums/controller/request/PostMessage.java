/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.WatchManager;
import com.jivesoftware.forum.ForumThreadNotFoundException;
import com.jivesoftware.forum.ForumMessageNotFoundException;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;


/**
 * @author mtong
 *
 * Posts a message and redirects the user its place in the forum, or returns to post.jsp if errors exist.
 */
public class PostMessage extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

		long forumID = Long.parseLong(getRequest().getParameter(ForumConstants.FORUM_ID));
		long threadID = -1;
		long messageID = -1;

        String threadIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_ID));
        String messageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
		String postMode = getRequest().getParameter(ForumConstants.POST_MODE);
		String subject = com.jivesoftware.util.StringUtils.escapeHTMLTags
            (getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT).trim());
        String body = getRequest().getParameter(ForumConstants.MESSAGE_BODY).trim();

        Forum forum = forumFactory.getForum(forumID);
        ForumMessage message = null;
        ForumThread thread = null;
        try {
            threadID = Long.parseLong(threadIDStr);
            thread = forum.getThread(threadID);
        } catch (NumberFormatException nfe) {    
        } catch (ForumThreadNotFoundException fte) {
            addError(ForumConstants.MESSAGE_SUBJECT, ForumConstants.ERR_THREAD_NOT_FOUND);
        }
        try {
            messageID = Long.parseLong(messageIDStr);
            if (thread != null) {
                message = thread.getMessage(messageID);
            }
        } catch (NumberFormatException nfe) {    
        } catch (ForumMessageNotFoundException fme) {
            addError(ForumConstants.MESSAGE_SUBJECT, ForumConstants.ERR_MESSAGE_NOT_FOUND);
        }

		if (subject.equals("")) {
			addError(ForumConstants.MESSAGE_SUBJECT, ForumConstants.ERR_EMPTY_MESSAGE_SUBJECT);
		}
		if (body.equals("")) {
			addError(ForumConstants.MESSAGE_BODY, ForumConstants.ERR_EMPTY_MESSAGE_BODY);
		}
        if (subject.length() > ForumConstants.MESSAGE_SUBJECT_MAX_LENGTH) {
            addError(ForumConstants.MESSAGE_SUBJECT, ForumConstants.ERR_LONG_MESSAGE_SUBJECT);
        }
        if (body.length() > ForumConstants.MESSAGE_BODY_MAX_LENGTH) {
        	addError(ForumConstants.MESSAGE_BODY, ForumConstants.ERR_LONG_MESSAGE_BODY);
        }
		if (hasErrors()) {
			setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
			setDefault(ForumConstants.THREAD_ID, getRequest().getParameter(ForumConstants.THREAD_ID));
			setDefault(ForumConstants.MESSAGE_ID, getRequest().getParameter(ForumConstants.MESSAGE_ID));
			setDefault(ForumConstants.POST_MODE, postMode);
			setDefault(ForumConstants.MESSAGE_SUBJECT, subject);
            setDefault(ForumConstants.MESSAGE_BODY, body);

            if (!messageIDStr.equals("") && !threadIDStr.equals("")) {
                getRequest().setAttribute("thread", message.getForumThread());
                getRequest().setAttribute("message", message);
            }

			getRequest().setAttribute("forumFactory", forumFactory);
			getRequest().setAttribute("forum", forum);
            getRequest().setAttribute("postMode", postMode);

            setNextPage("/post.jsp");
			setIsNextPageInContext(true);
			return;
		}

        if (messageIDStr.equals("") || postMode.equals("Reply")) {
			message = forum.createMessage(user);
		}
		message.setSubject(subject);
		message.setBody(body);

        WatchManager watchManager = forumFactory.getWatchManager();
		if (!threadIDStr.equals("")) {
			if (postMode.equals("Reply")) {
				ForumMessage parentMessage = forumFactory.getMessage(messageID);
				thread.addMessage(parentMessage, message);
                if ("true".equals(user.getProperty("jiveAutoWatchReplies")) && !watchManager.isWatched(user, thread) && 
                        watchManager.getTotalWatchCount(user, JiveConstants.THREAD) < ForumConstants.DEFAULT_MAX_THREAD_WATCHES) {
                    watchManager.createWatch(user, thread);
                }
			}
		} else {
			thread = forum.createThread(message);
			forum.addThread(thread);
            if ("true".equals(user.getProperty("jiveAutoWatchNewTopics")) && !watchManager.isWatched(user, thread) && 
                    watchManager.getTotalWatchCount(user, JiveConstants.THREAD) < ForumConstants.DEFAULT_MAX_THREAD_WATCHES) {
                watchManager.createWatch(user, thread);
            }
		}

		setNextPage("?module=Message&" + ForumConstants.MESSAGE_ID + "=" + message.getID());
		setIsNextPageInContext(false);
	}
}