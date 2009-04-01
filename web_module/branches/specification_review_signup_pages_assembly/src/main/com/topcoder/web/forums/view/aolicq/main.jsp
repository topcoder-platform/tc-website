<%@ page import="com.jivesoftware.base.User,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.WatchManager,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.ForumConstants,
                 java.util.Calendar,
                 java.util.Iterator"
        %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="aolicq.tld" prefix="aolicq" %>
<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="categories" name="categories" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<% User user = (User) request.getAttribute("user");
    ResultFilter resultFilter = (ResultFilter) request.getAttribute("resultFilter");
    ReadTracker readTracker = forumFactory.getReadTracker();
    WatchManager watchManager = forumFactory.getWatchManager();
    String trackerClass = ""; %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Aolicq Developer Challenge :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq_forums"/>
    </jsp:include>
</head>

<body>

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">

                <jsp:include page="aolicqTop.jsp"/>

                <div class="content" align="right">
                    <div class="contentTexture">
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxFull">


<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
        <td class="categoriesBox" style="padding-right: 20px;">
            <jsp:include page="categoriesHeader.jsp"/>
        </td>
        <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
            <jsp:include page="searchHeader.jsp"/>
        </td>
        <td align="right" nowrap="nowrap" valign="top">
            <a href="?module=History" class="rtbcLink">My Post
                History</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Watches" class="rtbcLink">My Watches</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Settings" class="rtbcLink">User
            Settings</a><br />
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
        if (!"0".equals(limit)) {
            Iterator itForums = (Iterator)request.getAttribute("forumsIterator_"+category.getID());
            long numActiveForums = ((Long)request.getAttribute("numActiveForums_"+category.getID())).longValue();
            if (numActiveForums > 0 || ("true".equals(category.getProperty(ForumConstants.PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN)))) { %>
    <br />
    <table cellpadding="0" cellspacing="0" class="rtTable">
        <tr>
            <td class="rtHeader" width="100%">
                <a href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink">
                    <%=category.getName()%>
                </a>
            </td>
            <td class="rtHeader"><div style="width:80px;">T./M.</div></td>
            <td class="rtHeader" align="center" colspan="2"><div style="width:300px;">Last Post</div></td>
        </tr>
        <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=itForums%>'>
            <% trackerClass = (user == null || forum.getMessageCount() <= 0 || readTracker.getReadStatus(user, forum.getLatestMessage()) == ReadTracker.READ
                    || ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, forum.getLatestMessage().getForumThread()))) ? "rtLinkOld" : "rtLinkBold"; %>
            <% if (forum.getMessageCount() > 0 || ("true".equals(category.getProperty(ForumConstants.PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN)))) { %>
            <tr>
                <td class="rtThreadCellWrap">
                    <% if (user == null) { %>
                    <a href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&<%=ForumConstants.MESSAGE_COUNT%>=<%=forum.getMessageCount()%>" class="rtLinkNew">
                        <%=forum.getName()%>
                    </a>
                    <% } else { %>
                    <a href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>" class="<%=trackerClass%>">
                        <%=forum.getName()%>
                    </a>
                    <% } %>
                    <% if (forum.getDescription() != null) { %><br />

                    <div class="rtDescIndent">
                        <%=forum.getDescription()%>
                    </div><% } %></td>
                <td class="rtThreadCell" style="width: 90px;">
                    <%=forum.getThreadCount()%>
                    &#160;/&#160;
                    <%=forum.getMessageCount()%>
                </td>
                <% if (forum.getMessageCount() > 0) { %>
                <tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                <td class="rtThreadCell" style="width: 210px;"><b>
                    <tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></b>
                </td>
                <% if (message.getUser() != null) { %>
                <td class="rtThreadCell" style="width: 90px;">
                    <tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></td>
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
        <tr><td class="rtThreadCell" colspan="4">
            <a href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtLinkNew">...more</a>
        </td></tr>
        <% } %>
        <% } %>
    </table>
    <% } %>
    <% } %>
</tc-webtag:iterator>
<% } %>

<div style="float:right;">
    <a href="?module=RSS&<%=ForumConstants.CATEGORY_ID%>=1"><img alt="RSS" border="none" src="/i/events/aolicq/interface/btnRSS.png"/></a>
</div>
<span class="small">A forum with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings.<br />
<!--The five most recent forums are displayed for each category other than Round Tables. Click a category's name to view its complete forum list.--></span>



                        </div>
                        <div style="clear: both;">&nbsp;</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="tcFoot.jsp"/>

</body>
</html>