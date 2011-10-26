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

<span class="bigTitle">Warehouse Management Phase 2 Reporting</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The Warehouse Management System will significantly increase productivity, cut costs and drastically improve productivity by providing real time, on-demand reports.
<br><br>
The reports will be written in MS SQL Server/Report Server and will provide the client with powerful information that they are currently missing. These reports will serve two basic functions:
<ul>
<li>First, these reports will be used for almost every aspect of the company, including sales, accounting, planning, allocating, and logistics.</li>
<li>Second, these reports will include transaction summary reports. These will be used as an audit trail to track items and to measure efficiency.</li>
</ul>
Each report will consist of a filter screen and a report displaying the appropriate information.  Drop down lists on the filter screens are driven from the tables specific to the given reports attributes. These reports provide management timely and accurate data for all business activities throughout the day, month and year.
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
The Reporting Assembly Competition is a straightforward, logical, and a manageable project.  This competition is a great opportunity for a developer to gain exposure to report server, or for an experienced report writer to shine.  Once these reports have been completed they will revolutionize the way that our client does business.
<br><br>
The reports will summarize all the activities that will be accomplished in phase 2 along with any corresponding exceptions.  Specifically these reports will summarize items being purchased via purchase orders, items being received & audited, unprocessed goods, and processed goods.  These reports will be used by sales to know what goods they have available, by management to grade their teams performance, and to schedule future work.  The exception reports will be used to catch mistakes, so that users can be educated.
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>ASP.NET Version 1.1<br>
<A href="http://www.asp.net/downloads/default.aspx?tabid=62">http://www.asp.net/downloads/default.aspx?tabid=62</A></li>
<li>SQL Server 2000<br>
<A href="http://www.microsoft.com/sql/downloads/2000/default.mspx">http://www.microsoft.com/sql/downloads/2000/default.mspx</A></li>
<li>Report Server<br>
<A href="http://www.microsoft.com/sql/technologies/reporting/default.mspx">http://www.microsoft.com/sql/technologies/reporting/default.mspx</A></li>
</ul>

<div class="sectionHeader">Documentation</div>
Documentation/Specifications will be made available in the competition forum after you have completed the registration process.
<br><br>

<div class="sectionHeader">Payment</div>
TopCoder will compensate the first and second place submissions.
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $3,500<br>
*Additional Milestone Bonuses - $500
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $1,500<br>
*Additional Milestone Bonuses - $500
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
      <td>Team Creation:</td><td align="right">01.26.2007</td><td align="right">02.02.2007</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">02.02.2007</td><td align="right">02.16.2007</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">02.16.2007</td><td align="right">02.19.2007</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">02.19.2007</td><td align="right">02.23.2007</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Milestones</div>
At intervals during the competition phase, assembly teams will be expected to demonstrate progress by providing interim deliverables as specified in the following table.
<br><br>
<div align="left">
<table cellpadding="0" cellspacing="0" border="0" width="500">
   <tr>
      <td width="100"><strong>Date</strong></td><td width="400"><strong>Deliverables</strong></td>
   </tr>
   <tr>
      <td valign="top" colspan="2">&#160;</td>
   </tr>
   <tr>
      <td valign="top"><b>02.07.2007</b></td><td valign="top"><b>Milestone 1</b></td>
   </tr>
   <tr>
      <td valign="top" colspan="2"><i>PO:</i></td>
   </tr>
   <tr>
      <td valign="top">2.1.1.1</td><td valign="top">Purchase Order Summary</td>
   </tr>
   <tr>
      <td valign="top">2.1.1.2</td><td valign="top">PO Revision History</td>
   </tr>
   <tr>
      <td valign="top" colspan="2">&#160;</td>
   </tr>
   <tr>
      <td valign="top" colspan="2"><i>Receiving:</i></td>
   </tr>
   <tr>
      <td valign="top">2.1.1.3</td><td valign="top">Incoming Log</td>
   </tr>
   <tr>
      <td valign="top">2.1.1.4</td><td valign="top">Receiving Report</td>
   </tr>
   <tr>
      <td valign="top">2.1.1.5</td><td valign="top">Audit Results Report</td>
   </tr>
   <tr>
      <td valign="top">2.1.1.6</td><td valign="top">Receiving Schedule</td>
   </tr>
   <tr>
      <td valign="top" colspan="2">&#160;</td>
   </tr>
   <tr>
      <td valign="top"><b>02.12.2007</b></td><td valign="top"><b>Milestone 2</b></td>
   </tr>
   <tr>
      <td valign="top" colspan="2"><i>Unprocessed:</i></td>
   </tr>
   <tr>
      <td valign="top">2.1.1.7</td><td valign="top">Unprocessed Report - Summary</td>
   </tr>
   <tr>
      <td valign="top">2.1.1.8</td><td valign="top">Unprocessed Report - Detail</td>
   </tr>
   <tr>
      <td valign="top" colspan="2">&#160;</td>
   </tr>
   <tr>
      <td valign="top" colspan="2"><i>Processing:</i></td>
   </tr>
   <tr>
      <td valign="top">2.1.1.9</td><td valign="top">Processing Report</td>
   </tr>
   <tr>
      <td valign="top">2.1.1.10</td><td valign="top">Trailer Movement Schedule</td>
   </tr>
   <tr>
      <td valign="top">2.1.1.11</td><td valign="top">Processing Schedule</td>
   </tr>
   <tr>
      <td valign="top" colspan="2">&#160;</td>
   </tr>
   <tr>
      <td valign="top"><b>02.16.2007</b></td><td valign="top"><b>Due at Submission</b></td>
   </tr>
   <tr>
      <td valign="top" colspan="2"><i>Exception:</i></td>
   </tr>
   <tr>
      <td valign="top">2.1.1.12</td><td valign="top">Vendor History</td>
   </tr>
   <tr>
      <td valign="top">2.1.1.13</td><td valign="top">Label Attribute Updates</td>
   </tr>
   <tr>
      <td valign="top">2.1.1.14</td><td valign="top">Carton Label Exception Report</td>
   </tr>
   <tr>
      <td valign="top">2.1.1.15</td><td valign="top">Hold Inventory</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
Registration is closed. 
<br><br>
<%--
<b>NOTE:</b> Please see eligibility requirements above. Competitors must sign a non-disclosure agreement before being admitted into this competition.  If you have already submitted a non-disclosure agreement for another assembly competition, you are not required to submit another one.
<br><br>
To sign up, please send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Warehouse Management Phase 2 Reporting">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First &amp; Last Name</li>
<li>Complete name of Assembly Competition project</li>
</ul>
--%>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Warehouse Management Phase 2 Reporting">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

