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

<span class="bigTitle">Payroll Link Website and Reports</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The client is a Per-Diem medical professional staffing firm that provides rated medical personnel online.  Facilities, or "Providers" - hospitals, nursing homes, and other care facilities -- and nurses, or "Professionals," register on the client website to become members of the client's online community.  Providers post shifts with skill, licensure and ratings requirements, qualified Professionals are alerted to these available shifts, and interested Professionals respond.  The system is attempting to create an economy of scale, and intends to deploy nationwide.  The system is prepared to handle approximately 5,000 Professionals and Providers brokering services online.
<br><br>
To allow client personnel to focus on individual competencies, and to prepare for an anticipated explosion in scale, the client has contracted with a third party vendor to supply Payroll and Human Resources services.  The Payroll Link Project will synchronize the client's Payroll, Employee and Facility data with its partner's processing systems.  The third-party vendor will fetch downloadable reports from a new, secure addition to the client's website.
<br><br>
Features of the application:<br>
<ul>
<li>A suite of new, secure, JSP web pages to deliver the Payroll Link content</li>
<li>A new user role to accommodate the 3rd party vendor</li>
<li>Use Jasper to deliver configurable reports</li>
<li>Produce invoices that may be imported by QuickBooks Pro 2005</li>
<li>Reports of 3 types are delivered via the web<br>
	<ul>
	<li>Payroll Data
	<li>Employee Data
	<li>Facility Data
	</ul>
</li>
<li>Role-based access controls</li>
<li>A job scheduling module to produce reports periodically</li>
</ul>

NOTE: Please see eligibility requirements below.  Competitors must sign a non-disclosure agreement and pass a background check before being admitted into this competition.
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This assembly competition will consist of prototype conversion, component integration, and extensive unit testing to ensure correct operation.
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>Java</li>
<li>Java Server Pages</li>
<li>Struts</li>
<li>Jaspersoft</li>
<li>SQL Server 2005</li>
<li>Windows Server 2003</li>
</ul>

<%--
<div class="sectionHeader">Documentation</div>
Documentation/Specifications are available in the application forums <A href="https://software.topcoder.com/forum/c_forum.jsp?f=23729399">here</A>.<br><br>
--%>

<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions. Initial payment for the winning team will be distributed at two milestones: 
<ul>
<li><b>First Milestone</b>: When the winning solution is submitted and review board suggestions are integrated.</li>
<li><b>Second Milestone</b>: Marked by the completion of the Deployment phase of the project.</li>
</ul>

<strong>Winning Team</strong><br>
Total Payment - $10,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $5,000
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
<span class="bigRed">Your ability to participate in this competition is contingent on your agreement to the Assembly Terms of Work and signing of a Non Disclosure Agreement.  Once you have registered this information will be emailed to you and should be returned within 24 hours.</span>
<br><br>
<div class="sectionHeader">Timeline</div>
All submissions are required to be submitted by the end of Competition Phase. The end of each phase is at 9:00 AM EST.
<br><br>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="300">
   <tr>
      <td><strong>Phase</strong></td><td align="right"><strong>Start</strong></td><td align="right"><strong>End</strong></td>
   </tr>
   <tr>
      <td>Team Creation:</td><td align="right">09.27.2006</td><td align="right">10.04.2006</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">10.04.2006</td><td align="right">10.13.2006</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">10.13.2006</td><td align="right">10.18.2006</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">10.19.2006</td><td align="right">10.20.2006</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
Registration is closed. 
<%--
To sign up as a Team Captain or a Free Agent, send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Payroll Link Website and Reports">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Complete name of project</li>
<li>Position desired (Team Captain or Free Agent)</li>
<li>Team you wish to work with (not necessary for Team Captains and optional for Free Agents)</li>
<li>Percentage of team earnings desired</li>
   <ul>
   <li>Note that for this competition, all team members, including the Team Captain, will receive an equal percentage of the prize money.</li>
   </ul>
</ul>
--%>
<br><br>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Payroll Link Website and Reports">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

