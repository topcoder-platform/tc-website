<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 com.jivesoftware.forum.stats.ViewCountManager"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="postHeading" name="postHeading" type="java.lang.String" toScope="request"/>
<tc-webtag:useBean id="postDesc" name="postDesc" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

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
            <jsp:param name="title" value="<%=postDesc%>"/>
        </jsp:include>

<form name="form1" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
<tc-webtag:hiddenInput name="module"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.FORUM_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.THREAD_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.MESSAGE_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.POST_MODE%>"/>

<table cellpadding="0" cellspacing="0" class="rtTable">
<tr><td class="rtHeader" colspan="2"><%=postHeading%></td></tr>
<tr>
<td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
<%  if (user.getProperty("imagePath") != null) { %>
	<img src="<%=user.getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br>
<%  } %>
<tc-webtag:handle coderId="<%=user.getID()%>"/><br><A href="/"><%=forumFactory.getUserMessageCount(user)%> posts</A></div></td>
<td class="rtTextCell">
<%-- <tc-webtag:errorIterator id="err" name="<%=ForumConstants.MESSAGE_SUBJECT%>"><%=err%><br/></tc-webtag:errorIterator> --%>
<b>Subject:</b><br><tc-webtag:textInput size="60" name="<%=ForumConstants.MESSAGE_SUBJECT%>"/><br><br> 
<%-- <tc-webtag:errorIterator id="err" name="<%=ForumConstants.MESSAGE_BODY%>"><%=err%><br/></tc-webtag:errorIterator> --%>
<b>Body:</b><br><tc-webtag:textArea rows="15" cols="60" name="<%=ForumConstants.MESSAGE_BODY%>"/>
</td>
</tr>
<tr><td class="rtFooter"><A href="/"><img src="/i/roundTables/post.gif" class="rtButton" alt="" /></A><A href="/"><img src="/i/roundTables/preview.gif" class="rtButton" alt="" /></A></td></tr>
</table></form>

        <p><br/></p>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
