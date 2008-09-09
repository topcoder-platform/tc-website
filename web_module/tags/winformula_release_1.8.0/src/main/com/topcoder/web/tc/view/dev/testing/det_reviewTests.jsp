<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Testing Competitions</title>
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
      <jsp:param name="node" value="testing_compete"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="testing"/>
<jsp:param name="title" value="Active Contests"/>
</jsp:include>

<span class="bigTitle">Online Review Tests Competition</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The Online Review and Scorecard Project will enhance TopCoder's current online review and scorecard systems to streamline and simplify the review process.
<br><br>
The redesigned Online Review and Scorecards will be more flexible and provide better insight into TopCoder's application process.  The current system automates the TopCoder Software peer review process only for Component Designs and Component Developments. The new infrastructure will allow for more project types (i.e. Application Specification, Application Architecture), multiple scorecards per project (i.e. FDA, SOX, SEC), optional review phases (i.e. submission) and custom review phases (i.e. client review). The creation of “on demand” review will allow projects to advance to the next phase as soon as the review is complete, rather than waiting for a deadline to pass or manual advancement by administrators.
<br><br>
The application should provide easy access to detailed information on each project phase, as well as offering users the ability to view only the projects with which they are associated. This will allow PMs, clients and architects to view project status and timelines for all project types.
<br><br>
The Online Review Application will also automate the TopCoder Software peer review process for both Component Design and Component Development competitions.  Reviewers must be able to log in, check the status of their assignments, download submissions for review, complete online review forms, and perform aggregation of reviews.  Administrators should have special rights, with the ability to set up reviews, assign members, monitor the process, and intervene at any stage of development.
<br><br>
Although the application will be initially used by TopCoder, it should be built so that it is generic enough for any organization to use.
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This assembly competition will consist of performing screening, reviews, appeals, appeals response, aggregation, aggregation review, final review and approval. This project will also consist of viewing screenings, reviews, appeals, appeals response, aggregation, aggregation review, final reviews, approval and composite reviews. 
<br><br>
<div class="sectionHeader">Technologies</div>
<ul>
<li>HTMLUnit (required)</li>
<li>JUnit</li>
</ul>
<div class="sectionHeader">Documentation</div>
Documentation/Specification is available in the application forums <A href="">here</A>.
<br><br>
<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions.
<br><br>
<strong>First Place</strong><br>
Total Payment - $1,500
<br><br>
<strong>Second Place</strong><br>
Total Payment - $750
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
      <td><strong>Phase</strong></td><td align="center"><strong>Start</strong></td><td align="center"><strong>End</strong></td>
   </tr>
   <tr>
      <td>Registration Phase:</td><td align="center">07.25.2006</td><td align="center">08.02.2006</td>
   </tr>
   <tr>
      <td>Test Submission:</td><td align="center">07.26.2006</td><td align="center">08.04.2006</td>
   </tr>
   <tr>
      <td>Test Case Screening:</td><td align="center">&#160;</td><td align="center">08.07.2006</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
<%--Registration is closed.--%>

To sign up as a participant, send an email to <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Online Review Tests">TestingCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Name of Testing Competition in which you would like to participate</li>
</ul>
TopCoder staff will respond as to whether you are registered or not.

<br><br>
<div class="sectionHeader">Submission</div>
Once you have test code you are ready to submit, you can do so by emailing your source code to <A href="mailto:TestingSubmissions@topcoder.com?subject=Register: Online Review Scorecard Admin Tests">TestingSubmissions@topcoder.com</A> by the submission deadline.  Once a submission is received, it will be screened.  All code that passes screening will be made available to the Assembly Competition teams.
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

