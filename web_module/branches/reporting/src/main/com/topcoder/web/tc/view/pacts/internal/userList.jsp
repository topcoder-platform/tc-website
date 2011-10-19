<%--
  - Author: isv
  - Version: 1.1 (Member Payment Improvements Release assembly v1.0)
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the list of the user accounts matching the selected criteria.
  -
  - Member Payment Improvements Release assembly v1.0 changes:
  - Added column named Status listing the current status for displayed user accounts. Also the scriptlet code has
  - been replacted with JSTL/EL tags and expression equivalents
--%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="PACTS_INTERNAL_RESULT" value="<%=PactsConstants.PACTS_INTERNAL_RESULT%>"/>
<c:set var="DECIMAL_FORMAT_STRING" value="<%=PactsConstants.DECIMAL_FORMAT_STRING%>"/>
<c:set var="INTERNAL_SERVLET_URL" value="<%=PactsConstants.INTERNAL_SERVLET_URL%>"/>
<c:set var="TASK_STRING" value="<%=PactsConstants.TASK_STRING%>"/>
<c:set var="VIEW_TASK" value="<%=PactsConstants.VIEW_TASK%>"/>
<c:set var="CMD_STRING" value="<%=PactsConstants.CMD_STRING%>"/>
<c:set var="USER_CMD" value="<%=PactsConstants.USER_CMD%>"/>
<c:set var="USER_ID" value="<%=PactsConstants.USER_ID%>"/>
<c:set var="userList" value="${requestScope[PACTS_INTERNAL_RESULT]}"/>

<html>

<head>
    <meta http-equiv="Content-Language" content="en-us">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta name="GENERATOR" content="Microsoft FrontPage 4.0">
    <meta name="ProgId" content="FrontPage.Editor.Document">
    <title>PACTS</title>
</head>

<body>

<h1>PACTS</h1>

<h2>User List</h2>
<c:choose>
    <c:when test="${empty userList}">
        <c:if test="${userList eq null}">no list!!!<br/></c:if>
        no results matched your query<br/>
    </c:when>
    <c:otherwise>
        <table border="0" cellpadding="5" cellspacing="5">
            <tr>
                <td><b>User</b></td>
                <td><b>Last Name</b></td>
                <td><b>First Name</b></td>
                <td><b>Middle Name</b></td>
                <td><b>Accrual Amount</b></td>
                <td><b>Status</b></td>
            </tr>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>
                        <a href="${INTERNAL_SERVLET_URL}?${TASK_STRING}=${VIEW_TASK}&amp;${CMD_STRING}=${USER_CMD}&amp;${USER_ID}=${user.id}">
                            <c:out value="${user.handle}"/></a>
                    </td>
                    <td><c:out value="${user.last}"/></td>
                    <td><c:out value="${user.first}"/></td>
                    <td><c:out value="${user.middle}"/></td>
                    <td><fmt:formatNumber value="${user.accrualAmount}" pattern="${DECIMAL_FORMAT_STRING}"/></td>
                    <td><c:out value="${user.status}"/></td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>
<jsp:include page="InternalFooter.jsp" flush="true"/>
</body>
</html>
