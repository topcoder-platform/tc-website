<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.jivesoftware.util.StringUtils,
         		 com.jivesoftware.forum.*,
         		 java.util.Iterator"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% Iterator it = (Iterator)request.getAttribute("forums"); %>

<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >

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

<table cellpadding="0" cellspacing="0" class="rtTable">
<% Forum forum = null; %>
	<th>
	<td class="rtHeader" width="80%">Topic</td>
	<td class="rtHeader" width="20%">T./M.</td>
	<td class="rtHeader" align="center" colspan="2">Last Post</td>
	</th>
<% while (it.hasNext()) { 
	forum = (Forum)it.next(); %>
	<tr>
	<td class="rtHeader" width="80%"><jsp:getProperty name="forum" property="name" /></td>
	<td class="rtHeader" width="20%"><jsp:getProperty name="forum" property="threadCount" />/<jsp:getProperty name="forum" property="messageCount" /></td>
	<tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage" />
	<td class="rtHeader" align="center" colspan="2"><tc-webtag:beanWrite name="message" property="modificationDate" format="MM:dd:yyyy HH:mm:ss"/></td>
	</tr>	
<% } %>
</table>

A topic with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings.

        <p><br/></p>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>