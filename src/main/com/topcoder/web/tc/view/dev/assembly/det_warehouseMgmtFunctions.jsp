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

<span class="bigTitle">Warehouse Management Phase 1 Warehouse Functions</span>
<br><br>
<div class="sectionHeader">Overview</div>
<span class="bodySubtitle">Application Overview</span><br>
The Warehouse Management System project will increase productivity at TopCoder's client, cut costs drastically, and provide them with real time, on-demand reports.
<br><br>
The Warehouse Functions portion of the application covers all the movements of a product.  There are four basic movements:
<ul>
<li>Transfer - Moving either a carton, gaylord (a very large box), or a pallet from one location to another.  This is usually done when items are ready to be moved to a warehouse or if they are sold and being shipped to a customer.</li>
<li>Trailer Transfer - Moving a whole trailer from one location to another.  This is usually done to either process or ship the item in the trailer.</li>
<li>Reduction/Addition - Either removing or adding items to an existing carton or pallet.  This is usually done when an item has been sold.</li>
<li>Consolidation - Combining two pallets into one.  This is done when pallet locations are needed.</li>
</ul>

Application administration will also be included here. These are simply screens set up to maintain item and location attributes.
<br><br>
<span class="bodySubtitle">Competition Overview</span><br>
This assembly competition will consist of creating projects, editing projects, viewing projects, performing various project operations (i.e. performing submission, screenings, uploading test cases), ending phases and posting deliverables.
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=061906"><img src="/i/development/assembly/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
Each team will be responsible for creating their working environment. The working environment requirement details for this application are outlined in the Application Requirements Specification located in the documentation bundle. An overview of the environment requirements are listed below:
<ul>
<li>ASP.NET</li>
<li>SQL Server</li>
</ul>

<div class="sectionHeader">Documentation</div>
Documentation/Specifications are available in the application forums <A href="https://software.topcoder.com/forum/c_forum.jsp?f=23219504">here</A>.<br><br>

<div class="sectionHeader">Payment</div>
TopCoder will compensate the first and second place submissions.
<br><br>
<strong>Winning Team</strong><br>
Total Payment - $7,000
<br><br>
<strong>Second Place Team</strong><br>
Total Payment - $3,000
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
      <td>Team Creation:</td><td align="right">09.12.2006</td><td align="right">09.15.2006</td>
   </tr>
   <tr>
      <td>Competition Phase:</td><td align="right">09.15.2006</td><td align="right">10.02.2006</td>
   </tr>
   <tr>
      <td>Test Challenge Phase:</td><td align="right">10.02.2006</td><td align="right">10.03.2006</td>
   </tr>
   <tr>
      <td>Review Phase:</td><td align="right">10.04.2006</td><td align="right">10.05.2006</td>
   </tr>
   <tr>
      <td>Feedback Phase:</td><td align="right">10.05.2006</td><td align="right">10.06.2006</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
 Registration is closed. 
<%--
To sign up as a Team Captain or a Free Agent, send an email to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Register: Warehouse Management Phase 1 Warehouse Functions">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Complete name of Assembly Competition project</li>
<li>Position desired (Team Captain or Free Agent)</li>
<li>Team you wish to work with (not necessary for Team Captains and optional for Free Agents)</li>
<li>Percentage of team earnings desired</li>
   <ul>
   <li>Note that for the Warehouse Management Phase 1 Warehouse Functions competition, all team members, including the Team Captain, will receive an equal percentage of the prize money.</li>
   </ul>
</ul>
--%>
<br><br>
<div class="sectionHeader">Submission</div>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com?subject=Submission: Warehouse Management Phase 1 Warehouse Functions">AssemblySubmissions@topcoder.com</A> before the end of the Competition Phase.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The last code submitted prior to the deadline will be used as your final submission.
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

