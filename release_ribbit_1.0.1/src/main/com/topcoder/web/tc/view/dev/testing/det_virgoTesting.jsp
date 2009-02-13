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

<p><span class="bigTitle">Virgo Testing Competition</span></p>
<div class="sectionHeader">Overview</div>

<p><span class="bodySubtitle">Application Overview</span><br>
The application consists of a set of command-line tools for the processing of custom data sets. Each tool performs a specific role in the process; they can be called individually or in sequence to run the process entirely.
</p>

<p><span class="bodySubtitle">Competition Overview</span><br>
An inventory of test scenarios and detailed test cases are provided to ensure that the application meets all of the defined requirements.  This goal of this competition is to generate the test code for all automatable tests in the inventory.  The tests built by this competition will be used to validate the assembled application for QA and Deployment.
</p>

<p>The main tasks will involve:</p>
<ul>
    <li>Writing NUnit test code</li>
    <li>Creating NAnt tasks to compile and run the test cases</li>
    <li>Providing directions for configuration and running of test cases</li>
</ul>

<div align="right"><A href="/tc?module=Static&d1=features&d2=071006"><img src="/i/development/testing/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
<p><em>Application Technologies</em></p>
<ul>
<li>.NET 2.0</li>
</ul>

<p><em>Testing Technologies</em></p>
<ul>
<li>NUNIT</li>
</ul>

<%--
<p>** Any additional testing frameworks or jars must be approved before being used.</p>
--%>

<div class="sectionHeader">Documentation</div>
    
<p>Documentation and Application that will be provided to Registered Constants:</p>

<ul>
<li><em>Test Case Scenario Inventory</em></li>
<li><em>Test input and output files</em></li>
</ul>


<div class="sectionHeader">Submission Deliverables</div>

<p>
The list below defines the deliverables for the competition:
</p>

<ul>
<li>Test cases source code</li>
<li>Configuration files and resource bundles for test cases</li>
<li>NAnt tasks to compile and run tests</li>
<li>Any instructions required to configure / run tests</li>
<li>README document describing package, tests, and instructions for executing compile and test build files</li>
</ul>

<p>
All submissions should be submitted in a zip file named:
</p>
<pre>
[Member Handle]_VirgoTesting_[root directory name].zip
</pre>
<p>
To ensure the test code and the configuration files can be easily associated to the inventory of test case scenarios, tests should adhere to the following naming conventions:
</p>
<pre>
<strong>Methods:</strong>
      Test&lt;Test Case ID&gt; - The "Test Case ID" refers to the "Number" column 
        in the Test Case Scenario Inventory.  |
      Example: Test15()</pre>
<p>
NOTE: Test case scenarios should be broken into a series of tests with a single assertion per method whenever possible. When single assertion test methods are achievable, the method naming convention must be extended to include additional detail pertaining to that specific test.
</p>
<pre>
      Example: Test15_ValidateMapOutput()

<strong>Configuration/Resources:</strong>
       &lt;Module&gt;_&lt;Test Case ID&gt;_&lt;Property&gt;
       Example: DOWNLOAD_15_COMMAND
               DOWNLOAD_25_MAPOUTFILE</pre>

<div class="sectionHeader">Competition Deliverable Tasks</div>
<div align="center">
<table cellpadding="4" cellspacing="0" class="stat" width="100%"> 
    <tbody> 
        <tr> 
            <th>Test Type</th> 
            <th>Description</th> 
            <th>Test Case Scenario IDs</th>
        </tr> 
        <tr class="light"> 
            <td valign="top">1</td> 
            <td valign="top">Application usage with bad parameters<br /> – testing output for error message and correct usage.</td> 
            <td valign="top">1,2,3,16,21,22,23,24,32,33,34,35,36,37,38,39,47,48,<br />49,51,71,72,73,74,78,79,80,81,85,86,87,88</td>
        </tr> 
        <tr class="dark"> 
            <td valign="top">2</td> 
            <td valign="top">Application usage with good parameters – no output.</td> 
            <td valign="top">4</td>
        </tr> 
        <tr class="light"> 
            <td valign="top">3</td> 
            <td valign="top">Application usage – verifying outputted<br /> file(s) equals supplied test file(s).</td> 
            <td valign="top">40,41,42,43,50,52,53,54,55,56,57,58,59,60,61,62,63,<br />64,65,66,67,68,69,70</td>
        </tr> 
        <tr class="dark"> 
            <td valign="top">4</td> 
            <td valign="top">Application usage – verifying database<br /> contains map &amp; testing outputted file(s)<br /> with supplied test file(s).</td> 
            <td valign="top">5,6,7,8,9,10,11,12, 13,14,15, 20, 25,26,28,29,30,31</td>
        </tr> 
        <tr class="light"> 
            <td valign="top">5</td> 
            <td valign="top">Verify messages written to stderr or log files</td> 
            <td valign="top">17,18,19,44,45,46,75,76,77,82,83,84</td>
        </tr> 
        <tr class="dark"> 
            <td valign="top">6</td> 
            <td valign="top">Verify outputted file does not contain specific strings.</td> 
            <td valign="top">27</td>
        </tr> 
        <tr class="light"> 
            <td valign="top">7</td> 
            <td valign="top">Integration tests – combination of other different types</td> 
            <td valign="top">Integration 1 – Integration 7</td>
        </tr> 
    </tbody> 
