<%@ page import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 com.jivesoftware.forum.stats.ViewCountManager,
         		 com.jivesoftware.forum.ForumMessage,
         		 com.jivesoftware.forum.ForumThread"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="message" name="message" type="com.jivesoftware.forum.ForumMessage" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="postMode" name="postMode" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  ForumMessage parentMessage = (ForumMessage)request.getAttribute("parentMessage");
	ForumThread thread = (ForumThread)request.getAttribute("thread"); %>

<html>
<head>
<title>TopCoder Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
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
            <jsp:param name="level1" value=""/>
            <jsp:param name="level2" value=""/>
         </jsp:include>
      </td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
        <td width="100%" class="rtBody">

            <jsp:include page="page_title.jsp" >
                <jsp:param name="image" value="forums"/>
                <jsp:param name="title" value="Message Preview"/>
            </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr><td class="rtbc"><A href="" class="rtbcLink">Round Tables</A> >>
	<A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="forum" property="name"/></A>
		<%	if (thread != null) { %>
		>> <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="thread" property="name"/></A>
		<%	} %>
		>> <jsp:getProperty name="message" property="subject"/>
</td></tr></table>

<br/><span class="bodySubtitle">Message Preview</span><br/>
<table cellpadding="0" cellspacing="0" class="rtTable">
	<tr><td class="rtHeader" colspan="2"><a name=<jsp:getProperty name="message" property="ID"/>><tc-webtag:beanWrite name="message" property="modificationDate" format="MMM dd, yyyy 'at' h:mm a z"/> | <jsp:getProperty name="message" property="subject"/>
		<%	if (parentMessage != null) { %>
				(response to <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=parentMessage.getID()%>" class="rtbcLink">post</A> by <tc-webtag:handle coderId="<%=parentMessage.getUser().getID()%>"/>)
		<%	} %>
	</a></td></tr>
	<tr>
	<td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
	<%  if (user.getProperty("imagePath") != null) { %>
		<img src="<%=user.getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br/>
	<%  } %>
	<span class="bodyText"><tc-webtag:handle coderId="<%=user.getID()%>"/></span><br/><A href="/"><%=forumFactory.getUserMessageCount(user)%> posts</A></div></td>
	<td class="rtTextCell100"><jsp:getProperty name="message" property="body"/></td>
	</tr>
</table>

<span class="bodySubtitle">Edit Message</span><br/>
<table cellpadding="0" cellspacing="0" class="rtTable">
<form name="form1" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
<tc-webtag:hiddenInput name="module"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.FORUM_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.THREAD_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.MESSAGE_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.POST_MODE%>"/>

<tr><td class="rtHeader" colspan="2"><jsp:getProperty name="message" property="subject"/></td></tr>
<tr>
<td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
<%  if (user.getProperty("imagePath") != null) { %>
	<img src="<%=user.getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br/>
<%  } %>
<tc-webtag:handle coderId="<%=user.getID()%>"/><br/><A href="/"><%=forumFactory.getUserMessageCount(user)%> posts</A></div></td>
<td class="rtTextCell100">
<tc-webtag:errorIterator id="errSubject" name="<%=ForumConstants.MESSAGE_SUBJECT%>"><%=errSubject%></tc-webtag:errorIterator><br/>
<b>Subject:</b><br/><tc-webtag:textInput size="60" name="<%=ForumConstants.MESSAGE_SUBJECT%>"/><br/><br/>
<font color="red"><tc-webtag:errorIterator id="errBody" name="<%=ForumConstants.MESSAGE_BODY%>"><%=errBody%></tc-webtag:errorIterator><br/></font>
<b>Body:</b><br/><tc-webtag:textArea rows="15" cols="60" name="<%=ForumConstants.MESSAGE_BODY%>"/>
</td>
</tr>
<tr><td class="rtFooter"><A href="javascript:document.form1.module.value='PostMessage';document.form1.submit();"><img src="/i/roundTables/post.gif" class="rtButton" alt="" /></A><A href="javascript:document.form1.module.value='PreviewMessage';document.form1.submit();"><img src="/i/roundTables/preview.gif" class="rtButton" alt="" /></A></td></tr>
</form></table>

<p><br/></p>
</td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>