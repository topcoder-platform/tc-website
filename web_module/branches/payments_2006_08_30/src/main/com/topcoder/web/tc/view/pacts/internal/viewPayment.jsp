<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="pacts.tld" prefix="pacts-tag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>View Payment</title>
</head>
<body>


<c:set var="payment" value="${requestScope.payment}"/>

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
<!--  
		
		if (!payment.getHeader().getType().equals("Component Payment") &&
				!payment.getHeader().getType().equals("Review Board Payment")) -->
				<!--  to do format! -->
		<tr>
			<td><b>Gross Amount:</b></td>
			<td><c:out value="${payment.grossAmount}" /></td>
		</tr>
		<tr>
			<td><b>Tax:</b></td>
			<td><c:out value="${payment.grossAmount - payment.netAmount}" /></td>
		</tr>
<!-- end if -->
		
		<tr>
			<td><b>Net Amount:</b></td>
			<td><c:out value="${payment.netAmount}" /></td>
		</tr>
		
</table>

<jsp:include page="InternalFooter.jsp" flush="true" />
</body>
</html>
