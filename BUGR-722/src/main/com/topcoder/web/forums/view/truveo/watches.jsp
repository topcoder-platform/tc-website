<%@ page import="com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.stats.ViewCountManager,
                 com.topcoder.web.forums.ForumConstants,
                 java.util.Iterator"
        %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="truveo.tld" prefix="truveo" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="watchManager" name="watchManager" type="com.jivesoftware.forum.WatchManager" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<% ReadTracker readTracker = forumFactory.getReadTracker(); %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Truveo Developer Challenge :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_truveo_forums"/>
    </jsp:include>
</head>

<body>

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">

                <jsp:include page="truveoTop.jsp"/>

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
                                History</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Watches" class="rtbcLink">My
                            Watches</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Settings" class="rtbcLink">User
                            Settings</a><br />
                        </td>
                    </tr>
                </table>

                <b><a href="?module=Main" class="rtbcLink">Forums</a> > My Watches
                    (<%=watchManager.getTotalWatchCount(user, JiveConstants.THREAD)%> threads)</b>
                <br /><span class="small">All watch updates will be emailed to your email address: <b>
                <%=user.getEmail()%>
            </b>.
Watches on content that hasn't been updated for more than 90 days will be automatically removed from your list.
To prevent any watch from being automatically deleted, toggle the "save" option.</span>

                <form name="form1" method="post" action="<%=sessionInfo.getServletPath()%>">
                    <tc-webtag:hiddenInput name="module" value="Watches"/>
                    <tc-webtag:hiddenInput name="<%=ForumConstants.WATCH_TYPE%>" value="<%=String.valueOf(JiveConstants.THREAD)%>"/>
                    <tc-webtag:hiddenInput name="<%=ForumConstants.STATUS%>"/>
                    <table cellpadding="0" cellspacing="0" class="rtTable">
                        <tr>
                            <td class="rtHeader" width="70%">Thread</td>
                            <td class="rtHeader" width="30%">Author</td>
                            <td class="rtHeader" align="right">Replies</td>
                            <td class="rtHeader" align="right">Views</td>
                            <td class="rtHeader" align="center" colspan="2">Last Post</td>
                            <td class="rtHeader">Save</td>
                            <td class="rtHeader">Delete</td>
                        </tr>
                        <tc-webtag:iterator id="thread" type="com.jivesoftware.forum.ForumThread" iterator='<%=(Iterator)request.getAttribute("threads")%>'>
                            <tc-webtag:useBean id="rootMessage" name="thread" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="rootMessage"/>
                            <tc-webtag:useBean id="latestMessage" name="thread" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                            <tr>
                                <% String trackerClass = (user == null || readTracker.getReadStatus(user, latestMessage) == ReadTracker.READ) ? "rtLinkOld" : "rtLinkBold"; %>
                                <td class="rtThreadCellWrap">
                                    <a href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=rootMessage.getID()%>" class="<%=trackerClass%>">
                                        <%=thread.getName()%>
                                    </a></td>
                                <td class="rtThreadCell"><%if (rootMessage.getUser() != null) {%>
                                    <tc-webtag:handle coderId="<%=rootMessage.getUser().getID()%>"/><%}%></td>
                                <td class="rtThreadCell" align="right"><%=thread.getMessageCount() - 1%></td>
                                <td class="rtThreadCell" align="right"><%=ViewCountManager.getInstance().getThreadCount(thread)%></td>
                                <td class="rtThreadCell"><b>
                                    <tc-webtag:format object="${thread.modificationDate}" format="MMM d, yyyy h:mm a z" timeZone="${sessionInfo.timezone}"/></b>
                                </td>
                                <td class="rtThreadCell"><%if (latestMessage.getUser() != null) {%>
                                    <tc-webtag:handle coderId="<%=latestMessage.getUser().getID()%>"/><%}%></td>
                                <td class="rtThreadCell" align="center">
                                    <input name="<%=ForumConstants.STATUS_SAVE%><%=thread.getID()%>" value="<%=thread.getID()%>" type="checkbox"
                                            <%= (watchManager.getWatch(user, thread).isExpirable()) ? "" : "checked" %> onclick="Javascript:document.form1.<%=ForumConstants.STATUS_DELETE%><%=thread.getID()%>.checked=false;"/>
                                </td>
                                <td class="rtThreadCell" align="center">
                                    <input name="<%=ForumConstants.STATUS_DELETE%><%=thread.getID()%>" value="<%=thread.getID()%>" type="checkbox"
                                           onclick="Javascript:document.form1.<%=ForumConstants.STATUS_SAVE%><%=thread.getID()%>.checked=false;"/>
                                </td>
                            </tr>
                        </tc-webtag:iterator>
                    </table>

                    <div align="right">
                        <input type="image" src="/i/events/truveo/interface/btnUpdate.png" alt="Update" onclick="form1.<%=ForumConstants.STATUS%>.value='<%=ForumConstants.STATUS_UPDATE%>'"/>
                    </div>

                </form>




