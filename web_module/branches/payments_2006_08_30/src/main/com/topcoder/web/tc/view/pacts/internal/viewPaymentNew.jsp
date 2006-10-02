<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts-tag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>View Payment</title>
</head>
<body>


<c:set var="payment" value="${requestScope.payment}"/>
<c:set var="COMPONENT_PAYMENT" value="<%= PactsConstants.COMPONENT_PAYMENT %>" />
<c:set var="REVIEW_BOARD_PAYMENT" value="<%= PactsConstants.REVIEW_BOARD_PAYMENT %>" />

<h1>PACTS</h1>
<h2>View Payment</h2>

		<table border="0" cellpadding="2" cellspacing="2">
		<tr>
			<td><b>ID:</b></td>
			<td><c:out value="${payment.header.id}" /></td>
		</tr>
		<tr>
			<td><b>User</b></td>
			<td><pacts-tag:handle coderId="${payment.header.user.id}" handle="${payment.header.user.handle}"/>
		</tr>
		<tr>		
			<td><b>Description:</b></td>
			<td><c:out value="${payment.header.description}" /></td>
		</tr>
<c:if test="${not empty payment.header.client }">
		<tr>		
			<td><b>Client:</b></td>
			<td><c:out value="${payment.header.client}" /></td>
		</tr>
</c:if>
		<tr>		
			<td><b>Status:</b></td>
			<td><c:out value="${payment.statusDesc}" /></td>
		</tr>
		<tr>		
			<td><b>Type:</b></td>
			<td><c:out value="${payment.header.type}" /></td>
		</tr>
		<tr>		
			<td><b>Method:</b></td>
			<td><c:out value="${payment.header.method}" /></td>
		</tr>
<c:if test="${payment.header.typeId == COMPONENT_PAYMENT or payment.header.typeId == REVIEW_BOARD_PAYMENT}">
		<tr>
			<td><b>Gross Amount:</b></td>
			<td><fmt:formatNumber value="${payment.grossAmount}" pattern="###,###.00" /></td>
		</tr>
		<tr>
			<td><b>Tax:</b></td>
			<td><fmt:formatNumber value="${payment.grossAmount - payment.netAmount}" pattern="####.00" /></td>
		</tr>
</c:if>
		<tr>
			<td><b>Net Amount:</b></td>
			<td><fmt:formatNumber value="${payment.netAmount}" pattern="#.00" /></td>
		</tr>
		<tr>
			<td><b>Date Created:</b></td>
			<td><fmt:formatDate value="${requestScope.creation_date}" pattern="<%= PactsConstants.DATE_FORMAT_STRING %>"/> </td>
		</tr>
		<tr>
			<td><b>Date Due:</b></td>
			<td><c:out value="${payment.dueDate}" /></td>
		</tr>
		<tr>
			<td><b>Date Paid:</b></td>
			<td><c:out value="${payment.payDate}" /></td>
		</tr>
<c:if test="${payment.header.algorithmRoundId > 0}">
		<tr>
			<td><b>Round ID:</b></td>
			<td><c:out value="${payment.header.algorithmRoundId}" /></td>
		</tr>
</c:if>
<c:if test="${payment.header.componentProjectId > 0}">
		<tr>
			<td><b>Project ID:</b></td>
			<td><c:out value="${payment.header.componentProjectId}" /></td>
		</tr>
</c:if>
<c:if test="${payment.header.algorithmProblemId > 0}">
		<tr>
			<td><b>Problem ID:</b></td>
			<td><c:out value="${payment.header.algorithmProblemId}" /></td>
		</tr>
</c:if>
<c:if test="${payment.header.studioContestId > 0}">
		<tr>
			<td><b>Studio Contest ID:</b></td>
			<td><c:out value="${payment.header.studioContestId}" /></td>
		</tr>
</c:if>
<c:if test="${payment.header.componentContestId > 0}">
		<tr>
			<td><b>Contest ID:</b></td>
			<td><c:out value="${payment.header.componentContestId}" /></td>
		</tr>
</c:if>
<c:if test="${payment.header.digitalRunStageId > 0}">
		<tr>
			<td><b>Stage ID:</b></td>
			<td><c:out value="${payment.header.digitalRunStageId}" /></td>
		</tr>
</c:if>
<c:if test="${payment.header.digitalRunSeasonId > 0}">
		<tr>
			<td><b>Season ID:</b></td>
			<td><c:out value="${payment.header.digitalRunSeasonId}" /></td>
		</tr>
</c:if>
<c:if test="${payment.header.parentReferenceId > 0}">
		<tr>
			<td><b>Parent Payment ID:</b></td>
			<td><c:out value="${payment.header.parentReferenceId}" /></td>
		</tr>
</c:if>
		<tr>
			<td><b>Reviewed:</b></td>
			<td>
				<c:choose>
					<c:when test="${payment.header.reviewed}">Yes</c:when>
					<c:otherwise>No</c:otherwise>
				</c:choose>
			</td>
		</tr>
		
</table>

<jsp:include page="InternalFooter.jsp" flush="true" />
</body>
</html>
