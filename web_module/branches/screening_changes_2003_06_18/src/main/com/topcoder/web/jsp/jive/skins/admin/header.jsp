
<%--
/**
 * header.jsp
 * July, 2000
 */
--%>

<%@ page 
	import="com.coolservlets.forum.*,
	        com.coolservlets.forum.util.*"
%>

<jsp:useBean id="adminBean" scope="session"
 class="com.coolservlets.forum.util.admin.AdminBean"/>

<%	////////////////////////////////
	// Jive authorization check
	
	// check the bean for the existence of an authorization token.
	// Its existence proves the user is valid. If it's not found, redirect
	// to the login page
	Authorization authToken = adminBean.getAuthToken();
	if( authToken == null ) {
		response.sendRedirect( "login.jsp" );
		return;
	}
%>

<%	////////////////////////////////////////
	// figure out what type of user we are:
	boolean isSystemAdmin = true;
	boolean isForumAdmin  = true;
	boolean isGroupAdmin  = true;
%>

<%	////////////////
	// get parameters
	
	String tab = ParamUtils.getParameter(request,"tab");
	if( tab == null ) {
		tab = "global";
	}
%>

<html>
<head>
	<title>header.jsp</title>
	<link rel="stylesheet" type="text/css" href="style/global.css">
</head>

<body background="images/backleft.gif" marginwidth=0 marginheight=0 leftmargin=0 topmargin=0 bgcolor="#ffffff">

<%-- begin header --%>
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
<tr height="100%">
	<td height="100%" width="1%" nowrap valign="bottom"
	><img src="images/title.gif" hspace="15" width="215" height="50" alt="Jive Administration Tool" border="0"
	><br><a href="sidebar.jsp?tree=system" onclick="location.href='header.jsp?tab=global';" target="sidebar"
	><img src="images/tabs_global_<%= (tab.equals("global"))?"on":"off" %>.gif" width="138" height="35" alt="" border="0"
	></a><a href="sidebar.jsp?tree=forum" onclick="location.href='header.jsp?tab=forums';" target="sidebar"
	><img src="images/tabs_forum_<%= (tab.equals("forums"))?"on":"off" %>.gif" width="138" height="35" alt="" border="0"
	></a></td><td height="100%" width="98%" valign="bottom"
	><img src="images/tabs_padding.gif" width="100%" height="85" alt="" border="0"></td
	><td height="100%" width="1%" valign="bottom"
	><a href="index.jsp?logout=true"
	><img src="images/logout.gif" width="64" height="85" alt="" border="0" target="_top"></a></td>
</tr>
</table>
<%-- end header --%>

</body>
</html>
