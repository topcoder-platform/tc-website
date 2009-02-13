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

<span class="bigTitle">SMC UI Prototype</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The SMC (Site Management Console) is a Server Client Application which allows users to create Calendar Entries and create reports. Part of an existing application called Product Management Console, the SMC will coordinate and organize different marketing and sales activities to create new landing pages for an eCommerce site. The SMC will also generate reports that the customer can use during its weekly meetings.
<br><br>
For this competition, we need teams to build a .NET 2.0 thick client prototype coded in C#. The prototype has three main parts:
<ol>
<li>Creating, changing and deleting different events, including:
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
<li>Creating Reports.</li>
<li>Printing the calendars and reports in different layouts</li>
</ol>

See the attached screenshots for more information on the user interface of the prototype:

<ul>
<li>The application will allow users to initiate a new event and its key dates and deliverables:<br>
- for example, creating a new <A href="i/development/assembly/smcUiPrototype/landingpages_key-dates_n.png" target="_blank">landing page</A></li>
<li>These events will be displayed in a calendar interface sortable by requirement:<br>
- see the <A href="i/development/assembly/smcUiPrototype/reporting_creative-calendar_n.png" target="_blank">creative calendar</A></li>
<li>as well as by date:<br>
- by <A href="i/development/assembly/smcUiPrototype/calendar_day_n.png" target="_blank">day</A><br>
- by <A href="i/development/assembly/smcUiPrototype/calendar_month_n.png" target="_blank">month</A><br>
- by <A href="i/development/assembly/smcUiPrototype/calendar_quarter_n.png" target="_blank">quarter</A></li>
<li>The calendar will also display key deliverables and plans by date:<br>
- <A href="i/development/assembly/smcUiPrototype/calendar_week-launchplan_n.png" target="_blank">launch plan by week</A></li>
<li>The application will also allow users to sort these events and print them in different formats:<br>
- <A href="i/development/assembly/smcUiPrototype/print_n.png" target="_blank">print screen</A></li>
</ul>

More information on functionality and user interface will be available to registered competitors.
<br><br>
This prototype is to be used by a TopCoder client. All prototype documentation will be available once registered. 
<br><br>
NOTE: Please see eligibility requirements below. Competitors must sign a non-disclosure agreement before being admitted into this competition.  If you have already submitted a non-disclosure agreement for another assembly competition you are not required to submit another one.
<br><br>

<span class="bodySubtitle">Competition Overview</span><br>
In this assembly competition teams will be responsible for creating a .Net 2.0 WinForms application based on wire frames and supporting requirements.  The wire frames dictate the layout and functionality of the application.  Competitors are responsible for converting the wire frames into a functioning user interface.  The winning submission from this competition will be used as the UI in another assembly competition.
<br><br>
This competition involves assembling the Site Management Console Prototype WinForms. TopCoder will deliver the wire frames, graphics, CSS and Excel Sheets for test data.
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. An overview of the environment requirements are listed below: 
<ul>
<li>Runs in the .Net 2.0 framework (C# coding)</li>
<li>Resolution: 1280x1024 optimized</li>
<li>Client application is a .NET Thick client (not browser based)</li>
<li>Windows XP Professional 2002 SP2</li>
<li>Microsoft SQL 2005 SP1</li>
<li>Windows Server 2003 SP1</li>
</ul>

<div class="sectionHeader">Documentation</div>
Documentation/Specifications will be made available in the competition forum after you have completed the registration process.
<br><br>

<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions. Initial payment for the winning team will be distributed in two installments. First Installment: When the winning solution is submitted and review board suggestions are integrated. Second Installment: Is marked by the completion of the prototype phase of the project.
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $4,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $2,000
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
      <td>Team Creation:</td><td align="right">02.02.2007</td><td align="right">02.08.2007</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">02.08.2007</td><td align="right">02.15.2007</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">02.16.2007</td><td align="right">02.21.2007</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">02.22.2007</td><td align="right">03.01.2007</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
Registration is closed. 
<br><br>
<%--
To sign up, please send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: SMC UI Prototype">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First &amp; Last Name</li>
<li>Complete name of Assembly Competition project</li>
</ul>
--%>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: SMC UI Prototype">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

