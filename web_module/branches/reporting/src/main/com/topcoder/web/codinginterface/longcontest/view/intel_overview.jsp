<%@ page contentType="text/html;charset=utf-8" %>
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
<%-- Left Column Begins--%>
<td width="180">
         <jsp:include page="includes/global_left.jsp">
            <jsp:param name="node" value="long_intelmtcs"/>
         </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div style="width: 500px; text-align: left;">

<div align="center" style="padding-top: 15px;">
<map name="tco06_map">
<area shape="rect" alt="" coords="20,0,117,118" href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/index.htm" target="_blank" />
</map>
<img src="/i/longcontest/intel_banner_plain.gif" alt="" border="0" usemap="#tco06_map" />
</div>

<p align="center">
Overview&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=Static&d1=intel_instructions">How to Compete</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=Static&d1=intel_rules">Rules</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=ViewActiveContests&rt=15">Active Contests</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=Static&d1=intel_resources">ISN Resources</A>
</p>

<span class="bodySubtitle">Intel&#174; Software Network Multi-threading Competition Series</span><br>
Intel&#174; Software Network and TopCoder are hosting a 12-month series of world-wide competitions for multi-threading on multi-core microprocessors. You could win cash prizes!  Access the <A href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/index.htm">Intel Software Network</A> for all the latest on threading principles, and then put your knowledge to the ultimate test solving coding problems. Mark your calendars! The first competition will be held January 25, 2006, and will last for two weeks. (A new competition will be held every month following in 2006.)
<br><br>
<strong>Registration</strong><br>
In order to compete in a Marathon Match one must first register. One may register at any time during the submission phase. The submission phase will last for an extended period of time (a week for example). In order to register, you will need to click Register next to the appropriate Marathon Match within the <A href="/longcontest">Active Contests</A> list, agree to the rules of the event and you may need to answer a survey question.  Once registered, you may view the problem statement for the Marathon Match by clicking the Problem Name from within the Active Contests list.  During the submission phase, problem statements will only be made available to members who are registered for that specific event.
<br><br>
<strong>Submitting a solution</strong><br>
Unlike traditional algorithm competitions, the system is not necessarily testing for correctness. In Marathon Matches, the scoring mechanism may be different for each problem. A description of the scoring mechanism will be provided in the problem statement. Competitors will have to understand the scoring mechanism in order to effectively compete.
<br><br>
All members registered for a specific Marathon Match will see a Submit option for that event.  Clicking the Submit link will take you to a page that will allow you to paste in a solution, select the proper language, and either submit (for compilation and testing) or save your code.  When the Submit button is selected, the code will be immediately compiled.  Any compilation messages or errors will be shown in the Messages Area.  If the compilation was successful, the submission will then be placed on a queue for automated system testing.  When your submission has been processed, you will receive an email indicating such and your place in the standings will be adjusted accordingly.  During the submission phase, rank is the only piece of information that will be made available.
<br><br>
By holding this competition, we hope to raise awareness of threading and the opportunities it presents, so you can create the very best software applications and solutions.  The ultimate goal is to identify, attract and create proficient multi-threading programmers world-wide. Compete and learn the benefits of threaded code, and how to design and create the optimum threaded code and solutions!  Get a chance to test your competition submissions on state-of-the-art,  cutting-edge, multi-core Intel processors!  In order to participate, you will need to be a registered TopCoder member.
<br><br>
See the <A href="/longcontest/?module=Static&d1=intel_rules">rules and regulations</A> for more details.
<br><br>
<strong>Match results</strong><br>
Once the submission phase of a Marathon Match has ended, the final results will become available by clicking the Results link.  Competitors will be able to see the test cases, other competitors' submissions, and results.
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