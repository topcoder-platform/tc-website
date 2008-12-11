<%@ page import="com.topcoder.common.web.data.Round,
                 com.topcoder.web.forums.ForumConstants"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="roundList" name="roundList" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%--  com.jivesoftware.base.PresenceManager presenceManager = forumFactory.getPresenceManager(); 
    Iterator itOnline = presenceManager.getOnlineUsers(); --%>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>TopCoder Forums</title>
<jsp:include page="script.jsp" />
    <jsp:include page="/style.jsp">
      <jsp:param name="key" value="tc_forums"/>
    </jsp:include>


</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="forums"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
      <td width="180">
         <jsp:include page="includes/global_left.jsp">
            <jsp:param name="node" value="forums"/>
         </jsp:include>
      </td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
        <td width="100%" class="rtBody">

            <jsp:include page="page_title.jsp" >
                <jsp:param name="image" value="forums"/>
                <jsp:param name="title" value="&#160;"/>
            </jsp:include>
    
<span class="rtbc"><a href="?module=Main" class="rtbcLink">Forums</a> <img src="/i/interface/exp_w.gif" align="absmiddle"/> Administration</span>

<form name="form1" method="post" action="${sessionInfo.servletPath}">
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
                "Add test forums", "Delete test forums", "Create algorithm forums", 
                "Delete empty algorithm forums", "Create forum from EJB", "Enable ratings",
                "Convert TCS forums", "Convert TCS forum permissions"};
            String[] commandValues = { ForumConstants.ADMIN_COMMAND_HTML_ESCAPE,
                "Add test forums", "Delete test forums", ForumConstants.ADMIN_COMMAND_CREATE_FORUMS_ALGO,
                ForumConstants.ADMIN_COMMAND_DELETE_FORUMS_ALGO, ForumConstants.ADMIN_CREATE_FORUM_FROM_EJB, 
                ForumConstants.ADMIN_ENABLE_RATINGS, ForumConstants.ADMIN_CONVERT_TCS_FORUMS,
                ForumConstants.ADMIN_CONVERT_TCS_FORUM_PERMS};
            for (int i=0; i<commandNames.length; i++) { %>
                <option value="<%=commandValues[i]%>"><%=commandNames[i]%></option>
        <%  } %>
        </select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Contest:</strong></td>
      <td class="rtTextCell100">
        <select size="1" name="<%=ForumConstants.ADMIN_MATCH%>">
        <%  for (int i=0; i<roundList.size(); i++) { 
                Round round = (Round)roundList.get(i); %>
                <option value="<%=round.getRoundId()%>"><%=round.getRoundName()%></option>
        <%  } %>
        </select>
      </td>
   </tr>
   <%--
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Online users:</strong></td>
      <td class="rtTextCell100">
        <%  while (itOnline.hasNext()) { %>
            <%  User u = (User)itOnline.next(); %>
            <tc-webtag:handle coderId="<%=u.getID()%>"/><%  if (itOnline.hasNext()) { %>, <% } %>
        <%  } %>
      </td>
   </tr>
   --%>
</table>
<div align="right">
<input type="image" src="/i/roundTables/update.gif" alt="Update" />
</div></form>

<div style="clear:both;">&nbsp;</div>

        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>