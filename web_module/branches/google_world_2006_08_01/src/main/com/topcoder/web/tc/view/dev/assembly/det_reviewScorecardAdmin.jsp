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
<div class="fixedWidthBody">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="assembly"/>
<jsp:param name="title" value="Active Contests"/>
</jsp:include>

<span class="bigTitle">Online Review Scorecard Admin</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The Online Review and Scorecard Project will make modifications to TopCoder's current online review and scorecard systems to reduce the amount of time spent performing reviews.
<br><br>
The entire infrastructure of Online Review and Scorecards will be redesigned to be more flexible and provide better insight into TopCoder's application process.    The current Online Review system automates the TopCoder Software peer review process only for Component Designs and Component Developments. The new infrastructure will allow more project types (i.e. Application Specification, Application Architecture), multiple scorecards per project (i.e. FDA, SOX, SEC), optional review phases (i.e. submission) and custom review phases (i.e. client review). The creation of "on demand" review will allow projects to advance to the next phase as soon as the review is complete rather than wait for a deadline to pass or manually advancing the project to the next phase.  
<br><br>
TopCoder wishes to enable the front page of online review to provide proper breakouts of each project phase and also the ability for users to view only projects for which they are associated. This will allow PMs, clients and architects to view project status and timelines for all project types.  
<br><br>
The Online Review Application automates the TopCoder Software peer review process for both Component Design and Component Development projects.   Reviewers are able to login, check the status of their assignments, download submissions for review, complete online review forms and perform aggregation of reviews.  The administration section allows users to set up reviews, assign members, monitor the process and intervene at any stage of development.
<br><br>
TopCoder will modify their current Scorecard Admin tool to enhance the Online Review process. Administrators will have the ability to set multiple default scorecards per project phase and create client specific scorecards. Scorecards will be created for various project types including: Applications, Assembly Competitions, Testing Competitions as well as Components.  
<br><br>
Although the application will be initially used by TopCoder, the intention is to build the application in a generic fashion such that it could be used by any organization.
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This assembly competition will consist of creating, editing and viewing scorecards.
<br><br>
<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>Java 1.4.2</li>
<li>Informix 10.x</li>
<li>JBoss 4.0.2</li>
<li>Tomcat 5.5</li>
<li>Apache 1.2 </li>
</ul>

<div class="sectionHeader">Documentation</div>
Documentation/Specification is available in the application forums <A href="https://software.topcoder.com/forum/c_forum.jsp?f=22883020">here</A>.<br><br>

<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions. Initial payment for the winning team will be distributed in two installments. First Milestone: When the winning solution is submitted and review board suggestions are integrated. Second Milestone: Marked by the completion of the Deployment phase of the project.
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $5,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $2,500
<br><br>
<div class="sectionHeader">Eligibility</div>
You must be a TopCoder member, at least 18 years of age, meeting all of the membership requirements. In addition, you must fit into one of the following categories.
<br><br>
If you reside in the United States, you must be either:
<ul>
<li>A US Citizen</li>
<li>A Lawful Permanent Resident of the US</li>
<li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S.</li>
</ul>
If you do not reside in the United States:
<ul>
<li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will not need to do anything to become authorized)</li>
</ul>
<div class="sectionHeader">Timeline</div>
All submissions are required to be submitted by the end of Competition Phase. The end of each phase is at 9:00PM EST.
<br><br>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="300">
   <tr>
      <td><strong>Phase</strong></td><td align="right"><strong>Start</strong></td><td align="right"><strong>End</strong></td>
   </tr>
   <tr>
      <td>Team Creation:</td><td align="right">07.11.2006</td><td align="right">07.21.2006</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">07.19.2006</td><td align="right">08.02.2006</td>
   </tr>
   <tr>
      <td>&#160;</td><td align="right">&#160;</td><td align="right">9:00 AM EST</td>
   </tr>
   <tr>
      <td>Test Challenge Phase:</td><td align="right">08.03.2006</td><td align="right">08.04.2006</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">08.04.2006</td><td align="right">08.21.2006</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">08.21.2006</td><td align="right">08.22.2006</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
Registration is closed.

<%--To sign up as a Team Captain or a Free Agent, send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Online Review Scorecard Admin">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Complete name of project</li>
<li>Position desired (Team Captain or Free Agent)</li>
<li>Team you wish to work with (Not necessary for Team Captains and Optional for Free Agents)</li>
<li>Percentage of team earnings desired</li>
   <ul>
   <li>Note that for the [Time Tracker competition???], all team members, including the Team Captain, will receive the same % of the prize money.</li>
   </ul>
<li>Name of Assembly Competition in which you would like to participate</li>
</ul>
--%>
<br><br>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblySubmissions@topcoder.com">AssemblySubmissions@topcoder.com</A> by the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The code that was last submitted before the deadline will be used as your final submission.
<br><br>
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

