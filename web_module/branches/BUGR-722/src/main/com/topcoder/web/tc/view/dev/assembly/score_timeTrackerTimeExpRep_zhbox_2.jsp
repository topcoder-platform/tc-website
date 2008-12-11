<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Assembly Competitions</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>


<jsp:include page="/top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
   <jsp:include page="/includes/global_left.jsp">
      <jsp:param name="node" value="assembly_compete"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="assembly"/>
<jsp:param name="title" value="Scorecard"/>
</jsp:include>

<span class="subtitle">Contest: Time Tracker Time, Expense and Reporting</span><br>
<strong>
Team: Apeiron Team<br>
Reviewer: <tc-webtag:handle coderId="11781622" />
</strong>
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="8">Assembly Contest Scorecard</td></tr>
   <tr>
      <td class="header">&#160;</td>
      <td class="headerC">Weight</td>
      <td class="headerC">Reviewer Score (1-4)</td>
      <td class="headerC">Score</td>
   </tr>
<% boolean even = false; %>
<tr class="<%=even?"dark":"light"%>"><td class="value">API Development</td><td class="valueC">6.00</td><td class="valueC">3</td><td class="valueC">4.50</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">&#160;</td><td class="valueC">6.00</td><td class="valueC">4</td><td class="valueC">6.00</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">&#160;</td><td class="valueC">6.00</td><td class="valueC">4</td><td class="valueC">6.00</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">&#160;</td><td class="valueC">6.00</td><td class="valueC">3</td><td class="valueC">4.50</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">API Implementation</td><td class="valueC">5.00</td><td class="valueC">3</td><td class="valueC">3.75</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">&#160;</td><td class="valueC">3.00</td><td class="valueC">3</td><td class="valueC">2.25</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">Component Usage</td><td class="valueC">5.00</td><td class="valueC">4</td><td class="valueC">5.00</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">&#160;</td><td class="valueC">2.00</td><td class="valueC">3</td><td class="valueC">1.50</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">Prototype Conversion</td><td class="valueC">6.00</td><td class="valueC">3</td><td class="valueC">4.50</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">Exceptions</td><td class="valueC">5.00</td><td class="valueC">4</td><td class="valueC">5.00</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">Code Review</td><td class="valueC">5.00</td><td class="valueC">4</td><td class="valueC">5.00</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">&#160;</td><td class="valueC">2.00</td><td class="valueC">4</td><td class="valueC">2.00</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">&#160;</td><td class="valueC">2.00</td><td class="valueC">3</td><td class="valueC">1.50</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">&#160;</td><td class="valueC">5.00</td><td class="valueC">4</td><td class="valueC">5.00</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">Test Cases</td><td class="valueC">6.00</td><td class="valueC">3</td><td class="valueC">4.50</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">&#160;</td><td class="valueC">6.00</td><td class="valueC">4</td><td class="valueC">6.00</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">&#160;</td><td class="valueC">3.00</td><td class="valueC">4</td><td class="valueC">3.00</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">&#160;</td><td class="valueC">3.00</td><td class="valueC">4</td><td class="valueC">3.00</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">&#160;</td><td class="valueC">2.00</td><td class="valueC">4</td><td class="valueC">2.00</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">Deployment Guide</td><td class="valueC">6.00</td><td class="valueC">4</td><td class="valueC">6.00</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value">Test Plan</td><td class="valueC">10.00</td><td class="valueC">3</td><td class="valueC">7.50</td></tr>
<% even = !even;%><tr class="<%=even?"dark":"light"%>"><td class="value" colspan="3"><strong>Total Score:</strong></td><td class="valueC"><strong>88.50</strong></td></tr>
</table>
</td>


<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td>
   <jsp:include page="/public_right.jsp">
       <jsp:param name="level1" value="default"/>
   </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

</tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>

