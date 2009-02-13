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

<span class="bigTitle">Time Tracker Time, Expense and Reporting</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
TopCoder intends to streamline its time and expense reporting efforts. The current process requires employees and contractors to complete Excel spreadsheets and submit them to HR.  This process is extremely resource intensive and does not allow for reporting or integration with other systems. 
<br><br>
The Time Tracker application will replace the manual time and expense entry process.  The new application will allow users to enter their time and expenses via a web interface, eliminating the need for employees and contractors to use spreadsheets. Employees and contractors will also be able to view their time and expense reports, providing a quick overview of their hour and expense totals.
<br><br>
The administrative portion of Time Tracker will eliminate the need for HR to compile numerous spreadsheets into a more workable format.  HR will be able to manage client and project lists easily.  The reports provided to HR will be extremely beneficial, consisting of Employee, Contractor Project and Client reports. These reports will allow management an easier view into resource utilization, resource allocation and financial calculations.  Managers will also have the ability to approve and/or reject contractors' time reports, allowing both the contractor and the manager quick access to approval information.
<br><br>
Although the application will be initially used by TopCoder, the intention is to build the application in a generic fashion such that it could be used by any organization.
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This assembly competition will consist of login, time entry, time deletion, editing time entries, entering expenses, deleting expenses, editing expense entries, viewing worker reports, viewing project reports and viewing client reports.
<br><br>
<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:

<ul>
<li>Java 1.4.2</li>
<li>Informix 9.x</li>
<li>JBoss 4.0.2</li>
<li>Tomcat 5.5</li>
<li>Apache 1.2 </li>
</ul>

<div class="sectionHeader">Documentation</div>
Documentation/Specification is available in the application forums <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/forum/c_forum.jsp?f=21303682">here</A>.

<br><br>

<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions. Initial payment for the winning team will be distributed in two installments. First Milestone: When the winning solution is submitted and review board suggestions are integrated. Second Milestone: Marked by the completion of the Deployment phase of the project.
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $4,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $1,500
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
      <td>Team Creation:</td><td align="right">03.15.2006</td><td align="right">03.28.2006</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">03.29.2006</td><td align="right">04.07.2006</td>
   </tr>
   <tr>
      <td>Test Challenge Phase:</td><td align="right">04.10.2006</td><td align="right">04.11.2006</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">04.12.2006</td><td align="right">04.25.2006</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">04.26.2006</td><td align="right">04.27.2006</td>
   </tr>
   <tr>
      <td>Deployment Phase:</td><td align="right">04.26.2006</td><td align="right">05.09.2006</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
Registration is closed.
<%--
To sign up as a Team Captain or a Free Agent, send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Time Tracker Time, Expense and Reporting">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Complete name of project</li>
<li>Position desired (Team Captain or Free Agent)</li>
<li>Team you wish to work with (Not necessary for Team Captains and Optional for Free Agents)</li>
<li>Percentage of team earnings desired</li>
   <ul>
   <li>Note that for the Time Tracker competition, all team members, including the Team Captain, will receive the same % of the prize money.</li>
   </ul>
<li>Name of Assembly Competition in which you would like to participate</li>
</ul>
--%>
<br><br>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Time Tracker Time, Expense and Reporting">AssemblySubmissions@topcoder.com</A> by the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The code that was last submitted before the deadline will be used as your final submission.
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

