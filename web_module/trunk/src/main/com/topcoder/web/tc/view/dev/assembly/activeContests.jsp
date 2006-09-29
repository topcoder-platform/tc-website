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
   <tr><td class="title" colspan="8">Active Software Assembly Contests</td></tr>
   <tr>
      <td class="tableHeader" colspan="3" nowrap="nowrap">Contest</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Teams</td>
      <td class="tableHeader" align="center" nowrap="nowrap">1st Place</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Register By</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Submit By</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Forums</td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <img src="/i/development/smAOL_crop.gif" border="0" alt="" />
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_aolXmppGateway">AOL XMPP Gateway</A>
      </td>
      <td class="valueC">
      <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: AOL XMPP Gateway">register</A>
      <%--
      registration closed
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_aolXmppGateway">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_aolXmppGateway">standings</A>
      --%>
      </td>
      <td class="valueC">$15,000</td>
      <td class="valueC">
      10.09.2006 9:00 AM EST
      </td>
      <td class="valueC">
      10.23.2006 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506128">join a team</A>
      <br>
      <%--
      <A href="https://software.topcoder.com/forum/c_forum.jsp?f=23729399">discuss</A>
      --%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_payrollLink">Payroll Link Website and Reports</A>
      </td>
      <td class="valueC">
      <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Payroll Link Website and Reports">register</A>
      <%--
      registration closed
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_payrollLink">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_payrollLink">standings</A>
      --%>
      </td>
      <td class="valueC">$10,000</td>
      <td class="valueC">
      10.04.2006 9:00 AM EST
      </td>
      <td class="valueC">
      10.13.2006 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506126">join a team</A>
      <br>
      <%--
      <A href="https://software.topcoder.com/forum/c_forum.jsp?f=24018963">discuss</A>
      --%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <img src="/i/development/smAOL_crop.gif" border="0" alt="" />
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_syndicatedPolls">Syndicated Polls</A>
      </td>
      <td class="valueC">
      <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Syndicated Polls">register</A>
      <%--registration closed--%>
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_syndicatedPolls">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_syndicatedPolls">standings</A>
      --%>
      </td>
      <td class="valueC">$10,000</td>
      <td class="valueC">
      10.02.2006 9:00 AM EST
      </td>
      <td class="valueC">
      10.16.2006 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506119">join a team</A>
      <br>
      <A href="https://software.topcoder.com/forum/c_forum.jsp?f=24017049">discuss</A>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_costingEngineAdminTool">Costing Engine and Admin Tool</A>
      </td>
      <td class="valueC">
      <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Costing Engine and Admin Tool">register</A>
      <%--
      registration closed
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_costingEngineAdminTool">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_costingEngineAdminTool">standings</A>
      --%>
      </td>
      <td class="valueC">$15,000</td>
      <td class="valueC">
      10.01.2006 9:00 AM EST
      </td>
      <td class="valueC">
      10.19.2006 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506117">join a team</A>
      <br>
      <A href="https://software.topcoder.com/forum/c_forum.jsp?f=23729399">discuss</A>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_warehouseMgmtFunctions">Warehouse Management Phase 1 Warehouse Functions</A>
      </td>
      <td class="valueC">
      <%--
      <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Warehouse Management Phase 1 Warehouse Functions">register</A>
      --%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_warehouseMgmtFunctions">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_warehouseMgmtFunctions">standings</A>
      --%>
      </td>
      <td class="valueC">$7,000</td>
      <td class="valueC">
      09.15.2006 9:00 AM EST
      </td>
      <td class="valueC">
      10.02.2006 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506090">join a team</A>
      <br>
      <A href="https://software.topcoder.com/forum/c_forum.jsp?f=23219504">discuss</A>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_warehouseMgmtReport">Warehouse Management Phase 1 Reporting</A>
      </td>
      <td class="valueC">
      <%--
      <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Warehouse Management Phase 1 Reporting">register</A>
      --%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_warehouseMgmtReport">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_warehouseMgmtReport">standings</A>
      --%>
      </td>
      <td class="valueC">$2,000</td>
      <td class="valueC">
      08.15.2006 9:00 AM EST
      </td>
      <td class="valueC">
      08.28.2006 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506089">join a team</A>
      <br>
      <A href="https://software.topcoder.com/forum/c_forum.jsp?f=23213095">discuss</A>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_reviewProjectAdmin">Online Review Project Admin and Details</A>
      </td>
      <td class="valueC">
      <%--
      <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Online Review Project Admin and Details">register</A>
      --%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_reviewProjectAdmin">results</A>
      --%>
      </td>
      <td class="valueC">
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_reviewProjectAdmin">standings</A>
      </td>
      <td class="valueC">$10,000</td>
      <td class="valueC">
      08.10.2006 9:00 AM EST
      </td>
      <td class="valueC">
      08.25.2006 12:00 Noon EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506082">join a team</A>
      <br>
      <A href="https://software.topcoder.com/forum/c_forum.jsp?f=23128845">discuss</A>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_reviewProjectReview">Online Review Project Review</A>
      </td>
      <td class="valueC">
      <%-- 
      <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Online Review Project Review">register</A>
      --%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_reviewProjectReview">results</A>
      --%>
      </td>
      <td class="valueC">
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_reviewProjectReview">standings</A>
      </td>
      <td class="valueC">$10,000</td>
      <td class="valueC">
      08.10.2006 9:00 AM EST
      </td>
      <td class="valueC">
      08.25.2006 12:00 Noon EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506083">join a team</A>
      <br>
      <A href="https://software.topcoder.com/forum/c_forum.jsp?f=23128806">discuss</A>
      </td>
   </tr>
   <% even = !even;%>
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
      <td class="valueC">$5,000</td>
      <td class="valueC">
      07.21.2006 9:00 PM EST
      </td>
      <td class="valueC">
      08.02.2006 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">

      <%--
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506064">join a team</A>
      <br>
      --%>
      <A href="https://software.topcoder.com/forum/c_forum.jsp?f=22883020">discuss</A>
      </td>
   </tr>
<%--   <% even = !even;%> --%>

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

