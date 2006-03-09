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
<td width="100%" align="center" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="assembly"/>
<jsp:param name="title" value="Active Contests"/>
</jsp:include>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="7">Active Software Assembly Contests</td></tr>
   <tr>
      <td class="tableHeader" colspan="3" nowrap="nowrap">Contest</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Registered Teams</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Start Time</td>
      <td class="tableHeader" align="center" nowrap="nowrap">End Time</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Forum</td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="">Time Tracker</A>
      </td>
      <td class="valueC">
      <A href="">register</A>
      </td>
      <td class="valueC">
      <A href="">standings</A>
      </td>
      <td class="valueC">
      <A href="">10</A>
      </td>
      <td class="valueC">
       02.22.2006 12:00  	
      </td>
      <td class="valueC">
      03.08.2006 12:00
      </td>
      <td class="valueC">
      <A href="">discuss</A>
      </td>
   </tr>
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

