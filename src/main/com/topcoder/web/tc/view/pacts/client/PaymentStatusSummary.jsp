<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.member.PaymentStatusSummary" %>
<%@ page language="java"
         import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.tc.Constants" %>

<%@ page language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<c:set value="<%=true%>" var="isReskin"/>
<c:set value="<%=request.getAttribute("NUM_PENDING")%>" var="numPending" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TopCoder - PACTS</title>


<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
  <jsp:param name="reskin" value="${isReskin ? 'paymentStatusSummary' : ''}"/>
</jsp:include>

</head>
<body>

<%
    ResultSetContainer rsc = (ResultSetContainer) request.getAttribute(PaymentStatusSummary.PAYMENT_STATUS_SUMMARY);
%>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
    <jsp:param name="isReskin" value="${isReskin}"/>
</jsp:include>

<c:if test="${isReskin}">
<div class="page">
</c:if>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="myHome">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="my_topcoder"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn summary" id="payments">

<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="pact_s"/>
<jsp:param name="title" value="Payments"/>
</jsp:include>

<div align="left" class="page-header">
    <div style="float:right;" class="how-to-get-paid">
       <c:if test="${isReskin}">
       <A href="https://www.topcoder.com/thrive/articles/Payment%20Policies%20and%20Instructions">How to get paid?</A>
       </c:if>

       <c:if test="${!isReskin}">
       <A href="https://www.topcoder.com/thrive/articles/Payment%20Policies%20and%20Instructions"><img src="/i/pacts/howToGetPaid.png" alt="How to get paid" /></A>
       </c:if>
    </div>

    <c:if test="${isReskin}">
        <a href="javascript:history.back()" class="back-btn">
            <i class="arrow-prev-icon"></i>
        </a>
    </c:if>

    <c:choose>
        <c:when test="${not empty isNewStyle && isNewStyle}">
            <h2 class="title">Payments</h2>
        </c:when>
        <c:otherwise>
            <span class="bodySubtitle title">Payments > </span><br>
        </c:otherwise>
    </c:choose>

    <div class="divider"></div>

    <c:if test="${!isReskin}">
    <a href="/PactsMemberServlet?module=PaymentHistory&full_list=true" class="bcLink">View all</a> | <a href="/PactsMemberServlet?module=PaymentHistory&full_list=false" class="bcLink">View pending</a> | <a href="/PactsMemberServlet?module=PaymentHistory&xls=true" class="bcLink">Export to Excel</a> | Payments Summary
    </c:if>

    <c:if test="${isReskin}">
        <%-- desktop tabs --%>
        <nav class="tabs paymentHistoryTabs">
            <a href="/PactsMemberServlet?module=PaymentHistory&full_list=true" class="bcLink item">View all</a>
            <a href="/PactsMemberServlet?module=PaymentHistory&full_list=false" class="bcLink item">View pending
                <c:if test="${numPending ne 0}">
                    <span class="view-pending-badge">${numPending}</span>
                </c:if>
            </a>
            <a href="/PactsMemberServlet?module=PaymentStatusSummary" class="bcLink item active">Payments Summary</a>
        </nav>

        <%-- mobile dropdown --%>
        <div class="dropdown paymentHistoryDropdown">
            <button class="dropdown-toggle" type="button" onclick="onDropdownToggleClick()" id="paymentHistory-dropdown-toggle">
                <span class="toggle-value">
                    Payments Summary
                </span>
                <i class="icon icon-arrow-down"></i>
            </button>
            <div class="dropdown-menu">
                <a href="/PactsMemberServlet?module=PaymentHistory&full_list=true" class="bcLink item">
                    View all
                </a>
                <a href="/PactsMemberServlet?module=PaymentHistory&full_list=false" class="bcLink item">
                    View pending
                    <c:if test="${numPending ne 0}">
                        <span class="view-pending-badge">${numPending}</span>
                    </c:if>
                </a>
                <a href="/PactsMemberServlet?module=PaymentStatusSummary" class="bcLink item active">
                    Payments Summary
                </a>
            </div>
            <script>
                function onDropdownToggleClick () {
                    var button = document.querySelector('#paymentHistory-dropdown-toggle')
                    if (button.getAttribute('data-open') === 'true') {
                        button.removeAttribute('data-open')
                    } else {
                       button.setAttribute('data-open', 'true')
                    }
                }
            </script>
        </div>
    </c:if>
</div>

<br clear="all">

    <br>

    <c:if test="${isReskin}">
    <div class="table-container">
    </c:if>

    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
    <colgroup>
        <col class="col-payment-status">
        <col class="col-net-amount">
    </colgroup>
    <tbody>
        <c:if test="${!isNewStyle}">
            <tr>
                <td class="title" colspan="2">
                    Payment Summary
                </td>
            </tr>
        </c:if>

        <tr class="headerRow">
            <td class="header payment-status">Payment Status</td>
            <td class="headerR net-amount">Net Amount</td>
        </tr>


        <%boolean even = false;
          double total = 0;%>
        <rsc:iterator list="<%=rsc%>" id="resultRow">
            <tr class="<%=even?"dark":"light"%>">
            <TD class="value payment-status">
                <rsc:item name="payment_status" row="<%=resultRow%>"/>
            </TD>
            <TD class="valueR net-amount">
            <% if (resultRow.getDoubleItem("net_amount") > 0) {
                total += resultRow.getDoubleItem("net_amount");
            }%>
            <rsc:item name="net_amount" row="<%=resultRow%>" format="$#,##0.00"/>
            </TD>
            </tr>
            <%even = !even;%>
        </rsc:iterator>

        <tr class="<%=even?"dark":"light"%> totalRow">
            <c:choose>
                <c:when test="${isReskin}">
                    <td class="total-text">Total</td>
                    <td class="total-value"><fmt:formatNumber value="<%=new Double(total)%>" type="currency" currencySymbol="$"/></td>
                </c:when>
                <c:when test="${not empty isNewStyle && isNewStyle}">
                    <td class="total" colspan="2">Total:&nbsp;<fmt:formatNumber value="<%=new Double(total)%>" type="currency" currencySymbol="$"/></td>
                </c:when>
                <c:otherwise>
                    <td class="headerR" colspan="2">Total:&nbsp;<fmt:formatNumber value="<%=new Double(total)%>" type="currency" currencySymbol="$"/></td>
                </c:otherwise>
            </c:choose>
        </tr>

    </tbody>
    </table>

    <c:if test="${isReskin}">
    </div><%-- // end .table-container --%>
    </c:if>
<br>



<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<c:if test="${isReskin}">
</div><!-- // end .page -->
</c:if>

<jsp:include page="/foot.jsp" >
    <jsp:param name="isReskin" value="${isReskin}"/>
</jsp:include>

</body>

</html>
