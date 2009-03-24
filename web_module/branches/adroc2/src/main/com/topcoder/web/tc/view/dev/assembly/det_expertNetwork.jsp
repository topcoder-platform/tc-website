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

<span class="bigTitle">Expert Network Application</span>
<br><br>
<%--<span class="bigRed">NOTE: Registration has been extended for this contest. Please see new Timeline and Milestones dates below.</span>
<br><br>--%>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The Expert Network application is the first release of a community web site. It includes one piece for experts to register themselves and view/edit their profile and an admin tool to approve experts and search through registered experts and view their profiles. Both pieces will be web based applications.
<br><br>
The Expert Network will be implemented as a ASP.NET web application, involving a front end written in ASPX/C# that communicates with XML Web Service back-end. The assembly of the Expert Network will consist mostly of integrating generic components that exist in the component catalog and implementing several plug-ins and implementations of these components.
<br><br>

Registration Features: 
<ul>
<li>Register Expert</li>
<li>Login/Logout/Recover Password</li>
<li>View/Edit Profile</li>
</ul>
Administration Features:
<ul>
<li>Approve Expert</li>
<li>View/Edit Expert Profile</li>
<li>Search Experts</li>
</ul>

These applications are to be used by a TopCoder client. All application documentation will be available once registered.
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This assembly competition will consist of custom plug-in implementations, component integration, and extensive unit testing to ensure correct operation. <br><br>

<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>
 
<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>Microsoft Windows</li>
<li>.NET 2.0</li>
<li>Microsoft SQL Server 2005</li>
<li>Microsoft Internet Explorer</li>
<li>Mozilla Firefox</li>
</ul>
<%--
<div class="sectionHeader">Documentation</div>
Documentation/Specifications are available in the application forums <A href="#">here</A>.
<br><br>
--%>
<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions. Initial payment for the winning team will be distributed in two installments. The first installment will be paid when the winning solution with review board requirements and suggestions integrated is accepted by TopCoder. The second installment will be paid upon completion of application deployment.
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $14,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $7,000
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
All submissions are required to be submitted by the end of Competition Phase. The end of each phase is at 9:00 AM EST.
<br><br>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="300">
   <tr>
      <td><strong>Phase</strong></td><td align="right"><strong>Start</strong></td><td align="right"><strong>End</strong></td>
   </tr>
   <tr>
      <td>Team Creation:</td><td align="right">12.01.2006</td><td align="right">12.10.2006</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">12.01.2006</td><td align="right">12.24.2006</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">12.24.2006</td><td align="right">12.31.2006</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">01.01.2007</td><td align="right">01.04.2007</td>
   </tr>
</table>
</div>
<br><br>

<div class="sectionHeader">Milestones</div>
At intervals during the competition phase, assembly teams will be expected to demonstrate progress by providing interim deliverables as specified in the following table.
<br><br>
<div align="left">
<table cellpadding="0" cellspacing="0" border="0" width="530">
   <tr>
      <td width="80"><strong>Date</strong></td><td width="450"><strong>Deliverables</strong></td>
   </tr>
   <tr>
      <td valign="top">12.12.2006</td><td valign="top">Working web site, including converted ASPs and configured application components</td>
   </tr>
   <tr>
      <td valign="top">12.18.2006</td><td valign="top">Functioning Registration pages</td>
   </tr>
   <tr>
      <td valign="top">12.20.2006</td><td valign="top">Functioning Administration pages</td>
   </tr>
   <tr>
      <td valign="top">12.24.2006</td><td valign="top">Complete, fully-functioning submission, including unit tests</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
Registration is closed.
<br><br>
<%--
To sign up, please send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Expert Network Application">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First &amp; Last Name</li>
<li>Complete name of Assembly Competition project</li>
</ul>
--%>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Expert Network Application">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

