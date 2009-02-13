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

<span class="bigTitle">Instrumentation Reporting</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
Instrumentation Reporting is a web based diagnostic tool that provides reporting and troubleshooting information for developers and business personnel.  The information collected by the framework is crucial for Events Correlation, Monitoring, and Reporting.  When leveraged appropriately, these key areas contribute in reducing operational costs and increasing productivity and customer satisfaction.  For example:
<ul>
<li>Development and support personnel can identify errors within any application, component, and method across a web farm resulting in quicker turnaround for known issues.</li>
<li>Support personnel can monitor key resources such as servers and components to forecast potential bottlenecks resulting in system failure.</li>
<li>Business groups can run trend reports on specific client applications, client channels, and client id's to track usage over a specific period of time.</li>
<li>Business groups can track frequently used functionality and performance times.</li>
</ul>

Instrumentation Reporting is built against a framework that provides a complete end to end systems management solution.  The basis of the framework is to log events for all system and application components using the framework.  An event can be classified as either error, admin, trace, audit, call enter, and call return  The logging is built upon Windows Management Instrumentation (WMI) and records all these events to a SQL Server 2005 database.  
<br><br>
Instrumentation Reporting will be used by a TopCoder client. All application documentation (including an assembly guide) will be available once registered. 
<br><br>
<span class="bigRed">NOTE: Please see the eligibility requirements below. Competitors must sign a non-disclosure agreement and pass a background check before being admitted into this competition.   If you have previously completed these documents, no further action is needed.</span>
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This assembly competition will consist of component integration and extensive unit testing to ensure correct operation.  The majority of the application will be implemented by generic TopCoder components.  The main task will involve configuring these components, writing UI code, writing a deployment guide, and packaging the application for deployment.  
<br><br>
* The application html prototype will be "pre-converted" to aspx pages to help get you started. However, these pages will still require modifications as your UI code is implemented.
<br><br>
* A sample database will be provided containing data for the application. 
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>.NET 2.0 (C#)</li>
<li>ASP.NET 2.0</li>
<li>SQL Server 2005</li>
<li>Windows Server 2003</li>
<li>IIS 6.0</li>
<li>CSS</li>
</ul>
<%--
<div class="sectionHeader">Documentation</div>
Documentation/Specifications are available in the application forums <A href="https://software.topcoder.com/forum/c_forum.jsp?f=24428969">here</A>.
<br><br>
--%>
<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions. Initial payment for the winning team will be distributed in two installments. First Milestone: When the winning solution is submitted and review board suggestions are integrated. Second Milestone: Marked by the completion of the Deployment phase of the project.
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $25,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $12,000
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

<span class="bigRed">Your ability to participate in this competition is contingent on the completion and satisfactory review of a background check, agreement to the Assembly Terms of Work and signing of a Non Disclosure Agreement. Once you have registered this information will be emailed to you and should be returned within 24 hours.  If you have previously completed these documents, no further action is needed.</span>
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
      <td>Team Creation:</td><td align="right">12.08.2006</td><td align="right">12.18.2006</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">12.08.2006</td><td align="right">01.08.2007</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">01.08.2007</td><td align="right">01.16.2007</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">01.16.2007</td><td align="right">01.22.2007</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Milestones</div>
At intervals during the competition phase, assembly teams will be expected to demonstrate progress by providing interim deliverables as specified in the following table.  If the winning team can demonstrate each milestone successfully, they will receive a 20% bonus at the conclusion of the project.  Feedback will also be given for successful completed milestones.
<br><br>
<div align="left">
<table cellpadding="0" cellspacing="0" border="0" width="530">
   <tr>
      <td width="80"><strong>Date</strong></td><td width="450"><strong>Deliverables</strong></td>
   </tr>
   <tr>
      <td valign="top">12.19.2006</td><td valign="top">Demonstrate a functional "Resource Dashboard" page excluding the drill down links.
      <br>Demonstrate a functional "Critical Events Viewer" page.</td>
   </tr>
   <tr>
      <td valign="top">12.29.2006</td><td valign="top">Demonstrate working pages for the "Settings" section
      <br>Demonstrate functional pages for the "Operations" section</td>
   </tr>
   <tr>
      <td valign="top">01.08.2007</td><td valign="top">Completed solution is due.</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
Registration is closed.
<br><br>
<%--
To sign up, please send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Instrumentation Reporting">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Complete name of Assembly Competition project</li>
<li>Indicate your role as either team captain, free agent, or a member of an existing team. Also, indicate your team name if applicable.</li>
</ul>
--%>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Instrumentation Reporting">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