<%	if (watchManager.getTotalWatchCount(user, JiveConstants.FORUM) > 0) { %>
<form name="form3" method="post" action="<%=sessionInfo.getServletPath()%>">
    <tc-webtag:hiddenInput name="module" value="Watches"/>
    <tc-webtag:hiddenInput name="<%=ForumConstants.WATCH_TYPE%>" value="<%=String.valueOf(JiveConstants.FORUM)%>"/>
    <tc-webtag:hiddenInput name="<%=ForumConstants.STATUS%>"/>
    <div style="padding-bottom:3px;"><b>Watched Forums (<%=watchManager.getTotalWatchCount(user, JiveConstants.FORUM)%>)</b></div>
    <table cellpadding="0" cellspacing="0" class="rtTable">
        <tr>
            <td class="rtHeader" width="100%">Forum</td>
            <td class="rtHeader" align="right">Threads</td>
            <td class="rtHeader" align="right">Messages</td>
            <td class="rtHeader" align="center" colspan="2" nowrap="nowrap">
                <div style="width:320px;">Last Post</div>
            </td>
            <td class="rtHeader">Save</td>
            <td class="rtHeader">Delete</td>
        </tr>



        <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=(Iterator)request.getAttribute("forums")%>'>
            <% String trackerClass = (user == null || forum.getLatestMessage() == null || readTracker.getReadStatus(user, forum.getLatestMessage()) == ReadTracker.READ
                    || ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, forum.getLatestMessage().getForumThread()))) ? "rtLinkOld" : "rtLinkBold"; %>
            <tr>
                <td class="rtThreadCellWrap">
                    <% if (user == null) { %>
                    <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&<%=ForumConstants.MESSAGE_COUNT%>=<%=forum.getMessageCount()%>" class="rtLinkNew"><%=forum.getName()%></A>
                    <% } else { %>
                    <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>" class="<%=trackerClass%>"><%=forum.getName()%></A>
                    <% } %>
                </td>
                <td class="rtThreadCell" align="right"><%=forum.getThreadCount()%></td>
                <td class="rtThreadCell" align="right"><%=forum.getMessageCount()%></td>
                <% if (forum.getMessageCount() > 0) { %>
                <tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                <td class="rtThreadCell" style="width: 220px;"><b>
                    <tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></b>
                </td>
                <% if (message.getUser() != null) { %>
                <td class="rtThreadCell" style="width: 100px;">
                    <studio:handle coderId="<%=message.getUser().getID()%>"/>
                </td>
                <% } else { %>
                <td class="rtThreadCell" style="width: 100px;">&nbsp;</td>
                <% } %>
                <% } else { %>
                <td class="rtThreadCell" style="width: 220px;">&nbsp;</td>
                <td class="rtThreadCell" style="width: 100px;">&nbsp;</td>
                <% } %>
                <td class="rtThreadCell" align="center">
                    <input name="<%=ForumConstants.STATUS_SAVE%><%=forum.getID()%>" value="<%=forum.getID()%>" type="checkbox"
                            <%= (watchManager.getWatch(user, forum).isExpirable()) ? "" : "checked" %> onclick="Javascript:document.form3.<%=ForumConstants.STATUS_DELETE%><%=forum.getID()%>.checked=false;"/>
                </td>
                <td class="rtThreadCell" align="center">
                    <input name="<%=ForumConstants.STATUS_DELETE%><%=forum.getID()%>" value="<%=forum.getID()%>" type="checkbox"
                           onclick="Javascript:document.form3.<%=ForumConstants.STATUS_SAVE%><%=forum.getID()%>.checked=false;"/>
                </td>

            </tr>
        </tc-webtag:iterator>


    </table>

    <div align="right">
        <input type="image" src="/i/events/truveo/interface/btnUpdate.png" alt="Update" onclick="form3.<%=ForumConstants.STATUS%>.value='<%=ForumConstants.STATUS_UPDATE%>'"/>
    </div>


        </form>
<%	} %>

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