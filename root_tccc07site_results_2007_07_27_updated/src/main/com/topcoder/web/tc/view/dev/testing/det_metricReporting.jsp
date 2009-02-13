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

<span class="bigTitle">Metric Reporting Testing Competition - Manage Metric Group</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The Metric Reporting System provides an online reporting tool that will allow users to analyze a dynamic set of data using both static and dynamic graphs.  Users will be able to generate graphs based on this data and apply filtering options to the data to focus the reports on specific subsets of data.  In addition, the system will allow users to drag-n-drop pre-generated graphs from a master list to create a customized home page.
<br><br>
The Metric Reporting System is composed of a series of components built through the TopCoder Component Production methodology. Additionally, a set of components has been developed to utilize the ILOG Charts SDK.
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
The application described above has already been created.  The goal of this competition is to try and break it.  The competitors in this competition will create a set of automated test cases that will verify that the application is implemented according to the requirements documentation. The application has been divided into small, logical sections.  This competition represents the test cases for one section of this application. For section, a minimum set of test scenarios has already been created.  It is recommended that additional tests are also created.
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=071006"><img src="/i/development/testing/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Application Technologies
<ul>
<li>Java 1.5_10</li>
<li>Linux</li>
<li>Oracle 10G</li>
<li>Apache TomCat 5.5.20</li>
<li>AJAX</li>
<li>ILOG Charts (www.ilog.com) - Licenses will be available when necessary</li>
</ul>
Testing Technologies
<ul>
<li>Java 1.5_10</li>
<li>Ant 1.6.2</li>
<li>JUNIT</li>
<li>HTTP Unit</li>
<li>HTML Unit</li>
<li>Cactus 1.7.1</li>
</ul>
<div class="sectionHeader">Documentation</div>
Documentation and Application that will be provided to Registered Constants.
<ul>
<li>Requirements Documentation</li>
<li>Use Case Documentation</li>
<li>Activity Diagrams</li>
<li>Base Test Scenarios </li>
<li>Database Schema </li>
<li>Application Source Code</li>
<li>Ant Script to build and deploy application</li>
<li>Sample JUNIT Tests - Sample JUNIT tests will be provided. These tests were created prior to the application being completed, they will need to be changed or replaced as a part of this submission.</li>
<li>Sample Data</li>
</ul>
<br><br>
<div class="sectionHeader">Submission Deliverables</div>
The list below defines the deliverables for the competition:
<ul>
<li>Test cases source code</li>
<li>Output of execution of code</li>
<li>Definition of any additional tests created</li>
<li>Any instructions required to configure / run tests</li>
</ul>
All submissions should be submitted in a zip file named:<br>
[Member Handle]_MetricReporting_[root directory name].zip<br>
The file structure for the submissions should be
<br><br>
<div class="sectionHeader">Competition Deliverable Tasks</div>
<table cellpadding="4" cellspacing="0">
<tr><td>Requirements Section</td><td>2.11 Manage Metric Group</td></tr>
<tr><td>Use Case Name</td><td>Manage Metric Group</td></tr>
<tr><td>Activity Diagram(s)</td><td>Manage Metric Group - Create Group Activity<br>
Manage Metric Group - Delete Group Activity</td></tr>
<tr><td>Test Cases</td><td>Range: 76 - 90</td></tr>
<tr><td>Java Test File Package</td><td>com.topcoder.metric.web.testing</td></tr>
<tr><td>Primary Test File Name</td><td>ManageMetricGroupTest.java</td></tr>
<tr><td>Application Section</td><td>Manage_Metric_Group</td></tr>
</table>
<br><br>
<div class="sectionHeader">Payment</div>
TopCoder will compensate the competitor with the first place submission. The payment for the winning competitor will be distributed when the winning solution is submitted after the review phase is completed and the winner is selected.
<br><br>
<strong>First Place</strong><br>
Total Payment - $300
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
Your ability to participate in this competition is contingent on the agreement to the Testing Terms of Work and signing of a Non Disclosure Agreement. Once you have registered this information will be emailed to you and should be returned within 24 hours. If you have previously completed these documents, no further action is needed.
<br><br>
<div class="sectionHeader">Timeline</div>
All submissions are required to be submitted by the end of Competition Phase. The end of each phase is at 9:00 AM EST.
<br><br>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="300">
   <tr>
      <td><strong>Phase</strong></td><td align="center"><strong>Start</strong></td><td align="center"><strong>End</strong></td>
   </tr>
   <tr>
      <td>Registration Phase:</td><td align="center">03.16.2007</td><td align="center">03.21.2007</td>
   </tr>
   <tr>
      <td>Test Submission:</td><td align="center">03.17.2007</td><td align="center">03.24.2007</td>
   </tr>
   <tr>
      <td>Test Case Screening:</td><td align="center">03.24.2007</td><td align="center">03.26.2007</td>
   </tr>
   <tr>
      <td>Winner Selection:</td><td align="center">&nbsp;</td><td align="center">03.27.2007</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
<%--Registration is closed.--%>

To sign up as a participant, send an email to <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Metric Reporting Testing Competition - Manage Metric Group">TestingCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Name of Testing Competition in which you would like to participate</li>
</ul>
TopCoder staff will respond as to whether you are registered or not.

<br><br>
<div class="sectionHeader">Submission</div>
Once you have test code you are ready to submit, you can do so by emailing your source code to <A href="mailto:TestingSubmissions@topcoder.com?subject=Register: Metric Reporting Testing Competition - Manage Metric Group">TestingSubmissions@topcoder.com</A> by the submission deadline.  Once a submission is received, it will be screened.  All code that passes screening will be made available to the Assembly Competition teams.
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

