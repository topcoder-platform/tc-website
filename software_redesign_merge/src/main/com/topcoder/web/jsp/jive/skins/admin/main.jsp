
<%--
/**
 * main.jsp
 * July, 2000
 */
--%>

<%@ page import="java.util.*,
                 com.coolservlets.forum.*" %>

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


<html>
<head>
	<title>main.jsp</title>
</head>

<body background="images/shadowBack.gif" bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000">

<p>

<font face="verdana,arial,helvetica,sans-serif">
<b>Welcome to Jive Admin</b>
</font>

<font face="verdana,arial,helvetica,sans-serif" size="-1">
<ul>
	Please send feedback to
	<a href="mailto:bill@coolservlets.com">bill@coolservlets.com</a> about
	this tool.
	<p>
	What would you like to see on this front page? 
	<a href="mailto:bill@coolservlets.com">Email me</a> your suggestions.
</ul>
</font>

</body>
</html>
