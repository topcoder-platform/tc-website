<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
			<td><b>ID:</b></td>
			<td><c:out value="${payment.header.id}" /></td>
		</tr>

</table>

<jsp:include page="InternalFooter.jsp" flush="true" />
</body>
</html>
