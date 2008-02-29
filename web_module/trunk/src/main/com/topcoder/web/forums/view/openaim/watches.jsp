<%@ page import="com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.stats.ViewCountManager,
                 com.topcoder.web.forums.ForumConstants,
                 java.util.Iterator"
        %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="openaim.tld" prefix="openaim" %>

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
    <title>TopCoder OpenAIM</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_openaim_forums"/>
    </jsp:include>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="top.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="forums"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

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
                                    <openaim:handle coderId="<%=rootMessage.getUser().getID()%>"/><%}%></td>
                                <td class="rtThreadCell" align="right"><%=thread.getMessageCount() - 1%></td>
                                <td class="rtThreadCell" align="right"><%=ViewCountManager.getInstance().getThreadCount(thread)%></td>
                                <td class="rtThreadCell"><b>
                                    <tc-webtag:format object="${thread.modificationDate}" format="MMM d, yyyy h:mm a z" timeZone="${sessionInfo.timezone}"/></b>
                                </td>
                                <td class="rtThreadCell"><%if (latestMessage.getUser() != null) {%>
                                    <openaim:handle coderId="<%=latestMessage.getUser().getID()%>"/><%}%></td>
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
                        <input type="image" src="/i/v2/interface/btnUpdate.png" alt="Update" onclick="form1.<%=ForumConstants.STATUS%>.value='<%=ForumConstants.STATUS_UPDATE%>'"/>
                    </div>

                </form>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>

    </div>
</body>
</html>