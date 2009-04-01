<%@ page import="com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.WatchManager,
                 com.jivesoftware.forum.action.util.Page,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 java.util.Iterator"
        %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="csf.tld" prefix="csf" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forumCategory" name="forumCategory" type="com.jivesoftware.forum.ForumCategory" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<% User user = (User) request.getAttribute("user");
    ResultFilter resultFilter = (ResultFilter) request.getAttribute("resultFilter");
    ReadTracker readTracker = forumFactory.getReadTracker();
    WatchManager watchManager = forumFactory.getWatchManager();
    String trackerClass = "";
    String sortField = (String) request.getAttribute("sortField");
    String sortOrder = (String) request.getAttribute("sortOrder");

    StringBuffer linkBuffer = new StringBuffer("?module=Category");
    linkBuffer.append("&").append(ForumConstants.CATEGORY_ID).append("=").append(forumCategory.getID());

    StringBuffer forumLinkBuffer = new StringBuffer(linkBuffer.toString());
    StringBuffer dateLinkBuffer = new StringBuffer(linkBuffer.toString());
    forumLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.FORUM_NAME);
    dateLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.MODIFICATION_DATE);
    if (sortField.equals(String.valueOf(JiveConstants.FORUM_NAME))) {
        if (sortOrder.equals(String.valueOf(ResultFilter.ASCENDING))) {
            forumLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        } else if (sortOrder.equals(String.valueOf(ResultFilter.DESCENDING))) {
            forumLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        } else {  // default
            forumLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        }
    } else {  // default
        forumLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
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
    String forumLink = forumLinkBuffer.toString();
    String dateLink = dateLinkBuffer.toString();

    if (!sortField.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(sortField);
    }
    if (!sortOrder.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(sortOrder);
    }

    linkBuffer.append("&").append(ForumConstants.START_IDX).append("=");
    String link = linkBuffer.toString();
    String prevLink = linkBuffer.toString() + String.valueOf(paginator.getPreviousPageStart());
    String nextLink = linkBuffer.toString() + String.valueOf(paginator.getNextPageStart());
%>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csfforums"/>
    </jsp:include>
</head>

<body>

<div align="center">
<div id="content">

<jsp:include page="top.jsp"/>


<jsp:include page="primaryNav.jsp">
    <jsp:param name="selectedTab" value="discuss"/>
</jsp:include>

<div id="main">
<div class="pageHeader">
    <span class="pageName">Forums</span>
</div>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
        <td class="categoriesBox" style="padding-right: 20px;">
            <jsp:include page="categoriesHeader.jsp"/>
        </td>
        <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
            <jsp:include page="searchHeader.jsp"/>
        </td>
        <td align="right" valign="top" nowrap="nowrap">
            <A href="?module=History" class="rtbcLink">My Post
                History</A> |
            <A href="?module=Settings" class="rtbcLink">User
                Settings</A><br/>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="padding-bottom:3px;"><b>
            <% Page[] pages; %>
            <% if (paginator.getNumPages() > 1) { %>
            <div style="float:right;" class="rtbc"><b>
                <% if (paginator.getPreviousPage()) { %>
                <A href="<%=prevLink%>" class="rtbcLink">
                    << PREV</A>&#160;&#160;&#160;
                <% } %> [
                <% pages = paginator.getPages(5);
                    for (int i = 0; i < pages.length; i++) {
                %>  <% if (pages[i] != null) { %>
                <% if (pages[i].getNumber() == paginator.getPageIndex() + 1) { %>
                <span class="currentPage"><%= pages[i].getNumber() %></span>
                <% } else { %>
                <A href="<%=link%><%=pages[i].getStart()%>" class="rtbcLink">
                    <%= pages[i].getNumber() %>
                </A>
                <% } %>
                <% } else { %> ... <% } %>
                <% } %> ]
                <% if (paginator.getNextPage()) { %>
                &#160;&#160;&#160;<A href="<%=nextLink%>" class="rtbcLink">NEXT >></A>
                <% } %>
            </b>
            </div>
            <% } %>
            <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forumCategory)%>'>
                <% if (category.getID() != forumCategory.getID()) { %>
                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink">
                    <%=category.getName()%>
                </A> >
                <% } else { %>
                <%=category.getName()%>
                <% } %>
            </tc-webtag:iterator>
        </b></td>
    </tr>
</table>

