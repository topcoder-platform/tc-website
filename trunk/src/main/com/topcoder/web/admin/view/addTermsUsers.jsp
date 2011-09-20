<%--
  - Author: isv
  - Version: 1.0 (Miscellaneous TC Improvements 1.0)
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page provides the form for adding new terms of use agreements for requested users.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${requestScope.ttit}" var="termsTitle"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">

<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<jsp:include page="top.jsp"/>
<table>
    <tr valign="top">
        <td>
            <jsp:include page="left.jsp"/>
        </td>
        <td>
            <c:choose>
                <c:when test="${not empty termsTitle}">
                    <jsp:include page="addUserTermsAgreementForm.jsp">
                        <jsp:param name="source" value="quick"/>
                    </jsp:include>
                </c:when>
                <c:otherwise>The specified terms of use was not found.</c:otherwise>
            </c:choose>
        </td>
    </tr>
</table>
</body>
</html>
