<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.tc.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Password Reset</title>
</head>

<body>
Your password has been reseted.
<c:if test="${not empty param.em}" >
	Your email address has been set to <c:out value="${request.em}" escapeXml="true"/>.
</c:if>
<a href="/tc?module=Login">Login</a>
</body>
</html>