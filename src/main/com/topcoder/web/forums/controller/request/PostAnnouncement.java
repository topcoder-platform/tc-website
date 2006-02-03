/*
 * Created on Jan 31, 2006
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.AnnouncementManager;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ForumPermissions;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;

import java.util.Calendar;
import java.util.TimeZone;

/**
 * @author mtong
 *
 * Posts an announcement and redirects the user its place in the forums, or returns to 
 * postannounce.jsp if errors exist.
 */
public class PostAnnouncement extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        
        if (!ForumsUtil.isAdmin(user)) {
            setNextPage("?module=ForumList");
            setIsNextPageInContext(false);
            return;
        }

        AnnouncementManager announcementManager = forumFactory.getAnnouncementManager();
        
        long categoryID = -1;
		long forumID = -1;
		long announcementID = -1;

        ForumCategory category = null;
        Forum forum = null; 
        com.jivesoftware.forum.Announcement announcement = null;
        
        String categoryIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.CATEGORY_ID));
        String forumIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.FORUM_ID));
        String announcementIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.ANNOUNCEMENT_ID));
		String postMode = getRequest().getParameter(ForumConstants.POST_MODE);
		String subject = com.jivesoftware.util.StringUtils.escapeHTMLTags
            (getRequest().getParameter(ForumConstants.ANNOUNCEMENT_SUBJECT).trim());
        String body = getRequest().getParameter(ForumConstants.ANNOUNCEMENT_BODY).trim();
        String textareaBody = ForumsUtil.createTextAreaBody(body);
        
        if (postMode.equals("New")) {
            categoryID = Long.parseLong(categoryIDStr);
            category = forumFactory.getForumCategory(categoryID);
            if (!forumIDStr.equals("")) {
                forumID = Long.parseLong(forumIDStr);
                if (forumID > 0) {
                    forum = forumFactory.getForum(forumID);
                }
            }
        } else if (postMode.equals("Edit")) {
            announcementID = Long.parseLong(announcementIDStr);
            announcement = announcementManager.getAnnouncement(announcementID);
            if (announcement.getContainerObjectType() == JiveConstants.FORUM) {
                forum = forumFactory.getForum(announcement.getContainerObjectID());
                forumID = forum.getID();
                category = forum.getForumCategory();
                categoryID = category.getID();
            } else if (announcement.getContainerObjectType() == JiveConstants.FORUM_CATEGORY) {
                category = forumFactory.getForumCategory(announcement.getContainerObjectID());
                categoryID = category.getID();
            } else if (announcement.getContainerObjectType() == JiveConstants.SYSTEM) {
                category = forumFactory.getRootForumCategory();
                categoryID = category.getID();
            }
        } else {
            addError(ForumConstants.ANNOUNCEMENT_SUBJECT, ForumConstants.ERR_POST_MODE_UNRECOGNIZED);
        }
        
		if (subject.trim().equals("")) {
			addError(ForumConstants.ANNOUNCEMENT_SUBJECT, ForumConstants.ERR_EMPTY_MESSAGE_SUBJECT);
		}
		if (body.trim().equals("")) {
			addError(ForumConstants.ANNOUNCEMENT_BODY, ForumConstants.ERR_EMPTY_MESSAGE_BODY);
		}
        if (subject.length() > ForumConstants.MESSAGE_SUBJECT_MAX_LENGTH) {
            addError(ForumConstants.ANNOUNCEMENT_SUBJECT, ForumConstants.ERR_LONG_MESSAGE_SUBJECT);
        }
        if (body.length() > ForumConstants.MESSAGE_BODY_MAX_LENGTH) {
        	addError(ForumConstants.ANNOUNCEMENT_BODY, ForumConstants.ERR_LONG_MESSAGE_BODY);
        }
        if (!category.isAuthorized(ForumPermissions.ANNOUNCEMENT_ADMIN)) {
            addError(ForumConstants.ANNOUNCEMENT_BODY, ForumConstants.ERR_CANNOT_POST_ANNOUNCEMENT);
        }
		if (hasErrors()) {
			setDefault(ForumConstants.CATEGORY_ID, getRequest().getParameter(ForumConstants.CATEGORY_ID));
            setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
			setDefault(ForumConstants.ANNOUNCEMENT_ID, getRequest().getParameter(ForumConstants.ANNOUNCEMENT_ID));
			setDefault(ForumConstants.POST_MODE, postMode);
			setDefault(ForumConstants.ANNOUNCEMENT_SUBJECT, subject);
            setDefault(ForumConstants.ANNOUNCEMENT_BODY, textareaBody);

            getRequest().setAttribute("announcement", announcement);
			getRequest().setAttribute("forumFactory", forumFactory);
            getRequest().setAttribute("category", category);
			getRequest().setAttribute("forum", forum);
            getRequest().setAttribute("postMode", postMode);

            setNextPage("/postAnnounce.jsp");
			setIsNextPageInContext(true);
			return;
		}

        boolean isNewAnnouncement = false;
        if (announcement == null) {
            if (forum != null) {
                announcement = announcementManager.createAnnouncement(user, forum);
            } else if (category != null) {
                announcement = announcementManager.createAnnouncement(user, category);
            } else {
                announcement = announcementManager.createAnnouncement(user);
            }
            isNewAnnouncement = true;
		}
		announcement.setSubject(subject);
		announcement.setBody(body);
        announcement.setStartDate(Calendar.getInstance(TimeZone.getTimeZone("EST")).getTime());
        if (isNewAnnouncement) {
            announcementManager.addAnnouncement(announcement);
        }
        
		setNextPage("?module=Announcement&" + ForumConstants.ANNOUNCEMENT_ID + "=" + announcement.getID());
		setIsNextPageInContext(false);
	}
}