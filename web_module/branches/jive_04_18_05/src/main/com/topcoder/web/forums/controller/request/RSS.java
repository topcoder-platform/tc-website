/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;

import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.base.action.rss.RSSActionSupport;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author mtong
 * 
 * Provides the root list of forums.
 */
public class RSS extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
        ResultFilter filter = new ResultFilter();
        filter.setNumResults(RSSActionSupport.DEFAULT_NUM_ITEMS);
        filter.setSortField(JiveConstants.MODIFICATION_DATE);
        filter.setSortOrder(ResultFilter.DESCENDING);
        
        String categoryID = StringUtils.checkNull(getRequest().getParameter(ForumConstants.CATEGORY_ID));
        String forumID = StringUtils.checkNull(getRequest().getParameter(ForumConstants.FORUM_ID));
        String threadID = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_ID));
        
        Iterator messages = null;
        if (!threadID.equals("")) {
            ForumThread thread = forumFactory.getForumThread(Long.parseLong(threadID));
            messages = thread.getMessages(filter);
        }
        else if (!forumID.equals("")) {
            Forum forum = forumFactory.getForum(Long.parseLong(forumID));
            messages = forum.getMessages(filter);
        }
        else if (!categoryID.equals("")) {
            ForumCategory category = forumFactory.getForumCategory(Long.parseLong(categoryID));
            messages = category.getMessages(filter);
        }

		getRequest().setAttribute("messages", messages);
		
		setNextPage("/rss.jsp");
		setIsNextPageInContext(true);
	}
}