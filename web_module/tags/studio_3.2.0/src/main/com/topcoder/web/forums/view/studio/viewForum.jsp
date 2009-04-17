<%@ page import="com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.base.JiveGlobals,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.ForumMessage,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.WatchManager,
                 com.jivesoftware.forum.action.util.Page,
                 com.jivesoftware.forum.action.util.Paginator,
                 com.jivesoftware.forum.stats.ViewCountManager,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 com.topcoder.web.forums.model.Paging,
                 java.util.Iterator"
        %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="authToken" name="authToken" type="com.jivesoftware.base.AuthToken" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<% WatchManager watchManager = forumFactory.getWatchManager();
    ReadTracker readTracker = forumFactory.getReadTracker();
    User user = (User) request.getAttribute("user");
    String sortField = (String) request.getAttribute("sortField");
    String sortOrder = (String) request.getAttribute("sortOrder");
    String startIdx = (String) request.getAttribute("startIdx");
    boolean isDefaultView = (sortField.equals(String.valueOf(JiveConstants.MODIFICATION_DATE))
            && sortOrder.equals(String.valueOf(ResultFilter.DESCENDING))
            && startIdx.equals("0"));

    StringBuffer linkBuffer = new StringBuffer("?module=ThreadList");
    linkBuffer.append("&").append(ForumConstants.FORUM_ID).append("=").append(forum.getID());

    StringBuffer threadLinkBuffer = new StringBuffer(linkBuffer.toString());
    StringBuffer dateLinkBuffer = new StringBuffer(linkBuffer.toString());
    threadLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.THREAD_NAME);
    dateLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.MODIFICATION_DATE);
    if (sortField.equals(String.valueOf(JiveConstants.THREAD_NAME))) {
        if (sortOrder.equals(String.valueOf(ResultFilter.ASCENDING))) {
            threadLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        } else if (sortOrder.equals(String.valueOf(ResultFilter.DESCENDING))) {
            threadLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        } else {  // default
            threadLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        }
    } else {  // default
        threadLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
    }
    if (sortField.equals(String.valueOf(JiveConstants.MODIFICATION_DATE))) {
        if (sortOrder.equals(String.valueOf(ResultFilter.ASCENDING))) {
            dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        } else if (sortOrder.equals(String.valueOf(ResultFilter.DESCENDING))) {
            dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        } else {  // default
            dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        }
    } else {  // default
        dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
    }
    String threadLink = threadLinkBuffer.toString();
    String dateLink = dateLinkBuffer.toString();

    if (!sortField.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(sortField);
    }
    if (!sortOrder.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(sortOrder);
    }
    String link = linkBuffer.toString();

    String cmd = "";
    String watchMessage = "";
    if (!authToken.isAnonymous() && watchManager.isWatched(user, forum)) {
       watchMessage = "Stop Watching Forum";
       cmd = "remove";
    } else {
       watchMessage = "Watch Forum";
       cmd = "add";
    }
%>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_forums"/>
    </jsp:include>
	
	<script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
	<script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
			$(document).ready(function(){
				//Run the script to preload images from CSS
				$.preloadCssImages(); 
			});
	</script>
	<script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
	<script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript">

	$(document).ready(function(){
	
	
		$("#nav ul li").hoverIntent(function(){
			$(this).children("ul").slideDown("fast");
		}, function() {
			$(this).children("ul").slideUp("fast");
		});
		
		$("#nav ul ul li").hover(function() {
			$(this).parents("#nav ul li").children('a').addClass("active-item");
		}, function() {
			$(this).parents("#nav ul li").children('a').removeClass("active-item");
		});
	
	
	});
	</script>
</head>

<body>
	<div id="page-wrap">
    	<div align="center">
			<jsp:include page="top.jsp">
            <jsp:param name="section" value="forums" />
        </jsp:include>
        <br />
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="wrapper">
            	<div id="content">
                	<div class="contentTop">
                	<h1>Forums</h1>
                	<div class="contentMiddle forums">

