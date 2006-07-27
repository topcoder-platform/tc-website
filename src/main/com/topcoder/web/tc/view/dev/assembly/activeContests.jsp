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

<div align="right"><A href="/tc?module=Static&d1=dev&d2=assembly&d3=instructions"><img src="/i/development/get_started.gif" alt="Getting Started" border="0" /></A></div>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="7">Active Software Assembly Contests</td></tr>
   <tr>
      <td class="tableHeader" colspan="3" nowrap="nowrap">Contest</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Teams</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Register By</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Submit By</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Forums</td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_reviewScorecardAdmin">Online Review Scorecard Admin</A>
      </td>
      <td class="valueC">
      <%--<A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Online Review Scorecard Admin">register</A>--%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_reviewScorecardAdmin">results</A>--%>
      </td>
      <td class="valueC">
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_reviewScorecardAdmin">standings</A>
      </td>
      <td class="valueC">
      07.21.2006 9:00 PM EST
      </td>
      <td class="valueC">
      07.28.2006 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">

      <%--
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506064">join a team</A>
      <br>
      --%>
      <A href="https://software.topcoder.com/forum/c_forum.jsp?f=22883020">discuss the project</A>
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

