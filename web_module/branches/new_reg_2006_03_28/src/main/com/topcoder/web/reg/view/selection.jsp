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

<%
    List l = (List)request.getAttribute("registrationTypeList");
    for (Iterator it = l.iterator(); it.hasNext();) {
        out.println(((RegistrationType)it.next()).getDescription());
    }
%>
<c:out value="${1+3}"/>
    

</body>
</html>
