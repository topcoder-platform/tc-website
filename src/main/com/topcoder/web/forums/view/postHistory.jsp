<%@ page import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 com.jivesoftware.forum.stats.ViewCountManager,
         		 com.jivesoftware.forum.action.util.Page,
         		 java.util.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="historyUser" name="historyUser" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>

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

<jsp:include page="top.jsp" >
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
                <jsp:param name="title" value="Forum Post History"/>
            </jsp:include>

<div class="topLinksL">
<span class="rtbc"><a href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Forums</a> >> Post History: <tc-webtag:handle coderId="<%=historyUser.getID()%>"/> (<%=forumFactory.getUserMessageCount(historyUser)%> posts) </span><br><br>
</div>
<div class="topLinksR">
<%  if (user.getUsername() == historyUser.getUsername()) { %>
<b>My Post History</b>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
<%  } else { %>
<A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
<%  } %>
</div>

<br><br>
<table cellpadding="0" cellspacing="0" class="rtbcTable">
   <tr>
<% if (paginator.getNumPages() > 1) { %>
	<td class="rtbc" align="right" width=20% nowrap="nowrap"><b>
		<%  if (paginator.getPreviousPage()) { %>
			<A href="?module=History&<%=ForumConstants.USER_ID%>=<jsp:getProperty name="historyUser" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="previousPageStart"/>" class="rtbcLink">
            	<< PREV</A>&#160;&#160;&#160;
        <%  } %> [
        <%  Page[] pages = paginator.getPages(5);
            for (int i=0; i<pages.length; i++) {
        %>  <%  if (pages[i] != null) { %>
        			<%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
        					<span class="currentPage"><%= pages[i].getNumber() %></span>
        			<%  } else { %>
            				<A href="?module=History&<%=ForumConstants.USER_ID%>=<jsp:getProperty name="historyUser" property="ID"/>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtbcLink">
	                		<%= pages[i].getNumber() %></A>
	                <%  } %>
            <%  } %>
        <%  } %> ]
		<%  if (paginator.getNextPage()) { %>
			&#160;&#160;&#160;<A href="?module=History&<%=ForumConstants.USER_ID%>=<jsp:getProperty name="historyUser" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="nextPageStart"/>" class="rtbcLink">NEXT>></A>
        <%  } %>
	</b></td></tr>
<% } %>
</table>

<table cellpadding="0" cellspacing="0" class="rtTable">
    <tr>
        <td class="rtHeader" width="50%">Post</td>
        <td class="rtHeader" width="20%">Forum</td>
        <td class="rtHeader" width="14%">Date</td>
        <td class="rtHeader" width="8%">Replies</td>
        <td class="rtHeader" align="right">Edits</td>
    </tr>
	<tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage" iterator='<%=(Iterator)request.getAttribute("messages")%>'>
	<tr>
      	<td class="rtThreadCellWrap"><A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>" class="rtbcLink"><jsp:getProperty name="message" property="subject"/></A>
      	<%	if (message.getParentMessage() != null) { %>
				(response to <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%>" class="rtbcLink">post</A><%if (message.getParentMessage().getUser() != null) {%> by <tc-webtag:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/> (<A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getParentMessage().getUser().getID()%>" alt="Post history for <%=message.getParentMessage().getUser().getUsername()%>" class="rtbcLink"/>history</A>)<%}%>)
		<%	} %></td>
      	<td class="rtThreadCell"><A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=message.getForum().getID()%>&mc=<%=message.getForum().getMessageCount()%>" class="rtbcLink"><%=message.getForum().getName()%></A></td>
      	<td class="rtThreadCell"><strong><tc-webtag:beanWrite name="message" property="modificationDate" format="MMM d, yyyy h:mm a z"/></strong></td>
      	<td class="rtThreadCell"><%=message.getForumThread().getTreeWalker().getChildCount(message)%></td>
        <td class="rtThreadCell"></td>
    </tr>
	</tc-webtag:iterator>
</table>

        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>