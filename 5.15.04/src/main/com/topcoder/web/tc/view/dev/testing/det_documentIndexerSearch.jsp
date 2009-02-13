<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Testing Competitions</title>
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
      <jsp:param name="node" value="testing_compete"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="testing"/>
<jsp:param name="title" value="Active Contests"/>
</jsp:include>

<p><span class="bigTitle">Document Indexer Testing Competition: Search Module</span></p>
<div class="sectionHeader">Overview</div>
<p><span class="bodySubtitle">Application Overview</span><br>
The Document Indexer API consists of a series of components that work together in a common interface (API) to allow for the indexing and searching a variety of unstructured data. In particular, the following file types created by the following programs are supported:</p>

<ul>
	<li>Adobe Acrobat Text-based (not image-based) </li>
	<li>Microsoft Word 6.0 ('97) or later</li>
	<li>Rich Text Editors</li>
	<li>Text Editors</li>
	<li>Web Editors</li>
</ul>

<p>The API is intended for use in conjunction with existing TopCoder administrative web functionality to allow company recruiters to easily index and search through member resumes that are stored in an Informix 10 database.  The API supports indexing and searching by the following criteria:</p>
<ul>
	<li>Keyword</li>
	<li>Phrase</li>
	<li>Word Proximity</li>
	<li>WordStrings (AND/OR/NOR & Double Quotes)</li>
</ul>

<p>Competitors will be required to set-up a local environment similar to the one showing under the "Environment" section later in this document, to adequately assemble and check their code.</p>

<p><span class="bodySubtitle">Competition Overview</span><br>
The Document Indexer API is currently being created in an Assembly contest being held in tandem with this Testing competition and consists of three major modules:  </p>

<ul>
	<li>File Mangement Module</li>
	<li>Indexing Module</li>
	<li>Scheduling Module</li>
	<li>Searching Module</li>
</ul>

<p>This Testing competition will create a series of automated tests that will verify that the Search Module is working according to the requirements documentation.  Test scenarios will be provided and competitors will be required to convert those scenarios into automated tests.  However competitors are also expected to create additional automated tests based on their understanding of the requirements.</p>


<p><strong>Search Function module:</strong><br>
This application will present a web page that allows the user to enter keyword queries (using and, or, nor double quotes, etc) in order to search through the documents. A simple help should be available in the page to show the user what types of searches are available and what the syntax is.</p>

<p>The page should also have a list with the options to sort the documents in the search result:</p>
<ul>
	<li>using the ranking of the document</li>
	<li>using the word count</li>
	<li>using the date.</li>
</ul>

<p>There should be an option to sort the documents ascending or descending.</p>

<p>The result of the search will be displayed in a web page that shows the documents results in a table similar to the one described above. Each document will have an extra column with the ranking and word count.  Each document in the search should also have an downloadable link, that is, users should be able to click on a particular search result link and download the associated file.</p>

<p><b>Note:</b>This Testing competition is being run in parallel with an Assembly Competitions.  Part of the requirements of the Assembly competition will be to run the automated tests that are generated as a result of this testing competition and verify that the assembled API/application returns the expected results correctly.  The files that are indexed and made available for searching in the Assembly competition will also be part of the sample files used in the creation of automated tests.</p>

<div align="right"><A href="/tc?module=Static&d1=features&d2=071006"><img src="/i/development/testing/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
<p>Application Technologies
<ul>
	<li>Linux</li>
	<li>Java 1.4</li>
	<li>Informix 10</li>
	<li>Windows/Microsoft</li>
</ul>
</p>

<p>Environment</p>
<div align="center"><A target="_blank" href="/i/development/testing/WindowsEnvironment.png"><img src="/i/development/testing/WindowsEnvironment_small.png" alt="Windows Environment" border="0" /></A><br>
Click image to see larger view.</div>

<p>Testing Technologies 
<ul>
	<li>JUNIT</li>
	<li>httpUnit</li>
</ul>
</p>

<div class="sectionHeader">Documentation</div>
<p>Documentation and Application resources that will be provided to Registered Competitors:
<ul>
	<li>Requirements Specifications</li>
	<li>Use Case Diagrams</li>
	<li>Activity Diagrams</li>
	<li>Base Test Scenarios</li>
	<li>Sample Test Data</li>
</ul>
</p>

<div class="sectionHeader">Submission Deliverables</div>
<p>The list below defines the deliverables for the competition: 
<ul>
	<li>Test cases source code</li>
	<li>Definition of any additional tests created</li>
	<li>Any instructions required to configure or run the tests</li>
</ul>
</p>
<p>All submissions should be submitted in a zip file format called:<br>
[Member_Handle]_SearchTests.zip</p>

<div class="sectionHeader">Competition Deliverable Tasks</div>
<p>Requirements to Test:</p>
<div align="center">
<table cellpadding="4" cellspacing="0" width="400">
<tr><td>2.14</td><td valign="top">Search Document</td></tr>
<tr><td>2.15</td><td valign="top">Retrieve Document</td></tr>
</table>
</div>
<br>

<div class="sectionHeader">Payment</div>
<p>TopCoder will compensate teams with first and second place submissions.  Initial payment for the winning team will be distributed in two installments.  First Milestone: When the winning solution is submitted and the review board suggestions are integrated, 75% of the prize money will be paid.  Second Milestone: The remaining 25% of the prize money will be paid at the completion of the Deployment phase of the project.</p>
<p>
<strong>Winning Test Solution</strong><br>
Total Payment - $800</p>
<p>
<strong>Second Place Test Solution</strong><br>
Total Payment - $400</p>

<div class="sectionHeader">Eligibility</div>
<p>You must be a TopCoder member, at least 18 years of age, meeting all of the membership requirements. In addition, you must fit into one of the following categories.<br>
If you reside in the United States, you must be either:<br>
<ul>
<li>A US Citizen</li>
<li>A Lawful Permanent Resident of the US</li>
<li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S.</li>
</ul>
If you do not reside in the United States:<br>
<ul>
<li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will not need to do anything to become authorized)</li>
</ul>
</p>

