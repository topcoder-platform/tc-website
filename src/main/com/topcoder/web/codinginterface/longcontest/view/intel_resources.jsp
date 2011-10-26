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
            <jsp:param name="node" value="long_intelmtcs"/>
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
<A href="/longcontest/?module=Static&d1=intel_instructions">How to Compete</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=Static&d1=intel_rules">Rules</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=ViewActiveContests&rt=15">Active Contests</A>&#160;&#160;|&#160;&#160;
<%--
<A href="/longcontest/?module=ViewPractice&rt=16">Practice</A>&#160;&#160;|&#160;&#160;
--%>
ISN Resources
</p>
<span class="bodySubtitle">Intel&#174; Software Network Resources</span><br>
Explore the <A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/index.htm">The Intel&#174; Software Network</A>'s wealth of resources to discover how they can benefit you in the Multi-Threading Competition Series!
<br><br>
<div class="bodySubtitle" align="center">
<A target="_blank" href="/?t=sponsor&c=link&link=https://or1cedar.cps.intel.com/isnReg/isnRegpage.aspx?TARGET=http://www.intel.com/cd/ids/developer/asmo-na/eng/index.htm">Click Here to Join Now - it's Free!</A>
</div>
<br><br>
Intel&#174; Software Network has the information, tools and education you need. 
<br><br>
<ul>
<li>Developer Centers: Get the <A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/dc/index.htm">technical content</A> you need in focused topic areas such as the latest Intel processors, and the technologies relevant to developing and deploying applications on Intel architecture.</li>
   <ul>
   <li>Visit our <A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/dc/threading/index.htm">Threading Developer Center</A>, access an entire site dedicated to content that can help your success in the Multi-Threading Competition Series.</li>
   <li>Get Started on Threading:  Here is a sampling of some of the many popular multi-core and threading articles that will get you started and help you bring your best to the competition:</li>
      <ul>
      <li><A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/219575.htm">Nuts and Bolts of Multi-Threaded Programming</A></li>
      <li><A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/220999.htm">Multi-Core Primer</A></li>
      <li><A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/238663.htm">Multi-Core Technology and Solutions</A> - with excellent flash demo on multi-core!</li>
      <li><A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/221188.htm">Intel Multi-Core Processor Architecture: FAQ</A></li>
      </ul>
   </ul>
<li>Intel&#174; Software College: <A target="_blank" href="/?t=sponsor&c=link&link=http://or1cedar.cps.intel.com/softwarecollege/">The Intel&#174; Software College</A> offers online and classroom courses on hundreds of topics including multi-core / threading and more. The online course <A target="_blank" href="/?t=sponsor&c=link&link=http://or1cedar.cps.intel.com/softwarecollege/CourseDetails.asp?courseID=222">"Multi-threading - Beginning Through Advanced"</A> is a great way to get started on your threading education. Check out offerings on <A target="_blank" href="/?t=sponsor&c=link&link=http://or1cedar.cps.intel.com/softwarecollege/CourseDetails.asp?courseID=222">multi-threading</A>, <A target="_blank" href="/?t=sponsor&c=link&link=http://or1cedar.cps.intel.com/softwarecollege/CourseDetails.asp?courseID=1">moving to multi-core</A>, <A target="_blank" href="/?t=sponsor&c=link&link=http://or1cedar.cps.intel.com/softwarecollege/CourseDetails.asp?courseID=58">character animation for gaming</A>, or <A target="_blank" href="/?t=sponsor&c=link&link=http://or1cedar.cps.intel.com/softwarecollege/CourseDetails.asp?courseID=105">enhancing performance with the Intel&#174; Compiler</A> and more.</li>
<li>Intel&#174; Software Products: Explore our <A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/software/products/asmo-na/eng/index.htm">Software Products</A> and create and thread your applications with development tools built from our knowledge of hardware.</li>
   <ul>
   <li><A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/software/products/asmo-na/eng/compilers/index.htm">Compilers</A> - maximize your application performance on Intel&#174; architecture</li>
   <li><A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/software/products/asmo-na/eng/perflib/index.htm">Performance Libraries</A> - accelerate your application development </li>
   <li><A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/software/products/asmo-na/eng/threading/219783.htm">Threading Tools</A> - get the essential tools you need, including <A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/support/performancetools/threadchecker">Intel&#174; Thread Checker</A> and <A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/support/performancetools/threadprofiler">Intel&#174; Thread Profiler </A></li>
   <li>VTune&#153; Analyzers - maximize your application performance</li>
   </ul>
<li>Community Forums: Join the discussions in our <A target="_blank" href="/?t=sponsor&c=link&link=http://softwareforums.intel.com/ids">Community Forums</A>, including the Intel Tools Forums, and the Platform and Technology discussion areas. Tap into the threading knowledge of our experts and your peers to meet the challenge of developing powerful OS and application-level threaded apps for server and desktop environments alike.</li>
<li>Downloads: Check out <A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/dc/code/index.htm">Code Central</A>, our ever-growing library of code samples.</li>
<li>Intel&#174; Software Dispatch: Subscribe to <A target="_blank" href="/?t=sponsor&c=link&link=http://sdd.intelmktg.com/?pin=AEAFACAFAHAMAA34">The Intel&#174; Software Dispatch</A>, where membership includes quarterly DVDs that provide software tools, in-depth technical content, and industry strategies.</li>
<li><A target="_blank" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/strategy/multicore/index.htm">Multi-core Portal</A>: This is a high-level door-way to a variety of multi-core content for the developer as well as other audiences like marketing, strategists and anyone looking to learn more about multi-core.</li>
</ul>
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
