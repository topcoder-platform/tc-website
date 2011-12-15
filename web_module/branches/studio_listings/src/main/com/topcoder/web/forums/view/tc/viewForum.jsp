<%@ page import="com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.base.JiveGlobals,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.action.util.Page,
                 com.jivesoftware.forum.action.util.Paginator,
                 com.jivesoftware.forum.stats.ViewCountManager,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.ForumConstants"
        %>
<%@ page import="com.topcoder.web.forums.controller.ForumsUtil" %>
<%@ page import="com.topcoder.web.forums.model.ImageData" %>
<%@ page import="com.topcoder.web.forums.model.Paging" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.jivesoftware.forum.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>

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

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>TopCoder Forums</title>
    <jsp:include page="script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_forums"/>
    </jsp:include>

</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="forums"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="includes/global_left.jsp">
        <jsp:param name="node" value="forums"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" class="rtBody">

<jsp:include page="page_title.jsp">
    <jsp:param name="image" value="forums"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable" border="0">
    <tr valign="top">
        <td class="categoriesBox" style="padding-right: 20px;">
            <jsp:include page="categoriesHeader.jsp"/>
        </td>
        <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
            <jsp:include page="searchHeader.jsp"/>
            <%  if (ForumsUtil.isSoftwareSubcategory(forum.getForumCategory())) { %>
            	<%	ImageData imageData = (ImageData)request.getAttribute("imageData"); %>
        		<%	if (!"".equals(StringUtils.checkNull(imageData.getPhaseIcon()))) { %>
            		<img align="middle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/i/<%=imageData.getPhaseIcon()%>" alt="<%=imageData.getPhaseText()%>" width="25" height="17" border="0">
				<%	} %>
				<%	if (!"".equals(StringUtils.checkNull(imageData.getTechnologyIcon()))) { %>
					<img align="middle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/i/<%=imageData.getTechnologyIcon()%>" alt="<%=imageData.getTechnologyText()%>" border="0"/>
				<%	} %>
    		<%	} %>
        </td>
        <td align="right" nowrap="nowrap" valign="top">
            <% if (ForumsUtil.canAnnounce(forum)) { %>
            <A href="?module=PostAnnounce&<%=ForumConstants.POST_MODE%>=New&<%=ForumConstants.CATEGORY_ID%>=<%=forum.getForumCategory().getID()%>&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>" class="rtbcLink">Post
                Announcement</A>&#160; |&#160;
            <% } %>
            <A href="?module=Watch&<%=ForumConstants.WATCH_TYPE%>=<%=JiveConstants.FORUM%>&<%=ForumConstants.WATCH_ID%>=<%=forum.getID()%>&<%=ForumConstants.WATCH_COMMAND%>=<%=cmd%>" class="rtbcLink"><%=watchMessage%></A>&#160;&#160;|&#160;&#160;
            <A href="?module=Post&<%=ForumConstants.POST_MODE%>=New&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>" class="rtbcLink">Post
                New Thread</A>&#160;&#160;|&#160;&#160;<A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My
            Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br>
        </td>
    </tr>
    <tr>
    <tr>
    	<%	int colspan = (paginator.getNumPages () > 1) ? 2 : 3; %>
    	<td colspan="<%=colspan%>" style="padding-bottom:3px;"><b>
	        <%	boolean showComponentLink = "true".equals((String)request.getAttribute("showComponentLink"));
	        	Iterator itCategories = ForumsUtil.getCategoryTree(forum.getForumCategory());
	        	while (itCategories.hasNext()) {
	        		ForumCategory category = (ForumCategory)itCategories.next(); %>
			        <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A>
			<%      
					if (!itCategories.hasNext() && showComponentLink) { %>
			        	(<a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=forum.getForumCategory().getProperty(ForumConstants.PROPERTY_COMPONENT_ID)%>" class="rtbcLink">Component</a>)
				<%	} %>
				<img src="/i/interface/exp_w.gif" align="absmiddle"/>
	        <%	} %>
	        <%=forum.getName()%>
	        <%	String linkStr = ForumsUtil.createLinkString(forum);
	            if (!linkStr.equals("()")) { %><%=linkStr%><% } %>
    	</td>
        <% Page[] pages; %>
        <% if (paginator.getNumPages() > 1) { %>
        <td class="rtbc" align="right" style="padding-bottom:3px;"><b>
            <% if (paginator.getPreviousPage()) { %>
            <A href="<%=link%>&<%=ForumConstants.START_IDX%>=<%=paginator.getPreviousPageStart()%>" class="rtbcLink">
                << PREV</A>&#160;&#160;&#160;
            <% } %> [
            <% pages = paginator.getPages(5);
                for (int i = 0; i < pages.length; i++) {
            %>  <% if (pages[i] != null) { %>
            <% if (pages[i].getNumber() == paginator.getPageIndex() + 1) { %>
            <span class="currentPage"><%= pages[i].getNumber() %></span>
            <% } else { %>
            <A href="<%=link%>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtbcLink">
                <%= pages[i].getNumber() %></A>
            <% } %>
            <% } else { %> ... <% } %>
            <% } %> ]
            <% if (paginator.getNextPage()) { %>
            &#160;&#160;&#160;<A href="<%=link%>&<%=ForumConstants.START_IDX%>=<%=paginator.getNextPageStart()%>" class="rtbcLink">NEXT
            ></A>
            <% } %>
        </b></td></tr>
    <% } %>
</table>

<% if (forum.getThreadCount() > 0 || ((Iterator) request.getAttribute("announcements")).hasNext()) { %>
<table cellpadding="0" cellspacing="0" class="rtTable" style="margin-bottom:6px;">
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
                    <A href="?module=Announcement&<%=ForumConstants.ANNOUNCEMENT_ID%>=<%=announcement.getID()%>" class="rtLinkBold"><img src="/i/interface/announcement.gif" alt="" border="0"/> <%=announcement.getSubject()%>
                    </A></div>
            </td>
            <td class="rtThreadCell"><tc-webtag:handle coderId="<%=announcement.getUser().getID()%>"/></td>
            <td class="rtThreadCell">&nbsp;</td>
            <td class="rtThreadCell">&nbsp;</td>
            <td class="rtThreadCell">
                <b><A href="?module=Announcement&<%=ForumConstants.ANNOUNCEMENT_ID%>=<%=announcement.getID()%>" class="rtLinkNew">
                    <tc-webtag:format object="${announcement.startDate}" format="EEE, MMM d yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></A></b>
            </td>
            <td class="rtThreadCell"><tc-webtag:handle coderId="<%=announcement.getUser().getID()%>"/></td>
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
                <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=0" class="<%=trackerClass%>"><%=thread.getRootMessage().getSubject()%></A>
                <% } else { %>
                <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=thread.getMessageCount()%>" class="rtLinkNew"><%=thread.getRootMessage().getSubject()%></A>
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
                <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtLinkOld">
                    <%= pages[i].getNumber() %></A>
                <% } %>
                <% } %>
                <% if (threadPaginator.getNumPages() > 4) { %>
                <% if (threadPaginator.getNumPages() - 4 > 1) { %> ... <% } %>
                <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&<%=ForumConstants.START_IDX%>=<%=(threadPaginator.getNumPages()-1)*threadPaginator.getRange()%>" class="rtLinkOld">
                    <%= threadPaginator.getNumPages() %></A>
                <% } %> ]
                <% } %>
                <% } else { %>
                <% if (!authToken.isAnonymous()) { %>
                <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>" class="<%=trackerClass%>"><%=thread.getRootMessage().getSubject()%></A>
                <% } else { %>
                <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>" class="rtLinkNew"><%=thread.getRootMessage().getSubject()%></A>
                <% } %>
                <% } %></td>
            <% if (thread.getRootMessage().getUser() != null) { %>
            <td class="rtThreadCell"><tc-webtag:handle coderId="<%=thread.getRootMessage().getUser().getID()%>"/></td>
            <% } else { %>
            <td class="rtThreadCell">&nbsp;</td>
            <% } %>
            <td class="rtThreadCell" align="right"><%=thread.getMessageCount() - 1%></td>
            <td class="rtThreadCell" align="right"><%=ViewCountManager.getInstance().getThreadCount(thread)%></td>
            <td class="rtThreadCell">
                <b><A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=lastPost.getID()%>" class="rtLinkNew">
                    <tc-webtag:format object="${thread.modificationDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></A></b>
            </td>
            <% if (lastPost.getUser() != null) { %>
            <td class="rtThreadCell"><tc-webtag:handle coderId="<%=lastPost.getUser().getID()%>"/></td>
            <% } else { %>
            <td class="rtThreadCell">&nbsp;</td>
            <% } %>
        </tr>
    </tc-webtag:iterator>
</table>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
        <td>A thread with a <b>bold title</b> indicates it is either a new thread or has new
            postings. <%if (user != null) {%><A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&<%=ForumConstants.MARK_READ%>=t" class="rtbcLink">(Mark
            all as read)</A><%}%></td>
        <td align="right">
            <a href="?module=RSS&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>"><img alt="RSS" border="none" src="/i/interface/btn_rss.gif"/></a>
        </td>
    </tr>
</table>
<% } else { %>
<span class="bigRed"><A href="?module=Post&<%=ForumConstants.POST_MODE%>=New&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>" class="bigRed">Be
    the first to post in this forum!</A></span>
<% } %>

<div style="clear:both;">&nbsp;</div>

</td>
<!-- Center Column Ends -->

</tr>
</table>

<jsp:include page="foot.jsp"/>

</body>

</html>