<div class="sectionHeader">Timeline</div>
<p>All submissions are required to be submitted by the end of Competition Phase. The end of each phase is at 9:00 AM EDT.</p>

<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="350">
   <tr>
      <td><strong>Phase</strong></td><td align="center"><strong>Start</strong></td><td align="center"><strong>End</strong></td>
   </tr>
   <tr>
      <td>Registration Phase:</td><td align="center">07.13.2007</td><td align="center">07.16.2007</td>
   </tr>
   <tr>
      <td>Test Submission:</td><td align="center">07.16.2007</td><td align="center">07.23.2007</td>
   </tr>
   <tr>
      <td>Test Case Screening:</td><td align="center">07.23.2007</td><td align="center">07.24.2007</td>
   </tr>
   <tr>
      <td>Winner Selection:</td><td align="center">&#160;</td><td align="center">07.27.2007</td>
   </tr>
</table>
</div>
<br><br>
<div class="sectionHeader">Registration</div>
<p>Registration is closed.</p>
<%--  
<p>To sign up as a participant, send an email to <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Document Indexer Testing Competition: Search Module">TestingCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Name of Testing Competition in which you would like to participate</li>
</ul>
TopCoder staff will respond as to whether you are registered or not.
</p>
--%>
<div class="sectionHeader">Submission</div>
<p>Once you have test code you are ready to submit, you can do so by emailing your source code to <A href="mailto:TestingSubmissions@topcoder.com?subject=Submit: Document Indexer Testing Competition: Search Module">TestingSubmissions@topcoder.com</A> by the submission deadline.  Once a submission is received, it will be screened.  All code that passes screening will be made available to the Assembly Competition teams.</p>

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

