<%@ page import="com.jivesoftware.base.User,
                 com.jivesoftware.forum.Forum,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.WatchManager,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 java.util.ArrayList,
                 java.util.Calendar,
                 java.util.Iterator"
        %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="categories" name="categories" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="deepCategories" name="deepCategories" type="java.util.ArrayList" toScope="request"/>
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
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_forums"/>
    </jsp:include>
</head>

<body>

<div align="center">
<div class="contentOut">
<jsp:include page="top.jsp" />
<jsp:include page="topNav.jsp">
    <jsp:param name="node" value="forums"/>
</jsp:include>
<div class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">


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
                History</A>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="?module=Watches" class="rtbcLink">My Watches</A>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="?module=Settings" class="rtbcLink">User
            Settings</A><br/>
        </td>
    </tr>
</table>

<% if (categories.size() > 0) {
    Calendar calendar = Calendar.getInstance();
    calendar.set(Calendar.MILLISECOND, 0);
    calendar.set(Calendar.SECOND, 0);
    calendar.set(Calendar.MINUTE, 0); %>
<tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=(Iterator)categories.iterator()%>'>
    <% String limit = StringUtils.checkNull(category.getProperty(ForumConstants.PROPERTY_DISPLAY_LIMIT));
        if (!"0".equals(limit)) { %>
    <% Iterator itForums = null, itForumsCopy = null;
        int numActiveForums = 0;
        if (!"".equals(limit)) {
            if (limit.endsWith("d")) {
                int numDays = Integer.parseInt(limit.substring(0, limit.length() - 1));
                calendar.add(Calendar.DATE, numDays * -1);
                resultFilter.setModificationDateRangeMin(calendar.getTime());
                calendar.add(Calendar.DATE, numDays);
                resultFilter.setNumResults(ForumConstants.MAX_DISPLAYED_FORUMS_PER_CATEGORY);
                itForums = category.getForums(resultFilter);
                itForumsCopy = category.getForums(resultFilter);
            } else {
                //resultFilter.setNumResults(Integer.parseInt(category.getProperty("displayLimit")));
                ArrayList forumsList = ForumsUtil.getForums(category, resultFilter, true);
                ArrayList pageList = ForumsUtil.getForumsPage(forumsList, 0, Integer.parseInt(category.getProperty("displayLimit")));
                itForums = pageList.iterator();
                itForumsCopy = pageList.iterator();
            }
        } else {
            resultFilter.setNumResults(ResultFilter.NULL_INT);
            itForums = category.getForums(resultFilter);
            itForumsCopy = category.getForums(resultFilter);
        }
        while (itForums.hasNext()) {
            if (((Forum) itForums.next()).getMessageCount() > 0) numActiveForums++;
        }
        if (numActiveForums > 0 || ("true".equals(category.getProperty(ForumConstants.PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN)))) { %>
    <br>
    <table cellpadding="0" cellspacing="0" class="rtTable">
        <tr>
            <td class="rtHeader" width="100%">
                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink">
                    <%=category.getName()%>
                </A>
            </td>
            <td class="rtHeader"><div style="width:80px;">T./M.</div></td>
            <td class="rtHeader" align="center" colspan="2"><div style="width:300px;">Last Post</div></td>
        </tr>
        <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=itForumsCopy%>'>
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
                    </div><% } %></td>
                <td class="rtThreadCell" style="width: 80px;">
                    <%=forum.getThreadCount()%>
                    &#160;/&#160;
                    <%=forum.getMessageCount()%>
                </td>
                <% if (forum.getMessageCount() > 0) { %>
                <tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                <td class="rtThreadCell" style="width: 190px;"><b>
                	<tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d yyyy 'at' h:mm a" timeZone="${sessionInfo.timezone}"/></b>
                </td>
                <% if (message.getUser() != null) { %>
                <td class="rtThreadCell" style="width: 100px;">
                    <studio:handle coderId="<%=message.getUser().getID()%>"/></td>
                <% } else { %>
                <td class="rtThreadCell" style="width: 100px;"></td>
                <% } %>
                <% } else { %>
                <td class="rtThreadCell" style="width: 190px;">&nbsp;</td>
                <td class="rtThreadCell" style="width: 100px;">&nbsp;</td>
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
        <tr><td class="rtThreadCell" colspan="4">
            <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtLinkNew">...more</A>
        </td></tr>
        <% } %>
        <% } %>
    </table>
    <% } %>
    <% } %>
</tc-webtag:iterator>
<% } %>

<div style="float:right;">
    <a href="?module=RSS&<%=ForumConstants.CATEGORY_ID%>=1"><img border="none" src="/i/forums/btn_rss.gif"/></a>
</div>
<span class="small">A forum with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings. <%if (user != null) {%><A href="?module=Main&markRead=t" class="rtbcLink">(Mark
    all as read)</A><% } %><br>
The five most recent forums are displayed for each category other than Round Tables. Click a category's name to view its complete forum list.</span>

</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>