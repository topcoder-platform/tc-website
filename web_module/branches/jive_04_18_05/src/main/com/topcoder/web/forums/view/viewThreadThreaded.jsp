<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 com.jivesoftware.forum.action.util.Page,
         		 java.util.Iterator,
                 java.util.Enumeration"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="thread" name="thread" type="com.jivesoftware.forum.ForumThread" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>

<html>
<head>
<title>TopCoder</title>

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
            <jsp:param name="image" value="round_table"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr><td class="rtbc"><A href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Round Tables</A> >> 
	<A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="forum" property="name"/></A> >> 
	<jsp:getProperty name="thread" property="name"/></td>
<% if (paginator.getNumPages() > 1) { %>
	<td class="rtbc" align="right"><b> 
		<%  if (paginator.getPreviousPage()) { %>
			<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="previousPageStart"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtbcLink">
            	<< PREV</A>&#160;&#160;&#160;
        <%  } %> [
        <%  Page[] pages = paginator.getPages(5);
            for (int i=0; i<pages.length; i++) {
        %>  <%  if (pages[i] != null) { %>
        			<%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
        					<%= pages[i].getNumber() %>
        			<%  } else { %>
            				<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtbcLink">
	                		<%= pages[i].getNumber() %></A>
	                <%  } %>
            <%  } %>
        <%  } %> ]
		<%  if (paginator.getNextPage()) { %>
			&#160;&#160;&#160;<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="nextPageStart"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtbcLink">NEXT>></A>
        <%  } %>
	</b></td></tr>
<% } %>
</table>

<tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage" iterator='<%=(Iterator)request.getAttribute("messages")%>'>
<table cellpadding="0" cellspacing="0" width=100%><tr>
	<td><img src="/images/clear.gif" width="<%=20*thread.getTreeWalker().getMessageDepth(message)%>"></td>
	<td><table cellpadding="0" cellspacing="0" class="rtTable">
		<tr><td class="rtHeader" colspan="2"><tc-webtag:beanWrite name="message" property="modificationDate" format="MMM dd, yyyy 'at' h:mm a z"/> | <jsp:getProperty name="message" property="subject"/></td></tr>
		<tr>
		<td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
		<%  if (message.getUser().getProperty("imagePath") != null) { %>
			<img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br>
		<%  } %>
		<tc-webtag:handle coderId="<%=message.getUser().getID()%>"/><br><A href="/"><%=forumFactory.getUserMessageCount(message.getUser())%> posts</A></div></td>
		<td class="rtTextCell"><jsp:getProperty name="message" property="body"/></td>
		</tr>
		<tr><td class="rtFooter" align="right"><A href="?module=Message&<%=ForumConstants.POST_MODE%>=Reply&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>"><img src="/i/roundTables/reply.gif" class="rtButton" alt="" /></A></td></tr>
	</table></td>
</tr></table>
</tc-webtag:iterator>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr><td class="rtbc"><A href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Round Tables</A> >> 
	<A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="forum" property="name"/></A> >> 
	<jsp:getProperty name="thread" property="name"/></td>
<% if (paginator.getNumPages() > 1) { %>
	<td class="rtbc" align="right"><b> 
		<%  if (paginator.getPreviousPage()) { %>
			<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="previousPageStart"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtbcLink">
            	<< PREV</A>&#160;&#160;&#160;
        <%  } %> [
        <%  Page[] pages = paginator.getPages(5);
            for (int i=0; i<pages.length; i++) {
        %>  <%  if (pages[i] != null) { %>
        			<%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
        					<%= pages[i].getNumber() %>
        			<%  } else { %>
            				<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtbcLink">
	                		<%= pages[i].getNumber() %></A>
	                <%  } %>
            <%  } %>
        <%  } %> ]
		<%  if (paginator.getNextPage()) { %>
			&#160;&#160;&#160;<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="nextPageStart"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtbcLink">NEXT>></A>
        <%  } %>
	</b></td></tr>
<% } %>
</table>
        <p><br/></p>
        </td>
        
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
