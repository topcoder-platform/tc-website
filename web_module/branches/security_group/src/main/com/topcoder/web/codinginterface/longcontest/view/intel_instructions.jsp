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
        <jsp:param name="title" value="How to Compete"/>
    </jsp:include>

<p align="center">
<A href="/longcontest/?module=Static&d1=intel_overview">Overview</A>&#160;&#160;|&#160;&#160;
How to Compete&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=Static&d1=intel_rules">Rules</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=ViewActiveContests&rt=15">Active Contests</A>&#160;&#160;|&#160;&#160;
<%--
<A href="/longcontest/?module=ViewPractice&rt=16">Practice</A>&#160;&#160;|&#160;&#160;
--%>
<A href="/longcontest/?module=Static&d1=intel_resources">ISN Resources</A>
</p>
<span class="bigTitle">How to Compete</span>
<br><br>
<span class="bodySubtitle">Registration</span><br>
In order to compete in an Intel Software Network Multi-threading Competition Series event, one must first register. One may register at any time during the submission phase. The submission phase for each of the 12 events will last for two weeks each. In order to register, you will need to click Register next to the appropriate Multi-threading Competition Series event within the Active Contests list and agree to the rules of the event. Once registered, you may view the problem statement for that particular Multi-threading Competition Series event by clicking the Problem Name from within the Active Contests list. During the submission phase, problem statements will only be made available to TopCoder members who are specifically registered for that event.
<br><br>
<span class="bodySubtitle">Problem Statements</span><br>
During the Intel Software Network Multi-threading Competition Series, the types of problems and the associated scoring mechanism will vary for each month's problem. A description of the scoring mechanism will be provided in the problem statement each month. Competitors will have to understand the scoring mechanism in order to effectively compete.  The problems will be designed such that a solution that is properly threaded will tend to have a performance advantage over those that are not threaded resulting in a higher score for threaded submissions.  Each problem in the event series may have different memory usage constraints, threading constraints, and scoring criteria.  These specifics will be outlined in the problem statement form each event in the series.  
<br><br>
<span class="bodySubtitle">Submitting Solutions</span><br>
All members registered for a specific Intel Software Network Multi-threading Competition Series event will see a Submit option for that event. Clicking the Submit link will take you to a page that will allow you to paste in a solution, select the proper language and either submit (for compilation and testing) or save your code. When the Submit button is selected, the code will be immediately compiled. Any compilation messages or errors will be shown in the Messages Area. If the compilation was successful, the submission will then be placed on a queue for automated system testing.  Example test cases will not be tested.  When your submission has been processed, you will receive an email indicating such and your place in the standings will be adjusted accordingly.   During the submission phase, overall ranking is the only piece of information that will be made available.  A given competitor will only be allowed to submit once every 4 hours - other than that there are no restrictions on the number of submissions that each competitor may perform.
<br><br>
Clicking the Test Examples button will immediately compile and place your submission on a queue for automated testing of just the example test cases. Detailed feedback will be made available when the tests are complete, including processing time, score, and any output from the program. Competitors may submit test examples once every 30 minutes. The competitor's rank and overall score will not be updated.
<br><br>
In a Multi-threading Series event, all competitors are encouraged to improve their solutions and resubmit iteratively throughout the two weeks of the submission phase. The most recent submission is always the one that counts, so if you make a submission that does not score as well as a prior submission, the most recent will still be the one that counts in the standings.
<br><br>
<span class="bodySubtitle">Languages</span><br>
Competitors may submit solutions to be compiled in one of the following languages:<br>
Java<br>
C++<br>
C# .NET<br>
VB .NET
<br><br>
Note: The language must be appropriately selected on the submission screen.
<br><br>
<span class="bodySubtitle">Hardware</span><br>
Each individual test case will be run against a competitor's submission on a dedicated machine with the following specifications:
<br><br>
<A href="/?t=sponsor&c=link&link=http://intel.com/business/bss/products/server/dual-core-xeon.htm" target="_blank">4 (Paxville) Dual-Core Intel&#174; Xeon&#174; 3GHz processors with 8 MB L2 Cache</A>
<br><br>
<A href="/?t=sponsor&c=link&link=http://www.intel.com/products/chipsets/e8500/index.htm" target="_blank">Intel&#174; E8500 chipset (Twin Castle)</A>
<br><br>
<span class="bodySubtitle">Viewing Match Standings</span><br>
At any time during an Intel Software Network Multi-threading Competition Series event, TopCoder members may view the latest standings of that event. This will show the current score (for the latest submission) for each member who has registered for that event, their rank, and the number of submissions they have performed during the event. Clicking on the submission count will display the date, time, and point-in-time score of each submission for a given participant.
<br><br>
<span class="bodySubtitle">Match results</span><br>
Once the submission phase of an Intel Software Network Multi-threading Competition Series event has ended, system testing will begin.  During System Testing each competitors' submission will be run through a suite of system test cases and assigned a score based on the rules outlined in the problem statement.  Only this final score will be used in determining the results of each match.
<br><br>
Once system testing is complete, the final results will become available by clicking the Results link. Competitors will be able to see the test cases, other competitors' submissions, and the testing results.
<br><br>
Competitors will have 24 hours from the end of the system testing phase of each event to submit any scoring appeals. All appeals must be submitted to service@topcoder.com in order to be considered. Prize winners will be notified via email at the conclusion of the appeals period for each even
<br><br>
<span class="bodySubtitle">Competition Series Schedule</span><br>
The Intel Software Network Multi-threading Competition Series event schedule will be as follows:
<br><br>

