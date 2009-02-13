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


<div style="float:left;padding-right:8px;"><img src="/i/development/smAOL.gif" alt="" border="0" /></div>
<div style="padding: 8px 0px 8px 0px;"><span class="bigTitle">Syndicated Polls</span></div>

<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The Syndication Framework provides a means to distribute the same content to a variety of web-sites and allow for customized styling of the content (via CSS) as well as multiple levels of access to that content.
<br><br>
The Syndication Framework is composed of a series of components built through the TopCoder Component Production methodology. Additionally, a set of components has been developed to utilize the Syndication Framework for a specific type of syndicated content: Polls. The goal of the Syndicated Polls application is to utilize both the Syndication Framework and a set of APIs designed for delivering Poll content to create a server which will host content that can be displayed and interacted with on third-party websites.
<br><br>
Specific tasks of this application include:
<ul>
<li>Displaying a Poll</li>
<li>Allowing the user to cast a vote for a Poll</li>
<li>Displaying the results of a Poll (numeric, bar graph or pie chart)</li>
</ul>

All code for the application is contained within components. Teams will be responsible for configuration of the components, configuration of the application, conversion of prototype (to content templates) and evaluation/enhancement of components.
<br><br>
These applications are to be used by a TopCoder client. All application documentation (including an assembly guide) will be available once registered. 
<br><br>
NOTE: Please see eligibility requirements below. Competitors must sign a non-disclosure agreement before being admitted into this competition. 
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This assembly competition will consist of prototype conversion, component integration, and extensive unit testing to ensure correct operation.
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>Java 1.5</li>
<li>HTML</li>
<li>JavaScript</li>
<li>Tomcat 5.X</li>
<li>Windows XP</li>
<li>Linux</li>
</ul>
<%--
<div class="sectionHeader">Documentation</div>
Documentation/Specifications are available in the application forums <A href="https://software.topcoder.com/forum/c_forum.jsp?f=23729399">here</A>.<br><br>
--%>
<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions. Initial payment for the winning team will be distributed in two installments. First Milestone: When the winning solution is submitted and review board suggestions are integrated. Second Milestone: Marked by the completion of the Deployment phase of the project.
<br><br>
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

<div class="sectionHeader">Timeline</div>
All submissions are required to be submitted by the end of Competition Phase. The end of each phase is at 9:00 AM EST.
<br><br>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="300">
   <tr>
      <td><strong>Phase</strong></td><td align="right"><strong>Start</strong></td><td align="right"><strong>End</strong></td>
   </tr>
   <tr>
      <td>Team Creation:</td><td align="right">09.21.2006</td><td align="right">10.02.2006</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">10.03.2006</td><td align="right">10.16.2006</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">10.17.2006</td><td align="right">10.24.2006</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">10.25.2006</td><td align="right">10.26.2006</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
Registration is closed.
<br><br>
<%--
To sign up as a Team Captain or a Free Agent, send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Syndicated Polls">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
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
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Syndicated Polls">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

