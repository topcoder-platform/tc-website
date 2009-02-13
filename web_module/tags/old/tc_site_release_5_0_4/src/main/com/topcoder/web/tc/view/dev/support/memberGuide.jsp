<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Member Guide</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">

<jsp:include page="/includes/global_left.jsp">
<jsp:param name="node" value="des_documentation"/>
</jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">

<div class="guide">

<div align="center"><img src="/i/development/tcs_logo.gif" border="0" width="180" height="36" alt="TopCoder Software"><br></div>
<div align="center"><h2>Member Guide</h2></div>

<p>
<span class="bodySubtitle"><a href="#softwareversions">Software Versions</a></span><br>
<span class="bodySubtitle"><a href="#documentation">Documentation</a></span><br>
<span class="bodySubtitle"><a href="#codingstandards">Coding Standards</a></span><br>
<span class="outline1"><a href="#java">Java</a></span><br>
<span class="outline1"><a href="#net">.NET</a></span><br>

<span class="bodySubtitle"><a href="#databasestandards">Database Standards</a></span><br>

<span class="bodySubtitle"><a href="#projdelivs">Component Project Deliverables</a></span><br>
<span class="outline1"><a href="#design">Design</a></span><br>
<span class="outline2"><a href="#desinitsub">Initial Submission Date</a></span><br>
<span class="outline2"><a href="#desfinsub">Final Submission Date</a></span><br>
<span class="outline2"><a href="#desdevsupport">Development Support</a></span><br>
<span class="outline2"><a href="#despost">Post Development Review</a></span><br>
<span class="outline1"><a href="#development">Development</a></span><br>
<span class="outline2"><a href="#devinitsub">Initial Submission Date</a></span><br>
<span class="outline2"><a href="#devfinsub">Final Submission Date</a></span><br>
<span class="outline2"><a href="#devpost">Post Development Review</a></span><br>

<span class="bodySubtitle"><a href="#testframework">TopCoder Test Framework</a></span><br> 
<span class="outline1"><a href="#testtypes">Test Types</a></span><br>
<span class="outline2"><a href="#unit">Unit</a></span><br>
<span class="outline2"><a href="#accuracy">Accuracy</a></span><br>
<span class="outline2"><a href="#failure">Failure</a></span><br>
<span class="outline2"><a href="#stress">Stress</a></span><br>

<span class="outline1"><a href="#notes">Notes</a></span><br>
<span class="outline2"><a href="#config">Configuration</a></span>
</p>


<A name="softwareversions"></A>
<h3>Software Versions</h3>
<p>
These are the current software versions used in the design, development and testing of TopCoder Software applications and components.
<ul>
<li>ANT version: 1.6.2</li>
<li>NANT version: 0.84</li>
<li>Poseidon version: 3.1</li>
<li>JUnit version: 3.8.1</li>
<li>NUnit version: 2.1</li>
</ul>
</p>

<A name="documentation"></A>
<h3>Documentation</h3>
<p>
Design Documents
<ul>
<li>Poseidon diagrams must clearly define intended component usage in the 'Documentation' tab of the class diagrams.</li>
<li>All 'Documentation' tabs for methods must detail both valid and invalid argument inputs.  This information will be used to facilitate Unit tests, Accuracy tests and Failure tests.</li>
<li>All component documents should begin with the component name. <br>(i.e. Configuration_Manager_Requirements_Specification.doc)</li>
<li>Document names should contain the document type. <br>(i.e. Configuration_Manager_Component_Specification.doc)<br>
Existing document types:
   <ul>
   <li>Component_Specification</li>
   <li>Class_Diagram</li>
   <li>Use_Case_Diagram</li>
   <li>Sequence_Diagram</li>
   </ul></li>
<li>For multiple documents of the same type, use the naming convention described above with a differentiator for each file. <br>
(i.e. Configuration_Manager_Sequence_Diagram_1 OR <br>Configuration_Manager_Sequence_Diagram-Add_Namespace)</li>
</ul>
</p>
<p>
<span class=bodySubtitle>Implementation Source Code</span><br>
<ul>
<li>Implementations of the design must clearly translate the design documentation into the corresponding language format (i.e. java -> javadoc, .NET -> XML).</li>
<li>Source code documentation must be sufficient to enable component usage without additional documentation.</li>
</ul>
</p>

