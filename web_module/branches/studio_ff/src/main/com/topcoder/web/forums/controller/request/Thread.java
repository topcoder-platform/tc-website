/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.ReadTracker;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Paginator;
import com.jivesoftware.forum.stats.ViewCountManager;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.forums.Forums;
import com.topcoder.web.ejb.forums.ForumsLocal;
import com.topcoder.web.ejb.messagehistory.MessageHistory;
import com.topcoder.web.ejb.messagehistory.MessageHistoryLocal;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;
import com.topcoder.web.forums.model.Paging;

import java.util.Iterator;

/**
 * @author mtong
 *         <p/>
 *         Processor containing logic to display the appropriate view of a thread (flat/hierarchical,
 *         paginated, etc.), depending on the user's preferences.
 */
public class Thread extends ForumsProcessor {

    protected void businessProcessing() throws Exception {
        super.businessProcessing();

        String error = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_ERROR));
        if (error.equals(ForumConstants.WATCH_THREAD)) {
            addError(ForumConstants.WATCH_THREAD, ForumConstants.ERR_THREAD_WATCHES_EXCEEDED);
        }

        long threadID = Long.parseLong(getRequest().getParameter(ForumConstants.THREAD_ID));
        ForumThread thread;
        try {
            thread = forumFactory.getForumThread(threadID);
        } catch (UnauthorizedException ue) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        ViewCountManager.getInstance().addThreadCount(thread);
        Forum forum = thread.getForum();

        int startIdx = 0;
        if ((!StringUtils.checkNull(getRequest().getParameter(ForumConstants.START_IDX)).equals(""))) {
            startIdx = Integer.parseInt(getRequest().getParameter(ForumConstants.START_IDX));
        }
        int messageRange = JiveGlobals.getJiveIntProperty("skin.default.defaultMessagesPerPage",
                ForumConstants.DEFAULT_MESSAGE_RANGE);
        if (user != null) {
            try {
                messageRange = Integer.parseInt(user.getProperty("jiveMessageRange"));
            } catch (Exception ignored) {
            }
        }

        ResultFilter resultFilter = ResultFilter.createDefaultMessageFilter();
        resultFilter.setStartIndex(startIdx);
        resultFilter.setNumResults(messageRange);
        int totalItemCount = thread.getMessageCount(resultFilter);

        Paging paging = new Paging(resultFilter, totalItemCount);
        Paginator paginator = new Paginator(paging);
        Iterator itMessages = null;

        MessageHistoryLocal historyBean = (MessageHistoryLocal) createLocalEJB(getInitialContext(), MessageHistory.class);
        getRequest().setAttribute("editCountTable", historyBean.getMessageEditCounts(thread.getID(), DBMS.FORUMS_DATASOURCE_NAME));

        getRequest().setAttribute("forum", forum);
        getRequest().setAttribute("thread", thread);
        getRequest().setAttribute("paginator", paginator);

        if (ForumsUtil.isSoftwareSubcategory(forum.getForumCategory())) {
            ForumsLocal forumsBean = (ForumsLocal) createLocalEJB(getInitialContext(), Forums.class);
            getRequest().setAttribute("showComponentLink",
                    String.valueOf(ForumsUtil.showComponentLink(forumsBean, forum.getForumCategory())));
            getRequest().setAttribute("imageData", ForumsUtil.getImageData(forumsBean, forum.getForumCategory()));
        }

        ReadTracker readTracker = forumFactory.getReadTracker();
        if (user != null && !authToken.isAnonymous()) {
            getRequest().setAttribute("lastReadDate", ForumsUtil.getLastReadDate(user, readTracker, thread));
            readTracker.markRead(user, thread.getLatestMessage());
        }

        // Previous/next links
        ResultFilter filter = ResultFilter.createDefaultThreadFilter();
        filter.setNumResults(2);
        filter.setSortOrder(ResultFilter.ASCENDING);
        filter.setModificationDateRangeMin(thread.getModificationDate());
        Iterator threads = forum.getThreads(filter);
        threads.next();
        if (threads.hasNext()) {
            getRequest().setAttribute("prevThread", (ForumThread) threads.next());
        }

        filter = ResultFilter.createDefaultThreadFilter();
        filter.setNumResults(2);
        filter.setSortOrder(ResultFilter.DESCENDING);
        filter.setModificationDateRangeMax(thread.getModificationDate());
        threads = forum.getThreads(filter);
        threads.next();
        if (threads.hasNext()) {
            getRequest().setAttribute("nextThread", (ForumThread) threads.next());
        }

        // Use the setting chosen on the page if selected, or the user's default
        // preference otherwise.
        String threadView = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_VIEW));
        if (isSelectedView(threadView, "flat")) {
            itMessages = thread.getMessages(resultFilter);
            setNextPage("/viewThreadFlat.jsp");
        } else if (isSelectedView(threadView, "flat_new")) {
            resultFilter.setSortOrder(ResultFilter.DESCENDING);
            itMessages = thread.getMessages(resultFilter);
            setNextPage("/viewThreadFlat.jsp");
        } else if (isSelectedView(threadView, "threaded")) {
            itMessages = thread.getTreeWalker().getRecursiveMessages();
            setNextPage("/viewThreadThreaded.jsp");
        } else if (isSelectedView(threadView, "tree")) {
            String messageID = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
            if (!messageID.equals("")) {
                getRequest().setAttribute("activeMessage", thread.getMessage(Long.parseLong(messageID)));
            } else {
                getRequest().setAttribute("activeMessage", thread.getRootMessage());
            }
            itMessages = thread.getTreeWalker().getRecursiveMessages();
            setNextPage("/viewThreadTree.jsp");
        } else {
            itMessages = thread.getMessages(resultFilter);
            setNextPage("/viewThreadFlat.jsp");
        }

        getRequest().setAttribute("resultFilter", resultFilter);
        getRequest().setAttribute("messages", itMessages);
        setIsNextPageInContext(true);
    }

    private boolean isSelectedView(String threadView, String view) {
        return (threadView.equals(view) ||
                (threadView.equals("") && (authToken.isAnonymous() || user.getProperty("jiveThreadMode") == null) && ForumConstants.DEFAULT_GUEST_THREAD_VIEW.equals(view)) ||
                (threadView.equals("") && user.getProperty("jiveThreadMode").equals(view)));
    }
}