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

<span class="bigTitle">UML Tool Backend Assembly</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span>
<br><br>
The UML Tool Backend Data Model is one part of the TopCoder UML Tool, which will be used by component competition competitors, as well as TopCoder staff to design and review components.
<br><br>
This assembly competition covers the data model of the tool.  No GUI elements will be developed as part of this particular assembly competition. 
<br><br>
The following functionality is covered:
<ul>
<li>Data model classes, used to represent different elements in a design</li>
    <ul>
    <li>Use case classes</li>
    <li>Sequence diagram classes</li>
    <li>Activity diagram classes</li>
    <li>Class diagram classes</li>
    </ul>
<li>XMI import and export, used for saving and opening files</li>
<li>Data model actions (undo / redo)</li>
</ul>
Most of the functionality is already covered by components. The assembly teams will be required to merge all the components together and write comprehensive unit tests for the data model. Any bugs in the components will also need to be fixed and documented. It is important for the UML Tool to have a solid and stable data model.
<br><br>
The assembled back end will be used by the assemblers of the final GUI application.
<br><br>
NOTE: Please see eligibility requirements below. Competitors must sign a non-disclosure agreement before being admitted into this competition. If you have already submitted a non-disclosure agreement for another assembly competition you are not required to submit another one.
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>Java 1.5</li>
<li>Swing</li>
</ul>
<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions. Initial payment for the winning team will be distributed in two installments. First installment: Winning solution is submitted and review board suggestions are integrated. Second installment: Completion of the Deployment phase of the project.
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $10,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $5,000
<br><br>
*Additional bonuses of up to $1500 are included when the Winning and Second Place Team meet each of the competition milestones. Milestone details will be available once registered.
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
      <td>Team Creation:</td><td align="right">01.31.2006</td><td align="right">02.07.2007</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">02.07.2007</td><td align="right">02.28.2007</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">02.28.2007</td><td align="right">03.04.2007</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">03.04.2007</td><td align="right">03.06.2007</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Milestones</div>
At intervals during the competition phase, assembly teams will be expected to demonstrate progress by providing interim deliverables as specified in the following table. 
<br><br>
<table cellpadding="0" cellspacing="0" border="0" width="500">
   <tr>
      <td width="100"><strong>Date</strong></td><td width="400"><strong>Deliverables</strong></td>
   </tr>
   <tr>
      <td valign="top" colspan="2">&#160;</td>
   </tr>
   <tr>
      <td valign="top">02.12.2007</td><td valign="top">UML Model Manager completed, with UML Model components integrated and configured</td>
   </tr>
   <tr>
      <td valign="top">02.17.2007</td><td valign="top">XMI Reader and XMI Writer completed</td>
   </tr>
   <tr>
      <td valign="top">02.24.2007</td><td valign="top">Action components integrated and configured</td>
   </tr>
   <tr>
      <td valign="top">02.28.2007</td><td valign="top">Completed functionality</td>
   </tr>
</table>
<br><br>
<div class="sectionHeader">Registration</div>
 Registration is closed. 
 <br><br>
<%--
<b>NOTE:</b> Please see eligibility requirements above. Competitors must sign a non-disclosure agreement before being admitted into this competition.  If you have already submitted a non-disclosure agreement for another assembly competition, you are not required to submit another one.
<br><br>
To sign up, please send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: UML Tool Backend Assembly">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First &amp; Last Name</li>
<li>Team (if part of a team)</li>
<li>Complete name of Assembly Competition project</li>
</ul>
--%>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: UML Tool Backend Assembly">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase. Your team can submit code as many times as you wish before the submission deadline without any penalties. The last code submitted prior to the deadline will be used as your final submission.
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

