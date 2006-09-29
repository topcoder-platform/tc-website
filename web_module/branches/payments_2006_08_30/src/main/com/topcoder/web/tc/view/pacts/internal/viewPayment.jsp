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
<c:set var="header" value="${payment.header}"/>

<h1>PACTS</h1>
<h2>View Payment</h2>

		<table border="0" cellpadding="2" cellspacing="2">
		<tr>
			<td><b>ID:</b></td>
			<td><c:out value="${header.id}" /></td>
		</tr>
		<tr>
			<td><b>User</b></td>
			<td><pacts-tag:handle coderId="${header.user.id}" handle="${header.user.handle}"/>
		</tr>
		<tr>		
			<td><b>Description:</b></td>
			<td><c:out value="${payment.header.description}" /></td>
		</tr>
<c:if test="${not empty header.client }">
		<tr>		
			<td><b>Client:</b></td>
			<td><c:out value="${header.client}" /></td>
		</tr>
</c:if>
		<tr>		
			<td><b>Status:</b></td>
			<td><c:out value="${payment.statusDesc}" /></td>
		</tr>
		<tr>		
			<td><b>Type:</b></td>
			<td><c:out value="${header.type}" /></td>
		</tr>
		<tr>		
			<td><b>Method:</b></td>
			<td><c:out value="${header.method}" /></td>
		</tr>
		
</table>

<jsp:include page="InternalFooter.jsp" flush="true" />
</body>
</html>
