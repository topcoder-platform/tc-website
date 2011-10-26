<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.topcoder.web.common.BaseProcessor" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update Payment Status</title>
    
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
         
</head>
<body>

<h1>PACTS</h1>
    <h2>Payment to update status</h2>

<form name="f" action="<%= PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
   <input type="hidden" name="module" value="UpdatePaymentStatus">
   <input type="hidden" name="payment_id" value="${payment.id}">

<table border="0" cellpadding="3" cellspacing="3">
    <tr>
        <td width="180"><b>ID:</b></td>
        <td>
            <c:out value="${payment.id}" />  
        </td>
    </tr>
    <tr>
        <td width="180"><b>User</b></td>
        <td><a href="${pacts:viewUser(user.id)}"><c:out value="${user.handle}" /></td>
    </tr>
        <tr>        
            <td><b>Description:</b></td>
            <td><c:out value="${payment.description}" /></td>
        </tr>
        <tr>        
            <td><b>Status:</b></td>
            <td>
                <c:out value="${payment.currentStatus.desc}"/>
                <c:out value="${payment.currentStatus.reasonsText}"/>
            </td>
        </tr>
        <tr>        
            <td><b>Type:</b></td>
            <td><c:out value="${payment.paymentTypeDesc}" /></td>
        </tr>
</table>
<h2>Select new status and reasons</h2>
<p>
    <font color="red">
    <b>* Warning:</b> no check will be made for this status update. This action can break the regular payment process flow.
    </font>
</p>
<table border="0" cellpadding="3" cellspacing="3">
        <tr>
            <td><b>Status:</b></td>
            <td>
                <SELECT CLASS="dropdown" NAME="new_status_id">
                    <c:forEach items="${payment_status_list}" var="statusItem">
                        <OPTION value='${statusItem.id}'>
                            ${statusItem.desc}
                        </OPTION>
                    </c:forEach>
                </SELECT>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <SELECT CLASS="dropdown" NAME="new_status_reason_id" multiple size=6>
                    <c:forEach items="${payment_status_reason_list}" var="statusReasonItem">
                        <OPTION value='${statusReasonItem.id}'>
                            ${statusReasonItem.desc}
                        </OPTION>
                    </c:forEach>
                </SELECT>
            </td>
        </tr>
</table>
<br>

<input type="submit" value="Update payment status">
</form>

<br>

<jsp:include page="InternalFooter.jsp" flush="true"/>

</body>
</html>