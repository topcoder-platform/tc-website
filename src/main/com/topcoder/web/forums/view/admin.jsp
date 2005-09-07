<%@ page import="com.topcoder.web.common.BaseServlet,
                com.topcoder.web.forums.ForumConstants,
                 com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.ReadTracker,
                 com.topcoder.common.web.data.Round,
           		 java.util.Iterator,
                 java.util.Enumeration"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="roundList" name="roundList" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<html>
<head>
<title>TopCoder Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
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
            <jsp:param name="level1" value="forums"/>
            <jsp:param name="level2" value=""/>
            <jsp:param name="unreadCategories" value="<%=unreadCategories%>"/>
         </jsp:include>
      </td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
        <td width="100%" class="rtBody">

            <jsp:include page="page_title.jsp" >
                <jsp:param name="image" value="forums"/>
                <jsp:param name="title" value="&#160;"/>
            </jsp:include>
    
<span class="rtbc"><a href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Forums</a> >> Administration</span>

<form name="form1" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
<tc-webtag:hiddenInput name="module" value="Admin"/>
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
      <td class="rtHeader" colspan="2">Admin Console</td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Command:</strong></td>
      <td class="rtTextCell100">
        <select size="1" name="<%=ForumConstants.ADMIN_COMMAND%>">
        <%  String[] commandNames = { "Change angle brackets in old messages to HTML equivalents",
                "Add test forums", "Delete test forums", "Create algorithm forums" };
            String[] commandValues = { ForumConstants.ADMIN_COMMAND_HTML_ESCAPE,
                "Add test forums", "Delete test forums", ForumConstants.ADMIN_CREATE_FORUMS_ALGO };
            for (int i=0; i<commandNames.length; i++) { %>
                <option value="<%=commandValues[i]%>"><%=commandNames[i]%></option>
        <%  } %>
        </select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Contest:</strong></td>
      <td class="rtTextCell100">
        <select size="1" name="<%=ForumConstants.ADMIN_COMMAND%>">
        <%  for (int i=0; i<roundList.size(); i++) { 
                Round round = (Round)roundList.get(i); %>
                <option value="<%=round.getRoundId()%>"><%=round.getRoundName()%></option>
        <%  } %>
        </select>
      </td>
   </tr>
</table>
<div align="right">
<input type="image" src="/i/roundTables/update.gif" alt="Update" />
</div></form>

        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>