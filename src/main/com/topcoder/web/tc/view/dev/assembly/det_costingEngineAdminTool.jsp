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

<span class="bigTitle">Costing Engine and Admin Tool</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The Costing Engine and Admin Tool applications work together to provide a platform for efficiently calculating and viewing Costs of Goods Sold (COGS).
<br><br>
The Costing Engine is a generic calculation engine that is communicated with by an ASP.NET Web Service.  It has no graphical user interface of its own.  The assembly for the Costing Engine will consist mostly of integrating components built via component competitions.  Specific tasks include:
<ul>
<li>Accept and validate price updates via a web service</li>
<li>Accept and validate costing requests via a web service</li>
<li>Calculate the requests using the generic engine</li>
</ul>

The Admin Tool is the graphical front-end to administer the Costing Engine.  The actual inputs to the generic engine will be configured using the Admin Tool.  All calculation results are also viewable through reports (which are standard ASP.NET pages with an 'export' option to Microsoft Excel using a pre-built component).  Admin Tool assembly will consist most of converting parts of an HTML prototype to ASP.NET and integrating components.
<br><br>
These applications are to be used by a TopCoder client.  All application documentation (including an assembly guide) will be available once registered.
<br><br>
NOTE: Please see eligibility requirements below.  Competitors must sign a non-disclosure agreement and pass a background check before being admitted into this competition.
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This assembly competition will consist of prototype conversion, component integration, and extensive unit testing to ensure correct operation.
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>.NET 2.0 (C#)</li>
<li>ASP.NET 2.0</li>
<li>ASP.NET Web Services</li>
<li>SQL Server 2005</li>
<li>Windows Server 2003</li>
</ul>

<div class="sectionHeader">Documentation</div>
Documentation/Specifications are available in the application forums <A href="https://software.topcoder.com/forum/c_forum.jsp?f=23729399">here</A>.<br><br>

<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions. Initial payment for the winning team will be distributed in two installments. First Milestone: When the winning solution is submitted and review board suggestions are integrated. Second Milestone: Marked by the completion of the Deployment phase of the project.
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $15,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $7,500
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
<span class="bigRed">Your ability to participate in this competition is contingent on the completion and satisfactory review of a background check, agreement to the Assembly Terms of Work and signing of a Non Disclosure Agreement.  Once you have registered this information will be emailed to you and should be returned within 24 hours.</span>
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
      <td>Team Creation:</td><td align="right">09.18.2006</td><td align="right">10.01.2006</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">10.02.2006</td><td align="right">10.19.2006</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">10.20.2006</td><td align="right">10.27.2006</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">10.28.2006</td><td align="right">10.29.2006</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
Registration is closed. 
<%--
<span class="bigRed">NOTE: Background checks can take up to a week.  You will not be allowed to begin the competition until you have passed a background check.  To ensure you will be allowed to start the competition as early as possible please register early (by 9/25 would be safest).</span>
<br><br>
To sign up as a Team Captain or a Free Agent, send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Costing Engine and Admin Tool">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Complete name of Assembly Competition project</li>
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
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Costing Engine and Admin Tool">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

