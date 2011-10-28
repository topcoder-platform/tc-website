<%--
  - Author: isv
  - Version: 1.1 (Member Payment Improvements Release assembly v1.0)
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the web form listing the payments matching the selected criteria. Each payment
  - record is accompanied with a checkbox used for selecting/de-selecting payment. Also a drop-down listing the
  - possible actions to be performed on selected payments is rendered.
  -
  - Member Payment Improvements Release assembly v1.0 changes:
  - Added client-side logic for calculating and displaying the total net amount for currently selected payments.
--%>

<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.PaymentList" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<%--<c:set var="statusList" value="<%= request.getAttribute(PactsConstants.STATUS_CODE_LIST) %>" />--%>
<c:set var="paymentList" value="<%= request.getAttribute(PaymentList.PAYMENTS) %>" />
<c:set var="reliabilityMap" value="<%= request.getAttribute(PaymentList.RELIABILITY) %>" />
<c:set var="groupReliability" value="<%= request.getAttribute(PaymentList.GROUP_RELIABILITY) %>" />
<c:set var="toggleGroupReliability" value="<%= request.getAttribute(PaymentList.TOGGLE_GROUP_RELIABILITY) %>" />
<c:set var="csvLink" value="<%= request.getAttribute(PaymentList.CSV_LINK) %>" />
<c:set var="travxmlLink" value="<%= request.getAttribute(PaymentList.TRAVELEX_XML_LINK) %>" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>PACTS - Payment List</title>
    <script type="text/javascript" src="/js/jquery-1.2.6.pack.js"></script>
    <script type="text/javascript" src="/js/jqueryFloatObject-1.2.js"></script>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script type="text/javascript">
        var NET_TOTAL = 0.00;
        $(document).ready(function(){
            $(".paymentCheckBox").click(function() {
                var checked = $(this).attr("checked");
                var payment = getNetPayment($(this).attr("id"));
                if (checked) {
                    NET_TOTAL += payment;
                } else {
                    NET_TOTAL -= payment;
                }
                displayNetTotal();
            });

            var elements = document.f.elements;
            for (i = 0; i < elements.length; i++) {
                if (elements[i].type == "checkbox") {
                    if (elements[i].checked) {
                        NET_TOTAL += getNetPayment(elements[i].getAttribute("id"));
                    }
                }
            }
            displayNetTotal();

            $("#NetTotalDiv").makeFloat({x:"current",y:"current", alwaysVisible: true, speed: "fast"});
        });

        function getNetPayment(jboxID) {
            var netAmountCellId = "#pna" + parseInt(jboxID.substr(3));
            var netAnountHtml = $(netAmountCellId).html();
            netAnountHtml = $.trim(netAnountHtml);
            if (netAnountHtml.charAt(0) == '$') {
                netAnountHtml = netAnountHtml.substr(1);
            }
            var netAmountText = '';
            for (var i = 0; i < netAnountHtml.length; i++ ) {
                var c = netAnountHtml.charAt(i);
                if (c >= '0' && c <= '9') {
                    netAmountText += c;
                }
            }

            var netAmount = parseFloat(netAmountText) / 100;
            return netAmount;
        }

        function displayNetTotal() {
            $("#NetTotalSpan").html("$" + NET_TOTAL.toFixed(2));
        }

        function checkAll(check) {
            NET_TOTAL = 0;
            var elements = document.f.elements;
            for (i = 0; i < elements.length; i++) {
                if (elements[i].type == "checkbox") {
                    elements[i].checked = (check == true);
                    if (check) {
                        NET_TOTAL += getNetPayment(elements[i].getAttribute("id"));
                    }
                }
            }
            displayNetTotal();
        }

        function eventChanged()
        {
            var e = document.getElementsByName("status_id")[0];
            var selectedValue = e.options[e.selectedIndex].value;

            if (selectedValue == '4') {
                document.getElementsByName("invoice_number_section")[0].style.visibility = 'visible';
            } else {
                document.getElementsByName("invoice_number_section")[0].style.visibility = 'hidden';
            }
        }

    </script>
    <style type="text/css">
        #NetTotalDiv {
            position: absolute;
            top: 10;
            right: 30;
            z-index: 10;
            background: #ffc;
            padding: 5px;
            border: 1px solid #CCCCCC;
            text-align: center;
            font-weight: bold;
            width: 120px;
        }
    </style>
</head>
<body>
<div id="NetTotalDiv">
    Net Total: <span id="NetTotalSpan">$100.00</span>
</div>
<table id="marginTable" border="0" cellpadding="0" cellspacing="10"  class="stat" width="100%">
<tr><td>
<h1>PACTS</h1>
<h2>Payment List</h2>
<p class="bigRed">
    ${message_result}
</p>

${fn:length(paymentList)} records. <br />

