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
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
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
1 - The submission does not take the architecture into consideration.<br>
2 - Most of the architecture is followed, but there has been moderate changes to the architecture.<br>
3 - Some logging or auditing is missing from the application.<br>
4 - The design specification is exactly followed.<br>
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
1 - Configuration parameters are missing.<br>
2 - A few configurable parameters are hard coded.<br>
3 - Configuration files follow the design specification.<br>
4 - Configuration files are well documented and follow the design specification.<br>
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
The exposed API operates exactly as defined.  The interfaces match the component interface diagram.<br>
1 - Functions have been added to the interfaces used by the GUI.<br>
2 - A few parameters or functions in the defined interface have been changed.<br>
3 - The submission followed the component diagram interface.<br>
4 - The submission followed the component diagram interface and is well documented.<br>
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
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The Public API is implemented in accordance with the design documents.</strong><br>
This question covers the details of implementation and not only includes technical details such as modifiers and types, but also naming conventions.  Additions to the existing API are not permitted.<br>
1 - Functions have been added to the interfaces used by the GUI.<br>
2 - A few parameters or functions in the defined interface have been changed.<br>
3 - The submission followed the component diagram interface.<br>
4 - The submission followed the component diagram interface and is well documented.<br>
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
1 - Some of the interface classes have not been implemented or several new classes have been added.<br>
2 - Public variables have been added to the interface.<br>
3 - The submission followed the component diagram interface.<br>
4 - The submission followed the component diagram interface and is well documented.<br>
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
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Required components are used effectively in the implementation.  Please list any incorrect implementations.</strong><br>
1 - Components and technologies are not used, or used improperly affecting the functionality of the component or making the component unusable.<br>
2 - Some components and technologies are not used, which that slightly influences the performance or results in excessive amounts of code. Same score applies if some components and technologies are not used as the best practice dictates, but the final goal is achieved nevertheless.<br>
3 - Components and technologies are used properly.<br>
4 - Components and technologies are used properly beyond what is outlined in the design. The implementation is not a simple copy/paste of the code provided in the spec. It is clear that the developer has done some research of his/her own (or already possessed the knowledge). This is the case usually when the design does a poor job in explaining how the technologies and components should be used.<br>
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
1 - Components and technologies are not used, or used improperly affecting the functionality of the component or making the component unusable.<br>
2 - Some components and technologies are not used, which that slightly influences the performance or results in excessive amounts of code. Same score applies if some components and technologies are not used as the best practice dictates, but the final goal is achieved nevertheless.<br>
3 - Components and technologies are used properly.<br>
4 - Components and technologies are used properly beyond what is outlined in the design. The implementation is not a simple copy/paste of the code provided in the spec. It is clear that the developer has done some research of his/her own (or already possessed the knowledge). This is the case usually when the design does a poor job in explaining how the technologies and components should be used.<br>
<strong>[Overall Weight = 2%]</strong>
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
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The front end prototype conversion is functioning in the same exact manner as the prototype.</strong><br>
All prototype functionality is implemented in the final product.  Sorting, linking, graphics, stylesheets match the prototype.<br>
1 - The submission is lacking in many areas. In order to complete it, much work needs to be done.<br>
2 - The submission is lacking in many areas but the application still works and it is possible to use it. The problems it has should be fixable without much effort.<br>
3 - The submission meets all requirements but it doesn't excel in any way. The fixes that need to be done should not be significant. The submission should be of average quality.<br>
4 - The submission excels in many areas. All requirements are met and some are exceeded. In order to complete the component, only minor items need to be fixed. This submission is clearly above average.<br>
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
   <tr><td class="title" colspan="4">Exceptions</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The implementation properly handles all exception cases.  Well formatted errors are displayed to the user and errors are logged properly to a file.</strong><br>
1 - System exceptions were re-used where a specific custom exception should have been defined. Appropriate custom exceptions were not defined or a single generic exception is used throughout the application for every custom reason.<br>
2 - Appropriate custom exceptions were defined but for multiple, unrelated reasons or system exceptions were reused inappropriately.<br>
3 - Custom exceptions were used appropriately for multiple, related reasons but do not give specific reason details beyond the included text or the design inappropriately identified a null argument exception.<br>
4 - System exceptions were reused appropriately. Custom exceptions were used appropriately and give reason details beyond simple text. Custom exceptions were used appropriately and for a single specific reason alone. Custom exceptions were not appropriate for this submission.<br>
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
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Front end conversion code does not add unnecessary code to the JSPs/Servlets/ASPx files.  The front code is short and concise.  Patterns are followed correctly.</strong><br>
1 - The submission consistently uses patterns/methodologies inappropriately, causing potential problems either in implementing the application or in implementing future enhancements to the application.<br>
2 - An appropriate pattern/methodology was used but the submitter showed a lack of understanding in the implementation of it. A pattern/methodology should have been used but was not (name the missing patterns and explain how the submission would benefit from using them). A pattern/methodology was 'forced' (name the inappropriate patterns and explain why they are not applicable to the design).<br>
3 - Appropriate patterns and/or methodologies were used but the submitter missed some in the application  specification (either missed completely or incorrectly labeled).<br>
4 - Appropriate patterns and/or methodologies were used.  The reviewer should also assign this rating if the design, appropriately, does not need any patterns/methodologies.<br>
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
<strong>There is no unnecessary /careless object instantiation or variable assignment.   Needless boxing and type conversion must be avoided at all costs.</strong><br>
1 - Some entities are missing or are changed in a way that makes the application no longer able to provide some functionality or the usage is changed.<br>
2 - The API is affected but the usage remains the same (changes in names, added exceptions, widened visibilities or changes in types).<br>
3 - One or two changes are present that have no effect on the usage (i.e., final modifiers).<br>
4 - Everything is declared exactly as in the design.<br>
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
1 - Documentation is consistently missing or consistently not helpful.<br>
2 - Documentation is missing in at least one important algorithm / code block or consistently provides little help to the developer. Documentation contains useless comments that do not provide any value to the implementation, but only make it harder to read / understand. <br>
3 - Documentation is complete and adequate to understand the implementation, but there may be several places where it can further be enhanced with useful details, or simplified by removing useless comments.<br>
4 - Documentation is clear, complete and concise, helping in clarifying implementation decisions and details.<br>
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
<strong>Security has been properly addressed.  The code has no malicious constructs, such as Trojan Horses, back doors or SQL Injections.  If any of these exist, TopCoder reserves the right to fail submissions if the security rules have been violated.</strong><br>
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
   <tr><td class="title" colspan="4">Test Cases</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Unit Test Cases thoroughly test all methods and constructors.</strong><br>
