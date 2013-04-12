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

<span class="bigTitle">Product Management Console</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The Product Management Console is a Server Client Application which allows users to import, change and export products to an eCommerce Application from various existing corporate Divisions and Brands.
<br><br>
The user can import product information in a "raw format" (Reference) and convert these into SKUs (Stock Keeping Units) through the application.
<br><br>
The application has a smart search function. The results of the search are displayed to the user in the application on rich sortable and editable grids. In addition, the application allows the user to export search results to Excel.
<br><br>
The Product Management Console is composed of a series of components built through the TopCoder Component Production methodology. 
<br><br>
TopCoder is providing the original MS Access Application (which the client is using at the moment) and the existing database for the registrants to use as a reference.
<br><br>
Specific tasks of this application include: 
<ul>
<li>Import:<br>
The application has a wizard to help the user to import data from different excel sheets</li>
<li>Export:<br>
Mark SKU for export to the existing eCommerce solution</li>
<li>Style Grouping:<br>
allow user to style group References to products to create SKU</li>
<li>Offline Work:<br>
The user is able to download data for offline usage. This can be helpful if the user has to work with the application without internet connection over VPN.</li>
<li>Scanning barcodes:<br>
The user can scan barcodes to find the product information in the application.</li>
<li>Workflow Management:<br>
Parts of the application have a workflow management to collaborative human work</li>
</ul>
Most of the code for the application is contained within components; however, some functions are required in the assembly code. Teams will be responsible for configuration of the components, configuration of the application and conversion of prototype (to content templates) according to the specified application architecture designs, 
<br><br>
These applications are to be used by a TopCoder client. All application documentation will be available once registered. 
<br><br>
<b>NOTE:</b> Please see eligibility requirements below. Competitors must sign a non-disclosure agreement before being admitted into this competition.  If you have already submitted a non-disclosure agreement for another assembly competition you are not required to submit another one.
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This assembly competition will consist of prototype conversion, component integration, and extensive unit testing to ensure correct operation. 
<br><br>
This competition involves assembling the Product Management Console. The greatest part of the application is implemented by custom and generic components that have recently been completed. The main tasks will involve configuring these components and integrating them with the .Net Prototype. Teams will be required to commit their in-progress work to TopCoder's Subversion repository at specific checkpoints during the competition. 
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>Runs in the .NET 2.0 framework</li>
<li>Client application is a .NET executable (not browser based)</li>
<li>Windows XP Professional 2002 SP2</li>
<li>Windows SQL 2005 SP1</li>
<li>Windows Server 2003 SP1</li>
</ul>
<%--
<div class="sectionHeader">Documentation</div>
Documentation/Specifications are available in the application forums <A href="https://software.topcoder.com/forum/c_forum.jsp?f=24428969">here</A>.
<br><br>
--%>
<div class="sectionHeader">Payment</div>
TopCoder will compensate teams with first and second place submissions. Initial payment for the winning team will be distributed in two installments. First Installment: When the winning solution is submitted and review board suggestions are integrated. Second Installment: Marked by the completion of the Deployment phase of the project.
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $17,000<br>
*Additional Checkpoint Bonuses - $3,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $8,600<br>
*Additional Checkpoint Bonuses - $1,500
<br><br>
*Additional bonuses are included when the Winning and Second Place Team meet each of the competition checkpoints. Checkpoints will be available once registered.
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
      <td>Team Creation:</td><td align="right">01.12.2007</td><td align="right">01.23.2007</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">01.23.2006</td><td align="right">02.15.2007</td>
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
<%--
Registration is closed.
<br><br>
--%>
To sign up, please send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Product Management Console">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Complete name of Assembly Competition project</li>
<li>Indicate your role as either team captain, free agent, or a member of an existing team. Also, indicate your team name if applicable.</li>
</ul>

<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Product Management Console">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

