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

<span class="bigTitle">Orpheus Game Server and Client Modules</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The Orpheus game is an on-line scavenger hunt, in which players search the Internet for clues, keys, and an elusive 'ball' containing real cash prizes.  Players use their usual web browser to participate (Internet Explorer and Firefox initially supported), enabling it as a game client by installing a browser extension.  The game does not require participating web sites to be modified in any way; instead, information about the location and identity of target objects is maintained internally by the game's own server, and provided to clients on an as-needed basis.
<br><br>
Game players will be able to log in to the system, participate in one or more game instances, receive notifications and clues to lead them to the scavenger hunt targets, and ultimately to 'unlock the ball' to obtain the money inside.  The game also provides information about past and future participating sites and about players' relative standing in specific games.
<br><br>
The game server will be implemented as a J2EE web application, involving servlets and JSPs backed by an EJB-based interface to persistent storage. The clients will be implemented as browser extensions using the target browsers' extension mechanisms - XUL / XPI for Firefox and COM for Internet Explorer.
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This competition involves assembling the game server and the associated client plug-ins / extensions.  The greatest part of the application is implemented by custom and generic components that have recently been completed.  The main tasks will involve configuring these components, writing application deployment descriptors, writing UI code and packaging for the extensions, converting the existing HTML prototype to JSP, and comprehensive unit testing to ensure correct operation.
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>Java 1.4.2</li>
<li>.NET 1.1 (for the IE extension only)</li>
<li>JBoss Application Server 4.0.4</li>
<li>Linux</li>
<li>Microsoft SQL Server 2005</li>
<li>Mozilla Firefox (XUL / XBL / XPI)</li>
<li>Microsoft Internet Explorer (COM)</li>
</ul>
<%--
<div class="sectionHeader">Documentation</div>
Documentation/Specifications are available in the application forums <A href="https://software.topcoder.com/forum/c_forum.jsp?f=24428969">here</A>.
<br><br>
--%>
<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions. Initial payment for the winning team will be distributed in two installments. The first installment will be paid when the winning solution with review board requirements and suggestions integrated is accepted by TopCoder. The second installment will be paid upon completion of application deployment.
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $30,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $15,000
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
      <td>Team Creation:</td><td align="right">11.10.2006</td><td align="right">11.17.2006</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">11.10.2006</td><td align="right">12.08.2006</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">12.08.2006</td><td align="right">12.15.2006</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">12.15.2006</td><td align="right">12.18.2006</td>
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
      <td valign="top">11.27.2006</td><td valign="top">Working web site, including converted JSPs and configured application components</td>
   </tr>
   <tr>
      <td valign="top">12.01.2006</td><td valign="top">Functioning Firefox extension</td>
   </tr>
   <tr>
      <td valign="top">12.04.2006</td><td valign="top">Functioning Internet Explorer extension</td>
   </tr>
   <tr>
      <td valign="top">12.08.2006</td><td valign="top">Complete, fully-functioning submission, including unit tests</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>

Registration is closed.
<br><br>
<%--
To sign up as a Team Captain or a Free Agent, send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Orpheus Game Server and Client Modules">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
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
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Orpheus Game Server and Client Modules">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