<div align="center">
<table width="500" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
<tr>
   <td class="sidebarTitle" width="33%">
   Competition
   </td>
   <td class="sidebarTitle" width="33%">
   Registration
   </td>
   <td class="sidebarTitle" width="33%">
   Deadline
   </td>
</tr>
<tr>
   <td class="sidebarText">
   Competition 1
   </td>
   <td class="sidebarText">
   January 25, 2006<br>12:00 Noon EST
   </td>
   <td class="sidebarText">
   February 8, 2006<br>12:00 Noon EST
   </td>
</tr>
<tr>
   <td class="sidebarText">
   Competition 2
   </td>
   <td class="sidebarText">
   February 22, 2006<br>12:00 Noon EST
   </td>
   <td class="sidebarText">
   March 8, 2006<br>12:00 Noon EST
   </td>
</tr>
<tr>
   <td class="sidebarText">
   Competition 3
   </td>
   <td class="sidebarText">
   March 22, 2006<br>12:00 Noon EST
   </td>
   <td class="sidebarText">
   April 5, 2006<br>12:00 Noon EDT
   </td>
</tr>
<tr>
   <td class="sidebarText">
   Competition 4
   </td>
   <td class="sidebarText">
   April 19, 2006<br>12:00 Noon EDT
   </td>
   <td class="sidebarText">
   May 3, 2006<br>12:00 Noon EDT
   </td>
</tr>
<tr>
   <td class="sidebarText">
   Competition 5
   </td>
   <td class="sidebarText">
   May 17, 2006<br>12:00 Noon EDT
   </td>
   <td class="sidebarText">
   May 31, 2006<br>12:00 Noon EDT
   </td>
</tr>
<tr>
   <td class="sidebarText">
   Competition 6
   </td>
   <td class="sidebarText">
   June 14, 2006<br>12:00 Noon EDT
   </td>
   <td class="sidebarText">
   June 28, 2006<br>12:00 Noon EDT
   </td>
</tr>
<tr>
   <td class="sidebarText">
   Competition 7
   </td>
   <td class="sidebarText">
   July 19, 2006<br>12:00 Noon EDT
   </td>
   <td class="sidebarText">
   August 2, 2006<br>12:00 Noon EDT
   </td>
</tr>
<tr>
   <td class="sidebarText">
   Competition 8
   </td>
   <td class="sidebarText">
   August 16, 2006<br>12:00 Noon EDT
   </td>
   <td class="sidebarText">
   August 30, 2006<br>12:00 Noon EDT
   </td>
</tr>
<tr>
   <td class="sidebarText">
   Competition 9
   </td>
   <td class="sidebarText">
   September 13, 2006<br>12:00 Noon EDT
   </td>
   <td class="sidebarText">
   September 27, 2006<br>12:00 Noon EDT
   </td>
</tr>
<tr>
   <td class="sidebarText">
   Competition 10
   </td>
   <td class="sidebarText">
   October 18, 2006<br>12:00 Noon EDT
   </td>
   <td class="sidebarText">
   November 1, 2006<br>12:00 Noon EST
   </td>
</tr>
<tr>
   <td class="sidebarText">
   Competition 11
   </td>
   <td class="sidebarText">
   November 15, 2006<br>12:00 Noon EST
   </td>
   <td class="sidebarText">
   November 29, 2006<br>12:00 Noon EST
   </td>
</tr>
<tr>
   <td class="sidebarText">
   Competition 12
   </td>
   <td class="sidebarText">
   December 13, 2006<br>12:00 Noon EST
   </td>
   <td class="sidebarText">
   December 27, 2006<br>12:00 Noon EST
   </td>
</tr>
<tr>
   <td class="sidebarText" colspan="3">
   *Please note the change in Daylight Saving Time in April and October for deadlines.
   </td>
</tr>
</table>
</div>
<br><br>
<span class="bodySubtitle">Prizes</span><br>
The prizes for each of the 12 monthly events will have the following structure:
<br><br>
<div align="center">
<table width="300" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
<tr>
   <td class="sidebarTitle" width="50%">
   Place
   </td>
   <td class="sidebarTitle" width="50%" align="right">
   Prize
   </td>
</tr>
<tr>
   <td class="sidebarText">
   1st Place
   </td>
   <td class="sidebarText" align="right">
   $2,500
   </td>
</tr>
<tr>
   <td class="sidebarText">
   2nd Place
   </td>
   <td class="sidebarText" align="right">
   $1,000
   </td>
</tr>
<tr>
   <td class="sidebarText">
   3rd Place
   </td>
   <td class="sidebarText" align="right">
   $750
   </td>
</tr>
<tr>
   <td class="sidebarText">
   4th Place
   </td>
   <td class="sidebarText" align="right">
   $500
   </td>
</tr>
<tr>
   <td class="sidebarText">
   5th Place
   </td>
   <td class="sidebarText" align="right">
   $250
   </td>
</tr>
</table>
</div>

<br><br>
Placement will always be dependant on final score at the end of each event.  The rules for calculating final score will be specific to each problem and outlined within the problem statement of each series event.
<br><br>
<span class="bodySubtitle">Forums</span><br>
Any specific event competitors should regularly check the forum associated with that specific series event during the length of the submission phase.  Any issue resolution or problem clarifications will be posted to this forum.  It is the responsibility of each competitor to check for any information or updates in this forum during the length of each event.
<br><br>
A forum will be created for each event in the Multi-threading competition series <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=17">here</A>.
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