Of new and pre-existing classes that depend on the classes modified by the developer.<br>
1 - The unit tests do not correctly and thoroughly test the basic functionality of the component. The developer provided tests that address only valid or invalid arguments, or do not test the component using real values and system configuration. Basic functionality is that functionality that is essential to the component.<br>
2 - The unit tests do not thoroughly test the additional functionality of the component. The developer provided tests that address only valid or invalid arguments, or does not test the component using real values and system configuration. <br>
3 - The unit tests correctly and thoroughly test the functionality of the component. Basic and additional functionality of the component are addressed and tested using real values and system configuration, as it is expected to be run on the client's computer. <br>
4 - The submission is properly tested using different types of tests that address different aspects of each tested method or constructor. For example, if an algorithm has time constraints it should be tested not only for accuracy but also to see if it respects the constraints. When testing for accuracy, an algorithm should be presented with different sets of data.<br>
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
<strong>Stress: </strong>Tests the implementation for concurrency issues, resource leaks etc while under high load.<br>
<strong>Benchmark: </strong>Tests the implementation according to performance and throughput. Output basic benchmarking to System.out<br>
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
<strong>Where applicable, Unit Test Cases properly make use of setup and teardown methods to configure the test environment.  Where applicable, Unit Test cases do not leave temporary files on the file system or rows in a DB after testing is complete.  All required data will be set up using setup methods and removed using teardown methods.</strong><br>
No - Temporary files are left on the file system or database / network connections are not closed after testing is complete.<br>
Yes - Temporary files are removed from the file system after testing is complete and temporary files are created only when needed.<br>
<strong>[Overall Weight = 3%]</strong>
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
<strong>Where necessary, test data is supplied.</strong><br>
1 - Testting data is consistently missing or consistently not helpful.<br>
2 - Testing data is missing on at least one test method or consistently provides little help to the reviewer running the tests.<br>
3 - Testing data is complete and adequate to test the application but may require further configuration.<br>
4 - Testing data is complete and provides full details to the reviewer testing this application. The reviewer should not require any additional information on how the testing of the component will be performed <br>
<strong>[Overall Weight = 3%]</strong>
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
1 - Documentation is consistently missing or consistently not helpful.<br>
2 - Documentation is missing on at least one test method or consistently provides little help to the maintenance developer.<br>
3 - Documentation is complete and adequate to use the application but may require further clarifications.<br>
4 - Documentation is complete and provides full details to the developer maintaining this application. The developer should not require any additional information on how the testing of the application will be maintained or enhanced.<br>
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
   <tr><td class="title" colspan="4">Deployment Guide</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The Deployment Guide succinctly and accurately details the deployment of the application.  Folowing this guideline, a deployment engineer is able to deploy the application</strong><br>
1 - Documentation is consistently missing or consistently not helpful.<br>
2 - Documentation is missing on at least one deployment area or consistently provides little help to the deployment engineer.<br>
3 - Documentation is complete and adequate to deploy the application but may require further clarifications.<br>
4 - Documentation is complete and provides full details to the deployment engineer deploying this application. The deployment engineer should not require any additional information on how to deploy the application.<br>
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
   <tr><td class="title" colspan="4">Test Plan</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The Application conforms and operationally functions as described in the Test Plan.</strong><br>
Rating 1 - The submission is lacking in many areas. In order to complete it, much work needs to be done.<br>
Rating 2 - The submission is lacking in many areas but the application still works and it is possible to test it. The problems it has should be fixable without much effort.<br>
Rating 3 - The submission meets all requirements but it doesn't excel in any way. The fixes that need to be done should not be significant. The submission should be of average quality.<br>
Rating 4 - The submission excels in many areas. All requirements are met and some are exceeded. In order to complete the appliation, only minor items need to be fixed. This submission is clearly above average.<br>
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

