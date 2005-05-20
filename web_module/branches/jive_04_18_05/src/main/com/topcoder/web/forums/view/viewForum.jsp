<%@ page import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 com.topcoder.web.forums.model.Paging,
         		 com.jivesoftware.forum.stats.ViewCountManager,
         		 com.jivesoftware.forum.action.util.Page,
         		 com.jivesoftware.forum.action.util.Paginator,
         		 java.util.Iterator,
                 java.util.Enumeration"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >

<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
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
	<jsp:getProperty name="forum" property="name"/></td>
<% Page[] pages; %>
<% if (paginator.getNumPages() > 1) { %>
	<td class="rtbc" align="right"><b>
		<%  if (paginator.getPreviousPage()) { %>
			<A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="previousPageStart"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink">
            	<< PREV</A>&#160;&#160;&#160;
        <%  } %> [
        <%  pages = paginator.getPages(5);
            for (int i=0; i<pages.length; i++) {
        %>  <%  if (pages[i] != null) { %>
        			<%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
        					<span class="rtbcCurrPage"><%= pages[i].getNumber() %></span>
        			<%  } else { %>
            				<A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink">
	                		<%= pages[i].getNumber() %></A>
	                <%  } %>
            <%  } %>
        <%  } %> ]
		<%  if (paginator.getNextPage()) { %>
			&#160;&#160;&#160;<A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="nextPageStart"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink">NEXT>></A>
        <%  } %>
	</b></td></tr>
<% } %>
</table>

<table cellpadding="0" cellspacing="0" class="rtTable">
<tr>
<td class="rtHeader" width="70%">Topic</td>
<td class="rtHeader" width="10%">Author</td>
<td class="rtHeader" width="10%" align="right">Replies</td>
<td class="rtHeader" width="10%" align="right">Views</td>
<td class="rtHeader" align="center" colspan="2">Last Post</td>
</tr>
<tc-webtag:iterator id="thread" type="com.jivesoftware.forum.ForumThread" iterator='<%=(Iterator)request.getAttribute("threads")%>'>
	<tr>
	<tc-webtag:useBean id="message" name="thread" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
	<td class="rtThreadCellWrap">
		<%	if (user.getProperty("jiveThreadMode").equals("flat")) { %>
				<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=0&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtLinkNew"><%=thread.getRootMessage().getSubject()%></A>
		<%	    Paginator threadPaginator;
				if (user != null) {
					threadPaginator = new Paginator(new Paging(thread.getMessageCount(), Integer.parseInt(user.getProperty("jiveMessageRange"))));
				} else {
					threadPaginator = new Paginator(new Paging(thread.getMessageCount(), 15));
				}
				if (threadPaginator.getNumPages() > 1) { %> [
		        <%  pages = threadPaginator.getPages(5);
		            for (int i=0; i<pages.length; i++) {
		        %>  <%  if (pages[i] != null) { %>
	        				<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtLinkNew">
	                		<%= pages[i].getNumber() %></A>
		            <%  } %>
		        <%  } %> ]
		    <%  } %>
		<%  } else { %>
			<A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtLinkNew"><%=thread.getRootMessage().getSubject()%></A>
		<%  } %></td>
	<td class="rtThreadCell"><tc-webtag:handle coderId="<%=thread.getRootMessage().getUser().getID()%>"/></td>
	<td class="rtThreadCell" align="right"><%=thread.getMessageCount()-1%>&#160;&#160;&#160;&#160;&#160;</td>
	<td class="rtThreadCell" align="right"><%=ViewCountManager.getInstance().getThreadCount(thread)%>&#160;&#160;&#160;&#160;</td>
	<td class="rtThreadCell"><b><tc-webtag:beanWrite name="message" property="modificationDate" format="MMM dd, yyyy h:mm a"/></b></td>
	<td class="rtThreadCell"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></td>
	</tr>
</tc-webtag:iterator>
</table>
<br><br>
A thread with a <b>bold title</b> indicates it is either a new thread or has new postings.

        <p><br/></p>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
