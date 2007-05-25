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

<p><span class="bigTitle">Sales IM Admin Testing Competition</span></p>
<div class="sectionHeader">Overview</div>
<p><span class="bodySubtitle">Application Overview</span><br>
The Sales IM application is being assembled in another competition. The goal of this testing competition is to verify the correctness of the application according to the requirement specifications.  It will consist of the creation of a set of automated test cases. The test cases should represent end-to-end real scenarios.</p>

<p>The application is broken into a number of logical sections. This testing competition will only verify the functionality in the administration part.</p>

<p><span class="bodySubtitle">Competition Overview</span><br>
A minimum set of test scenarios will be provided. It is recommended to create additional tests on top of those. The prototype has been converted to JSP pages, which can be used as a template for testing output. The main tasks will involve:</p>
<ul>
<li>Writing JSP test code</li>
<li>Creating Ant tasks to compile and run the test cases</li>
<li>Providing directions for configuration and running of test cases</li>
</ul>

<div align="right"><A href="/tc?module=Static&d1=features&d2=071006"><img src="/i/development/testing/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
<p>Application Technologies
<ul>
	<li>Java 1.5</li>
	<li>Redhat Linux</li>
	<li>JBoss 4.0.2</li>
	<li>Tomcat 5.5</li>
	<li>Struts 1.3.5</li>
	<li>Informix 10.0</li>
	<li>AJAX</li>
</ul>
</p>

<p>Testing Technologies 
<ul>
	<li>Java 1.5</li>
	<li>Ant 1.6.2</li>
	<li>JUNIT</li>
	<li>HTTP Unit</li>
	<li>HTML Unit</li>
	<li>Cactus 1.7.2</li>
</ul>
** Any additional testing frameworks or jars must be approved before being used.</p>

<div class="sectionHeader">Documentation</div>
<p>Documentation and Application that will be provided to Registered Constants: 
<ul>
	<li>Requirements Documentation</li>
	<li>Use Case Documentation</li>
	<li>Activity Diagrams</li>
	<li>Base Test Scenarios </li>
	<li>Database Schema </li>
	<li>Application Source Code</li>
	<li>Ant Script to build and deploy application</li>
	<li>Sample Data</li>
</ul>
</p>

<div class="sectionHeader">Submission Deliverables</div>
<p>The list below defines the deliverables for the competition: 
<ul>
	<li>Test cases source code</li>
	<li>Output of execution of code</li>
	<li>Definition of any additional tests created</li>
	<li>Any instructions required to configure / run tests</li>
</ul>
</p>
<p>All submissions should be submitted in a zip file named:<br>
[Member Handle]_salesim_admin_[root directory name].zip</p>

<div class="sectionHeader">Competition Deliverable Tasks</div>
<div align="center">
<table cellpadding="4" cellspacing="0" width="450">
<tr><td><strong>Functionality</strong></td>
      <td><strong>Use Cases</strong></td>
      <td><strong>Test Cases</strong></td>
      <td><strong>Description</strong></td>
</tr>
<tr><td valign="top">Admin Actions</td>
      <td valign="top">2.17, 2.18, 2.20, 2.21, 2.22</td>
      <td valign="top">123 - 185</td>
      <td valign="top">All administration functionality. This includes session search, displaying statistics and managing the categories associated with the managers.</td>
</tr>
</table>
</div>

<p><strong>Testing Methods</strong><br>
For JSP pages, the test cases will verify the HTML output. The prototype conversion should have assigned ID attributes for key elements on each page to allow unit testing tools to be able to locate data on the page.</p>

<p>A population script will be provided to insert mock data to the database for testing. It may be helpful to understand the database schema. The data includes:</p>

<ul>
	<li>Sessions</li>
	<li>Users for each session</li>
	<li>Managers</li>
	<li>Categories</li>
	<li>Questions for post session form</li>
	<li>Authorization table</li>
</ul>

<div class="sectionHeader">Payment</div>
<p>TopCoder will compensate the first and second place submissions. The payment for the winning competitors will be distributed when the winning solutions are submitted after the review phase is completed and the winners are selected.</p>
<p>
<strong>Winning Test Solution</strong><br>
Total Payment - $1,200</p>
<p>
<strong>Second Place Test Solution</strong><br>
Total Payment - $600</p>

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
<table cellpadding="0" cellspacing="0" border="0" width="350">
   <tr>
      <td><strong>Phase</strong></td><td align="center"><strong>Start</strong></td><td align="center"><strong>End</strong></td>
   </tr>
   <tr>
      <td>Registration Phase:</td><td align="center">05.11.2007</td><td align="center">05.16.2007</td>
   </tr>
   <tr>
      <td>Test Submission:</td><td align="center">05.14.2007</td><td align="center">05.23.2007</td>
   </tr>
   <tr>
      <td>Test Case Screening:</td><td align="center">05.23.2007</td><td align="center">05.24.2007</td>
   </tr>
   <tr>
      <td>Winner Selection:</td><td align="center">&#160;</td><td align="center">05.29.2007</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
<p>Registration is closed.</p>
<%--
<p>To sign up as a participant, send an email to <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Sales IM Admin Testing Competition">TestingCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Name of Testing Competition in which you would like to participate</li>
</ul>
TopCoder staff will respond as to whether you are registered or not.
</p>
--%>
<div class="sectionHeader">Submission</div>
<p>Once you have test code you are ready to submit, you can do so by emailing your source code to <A href="mailto:TestingSubmissions@topcoder.com?subject=Submit: Sales IM Admin Testing Competition">TestingSubmissions@topcoder.com</A> by the submission deadline.  Once a submission is received, it will be screened.  All code that passes screening will be made available to the Assembly Competition teams.</p>

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

