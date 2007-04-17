<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.PaymentList" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<c:set var="statusList" value="<%= request.getAttribute(PactsConstants.STATUS_CODE_LIST) %>" />
<c:set var="paymentList" value="<%= request.getAttribute(PaymentList.PAYMENTS) %>" />
<c:set var="reliabilityMap" value="<%= request.getAttribute(PaymentList.RELIABILITY) %>" />
<c:set var="groupReliability" value="<%= request.getAttribute(PaymentList.GROUP_RELIABILITY) %>" />
<c:set var="toggleGroupReliability" value="<%= request.getAttribute(PaymentList.TOGGLE_GROUP_RELIABILITY) %>" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>PACTS - Payment List</title>
</head>
<body>
<script type="text/javascript">
<!--
  function checkAll(check) {
    var elements = document.f.elements;
    for (i=0; i<document.f.elements.length; i++) {
      if (document.f.elements[i].type=="checkbox") {
        document.f.elements[i].checked = (check==true);
      }
    }
  }
-->
</script>

<h1>PACTS</h1>
<h2>Payment List</h2>
${fn:length(paymentList)} records. <br />

<form name="f" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="POST">
	<input type=hidden name="<%=PactsConstants.TASK_STRING%>" value="<%=PactsConstants.PAYMENT_TASK%>">
	<input type=hidden name="query" value="${query}">

	<a href="${toggleGroupReliability}">
		<c:choose>
			<c:when test="${groupReliability}">Ungroup components and reliabilities</c:when>
			<c:otherwise>Group components with their reliabilities</c:otherwise>
		</c:choose>
	</a><br>

<a href="Javascript:checkAll(true)">check all</a> -
 <a href="Javascript:checkAll(false)">uncheck all</a> <br>

<c:set var="totalNet" value="0" />
<table id="datatable" border="0" cellpadding="5" cellspacing="0">
	<tr>
		<td></td>
		<td><b>First</b></td>
		<td><b>Last</b></td>
		<td><b>User</b></td>
		<td><b>Description</b></td>
		<td><b>Gross</b></td>
		<td><b>Tax</b></td>
		<td><b>Net</b></td>
		<td><b>Type</b></td>
		<td><b>Method</b></td>
		<td><b>Status</b></td>
		<td><b>Client</b></td>
		<td><b>Created</b></td>
		<td><b>Modified</b></td>
<%-- 		<td><b>Reviewed</b></td>  --%>
	</tr>
	<c:forEach var="payment" items="${paymentList}">
			<c:set var="composed" value="false" />	
			<c:set var="mark" value="" />
			<c:if test="${not empty reliabilityMap[payment.id]}"> 	
				<c:set var="composed" value="true" />			
				<c:set var="mark" value="*" />
			</c:if>
		<c:set var="totalNet" value="${totalNet + payment.recentNetAmount}" />
		<tr>
		<td> <c:choose>
				<c:when test="${composed}">
					<input type="checkbox" name="payment_id" value="${payment.id},${reliabilityMap[payment.id]}" checked></c:when>
				<c:otherwise>
					<input type="checkbox" name="payment_id" value="${payment.id}" checked></c:otherwise>
			</c:choose>
		
		</td>
		<td><c:out value="${payment.user.first}" /></td>
		<td><c:out value="${payment.user.last}" /></td>
		<td><a href="${pacts:viewUser(payment.user.id)}"><c:out value="${payment.user.handle}" /></td>
		<td><a href="${pacts:viewPayment(payment.id)}"><c:out value="${payment.description}" /></a>
			<c:if test="${composed}"> + 
			     <a href="${pacts:viewPayment(reliabilityMap[payment.id])}">Reliability</a>
			</c:if>
		</td>
		<td align="right" nowrap>$<fmt:formatNumber value="${payment.recentGrossAmount}" pattern="###,##0.00" /><c:out value="${mark}" /></td>
		<td align="right" nowrap>$<fmt:formatNumber value="${payment.recentGrossAmount - payment.recentNetAmount}" pattern="###,##0.00" /><c:out value="${mark}" /></td>
		<td align="right" nowrap>$<fmt:formatNumber value="${payment.recentNetAmount}" pattern="###,##0.00" /><c:out value="${mark}" /></td>
		<td><c:out value="${payment.type}" /></td>
		<td><c:out value="${payment.method}" /></td>
		<td><c:out value="${payment.recentStatus}" /></td>
		<td><c:out value="${payment.client}" /></td>
		<td><c:out value="${payment.createDate}" /> </td>
		<td><c:out value="${payment.modifyDate}" /> </td>
<%-- 		<td><c:choose>
				<c:when test="${payment.reviewed}">Yes</c:when>
				<c:otherwise>No</c:otherwise>
			</c:choose>
		</td> --%>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="7"><b>Total Net Amount:</b>
		</td>
		<td align="right" nowrap>$<fmt:formatNumber value="${totalNet}" pattern="###,###.00" /></td>
		<td colspan="7"></td>
	</tr>
	
	</table>
<a href="Javascript:checkAll(true)">check all</a> -
 <a href="Javascript:checkAll(false)">uncheck all</a> <br>
<br>

<%--<input type="submit" name="<%=PactsConstants.CMD_STRING %>" value="<%=PactsConstants.REVIEW_CMD  %>"><br><br> --%>
<input type="submit" name="<%=PactsConstants.CMD_STRING %>" value="<%=PactsConstants.STATUS_CMD  %>">

           <tc-webtag:rscSelect name="status_id" list="${statusList}" fieldText="status_desc" fieldValue="status_id" useTopValue="false" /> <br><br>


</form>
<jsp:include page="InternalFooter.jsp" flush="true"/>
</body>
</html>