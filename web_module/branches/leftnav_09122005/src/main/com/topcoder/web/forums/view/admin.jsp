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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="roundList" name="roundList" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%--  com.jivesoftware.base.PresenceManager presenceManager = forumFactory.getPresenceManager(); 
    Iterator itOnline = presenceManager.getOnlineUsers(); --%>

<html>
<head>
<title>TopCoder Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<jsp:include page="script.jsp" />
    <jsp:include page="/style.jsp">
      <jsp:param name="key" value="tc_forums"/>
    </jsp:include>


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
                "Add test forums", "Delete test forums", "Create algorithm forums", 
                "Delete empty algorithm forums", "Create forum from EJB", "Enable ratings",
                "Enable rating permissions" };
            String[] commandValues = { ForumConstants.ADMIN_COMMAND_HTML_ESCAPE,
                "Add test forums", "Delete test forums", ForumConstants.ADMIN_COMMAND_CREATE_FORUMS_ALGO,
                ForumConstants.ADMIN_COMMAND_DELETE_FORUMS_ALGO, "Create forum from EJB", 
                ForumConstants.ADMIN_ENABLE_RATINGS, ForumConstants.ADMIN_ENABLE_RATING_PERMS };
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

        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>