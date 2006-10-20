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
            <jsp:param name="node" value="affidavits"/>
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
       <A href="/tc?module=Static&d1=help&d2=getPaid&node=algo_get_paid"><img src="/i/pacts/howToGetPaid.png" alt="How to get paid" /></A>
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
        Net Payment Amount
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
        </c:if>
        </td>
    </tr>
<% boolean even = true;%>
<c:forEach items="${affidavits}" var="affidavit">
    <tr class="<%=even?"light":"dark"%>">
        <td class="value">
        <c:out value="${affidavit.header.description}"/>
        </td>
<%--
        <td class="valueC">
            <a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavit.header.id}">
--%>
    <c:choose>
        <c:when test="${affidavit.header.affirmed}">
        <td class="valueC">
            <a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavit.header.id}">
                affirmed on<br><c:out value="${affidavit.affirmationDate}"></c:out>
            </a>                
        </td>
        <td class="valueC">&nbsp;</td>
        </c:when>
        <c:when test="${affidavit.daysLeftToAffirm > 0}">
        <td class="valueC">
            <strong><a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavit.header.id}">
                affirm
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
                expired
            </a>                
        </td>
        <td class="valueC">
            <a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavit.header.id}" class="bigRed">
                expired
            </a>                
        </td>
        </c:otherwise>
    </c:choose>
<%--
            </a>                
        </td>
--%>
        <td class="valueR">
            <c:if test="${affidavit.payment.id > 0}">
                <a href="/PactsMemberServlet?t=payments&c=payment_details&payment_id=${affidavit.payment.id}" >
                    $<fmt:formatNumber value="${affidavit.payment.recentNetAmount}" pattern="###,###.00" />
                </a>
            </c:if>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="affidavit.header.notarized">yes</c:when>
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
<b><em>No Affidavits Found</em> </b>
</c:otherwise>    
</c:choose>            








<%--
    <table BGCOLOR="#FFFFFF" CELLPADDING="2" CELLSPACING="2" BORDER="0" WIDTH="100%" >
    <tr>
        <td class="bodyText" width="35%"><b>Affidavit Description</b></td>
        <td class="bodyText" width="20%"><b>Affidavit Affirmation</b></td>
        <td class="bodyText" width="15%"><b>Net Payment Amount</b></td>
        <td class="bodyText" width="10%"><b>Notarized</b></td>
        <td class="bodyText" width="10%"><b>Status</b></td>
        <td class="bodyText" width="10%">
            <c:if test="${fullList}" >
                <b>Date Paid</b>            
            </c:if>
        </td>
    </tr>
<c:forEach items="${affidavits}" var="affidavit">
    <tr>
        <td class="bodyText"><c:out value="${affidavit.header.description}"/></td>
        <td class="bodyText">
            <a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavit.header.id}">
                <c:choose>
                    <c:when test="${affidavit.header.affirmed}">
                        affirmed on <c:out value="${affidavit.affirmationDate}"></c:out>
                    </c:when>
                    <c:when test="${affidavit.daysLeftToAffirm > 0}">
                        click to affirm, <c:out value="${affidavit.daysLeftToAffirm}"/> days left
                    </c:when>
                    <c:otherwise>
                        expired, click here to view
                    </c:otherwise>
                </c:choose>
            </a>                
        </td>
        <td class="bodyText">
            <c:if test="${affidavit.payment.id > 0}">
                <a href="/PactsMemberServlet?t=payments&c=payment_details&payment_id=${affidavit.payment.id}" >
                    $<fmt:formatNumber value="${affidavit.payment.recentNetAmount}" pattern="###,###.00" />
                </a>
            </c:if>
        </td>
        <td class="bodyText">
            <c:choose>
                <c:when test="affidavit.header.notarized">yes</c:when>
                <c:otherwise>no</c:otherwise>                 
            </c:choose>
        </td>
        <td class="bodyText"><c:out value="${affidavit.header.statusDesc}"/></td>
        <td class="bodyText">
            <c:if test="${fullList and affidavit.payDate != '00/00/0000'}" >
                <c:out value="${affidavit.payDate}"/>            
            </c:if>
        </td>
    </tr>
</c:forEach>    
    
    </table>
</c:when>

<c:otherwise>
<b><em>No Affidavits Found</em> </b>
</c:otherwise>    
</c:choose>            
--%>

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
