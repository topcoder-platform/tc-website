<%  response.setHeader( "Expires", "Sat, 6 May 1995 12:00:00 GMT" );
    response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate" );
    response.addHeader( "Cache-Control", "post-check=0, pre-check=0" );
    response.setHeader( "Pragma", "no-cache" ); %>

<%@ page import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 com.jivesoftware.base.JiveConstants,
         		 com.jivesoftware.forum.stats.ViewCountManager,
                 com.jivesoftware.forum.ReadTracker,
         		 java.util.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="watchManager" name="watchManager" type="com.jivesoftware.forum.WatchManager" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  ReadTracker readTracker = forumFactory.getReadTracker(); %>

<html>
<head>
<title>TopCoder Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/roundTables.css"/>
<link type="text/css" rel="stylesheet" href="/css/stats.css"/>
<jsp:include page="script.jsp" />

</head>

<body>

<jsp:include page="top_forums.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
      <td width="180">
         <jsp:include page="includes/global_left.jsp">
            <jsp:param name="level1" value="forums"/>
            <jsp:param name="level2" value=""/>
         </jsp:include>
      </td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
        <td width="100%" class="rtBody">

            <jsp:include page="page_title.jsp" >
                <jsp:param name="image" value="forums"/>
                <jsp:param name="title" value="Watched Threads"/>
            </jsp:include>

<div class="topLinksL">
<span class="rtbc"><a href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Forums</a> >> Watches </span><br><br>
</div>
<div class="topLinksR">
<A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<b>My Watches</b>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
</div><br><br>

<span class="bodySubtitle">Watched Threads: <%=watchManager.getTotalWatchCount(user, JiveConstants.THREAD)%></span><br/>
All watch updates will be emailed to your email address: <b><jsp:getProperty name="user" property="email"/></b>.
Watches on content that hasn't been updated for more than 90 days will be automatically removed from your list.
To prevent any watch from being automatically deleted, toggle the "save" option.
<form name="form1" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
<tc-webtag:hiddenInput name="module" value="Watches"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.WATCHLIST_STATUS%>"/>
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
    <%  String trackerClass = (user == null || readTracker.getReadStatus(user, thread) == ReadTracker.READ) ? "rtLinkOld" : "rtLinkBold"; %>
    <td class="rtThreadCellWrap"><a href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="rootMessage" property="ID"/>" class="<%=trackerClass%>"><jsp:getProperty name="thread" property="name"/></a></td>
	<td class="rtThreadCell"><tc-webtag:handle coderId="<%=rootMessage.getUser().getID()%>"/></td>
	<td class="rtThreadCell" align="right"><%=thread.getMessageCount()-1%>&#160;&#160;&#160;&#160;&#160;</td>
	<td class="rtThreadCell" align="right"><%=ViewCountManager.getInstance().getThreadCount(thread)%>&#160;&#160;&#160;&#160;</td>
	<td class="rtThreadCell"><b><tc-webtag:beanWrite name="latestMessage" property="modificationDate" format="MMM d, yyyy h:mm a"/></b></td>
	<td class="rtThreadCell"><tc-webtag:handle coderId="<%=latestMessage.getUser().getID()%>"/></td>
	<td class="rtThreadCell" align="center"><input name="<%=ForumConstants.WATCHES_SAVE_THREAD%><jsp:getProperty name="thread" property="ID"/>" value="<jsp:getProperty name="thread" property="ID"/>" type="checkbox"
		<%= (watchManager.getWatch(user, thread).isExpirable()) ? "" : "checked" %> /></td>
	<td class="rtThreadCell" align="center"><input name="<%=ForumConstants.WATCHES_DELETE_THREAD%><jsp:getProperty name="thread" property="ID"/>" value="<jsp:getProperty name="thread" property="ID"/>" type="checkbox" /></td>
</tr>
</tc-webtag:iterator>
</table>

<div align="right">
<input type="image" src="/i/roundTables/update.gif" alt="Update" onclick="form1.<%=ForumConstants.WATCHLIST_STATUS%>.value='<%=ForumConstants.WATCHES_UPDATE%>'" />
</div>

</form>
<p><br/></p>

</td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>