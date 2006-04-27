<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.topcoder.web.reg.model.RegistrationType"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registration</title>
</head>

<body>

<jsp:useBean id="registrationTypeList" scope="request" type="java.util.List" />
<%
    for (Iterator it = registrationTypeList.iterator(); it.hasNext();) {
        RegistrationType type = (RegistrationType)it.next();
%>
<c:out value="${type.description}" />
<%
        out.println(type.getDescription());
        %> <br /> <%
    }

    String s= "kickass";
%>
    <c:out value="${s}"/>
<c:out value="${s}" />


    <c:forEach items="${registrationTypeList}" var="type">
        <c:out value="${1}" />
        <c:out value="${type.description}" /><br />
    </c:forEach>

</body>
</html>
