
<%--
/**
 * cache.jsp
 * July, 2000
 */
--%>

<%@ page import="java.util.*,
                 com.coolservlets.forum.*,
				 com.coolservlets.forum.util.*,
				 com.coolservlets.forum.util.admin.*" %>

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

<%	////////////////////
	// Security check
	
	// make sure the user is authorized to create forums::
	ForumFactory forumFactory = ForumFactory.getInstance(authToken);
	ForumPermissions permissions = forumFactory.getPermissions(authToken);
	boolean isSystemAdmin = true;
	
	// redirect to error page if we're not a forum admin or a system admin
	if( !isSystemAdmin ) {
		request.setAttribute("message","No permission to create forums");
		response.sendRedirect("error.jsp");
		return;
	}
%>

<%	////////////////////
	// get parameters
	
	String message = ParamUtils.getParameter(request,"msg");
%>

<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style/global.css">
</head>

<body background="images/shadowBack.gif" bgcolor="#ffffff" text="#000000" link="#0000ff" vlink="#800080" alink="#ff0000">

<%	///////////////////////
	// pageTitleInfo variable (used by include/pageTitle.jsp)
	String[] pageTitleInfo = { "Cache Settings" };
%>
<%	///////////////////
	// pageTitle include
%><%@ include file="include/pageTitle.jsp" %>

<p>

<%	///////////////////////////////
	// print out message, if any
	if( message != null ) {
%>
	<span class="">
	<%= message %>
	</span>
<%	}
%>

<p>

Cache Settings

<p>

</body>
</html>

