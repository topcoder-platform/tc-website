<%@ page import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 com.jivesoftware.forum.action.util.Page,
         		 java.util.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="thread" name="thread" type="com.jivesoftware.forum.ForumThread" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>

<html>
<head>
<title>TopCoder</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/roundTables.css"/>
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
				<jsp:param name="level1" value=""/>
				<jsp:param name="level2" value=""/>
			</jsp:include>
		</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" class="rtBody">

        <jsp:include page="page_title.jsp" >
            <jsp:param name="image" value="forums"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr><td class="rtbc"><A href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Round Tables</A> >>
	<A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="forum" property="name"/></A> >>
	<jsp:getProperty name="thread" property="name"/></td>
</table>

<tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage" iterator='<%=(Iterator)request.getAttribute("messages")%>'>
<table cellpadding="0" cellspacing="0" width=100%><tr>
	<%  int depth=thread.getTreeWalker().getMessageDepth(message);
		int width=Math.round(Math.min(500,500-((depth-50)*(depth-50))/5));
		if (depth > 0) { %>
			<td width=1%><img src="/images/clear.gif" width="<%=width%>" height="50"></td>
	<%	}	%>
	<td width=99%><table cellpadding="0" cellspacing="0" class="rtTable">
		<tr><td class="rtHeader" colspan="2"><a name=<jsp:getProperty name="message" property="ID"/>><tc-webtag:beanWrite name="message" property="modificationDate" format="MMM dd, yyyy 'at' h:mm a z"/> | <jsp:getProperty name="message" property="subject"/>
			<%	if (message.getParentMessage() != null) { %>
					(response to <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>#<%=message.getParentMessage().getID()%>" class="rtbcLink">post</A> by <tc-webtag:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/>)
			<%	} %>
		</a></td></tr>
		<tr><td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
		<%  if (message.getUser().getProperty("imagePath") != null) { %>
			<img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br>
		<%  } %>
		<span class="bodyText"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></span><br><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=forumFactory.getUserMessageCount(message.getUser())%> posts</A></div></td>
		<td class="rtTextCell100"><jsp:getProperty name="message" property="body"/></td></tr>
		<tr><td class="rtFooter" align="right">
		<%  if (message.getUser().equals(user)) { %>
    		<A href="?module=Post&<%=ForumConstants.POST_MODE%>=Edit&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>"><img src="/i/roundTables/edit.gif" class="rtButton" alt="Edit" /></A>
    	<%	} %>
		<A href="?module=Post&<%=ForumConstants.POST_MODE%>=Reply&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>"><img src="/i/roundTables/reply.gif" class="rtButton" alt="Reply" /></A>
		</td></tr>
	</table></td>
</tr></table>
</tc-webtag:iterator>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr><td class="rtbc"><A href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Round Tables</A> >>
	<A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="forum" property="name"/></A> >>
	<jsp:getProperty name="thread" property="name"/></td>
</table>
        <p><br/></p>
        </td>

<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
