<%@ page contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Password Reset</title>
</head>

<body>
Your password has been reseted.
<c:if test="${not empty param.em}" >
	Your email address has been set to <c:out value="${param.em}" escapeXml="true"/>.
</c:if>
<a href="/tc?module=Login">Login</a>
</body>
</html>