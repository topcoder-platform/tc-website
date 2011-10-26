<%@ page contentType="text/html;charset=utf-8" %>
<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder</title>

<jsp:include page="script.jsp" />
<jsp:include page="style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
          <jsp:include page="includes/global_left.jsp">
              <jsp:param name="level1" value="long_contests"/>
              <jsp:param name="level2" value="intel"/>
          </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div align="center">
   <div style="width: 500px; text-align: left;">

    <jsp:include page="page_title.jsp">
        <jsp:param name="image" value="long_comps_intel"/>
        <jsp:param name="title" value="Active Contests"/>
    </jsp:include>

<p align="center">
<A href="/longcontest/?module=Static&d1=intel_overview">Overview</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=Static&d1=intel_instructions">How to Compete</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=Static&d1=intel_rules">Rules</A>&#160;&#160;|&#160;&#160;
Active Contests&#160;&#160;|&#160;&#160;
<%--
<A href="/longcontest/?module=ViewActiveContests&rt=15">Active Contests</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=ViewPractice&rt=16">Practice</A>&#160;&#160;|&#160;&#160;
--%>
<A href="/longcontest/?module=Static&d1=intel_resources">ISN Resources</A>
</p>
<br><br>
<span class="bigRed">Due to unforeseen problems with our tester hardware configuration, we are currently unable to accept submissions.  Round registration and the problem statement will be available at the previously posted time.  We're working to resolve our hardware issues and will enable submissions as soon as possible.  We apologize for the inconvenience.</span>
<br><br>
<div align="center"><A href="/longcontest/?module=ViewActiveContests&rt=15">view Active Contests</A></div>
   </div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
          <jsp:include page="public_right.jsp">
              <jsp:param name="level1" value="privatelabel"/>
          </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="foot.jsp"/>

</body>

</html>
