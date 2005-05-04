<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 com.jivesoftware.forum.stats.ViewCountManager,
         		 java.util.Iterator,
                 java.util.Enumeration"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >

<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>

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
<tr><td class="rtbc"><A href="/forums/" class="rtbcLink">Round Tables</A> >> 
	<A href="/forums/?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>" class="rtbcLink"><jsp:getProperty name="forum" property="name"/></A></td>
<td class="rtbc" align="right"><b><< PREV&#160;&#160;&#160;[ 1 <A href="/">2</A> <A href="/">3</A> ]&#160;&#160;&#160;<A href="/">NEXT>></A></b></td></tr>
</table>

<table cellpadding="0" cellspacing="0" class="rtTable">
<tr>
<td class="rtHeader" width="70%">Topic</td>
<td class="rtHeader" width="10%">Author</td>
<td class="rtHeader" width="10%">Replies</td>
<td class="rtHeader" width="10%">Views</td>
<td class="rtHeader" align="center" colspan="2">Last Post</td>
</tr>
<% int limit = 0; %>
<tc-webtag:iterator id="thread" type="com.jivesoftware.forum.ForumThread" iterator='<%=(Iterator)request.getAttribute("threads")%>'>
<% if (++limit <= 12) { %>
<tr>
<tc-webtag:useBean id="message" name="thread" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
<td class="rtThreadCellWrap"><A href='<%="?module=Thread&" + ForumConstants.THREAD_ID + "=" + thread.getID()%>' class="rtLinkNew"><%=thread.getRootMessage().getSubject()%></A>
	[ <A href="/" class="rtLinkNew">1</A> <A href="/" class="rtLinkNew">2</A> ]</td>
<td class="rtThreadCell"><tc-webtag:handle coderId="<%=thread.getRootMessage().getUser().getID()%>"/></td>
<td class="rtThreadCell"><%=thread.getMessageCount()-1%><jsp:getProperty name="paginator" property="numPages"/></td>
<td class="rtThreadCell"><%=ViewCountManager.getInstance().getThreadCount(thread)%></td>
<td class="rtThreadCell"><b><tc-webtag:beanWrite name="message" property="modificationDate" format="MMM dd, yyyy h:mm a"/></b></td>
<td class="rtThreadCell"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></td>
</tr>
<% } %>
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
