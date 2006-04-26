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
      <jsp:param name="node" value="testing_documentation"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="testing"/>
<jsp:param name="title" value="Documenation"/>
</jsp:include>

<span class="bigTitle">Testing Review Scorecard</span>
<br><br>
Score each statement below using the values in the Key.  Where appropriate, provide comments on the reason for the score in the space below each line item.  For each score use the following Key [1 = Disagree, 2 = Somewhat Agree, 3 = Agree, 4 = Strongly Agree]. Comments are required for all line items.   For each comment, please state whether it is a Required or Recommended modification, or simply a comment in the right hand column.  The Overall Weight label depicts how much the score of that question affects the overall scorecard score.
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" border="1" width="100%">
   <tr><td class="title" colspan="4">Documentation</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The implementation code contains detailed documentation for classes, written in Javadoc / XML style as required by the Java / C# coding standards.</strong><br>
The reviewer should look at this from an application developer standpoint. Test suite documentation should contain a description of the class and its purpose. The documentation should emphasize how the test will be used.<br>
1 - Documentation is missing for one or more tests or it proves to be consistently unhelpful. The documentation provided by the developer does not clarify how most of the tests will be used, by providing simple comments that do not bring additional value to the name of the test.<br>
2 - Documentation exists for each test in the the suite but it provides little help to the developer; it is missing details regarding the way a test is intended to be used.<br>
3 - Documentation is complete and adequate to test the application but requires further minor clarifications in several situations.<br>
4 - Documentation is complete and provides full details to the application developer using this test suite. The developer will likely not require any other details on how the tests will be ran.<br>
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
<strong>The implementation code contains detailed documentation for methods, written in Javadoc / XML style as required by the Java / C# coding standards.</strong><br>
The reviewer should look at this from an application developer standpoint. Test documentation should contain a detailed description of the test which can include: intent of test, pre and post conditions, side effects, dependencies, implementation notes, control flow or state dependencies that need to exist before calling this test.<br>
All required tags defining parameters, return type and exceptions should be present and correctly describe method details.<br>
1 - Documentation is consistently missing or consistently unhelpful. A majority of the methods either lack documentation or do not provide required details.<br>
2 - Documentation is missing on at least one method or provides little help to the developer.<br>
3 - Documentation is complete and adequate to test the application but may require further clarifications.<br>
4 - Documentation is complete and provides full details to the application developer using this component. The developer should not require any additional information on how the test suite will be used.<br>
<strong>[Overall Weight = 5%]</strong>
      </td>
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
<strong>The implementation code contains detailed documentation for variables, written in Javadoc / XML style as required by the Java / C# coding standards.</strong><br>
The reviewer should look at this from an application developer standpoint. Variable documentation should contain a description of the variable role and purpose, implementation notes and whether it is intended to be used in subclasses. Variable documentation should exist for all variables in the test suite, regardless of the visibility of the variable.<br>
1 - Documentation is consistently missing or consistently unhelpful. A majority of the variables either miss documentation or do not provide required details.<br>
2 - Documentation is missing on at least one variable or provides little help to the developer.<br>
3 - Documentation is complete and adequate to use the component but may require further clarifications.<br>
4 - Documentation is complete and provides full details to the application developer using this component. The developer should not require any additional information on how the tests will be used.<br>
<strong>[Overall Weight = 5%]</strong>
      </td>
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
<strong>The implementation code contains detailed documentation. </strong><br>
The reviewer should look at this from a future maintenance developer standpoint. This issue also ensures that there are no useless comments that pollute source code and make it hard to understand. At a minimum, the developer should provide meaningful comments for blocks of code in methods, describing what it is trying to do, the assumptions made and the way it is done.<br>
1 - Documentation is consistently missing or consistently not helpful.<br>
2 - Documentation is missing in at least one important algorithm / code block or consistently provides little help to the developer. Documentation contains useless comments that do not provide any value to the implementation, but only make it harder to read / understand.<br>
3 - Documentation is complete and adequate to understand the implementation, but there may be several places where it can further be enhanced with useful details, or simplified by removing useless comments.<br>
4 - Documentation is clear, complete and concise, helping in clarifying implementation decisions and details.<br>
<strong>[Overall Weight = 5%]</strong>
      </td>
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
<strong>There are no errors and no warnings while generating the Javadoc / XML documentation.</strong><br>
That means the documentation must be perfect from a syntactical point of view. There should be no missing tags, no additional tags, not even for private members or inner classes. Tools such as javadoc, Checkstyle or features of the modern IDEs should be used to check it.<br>
No - The documentation misses documentation tags or generates warnings and errors for different other reasons.<br>
Yes - The documentation is correct and complete.<br>
<strong>[Overall Weight = 2%]</strong>
      </td>
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
<strong>The testing documentation contains no grammatical or spelling errors.</strong><br>
1 - The developer made so many grammatical or spelling errors that one cannot understand what the developer is trying to relate.<br>
2 - The developer made a number of grammatical or spelling errors but the overall knowledge transfer can be made with multiple readings.<br>
3 - The developer made some grammatical or spelling errors but the points were quickly understandable.<br>
4 - The developer was concise and made no grammatical or spelling errors.<br>
<strong>[Overall Weight = 2%]</strong>
      </td>
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
   <tr><td class="title" colspan="4">Test Cases</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Unit Test Cases test all methods and constructors.</strong><br>
