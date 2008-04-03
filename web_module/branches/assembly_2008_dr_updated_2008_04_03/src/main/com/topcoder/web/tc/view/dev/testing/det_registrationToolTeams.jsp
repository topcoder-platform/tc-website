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

<p><span class="bigTitle">Registration Tool - Teams</span></p>
<div class="sectionHeader">Overview</div>

<p><span class="bodySubtitle">Application Overview</span><br>
The Registration Tool allows users to view, register, and select positions for various competition types at TopCoder, including team competitions, individual competitions, coaching positions, and reviewers.  The tool furthermore tracks a member's status with respect to Non-Disclosure Agreements (NDA), terms of work, and other such documents.  The application will initially be used as the registration interface for the assembly competitions, and will later be expanded to other competitions.
</p>

<p><span class="bodySubtitle">Competition Overview</span><br>
To simplify the competition, the testing project was split into two parts. This part will focus only in the use cases related to team management. A minimum set of test scenarios will be provided.<br />It is <strong>required</strong> to create additional tests on top of those. The first version of the application is already assembled and ready to be tested. The main tasks will involve:
</p>

<ul>
    <li>Writing JSP test code</li>
    <li>Creating Ant tasks to compile and run the test cases</li>
    <li>Providing directions for configuration and running of test cases</li>
</ul>

<div align="right"><A href="/tc?module=Static&d1=features&d2=071006"><img src="/i/development/testing/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<div class="sectionHeader">Technologies</div>
<p><em>Application Technologies</em></p>
<ul>
<li>Java 5.0 update 12</li>
<li>Redhat Linux</li>
<li>JBoss 4.0.2</li>
<li>Struts 1.3.8</li>
<li>Informix 10.0</li>
<li>JSP 2.0</li>
<li>EJB 2.0</li>
</ul>

<p><em>Testing Technologies</em></p>
<ul>
<li>Java 1.5</li>
<li>Ant 1.6.2</li>
<li>JUnit 3.8</li>
<li>HTTP Unit 1.6.2</li>
<li>HTML Unit 1.11</li>
<li>Cactus 1.7.2</li>
</ul>

<p>** Any additional testing frameworks or jars must be approved before being used.</p>

<div class="sectionHeader">Documentation</div>
    
<p>Documentation and Application resources that will be provided to registered members.</p>

<ul>
<li><em>Requirements Documentation</em></li>
<li><em>Use Case Documentation</em></li>
<li><em>Activity Diagrams</em></li>
<li><em>Base Test Scenarios</em></li>
<li><em>Database Schema</em></li>
<li><em>Application Source Code</em></li>
<li><em>Ant Script to build and deploy application</em></li>
<li><em>Sample Data</em></li>
</ul>


<div class="sectionHeader">Submission Deliverables</div>

<p>
The list below defines the deliverables for the competition:
</p>

<ul>
<li>Test cases source code</li>
<li>Output of execution of code</li>
<li>Definition of any additional tests created</li>
<li>Any instructions required to configure / run tests</li>
</ul>

<p>
All submissions should be submitted in a zip file named:
</p>
<pre>
[Member Handle]_registration_tool_testing_1_[root directory name].zip
</pre>
<p>
The file structure for the submissions should follow the guidelines described in the Submission Format Directory Format section.
</p>

<div class="sectionHeader">Competition Deliverable Tasks</div>
<div align="center">
<table cellpadding="4" cellspacing="0"> 
    <tbody> 
        <tr> 
            <td>Functionality</td> 
            <td nowrap="nowrap">Use Cases</td> 
            <td nowrap="nowrap">Test Cases</td> 
            <td>Description</td> 
        </tr> 
        <tr> 
            <td valign="top">Teams</td> 
            <td valign="top">2.8, 2.10, 2.11, 2.12,2.13,2.20</td> 
            <td valign="top">34 - 81, 89 - 130, 145 - 156</td> 
            <td valign="top">All team management functionality.</td> 
        </tr> 
    </tbody> 
</table>
</div>

<p><strong><em>Testing Methods</em></strong></p>
<p>For JSP pages, the test cases will verify the HTML output. The prototype conversion should have assigned ID attributes for key elements on each page to allow unit testing tools to be able to locate data on the page.</p>
<p>A population script will be provided to insert mock data to the database for testing. It may be helpful to understand the database schema. Among other support information, the mock data includes:</p>
    <ul>
        <li>Components</li>
        <li>Users</li>
        <li>Projects</li>
        <li>Phases</li>
        <li>Resources</li>
        <li>Teams</li>
    </ul>
    
<div class="sectionHeader">Payment</div>
<p>TopCoder will compensate the first and second place submissions. The payments for the winning competitors will be distributed after the review phase is completed and the winners are selected.</p>
<p><strong>Winning Test Solution</strong><br />Total Payment - $1400</p>
<p><strong>Runner-up Test Solution</strong><br />Total Payment - $700</p>

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
<p>Your ability to participate in this competition is contingent on the agreement to the Testing Terms of Work and signing of a Non Disclosure Agreement. Once you have registered this information will be emailed to you and should be returned within 24 hours. If you have previously completed these documents, no further action is needed.</p>

