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
        <jsp:param name="title" value="Rules & Regulations"/>
    </jsp:include>

<p align="center">
<A href="/longcontest/?module=Static&d1=intel_overview">Overview</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=Static&d1=intel_instructions">How to Compete</A>&#160;&#160;|&#160;&#160;
Rules&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=ViewActiveContests&rt=15">Active Contests</A>&#160;&#160;|&#160;&#160;
<%--
<A href="/longcontest/?module=ViewActiveContests&rt=15">Active Contests</A>&#160;&#160;|&#160;&#160;
<A href="/longcontest/?module=ViewPractice&rt=16">Practice</A>&#160;&#160;|&#160;&#160;
--%>
<A href="/longcontest/?module=Static&d1=intel_resources">ISN Resources</A>
</p>
<span class="bigTitle">Official Rules & Regulations</span>
<br><br>
No purchase necessary to enter or win. Void where prohibited.
<br><br>
<span class="bodySubtitle">Overview</span><br>
The Intel Software Network Multi-Threading Competition Series will take place between January 25, 2006 and December 27, 2006.  Each competition will award a total prize purse of $5,000.  TopCoder members must register for each competition round. Registration may occur at any time during the two (2) week registration period.  All competitors who have registered for the competition round will immediately be given access to the competition problem statement for that round. The competition round will begin at 12:00 Noon Eastern Time, which is the earliest time that any member will be given access to the problem statement. 
<br><br>
<span class="bodySubtitle">Eligibility</span><br>
The competition is open to all TopCoder members who are at least 18 years of age as of the start date of each competition.
<br><br>
All competitors must be registered members of TopCoder and must have agreed to the rules on this page prior to participating in this competition.
<br><br>
TopCoder members who are 18 years of age or older as of the start date of each competition are eligible to win cash prizes, unless otherwise prohibited. The Competition Series is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law. Cash prizes will not be paid to residents of Cuba, Iran, Iraq, Libya, North Korea, Sudan, or Syria.
<br><br>
Employees of TopCoder and Intel and those involved in the development, production (including prize suppliers and sponsors), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the competition and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the competition.
<br><br>
<span class="bodySubtitle">Match Structure</span><br>
Each match will contain a single problem. The problem statement will indicate both the question presented to the contestant as well as how submissions will be scored. When contestants submit their solution, it will immediately be put on a queue for system testing. Once system testing is complete, the competitor will be assigned a ranking that will be viewable on TopCoder's website. Each competitor may submit as many times as they choose during each competition, however competitors may only submit once every 4 hours.  Additionally, if a competitor has a pending submission on the testing queue it must finish testing before they may submit again.
<br><br>
<span class="bodySubtitle">Schedule</span>
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
   February 15, 2006<br>12:00 Noon EST
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
Each competition will award five (5) cash prizes to the top scorers.
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
<span class="bodySubtitle">Conditions of Participation</span><br>
By participating in the competition round, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters. 
<br><br>
<span class="bigRed">Contestants must not cheat; all ideas for any code submitted must be the contestant's alone.</span>
<br><br>
The winner in each match will be the competitor that scores the most points across all competitors who participate in that match. All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the competition shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects. 
<br><br>
TopCoder and Intel are not responsible for entries not received due to lost, failed, delayed or interrupted connections or miscommunications, or other electronic malfunctions, or due to lost, late, mutilated, illegible, incomplete, postage due or misdirected mailed entries. TopCoder and Intel are not responsible for incorrect or inaccurate entry information, whether caused by persons entered at the web site or by any of the equipment or programming associated with or utilized in the competition or by any human error which may occur in the processing of the entries in this competition.
<br><br>
By participating in the Intel Software Network Multi-Threading Competition Series, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this Competition Series, or participation in any competition-related activity, or the receipt, use or misuse of a prize. 
<br><br>
TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the entry process, the operation of the Web site, the competition process, or is otherwise in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the competition if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort. 
<br><br>
All prizes will be distributed within 60 days of the end of each competition. 
<br><br>
As a condition of winning and redeeming a cash prize, certain contestants will be required to submit a completed (i) Affidavit of Eligibility and Liability and Publicity Release, and (ii) IRS Form W-9, W-8BEN or W-8ECI, as appropriate, if one is not already on file with TopCoder. In completing the Affidavit of Eligibility and Liability and Publicity Release, a cash prize winner (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated; that the idea for the code submitted is his/hers alone, (c) verifies the accuracy of the demographic information submitted to, and contained in, the TopCoder member database, (d) authorizes TopCoder to publicize the tournament's results, (e) agrees to sign any applicable forms required by tax authorities, (f) licenses to TopCoder rights to all information submitted during the tournament (including rights to source code and other executables), and (g) releases TopCoder from liability arising out of any prize won. TopCoder requires contestants to complete the Form W-9, W-8BEN or W-8ECI for tax reporting purposes. If prize notification is returned as undeliverable, or if the cash prize winner fails to return the Affidavit or tax form as specified, the cash prize winner will be disqualified and the prize money won by the disqualified cash prize winner will be forfeited. Providing false information in the registration process or on the required forms described in this paragraph will disqualify a cash prize winner.
<br><br>
<span class="bodySubtitle">Other</span><br>
The competition is void in whole or in part where prohibited by law. 
<br><br>
A winner's list of coder handles for all competitions will be available on the web site at http://www.topcoder.com displayed for at least 3 months after the end of the competition. 
<br><br>
All federal, state, and local taxes on prize are the sole responsibility of the winner.
<br><br>
Acceptance of prize constitutes permission to use winner's name and/or likeness on the web site for advertising/trade purposes without further compensation, except where prohibited. 
<br><br>
All federal, state and local laws and regulations apply.
<br><br>
This tournament is brought to you by TopCoder, Inc., 95 Glastonbury Blvd, Glastonbury, CT 06033.

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
