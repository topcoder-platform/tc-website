<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.topcoder.web.common.BaseProcessor" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<c:set var="statusList" value="<%= request.getAttribute(PactsConstants.STATUS_CODE_LIST) %>" />
<c:set var="paymentList" value="<%= request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT) %>" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>PACTS - Payment List</title>
</head>
<body>
<h1>PACTS</h1>
<h2>Payment List</h2>

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
		<td><b>Reviewed</b></td>
	</tr>
	<c:forEach var="payment" items="${paymentList}">
		<tr>
		<td></td>
		<td><c:out value="${payment.user.first}" /></td>
		<td><c:out value="${payment.user.last}" /></td>
		<td><a href="${pacts:viewUser(payment.user.id)}"><c:out value="${payment.user.handle}" /></td>
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
		<td><b>Reviewed</b></td>
		</tr>
=	</c:forEach>
	
	</table>

           <tc-webtag:rscSelect name="status_id" list="${statusList}" fieldText="status_desc" fieldValue="status_id" useTopValue="false" />        


<jsp:include page="InternalFooter.jsp" flush="true"/>
</body>
</html>