<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.member.AffidavitHistory" %>
<%@ page language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="fullList" value="<%= request.getAttribute(AffidavitHistory.FULL_LIST) %>"/>
<c:set var="affidavits" value="<%= request.getAttribute(AffidavitHistory.AFFIDAVITS) %>"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - PACTs</title>


<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</head>

<body>

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
<jsp:param name="title" value="Affidavits"/>
</jsp:include>


<div align="left">
    <div style="float:right;">
       <A href="/wiki/display/tc/How+to+Get+Paid+for+Competing"><img src="/i/pacts/howToGetPaid.png" alt="How to get paid" /></A>
    </div>
    <span class="bodySubtitle">Affidavits > </span><br>
    <c:if test="${fullList}" >
        View all | <a href="/PactsMemberServlet?module=AffidavitHistory&full_list=false" class="bcLink">View pending</a>
    </c:if>
    <c:if test="${not fullList}" >
        <a href="/PactsMemberServlet?module=AffidavitHistory&full_list=true" class="bcLink">View all</a> | View pending
    </c:if>
</div>

<br clear="all">

<c:choose>
<c:when test="${not empty affidavits}">
<table cellpadding="0" cellspacing="0" class="stat" width="100%">
<tbody>
    <tr>
        <td class="title" colspan="7">
        Affidavits
        </td>
    </tr>
    <tr>
        <td class="header">
        Description
        </td>
        <td class="headerC">
        Affirmation
        </td>
        <td class="headerC">
        Time Left
        </td>
        <td class="headerR">
        Net Payment
        </td>
        <td class="headerC">
        Notarized
        </td>
        <td class="headerC">
        Status
        </td>
        <td class="headerC">
        <c:if test="${fullList}" >
            <b>Date Paid</b>            
        </c:if>&nbsp;
        </td>
    </tr>
<% boolean even = true;%>
<c:forEach items="${affidavits}" var="affidavit">
    <tr class="<%=even?"light":"dark"%>">
        <td class="value">
        <c:out value="${affidavit.header.description}"/>
        </td>
    <c:choose>
        <c:when test="${affidavit.header.statusId == 58}">
        <td class="valueC">
            <a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavit.header.id}">
                Affirmed on<br><c:out value="${affidavit.affirmationDate}"></c:out>
            </a>                
        </td>
        <td class="valueC">&nbsp;</td>
        </c:when>
        <c:when test="${affidavit.header.statusId == 57}">
        <td class="valueC">
            <strong><a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavit.header.id}">
                Affirm now
            </a></strong>
        </td>
        <td class="valueC">
            <strong><a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavit.header.id}">
                <c:out value="${affidavit.daysLeftToAffirm}"/> days
            </a></strong>            
        </td>
        </c:when>
        <c:otherwise>
        <td class="valueC">
            <a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavit.header.id}" class="bigRed">
                Expired
            </a>
        </td>
        <td class="valueC">
            <a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavit.header.id}" class="bigRed">
                Expired
            </a>                
        </td>
        </c:otherwise>
    </c:choose>
        <td class="valueR">
            <c:if test="${affidavit.payment.id > 0}">
                <a href="/PactsMemberServlet?t=payments&c=payment_details&payment_id=${affidavit.payment.id}" >
                    $<fmt:formatNumber value="${affidavit.payment.recentNetAmount}" pattern="###,###.00" />
                </a>
            </c:if>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${affidavit.header.notarized}">yes</c:when>
                <c:otherwise>no</c:otherwise>                 
            </c:choose>
        </td>
        <td class="valueC">
            <c:out value="${affidavit.header.statusDesc}"/>
        </td>
        <td class="valueC">
            <c:if test="${fullList and affidavit.payDate != '00/00/0000'}" >
                <c:out value="${affidavit.payDate}"/>            
            </c:if>
        </td>
    </tr>
<% even = !even;%>
</c:forEach>
</tbody>
</table>
</c:when>
<c:otherwise>
<div align="center">
<strong>No Affidavits Found</strong>
</div>
</c:otherwise>    
</c:choose>            


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