<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
        <td class="categoriesBox" style="padding-right: 20px;">
            <jsp:include page="categoriesHeader.jsp"/>
        </td>
        <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
            <jsp:include page="searchHeader.jsp"/>
        </td>
        <td align="right" nowrap="nowrap" valign="top">
            <a href="?module=History" class="rtbcLink">My Post History</a> | <a href="?module=Watches" class="rtbcLink">My
            Watches</a> | <a href="?module=Settings" class="rtbcLink">User Settings</a><br />
            <% if (ForumsUtil.canAnnounce(forum)) { %>
            <a href="?module=PostAnnounce&<%=ForumConstants.POST_MODE%>=New&<%=ForumConstants.CATEGORY_ID%>=<%=forum.getForumCategory().getID()%>&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>" class="rtbcLink">Post
                Announcement</a> |
            <% } %>
            <a href="?module=Post&<%=ForumConstants.POST_MODE%>=New&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>" class="rtbcLink">Post
                New Thread</a><br />
            <A href="?module=Watch&<%=ForumConstants.WATCH_TYPE%>=<%=JiveConstants.FORUM%>&<%=ForumConstants.WATCH_ID%>=<%=forum.getID()%>&<%=ForumConstants.WATCH_COMMAND%>=<%=cmd%>" class="rtbcLink"><%=watchMessage%></A><br />
        </td>
    </tr>
    <tr><td colspan="3" style="padding:15px 0 3px 0;"><b>
        <% Page[] pages; %>
        <% if (paginator.getNumPages() > 1) { %>
        <div style="float:right;" class="rtbc"><b>
            <% if (paginator.getPreviousPage()) { %>
            <a href="<%=link%>&<%=ForumConstants.START_IDX%>=${paginator.previousPageStart}" class="rtbcLink">
                << PREV</a>&#160;&#160;&#160;
            <% } %> [
            <% pages = paginator.getPages(5);
                for (int i = 0; i < pages.length; i++) {
            %>  <% if (pages[i] != null) { %>
            <% if (pages[i].getNumber() == paginator.getPageIndex() + 1) { %>
            <span class="currentPage"><%= pages[i].getNumber() %></span>
            <% } else { %>
            <a href="<%=link%>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtbcLink">
                <%= pages[i].getNumber() %></a>
            <% } %>
            <% } else { %> ... <% } %>
            <% } %> ]
            <% if (paginator.getNextPage()) { %>
            &#160;&#160;&#160;<a href="<%=link%>&<%=ForumConstants.START_IDX%>=${paginator.nextPageStart}" class="rtbcLink">NEXT
            ></a>
            <% } %>
        </b>
        </div>
        <% } %>
        <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory"
                            iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
        <a href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink">
            <%=category.getName()%>
        </a> >
        </tc-webtag:iterator>
        <%=forum.getName()%>
        <%

        String linkStr = ForumsUtil.createLinkString(forum);
                  if (!linkStr.equals("")) {

        %>
        <%=linkStr%>
        <% 	} %>
    </td>
</table>