<form name="f" action="<%= PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
   <input type="hidden" name="module" value="NewPaymentEvent">
   <input type=hidden name="query" value="${query}">

    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.PAYMENT_ID%>" value="<%=request.getAttribute(PactsConstants.PAYMENT_ID).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.PROJECT_ID%>" value="<%=request.getAttribute(PactsConstants.PROJECT_ID).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.HANDLE%>" value="<%=request.getAttribute(PactsConstants.HANDLE).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.EARLIEST_CREATION_DATE%>" value="<%=request.getAttribute(PactsConstants.EARLIEST_CREATION_DATE).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.LATEST_CREATION_DATE%>" value="<%=request.getAttribute(PactsConstants.LATEST_CREATION_DATE).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.EARLIEST_MODIFICATION_DATE%>" value="<%=request.getAttribute(PactsConstants.EARLIEST_MODIFICATION_DATE).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.LATEST_MODIFICATION_DATE%>" value="<%=request.getAttribute(PactsConstants.LATEST_MODIFICATION_DATE).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.EARLIEST_PAY_DATE%>" value="<%=request.getAttribute(PactsConstants.EARLIEST_PAY_DATE).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.LATEST_PAY_DATE%>" value="<%=request.getAttribute(PactsConstants.LATEST_PAY_DATE).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.EARLIEST_DUE_DATE%>" value="<%=request.getAttribute(PactsConstants.EARLIEST_DUE_DATE).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.LATEST_DUE_DATE%>" value="<%=request.getAttribute(PactsConstants.LATEST_DUE_DATE).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.LOWEST_NET_AMOUNT%>" value="<%=request.getAttribute(PactsConstants.LOWEST_NET_AMOUNT).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.HIGHEST_NET_AMOUNT%>" value="<%=request.getAttribute(PactsConstants.HIGHEST_NET_AMOUNT).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.STATUS_CODE%>" value="<%=request.getAttribute(PactsConstants.STATUS_CODE).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.TYPE_CODE%>" value="<%=request.getAttribute(PactsConstants.TYPE_CODE).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.METHOD_CODE%>" value="<%=request.getAttribute(PactsConstants.METHOD_CODE).toString()%>"/>

    <tc-webtag:hiddenInput name="<%=PactsConstants.AFFIDAVIT_ID%>" value="<%=request.getAttribute(PactsConstants.AFFIDAVIT_ID).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.CONTRACT_ID%>" value="<%=request.getAttribute(PactsConstants.CONTRACT_ID).toString()%>"/>
    <tc-webtag:hiddenInput name="<%=PactsConstants.USER_ID%>" value="<%=request.getAttribute(PactsConstants.USER_ID).toString()%>"/>

    <input type=hidden name="query" value="${query}">

    <a href="${csvLink}">Download as CSV (Excel)</a> - <a href="${travxmlLink}">Download as Travelex XML</a><br/>

    <a href="${toggleGroupReliability}">
        <c:choose>
            <c:when test="${groupReliability}">Ungroup components and reliabilities</c:when>
            <c:otherwise>Group components with their reliabilities</c:otherwise>
        </c:choose>
    </a><br>

<a href="Javascript:checkAll(true)">check all</a> -
 <a href="Javascript:checkAll(false)">uncheck all</a> <br>
