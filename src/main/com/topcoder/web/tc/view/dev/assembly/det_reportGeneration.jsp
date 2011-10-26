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

<span class="bigTitle">Report Generation</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
Report Generation is part of a larger application known as Instrumentation Reporting.   The purpose of report generation is to help users identify positive or negative trend and performance statistics relating to key resources across a web farm.  A key resource can be classified as a component, web method, machine name, user id, client application, or client location.  These inputs will be supplied by a user to produce reports.
<br><br>
There are two general types of reports in the application:
<ol>
<li>Graph Reports - these reports are generated from rolled up statistics tables, and rendered as appropriate graphs.</li>
<li>Tabular Reports - these reports are generated from the raw data and are rendered as tables.</li>
</ol>

Report Generation will be used by a TopCoder client. All application documentation (including an assembly guide) will be available once registered. 
<br><br>
<span class="bigRed">NOTE: Please see the eligibility requirements below. Competitors must sign a non-disclosure agreement (NDA) and pass a background check before being admitted into this competition.   If you have previously completed these documents, no further action is needed.  The background check process may take up to 2 weeks which could affect your participation in this competition.  However, once you are cleared, you will be able to compete in future competitions that impose this restriction.
<br><br>
If you are unsure of your status, please email <A href="mailto:hr@topcoder.com">hr@topcoder.com</A></span>
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This assembly competition will consist of component integration and extensive unit testing to ensure correct operation.  The majority of the application will be implemented by generic TopCoder components.  The main task will involve <b>configuring these components, writing UI code, writing unit tests</b>, and <b>providing directions for configuration within the larger application</b>.  These directions must identify any configurations that are necessary to run your solution.  
<ul>
<li>An html prototype will be provided to you. You should use these pages for the intended functionality.</li>
<li>A sample database will be provided containing data to produce each report.</li>
</ul>
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below: 
<ul>
<li>.NET 2.0 (C#) </li>
<li>ASP.NET 2.0 </li>
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
Total Payment - $15,000
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

<span class="bigRed">Your ability to participate in this competition is contingent on the completion and satisfactory review of a background check, agreement to the Assembly Terms of Work and signing of a Non Disclosure Agreement (NDA). Once you have registered this information will be emailed to you and should be returned within 24 hours.  If you have previously completed these documents, no further action is needed.
<br><br>
The background check process may take up to 2 weeks which could affect your participation in this competition.  However, once you are cleared, you will be able to compete in future competitions that impose this restriction.
<br><br>
If you are unsure of your status, please email <A href="mailto:hr@topcoder.com">hr@topcoder.com</A></span>
<br><br>

<div class="sectionHeader">Timeline</div>
All submissions are required to be submitted by the end of Competition Phase. The end of each phase is at 9:00 AM EST.
<br><br>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="350">
   <tr>
      <td><strong>Phase</strong></td><td align="right"><strong>Start</strong></td><td align="right"><strong>End</strong></td>
   </tr>
   <tr>
      <td>Registration &amp; Team Creation:</td><td align="right">01.18.2007</td><td align="right">01.24.2007</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">01.18.2007</td><td align="right">02.04.2007</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">02.04.2007</td><td align="right">02.07.2007</td>
   </tr>
   <tr>
      <td>Appeals:</td><td align="right">02.07.2007</td><td align="right">02.08.2007</td>
   </tr>
   <tr>
      <td>Appeal Response:</td><td align="right">02.08.2007</td><td align="right">02.09.2007</td>
   </tr>
   <tr>
      <td>Final Fix:</td><td align="right">02.09.2007</td><td align="right">02.11.2007</td>
   </tr>
   <tr>
      <td>Final Review:</td><td align="right">02.11.2007</td><td align="right">02.12.2007</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Milestones</div>
At intervals during the competition phase, assembly teams will be expected to demonstrate progress by providing interim deliverables as specified in the following table.  <span class="bigRed">Each team will receive payment for successfully submitting their milestone as indicated below.  Milestones payments are not dependent on a final solution.  Each team will be compensated per milestone.</span><br><br>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="350">
   <tr>
      <td><strong>Date</strong></td><td><strong>Deliverables</strong></td><td><strong>Payment</strong></td>
   </tr>
   <tr>
      <td valign="top">01.27.2007</td><td valign="top">Fully functional tabular reports</td><td valign="top">$500</td>
   </tr>
   <tr>
      <td valign="top">02.02.2007</td><td valign="top">Fully functional graph reports</td><td valign="top">$500</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
Registration is closed.
<br><br>
<%--
To sign up, please send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Report Generation">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First &amp; Last Name</li>
<li>Complete name of Assembly Competition project</li>
<li>Indicate your role as either team captain, free agent, or a member of an existing team. Also, indicate your team name if applicable.</li>
</ul>
--%>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Report Generation">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

