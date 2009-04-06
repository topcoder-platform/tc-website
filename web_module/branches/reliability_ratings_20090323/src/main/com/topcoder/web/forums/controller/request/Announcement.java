/*
 * Created on Jan 30, 2006
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.AnnouncementManager;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumCategory;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

import java.util.Calendar;
import java.util.TimeZone;


/**
 * @author mtong
 *         <p/>
 *         Processor providing data for an announcement.
 */
public class Announcement extends ForumsProcessor {
    protected void businessProcessing() throws Exception {
        super.businessProcessing();

        AnnouncementManager announcementManager = forumFactory.getAnnouncementManager();

        long announcementID = Long.parseLong(getRequest().getParameter(ForumConstants.ANNOUNCEMENT_ID));
        com.jivesoftware.forum.Announcement announcement =
                announcementManager.getAnnouncement(announcementID);
        ForumCategory forumCategory = null;
        Forum forum = null;
        if (announcement.getContainerObjectType() == JiveConstants.FORUM) {
            forum = forumFactory.getForum(announcement.getContainerObjectID());
            forumCategory = forum.getForumCategory();
        } else if (announcement.getContainerObjectType() == JiveConstants.FORUM_CATEGORY) {
            forumCategory = forumFactory.getForumCategory(announcement.getContainerObjectID());
        } else if (announcement.getContainerObjectType() == JiveConstants.SYSTEM) {
            forumCategory = forumFactory.getRootForumCategory();
        }

        String annCmd = StringUtils.checkNull(getRequest().getParameter(ForumConstants.ANNOUNCEMENT_COMMAND));
        if (annCmd.equals("Expire")) {
            Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("EST"));
            announcement.setEndDate(cal.getTime());
        } else if (annCmd.equals("Activate")) {
            announcement.setEndDate(null);
        } else if (annCmd.equals("Delete")) {
            announcementManager.deleteAnnouncement(announcement);
            StringBuffer urlNext = new StringBuffer(getSessionInfo().getServletPath());
            if (forum != null) {
                urlNext.append("?module=ThreadList&forumID=").append(forum.getID()).
                        append("&mc=").append(forum.getMessageCount());
            } else if (forumCategory != null) {
                urlNext.append("?module=Category&categoryID=").append(forumCategory.getID());
            } else {
                urlNext.append("?module=Main");
            }
            setNextPage(urlNext.toString());
            setIsNextPageInContext(false);
            return;
        }

        getRequest().setAttribute("forumCategory", forumCategory);
        getRequest().setAttribute("forum", forum);
        getRequest().setAttribute("announcement", announcement);

        setNextPage("/announcement.jsp");
        setIsNextPageInContext(true);
    }
}