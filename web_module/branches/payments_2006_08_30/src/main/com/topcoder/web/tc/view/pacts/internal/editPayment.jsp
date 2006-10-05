<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>View Payment</title>
</head>
<body>


<c:set var="payment" value="<%= request.getAttribute(PactsConstants.PAYMENT) %>"/>
<c:set var="user" value="<%= request.getAttribute(PactsConstants.USER) %>"/>
<c:set var="updating" value="${not empty payment}" />
<c:set var="adding" value="${empty payment}" />
<c:set var="statusList" value="<%= request.getAttribute(PactsConstants.ROUND_LIST) %>" />

<h1>PACTS</h1>
<c:if test="updating">
	<h2>Update Payment</h2>
</c:if>	
<c:if test="adding">
	<h2>Add Payment</h2>
</c:if>	

<form name="f" action="<%= PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
<input type="hidden" name="module" value="UpdatePayment">

<table border="0" cellpadding="2" cellspacing="2">
<c:if test="updating">
	<tr>
		<td><b>ID:</b></td>
		<td><c:out value="${payment.header.id}" />	
			<input type="hidden" name="payment_id" value="{payment.header.id}"></td>
	</tr>
</c:if>
	<tr>
		<td><b>User</b></td>
		<td><a href="${pacts:viewUser(user.id)}"><c:out value="${user.handle}" /></td>
	</tr>
    <tr>
        <td><b>Status:</b></td>
        <td>
	       <tc-webtag:rscSelect name="status_id" list="${statusList}" 
    	        fieldText="status_desc" fieldValue="status_id" useTopValue="false" />        
        </td>
	</tr>
    <tr>
        <td><b>Description:</b></td>
        <td>
	        <tc-webtag:textInput name="payment_desc" size="60" editable="true" />
        </td>
    </tr>	
</table>

<input type="submit" value="Save Payment">
</form>

<jsp:include page="InternalFooter.jsp" flush="true"/>

</body>
</html>