<a name="codingstandards"></a>
<h3>Coding Standards</h3>
<p>
<a name="java"></a>
<span class=bodySubtitle>Java</span>
<ul>
<li>Line length should not exceed 120 characters.</li>
<li>All code must adhere to javadoc standards, and, at minimum, include the @author, @param, @return, @throws and @version tags.  
   <ul>
   <li>When populating the author tag, please use TCSDEVELOPER for your initial submission, for final fixes use your TopCoder Handle.  Do not include any personal information such as email address.</li>
   <li>Copyright tag: Copyright &#169; 2006, TopCoder, Inc. All rights reserved</li>
   </ul></li>
<li>For standardization purposes, code must use 4-space (not tab) indentation.</li>
<li>Do not use the ConfigurationManager inside of EJB's.  The usage of the java.io.* package to read/write configuration files can potentially conflict with a restrictive security scheme inside the EJB container.</li>
<li>Except where overridden above, all code must adhere to the Code Conventions outlined in the following: <a href="http://java.sun.com/docs/codeconv/html/CodeConvTOC.doc.html">http://java.sun.com/docs/codeconv/html/CodeConvTOC.doc.html</a></li>
</ul>
</p>
<p>

<a name="net"></a>
<span class=bodySubtitle>.NET</span>
<ul>
<li>Line length should not exceed 120 characters.</li>
<li>All code must adhere to the C# documentation compiler tags <br>
(<a href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/csref/html/vclrftagsfordocumentationcomments.asp">http://msdn.microsoft.com/library/default.asp?url=/library/en-us/csref/html/vclrftagsfordocumentationcomments.asp</a>), and, at minimum, include the following tags; &lt;param&gt;, &lt;summary&gt;, &lt;returns&gt;, and the &lt;value&gt; tag where necessary.</li>
   <ul>
   <li>When populating the author tag, please use your TopCoder Handle.  Do not include any personal information such as email address.
   <li>Copyright tag: Copyright &#169; 2006, TopCoder, Inc. All rights reserved
   </ul></li>
<li>For standardization purposes, code must use 4-space (not tab) indentation.</li>
<li>Except where overridden above, all code must adhere to the Code Conventions outlined in the following: <a href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vsent7/html/vxconcodingtechniques.asp">http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vsent7/html/vxconcodingtechniques.asp</a></li>
</ul>
</p>

<a name="databasestandards"></a>
<h3>Database Standards</h3>
<p>
<ul>
<li>Table and column names should be as follows: table_name, not tableName.</li>
<li>Every table must have a Primary Key.</li>
<li>Always use Long (or database equivalent) for the Primary Key.<br>
For maximum portability, database objects (table names, indexes, etc) should be kept to 18 characters or less.  Informix and DB2 have an 18-character limit.</li>
</ul>
</p>
<a name="projdelivs"></a>
<h3>Component Project Deliverables</h3>
<p>
<a name="design"></a>
<span class=bodySubtitle>Design</span><br>

<a name="desinitsub"></a>
<i>Initial Submission Date</i><br>
Architects must submit a completed design by the initial submission date; any designs submitted after will not be reviewed. The following items are required as part of the component design: 
<br><br>

<i>Software Architecture Documents</i>
<ul>
<li>Class Diagrams*
    <ul>
    <li>Class definitions must include detail for the following:
        <ul>
        <li>Package</li>
        <li>Scope</li>
        <li>Inheritance</li>
        <li>Interfaces</li>
        <li>Constructors</li>
        <li>Modifiers</li>
        <li>Use the 'Documentation' tab in Poseidon to provide a description of class usage.  This documentation may include a simple example.**</li>
        </ul>
    </li>
    <li>Variables definition must include:
        <ul>
        <li>Scope</li>
        <li>Type</li>
        <li>Modifiers</li>
        <li>Use the 'Documentation' tab in Poseidon to provide a description of the variable and its initial value.  Any public variables must be defined.  It is at the discretion of the designer to detail private variables.  However, some designs may require the definition of private variables if they are critical to the component implementation and requirements.**</li>
        </ul>
    </li>
    <li>Method definition must include:
        <ul>
        <li>Scope</li>
        <li>Return Type</li>
        <li>Argument type and order</li>
        <li>Exceptions</li>
        <li>Modifiers</li>
        <li>Use the 'Documentation' tab in Poseidon to provide:
            <ul>
            <li>Method description</li>
            <li>Detail arguments, exceptions and return types</li>
            <li>Detail error and invalid argument handling.**</li>
            <li>List the range of valid and invalid inputs for testing.</li>
            </ul>
         </li>
         </ul>
    </li>
    <li>Associations between classes are well defined.</li>
    </ul>
</li>
<li>Use-Case Diagrams*
    <ul>
    <li>Use Case diagrams must contain one or more Use Cases to outline the functional usage of the component as outlined in the Requirements Specification.</li>
    <li>NOTE: A Use Case is represented as a "bubble" in the Use Case diagram.  Similar functionality, such as administrative methods, can be aggregated into a single Use Case.</li>
    </ul>
</li>
<li>Sequence Diagrams*
    <ul>
    <li>Sequence Diagrams must demonstrate the implementation of each Use Case.
    <li>One or more Sequence Diagrams must exist for each Use Case.
    <li>Provide descriptive names for each sequence diagram. Names should also correlate the Sequence Diagram to the corresponding Use Case Diagram.  <br>For example: "Sequence_Diagram-Create_User", "Sequence_Diagram-Delete User".
    <li>Sequence Diagram names should also appear in a text box in the top left corner of the sequence diagram.
    </ul>
</li>
<li>Component Specification Document
    <ul>
    <li>Outlines additional details required to develop a solution.  This document will follow TopCoder Software's Component Specification Template.</li>
    </ul>
</li>
</ul>

Note: The thoroughness of the required diagrams and documents weighs heavily in the review process.
<br><br>
* All diagrams must be created using Poseidon Community Edition. A free download of Poseidon can be found at: <a href="http://www.gentleware.com/products">http://www.gentleware.com/products</a>.
<br><br>
</p>

<p>
<i>Design Submission</i>
<ul>
<li>Design submissions must be uploaded to the Online Review application (<a href="http://software.topcoder.com/review">http://software.topcoder.com/review</a>) by the specified deadline as specified on the project-posting page on <a href="http://www.topcoder.com">www.topcoder.com</a>.</li>
<li>Java Submissions
    <ul>
    <li>Execute 'ant design_submission' to package the required elements of your solution.</li>
    <li>The internal structure of the jar should be as follows:
        <ul>
        <li>/build.xml
        <li>/docs
        <li>/src/java/main/com/topcoder....
        <li>/src/java/tests/com/topcoder....
        <li>/log
        <li>/test_files
        </ul>
    </li>
    </ul>
</li>
<li>C# Submissions
    <ul>
    <li>Execute 'nant design_submission' to package the required elements of your solution.</li>
    <li>The internal structure of the jar should be as follows:
        <ul>
        <li>/docs
        <li>/src/csharp/main/com/topcoder....
        <li>/src/csharp/tests/com/topcoder....
        <li>/log
        <li>/test_files
        </ul>
     </li>
     </ul>
</ul>     
</p>
<p>
<a name="desfinsub"></a>
<i>Final Submission Date</i><br><br>
The Final Submission Date serves to provide time for the winning architect to apply design recommendations made by the design review board.  This phase will not always be required and is at the discretion of TopCoder Software and the Design Review Board.  Specific deliverables will be defined when the winning design is announced.
<br><br>
Failing to meet these deliverables by the set deliverable date will result in disqualification.  At this time, the designer with the next highest score will be deemed as the winner.
<br><br>

<a name="desdevsupport"></a>
<i>Development Support</i><br><br>
<b>Winning Designers cannot submit development solutions for their component design during the development phase.</b>
<br><br>
The winning designer must provide design support during the development project.  Interaction with developers must occur within the TopCoder Software forums.  This is necessary to ensure that all developers receive the same information from the designer.  In addition, it maintains a log of all discussions in case of future discrepancies.
<br><br>
At the end of the development phase, the designer must submit any updated design documents to the Product Manager.  Only changes that are accepted by the architect review board or that are clarifications of the existing design may be included.  Changes that modify the design or enhance the functionality without approval from the architect board cannot be incorporated into the design.
<br><br>	
<a name="despost"></a>
<i>Post Development Review</i><br><br>
After the component has completed the development process, the designer and developer will be notified that the component is available for download on the software.topcoder.com website.  It is the responsibility of both the designer and developer to ensure that the distribution package contains the correct design documents and source code, and that all documents are synchronized.  In addition, designers should validate that the documents available for download are the most recent versions of the design.
<br><br>
This phase is an opportunity for members to validate the quality of their component.  Once complete, the handles of all members who worked on this component will be displayed on the site.
</p>
<br>
<p>

<A name="development"></a>
<span class=bodySubtitle>Development</span><br>

<a name="devinitsub"></a>
<i>Initial Submission Date</i><br>
Developers must submit a solution for the posted component design by the initial submission date; any solutions submitted after will not be reviewed.  The following items are required as part of the component solution: 
<br><br>
<i>Completed Solution</i>
<ul>
<li>A working solution that meets the required functionality, uses the required technologies and adheres to the component design.
    <ul>
    <li>All source code (component code AND test case code) must adhere to the TopCoder Software <a href="#codingstandards">Coding Standards</a>.</li>
    <li>The solution must implement the design that was distributed for this component.  Any deviations from items that are clearly defined in the design will result in loss of points during the review phase.  To request a modification to a design, please post your comments in the corresponding component Developer Forum.  If the change is applied, the updated documents will be posted to the forum.</li>
    </ul>
</li>
</ul>

<i>Test Cases</i>
<ul>
<li>Test Case Framework
    <ul>
    <li>Java components: J-Unit</li>
    <li>.NET components: N-Unit</li>
    </ul>
</li>
<li>Unit test cases written in the corresponding framework must exist to thoroughly test the implementation.  This includes, but is not limited:
    <ul>
    <li>Checking methods for handling of valid and invalid arguments.
    <li>Testing constructors for accessibility.
    <li>Testing expected output.</li>
    </ul>
</li>
<li>Unit tests cases are to be placed in the package test directory.</li>
<li>Java Components: /src/java/tests/PACKAGENAME/UnitTests.java must be modified to call the individual tests written by the developer.</li>
<li>DO NOT modify or add tests to any other test directories.  These directories will not be packaged with your submission.</li>
<li>Each test case should use setup() and teardown() methods to properly configure the environment for testing.  Any files or folders created by test cases must be removed after the tests have executed.</li>
<li>Additional files or folders required for testing must be placed in the /test_files directory.</li>
    <ul>
    <li>All source code must follow the TopCoder Software <a href="#codingstandards">Coding Standards</a>.  At minimum, a brief overview of each test must be included.  This should include what the test is intended to validate.</li>
    </ul>
</li>
<li>Test cases must compile using the build script (Java: 'ant compile_tests', .NET: 'nant compile_tests') distributed by the Product Manager.</li>
</ul>

<i>Component Specification</i>
<ul>
<li>Complete the Component Specification packaged with the development distribution.</li>
<li>Alter the "Environment Requirements", "Installation and Configuration", "Usage Notes" and "Build Modifications" to comply with the component implementation.  These instructions should provide sufficient information for the component to be installed and used in a "clean" environment.</li>
<li>For components that require additional development, detail how that development needs to occur.  An example is defining the proper way to implement interfaces and configure pluggable classes.	</li>
</ul>

<i>Development Submission</i>
<ul>
<li>Development submissions must be uploaded to the Online Review application (<a href="http://software.topcoder.com/review">http://software.topcoder.com/review</a>) by the specified deadline as specified on the project-posting page on <a href="http://www.topcoder.com">www.topcoder.com</a>.</li>
<li>Execute the 'test' target ('ant test' or 'nant test') to execute test cases and generate the log file in /log.  This directory will be packaged with your submission and must contain the log file.</li>
<li>Execute the 'dev_submission' target ('ant dev_submission' or 'nant dev_submission') to package the required elements of your solution.</li>
<li>The internal structure of the jar should be as follows:
    <ul>
    <li>/build.xml
    <li>/docs
    <li>/src/java/main/com/topcoder....
    <li>/src/java/tests/com/topcoder....
    <li>/log
    <li>/test_files
    </ul>
</li>
<li>Notes:
    <ul>
    <li>It is not necessary to submit any compiled code.  Once the solution is received, the "test" target will be executed against the solution.  If a solution does not compile, and the developer did not include any special instructions the solution will fail the screening phase.</li>
    </ul>
</li>
</ul>
<a name="devfinsub"></a>
<i>Final Submission Date</i><br>
The Final Submission Date serves to provide time for the winning developer to modify their implementation to pass review board test cases and to incorporate suggestions made by the review board.  This phase will not always be required and is at the discretion of TopCoder Software and the Development Review Board.
<br><br>
Failure to meet these deliverables OR failure to modify the component to pass the required test cases by the Final Submission Date will result in disqualification.  At this time, the developer with the next highest score that exceeds the minimum allowable score will be deemed winner.
<br><br>

<a name="devpost"></a>
<i>Post Development Review</i><br>
After the component has completed the development process, the designer and developer will be notified that the component is available for download on the software.topcoder.com website.  It is the responsibility of both the designer and developer to ensure that the distribution package contains the correct design documents and source code, and that all documents are synchronized.  In addition, designers should validate that the documents available for download are the most recent versions of the design.
<br><br>
This phase is an opportunity for members to validate the quality of their component.  Once complete, the handles of all members who worked on this component will be displayed on the site.
</p>

<a name="testframework"></a>
<h3>TopCoder Test Framework</h3>
<p>
<a name="testtypes"></a>
<span class=bodySubtitle>Test Types</span><br>

<a name="unit"></a>
<i>Unit</i><br>
Unit tests validate that the component works properly at the method level.  Unit tests evaluate every public method in the component to ensure that valid and invalid inputs are handled properly AND as defined in the documentation.
<br><br>
In addition, Unit tests MUST include an implementation of the "demo" as provided in the Component Specification.  This will validate that the component operates as intended by the designer.
<br><br>
<a name="accuracy"></a>
<i>Accuracy</i><br>
Accuracy tests validate that given correct input, the component operates as expected. *
<br><br>
<a name="failure"></a>
<i>Failure</i><br>
Failure tests ensure incorrect component usage is handled properly. *
<br><br>
<a name="stress"></a>
<i>Stress</i><br>
Stress tests serve two purposes:
<ol>
<li>Execute high volume, multi-threaded usage against the component.</li>
<li>Obtain a set of performance metrics for the component implementation.  (i.e. 500 users, 50 requests/user, average response time: 50ms)</li>
</ol>

*Failure and Accuracy tests do NOT need to test every argument permutation for each public method in the component.  These tests should use the component in end-to-end usage and at minimum must implement the scenarios defined in the sequence diagrams.
<br><br>
<a name="notes"></a>
<span class=bodySubtitle>Notes</span><br>
<a name="config"></a>
<i>Configuration</i><br>
Testing components may require connections to databases, telnet servers, ftp servers, etc.  Any configuration parameters must be configurable.  The best way to achieve this is to set configuration parameters in the build file using the <tt>jvmarg parameter</tt> and retrieving that value through the <tt>System.getProperty</tt> method.<br>
<br>
Build.xml:
<pre class="body"> 
   &lt;jvmarg value="-Djditestport=${jdi_port}"/&gt;
</pre>

Test Case Source Code:
<pre class="body"> 
private String getPort() {
    String port = System.getProperty("jditestport");
    if (port == null) {
        port = "8000";
    }
    return port;
}
</pre>



<br><br>
</p>
</div>
            <br/>
            <br/>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
