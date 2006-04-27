<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.topcoder.web.reg.model.RegistrationType"%>
<%@ page import="com.topcoder.web.reg.model.User"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:useBean id="myTest" type="com.topcoder.web.reg.model.User" />
<c:set target="${myTest}" property="firstName" value="dok" />

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registration</title>
</head>

<body>

<%
    out.println(((User)request.getAttribute("myTest")).getFirstName());
    List l = (List)request.getAttribute("registrationTypeList");
    for (Iterator it = l.iterator(); it.hasNext();) {
        out.println(((RegistrationType)it.next()).getDescription());
    }
%>

    <c:forEach items="${requestScope.registrationTypeList}" var="type">
        <c:out value="${type}" /><br />
    </c:forEach>

</body>
</html>
