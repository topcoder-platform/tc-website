/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.base.User;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Paginator;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.model.Paging;

import java.util.Iterator;

/**
 * @author mtong
 *
 * Processor providing data related to a user's forum post history.
 */
public class History extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        String userIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.USER_ID));
        long userID = -1;
        if (userIDStr.equals("")) { // return history for user currently logged in
            userID = user.getID();
        } else {
            userID = Long.parseLong(userIDStr);
        }
        User historyUser = forumFactory.getUserManager().getUser(userID);
        int startIdx = 0;
        if (getRequest().getParameter(ForumConstants.START_IDX) != null) {
            startIdx = Integer.parseInt(getRequest().getParameter(ForumConstants.START_IDX));
        }

        int range = ForumConstants.DEFAULT_HISTORY_RANGE;
        if (user != null) {
            try {
                range = Integer.parseInt(user.getProperty("jiveHistoryRange"));
            } catch (Exception ignored) {}
        }

        ResultFilter resultFilter = ResultFilter.createDefaultMessageFilter();
        resultFilter.setSortField(JiveConstants.MODIFICATION_DATE);
        resultFilter.setSortOrder(ResultFilter.DESCENDING);
        resultFilter.setStartIndex(startIdx);
        resultFilter.setNumResults(range);
        int totalItemCount = forumFactory.getUserMessageCount(historyUser, resultFilter);

        Paging paging = new Paging(resultFilter, totalItemCount);
        Paginator paginator = new Paginator(paging);
        Iterator itMessages = forumFactory.getUserMessages(historyUser, resultFilter);

        getRequest().setAttribute("forumFactory", forumFactory);
        getRequest().setAttribute("historyUser", historyUser);
        getRequest().setAttribute("messages", itMessages);
        getRequest().setAttribute("paginator", paginator);

		setNextPage("/postHistory.jsp");
		setIsNextPageInContext(true);
	}
}