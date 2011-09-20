/*
 * Created on Jan 30, 2006
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.Announcement;
import com.jivesoftware.forum.AnnouncementManager;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ForumNotFoundException;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;

/**
 * @author mtong
 *         <p/>
 *         Provides logic to work with an announcement after an admin decides to create a new announcement, or edit
 *         an existing announcement.
 */
public class PostAnnounce extends ForumsProcessor {

    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        AnnouncementManager announcementManager = forumFactory.getAnnouncementManager();

        String postMode = getRequest().getParameter(ForumConstants.POST_MODE);
        String categoryIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.CATEGORY_ID));
        String forumIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.FORUM_ID));
        String announcementIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.ANNOUNCEMENT_ID));

        long categoryID = -1;
        long forumID = -1;
        if (postMode.equals("New")) {
            categoryID = Long.parseLong(categoryIDStr);
            if (!forumIDStr.equals("")) {
                forumID = Long.parseLong(forumIDStr);
            }
        } else if (postMode.equals("Edit")) {
            long announcementID = Long.parseLong(announcementIDStr);
            com.jivesoftware.forum.Announcement announcement =
                    announcementManager.getAnnouncement(announcementID);
            if (announcement.getContainerObjectType() == JiveConstants.FORUM) {
                Forum forum = forumFactory.getForum(announcement.getContainerObjectID());
                forumID = forum.getID();
                categoryID = forum.getForumCategory().getID();
            } else if (announcement.getContainerObjectType() == JiveConstants.FORUM_CATEGORY) {
                categoryID = forumFactory.getForumCategory(announcement.getContainerObjectID()).getID();
            } else if (announcement.getContainerObjectType() == JiveConstants.SYSTEM) {
                categoryID = forumFactory.getRootForumCategory().getID();
            }
        }

        setDefault(ForumConstants.CATEGORY_ID, String.valueOf(categoryID));
        setDefault(ForumConstants.FORUM_ID, String.valueOf(forumID));
        setDefault(ForumConstants.ANNOUNCEMENT_ID, getRequest().getParameter(ForumConstants.ANNOUNCEMENT_ID));
        setDefault(ForumConstants.POST_MODE, postMode);

        if (!announcementIDStr.equals("")) {
            Announcement announcement = announcementManager.getAnnouncement(Long.parseLong(announcementIDStr));

            if (postMode.equals("Edit")) {
                setDefault(ForumConstants.ANNOUNCEMENT_SUBJECT, announcement.getUnfilteredSubject());
                setDefault(ForumConstants.ANNOUNCEMENT_BODY, announcement.getUnfilteredBody());
            }
            getRequest().setAttribute("announcement", announcement);
        }

        ForumCategory category = forumFactory.getForumCategory(categoryID);
        getRequest().setAttribute("category", category);
        try {
            Forum forum = forumFactory.getForum(forumID);
            if (!ForumsUtil.canAnnounce(forum)) {
                setNextPage(getSessionInfo().getServletPath() + "?module=Main");
                setIsNextPageInContext(false);
                return;
            }
            getRequest().setAttribute("forum", forum);
        } catch (ForumNotFoundException e) {
        }

        getRequest().setAttribute("postMode", postMode);

        setNextPage("/postAnnounce.jsp");
        setIsNextPageInContext(true);
    }
}