</table>
</div>
<div>&nbsp;</div>

<div class="sectionHeader">Payment</div>
<p>TopCoder will compensate the first and second place submissions. The payment for the winning competitors will be distributed when the winning solutions are submitted after the review phase is completed and the winners are selected.</p>
<p><strong>Winning Test Solution</strong><br />Total Payment - $1,000</p>
<p><strong>Second Place Test Solution</strong><br />Total Payment - $500</p>
<p><strong>Bonus Payment</strong><br />
This testing competition will contain a milestone halfway through the Submission period.  After each milestone, the TopCoder team will review to verify the milestones are met. Teams who complete these milestones will be eligible for a bonus.</p>
<ul>
    <li><strong>The team with the winning submission will receive a $250 bonus for meeting the milestone.</strong></li>
    <li><strong>The team with the second place submission will receive a $125 bonus for meeting the milestone.</strong></li>
</ul>
<p><strong>Milestone</strong></p>
<p><strong>Preparing Milestone</strong><br />
The milestone will be due by 9AM EST the day of the due date.  Each member is expected to email the milestones to project manager (<a href="mailto:aabbott@topcoder.com">aabbott@topcoder.com</a>).</p>
<div align="center">
<table cellpadding="4" cellspacing="0" class="stat" width="100%"> 
    <tbody> 
        <tr> 
            <th colspan="2">Milestone Description</th> 
        </tr> 
        <tr class="light"> 
            <td valign="top"><strong>Description</strong></td> 
            <td valign="top">Create a least one test case for each type of test defined in 1.5.  <br />Test code should include all configuration file and resource bundle entries for each implemented test.<br /><br />
            The milestone must contain a NAnt build file for compiling and executing these tests.</td> 
        </tr> 
        <tr class="dark"> 
            <td valign="top"><strong>Due Date</strong></td> 
            <td valign="top">12.20.2007</td> 
        </tr> 
        <tr class="light"> 
            <td valign="top"><strong>Schedule Response</strong></td> 
            <td valign="top">12.22.2007</td> 
        </tr>
    </tbody> 
</table>
</div>
<div>&nbsp;</div>
<p><strong>Milestone Review Testing Procedures</strong><br />
The milestone tests will be executed against the test executables defined in section 1.11.</p>
<ul>
    <li>The milestone source code zip file will be exploded and set up on the Test Server</li>
    <li>The submission src/csharp/test/[application section] directory will be copied to the test directory</li>
    <li>The NAnt compile task will be called to build the test assemblies.</li>
    <li>The NAnt test command will be called to execute the tests.</li>
</ul>
<p><strong>Milestone Scoring Criteria</strong></p>
<ul>
    <li><strong>Delivery Screening</strong><br />Verify the following deliverables are included in the milestone.</li>
        <ul>
            <li><strong>Source code</strong> – Source code for at least one test case from each of the seven test types.</li>
            <li><strong>Build scripts</strong> to compile and execute tests.</li>
        </ul>
    <li><strong>Successful Execution of Application Build</strong><br />The submission will be scored on easily the reviewer is able to execute the build scripts to compile and build the application.</li>
    <li><strong>Successful Execution of Test Cases</strong><br />The submission will be scored on the successful execution of the test cases defined for this milestone.</li>
    <li><strong>Thoroughness of test cases to application requirements</strong><br />If the submission includes additional test cases, this will evaluate how well the test cases meet the edge cases for the application.</li>
    <li><strong>Quality of test case code</strong><br />The submission will evaluate the quality of the code. This will include the documentation of the code.</li>
