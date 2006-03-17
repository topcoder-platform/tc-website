<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Testing Competitions</title>
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
      <jsp:param name="node" value="testing_compete"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="testing"/>
<jsp:param name="title" value="Active Contests"/>
</jsp:include>

<div align="right"><A href="/tc?module=Static&d1=dev&d2=testing&d3=instructions"><img src="/i/development/get_started.gif" alt="Getting Started" border="0" /></A></div>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="7">Active Software Testing Contests</td></tr>
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
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_timeTrackerClientAdmin">Time Tracker Client Admin Tests</A>
      </td>
      <td class="valueC">
      <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Time Tracker Client Admin Tests">register</A>
      </td>
      <td class="valueC">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_timeTrackerClientAdmin">standings</A>
      </td>
      <td class="valueC">
      0
      </td>
      <td class="valueC">
      03.21.2006 09:00 PM EST
      </td>
      <td class="valueC">
      03.24.2006 09:00 PM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/">join a team</A>
      <br>
      <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">discuss the project</A>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_timeTrackerExpenseUser">Time Tracker Expense and User Tests</A>
      </td>
      <td class="valueC">
      <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Time Tracker Expense and User Tests">register</A>
      </td>
      <td class="valueC">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_timeTrackerExpenseUser">standings</A>
      </td>
      <td class="valueC">
      0
      </td>
      <td class="valueC">
      03.21.2006 09:00 PM EST
      </td>
      <td class="valueC">
      03.24.2006 09:00 PM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/">join a team</A>
      <br>
      <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">discuss the project</A>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_timeTrackerPerformanceGUI">Time Tracker Performance and GUI Tests</A>
      </td>
      <td class="valueC">
      <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Time Tracker Performance and GUI Tests">register</A>
      </td>
      <td class="valueC">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_timeTrackerPerformanceGUI">standings</A>
      </td>
      <td class="valueC">
      0
      </td>
      <td class="valueC">
      03.21.2006 09:00 PM EST
      </td>
      <td class="valueC">
      03.24.2006 09:00 PM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/">join a team</A>
      <br>
      <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">discuss the project</A>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_timeTrackerProjectAdmin">Time Tracker Project Admin Tests</A>
      </td>
      <td class="valueC">
      <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Time Tracker Project Admin Tests">register</A>
      </td>
      <td class="valueC">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_timeTrackerProjectAdmin">standings</A>
      </td>
      <td class="valueC">
      0
      </td>
      <td class="valueC">
      03.21.2006 09:00 PM EST
      </td>
      <td class="valueC">
      03.24.2006 09:00 PM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/">join a team</A>
      <br>
      <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">discuss the project</A>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_timeTrackerReports">Time Tracker Reports Tests</A>
      </td>
      <td class="valueC">
      <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Time Tracker Reports Tests">register</A>
      </td>
      <td class="valueC">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_timeTrackerReports">standings</A>
      </td>
      <td class="valueC">
      0
      </td>
      <td class="valueC">
      03.21.2006 09:00 PM EST
      </td>
      <td class="valueC">
      03.24.2006 09:00 PM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/">join a team</A>
      <br>
      <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">discuss the project</A>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_timeTrackerTime">Time Tracker Time Tests</A>
      </td>
      <td class="valueC">
      <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Time Tracker Time Tests">register</A>
      </td>
      <td class="valueC">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_timeTrackerTime">standings</A>
      </td>
      <td class="valueC">
      0
      </td>
      <td class="valueC">
      03.21.2006 09:00 PM EST
      </td>
      <td class="valueC">
      03.24.2006 09:00 PM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/">join a team</A>
      <br>
      <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">discuss the project</A>
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

