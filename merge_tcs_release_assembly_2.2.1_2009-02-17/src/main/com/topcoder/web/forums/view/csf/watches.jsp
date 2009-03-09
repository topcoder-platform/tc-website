<%@ page import="com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.stats.ViewCountManager,
                 com.topcoder.web.forums.ForumConstants,
                 java.util.Iterator"
        %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="csf.tld" prefix="csf" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="watchManager" name="watchManager" type="com.jivesoftware.forum.WatchManager" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<% ReadTracker readTracker = forumFactory.getReadTracker(); %>

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
            </table>

            <b><A href="?module=Main" class="rtbcLink">Forums</A> > My Watches
                (<%=watchManager.getTotalWatchCount(user, JiveConstants.THREAD)%> threads)</b>
            <br><br>
                <span class="small">All watch updates will be emailed to your email address: <b>
                    <%=user.getEmail()%>
                </b>.
Watches on content that hasn't been updated for more than 90 days will be automatically removed from your list.
To prevent any watch from being automatically deleted, toggle the "save" option.</span>
            <br><br>

            <form name="form1" method="post" action="<%=sessionInfo.getServletPath()%>">
                <tc-webtag:hiddenInput name="module" value="Watches"/>
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
                                <csf:handle coderId="<%=rootMessage.getUser().getID()%>"/>
                                <%}%></td>
                            <td class="rtThreadCell" align="right"><%=thread.getMessageCount() - 1%>&#160;&#160;&#160;&#160;&#160;</td>
                            <td class="rtThreadCell" align="right"><%=ViewCountManager.getInstance().getThreadCount(thread)%>
                                &#160;&#160;&#160;&#160;</td>
                            <td class="rtThreadCell"><b>
                                <tc-webtag:format object="${thread.modificationDate}" format="MMM d, yyyy h:mm a z" timeZone="${sessionInfo.timezone}"/>
                            </b>
                            </td>
                            <td class="rtThreadCell"><%if (latestMessage.getUser() != null) {%>
                                <csf:handle coderId="<%=latestMessage.getUser().getID()%>"/>
                                <%}%></td>
                            <td class="rtThreadCell" align="center">
                                <input name="<%=ForumConstants.WATCHES_SAVE_THREAD%><%=thread.getID()%>" value="<%=thread.getID()%>" type="checkbox"
                                        <%= (watchManager.getWatch(user, thread).isExpirable()) ? "" : "checked" %> onClick="Javascript:document.form1.<%=ForumConstants.WATCHES_DELETE_THREAD%><%=thread.getID()%>.checked=false;"/>
                            </td>
                            <td class="rtThreadCell" align="center">
                                <input name="<%=ForumConstants.WATCHES_DELETE_THREAD%><%=thread.getID()%>" value="<%=thread.getID()%>" type="checkbox"
                                       onclick="Javascript:document.form1.<%=ForumConstants.WATCHES_SAVE_THREAD%><%=thread.getID()%>.checked=false;"/>
                            </td>
                        </tr>
                    </tc-webtag:iterator>
                </table>

                <div align="right">
                    <input type="image" src="/i/forums/update.gif" alt="Update" onClick="form1.<%=ForumConstants.STATUS%>.value='<%=ForumConstants.WATCHES_UPDATE%>'"/>
                </div>

            </form>

        </div>

        <jsp:include page="foot.jsp"/>
    </div>
</div>

</body>
</html>