The reviewer should verify if for each public method and constructor defined by the in the component interface diagram, the developer provided test methods. The reviewer should focus on the existence of the test methods, instead of focusing on their quality.<br>
1 - Most of the test methods are missing or the existing test methods incorrectly test the functionality of the application.<br>
2 - The submission does not contain test methods for trivial functionality of the component, such as set / get methods or exception constructors. However, this does not appear to be a pattern throughout the unit testing.<br>
3 - There is at least one test method for each public method and constructor.<br>
4 - There are several test methods for each public method and constructor.<br>
<strong>[Overall Weight = 6%]</strong>
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
<strong>Where applicable, Unit Test Cases properly make use of setup and teardown methods to configure the test environment.  </strong><br>
Where applicable, Unit Test cases do not leave temporary files on the file system or rows in a DB after testing is complete.  All required data will be set up using setup methods and removed using teardown methods.<br>
No - Temporary files are left on the file system or database / network connections are not closed after testing is complete.<br>
Yes - Temporary files are removed from the file system after testing is complete and temporary files are created only when needed.<br>
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
   <tr class="dark">
      <td class="value">
<strong>Where necessary, test data is supplied.</strong><br>
1 - Testting data is consistently missing or consistently not helpful.<br>
2 - Testing data is missing on at least one test method or consistently provides little help to the reviewer running the tests.<br>
3 - Testing data is complete and adequate to test the application but may require further configuration.<br>
4 - Testing data is complete and provides full details to the reviewer testing this application. The reviewer should not require any additional information on how the testing of the component will be performed.<br>
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
   <tr class="dark">
      <td class="value">
<strong>The unit test log is well documented.  If a test case fails the log will detail all issues and errors with the test cases.</strong><br>
1 - Information in the log is consistently missing or consistently not helpful.<br>
2 - Information in the log is missing on at least one test method or consistently provides little help to the tester or developer.<br>
3 - Information in the log is complete and adequate to test the application but may require further clarifications.<br>
4 - Information in the log is complete and provides full details to the developer maintaining this application. The developer should not require any additional information on how the testing of the application will be maintained or enhanced.<br>
<strong>[Overall Weight = 4%]</strong>
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
   <tr><td class="title" colspan="4">Test Scenarios</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>The submission conforms and operationally functions as described in the Test Scenarios.</strong><br>
1 - The submitted test cases are missing a some or the majority of the defined test scenarios.<br>
2 - The submitted test cases are covering the defined test scenarios.<br>
3 - The submitted test cases are covering the defined test scenarios and are well documented.<br>
4 - The submission excels in many areas. All scenarios are met and some are exceeded. In order to test the application, only minor items need to be fixed. This submission is clearly above average.<br>
<strong>[Overall Weight = 10%]</strong>
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
   <tr><td class="title" colspan="4">Testing</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>Stress, Accuracy or Failure tests</strong><br>
Stress:  Tests the implementation for concurrency issues, resource leaks etc while under high load.<br>
Benchmark - Tests the implementation according to performance and throughput. Output basic benchmarking to System.out.<br>
Accuracy - Tests the implementation on the accuracy of the results when using the component.<br>
Failure - Tests the implementation's ability to handle bad data and incorrect usage.<br>
Please specify the type of test cases that were authored and executed, the total number of tests and the number of tests that were successful.<br>
<strong>[Overall Weight = 25%]</strong>
      </td>
      <td class="value" rowspan="4">
      Failure:<br>Total Tests
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
   <tr><td class="title" colspan="4">Testing Coverage</td></tr>
   <tr>
      <td class="tableHeader" width="100%">&#160;</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Type<br>Required/<br>Recommended</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Applied<br>1-4</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Score</td>
   </tr>
   <tr class="dark">
      <td class="value">
<strong>A coverage tool will be ran against each submission to ensure each code path is covered.</strong><br>
<strong>[Overall Weight = 25%]</strong>
      </td>
      <td class="value" rowspan="4">
      %Covering code
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

