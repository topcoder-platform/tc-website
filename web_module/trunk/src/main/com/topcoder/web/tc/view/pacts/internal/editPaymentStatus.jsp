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
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>         

    <script type="text/javascript">

        function statusChanged()
        {
            var e = document.getElementsByName("new_status_id")[0];
            var selectedValue = e.options[e.selectedIndex].value;

            if (selectedValue == '53') {
                document.getElementsByName("pay_date_section")[0].style.display = 'inline';
            } else {
                document.getElementsByName("pay_date_section")[0].style.display = 'none';
            }
        }

    </script>

</head>
<body>

<h1>PACTS</h1>
    <h2>Payment to update status</h2>
    
    <tc-webtag:errorIterator id="err" name="error">
        <font color="#FF0000"><%=err%></font>
    </tc-webtag:errorIterator>

<form name="f" action="<%= PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
   <input type="hidden" name="module" value="EditPaymentStatus">
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
                <SELECT CLASS="dropdown" NAME="new_status_id" onChange="statusChanged()">
                    <c:forEach items="${payment_status_list}" var="statusItem">
                        <OPTION value='${statusItem.id}'>
                            ${statusItem.desc}
                        </OPTION>
                    </c:forEach>
                </SELECT>
                <div name="pay_date_section" style="display:none;">
                    &nbsp;&nbsp;
                    Pay Date: <tc-webtag:textInput name="pay_date" id="pay_date" size="12" editable="true" />
                    <button id="trigger_pay_date">Set</button>
                </div>
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

<script language="javascript" type="text/javascript">
    <!--
Calendar.setup(
{
 inputField  : "pay_date",  
                    ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",
                    button      : "trigger_pay_date",
                    showsTime   : false,
                    singleClick  : false,
                    cache       : true
}
);
                -->
</script>

</body>
</html>