</ul>

<div class="sectionHeader">Eligibility</div>
<p>You must be a TopCoder member, at least 18 years of age, meeting all of the membership requirements. In addition, you must fit into one of the following categories.</p>
<p>If you reside in the United States, you must be either:</p>
    <ul>
        <li>A US Citizen</li>
        <li>A Lawful Permanent Resident of the US
        <li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S.</li>
    </ul>
<p>If you do not reside in the United States:</p>
    <ul>
        <li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will not need to do anything to become authorized)</li>
    </ul>
<p><span class="bigRed">Your ability to participate in this competition is contingent on the agreement to the Testing Terms of Work and signing of a Non Disclosure Agreement. Once you have registered this information will be emailed to you and should be returned within 24 hours. If you have previously completed these documents, no further action is needed.</span></p>

<div class="sectionHeader">Timeline</div>
<p>All submissions are required to be submitted by the end of Competition Phase. The end of each phase is at 9:00 AM EDT.</p>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="80%" class="stat">
    <tbody> 
        <tr> 
            <th>Phase</th> 
            <th>Start</th> 
            <th>End</th> 
            <th>Days</th> 
        </tr> 
        <tr class="light"> 
            <td>Registration Phase</td> 
            <td align="center">12.14.2007</td> 
            <td align="center">12.18.2007</td> 
            <td align="center">4</td> 
        </tr> 
        <tr class="dark"> 
            <td>Test Submission</td> 
            <td align="center">12.16.2007</td> 
            <td align="center">12.24.2007</td> 
            <td align="center">8</td> 
        </tr> 
        <tr class="light"> 
            <td>Test Case Screening</td> 
            <td align="center">12.25.2007</td> 
            <td align="center">12.26.2007</td> 
            <td align="center">1</td> 
        </tr> 
        <tr class="dark"> 
            <td>Winner Selection</td> 
            <td align="center">&nbsp;</td> 
            <td align="center">12.31.2007</td> 
            <td align="center">&nbsp;</td> 
        </tr> 
    </tbody> 
</table>
</div>
<div>&nbsp;</div>

<div class="sectionHeader">Submission Technical Details</div>
<p><strong>Submission Naming Standards</strong></p>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="80%" class="stat">
    <tbody> 
        <tr> 
            <th><strong>Test File Package</strong></th> 
            <th><strong>Virgo.Testing</strong></th> 
        </tr> 
        <tr class="light"> 
            <td valign="top"><strong>Primary Test File Name</strong></td> 
            <td valign="top">Virgo.TestingMain</td> 
        </tr> 
        <tr class="dark"> 
            <td valign="top"><strong>Application Section</strong></td> 
            <td valign="top">Separate application section for each of the four tools and one for the Integration tests.<br />
            Test1 – Test Scenarios 2.1.x<br />
            Test2 – Test Scenarios 2.2.x<br />
            Test3 – Test Scenarios 2.3.x<br />
            Test4 – Test Scenarios 2.4.x<br />
            Integration – Integration tests (Integration Worksheet)</td>
        </tr> 
    </tbody> 
</table>
</div>

<p><strong>Submission Directory Format</strong></p>
<p>The submission should be implemented in the following directory structure:</p>
<pre>
[Member Handle]_VirgoTesting_[application section]
    Application
        Src
            CSharp
                Test
                    application section  - [test files in appropriate 
                     package structure]
                Docs
                    Tests - Any necessary documentation
                Test_files
                    Conf
                        Contains configuration for tests
                    files
                        Contains the file used in testing
</pre>

<p><strong>NAnt Task</strong><br />
Each submission should implement two nant tasks. These nant tasks will be executed in the build.xml  file that is include in the zip file of the application source code.  Below are templates for these tasks.
</p>

<p><strong>Compile &amp; Build NAnt Task</strong><br />
Below is an example NAnt build file that compiles and executes the Tests for one of the five applications.  A build file should be created for building and compiling each of the applications; additionally, a build file should be created which calls each of the five build files, allowing the compilation and execution of all tests.
</p>
<pre>
&lt;?xml version="1.0"?&gt;

