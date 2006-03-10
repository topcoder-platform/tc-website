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
      <jsp:param name="node" value="assembly_overview"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<div align="center" style="margin-bottom: 10px;">
<img src="/i/assembly/banner.gif" alt="TopCoder Assembly Competitions" />
</div>
<span class="bigTitle">Overview</span>
<br><br>
TopCoder has created Assembly Competitions as an extension of our Component Design and Development Competitions.  Through these competitions, teams will create high quality applications using completed components and TopCoder's established competitive method.
<br><br>
The competition will have several phases:
<br><br>
<div align="center">
<div align="left" style="width: 200px; padding:10px; background:#EEEEEE; border: 1px solid #999999;">
<strong>
Phases:
<hr>
<A href="#contest_posting">Contest Posting</A><br>
<A href="#team_creation">Team Creation</A><br>
<A href="#rb_creation">Review Board Creation</A><br>
<A href="#competition">Competition</A><br>
<A href="#review">Review</A><br>
<A href="#feedback">Feedback</A><br>
<A href="#deployment">Deployment</A>
</strong>
</div>
</div>
<br><br>
<A name="contest_posting"></A>
<span class="bodySubtitle">Contest Posting</span><br>
TopCoder will post the competition details, specification and architecture deliverables and timeframe on its website.  Members can read through the documentation and decide in what capacity they would like to compete - Team Captain, Free Agent or Review Board Member.
<br><br>
<A name="team_creation"></A>
<span class="bodySubtitle">Team Creation</span><br>
Members who wish to head up a team of developers will register as Team Captains.  Members who wish to participate in the competition but do not want to be a Team Captain will register as Free Agents.  There will be a forum for each Assembly Competition that is dedicated to forming teams.  
<br><br>
Team Captains will extend offers to Free Agents and other Team Captains to recruit them onto their team.  The offer will include a description of the proposed responsibilities and the percentage of project winnings that the team member will earn.  Free Agents may also contact Team Captains and offer their services as a team member.  Once an offer is accepted, the payment percentage is locked in.
<br><br>
<span class="bigRed">NOTE:  For the Time Tracker Application, the prize money will be equally distributed between the Team Captain and all team members.</span>
<br><br>
Competitors can only be part of one team per Assembly Competition.  Before being selected to a team, competitors can change their status from Free Agent to Team Captain at any time.  At the conclusion of the Team Creation stage, each team member must agree to terms that outline which team he/she is working for and what percentage of the earnings he/she will be given.
<br><br>
<A name="rb_creation"></A>
<span class="bodySubtitle">Review Board Creation</span><br>
The Competition Manager (a TopCoder employee) will select the Review Board from the pool of pre-qualified members who are members of the Application Review Board.
<br><br>
<A name="competition"></A>
<span class="bodySubtitle">Competition</span><br>
The Competition phase consists of competing teams creating the final application utilizing the necessary TopCoder components.  The creation of the application is based on the architecture and specification deliverables outlined in the Contest Posting phase.  The end result of this phase is a fully functional application.
<br><br>
Each team will be responsible for creating their working environment.  Teams will be granted access to a private forum for each Assembly Competition.  This forum will be monitored by a TopCoder Architect who will answer any and all technical questions in the forum.  	
<br><br>
As the Testing Competitions (link to Testing Competitions Overview page) conclude, test cases will become available to the teams.  Once the test cases have been delivered to the Assembly Competition teams and the teams have submitted their code for the application, they may challenge any of the test cases.
<br><br>
Once a team has submitted their code, a TopCoder Deployment Engineer will install and run their code on a TopCoder server against the test cases submitted through the Testing Competition.  The Testing Competition participants and the team will receive feedback based on the results of the testing.  Once four teams have passed the initial review, no other teams will be allowed to submit any code.  
<br><br>
<span class="bigRed">NOTE:  For the Time Tracker Application, submissions will be taken based on a certain length of time from the start of the Competition phase and NOT on the number of submissions that pass the initial review.</span>
<br><br>
If a team misses the submission deadline by up to 24 hours, they will lose 10% of any awarded prize.  If they are late up to an additional 24 hours, another 10% will be lost.  If they are late up to an additional 24 hours, they will be removed from the competition and will not be awarded any prize.  Any bugs found in the components that must be used during the Competition phase will result in an extended deadline.
<br><br>
<A name="review"></A>
<span class="bodySubtitle">Review</span><br>
At the completion of the Competition phase, the contest will enter the Review phase.  This phase will consist of testing the deployment of the application, running all test cases and reviewing the application code.
<br><br>
The Deployment Engineer will set up an environment for each team and will test the team's submitted code against all test cases.  Once the system is running, the automated screener will check all deliverables.
<br><br>
Each team will have a scorecard set up in online review.  Reviewers will score each team's submission based on an Application Scorecard.  The scorecard will ensure proper use of all components as outlined in the deliverables, as well as ensure that all code follows TopCoder guidelines.  Modifying or neglecting to use any components will be cause for immediate failure.  
<br><br>
<span class="bigRed">NOTE: For the Time Tracker Application, online review will not be used.  Scorecards will be in RTF format and can be viewed here. (link to scorecard)</span>
<br><br>
The Appeals and Appeals Response stage will follow the scorecard review.  Each Team Captain can appeal any reviewer statement, as long as it is factually wrong.  Each reviewer will respond to the Team Captain's appeals.
<br><br>
Based on the final scorecard standings after all appeals have been settled, a winner will be determined.  The winning team will then enter Final Fixes.  During this stage, all identified bugs and Review Board comments must be integrated into the application.  After Final Fixes have been completed, the application will be reviewed again to verify the treatment of the fixes.
<br><br>
The last step in the Review phase involves the Project Manager.  The PM will sign off on the functionality of the application, as well as verify that all tests have been run properly.
<br><br>
If any Review Board member misses the deadline by up to 24 hours, they will lose 10% of their compensation.  If they are late up to an additional 24 hours, another 10% will be lost.  If they are late up to an additional 24 hours, they will be removed from the competition and will not be compensated.
<br><br>
<A name="feedback"></A>
<span class="bodySubtitle">Feedback</span><br>
At the completion of the Review phase, all teams must provide feedback on the process and the deliverables used during the process, regardless of their placement in the competition.
<br><br>
Each team will fill out an evaluation that covers the architecture deliverables and the quality of the components used in the competition.  Feedback on the competition process will also be required.  Payments will not be issued until the evaluation form is completed.
<br><br>
Each team member will be allowed to rate and comment on their fellow team members, including the Team Captain.  The feedback will be anonymously available to other TopCoder members and staff when they are selecting teams and Review Boards for future projects. 
<br><br>
<span class="bigRed">NOTE: For the Time Tracker Application, we will not be soliciting feedback on team members.</span>
<br><br>
The second place team will be awarded 100% of their prize, less any deductions for missed timelines.  TopCoder will pay each team member based on the terms agreed upon prior to the start of the competition.  No exceptions will be made.
<br><br>
The first place team will be awarded 75% of their prize, less any deductions for missed timelines.  TopCoder will pay each team member based on the terms agreed upon prior to the start of the competition.  No exceptions will be made.
<br><br>
The first place team will be awarded the remaining 25% of their prize, less any deductions for missed timelines, at the completion of the Deployment Phase.  TopCoder will pay each team member based on the terms agreed upon prior to the start of the competition.  No exceptions will be made
<br><br>
Review Board members will be paid 75% of their earnings, less any deductions for missed timelines.  
<br><br>
Review Board members will be awarded the remaining 25% of their earnings, less any deductions for missed timelines, at the completion of the Deployment Phase.  TopCoder will pay each team member based on the terms agreed upon prior to the start of the competition.  No exceptions will be made 
<br><br>
<A name="deployment"></A>
<span class="bodySubtitle">Deployment</span><br>
After the Review phase, the winning team and the Review Board will move on to the Deployment phase.  The winning team will support the application for 30 days, including performing all bug fixes.  After the 30-day support period, any identified bugs will run through the standard TopCoder bug fixing policy. Any requests for enhancements will result in additional payments to the winning team and the Review Board members.  
<br><br>
All bugs will be classified as either enhancements or defects.  All defects identified during the 30-day support period will be assigned to the winning Team Captain who will, in turn, assign the defects to an appropriate team member to fix.  The Team Captain will assign a timeline to fix each defect and will be held accountable for the timeline.
<br><br>
If a defect is found in a component, it will be fixed through TopCoder's standard component bug fixing process.  An appropriate deadline will be set to fix the component and the winning team will integrate the patched component once it has been fixed. If the component fix falls outside the scope of the 30-day support period, the winning team will be paid additional money to integrate the component into the application once it has been fixed.
<br><br>
If the team misses any deadlines for fixing defects, they will be lose a percentage of their remaining prize in accordance with the following schedule:
<ul>
<li>If 3-5 bug fixes are late, then 5% is lost.</li>
<li>If 5-10 bug fixes are late, then 15% is lost.</li>
<li>If more than 10 bug fixes are late, then 40% is lost.</li>
</ul>
Review Board members will review all changes and will also lose payment for missing any deadlines.  The same penalties will be assessed against the Review Board members as against teams.

</div>
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

