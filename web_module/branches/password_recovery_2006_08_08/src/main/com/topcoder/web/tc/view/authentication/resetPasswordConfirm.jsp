<%@ page contentType="text/html; charset=utf-8"
         import="com.topcoder.web.tc.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Password Reset</title>
</head>

<body>
Your password has been reseted.
<% if (request.getAttribute(Constants.EMAIL) != null) { %>
	Your email address has been set to <%= request.getAttribute(Constants.EMAIL) %>.
<% } %>
<a href="/tc?module=Login">Login</a>
</body>
</html>