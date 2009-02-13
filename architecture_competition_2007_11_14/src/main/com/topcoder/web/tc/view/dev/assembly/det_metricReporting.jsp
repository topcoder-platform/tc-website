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

<span class="bigTitle">Metric Reporting System</span>
<br><br> 
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The Metric Reporting System provides an online reporting tool that will allow users to analyze a dynamic set of data using both static and dynamic graphs. Users will be able to generate graphs based on this data and apply filtering options to the data to focus the reports on specific subsets of data. In addition, the system will allow users to drag-n-drop pre-generated graphs from a master list to create a customized home page.
<br><br>
The Metric Reporting System is composed of a series of components built through the TopCoder Component Production methodology. Additionally, a set of components has been developed to utilize the ILOG Charts SDK.
<br><br>
Specific tasks of this application include:
<ul>
<li>Create an online system to allow users to view static and dynamic graphs</li>
<li>Integrate a reporting system using ILOG Charts (<A href="http://www.ilog.com" target="_blank">www.ilog.com</A>)</li>
</ul>
All code for the application is contained within components. Teams will be responsible for configuration of the components, configuration of the application, conversion of prototype (to content templates) and evaluation/enhancement of components.
<br><br>
These applications are to be used by a TopCoder client. All application documentation (including an assembly guide) will be available once registered. 
<br><br>
<b>NOTE:</b> Please see eligibility requirements below. Competitors must sign a non-disclosure agreement before being admitted into this competition. 
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This assembly competition will consist of prototype conversion, component integration, and extensive unit testing to ensure correct operation.
<br><br>
This competition involves assembling the Reporting System. The greatest part of the application is implemented by custom and generic components that have recently been completed. The HTML Pages have also been converted to JSP pages. The main tasks will involve configuring these components, integrating them with the JSP pages, applying the ILOG tags to generate graphs and comprehensive unit testing to ensure correct operation. Teams will be required to commit their in-progress work to TopCoder's Subversion repository at the midpoint of the competition.
<br><br>

<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>Java 1.5</li>
<li>Linux</li>
<li>Oracle 10G</li>
<li>Apache TomCat</li>
<li>AJAX</li>
<li>JSF</li>
<li>Subversion</li>
<li>ILOG Charts (<A href="http://www.ilog.com" target="_blank">www.ilog.com</A>) - Licenses will be available to registered teams.</li>
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

<div class="sectionHeader">Team Eligibility</div>
Due to license constraints, this assembly competition will accept 5 assembly teams. The team sizes will likely be between 2 and 3 members. Users can either choose their own teams or request teams to be created. Licenses will be given to teams with rated members. <b>Teams with 2 or more members will also be given preference to getting licenses.</b> The final definition on which teams will be given ILOG license will be by the project manager assigned to the project.
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
      <td>Team Creation:</td><td align="right">01.09.2007</td><td align="right">01.11.2007</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">01.12.2007</td><td align="right">02.01.2007</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">02.02.2007</td><td align="right">02.05.2007</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">02.06.2007</td><td align="right">02.12.2007</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Milestones</div>
This assembly competition will contain three milestones. The milestone deliverables will be defined in a document presented to contestants after an NDA document has been signed. After each milestone, the TopCoder team will review to verify the milestones are met. Teams who complete these milestones will be eligible for a bonus.
<br><br>
* The team with the winning submission will receive a $1000 bonus for each milestone met during the competition ($3000 max)
<br><br>
* The team with the second place submission will receive a $500 bonus for each milestone met during the competition ($1500 max).
<br><br>
In order to qualify for the milestone bonus, the team must create a tag by 11:59PM EST the evening the milestone is due.
<br><br>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="300">
   <tr>
      <td><strong>Milestone</strong></td><td align="right"><strong>Start</strong></td><td align="right"><strong>End</strong></td>
   </tr>
   <tr>
      <td>Milestone 1</td><td align="right">01.12.2007</td><td align="right">01.18.2007</td>
   </tr>
   <tr>
      <td>Milestone 2</td><td align="right">01.19.2007</td><td align="right">01.25.2007</td>
   </tr>
   <tr>
      <td>Milestone 3</td><td align="right">01.26.2007</td><td align="right">02.01.2007</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
Registration is closed.
<br><br>
<%--
To sign up, please send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Metric Reporting System">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First &amp; Last Name</li>
<li>Complete name of Assembly Competition project</li>
</ul>
--%>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Metric Reporting System">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

