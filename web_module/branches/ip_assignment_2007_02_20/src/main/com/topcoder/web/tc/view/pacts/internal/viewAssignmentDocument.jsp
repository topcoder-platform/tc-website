<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>View Assignment Document</title>
</head>
<body>

<c:set var="assignment_document" value="<%= request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT) %>"/>

<h1>PACTS</h1>
<h2>View Assignment Document</h2>

		<table border="0" cellpadding="2" cellspacing="2">
		<tr>
			<td><b>ID:</b></td>
			<td><c:out value="${assignment_document.id}" /></td>
		</tr>
		<tr>
			<td><b>User</b></td>
			<td><a href="${pacts:viewUser(assignment_document.user.id)}">${assignment_document.user.handle}</a></td>
		</tr>
		<tr>		
			<td><b>Type:</b></td>
			<td><c:out value="${assignment_document.type.description}" /></td>
		</tr>
        <tr>        
            <td><b>Status:</b></td>
            <td><c:out value="${assignment_document.status.description}" /></td>
        </tr>
        <tr>        
            <td><b>Text:</b></td>
            <td><c:out value="${assignment_document.text}" /></td>
        </tr>
        <c:if test="${assignment_document.studioContestId > 0}">
                <tr>
                    <td><b>Studio Contest ID:</b></td>
                    <td><c:out value="${assignment_document.studioContestId}" /></td>
                </tr>
        </c:if>
        <c:if test="${assignment_document.componentProjectId > 0}">
                <tr>
                    <td><b>Component Project ID:</b></td>
                    <td><c:out value="${assignment_document.componentProjectId}" /></td>
                </tr>
        </c:if>
        <tr>        
            <td><b>Affirmed Date:</b></td>
            <td><fmt:formatNumber value="${assignment_document.affirmedDate}" pattern="MM/dd/yyyy"/></td>
        </tr>        
        <tr>        
            <td><b>Expire Date:</b></td>
            <td><fmt:formatNumber value="${assignment_document.expireDate}" pattern="MM/dd/yyyy"/></td>
        </tr>
   
</table>

<br/>

<a href="${pacts:updateAssignmentDocument(assignment_document.id)}">Update Assignment Document</a>
<br/>

<jsp:include page="InternalFooter.jsp" flush="true" />
</body>
</html>
