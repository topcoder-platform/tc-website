<%@ page contentType="text/html;charset=utf-8" %>
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
<%-- Left Column Begins--%>
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="level1" value="long_contests"/>
        <jsp:param name="level2" value="intel_overview"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div style="width: 500px; text-align: left;">

<div align="center" style="padding-top: 15px;">
<img src="/i/longcontest/intel_banner_plain.gif" alt="" border="0"/>
</div>

<p align="center">
<A href="/longcontest/?module=Static&d1=intel_overview">Overview</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=Static&d1=intel_instructions">How to compete</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=Static&d1=intel_rules">Rules</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=ViewActiveContests&rt=15">Active Contests</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=ViewPractice&rt=16">Practice</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=Static&d1=intel_resources">ISN Resources</A>
</p>

<span class="bodySubtitle">Intel&#174; Software Network Multi-threading Competition Series</span><br>
Intel&#174; Software Network and TopCoder are hosting a 12-month series of world-wide competitions for multi-threading on multi-core microprocessors. You could win cash prizes!  Access the <A href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/index.htm">Intel Software Network</A> for all the latest on threading principles, and then put your knowledge to the ultimate test solving coding problems. Mark your calendars! The first competition will be held January 25, 2006, and will last for two weeks. (A new competition will be held every month following in 2006.)
<br><br>
You could win Monthly Cash Prizes:
<br><br>
<strong>
Champion - $2,500<br>
2nd Place - $1,000<br>
3rd Place - $750<br>
4th Place - $500<br>
5th Place - $250
</strong>
<br><br>
This unique contest is designed to help teach threading principles to the software developer community. Competitors will face threading challenges based on real-world customer situations.  Each competitor's solution will be evaluated against a set of criteria for the best threading practices. 
<br><br>
By holding this competition, we hope to raise awareness of threading and the opportunities it presents, so you can create the very best software applications and solutions.  The ultimate goal is to identify, attract and create proficient multi-threading programmers world-wide. Compete and learn the benefits of threaded code, and how to design and create the optimum threaded code and solutions!  Get a chance to test your competition submissions on state-of-the-art,  cutting-edge, multi-core Intel processors!  In order to participate, you will need to be a registered TopCoder member.  
<br><br>
See the <A href="/longcontest/?module=Static&d1=intel_rules">rules and regulations</A> for more details.
<br><br>
<span class="bodySubtitle">Not Yet a TopCoder Member?</span><br>
Register <A href="/Registration">here</A>.
<br><br>

   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<jsp:include page="foot.jsp"/>
</body>
</html>