&lt;project name="Test1Test" default="build" basedir="."&gt;

  &lt;property name="basename" value="Test1Test"/&gt;
    &lt;property name="debug" value="true"/&gt;
    &lt;property name="build.dir" value="build"/&gt;

    &lt;target name="build" verbose="true"&gt;

    &lt;mkdir dir="${build.dir}"/&gt;
    &lt;delete file="${build.dir}\${basename}.dll" failonerror="false"/&gt;
    
       &lt;copy file="C:\Program Files\NUnit V2.0\bin\nunit.framework.dll" 
          tofile="${build.dir}\nunit.framework.dll"/&gt;
              &lt;csc target="library" output="${build.dir}\${basename}.dll" verbose="true" 
                     debug="true" optionexplicit="true" rootnamespace="true"&gt;

                     &lt;resources&gt;
                           &lt;includes name="**/*.resx" /&gt;
                     &lt;/resources&gt;
                     &lt;sources basedir="."&gt;
                           &lt;includes name="*.cs"/&gt;
                     &lt;/sources&gt;

                     &lt;arg value="/reference:System.dll"/&gt;
                     &lt;arg value="/imports:NUnit.Framework"/&gt;
                     &lt;arg value="/reference:${build.dir}\nunit.framework.dll"/&gt;
              &lt;/csc&gt;
    &lt;/target&gt;

&lt;/project&gt;
</pre>

<div class="sectionHeader">How the submission Test Cases will be executed during review</div>

<p>
After the submission phase is complete, all submission will be tested against test assemblies, as the assemblies will not have been completed.  Test executables will be provided which will simulate the behavior of the different types of tests.   Because all files and strings used in the testing code will be stored externally, these test executables will execute the test code and demonstrate that all tests are validated.
</p>

<p>Below is the process that will be followed for each test</p>
<ul>
<li>The milestone source code zip file will be exploded and set up on the Test Server</li>
<li>The submission src/csharp/test/[application section] directory will be copied to the application directory of the application</li>
<li>The NAnt compile task will be called to build the test assemblies.</li>
<li>The NAnt test command will be called to execute the tests.</li>
</ul>

<div class="sectionHeader">How the submission Test Cases will be evaluated during review</div>
<ul>
    <li><strong>Delivery Screening</strong><br />Verify the following deliverables are included in the milestone.</li>
        <ul>
            <li><strong>Source code</strong> – Source code for at least one test case from each of the seven test types.</li>
            <li><strong>Build scripts</strong> to compile and execute tests.</li>
        </ul>
    <li><strong>Successful Execution of Application Build</strong><br />The submission will be scored on easily the reviewer is able to execute the build scripts to create and deploy the application</li>
    <li><strong>Successful Execution of Test Cases</strong><br />The submission will be scored on the successful execution of the test cases defined for this milestone.</li>
    <li><strong>Completeness of test case implementations</strong><br />The review will evaluate whether the minimum number of test cases where implemented</li>
    <li><strong>Accuracy of test case implementations</strong><br />The review will evaluate whether the test cases where implemented to correctly test the requirements of the application</li>
    <li><strong>Thoroughness of test cases to application requirements</strong><br />If the submission includes additional test cases, this will evaluate how well the test cases meet the edge cases for the application</li>
    <li><strong>Quality of test case code</strong><br />The submission will evaluate the quality of the code. This will include the documentation of the code.</li>
</ul>
<br /><br />

<div class="sectionHeader">Registration</div>
<%--<p>Registration is closed.</p>--%>
  
<p>Members interested in registering for this competition should email to <A href="mailto:mailto:TestingSubmissions@topcoder.com?subject=Register:%20Virgo%20%20Testing%20Competition">TestingSubmissions@topcoder.com</A>.  In the email, include the following information:</p>
<ul>
<li>Handle</li>
<li>First &amp; Last Name</li>
</ul>
<p>
TopCoder staff will respond as to whether you are registered or not.
</p>

<div class="sectionHeader">Submission</div>
<p>Once you have test code you are ready to submit, you can do so by emailing your source code to <A href="mailto:TestingSubmissions@topcoder.com?subject=Submit:%20Virgo%20%20Testing%20Competition">TestingSubmissions@topcoder.com</A> by the submission deadline.  Once a submission is received, it will be screened.  All code that passes screening will be made available to the Assembly Competition teams.</p>

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

