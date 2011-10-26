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

<c:set var="referred" value="<%= request.getAttribute("referred") %>"/>
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
			<td><a href="${pacts:viewUser(payment.header.user.id)}"><c:out value="${payment.header.user.handle}" /></a></td>
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
			<td>
                <c:out value="${payment.currentStatus.desc}"/>
                <c:out value="${payment.currentStatus.reasonsText}"/>
	        </td>
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
<c:choose>
	<c:when test="${payment.netAmount != payment.totalAmount or payment.installmentNumber > 1}">
		<tr>
			<td><b>Total Gross Amount:</b></td>
			<td>$<fmt:formatNumber value="${payment.totalAmount}" pattern="###,##0.000" /></td>
		</tr>
		<tr>
			<td><b>Installment Number:</b></td>
			<td><fmt:formatNumber value="${payment.installmentNumber}" pattern="##0" /></td>
		</tr>
		<tr>
			<td><b>Installment Gross Amount:</b></td>
			<td>$<fmt:formatNumber value="${payment.grossAmount}" pattern="###,##0.00" /></td>
		</tr>
		<tr>
			<td><b>Tax:</b></td>
			<td>$<fmt:formatNumber value="${payment.grossAmount - payment.netAmount}" pattern="###0.00" /></td>
		</tr>

		<tr>
			<td><b>Installment Net Amount:</b></td>
			<td>$<fmt:formatNumber value="${payment.netAmount}" pattern="###,##0.00" /></td>
		</tr>
	</c:when>
	<c:otherwise>
		<tr>
			<td><b>Gross Amount:</b></td>
			<td>$<fmt:formatNumber value="${payment.grossAmount}" pattern="###,##0.00" /></td>
		</tr>
		<tr>
			<td><b>Tax:</b></td>
			<td>$<fmt:formatNumber value="${payment.grossAmount - payment.netAmount}" pattern="###0.00" /></td>
		</tr>
	
		<tr>
			<td><b>Net Amount:</b></td>
			<td>$<fmt:formatNumber value="${payment.netAmount}" pattern="###,##0.00" /></td>
		</tr>
	</c:otherwise>
</c:choose>

		<tr>
			<td><b>Date Created:</b></td>
			<td><c:out value="${payment.header.createDate}" /> </td>
		</tr>
		<tr>
			<td><b>Date Modified:</b></td>
			<td><c:out value="${payment.header.modifyDate}" /> </td>
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
			<td><b>Parent Payment Id:</b></td>
			<td><a href="${pacts:viewPayment(payment.header.parentPaymentId)}">
				<c:out value="${payment.header.parentPaymentId}" />
				</a>
				</td>
		</tr>
</c:if>
<c:if test="${payment.invoiceNumber ne null and not empty payment.invoiceNumber }">
		<tr>
			<td><b>Invoice:</b></td>
			<td><c:out value="${payment.invoiceNumber}" /></td>
		</tr>
</c:if>
<%-- 		<tr>
			<td><b>Reviewed:</b></td>
			<td>
				<c:choose>
					<c:when test="${payment.header.reviewed}">Yes</c:when>
					<c:otherwise>No</c:otherwise>
				</c:choose>
			</td>
		</tr>		--%>
<c:if test="${not empty referred}">
		<tr>
			<td><b>Paid referal to:</b></td>
			<td>
			<a href="${pacts:viewUser(referred.header.user.id)}"><c:out value="${referred.header.user.handle}" /></a>
			 for <fmt:formatNumber value="${referred.grossAmount}" pattern="#.00" />
			(Payment
			<a href="${pacts:viewPayment(referred.header.id)}"><c:out value="${referred.header.id}" /></a>)
				</td>
		</tr>
</c:if>

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

<a href="${pacts:updatePaymentStatus(payment.header.id)}">Update Payment Status</a>
<br/>

<jsp:include page="InternalFooter.jsp" flush="true" />
</body>
</html>
