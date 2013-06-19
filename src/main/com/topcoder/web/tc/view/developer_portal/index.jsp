<!-- Copyright (C) 2013 TopCoder Inc., All Rights Reserved. -->
<!-- @author gevak -->
<!-- @version 1.0 -->

<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Developer portals</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<p>
Developer portal SSO links:
</p>

<c:forEach items="${portalNames}" var="portalName">
    <p>
        <a href="/tc?module=DeveloperPortal&action=goToPortal&portalName=${portalName}">${portalName}</a>
    </p>
</c:forEach>

</body>

</html>
