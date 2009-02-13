<%@ page import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.forums.ForumConstants,
                 com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.ReadTracker,
                 com.topcoder.common.web.data.Round,
           		 java.util.Iterator,
                 java.util.Enumeration,
                 java.util.HashMap,
                 com.topcoder.web.common.BaseProcessor"
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
<title>TopCoder Software Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tcs_forums"/>
</jsp:include>


</head>

<body>

<jsp:include page="includes/top.jsp"/>
<jsp:include page="includes/menu.jsp">
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
      <td width="180" class="leftColumn">
        <jsp:include page="includes/left.jsp" >
            <jsp:param name="level1" value="forum"/>
            <jsp:param name="level2" value="all"/>
        </jsp:include>
      </td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
        <td width="100%" class="rtBody">

            <jsp:include page="page_title.jsp" >
                <jsp:param name="image" value="forums"/>
                <jsp:param name="title" value="&#160;"/>
            </jsp:include>
    
<span class="rtbc"><a href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Forums</a> > Administration</span>

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
        <%  String[] commandNames = { "Create forums" };
            String[] commandValues = { ForumConstants.ADMIN_COMMAND_CREATE_FORUMS_COMPONENT };
            for (int i=0; i<commandNames.length; i++) { %>
                <option value="<%=commandValues[i]%>"><%=commandNames[i]%></option>
        <%  } %>
        </select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Component ID:</strong></td>
      <td class="rtTextCell100">
        <input name="<%=ForumConstants.NEW_COMPONENT_ID%>" size="50" maxlength="100" value="" id="<%=ForumConstants.NEW_COMPONENT_ID%>" type="text">
      </td>
   </tr>
   
   <% 
	 HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY);
	 if(errors.size() > 0) {
   %>
   
   <tr>
	  <td>&nbsp;</td>
      <td colspan="2">
        <%  if (errors.get(ForumConstants.MESSAGE_SUBJECT) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.MESSAGE_SUBJECT%>"><%=err%><br/></tc-webtag:errorIterator></span><% } %>
      </td>
   </tr>
   
   <%
	 } else { 
		long[] newForumIds = (long[]) request.getAttribute(ForumConstants.ADMIN_NEW_CATEGORY_IDS);
		if(newForumIds != null) {
   %>
   
   <tr>
	  <td class="rtTextCell">&nbsp;</td>
      <td class="rtTextCell100" colspan="2">
        Successfully created new forums:
      </td>
   </tr>
   <tr>
	  <td class="rtTextCell">&nbsp;</td>
      <td class="rtTextCell100" colspan="2">
        <a href="?module=Category&categoryID=<%= newForumIds[0] %>">Customer Forum</a>
      </td>
   </tr>
   <tr>
	  <td class="rtTextCell">&nbsp;</td>
      <td class="rtTextCell100" colspan="2">
        <a href="?module=Category&categoryID=<%= newForumIds[1] %>">Developer Forum</a>
      </td>
   </tr>
   
   <%
		} // end if
	} // end else
   %>
   
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
<input type="image" src="http://forums.dev.topcoder.com/i/roundTables/update.gif" alt="Update" />
</div></form>

        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="includes/foot.jsp" />

</body>

</html>