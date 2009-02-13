<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*,
                 com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentType" %>
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
<c:set var="STUDIO_CONTEST_TYPE_ID" value="<%= AssignmentDocumentType.STUDIO_CONTEST_TYPE_ID + "" %>" />
<c:set var="ASSIGNMENT_DOCUMENT_ID" value="<%= PactsConstants.ASSIGNMENT_DOCUMENT_ID + "" %>" />
<c:set var="COMPONENT_COMPETITION_TYPE_ID" value="<%= AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID + "" %>" />

<h1>PACTS</h1>
<h2>View Assignment Document</h2>

		<table border="0" cellpadding="2" cellspacing="2">
		<tr>
			<td><b>ID:</b></td>
			<td><c:out value="${assignment_document.id}"/></td>
		</tr>
		<tr>
			<td><b>User</b></td>
			<td><a href="${pacts:viewUser(assignment_document.user.id)}">${assignment_document.user.handle}</a></td>
		</tr>
		<tr>		
			<td><b>Type:</b></td>
			<td><c:out value="${assignment_document.type.description}"/></td>
		</tr>
        <tr>        
            <td><b>Status:</b></td>
            <td><c:out value="${assignment_document.status.description}"/></td>
        </tr>
        <tr>
            <td><b>Text:</b></td>
            <td>
                <c:choose>
                    <c:when test="${not empty assignment_document.text}">
                        <iframe width="590" height="300" marginWidth="5" src="/tc?module=Static&d1=pacts&d2=internal&d3=viewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}"></iframe>
                    </c:when>
                    <c:otherwise>
                        <i>(Text will be populated when the AD is affirmed and the template is transformed)</i>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>        
            <td><b>Hard Copy:</b></td>
            <td>
                <c:choose>
                    <c:when test="${assignment_document.hardCopy}">Yes</c:when>
                    <c:otherwise>No</c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>        
            <td><b>Submission title:</b></td>
            <td><c:out value="${assignment_document.submissionTitle}"/></td>
        </tr>
        <c:if test="${assignment_document.type.id == STUDIO_CONTEST_TYPE_ID}">
                <tr>
                    <td><b>Studio Contest referenced:</b></td>
                    <td><c:out value="${assignment_document.studioContest.name}"/></td>
                </tr>
        </c:if>
        <c:if test="${assignment_document.type.id == COMPONENT_COMPETITION_TYPE_ID}">
                <tr>
                    <td><b>Component Project referenced:</b></td>
                    <td><c:out value="${assignment_document.componentProject.description}" /></td>
                </tr>
        </c:if>
        <tr>        
            <td><b>Expire Date:</b></td>
            <td><fmt:formatDate value="${assignment_document.expireDate}" pattern="MM/dd/yyyy"/></td>
        </tr>
        <tr>        
            <td><b>Affirmed Date:</b></td>
            <td><fmt:formatDate value="${assignment_document.affirmedDate}" pattern="MM/dd/yyyy"/></td>
        </tr>        
        <tr>        
            <td><b>Create Date:</b></td>
            <td><fmt:formatDate value="${assignment_document.createDate}" pattern="MM/dd/yyyy"/></td>
        </tr>
        <tr>        
            <td><b>Modify Date:</b></td>
            <td><fmt:formatDate value="${assignment_document.modifyDate}" pattern="MM/dd/yyyy"/></td>
        </tr>        
   
</table>

<br/>

<a href="${pacts:updateAssignmentDocument(assignment_document.id)}">Update Assignment Document</a>
<br/>

<jsp:include page="InternalFooter.jsp" flush="true" />
</body>
</html>
