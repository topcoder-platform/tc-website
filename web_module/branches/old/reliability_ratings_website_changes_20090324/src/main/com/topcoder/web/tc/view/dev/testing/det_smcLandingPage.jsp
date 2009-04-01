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

<p><span class="bigTitle">SMC Testing Competition - Landing Page</span></p>
<div class="sectionHeader">Overview</div>
<p><span class="bodySubtitle">Application Overview</span><br>
The SMC (Site Management Console) is a Server Client Application which allows users to create Calendar Entries and create reports.</p>
<p>The Site Management Console is necessary to coordinate and organize different marketing and sales activities to create on time new landing pages for an eCommerce site.</p>
<p>The customer is holding weekly meetings and is using the created reports as meeting material.</p>
<p>The application has three main parts:</p>
<ol>
<li>Creating, changing and deleting different events like:
<ul>
	<li>Content</li>
	<li>Digital Operations</li>
	<li>Corporate Marketing</li>
	<li>Marketing</li>
	<li>Merchandising</li>
	<li>Planning</li>
	<li>Technology</li>
	<li>Non-Landing Pages</li>
	<li>Landing Page</li>
</ul>
</li>
<li>Creating Reports</li>
<li>Printing the calendars and reports in different layouts</li>
</ol>

<p>This testing competition will deal with creating, changing and deleting landing page events.</p>

<p><span class="bodySubtitle">Competition Overview</span><br>
The application described above is currently being created. But the GUI prototype (in a form of .NET WinForms application) already exists. The competitors in this competition will create a set of automated test cases that will verify that the application is implemented according to the requirements documentation. The application has been divided into small, logical sections. This competition represents the test cases for one section of this application. For section, a minimum set of test scenarios has already been created. It is recommended that additional tests are also created.</p>
<div align="right"><A href="/tc?module=Static&d1=features&d2=071006"><img src="/i/development/testing/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
<p>Application Technologies
<ul>
	<li>.NET 2.0</li>
	<li>Windows Forms</li>
	<li>Windows XP</li>
	<li>Microsoft SQL Server 2005</li>
</ul>
</p>

<p>Testing Technologies 
<ul>
	<li>.NET 2.0</li>
	<li>Windows Forms</li>
	<li>NAnt 0.85</li>
	<li>NUnit 2.2</li>
	<li>NUnitForms</li>
	<li>Windows XP</li>
	<li>Microsoft SQL Server 2005</li>
</ul>
</p>

<div class="sectionHeader">Documentation</div>
<p>Documentation and Application that will be provided to Registered Constants: 
<ul>
	<li>Requirements Documentation</li>
	<li>Use Case Diagrams</li>
	<li>Activity Diagrams</li>
	<li>Sequence Diagrams</li>
	<li>Base Test Scenarios </li>
	<li>Database Schema </li>
	<li>Application Prototype Source Code</li>
</ul>
</p>

<div class="sectionHeader">Submission Deliverables</div>
<p>The list below defines the deliverables for the competition: 
<ul>
	<li>Test cases source code</li>
	<li>Definition of any additional tests created</li>
	<li>Any instructions required to configure / run tests</li>
</ul>
</p>
<p>All submissions should be submitted in a zip file named:<br>
[Member Handle]_LandingPageTests.zip<br>
The directory structure for the submissions should be the same as for component development contests.</p>

<div class="sectionHeader">Competition Deliverable Tasks</div>
<table cellpadding="4" cellspacing="0">
<tr><td>Requirements to test</td><td>2.7</td><td>Create Calendar Entry<br>(Only Landing Page)</td></tr>
<tr><td>&#160;</td><td>2.8</td><td>Flag Element</td></tr>
<tr><td>&#160;</td><td>2.12</td><td>Create Comments</td></tr>
<tr><td>.NET namespace <br>to put tests into</td><td colspan="2">Athena.SMC.Tests.LandingPage</td></tr>
<tr><td>Primary Test File Name</td><td colspan="2">LandingPageTests.cs</td></tr>
<tr><td>Application Section</td><td colspan="2">Landing Page</td></tr>
</table>
<br><br>
<div class="sectionHeader">Payment</div>
<p>TopCoder will compensate the competitors with the first and second place submissions. Initial payment for the winning submission will be distributed in two installments. First Milestone: When the winning solution is submitted and review board suggestions are integrated, 75% of the total prize money will be paid. Second Milestone: The remaining 25% of the prize money will be paid at the completion of the Deployment phase of the project.</p>
<p>
<strong>First Place</strong><br>
Total Payment - $800<br>
*Additional Bonus - $200
</p>
<p>
<strong>Second Place</strong><br>
Total Payment - $400<br>
*Additional Bonus - $100
</p>
<p>*Additional bonuses are included when the Winning and Second Place Team meet the milestones. Milestones will be available once registered.</p>

<div class="sectionHeader">Eligibility</div>
<p>You must be a TopCoder member, at least 18 years of age, meeting all of the membership requirements. In addition, you must fit into one of the following categories.<br>
If you reside in the United States, you must be either:<br>
<ul>
<li>A US Citizen</li>
<li>A Lawful Permanent Resident of the US</li>
<li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S.</li>
</ul>
If you do not reside in the United States:<br>
<ul>
<li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will not need to do anything to become authorized)</li>
</ul>
</p>
<p>Your ability to participate in this competition is contingent on the agreement to the Testing Terms of Work and signing of a Non Disclosure Agreement. Once you have registered this information will be emailed to you and should be returned within 24 hours. If you have previously completed these documents, no further action is needed.</p>

<div class="sectionHeader">Timeline</div>
<p>All submissions are required to be submitted by the end of Competition Phase. The end of each phase is at 9:00 AM EDT.</p>

<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="300">
   <tr>
      <td><strong>Phase</strong></td><td align="center"><strong>Start</strong></td><td align="center"><strong>End</strong></td>
   </tr>
   <tr>
      <td>Registration Phase:</td><td align="center">04.12.2007</td><td align="center">04.23.2007</td>
   </tr>
   <tr>
      <td>Test Submission:</td><td align="center">04.13.2007</td><td align="center">04.27.2007</td>
   </tr>
   <tr>
      <td>Test Case Screening:</td><td align="center">04.27.2007</td><td align="center">04.28.2007</td>
   </tr>
   <tr>
      <td>Winner Selection:</td><td align="center">&nbsp;</td><td align="center">04.29.2007</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
<p>Registration is closed.</p>
<%--
<p>To sign up as a participant, send an email to <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: SMC Testing Competition - Landing Page">TestingCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Name of Testing Competition in which you would like to participate</li>
</ul>
TopCoder staff will respond as to whether you are registered or not.
</p>
--%>
<div class="sectionHeader">Submission</div>
<p>Once you have test code you are ready to submit, you can do so by emailing your source code to <A href="mailto:TestingSubmissions@topcoder.com?subject=Submit: SMC Testing Competition - Landing Page">TestingSubmissions@topcoder.com</A> by the submission deadline.  Once a submission is received, it will be screened.  All code that passes screening will be made available to the Assembly Competition teams.</p>

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

