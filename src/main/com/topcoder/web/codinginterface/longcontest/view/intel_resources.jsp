<%@ page contentType="text/html;charset=utf-8" %>
<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder</title>

    <jsp:include page="script.jsp" />
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
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
          <jsp:include page="/includes/global_left.jsp">
              <jsp:param name="level1" value="long_contests"/>
              <jsp:param name="level2" value="intel_overview"/>
          </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div align="center">
   <div style="width: 500px; text-align: left;">

    <jsp:include page="page_title.jsp">
        <jsp:param name="image" value="long_comps_intel"/>
        <jsp:param name="title" value="Resources"/>
    </jsp:include>

<p align="center">
<A href="/longcontest/?module=Static&d1=intel_overview">Overview</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=Static&d1=intel_instructions">How to compete</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=Static&d1=intel_rules">Rules</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=ViewActiveContests&rt=15">Active Contests</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=ViewPractice&rt=16">Practice</A>&#160;&#160;|&#160;&#160;
ISN Resources
</p>
<span class="bodySubtitle">Intel&#174; Software Network Resources</span><br>
Explore the <A href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/index.htm">The Intel&#174; Software Network's</A> wealth of resources to discover how they can benefit you in the TopCoder competition!
<br><br>
Intel&#174; Software Network is your doorway to the broad range of programs, products, resources and content available to the software community through Intel. Understand new technologies, speed your development cycle, and join the vibrant Intel Software Network community. 
<br><br>
<div align="center" class="bodySubtitle"><A href="/?t=sponsor&c=link&link=https://or1cedar.cps.intel.com/isnReg/isnRegpage.aspx?TARGET=http://www.intel.com/cd/ids/developer/asmo-na/eng/index.htm">Click Here to Join Now - it's Free!</A></div>
<br><br>
Intel&#174; Software Network has the information, tools and education you need. 
<ul>
<li>Get <A href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/dc/index.htm">the technical content</A> you need in focused topic areas such as the latest Intel processors, and the technologies relevant to developing and deploying applications on Intel architecture.
</ul>
The Intel&#174; Software College offers online and classroom courses on topics including Digital Media, Gaming, Migration, and Multi-core. Check out hundreds of offerings on topics like Multi-threading, Moving to Multi-core, character animation for Gaming, or Enhancing Performance with the Intel&#174; Compiler.
<br><br>
Visit our <A href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/dc/threading/index.htm">Threading Developer Center</A>, access an entire site dedicated to content that can help your success in the Intel Top Coder Challenges.
<br><br>
Explore Intel Software Network's <A href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/dc/threading/knowledgebase/index.htm">Threading Knowledge Base</A>, for fast access to question/answer scenarios.  Use the knowledge base and get a leg up on the competition!
<ul>
<li>Take advantage of Intel's platform expertise in our <A href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/strategy/multicore/index.htm">Multi-Core Processing Developer Center</A>. We can help you harness the combined throughput of multiple cores, and empower you to define the future of computing.</li>
<li>Check out <A href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/dc/code/index.htm">Code Central</A>, our ever-growing library of code samples.</li>
<li>Explore our <A href="/?t=sponsor&c=link&link=http://www.intel.com/cd/software/products/asmo-na/eng/index.htm">Software Products</A>, and create applications with development tools built from our knowledge of hardware.</li>
<li><ul>
   <li>Compilers - maximize your application performance on Intel&#174; architecture</li>
   <li>Performance Libraries - accelerate your application development</li>
   <li><A href="/?t=sponsor&c=link&link=http://www.intel.com/cd/software/products/asmo-na/eng/threading/219783.htm">Threading Tools</A> - get the essential tools you need, including <A href="/?t=sponsor&c=link&link=http://www.intel.com/support/performancetools/threadchecker">Intel&#174; Thread Checker</A> and <A href="/?t=sponsor&c=link&link=http://www.intel.com/support/performancetools/threadprofiler">Intel&#174; Thread Profiler</A></li>
</ul></li>
<li>Subscribe to <A href="/?t=sponsor&c=link&link=http://sdd.intelmktg.com/?pin=AEAFACAFAHAMAA34">The Intel&#174; Software Dispatch</A>, where membership includes quarterly DVDs that provide software tools, in-depth technical content, and industry strategies.</li>
<li>Join the discussions in our <A href="/?t=sponsor&c=link&link=http://softwareforums.intel.com/ids">Community Forums</A>, including the Intel Tools Forums, and the Platform and Technology discussion areas. Tap into the knowledge of our experts and your peers to meet the challenge of developing powerful OS and application-level threaded apps for server and desktop environments alike.</li>
</ul>
<br><br>

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
