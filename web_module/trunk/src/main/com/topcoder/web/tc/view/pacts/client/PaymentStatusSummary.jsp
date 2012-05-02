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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - PACTS</title>


<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>
<body>

<%
    ResultSetContainer rsc = (ResultSetContainer) request.getAttribute(PaymentStatusSummary.PAYMENT_STATUS_SUMMARY);
%>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="my_topcoder"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="pact_s"/>
<jsp:param name="title" value="Payments"/>
</jsp:include>

<div align="left">
    <div style="float:right;">
       <A href="/wiki/display/tc/How+to+Get+Paid+for+Competing"><img src="/i/pacts/howToGetPaid.png" alt="How to get paid" /></A>
    </div>
    <span class="bodySubtitle">Payments > </span><br>
    <a href="/PactsMemberServlet?module=PaymentHistory&full_list=true" class="bcLink">View all</a> | <a href="/PactsMemberServlet?module=PaymentHistory&full_list=false" class="bcLink">View pending</a> | <a href="/PactsMemberServlet?module=PaymentHistory&xls=true" class="bcLink">Export to Excel</a> | Payments Summary
</div>

<br clear="all">

    <br>
    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
    <tbody>
        <tr>
            <td class="title" colspan="2">
            Payment Summary
            </td>
        </tr>
        <tr>
            <td class="header">Payment Status</td>
            <td class="headerR">Total Net Amount</td>
        </tr>


        <%boolean even = false;
          double total = 0;%>
        <rsc:iterator list="<%=rsc%>" id="resultRow">
            <tr class="<%=even?"dark":"light"%>">
            <TD class="value">
                <rsc:item name="payment_status" row="<%=resultRow%>"/>
            </TD>
            <TD class="valueR">
            <% if (resultRow.getDoubleItem("net_amount") > 0) {
                total += resultRow.getDoubleItem("net_amount");
            }%>
            <rsc:item name="net_amount" row="<%=resultRow%>" format="$#,##0.00"/>
            </TD>
            </tr>
            <%even = !even;%>
        </rsc:iterator>

        <tr>
            <td class="headerR" colspan="2">Total:&nbsp;<fmt:formatNumber value="<%=new Double(total)%>" type="currency" currencySymbol="$"/></td>
        </tr>

    </tbody>
    </table>
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

<jsp:include page="/foot.jsp" />

</body>

</html>
