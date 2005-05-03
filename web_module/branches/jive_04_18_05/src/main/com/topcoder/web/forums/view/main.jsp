<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.jivesoftware.util.StringUtils,
         		 com.jivesoftware.forum.*,
         		 java.util.Iterator,
                 java.util.Enumeration"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
                <tr>
                    <td class="rtHeader" width="80%">Topic</td>
                    <td class="rtHeader" width="20%">T./M.</td>
                    <td class="rtHeader" align="center" colspan="2">Last Post</td>
                </tr>
                <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=(Iterator)request.getAttribute("forums")%>'>
                    <tr>
                        <td class="rtThreadCellWrap"><A href="/" class="rtLinkNew"><jsp:getProperty name="forum" property="name"/></A>
                        	<br><div class="rtDescIndent"><jsp:getProperty name="forum" property="description"/></div></td>
                        <td class="rtThreadCell"><jsp:getProperty name="forum" property="threadCount"/>/<jsp:getProperty name="forum" property="messageCount"/></td>
                        <tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                        <td class="rtThreadCell"><b><tc-webtag:beanWrite name="message" property="modificationDate" format="MMM dd, yyyy h:mm a"/></b></td>
                   		<% System.out.println(message.getUser().getUsername() + " " + message.getUser().getID()); %>
                   		<td class="rtThreadCell"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></td>
                    </tr>
                </tc-webtag:iterator>
            </table>

            <p>A topic with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings.</p>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>