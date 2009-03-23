<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
<h2>Assignment Document List</h2>

<c:choose>
    <c:when test="${empty result}">
        no results matched your query<br/>
    </c:when>
    <c:otherwise>
        <table border="0" cellpadding="5" cellspacing="5">
            <tr>
                <td><b>User</b></td>
                <td><b>Submission Title</b></td>
                <td><b>Type</b></td>
                <td><b>Status</b></td>
                <td><b>Hard Copy</b></td>
                <td><b>Expire Date</b></td>
                <td><b>Affirmed Date</b></td>
                <td><b>Create Date</b></td>
                <td><b>Modify Date</b></td>
            </tr>
            
            <c:forEach items="${result}" var="ad">
                <tr>
                <td><a href="${pacts:viewUser(ad.user.id)}">${ad.user.handle}</a></td>
                <td><a href="${pacts:viewAssignmentDocument(ad.id)}"><c:out value="${ad.submissionTitle}"/></a></td>
                <td><c:out value="${ad.type.description}"/></td>
                <td><c:out value="${ad.status.description}"/></td>
                <td>
                <c:choose>
                    <c:when test="${ad.hardCopy}">Yes</c:when>
                    <c:otherwise>No</c:otherwise>
                </c:choose>
                </td>
                <td><fmt:formatDate value="${ad.expireDate}" pattern="MM/dd/yyyy"/></td>
                <td><fmt:formatDate value="${ad.affirmedDate}" pattern="MM/dd/yyyy"/></td>
                <td><fmt:formatDate value="${ad.createDate}" pattern="MM/dd/yyyy"/></td>
                <td><fmt:formatDate value="${ad.modifyDate}" pattern="MM/dd/yyyy"/></td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>


<jsp:include page="InternalFooter.jsp" flush="true" />
</body>

</html>
