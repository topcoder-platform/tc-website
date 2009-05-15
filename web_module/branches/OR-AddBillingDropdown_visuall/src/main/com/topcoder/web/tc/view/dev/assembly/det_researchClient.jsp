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

<span class="bigTitle">Research Client</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The Research Client application is one half of an application; the Research Project application. It's a Windows Forms application based on a Service Oriented Architecture. The entire Research Project application will allow users to perform searches on a database of Nielsen television ratings data by specifying complex search criteria. The results of these searchers are displayed to the user in the windows forms application on rich sortable grids. In addition, the application allows the user to save search criteria as a set, export search results to printer or email, and run pre-packaged standalone reports.  The Research Client will interact with the Research Server application. It will construct container objects representing search criteria, validate those criteria through a separate component, submit searches to the server, and render those results on its screens.
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
The actual GUI screens have already been completed in the Research Screens component. The purpose of this assembly competition is to write code which interacts with those forms and relays information between them and the server layer. The competitors must develop code to interact with the WCF stubs from the server layer, construct the search objects, call the Research Validation component to validate user events, communicate validation errors to the user, bind results of server calls to the appropriate controls, and notify users of any server side errors that occur. In addition, the Research Client application must manage all interactions with the provided Application Host environment, including the addition of menus and listening for events. The Client application also handles the assignment of shortcut keys, and handles the events triggered by those shortcut keys.
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>Runs in the .NET 3.0 framework</li>
<li>All code written in C#</li>
<li>Communicates with the server layer through the Windows Communication Foundation (WCF)</li>
<li>Integrates with the Application Host environment</li>
</ul>
<%--
<div class="sectionHeader">Documentation</div>
Documentation/Specifications are available in the application forums <A href="https://software.topcoder.com/forum/c_forum.jsp?f=24428969">here</A>.
<br><br>
--%>
<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions. Initial payment for the winning team will be distributed in two installments. <b>First Payment:</b> When the winning solution is submitted and the review board suggestions are integrated. <b>Second Payment:</b> Marked by the completion of the Deployment phase of the project. 
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $20,000<br>
*Additional Milestone Bonuses - $5,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $10,000<br>
*Additional Milestone Bonuses - $2,500
<br><br>
*Additional bonuses are included when the Winning and Second Place Team meet each of the competition milestones. For more details, please see the "Milestones" section below.
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
      <td>Team Creation:</td><td align="right">01.10.2007</td><td align="right">01.17.2007</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">01.18.2007</td><td align="right">02.18.2007</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">02.19.2007</td><td align="right">03.03.2007</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">03.04.2007</td><td align="right">03.07.2007</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Milestones</div>
At intervals during the competition phase, assembly teams will be expected to demonstrate progress by providing interim deliverables as specified in the following table. The winning and 2nd place teams that have met each of the milestones during the duration of the competition will be paid an additional bonus for each milestone that is met.
<br><br>
<div align="left">
<table cellpadding="0" cellspacing="0" border="0" width="530">
   <tr>
      <td width="80"><strong>Date</strong></td><td width="450"><strong>Deliverables</strong></td>
   </tr>
   <tr>
      <td valign="top">01.24.2007</td><td valign="top">Full suite of Collection Views implementations for all necessary grids<br>
      Winning Team Bonus - $1,250<br>2nd Place Team Bonus - $625</td>
   </tr>
   <tr>
      <td valign="top">01.31.2007</td><td valign="top">"Prototype" fully integrated with application host. Application that is able to make method appropriate method calls to WCF through proxies<br>
      Winning Team Bonus - $1,250<br>2nd Place Team Bonus - $625</td>
   </tr>
   <tr>
      <td valign="top">02.07.2007</td><td valign="top">All events defined (not all event code needs to be completed)<br>
      Winning Team Bonus - $1,250<br>2nd Place Team Bonus - $625</td>
   </tr>
   <tr>
      <td valign="top">02.14.2007</td><td valign="top">Fully functioning WCF Client application<br>
      Winning Team Bonus - $1,250<br>2nd Place Team Bonus - $625</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
Registration is closed.
<br><br>
<%--
To sign up, please send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Research Client">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First &amp; Last Name</li>
<li>Complete name of Assembly Competition project</li>
</ul>
--%>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Research Client">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

