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
  <jsp:param name="key" value="tc_main"/>
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
            <jsp:param name="node" value="payments"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td class="cardCell" width="100%" align="center">

        <jsp:include page="../../page_title.jsp" >
            <jsp:param name="image" value="pact_s"/>
            <jsp:param name="title" value="Payments"/>
        </jsp:include>

		<p class="bigRed" align="left">Learn <A href="/tc?module=Static&d1=help&d2=getPaid&node=algo_get_paid" class="bigRed">How to Get Paid</A> from TopCoder for your competition winnings.</p>

		<p align="left">
		<c:if test="${fullList}" >
			This page displays all payments. <a href="/PactsMemberServlet?module=PaymentHistory&full_list=false">(View pending)</a>
		</c:if>
		<c:if test="${not fullList}" >
			This page displays pending payments. <a href="/PactsMemberServlet?module=PaymentHistory&full_list=true">(View all)</a>		
		</c:if>
		</p>
		<br>
<c:choose>
<c:when test="${not empty payments}">
	<table BGCOLOR="#FFFFFF" CELLPADDING="2" CELLSPACING="2" BORDER="0" WIDTH="100%" >
	<tr>
		<td class="bodyText" width="35%"><b>Payment Description</b></td>
		<td class="bodyText" width="20%"><b>Due Date</b></td>
		<td class="bodyText" width="15%"><b>Net Payment Amount</b></td>
		<td class="bodyText" width="10%"><b>Status</b></td>
		<td class="bodyText" width="10%">
			<c:if test="${fullList}" >
				<b>Date Paid</b>			
			</c:if>
		</td>
	</tr>
	
<c:forEach items="${payments}" var="payment">
<c:choose>
<c:when test="${payment.typeId == 2}"><!-- contract --></c:when> 
<c:otherwise>
	<tr>
		<td class="bodyText">
			
			<c:choose>
				<c:when test="${(payment.typeId == 1 || payment.typeId == 22) && payment.header.algorithmRoundId > 0">
                	<A href="/stat?c=coder_room_stats&cr=${payment.header.user.id}&rd=${payment.header.algorithmRoundId}"><c:out value="${payment.description}"/></A>
                </c:when>
                <c:otherwise>
	                <c:out value="${payment.description}"/>
                </c:otherwise>
			</c:choose>
		</td>
		<td class="bodyText"><c:out value="${payment.dueDate}"/></td>
		<td class="bodyText">$<fmt:formatNumber value="${payment.netAmount}" pattern="###,##0.00" /></td>
		<td class="bodyText"><c:out escapeXml="false" value="${payment.statusDesc}"/></td>
		<td class="bodyText">
			<c:if test="${fullList and payment.payDate != '00/00/0000'}" >
				<c:out value="${payment.payDate}"/>			
			</c:if>
		</td>
	</tr>
</c:otherwise>	
</c:choose>	
</c:forEach>	
	
	</table>
</c:when>
<c:otherwise>
<b><em>No Payments Found</em> </b>
</c:otherwise>	
</c:choose>			

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
