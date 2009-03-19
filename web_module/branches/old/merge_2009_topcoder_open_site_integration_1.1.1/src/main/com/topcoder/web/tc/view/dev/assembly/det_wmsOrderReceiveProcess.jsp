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

<span class="bigTitle">Warehouse Management Phase 2 - <br>Ordering, Receiving and Processing</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The Warehouse Management System (WMS) project will significantly increase productivity, cut costs drastically, and provide them with a platform to scale its business to meet increasing demands. 
<br><br>
The Ordering, Receiving, and Processing portion of the application covers the data capture and workflow from purchasing items through receiving and processing the items.  These are the basic pieces: 
<ul>
<li><b>PO Creation</b>: This process will start with a buyer filling out a form that includes information about the goods being purchased and instructions regarding shipping and processing the goods.</li>
<li><b>PO Receiving</b>: Items will have to be counted, audited, and stored in unprocessed inventory when they are received.</li>
<li><b>Processing</b>: This includes many different tasks, including various sorts, grading, and marking. At each sort, information including quantity, status, and sort type is recorded. Sorting includes season, gender, quality, category, and marking.</li>
</ul>
<span class="bodySubtitle">Competition Overview</span><br>
The Phase 2 Ordering, Receiving, and Processing Assembly Competition will enable our client's business to transfer a majority of their daily functions from paper to computer.  This will allow for on-demand reporting, data integrity, and increased visibility which will ultimately provide a competitive advantage to our client.  
<br><br>
All aspects of the business will be linked through the WMS, which will create a business environment that is more efficient and reliable.  This empowers management to make accurate decisions in dealing with staffing levels and inventory disposition while streamlining their business processes.
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>ASP.NET 1.1<br>
<A href="http://www.asp.net/downloads/default.aspx?tabid=62">http://www.asp.net/downloads/default.aspx?tabid=62</A></li>
<li>SQL Server 2000<br>
<A href="http://www.microsoft.com/sql/downloads/2000/default.mspx">http://www.microsoft.com/sql/downloads/2000/default.mspx</A></li>
</ul>

<div class="sectionHeader">Documentation</div>
Documentation/Specifications will be made available in the competition forum after you have completed the registration process.
<br><br>

<div class="sectionHeader">Payment</div>
TopCoder will compensate the first and second place submissions.
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $11,000<br>
*Additional Milestone Bonuses - $1,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $5,500<br>
*Additional Milestone Bonuses - $1,000
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
      <td>Team Creation:</td><td align="right">02.03.2007</td><td align="right">02.07.2007</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">02.07.2007</td><td align="right">02.28.2007</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">02.28.2007</td><td align="right">03.03.2007</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">03.03.2007</td><td align="right">03.07.2007</td>
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
      <td valign="top"><b>02.14.2007</b></td><td valign="top"><b>Milestone 1</b></td>
   </tr>
   <tr>
      <td valign="top">&#160;</td>
      <td valign="top">
      <b>Create Purchase Order</b><br>
      - Off Price POR Form<br>
      - Corporate POR Form
      </td>
   </tr>
   <tr>
      <td valign="top" colspan="2">&#160;</td>
   </tr>
   <tr>
      <td valign="top"><b>02.22.2007</b></td><td valign="top"><b>Milestone 2</b></td>
   </tr>
   <tr>
      <td valign="top" colspan="2">&#160;</td>
   </tr>
   <tr>
      <td valign="top">&#160;</td>
      <td valign="top">
      <b>Receiving</b><br>
      - Receive Inbound Goods<br>
      - Incoming Work Order Created<br>
      - Receive Inbound Goods<br>
      - Receiving Document Created<br>
      - Direct Shipment Receiving<br>
      - Print IP List<br>
      - Receiving Information Entered into Summary<br>
      - FOB Receive
      <br><br>
      
      <b>Manage PO</b><br>
      - Modify PO Information<br>
      - Manage PO Status<br>
      - Manage Items Costs<br>
      - Combine PO's
      </td>
   </tr>
   <tr>
      <td valign="top" colspan="2">&#160;</td>
   </tr>
   <tr>
      <td valign="top"><b>02.28.2007</b></td><td valign="top"><b>Due at Submission</b></td>
   </tr>
   <tr>
      <td valign="top" colspan="2">&#160;</td>
   </tr>
   <tr>
      <td valign="top">&#160;</td>
      <td valign="top">
      <b>Create Work Order</b><br>
      - Determine Items/Sort/Label/Grading/Packing<br>
      - Enter the Description/Label Options Based on the Pre-Sort<br>
      - Label Preview
      <br><br>
      
      <b>Process Off Price</b><br>
      - Print Bin/Gaylord Label for Sorted Goods
      </td>
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
To sign up, please send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Warehouse Management Phase 2 - Ordering, Receiving and Processing">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First &amp; Last Name</li>
<li>Complete name of Assembly Competition project</li>
</ul>
--%>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Warehouse Management Phase 2 - Ordering, Receiving and Processing">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

