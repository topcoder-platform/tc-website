<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.member.PaymentHistory" %>
<%@ page language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="fullList" value="<%= request.getAttribute(PaymentHistory.FULL_LIST) %>"/>
<c:set var="payments" value="<%= request.getAttribute(PaymentHistory.PAYMENTS) %>"/>

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
<jsp:param name="title" value="Payments"/>
</jsp:include>

<div align="left">
    <div style="float:right;">
       <A href="/wiki/display/tc/How+to+Get+Paid+for+Competing"><img src="/i/pacts/howToGetPaid.png" alt="How to get paid" /></A>
    </div>
    <span class="bodySubtitle">Payments > </span><br>
    <c:if test="${fullList}" >
        View all | <a href="/PactsMemberServlet?module=PaymentHistory&full_list=false" class="bcLink">View pending</a>
    </c:if>
    <c:if test="${not fullList}" >
        <a href="/PactsMemberServlet?module=PaymentHistory&full_list=true" class="bcLink">View all</a> | View pending
    </c:if>
</div>

<br clear="all">

<c:choose>
<c:when test="${not empty payments}">
<table cellpadding="0" cellspacing="0" class="stat" width="100%">
<tbody>
    <tr>
        <td class="title" colspan="5">
        Payments
        </td>
    </tr>
    <tr>
        <td class="header">Description</td>
        <td class="headerC">Due Date</td>
        <td class="headerR">Net Payment</td>
        <td class="headerC">Status</td>
        <td class="headerC">
            <c:if test="${fullList}" >
                <b>Date Paid            
            </c:if>&nbsp;
        </td>
    </tr>
    
<% boolean even = true;%>
<c:forEach items="${payments}" var="payment">
<c:choose>
<c:when test="${payment.typeId == 3}"><!-- problem (legacy) --></c:when>
<c:when test="${payment.typeId == 4}"><!-- coder referral --></c:when>
<c:when test="${payment.typeId == 5}"><!-- charity (legacay) --></c:when>
<c:when test="${payment.typeId == 13}"><!-- studio --></c:when>
<c:otherwise>
    <tr class="<%=even?"light":"dark"%>">
        <td class="value">
            <c:choose>
                <c:when test="${(payment.typeId == 1 || payment.typeId == 22) && payment.header.algorithmRoundId > 0}">
                    <A href="/stat?c=coder_room_stats&cr=${payment.header.user.id}&rd=${payment.header.algorithmRoundId}"><c:out value="${payment.description}"/></A>
                </c:when>
                <c:when test="${(payment.typeId == 6 || payment.typeId == 7) && payment.header.componentProjectId > 0}">
                    <A href="/tc?module=CompContestDetails&pj=${payment.header.componentProjectId}" class="bcLink"><c:out value="${payment.description}"/></A>                    
                </c:when>
                <c:when test="${(payment.typeId == 17 || payment.typeId == 25) && payment.header.digitalRunStageId > 0}">
                    <A href="/tc?module=LeaderBoard&ph=112&staid=${payment.header.digitalRunStageId}" class="bcLink"><c:out value="${payment.description}"/></A>                    
                </c:when>
                <c:when test="${payment.typeId == 18 && payment.header.digitalRunSeasonId > 0}">
                    <A href="/tc?module=RookieBoard&ph=112&seid=${payment.header.digitalRunStageId}" class="bcLink"><c:out value="${payment.description}"/></A>                    
                </c:when>
                <c:when test="${payment.typeId == 21 && payment.header.algorithmRoundId > 0}">
                    <A href="/longcontest/?module=ViewOverview&rd=${payment.header.algorithmRoundId}>" class="bcLink"><c:out value="${payment.description}"/></A>                    
                </c:when>                
                <c:otherwise>
                    <c:out value="${payment.description}"/>
                </c:otherwise>
            </c:choose>
        </td>
        <td class="valueC"><c:out value="${payment.dueDate}"/></td>
        <td class="valueR">$<fmt:formatNumber value="${payment.netAmount}" pattern="###,##0.00" /></td>
        <td class="valueC"><c:out escapeXml="false" value="${payment.statusDesc}"/></td>
        <td class="valueC">
            <c:if test="${fullList and payment.payDate != '00/00/0000'}" >
                <c:out value="${payment.payDate}"/>            
            </c:if>&nbsp;
        </td>
    </tr>
<% even = !even;%>
</c:otherwise>    
</c:choose>    
</c:forEach>    
</tbody>
</table>
</c:when>
<c:otherwise>
<div align="center">
<strong>No Payments Found</strong>
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
