<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>View Payment</title>
</head>
<body>


<c:set var="payment" value="<%= request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT) %>"/>
<c:set var="notes" value="<%= request.getAttribute(PactsConstants.NOTE_HEADER_LIST) %>"/>
<c:set var="COMPONENT_PAYMENT" value="<%= PactsConstants.COMPONENT_PAYMENT + "" %>" />
<c:set var="REVIEW_BOARD_PAYMENT" value="<%= PactsConstants.REVIEW_BOARD_PAYMENT + "" %>" />

<h1>PACTS</h1>
<h2>View Payment</h2>

		<table border="0" cellpadding="2" cellspacing="2">
		<tr>
			<td><b>ID:</b></td>
			<td><c:out value="${payment.header.id}" /></td>
		</tr>
		<tr>
			<td><b>User</b></td>
			<td><a href="${pacts:viewUser(payment.header.user.id)}"><c:out value="${payment.header.user.handle}" /></td>
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
<c:if test="${payment.charity }">
		<tr>		
			<td><b></b></td>
			<td><em>This payment was given to charity</em></td>
		</tr>
</c:if>
				
		<tr>		
			<td><b>Method:</b></td>
			<td><c:out value="${payment.header.method}" /></td>
		</tr>
<c:if test="${payment.header.typeId != COMPONENT_PAYMENT and payment.header.typeId != REVIEW_BOARD_PAYMENT}">
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
			<td><c:out value="${requestScope.creation_date}" /> </td>
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
<c:if test="${payment.header.parentPaymentId > 0}">
		<tr>
			<td><b>Parent Payment ID:</b></td>
			<td><c:out value="${payment.header.parentPaymentId}" /></td>
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

<c:if test="${not empty notes}">
	<br/>
	<form action="<%= PactsConstants.INTERNAL_SERVLET_URL %>" method="post">
		<input type="hidden" name="t" value="view" />
		<input type="hidden" name="c" value="note" />
		<input type="submit" value="View Note" />
		
		<select name="<%= PactsConstants.NOTE_ID %>">
			<c:forEach var="note" items="${notes}">
				<option value="${note.id}"><c:out value="${note.creationDate}"/> by <c:out value="${note.user.handle}"/></option>
			</c:forEach>
		</select>
	</form>
</c:if>

<br/>

<a href="${pacts:addAffidavitForPayment(payment.header.user.id, payment.header.id)}">Add Affidavit for the Payment</a>
<br/>

<a href="PactsInternalServlet?t=view&c=payment_audit_trail&payment_id=${payment.header.id}">View Audit Trail</a>
<br/>

<a href="PactsInternalServlet?t=add&c=note&object_id=${payment.header.id}&user_id=${payment.header.user.id}&object_type=<%= PactsConstants.PAYMENT_OBJ %>">Add Note</a>
<br/>

<a href="${pacts:updatePayment(payment.header.id)}">Update Payment</a>
<br/>

<a href="PactsInternalServlet?t=payments&c=Review Selected Payments&payment_id=${payment.header.id}&query=PactsInternalServlet%3Ft%3Dview%26c%3Dpayment%26payment_id%3d${payment.header.id}%26individual_payment%3D1">Review Payment</a>
<br/>

<jsp:include page="InternalFooter.jsp" flush="true" />
</body>
</html>
