<!-- Copyright (C) 2013 TopCoder Inc., All Rights Reserved. -->
<!-- @author gevak -->
<!-- @version 1.0 -->

<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Developer portal welcome page</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<p>
You are not yet registed at developer portals. Please choose one of the following options:
</p>

<p>
<a href="/tc?module=DeveloperPortal&action=createUser">I want to use TopCoder Platform API.</a>
</p>

<p>
<a href="/tc">I don't want to use this cool API.</a>
</p>

</body>

</html>
