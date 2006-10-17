<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.member.AffidavitHistory" %>
<%@ page language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<c:set var="fullList" value="<%= request.getAttribute(AffidavitHistory.FULL_LIST) %>"/>

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
            <jsp:param name="node" value="affidavits"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td class="cardCell" width="100%" align="center">

         <div class="myTCBody">
        <jsp:include page="../../page_title.jsp" >
            <jsp:param name="image" value="pact_s"/>
            <jsp:param name="title" value="Affidavits"/>
        </jsp:include>

		<p class="bigRed" align="left">Learn <A href="/tc?module=Static&d1=help&d2=getPaid&node=algo_get_paid" class="bigRed">How to Get Paid</A> from TopCoder for your competition winnings.</p>

		<c:if test="${fullList}" >
			This page displays all affidavits. <a href="/PactsMemberServlet?module=AffidavitHistory&full_list=false">(View pending)</a>
		</c:if>
		<c:if test="${not fullList}" >
			This page displays pending affidavits. <a href="/PactsMemberServlet?module=AffidavitHistory&full_list=true">(View all)</a>		
		</c:if>
		<br>
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
	</table>
		

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

<jsp:include page="../foot.jsp" />

</body>

</html>