<br/>
<c:set var="totalNet" value="0" />
<table id="datatable" border="1" cellpadding="0" cellspacing="0"  class="stat" width="100%">
    <tr>
        <td class="header"></td>
        <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.ID_COL%>" includeParams="true"/>" >Payment ID</a></td>	
        <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.NAME_COL%>" includeParams="true"/>" >Full Name</a></td>
        <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.USER_COL%>" includeParams="true"/>" >User</a></td>
        <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.DESC_COL%>" includeParams="true"/>" >Description</a></td>
        <td class="headerR"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.GROSS_COL%>" includeParams="true"/>" >Gross</a></td>
        <td class="headerR"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.TAX_COL%>" includeParams="true"/>" >Tax</a></td>
        <td class="headerR"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.NET_COL%>" includeParams="true"/>" >Net</a></td>
        <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.TYPE_COL%>" includeParams="true"/>" >Type</a></td>
        <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.STATUS_COL%>" includeParams="true"/>" >Status</a></td>
        <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.CLIENT_COL%>" includeParams="true"/>" >Client</a></td>
        <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.COCKPIT_PROJECT_NAME_COL%>" includeParams="true"/>" >Project</a></td>
        <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.BILLING_ACCOUNT_NAME_COL%>" includeParams="true"/>" >Billing Acct</a></td>		
        <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.REFERENCE_ID_COL%>" includeParams="true"/>" >Reference ID</a></td>	
        <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.CONTEST_CATEGORY_NAME_COL%>" includeParams="true"/>" >Contest Category</a></td>
        <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.INVOICE_NUMBER_COL%>" includeParams="true"/>" >Invoice</a></td>		
        <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.CREATED_COL%>" includeParams="true"/>" >Created</a></td>
        <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.MODIFIED_COL%>" includeParams="true"/>" >Modified</a></td>
    </tr>
    <% boolean even = true;%>
    <c:forEach var="payment" items="${paymentList}" varStatus="index">
            <c:set var="composed" value="false" />
            <c:set var="mark" value="" />
            <c:if test="${not empty reliabilityMap[payment.id]}">
                <c:set var="composed" value="true" />
                <c:set var="mark" value="*" />
            </c:if>
        <c:set var="totalNet" value="${totalNet + payment.recentNetAmount}" />
        <tr class="<%=even?"light":"dark"%>">
        <td>
            <c:choose>
                <c:when test="${composed}">
                    <c:set var="row_key" value="${payment.id},${reliabilityMap[payment.id]}"/>
                </c:when>
                <c:otherwise>
                    <fmt:formatNumber var="row_key" value="${payment.id}" groupingUsed="False"/>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${empty checked_payments || cf:contains(checked_payments, row_key)}">
                   <input type="checkbox" name="checked_payment_id" value="${row_key}" checked
                          class="paymentCheckBox" id="pcb${index.index}">
                </c:when>
                <c:otherwise>
                   <input type="checkbox" name="checked_payment_id" value="${row_key}"></c:otherwise>
            </c:choose>

        </td>
        <td class="value"><c:out value="${payment.id}" /></td>	
        <td class="value" nowrap="nowrap"><c:out value="${payment.user.fullName}" /></td>
        <td class="value"><a href="${pacts:viewUser(payment.user.id)}"><c:out value="${payment.user.handle}" /></td>
        <td class="value"><a href="${pacts:viewPayment(payment.id)}"><c:out value="${payment.description}" /></a>
            <c:if test="${composed}"> +
                 <a href="${pacts:viewPayment(reliabilityMap[payment.id])}">Reliability</a>
            </c:if>
        </td>
        <td class="valueR" nowrap>$<fmt:formatNumber value="${payment.recentGrossAmount}" pattern="###,##0.00" /><c:out value="${mark}" /></td>
        <td class="valueR" nowrap>$<fmt:formatNumber value="${payment.recentGrossAmount - payment.recentNetAmount}" pattern="###,##0.00" /><c:out value="${mark}" /></td>
        <td class="valueR" nowrap  id="pna${index.index}">$<fmt:formatNumber value="${payment.recentNetAmount}" pattern="###,##0.00" /><c:out value="${mark}" /></td>
        <td class="value"><c:out value="${payment.type}" /></td>

        <td class="value"><strong>${payment.currentStatus.desc}</strong>
            <c:forEach items="${payment.currentStatus.reasons}" var="reason">
            <br>- ${reason.desc}
            </c:forEach>
        </td>

        <td class="value"><c:out value="${payment.client}" /></td>
        <td class="value"><c:out value="${payment.cockpitProjectName}" /></td>
        <td class="value"><c:out value="${payment.billingAccountName}" /></td>		
        <td class="value"><c:out value="${payment.referenceId}" /></td>	
        <td class="value"><c:out value="${payment.contestCategoryName}" /></td>	
        <td class="value"><c:out value="${payment.invoiceNumber}" /></td>	
        <td class="valueC"><c:out value="${payment.createDate}" /> </td>
        <td class="valueC"><c:out value="${payment.modifyDate}" /> </td>
        </tr>
        <tc-webtag:errorIterator id="err" name="err_${payment.id}">
        <tr>
        <td colspan="4">
        </td>
        <td colspan="13">
            <span class="bigRed">
                    <%=err%><br/>
            </span>
        </td>
        </tr>
                </tc-webtag:errorIterator>
         <% even = !even;%>
    </c:forEach>
    <tr>
        <td class="header" colspan="7"><b>Total Net Amount:</b>
        </td>
        <td class="headerR" nowrap="nowrap">$<fmt:formatNumber value="${totalNet}" pattern="###,###.00" /></td>
        <td class="header" colspan="10">&nbsp;</td>
    </tr>

    </table>
<br/>
<a href="Javascript:checkAll(true)">check all</a> -
 <a href="Javascript:checkAll(false)">uncheck all</a> <br>
<br>

<SELECT CLASS="dropdown" NAME="status_id" onChange="eventChanged()" >
        <OPTION value='1' selected>
            Enter into payment system
        </OPTION>
        <OPTION value='2'>
            Pay
        </OPTION>
        <OPTION value='3'>
            Delete
        </OPTION>
        <OPTION value='4'>
            Set Invoice Number
        </OPTION>
</SELECT>
<input type="submit" value="Apply Event">
<div name="invoice_number_section" style="visibility:hidden;">
    Invoice Number: <input type="text" name="new_invoice_number" size="11" maxlength="11"/>
</div>

</form>
<jsp:include page="InternalFooter.jsp" flush="true"/>
</td></tr>
</table>

<%--
<script type="text/javascript">
    <!--
    NET_TOTAL = <fmt:formatNumber value="${totalNet}" pattern="###,###.00"/>;
    -->
</script>
--%>
</body>
</html>