<% if (forum.getThreadCount() > 0 || ((Iterator) request.getAttribute("announcements")).hasNext()) { %>
<table cellpadding="0" cellspacing="0" class="rtTable">
    <tr>
        <td class="rtHeader" width="70%"><a href="<%=threadLink%>" class="rtbcLink">Thread</a></td>
        <td class="rtHeader" width="10%">Author</td>
        <td class="rtHeader" width="10%" align="right">Replies</td>
        <td class="rtHeader" width="10%" align="right">Views</td>
        <td class="rtHeader" align="center" colspan="2"><a href="<%=dateLink%>" class="rtbcLink">Last Post</a></td>
    </tr>
    <% if (startIdx.equals("0")) { %>
    <tc-webtag:iterator id="announcement" type="com.jivesoftware.forum.Announcement" iterator='<%=(Iterator)request.getAttribute("announcements")%>'>
        <tr>
            <td class="rtThreadCellWrap">
                <div>
                    <a href="?module=Announcement&<%=ForumConstants.ANNOUNCEMENT_ID%>=<%=announcement.getID()%>" class="rtLinkBold"><img src="/i/v2/interface/btnAnnouncement.png" alt="" border="0"/> <%=announcement.getSubject()%>
                    </a></div>
            </td>
            <td class="rtThreadCell"><studio:handle coderId="<%=announcement.getUser().getID()%>"/></td>
            <td class="rtThreadCell">&nbsp;</td>
            <td class="rtThreadCell">&nbsp;</td>
            <td class="rtThreadCell">
                <b><a href="?module=Announcement&<%=ForumConstants.ANNOUNCEMENT_ID%>=<%=announcement.getID()%>" class="rtLinkNew">
                    <tc-webtag:format object="${announcement.startDate}" format="EEE, MMM d yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></a></b>
            </td>
            <td class="rtThreadCell"><studio:handle coderId="<%=announcement.getUser().getID()%>"/></td>
        </tr>
    </tc-webtag:iterator>
    <% } %>
    <tc-webtag:iterator id="thread" type="com.jivesoftware.forum.ForumThread" iterator='<%=(Iterator)request.getAttribute("threads")%>'>
        <% ForumMessage lastPost = ForumsUtil.getLatestMessage(thread);
            String trackerClass = (user == null || readTracker.getReadStatus(user, lastPost) == ReadTracker.READ ||
                    ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, thread))) ? "rtLinkOld" : "rtLinkBold"; %>
        <tr>
            <tc-webtag:useBean id="message" name="thread" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
            <td class="rtThreadCellWrap">
                <% if (((authToken.isAnonymous() || user.getProperty("jiveThreadMode") == null) && ForumConstants.DEFAULT_GUEST_THREAD_VIEW.equals("flat")) || user.getProperty("jiveThreadMode").equals("flat")) { %>
                <% if (!authToken.isAnonymous()) { %>
                <a href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=0" class="<%=trackerClass%>"><%=thread.getRootMessage().getSubject()%></a>
                <% } else { %>
                <a href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=thread.getMessageCount()%>" class="rtLinkNew"><%=thread.getRootMessage().getSubject()%></a>
                <% } %>
                <% Paginator threadPaginator;
                    ResultFilter resultFilter = ResultFilter.createDefaultMessageFilter();
                    resultFilter.setStartIndex(0);
                    int range = JiveGlobals.getJiveIntProperty("skin.default.defaultMessagesPerPage",
                            ForumConstants.DEFAULT_MESSAGE_RANGE);
                    if (user != null) {
                        try {
                            range = Integer.parseInt(user.getProperty("jiveMessageRange"));
                        } catch (Exception ignored) {
                        }
                    }
                    resultFilter.setNumResults(range);
                    threadPaginator = new Paginator(new Paging(resultFilter, thread.getMessageCount()));

                    if (threadPaginator.getNumPages() > 1) { %> [
                <% pages = threadPaginator.getPages(4);
                    for (int i = 0; i < pages.length; i++) {
                %>  <% if (pages[i] != null) { %>
                <a href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtLinkOld">
                    <%= pages[i].getNumber() %></a>
                <% } %>
                <% } %>
                <% if (threadPaginator.getNumPages() > 4) { %>
                <% if (threadPaginator.getNumPages() - 4 > 1) { %> ... <% } %>
                <a href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=<%=(threadPaginator.getNumPages()-1)*threadPaginator.getRange()%>" class="rtLinkOld">
                    <%= threadPaginator.getNumPages() %></a>
                <% } %> ]
                <% } %>
                <% } else { %>
                <% if (!authToken.isAnonymous()) { %>
                <a href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>" class="<%=trackerClass%>"><%=thread.getRootMessage().getSubject()%></a>
                <% } else { %>
                <a href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>" class="rtLinkNew"><%=thread.getRootMessage().getSubject()%></a>
                <% } %>
                <% } %></td>
            <% if (thread.getRootMessage().getUser() != null) { %>
            <td class="rtThreadCell"><studio:handle coderId="<%=thread.getRootMessage().getUser().getID()%>"/></td>
            <% } else { %>
            <td class="rtThreadCell">&nbsp;</td>
            <% } %>
            <td class="rtThreadCell" align="right"><%=thread.getMessageCount() - 1%></td>
            <td class="rtThreadCell" align="right"><%=ViewCountManager.getInstance().getThreadCount(thread)%></td>
            <td class="rtThreadCell">
                <b><a href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=lastPost.getID()%>" class="rtLinkNew">
                    <tc-webtag:format object="${thread.modificationDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></a></b>
            </td>
            <% if (lastPost.getUser() != null) { %>
            <td class="rtThreadCell"><studio:handle coderId="<%=lastPost.getUser().getID()%>"/></td>
            <% } else { %>
            <td class="rtThreadCell">&nbsp;</td>
            <% } %>
        </tr>
    </tc-webtag:iterator>
</table>

<div>
    <div style="float:right;">
        <a href="?module=RSS&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>"><img alt="RSS" border="none" src="/i/v2/interface/btnRSS.png"/></a>
    </div>
    <span class="small">A forum with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings. <%if (user != null) {%><a href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&<%=ForumConstants.MARK_READ%>=t" class="rtbcLink">(Mark
        all as read)</a><% } %></span>
</div>
<% } else { %>
<span class="bigRed"><a href="?module=Post&<%=ForumConstants.POST_MODE%>=New&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>" class="bigRed">Be
    the first to post in this forum!</a></span>
<% } %>




                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>


        <jsp:include page="foot.jsp"/>


</body>
</html>