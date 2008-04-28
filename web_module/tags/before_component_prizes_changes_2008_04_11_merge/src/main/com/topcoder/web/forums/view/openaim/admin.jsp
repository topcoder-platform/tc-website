<%@ page import="com.topcoder.web.forums.ForumConstants"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%--  com.jivesoftware.base.PresenceManager presenceManager = forumFactory.getPresenceManager(); 
    Iterator itOnline = presenceManager.getOnlineUsers(); --%>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Open AIM Developer Challenge :: Powered by TopCoder</title>

<jsp:include page="style.jsp">
    <jsp:param name="key" value="tc_openaim_forums"/>
</jsp:include>
</head>

<body>

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">

                <jsp:include page="openaimTop.jsp"/>

                <div class="content" align="right">
                    <div class="contentTexture">
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxFull">

<table cellpadding="0" cellspacing="0" class="rtbcTable">
   <tr>
      <td class="categoriesBox" style="padding-right: 20px;">
         <jsp:include page="categoriesHeader.jsp" />
      </td>
      <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
         <jsp:include page="searchHeader.jsp" />
       </td>
       <td align="right" nowrap="nowrap" valign="top">
           <a href="?module=History" class="rtbcLink">My Post History</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Watches" class="rtbcLink">My Watches</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Settings" class="rtbcLink">User Settings</a><br />
       </td>
   </tr>
   <tr>
      <td colspan="3" style="padding-bottom:3px;"><b>
		<a href="?module=Main" class="rtbcLink">Forums</a> > Administration
      </b></td>
   </tr>
</table>

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
        <%  String[] commandNames = { "Enable ratings" };
            String[] commandValues = { ForumConstants.ADMIN_ENABLE_RATINGS };
            for (int i=0; i<commandNames.length; i++) { %>
                <option value="<%=commandValues[i]%>"><%=commandNames[i]%></option>
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
            <openaim:handle coderId="<%=u.getID()%>"/><%  if (itOnline.hasNext()) { %>, <% } %>
        <%  } %>
      </td>
   </tr>
   --%>
</table>
<div align="right">
<input type="image" src="/i/events/openaim/interface/btnUpdate.png" alt="Update" />
</div></form>
            

                        </div>
                        <div style="clear: both;">&nbsp;</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="tcFoot.jsp"/>

</body>
</html>