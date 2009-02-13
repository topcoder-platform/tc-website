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
<%--
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_wmsOrderReceiveProcess">Warehouse Management Phase 2 - <br>Ordering, Receiving and Processing</A>
      </td>
      <td class="valueC">
      <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Warehouse Management Phase 2 - Ordering, Receiving and Processing">register</A>
      <!--registration closed-->
      </td>
      <td class="valueC">
      &#160;
      <!--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_wmsOrderReceiveProcess">results</A>
      -->
      </td>
      <td class="valueC">
      &#160;
      <!-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_wmsOrderReceiveProcess">standings</A>
      -->
      </td>
      <td class="valueC">$11,000</td>
      <td class="valueC">
      02.05.2007 9:00 AM EST
      </td>
      <td class="valueC">
      02.26.2007 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506269">join a team</A>
      <br>
      <!--<A href="">discuss</A>-->
      </td>
   </tr>
   <% even = !even;%>
--%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_warehouseMgmtRepPhase2">Warehouse Management Phase 2 Reporting</A>
      </td>
      <td class="valueC">
      <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Warehouse Management Phase 2 Reporting">register</A>
      <%--registration closed--%>
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_warehouseMgmtRepPhase2">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_warehouseMgmtRepPhase2">standings</A>
      --%>
      </td>
      <td class="valueC">$3,500</td>
      <td class="valueC">
      02.02.2007 9:00 AM EST
      </td>
      <td class="valueC">
      02.16.2007 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506263">join a team</A>
      <br>
      <%--<A href="">discuss</A>--%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_pmcProduct">PMC Product</A>
      </td>
      <td class="valueC">
      <%--<A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: PMC Product">register</A>--%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_pmcProduct">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_pmcProduct">standings</A>
      --%>
      </td>
      <td class="valueC">$8,000</td>
      <td class="valueC">
      01.28.2007 9:00 AM EST
      </td>
      <td class="valueC">
      02.15.2007 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506260">join a team</A>
      <br> 
      <%--<A href="">discuss</A>--%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_pmcOffline">PMC Offline</A>
      </td>
      <td class="valueC">
      <%--<A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: PMC Offline">register</A>--%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_pmcOffline">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_pmcOffline">standings</A>
      --%>
      </td>
      <td class="valueC">$8,000</td>
      <td class="valueC">
      01.28.2007 9:00 AM EST
      </td>
      <td class="valueC">
      02.15.2007 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506261">join a team</A>
      <br> 
      <%--<A href="">discuss</A>--%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_pmcUser">PMC User</A>
      </td>
      <td class="valueC">
      <%--<A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: PMC User">register</A>--%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_pmcUser">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_pmcUser">standings</A>
      --%>
      </td>
      <td class="valueC">$8,000</td>
      <td class="valueC">
      01.28.2007 9:00 AM EST
      </td>
      <td class="valueC">
      02.09.2007 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506259">join a team</A>
      <br> 
      <%--<A href="">discuss</A>--%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_reportGeneration">Report Generation</A>
      </td>
      <td class="valueC">
      <%--<A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Report Generation">register</A>--%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_reportGeneration">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_reportGeneration">standings</A>
      --%>
      </td>
      <td class="valueC">$15,000</td>
      <td class="valueC">
      01.24.2007 9:00 AM EST
      </td>
      <td class="valueC">
      02.04.2007 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506258">join a team</A>
      <br>
      <%--<A href="">discuss</A>--%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_researchClient">Research Client</A>
      </td>
      <td class="valueC">
      <%--<A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Research Client">register</A>--%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_researchClient">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_researchClient">standings</A>
      --%>
      </td>
      <td class="valueC">$20,000</td>
      <td class="valueC">
      01.17.2007 9:00 AM EST
      </td>
      <td class="valueC">
      02.18.2007 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506250">join a team</A>
      <br>
      <%--<A href="">discuss</A>--%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_researchServer">Research Server</A>
      </td>
      <td class="valueC">
      <%--<A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Research Server">register</A>--%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_researchServer">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_researchServer">standings</A>
      --%>
      </td>
      <td class="valueC">$12,000</td>
      <td class="valueC">
      01.17.2007 9:00 AM EST
      </td>
      <td class="valueC">
      02.08.2007 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506249">join a team</A>
      <br>
      <%--<A href="">discuss</A>--%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_metricReporting">Metric Reporting System</A>
      </td>
      <td class="valueC">
      <%--<A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Metric Reporting System">register</A>--%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_metricReporting">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_metricReporting">standings</A>
      --%>
      </td>
      <td class="valueC">$15,000</td>
      <td class="valueC">
      01.11.2007 9:00 AM EST
      </td>
      <td class="valueC">
      02.01.2007 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506251">join a team</A>
      <br>
      <%--<A href="">discuss</A>--%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_instrumentReport">Instrumentation Reporting</A>
      </td>
      <td class="valueC">
      <%--<A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Instrumentation Reporting">register</A>--%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_instrumentReport">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_instrumentReport">standings</A>
      --%>
      </td>
      <td class="valueC">$25,000</td>
      <td class="valueC">
      12.18.2006 9:00 AM EST
      </td>
      <td class="valueC">
      01.08.2007 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506205">join a team</A>
      <br>
      <%--<A href="">discuss</A>--%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_expertNetwork">Expert Network Application</A>
      </td>
      <td class="valueC">
      <%--<A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Expert Network Application">register</A>--%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_expertNetwork">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_expertNetwork">standings</A>
      --%>
      </td>
      <td class="valueC">$14,000</td>
      <td class="valueC">
      12.10.2006 9:00 AM EST
      </td>
      <td class="valueC">
      12.24.2006 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506195">join a team</A>
      <br>
      <%--<A href="">discuss</A>--%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_orpheusAuction">Orpheus Auction Module</A>
      </td>
      <td class="valueC">
      <%--<A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Orpheus Auction Module">register</A>--%>
      registration closed 
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_orpheusAuction">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_orpheusAuction">standings</A>
      --%>
      </td>
      <td class="valueC">$14,000</td>
      <td class="valueC">
      12.08.2006 9:00 AM EST
      </td>
      <td class="valueC">
      12.18.2006 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506174">join a team</A>
      <br>
      <%--<A href="">discuss</A>--%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_orpheusAdmin">Orpheus Administration Module</A>
      </td>
      <td class="valueC">
      <%--<A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Expert Network Application">register</A>--%>
      registration closed
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_orpheusAdmin">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_orpheusAdmin">standings</A>
      --%>
      </td>
      <td class="valueC">$14,000</td>
      <td class="valueC">
      12.02.2006 9:00 AM EST
      </td>
      <td class="valueC">
      12.13.2006 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506173">join a team</A>
      <br>
      <%--<A href="">discuss</A>--%>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap>
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_orpheusGameServer">Orpheus Game Server and Client Modules</A>
      </td>
      <td class="valueC">
      <%--<A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Orpheus Game Server and Client Modules">register</A>--%>
      registration closed        
      </td>
      <td class="valueC">
      &#160;
      <%--   
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=res_orpheusGameServer">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%-- 
      <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sta_orpheusGameServer">standings</A>
      --%>
      </td>
      <td class="valueC">$30,000</td>
      <td class="valueC">
      11.17.2006 9:00 AM EST
      </td>
      <td class="valueC">
      12.08.2006 9:00 AM EST
      </td>
      <td class="valueC" nowrap="nowrap">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=506175">join a team</A>
      <br>
      <%--<A href="">discuss</A>--%>
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

