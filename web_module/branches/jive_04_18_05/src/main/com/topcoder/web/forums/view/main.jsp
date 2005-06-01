<%@ page import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 java.util.Iterator,
                 java.util.Enumeration"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="authToken" name="authToken" type="com.jivesoftware.base.AuthToken" toScope="request"/>

<html>
<head>
<title>TopCoder Forums</title>
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
<tr>
   	<td nowrap="nowrap" valign="top">
	   	<form name="form1" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
		<tc-webtag:hiddenInput name="module" value="Search"/>
		<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_STATUS%>" value="search"/>
		<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_SCOPE%>" value="all"/>
		<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_DATE_RANGE%>" value="all"/>
	   	<A href="?module=Search" class="rtbcLink">Search:</A>&#160;
	   	<input name="<%=ForumConstants.SEARCH_QUERY%>" size="20" maxlength="100" value="" id="<%=ForumConstants.SEARCH_QUERY%>" type="text">
	   	<input name="Search" value="Search" type="submit" alt="Search" onclick="">
	   	&#160;<a href="#" onclick="openWin('searchTips.jsp','st',300,400);" class="rtbcLink">Search Tips</a><br/><br/>
	   	</form>
   	</td>
   	<td align="right" nowrap="nowrap" valign="top">
   		<A href="?module=History&<%=ForumConstants.USER_ID%>=<jsp:getProperty name="authToken" property="userID"/>" class="rtbcLink">Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
   	</td>
</tr>
</table>
            <table cellpadding="0" cellspacing="0" class="rtTable">
                <tr>
                    <td class="rtHeader" width="80%">Forum</td>
                    <td class="rtHeader" width="20%">T./M.</td>
                    <td class="rtHeader" align="center" colspan="2">Last Post</td>
                </tr>
                <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=(Iterator)request.getAttribute("forums")%>'>
                    <tr>
                        <td class="rtThreadCellWrap"><A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtLinkNew"><jsp:getProperty name="forum" property="name"/></A>
                        	<br/><div class="rtDescIndent"><jsp:getProperty name="forum" property="description"/></div></td>
                        <td class="rtThreadCell"><jsp:getProperty name="forum" property="threadCount"/>&#160;/&#160;<jsp:getProperty name="forum" property="messageCount"/></td>
                        <tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                        <td class="rtThreadCell"><b><tc-webtag:beanWrite name="message" property="modificationDate" format="MMM dd, yyyy h:mm a"/></b></td>
                   		<td class="rtThreadCell"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></td>
                    </tr>
                </tc-webtag:iterator>
            </table>
            <p>A forum with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings.</p>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>