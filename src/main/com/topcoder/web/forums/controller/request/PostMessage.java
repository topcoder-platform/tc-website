/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import javax.naming.InitialContext;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.ForumPermissions;
import com.jivesoftware.forum.WatchManager;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.StringUtil;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.messagehistory.MessageHistory;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.shared.util.DBMS;

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

		long forumID = -1;
		long threadID = -1;
		long messageID = -1;

        Forum forum = null; 
        ForumMessage message = null;
        ForumThread thread = null;
        
        String forumIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.FORUM_ID));
        String messageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
		String postMode = getRequest().getParameter(ForumConstants.POST_MODE);
		String subject = com.jivesoftware.util.StringUtils.escapeHTMLTags
            (getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT).trim());
        String body = getRequest().getParameter(ForumConstants.MESSAGE_BODY).trim();
        String textareaBody = this.createTextAreaBody(body);
        
        if (postMode.equals("New")) {
            forumID = Long.parseLong(forumIDStr);
            forum = forumFactory.getForum(forumID);
        } else if (postMode.equals("Reply") || postMode.equals("Edit")) {
            messageID = Long.parseLong(messageIDStr);
            message = forumFactory.getMessage(messageID);
            forum = message.getForum();
            forumID = forum.getID();
            thread = message.getForumThread();
            threadID = thread.getID();
        } else {
            addError(ForumConstants.MESSAGE_SUBJECT, ForumConstants.ERR_POST_MODE_UNRECOGNIZED);
        }
        
		if (subject.trim().equals("")) {
			addError(ForumConstants.MESSAGE_SUBJECT, ForumConstants.ERR_EMPTY_MESSAGE_SUBJECT);
		}
		if (body.trim().equals("")) {
			addError(ForumConstants.MESSAGE_BODY, ForumConstants.ERR_EMPTY_MESSAGE_BODY);
		}
        if (subject.length() > ForumConstants.MESSAGE_SUBJECT_MAX_LENGTH) {
            addError(ForumConstants.MESSAGE_SUBJECT, ForumConstants.ERR_LONG_MESSAGE_SUBJECT);
        }
        if (body.length() > ForumConstants.MESSAGE_BODY_MAX_LENGTH) {
        	addError(ForumConstants.MESSAGE_BODY, ForumConstants.ERR_LONG_MESSAGE_BODY);
        }
        if (thread == null && !forum.isAuthorized(ForumPermissions.CREATE_THREAD)) {
            addError(ForumConstants.MESSAGE_BODY, ForumConstants.ERR_CANNOT_POST_THREAD);
        }
        if (!forum.isAuthorized(ForumPermissions.CREATE_MESSAGE)) {
            addError(ForumConstants.MESSAGE_BODY, ForumConstants.ERR_CANNOT_POST_MESSAGE);
        }
		if (hasErrors()) {
			setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
			setDefault(ForumConstants.MESSAGE_ID, getRequest().getParameter(ForumConstants.MESSAGE_ID));
			setDefault(ForumConstants.POST_MODE, postMode);
			setDefault(ForumConstants.MESSAGE_SUBJECT, subject);
            setDefault(ForumConstants.MESSAGE_BODY, textareaBody);

            if (message != null && thread != null) {
                getRequest().setAttribute("thread", thread);
                getRequest().setAttribute("message", message);
            }

			getRequest().setAttribute("forumFactory", forumFactory);
			getRequest().setAttribute("forum", forum);
            getRequest().setAttribute("postMode", postMode);

            setNextPage("/post.jsp");
			setIsNextPageInContext(true);
			return;
		}

        if (message == null || postMode.equals("Reply")) {
			message = forum.createMessage(user);
		}
        long histModificationDate = message.getModificationDate().getTime();
        String histSubject = message.getSubject();
        String histBody = message.getBody();
		message.setSubject(subject);
		message.setBody(body);
        
        // Add an edit to the revision history only if Jive recognizes that an edit has taken place
        if (postMode.equals("Edit") && message.getModificationDate().getTime() > histModificationDate) {
            InitialContext ctx = TCContext.getInitial();
            MessageHistory historyBean = (MessageHistory)createEJB(ctx, MessageHistory.class);
            historyBean.addEdit(message.getID(), histSubject, histBody, histModificationDate, DBMS.FORUMS_DATASOURCE_NAME);
        }

        WatchManager watchManager = forumFactory.getWatchManager();
		if (thread != null) {
			if (postMode.equals("Reply")) {
				ForumMessage parentMessage = forumFactory.getMessage(messageID);
				thread.addMessage(parentMessage, message);
                if ("true".equals(user.getProperty("jiveAutoWatchReplies")) && !watchManager.isWatched(user, thread) && 
                        watchManager.getTotalWatchCount(user, JiveConstants.THREAD) < ForumConstants.MAX_THREAD_WATCHES) {
                    watchManager.createWatch(user, thread);
                }
			}
		} else {
			thread = forum.createThread(message);
			forum.addThread(thread);
            if ("true".equals(user.getProperty("jiveAutoWatchNewTopics")) && !watchManager.isWatched(user, thread) && 
                    watchManager.getTotalWatchCount(user, JiveConstants.THREAD) < ForumConstants.MAX_THREAD_WATCHES) {
                watchManager.createWatch(user, thread);
            }
		}

		setNextPage("?module=Message&" + ForumConstants.MESSAGE_ID + "=" + message.getID());
		setIsNextPageInContext(false);
	}
    
    public String createTextAreaBody(String body) {
        String textareaBody = StringUtil.replace(body, "<?", "&lt;?");
        textareaBody = StringUtil.replace(body, ">?", "&gt;?");
        textareaBody = textareaBody.replaceAll("&","&amp;");
        log.debug("###textareabody: "+textareaBody);
        return textareaBody;
    }
}