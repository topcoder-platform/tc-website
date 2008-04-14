/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.forum.AnnouncementManager;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumThreadIterator;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Paginator;
import com.jivesoftware.forum.stats.ViewCountManager;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.forums.Forums;
import com.topcoder.web.ejb.forums.ForumsLocal;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;
import com.topcoder.web.forums.model.Paging;

import java.util.Iterator;

/**
 * @author mtong
 *         <p/>
 *         Processor for viewing a forum (list of threads).
 */
public class ThreadList extends ForumsProcessor {
    protected void businessProcessing() throws Exception {
        super.businessProcessing();

        long forumID = Long.parseLong(getRequest().getParameter(ForumConstants.FORUM_ID));
        Forum forum;
        try {
            forum = forumFactory.getForum(forumID);
        } catch (UnauthorizedException ue) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        ViewCountManager.getInstance().addForumCount(forum);

        int startIdx = 0;
        if ((!StringUtils.checkNull(getRequest().getParameter(ForumConstants.START_IDX)).equals(""))) {
            startIdx = Integer.parseInt(getRequest().getParameter(ForumConstants.START_IDX));
        }
        int threadRange = JiveGlobals.getJiveIntProperty("skin.default.defaultThreadsPerPage",
                ForumConstants.DEFAULT_THREAD_RANGE);
        if (user != null) {
            try {
                threadRange = Integer.parseInt(user.getProperty("jiveThreadRange"));
            } catch (Exception ignored) {
            }
        }

        String sortField = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SORT_FIELD));
        String sortOrder = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SORT_ORDER));
        if (sortField.equals("")) {
            sortField = String.valueOf(JiveConstants.MODIFICATION_DATE);
        }
        if (sortOrder.equals("")) {
            sortOrder = String.valueOf(ResultFilter.DESCENDING);
        }

        String markRead = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MARK_READ));
        if (markRead.equals("t")) {
            forumFactory.getReadTracker().markRead(user, forum);
            super.setUnreadCategories();
        }

        ResultFilter resultFilter = ResultFilter.createDefaultThreadFilter();
        resultFilter.setSortField(Integer.parseInt(sortField));
        resultFilter.setSortOrder(Integer.parseInt(sortOrder));
        resultFilter.setStartIndex(startIdx);
        resultFilter.setNumResults(threadRange);
        int totalItemCount = forum.getThreadCount(resultFilter);

        Paging paging = new Paging(resultFilter, totalItemCount);
        Paginator paginator = new Paginator(paging);
        ForumThreadIterator itThreads = forum.getThreads(resultFilter);

        AnnouncementManager announcementManager = forumFactory.getAnnouncementManager();
        Iterator itAnnounce = announcementManager.getAnnouncements(forum);

        getRequest().setAttribute("forum", forum);
        getRequest().setAttribute("threads", itThreads);
        getRequest().setAttribute("paginator", paginator);
        getRequest().setAttribute("sortField", sortField);
        getRequest().setAttribute("sortOrder", sortOrder);
        getRequest().setAttribute("startIdx", String.valueOf(startIdx));
        getRequest().setAttribute("announcements", itAnnounce);

        if (ForumsUtil.isSoftwareSubcategory(forum.getForumCategory())) {
            ForumsLocal forumsBean = (ForumsLocal) createLocalEJB(getInitialContext(), Forums.class);
            getRequest().setAttribute("showComponentLink",
                    String.valueOf(ForumsUtil.showComponentLink(forumsBean, forum.getForumCategory())));
            getRequest().setAttribute("imageData", ForumsUtil.getImageData(forumsBean, forum.getForumCategory()));
        }

        if (markRead.equals("t")) {
            setNextPage(getSessionInfo().getServletPath()
                    + "?module=ThreadList&" + ForumConstants.FORUM_ID + "=" + forum.getID());
            setIsNextPageInContext(false);
        } else {
            setNextPage("/viewForum.jsp");
            setIsNextPageInContext(true);
        }
    }
}