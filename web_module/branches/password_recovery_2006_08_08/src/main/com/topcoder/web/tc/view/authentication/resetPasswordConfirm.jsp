<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.tc.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Password Reset</title>
</head>

<body>
Your password has been reseted.
<% if (request.getParameter(Constants.EMAIL) != null) { %>
Your email address has ben set to <%= request.getParameter(Constants.EMAIL) %>.
<% } %>
<a href="/tc?module=Login">Login</a>
</body>
</html>