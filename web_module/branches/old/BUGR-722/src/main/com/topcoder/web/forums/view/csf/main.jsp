<%@ page import="com.jivesoftware.base.User,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.WatchManager,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.ForumConstants,
                 java.util.Calendar,
                 java.util.Iterator"
        %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="csf.tld" prefix="csf" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="categories" name="categories" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<% User user = (User) request.getAttribute("user");
    ResultFilter resultFilter = (ResultFilter) request.getAttribute("resultFilter");
    ReadTracker readTracker = forumFactory.getReadTracker();
    WatchManager watchManager = forumFactory.getWatchManager();
    String trackerClass = ""; %>

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
        <td align="right" nowrap="nowrap" valign="top">
            <A href="?module=History" class="rtbcLink">My Post
                History</A> | <A href="?module=Settings" class="rtbcLink">User
            Settings</A><br/>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="padding-bottom:3px;"><b>
            Forums ></b></td>
    </tr>
</table>
<% if (categories.size() > 0) {
    Calendar calendar = Calendar.getInstance();
    calendar.set(Calendar.MILLISECOND, 0);
    calendar.set(Calendar.SECOND, 0);
    calendar.set(Calendar.MINUTE, 0); %>
<tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=(Iterator)categories.iterator()%>'>
    <% String limit = StringUtils.checkNull(category.getProperty(ForumConstants.PROPERTY_DISPLAY_LIMIT));
        if (!"0".equals(limit)) {
        	Iterator itForums = (Iterator)request.getAttribute("forumsIterator_"+category.getID());
            long numActiveForums = ((Long)request.getAttribute("numActiveForums_"+category.getID())).longValue();
            if (numActiveForums > 0 || ("true".equals(category.getProperty(ForumConstants.PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN)))) { %>
    <table cellpadding="0" cellspacing="0" class="rtTable">
        <tr>
            <td class="rtHeader" width="100%">
                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink">
                    <%=category.getName()%>
                </A>
            </td>
            <td class="rtHeader">
                <div style="width:60px;">T./M.</div>
            </td>
            <td class="rtHeader" align="center" colspan="2">
                <div style="width:280px;">Last Post</div>
            </td>
        </tr>
        <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=itForums%>'>
            <% trackerClass = (user == null || forum.getMessageCount() <= 0 || readTracker.getReadStatus(user, forum.getLatestMessage()) == ReadTracker.READ
                    || ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, forum.getLatestMessage().getForumThread()))) ? "rtLinkOld" : "rtLinkBold"; %>
            <% if (forum.getMessageCount() > 0 || ("true".equals(category.getProperty(ForumConstants.PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN)))) { %>
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
                <td class="rtThreadCell" style="width: 90px;">
                    <%=forum.getThreadCount()%>
                    &#160;/&#160;
                    <%=forum.getMessageCount()%>
                </td>
                <% if (forum.getMessageCount() > 0) { %>
                <tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                <td class="rtThreadCell" style="width: 210px;"><b>
                    <tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/>
                </b>
                </td>
                <% if (message.getUser() != null) { %>
                <td class="rtThreadCell" style="width: 90px;">
                    <csf:handle coderId="<%=message.getUser().getID()%>"/>
                </td>
                <% } else { %>
                <td class="rtThreadCell" style="width: 90px;"></td>
                <% } %>
                <% } else { %>
                <td class="rtThreadCell" style="width: 210px;">&nbsp;</td>
                <td class="rtThreadCell" style="width: 90px;">&nbsp;</td>
                <% } %>
            </tr>
            <% } %>
        </tc-webtag:iterator>
        <% if (!"".equals(limit)) {
            int limitCNT = -1;
            try {
                limitCNT = Integer.parseInt(limit);
            } catch (Exception e) {
            }
            if (category.getForumCount() >= limitCNT) { %>
        <tr>
            <td class="rtThreadCell" colspan="4">
                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtLinkNew">...more</A>
            </td>
        </tr>
        <% } %>
        <% } %>
    </table>
    <% } %>
    <% } %>
</tc-webtag:iterator>
<% } %>

<div style="float:right;">
    <a href="?module=RSS&<%=ForumConstants.CATEGORY_ID%>=1"><img alt="RSS" border="none" src="/i/forums/btn_rss.gif"/></a>
</div>
<span class="small">A forum with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings. <%if (user != null) {%><A href="?module=Main&markRead=t" class="rtbcLink">(Mark
    all as read)</A><% } %><br>
The five most recent forums are displayed for each category other than Round Tables. Click a category's name to view its complete forum list.</span>

</div>

<jsp:include page="foot.jsp"/>
</div>
</div>

</body>
</html>