<% if (forumCategory.getForumCount() > 0) { %>
<table cellpadding="0" cellspacing="0" class="rtTable" width="100%">
    <tr>
        <td class="rtHeader" width="80%"><a href="<%=forumLink%>" class="rtbcLink">Forum</a></td>
        <td class="rtHeader" width="20%">T./M.</td>
        <td class="rtHeader" align="center" colspan="2" nowrap="nowrap"><a href="<%=dateLink%>" class="rtbcLink">Last
            Post</a></td>
    </tr>
    <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=(Iterator)request.getAttribute("forums")%>'>
        <% trackerClass = (user == null || forum.getLatestMessage() == null || readTracker.getReadStatus(user, forum.getLatestMessage()) == ReadTracker.READ
                || ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, forum.getLatestMessage().getForumThread()))) ? "rtLinkOld" : "rtLinkBold"; %>
        <tr>
            <td class="rtThreadCellWrap">
                <% if (user == null) { %>
                <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&<%=ForumConstants.MESSAGE_COUNT%>=<%=forum.getMessageCount()%>" class="rtLinkNew">
                    <%=forum.getName()%>
                </A>
                <% } else { %>
                <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>" class="<%=trackerClass%>">
                    <%=forum.getName()%>
                </A>
                <% } %>
                <% if (forum.getDescription() != null) { %><br/>

                <div class="rtDescIndent">
                    <%=forum.getDescription()%>
                </div>
                <% } %></td>
            <td class="rtThreadCell">
                <%=forum.getThreadCount()%>
                &#160;/&#160;
                <%=forum.getMessageCount()%>
            </td>
            <% if (forum.getMessageCount() > 0) { %>
            <tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
            <td class="rtThreadCell"><b>
                <tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/>
            </b></td>
            <% if (message.getUser() != null) { %>
            <td class="rtThreadCell">
                <csf:handle coderId="<%=message.getUser().getID()%>"/>
            </td>
            <% } else { %>
            <td class="rtThreadCell">&nbsp;</td>
            <% } %>
            <% } else { %>
            <td class="rtThreadCell">&nbsp;</td>
            <td class="rtThreadCell">&nbsp;</td>
            <% } %>
        </tr>
    </tc-webtag:iterator>
</table>
<% } %>

<% if (forumCategory.getCategoryCount() > 0) { %>
<% if (forumCategory.getForumCount() > 0) { %><br><% } %>
<table cellpadding="0" cellspacing="0" class="rtTable">
    <tr>
        <td class="rtHeader" width="80%">Category</td>
        <td class="rtHeader" width="20%"><% if (forumCategory.getID() != 1) { %>T./M.<% } %></td>
        <td class="rtHeader" align="center" colspan="2">Last Post</td>
    </tr>
    <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=(Iterator)request.getAttribute("categories")%>'>
        <% if (forumCategory.getID() == 1) {
            String leftNavName = StringUtils.checkNull(category.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME));
            trackerClass = (!leftNavName.equals("") && unreadCategories.indexOf(leftNavName) == -1) ? "rtLinkOld" : "rtLinkBold";
        } else {
            trackerClass = (user == null || category.getLatestMessage() == null || readTracker.getReadStatus(user, category.getLatestMessage()) == ReadTracker.READ
                    || ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, category.getLatestMessage().getForumThread()))) ? "rtLinkOld" : "rtLinkBold";
        } %>
        <tr>
            <td class="rtThreadCellWrap">
                <% if (user == null) { %>
                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>&<%=ForumConstants.MESSAGE_COUNT%>=<%=category.getMessageCount()%>" class="rtLinkNew">
                    <%=category.getName()%>
                </A>
                <% } else { %>
                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="<%=trackerClass%>">
                    <%=category.getName()%>
                </A>
                <% } %>
                <% if (category.getDescription() != null) { %><br/>

                <div class="rtDescIndent">
                    <%=category.getDescription()%>
                </div>
                <% } %></td>
            <td class="rtThreadCell"><% if (forumCategory.getID() != 1) { %>
                <%=category.getThreadCount()%>
                &#160;/&#160;
                <%=category.getMessageCount()%>
                <% } %></td>
            <% if (category.getLatestMessage() != null) { %>
            <tc-webtag:useBean id="message" name="category" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
            <td class="rtThreadCell"><b>
                <tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/>
            </b></td>
            <% if (message.getUser() != null) { %>
            <td class="rtThreadCell">
                <csf:handle coderId="<%=message.getUser().getID()%>"/>
            </td>
            <% } else { %>
            <td class="rtThreadCell">&nbsp;</td>
            <% } %>
            <% } else { %>
            <td class="rtThreadCell">&nbsp;</td>
            <td class="rtThreadCell">&nbsp;</td>
            <% } %>
        </tr>
    </tc-webtag:iterator>
</table>
<% } %>

<div>
    <div style="float:right;">
        <a href="?module=RSS&<%=ForumConstants.CATEGORY_ID%>=<%=forumCategory.getID()%>"><img alt="RSS" border="none" src="/i/forums/btn_rss.gif"/></a>
    </div>
<span class="small">
<% if (forumCategory.getID() != 1) { %>
A forum with a <b>bold
    title</b> indicates it either has a new thread or has a thread with new postings. <%if (user != null) {%><A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=forumCategory.getID()%>&<%=ForumConstants.MARK_READ%>=t" class="rtbcLink">(Mark
    all as read)</A><%}%>
<% } else { %>
A category with a <b>bold
    title</b> in the left navigation indicates it has a forum with new postings. <%if (user != null) {%><A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=forumCategory.getID()%>&<%=ForumConstants.MARK_READ%>=t" class="rtbcLink">(Mark
    all as read)</A><%}%>
<% } %>
</span>
</div>

</div>

<jsp:include page="foot.jsp"/>
</div>
</div>

</body>
</html>