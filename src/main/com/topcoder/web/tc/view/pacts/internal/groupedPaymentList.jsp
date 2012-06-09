<%--
  - Author: VolodymyrK
  - Version: 1.1 (Member Payment Improvements Release assembly v1.0)
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the web form listing the grouped payments matching the selected criteria.
--%>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.PaymentList" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<c:set var="referencePayments" value="<%= request.getAttribute(PaymentList.REFERENCE_PAYMENTS) %>" />
<c:set var="breakdownLinks" value="<%= request.getAttribute(PaymentList.BREAKDOWN_LINKS) %>" />
<c:set var="netAmounts" value="<%= request.getAttribute(PaymentList.GROUPED_NET_AMOUNTS) %>" />
<c:set var="grossAmounts" value="<%= request.getAttribute(PaymentList.GROUPED_GROSS_AMOUNTS) %>" />
<c:set var="groupByFields" value="<%= request.getAttribute(PaymentList.GROUP_BY_FIELDS) %>" />

<c:set var="handleColumn" value="<%=PaymentList.USER_COL%>" />
<c:set var="typeColumn" value="<%=PaymentList.TYPE_COL%>" />
<c:set var="statusColumn" value="<%=PaymentList.STATUS_COL%>" />
<c:set var="methodColumn" value="<%=PaymentList.METHOD_COL%>" />
<c:set var="paidDateColumn" value="<%=PaymentList.PAID_DATE_COL%>" />
<c:set var="createDateColumn" value="<%=PaymentList.CREATE_DATE_COL%>" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>PACTS - Payment List</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<body>
<table id="marginTable" border="0" cellpadding="0" cellspacing="10"  class="stat" width="100%">
<tr><td>
<h1>PACTS</h1>
<h2>Grouped Payment List</h2>
${fn:length(netAmounts)} records <br />

<table id="datatable" border="1" cellpadding="0" cellspacing="0"  class="stat" width="100%">
    <tr>
        <c:forEach var="groupByField" items="${groupByFields}" varStatus="index">
            <td class="header">
            <c:choose>
                <c:when test="${groupByField == handleColumn}">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.USER_COL%>" includeParams="true"/>" >Handle</a>
                </c:when>
                <c:when test="${groupByField == typeColumn}">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.TYPE_COL%>" includeParams="true"/>" >Type</a>
                </c:when>
                <c:when test="${groupByField == statusColumn}">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.STATUS_COL%>" includeParams="true"/>" >Status</a>
                </c:when>
                <c:when test="${groupByField == methodColumn}">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.METHOD_COL%>" includeParams="true"/>" >Method</a>
                </c:when>                                
                <c:when test="${groupByField == paidDateColumn}">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.PAID_DATE_COL%>" includeParams="true"/>" >Paid Date</a>
                </c:when>
                <c:when test="${groupByField == createDateColumn}">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=PaymentList.CREATE_DATE_COL%>" includeParams="true"/>" >Creation Date</a>
                </c:when>
                <c:otherwise>&nbsp;</c:otherwise>
            </c:choose>            
            </td>
        </c:forEach>
        <td class="header">Gross Total</td>
        <td class="header">Net Total</td>
    </tr>

    <% boolean even = true;%>
    <c:set var="i" value="0" />
    <c:forEach var="referencePayment" items="${referencePayments}" varStatus="index">
        <tr class="<%=even?"light":"dark"%>">

        <c:forEach var="groupByField" items="${groupByFields}" varStatus="index">
            <td class="value">
            <c:choose>
                <c:when test="${groupByField == handleColumn}">
                    <c:out value="${referencePayment.user.handle}" />
                </c:when>
                <c:when test="${groupByField == typeColumn}">
                    <c:out value="${referencePayment.type}" />
                </c:when>
                <c:when test="${groupByField == statusColumn}">
                    <c:out value="${referencePayment.currentStatus.desc}" />
                </c:when>
                <c:when test="${groupByField == methodColumn}">
                    <c:out value="${referencePayment.method}" />
                </c:when>
                <c:when test="${groupByField == paidDateColumn}">
                    <c:out value="${referencePayment.paidDate}" />
                </c:when>
                <c:when test="${groupByField == createDateColumn}">
                    <c:out value="${referencePayment.createDate}" />
                </c:when>
                <c:otherwise>&nbsp;</c:otherwise>
            </c:choose>
            </td>
        </c:forEach>
        <td class="value"><a href="${breakdownLinks[i]}"><c:out value="${grossAmounts[i]}" /></a></td>
        <td class="value"><a href="${breakdownLinks[i]}"><c:out value="${netAmounts[i]}" /></a></td>

        <c:set var="i" value="${i+1}" />
        <% even = !even;%>
    </c:forEach> 
 </table>
<br/>

<jsp:include page="InternalFooter.jsp" flush="true"/>
</td></tr>
</table>

</body>
</html>