<div class="sectionHeader">Timeline</div>
<p>All submissions are required to be submitted by the end of Competition Phase. The end of each phase is at 9:00 AM EDT.</p>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="350">
    <tbody> 
        <tr> 
            <td>Phase</td> 
            <td align="center">Start</td> 
            <td align="center">End</td> 
            <td align="center">Days</td> 
        </tr> 
        <tr> 
            <td>Registration</td> 
            <td align="center">08.17.2007</td> 
            <td align="center">08.22.2007</td> 
            <td align="center">5</td> 
        </tr> 
        <tr> 
            <td>Submission</td> 
            <td align="center">08.18.2007</td> 
            <td align="center">08.26.2007</td> 
            <td align="center">8</td> 
        </tr> 
        <tr> 
            <td>Test Case Screening</td> 
            <td align="center">08.26.2007</td> 
            <td align="center">08.27.2007</td> 
            <td align="center">1</td> 
        </tr> 
        <tr> 
            <td>Winner Selection</td> 
            <td align="center">&nbsp;</td> 
            <td align="center">09.02.2007</td> 
            <td align="center">&nbsp;</td> 
        </tr> 
    </tbody> 
</table>
</div>
<br /><br />

<div class="sectionHeader">Submission Technical Details</div>
<p><em>Submission Naming Standards</em></p>
<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="350">
    <tbody> 
        <tr> 
            <td><strong>Java Test File Package</strong></td> 
            <td>com/cronos/registrationtool/test</td> 
        </tr> 
        <tr> 
            <td><strong>Primary Test File Name</strong></td> 
            <td>AllTests.java</td> 
        </tr> 
        <tr> 
            <td><strong>Application Section</strong></td> 
            <td>teams</td>
        </tr> 
    </tbody> 
</table>
</div>

<p><em>Submission Format Directory Format</em></p>
<p>The submission should be implemented in the following directory structure:</p>
<pre>
[Member Handle]_registration_tool _[application section]
    Application
        src
            java
                test
                    application section  - [java files in appropriate 
                     package structure]
                docs
                    tests - Any necessary documentation
                testlib
                    [any jars required to run tests]
Any necessary documentation under "docs".
Any library required to run the tests under "testlib".
</pre>

<p><em>Ant Task</em><br />
Each submission should implement two ant tasks. These ant tasks will be executed in the build.xml file that is included in the zip file of the application source code.  Below are templates for these tasks.
</p>

<p>Compile Ant Task</p>
<pre>
    &lt;target name="compile_test " depends="compile"&gt;
        &lt;mkdir dir="${build_testclassdir}"/&gt;
        &lt;javac srcdir="${javatests}" destdir="${build_testclassdir}" includes="${packagedir}/**" verbose="${verbose}"&gt;
            &lt;classpath refid="test.build.classpath" /&gt;
        &lt;/javac&gt;
    &lt;/target&gt;
</pre>

<p>Run Test Ant Task</p>
<pre>
    &lt;target name="test " depends="compile_test "&gt;
        &lt;antcall target="init_db"&gt;&lt;/antcall&gt;
        &lt;mkdir dir="${testlogdir}"/&gt;
        &lt;junit fork="true" haltonerror="false" printsummary="yes"&gt;
            &lt;classpath refid="test.build.classpath"/&gt;
            &lt;test name="${package}.AllTests" todir="${testlogdir}"&gt;
                &lt;formatter type="plain" usefile="true"/&gt;
                &lt;formatter type="xml" usefile="true"/&gt;
            &lt;/test&gt;
        &lt;/junit&gt;
        &lt;antcall target="clean_db"&gt;&lt;/antcall&gt;
    &lt;/target&gt;
</pre>

<div class="sectionHeader">How the submission Test Cases will be executed during review</div>

<p>
After the submission phase is complete, all submission will be tested against the application code base supplied during registration.  Below is the process that will be followed for each test
</p>

<ul>
<li>The application source code zip file will be exploded and set up on a TopCoder Test Server</li>
<li>The submission src/java/test directory will be copied to the application directory of the application</li>
<li>The Ant Tasks defined above will be added to the application build.xml file</li>
<li>The Ant deploy command will be called to deploy the application</li>
<li>The Application will be started</li>
<li>The ant task from above will be called. This task will compile and initiate the test process.</li>
</ul>

<div class="sectionHeader">How the submission Test Cases will be evaluated</div>

<ul>
<li><em>Completeness of test case implementations</em><br />
The review will evaluate whether the minimum number of test cases where implemented</li>
<li><em>Accuracy of test case implementations</em><br />
The review will evaluate whether the test cases where implemented to correctly test the requirements of the application</li>
<li><em>Thoroughness of test cases to application requirements</em><br />
If the submission includes additional test cases, this will evaluate how well the test cases meet the edge cases for the application</li>
<li><em>Quality of test case code</em><br />
The submission will evaluate the quality of the code. This will include the documentation of the code.</li>
</ul>
<br /><br />

<div class="sectionHeader">Registration</div>
<%--<p>Registration is closed.</p>--%>
  
<p>To sign up as a participant, send an email to <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Registration Tool: Teams">TestingCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Name of Testing Competition in which you would like to participate</li>
</ul>
TopCoder staff will respond as to whether you are registered or not.
</p>

<div class="sectionHeader">Submission</div>
<p>Once you have test code you are ready to submit, you can do so by emailing your source code to <A href="mailto:TestingSubmissions@topcoder.com?subject=Submit: Registration Tool: Teams">TestingSubmissions@topcoder.com</A> by the submission deadline.  Once a submission is received, it will be screened.  All code that passes screening will be made available to the Assembly Competition teams.</p>

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

