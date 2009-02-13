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
      <jsp:param name="node" value="assembly_documentation"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="assembly"/>
<jsp:param name="title" value="Documenation"/>
</jsp:include>

<span class="bigTitle">Assembly Review Scorecard</span>
<br><br>
Score each statement below using the values in the Key.  Where appropriate, provide comments on the reason for the score in the space below each line item.  For each score use the following Key [1 = Disagree, 2 = Somewhat Agree, 3 = Agree, 4 = Strongly Agree]. Comments are required for all line items.   For each comment, please state whether it is a Required or Recommended modification, or simply a comment in the right hand column.  The Overall Weight label depicts how much the score of that question affects the overall scorecard score.
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" border="1" width="100%">
   <tr><td class="title" colspan="4">API Development</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>Yes/No</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The implementation addresses the functionality as detailed in the design documents.</strong><br>
Where applicable, list the missing elements below.<br>
1 - Sequence diagrams are not followed, the assembly team implemented the functionality as they saw best<br>
2 - Some of the sequence diagrams are followed by the assembly team added a lot of extra code.<br>
3 - Most of the sequence diagrams were followed, some minor coding was added.<br>
4 - The sequence diagrams were followed exactly to the method call.<br>
<strong>[Overall Weight = 6%]</strong>
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>

   <tr class="dark">
      <td class="value">
<strong>The implementation uses all required technologies (language, required components, etc) and packages as specified in the Requirements Specification Document.</strong><br>
If required technologies or packages are not used properly, explain why.<br>
All components must be used as stated in the design documentation.<br>
<strong>[Overall Weight = 6%]</strong>
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>

   <tr class="dark">
      <td class="value">
<strong>The implementation properly implements configurable parameters as defined in the Application Design Specification.</strong><br>
<strong>[Overall Weight = 6%]</strong>
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The implementation has maintained the public API as defined in the design.  Nothing in the public API should have been removed.</strong><br>
The front end operates exactly as defined.<br>
<strong>[Overall Weight = 6%]</strong>
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
      <td class="value">
      &#160;
      </td>
   </tr>
</table>


<br><br>


<table class="stat" cellpadding="0" cellspacing="0" border="1" width="100%">
   <tr><td class="title" colspan="4">API Implementation (How the design decisions were implemented)</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>Yes/No</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The Public API is implemented in accordance with the design documents.</strong><br>
This question covers the details of implementation and not only includes technical details such as modifiers and types, but also naming conventions.  Additions to the existing API are permitted.<br>
<strong>[Overall Weight = 5%]</strong>
      </td>
      <td class="value" rowspan="4">
      &#160;
      </td>
      <td class="value" rowspan="4">
      &#160;
      </td>
      <td class="value" rowspan="4">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Defined classes are implemented.</strong><br>
If not, list missing classes.<br>
Were additional classes added?<br>
<strong>[Overall Weight = 3%]</strong>
      </td>
      <td class="value" rowspan="4">
      &#160;
      </td>
      <td class="value" rowspan="4">
      &#160;
      </td>
      <td class="value" rowspan="4">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
</table>


<br><br>


<table class="stat" cellpadding="0" cellspacing="0" border="1" width="100%">
   <tr><td class="title" colspan="4">Component Usage</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>Yes/No</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Required components are used effectively in the implementation.  Please list any incorrect implementations.</strong><br>
<strong>[Overall Weight = 5%]</strong>
      </td>
      <td class="value" rowspan="4">
      &#160;
      </td>
      <td class="value" rowspan="4">
      &#160;
      </td>
      <td class="value" rowspan="4">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Additional components are used effectively where applicable.  Please list any inappropriate usages.</strong><br>
<strong>[Overall Weight = 5%]</strong>
      </td>
      <td class="value" rowspan="4">
      &#160;
      </td>
      <td class="value" rowspan="4">
      &#160;
      </td>
      <td class="value" rowspan="4">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
</table>


<br><br>


<table class="stat" cellpadding="0" cellspacing="0" border="1" width="100%">
   <tr><td class="title" colspan="4">Prototype Conversion</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>Yes/No</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>All front end prototype conversion is functioning in the same exact manner as the prototype.</strong><br>
Additional<br>
<strong>[Overall Weight = 5%]</strong>
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
</table>


<br><br>


<table class="stat" cellpadding="0" cellspacing="0" border="1" width="100%">
   <tr><td class="title" colspan="4">Exceptions</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>Yes/No</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The implementation properly handles all exception cases.  Well formatted errors are displayed to the user and errors are logged properly to a file.</strong><br>
<strong>[Overall Weight = 5%]</strong>
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
</table>


<br><br>


<table class="stat" cellpadding="0" cellspacing="0" border="1" width="100%">
   <tr><td class="title" colspan="4">Code Review</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>Yes/No</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Front end conversion code does not add unnecessary code to the JSPs/Servlets/ASPx files.  The front code is short and concise.</strong><br>
<strong>[Overall Weight = 5%]</strong>
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>There is no unnecessary /careless object instantiation or variable assignment.</strong><br>
<strong>[Overall Weight = 2%]</strong>
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The implementation code contains detailed documentation for classes, methods and variables as defined in the Deliverables Document.</strong><br>
<strong>[Overall Weight = 2%]</strong>
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The code has no malicious constructs, such as Trojan Horses, back doors or SQL Injections.</strong><br>
<strong>[Overall Weight = 6%]</strong>
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
</table>


<br><br>


<table class="stat" cellpadding="0" cellspacing="0" border="1" width="100%">
   <tr><td class="title" colspan="4">Test Cases</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>Yes/No</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Unit Test Cases thoroughly test all methods and constructors.</strong><br>
Of new and pre-existing classes that depend on the classes modified by the developer.<br>
<strong>[Overall Weight = 6%]</strong>
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Unit Test Cases thoroughly test for:</strong><br>
<strong>Stress/Benchmark: </strong>Tests the implementation according to performance and throughput. Output basic benchmarking to System.out<br>
<strong>Accuracy: </strong>Tests the implementation on the accuracy of the results when using the component.<br>
<strong>Failure: </strong>Tests the implementations ability to handle bad data and incorrect usage.<br>
<strong>[Overall Weight = 6%]</strong>
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Where applicable, Unit Test Cases properly make use of setup and teardown methods to configure the test environment.</strong><br>
<strong>[Overall Weight = 2%]</strong>
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Where necessary, test data is supplied.<br>
Are initial inserts provided?</strong><br>
<strong>[Overall Weight = 2%]</strong>
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Where applicable, Unit Test cases do not leave temporary files on the file system after testing is complete.</strong><br>
<strong>[Overall Weight = 2%]</strong>
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The unit test code contains documentation for classes, methods and variables as defined in the Deliverables Document.</strong><br>
<strong>[Overall Weight = 2%]</strong>
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
</table>


<br><br>


<table class="stat" cellpadding="0" cellspacing="0" border="1" width="100%">
   <tr><td class="title" colspan="4">Test Plan</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>Yes/No</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The Application conforms and operationally functions as described in the Test Plan</strong><br>
<strong>[Overall Weight = 10%]</strong>
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
      <td class="value" rowspan="3">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
</table>


<br><br>


<table class="stat" cellpadding="0" cellspacing="0" border="1" width="100%">
   <tr><td class="title">Additional Comments</td></tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
   <tr class="light">
      <td class="value">
      &#160;
      </td>
   </tr>
</table>


<br><br>


<table class="stat" cellpadding="0" cellspacing="0" border="1" width="100%">
   <tr>
      <td class="title">Final Score</td>
      <td class="value">&#160;</td>
   </tr>
</table>


<br><br>
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

