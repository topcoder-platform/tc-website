<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Component Tutorials</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}
.GAtableText, .GAtableText2, .GAtableText3, .GAtableText4, .GAtableText5
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
}
.GAtableText{   background-color: #EEEEEE; }
.GAtableText2{   background-color: #FF6600; }
.GAtableText3{   background-color: #FFCC00; }
.GAtableText4{   background-color: #FFFF00; }
.GAtableText5{   background-color: #FFFF99; }
</style>
</head>
<body>
<div id="onTop">
    <jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
    </jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="comp_tutorials"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">

<jsp:include page="../page_title.jsp" >
   <jsp:param name="image" value="comp_tut"/>
   <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=tutorials&d2=comp_index">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="515619" message="Discuss this article" />
</div>

<span class="bigTitle">Rational&#174; Performance Tester: An Introduction</span>
<br /><br />

<%--<div class="authorPhoto">
    <img src="/i/m/kzimmerman_big.jpg" alt="Author" />
</div>
--%>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22498968" context="component"/> <br />
      <em>TopCoder Member</em>
</div>

<br clear="all">
<p>As you might have already noticed, last week TopCoder posted a component design competition that involves Rational&#174; Performance Tester (RPT) -- <a href="/tc?module=ProjectDetail&pj=30001526">RPT Logging Adapter</a> -- and, in fact, a series of more RPT component competitions are launching today. Are you ready?</p>

<p>This article includes a quick start to get you familiar with RPT basic concepts and workflow, as well as a section on extending RPT's out-of-the-box functionality through the use of custom Java code.</p>

<p><span class="bodySubtitle">1. Overview</span><br />
Rational&#174; Performance Tester is a load and performance testing tool for web-based applications; it helps development teams validate the scalability and reliability of their on-going web applications before deployment and production. RPT allows you to capture your interactions to test your web-based applications, recording them and examining them later to measure your application's performance. You can also use RPT to further identify the root causes of poor performance issues from the hardware- or software-component level through advanced resource monitoring and response-time tracking.</p>

<p><i>Download</i><br />
At IBM's website, you can <a target="_blank" href="<tc-webtag:linkTracking link='http://www-128.ibm.com/developerworks/downloads/r/rpt/?S_TACT=105AGX23&S_CMP=rnav' refer='rationalPerformanceTester' />">download</a> an evaluation copy of RPT. Note that you need to have an IBM ID to download it.</p>

<p><i>Installation</i><br />
RPT is built on top of the Eclipse framework, so if you already have Eclipse installed in your system, you may choose to install RPT as an extension (options are available in the installation wizard). A fresh installation will have a dedicated copy of Eclipse installed as well.</p>

<p><span class="bodySubtitle">2. Getting Started with Rational Performance Tester</span><br />
In RPT, performance testing has five stages: test creation, test editing, workload emulation with schedules, schedule execution, and evaluation of results.</p>
<ul>
<li>Test Creation.<br />
In this stage, test scenarios (<i>Test</i> in RPT term) will be created. Generally tests are created by recording representative interactions (generally through a web browser) with an application, these actions are saved and a test is generated from these recorded actions. One can also create tests from scratch: the custom Java code we'll discuss later is a good example.</li>
<li>Test Editing.<br />
After recording a test, run it individually and inspect the results to make sure that the tests are doing what you expect. You may also want to edit your tests. Typical changes that you might make are:
    <ul>
        <li>Replacing a value in a recorded test with values in a datapool. This produces more realistic test data.</li>
        <li>Adding dynamic data to a test (referred to as data correlation).</li>
        <li>Enabling verification points, so that you can determine whether an expected behavior occurred.</li>
    </ul>
</li>
<li>Workload Emulation with Schedules.<br />
A schedule can be seen as the "engine" that runs tests. This can be as simple as one virtual user running one test, or as complicated as hundreds of virtual users, in different groups, each running different tests at different times.<br />
With a schedule, you can:
    <ul>
        <li>Group tests to emulate the actions of different users (with User Groups).</li>
        <li>Set the order in which tests run: sequentially, randomly, or in a weighted order.</li>
        <li>Set the number of times each test runs.</li>
        <li>Run tests at a certain rate.</li>
    </ul>
After you edit a test, you create a schedule. You add user groups to the schedule and add appropriate tests to each group to emulate a task.<br />
A typical schedule contains the following:<br />
    <ul>
        <li>User groups and tests. A schedule requires at least these items to run.</li>
        <li>Items, such as loops, delays, and setting behavior of the think time, to further, better and more accurately emulate a load.</li>
    </ul>
</li>
<li>Schedule Execution.<br />
The created schedules could be executed on demand.</li>
<li>Evaluation of Results.<br />
Reports are displayed during and after the schedule execution. You can also regenerate reports after the execution, customize reports, and export reports in HTML format, so that others who do not have RPT can see them. Those reports help you make your evaluation and determine the root causes of poor performance.</li>
</ul>

<p><strong>Case Study: Struts MailReader Demo Application</strong><br />
Now let's go through a step-by-step case study that covers the abovementioned stages. This demonstration is based on the <a href="/i/education/downloads/rpt/RPT_webapp4test.zip">MailReader Demo Application</a> shipped with Apache Struts 1.3.8, a simple application that maintains email information of registered users. In this case study, we will test performance of both viewing pages and editing the email information.</p>

<p><i>Prerequisites</i><br />
(1) Deploy struts-faces-example2-1.3.8.war to Tomcat or another container.<br />
(2) Visit the deployed application, register a user with username "test" and password "test".</p>
    
<p><i>Test Plan</i><br />
Let's assume a scenario like this:
<ul>
    <li>There are two groups of users, one group who just views the web pages (viewing group, 70% of all users) while the other group edits their email information (editing group, 30% of all users).</li>
    <li>In the scenario, each group will perform their operations 20 times: the viewing group performs 5 operations per minute, while the editing group performs 4 operations per minute.</li>
</ul>

<ul>
<li>Create a "Performance Test Project".<br />
Launch RPT, click File &gt; New &gt; Performance Test Project, enter project name "RPTTest1" and select the location, then click Finish to create the project.<br />

<div align="center"><img src="/i/education/rpt/Fig_2_1.png" alt="Figure 2.1" border="0" style="margin: 10px;" /></a><br />
Fig 2.1 Create project</div><br />

<div align="center"><img src="/i/education/rpt/Fig_2_2.png" alt="Figure 2.2" border="0" style="margin: 10px;" /></a><br />
Fig 2.2 Enter project name and location</div><br />
</li>

<li>Record Tests<br />
Click File &gt; New &gt; Test from Recording, choose HTTP Recording in the dialog, click Next, enter the test name "View", and click Finish.<br />

<div align="center"><img src="/i/education/rpt/Fig_2_3.png" alt="Figure 2.3" border="0" style="margin: 10px;" /></a><br />
Fig 2.3 Start an HTTP Recording</div><br />

<div align="center"><img src="/i/education/rpt/Fig_2_4.png" alt="Figure 2.4" border="0" style="margin: 10px;" /></a><br />
Fig 2.4 Enter Test Name</div><br />

Now your browser will be launched, through which you'll start to interact with your application. Enter the address of your deployed MailReader Demo Application to begin. Note that if the application is deployed on the same machine as RPT, make sure not to use "localhost" or "127.0.0.1" as the host name -- by default, connections to local addresses will not pass through the RPT proxy, so you should simply bind an IP address with your application container.<br />

<div align="center"><img src="/i/education/rpt/Fig_2_5.png" alt="Figure 2.5" border="0" style="margin: 10px;" /></a><br />
Fig 2.5 Initial Web Page of HTTP Recording</div><br />

Log onto the application with username "test" and password "test", then logout and exit the browser.<br />

<div align="center"><img src="/i/education/rpt/Fig_2_6.png" alt="Figure 2.6" border="0" style="margin: 10px;" /></a><br />
Fig 2.6 Homepage of MailReader Demo Application</div><br />

Now your will see a test named "View" in Test Navigator view.<br />

<div align="center"><img src="/i/education/rpt/Fig_2_7.png" alt="Figure 2.7" border="0" style="margin: 10px;" /></a><br />
Fig 2.7 Created Tests</div><br />

We also need to create a test named "Edit," using similar steps, whose testing interactions will include logging on, editing email addresses and logging out.
</li>

<li>Execute Tests and Make Changes<br />
Now you can execute the created tests by right-clicking them and selecting Run As &gt; Performance Test to see if the tests behave as expected. You can make changes to the tests as necessary.</li>

<li>Create Performance Schedule<br />
Right-click the project, and then click New &gt; Performance Schedule, enter the schedule name "Schedule" in the dialog, and click Finish.<br />

<div align="center"><img src="/i/education/rpt/Fig_2_8.png" alt="Figure 2.8" border="0" style="margin: 10px;" /></a><br />
Fig 2.8 Create Performance Schedule</div><br />

A new schedule is displayed with one user group. Since we need two user groups, right-click the schedule, then click Add &gt; User Group to add another group.<br />

<div align="center"><img src="/i/education/rpt/Fig_2_9.png" alt="Figure 2.9" border="0" style="margin: 10px;" /></a><br />
Fig 2.9 Newly Created Schedule</div><br />

Change the Group Size of "User Group 1" to 70%, right-click it, then click Add &gt; Loop to add a loop to the user group. Change the iteration number of the loop to 20, check "Control the rate of iterations", and change the rate to 5 per minute. Right-click the loop, then click Add > Test, then choose test "View" to add the test to the current loop.<br />

<div align="center"><img src="/i/education/rpt/Fig_2_10.png" alt="Figure 2.10" border="0" style="margin: 10px;" /></a><br />
Fig 2.10 Adjust Properties of User Group</div><br />

<div align="center"><img src="/i/education/rpt/Fig_2_11.png" alt="Figure 2.11" border="0" style="margin: 10px;" /></a><br />
Fig 2.11 Adjust Properties of Loop</div><br />

Adjust "User Group 2" similarly and finally save the project. Now we have successfully created a schedule.
</li>

<li>Execute Test Schedule<br />
Right-click the Schedule, and then click Run As &gt; Performance Schedule. Now the schedule will be executed.</li>

<li>Check Reports<br />
Once the schedule execution completes, reports will be generated automatically. There are various performance counters grouped as "Page Performance", "Response vs. Time", "Page Throughput", etc. By analyzing the reports, you can make the performance evaluations as well as locate the performance bottleneck.<br />

<div align="center"><img src="/i/education/rpt/Fig_2_12.png" alt="Figure 2.12" border="0" style="margin: 10px;" /></a><br />
Fig 2.12 Summary of Schedule Execution</div><br />
</li>
</ul>

<p><span class="bodySubtitle">3. Custom Java Code in RPT - Extending the out-of-box functionalities</span><br />
Like its foundation Eclipse, extensions are welcome by RPT. Basically you can extend how you run your tests by writing custom Java code and calling the code from the test, you can also specify that results from the tests that are affected by your custom code be included in reports.</p>

<p>Custom code enables you to perform such tasks as managing loops, retrieving virtual user information, running external programs from tests, and customizing data correlation.</p>

<p>For example, the test execution could be extended in the following ways:</p>
<ul>
    <li>Store objects in data areas that contain objects for engine, virtual user, test, and HTTP information.</li>
    <li>Manage the behavior of loops.(See Case Study #2)</li>
    <li>Retrieve the IP address of a virtual user.</li>
    <li>Perform custom data correlation.</li>
    <li>Run a batch file or program that sets up the environment needed for a test and resets the environment afterward.</li>
</ul>

<p><strong>Test Execution Services</strong><br />
The essential extension support of RPT comes from Test Execution Services (TES), which includes a number of interfaces and classes defined in the <i>com.ibm.rational.test.lt.kernel</i> and its sub-packages.</p>

<p>Important interfaces and classes are briefly described in the following table, for more details please refer to the TES API reference shipped with the RPT documentation.</p>

<table class="formFrame" width="400" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td>Interface/Class</td>
      <td>Description</td>
   </tr>
   <tr class="GAtableText">
      <td>ICustomCode2</td>
      <td>Defines customized Java code for test execution services. Use this interface to create all custom code.</td>
   </tr>
   <tr class="GAtableText">
      <td>ITestExecutionServices</td>
      <td>Provides information for adding custom test execution features to tests. This interface is the primary interface for execution services. ITestExecutionServices provides access points to the following interfaces: IDataArea, IARM, ILoopControl, IPDLogManager, IStatisticsManager, ITestLogManager, ITime, and ITransaction.</td>
   </tr>
   <tr class="GAtableText">
      <td>IDataArea</td>
      <td>Defines methods for storing and accessing objects in data areas. A data area is a container that holds objects. The elements of a data area are similar to program variables and are scoped to the owning container. To use objects specific to a protocol, you should use objects provided by that protocol that are stored in the protocol-specific data area.</td>
   </tr>
   <tr class="GAtableText">
      <td>ILoopControl</td>
      <td>Provides control over loops in a test or schedule. For example, you can use this interface to break loops at specific points in a test. The loop that is affected is the nearest containing loop found in either the test or the schedule.</td>
   </tr>
   <tr class="GAtableText">
      <td>IPDLogManager</td>
      <td>Provides logging information such as problem severity, location levels, and error messages.</td>
   </tr>
   <tr class="GAtableText">
      <td>IStatisticsManager</td>
      <td>Provides access to statistical counters in the ICustomCode2 interface (used for defining custom code). Statistical counters are stored in a hierarchy of counters. Periodically, all the counter values in the hierarchy are reported to the performance testing workbench and collected into performance test run results, where they are available for use in reports and graphs. Each counter in the hierarchy has a type (defined in class StatType). The operations that are available on a counter depend on the counter's type.</td>
   </tr>
   <tr class="GAtableText">
      <td>ITestLogManager</td>
      <td>Logs messages and verification points to the test log. Use this interface for handling error conditions, anomalies in expected data or other abstract conditions that need to be reported to users, or for comparisons or verifications whose outcome is reported to the test log. ITestLogManager can also convey informational or status messages after the completion of a test.</td>
   </tr>
   <tr class="GAtableText">
      <td>ITestInfo</td>
      <td>Provides information about the test that is running; for example, the test name and information about the current problem determination log level for this test.</td>
   </tr>
   <tr class="GAtableText">
      <td>IVirtualUserInfo</td>
      <td>Provides information about virtual users; for example, the virtual user's name, problem determination log level, TestLog level, globally unique ID, and user group name.</td>
   </tr>    
   <tr class="GAtableText">
      <td>IStatistics</td>
      <td>Retrieves the statistics counter tree associated with the current statistics processor. Stops the delivery of statistical counters. Changes the priority of the statistics deliver thread.</td>
   </tr>
</table>

<p><strong>ICustomCode2</strong><br />
There's only one method defined in interface ICustomCode2, which will be called by the test engine while executing the tests:</p>

<pre class="code">    
    public String exec(ITestExecutionService tes, String[] args);
</pre>

<p>Parameter tes is provided by RPT test engine, and used by custom Java code to interact with TES. Parameter args is provided through references or field references, which must be included in the tests; within the tests, the references must precede the code that they affect.</p>
    
<p><strong>Steps to Create Your Custom Code</strong><br />
The following are typical steps to create custom code:</p>

<ul>
    <li>Open a test and select a test element to which the custom code will be added.</li>
    <li>Click Add or Insert and then select Custom Code to add the custom code.</li>
    <li>Change the class name as you like.</li>
    <li>Add arguments (i.e. args parameter in ICustomCode2.exec method) through references.</li>
</ul>

<p><strong>Case Study #1: Log JVM Heap Size</strong><br />
In this case study, we'll create custom code to log the maximum JVM heap size. Though it is not very useful here, we're just using this to demonstrate how to create a simple piece of custom code inside a test element.</p>

<ul>
<li>Create a Performance Test Project with name "RPTTest2".</li>
<li>Create an empty test element.<br />
Select project "RPTTest2", click New &gt; Test Element.<br />

<div align="center"><img src="/i/education/rpt/Fig_3_1.png" alt="Figure 3.1" border="0" style="margin: 10px;" /></a><br />
Fig 3.1 Create a Test Element</div><br />

Select New HTTP Test in the dialog, click Next.<br />

<div align="center"><img src="/i/education/rpt/Fig_3_2.png" alt="Figure 3.2" border="0" style="margin: 10px;" /></a><br />
Fig 3.2 Select New HTTP Test</div><br />

Enter test name "Test1", click Next, then enter description, click Next, then change "Number of HTTP pages to generate" to 0 and click Finish.<br />

<div align="center"><img src="/i/education/rpt/Fig_3_3.png" alt="Figure 3.3" border="0" style="margin: 10px;" /></a><br />
Fig 3.3 Enter test name</div><br />

<div align="center"><img src="/i/education/rpt/Fig_3_4.png" alt="Figure 3.4" border="0" style="margin: 10px;" /></a><br />
Fig 3.4 Enter test description</div><br />

<div align="center"><img src="/i/education/rpt/Fig_3_5.png" alt="Figure 3.5" border="0" style="margin: 10px;" /></a><br />
Fig 3.5 Change the pages number</div><br />
</li>

<li>Create custom code<br />
Now test "Test1" will be shown in the test editor, right-click it and select Add > Custom Code, a Custom Code test element will be added, change its class name to "test.JVMInfo".<br />

<div align="center"><img src="/i/education/rpt/Fig_3_6.png" alt="Figure 3.6" border="0" style="margin: 10px;" /></a><br />
Fig 3.6 Add Custom Code</div><br />

<div align="center"><img src="/i/education/rpt/Fig_3_6a.png" alt="Figure 3.6a" border="0" style="margin: 10px;" /></a><br />
Fig 3.6(a) Change class name</div><br />

Click Generate Code, then Java source editor will be opened with the generated stub class that implements ICustomCode2 interface.<br />

<div align="center"><img src="/i/education/rpt/Fig_3_7.png" alt="Figure 3.7" border="0" style="margin: 10px;" /></a><br />
Fig 3.7 Custom code stub class</div><br />

Edit source code of exec method to this:<br />

<pre class="code">
public String exec(ITestExecutionServices tes, String[] args) {
  // Get JVM runtime
  Runtime rt = Runtime.getRuntime();
  // Get JVM heap size in MB
  long maxMB = rt.maxMemory() / (1024 * 1024);
  String hostName = "Unknown";
  // Get host name
  try {
      hostName = InetAddress.getLocalHost().getHostName();
  } catch (UnknownHostExcept8ion e1) {
  tes.getTestLogManager().reportMessage("Can't get hostname");
      return null;
  }
  // Log the JVM heap size
  tes.getTestLogManager().reportMessage("JVM maximum heap size for host "
   + hostName + " is " + maxMB + " MB");
return null;
}
</pre>
</li>

<li>Execute the test with custom code<br />
Execute test "Test1" by right-clicking it, then clicking Run As &gt; Performance Test.</li>
<li>Check test log<br />
In the "Performance Test Runs" view, test runs are logged, right-click the run you want to check, select "Display Test Log" to see the test logs.<br />

<div align="center"><img src="/i/education/rpt/Fig_3_8.png" alt="Figure 3.8" border="0" style="margin: 10px;" /></a><br />
Fig 3.8 Display Test Log</div><br />

In the log, you can see a message with JVM heap information was logged.<br />

<div align="center"><img src="/i/education/rpt/Fig_3_9.png" alt="Figure 3.9" border="0" style="margin: 10px;" /></a><br />
Fig 3.9 Logged message for JVM heap</div><br />
</li>
</ul>

<p><strong>Case Study #2: Loop Controlling</strong><br />
In this case study, we'll go back to the "Edit" test that was recorded in Section 2. We'll add all the interactions in "Edit" to a 10 times loop, and then use custom code to control the loop -- the loop will be broken if the user name shown in editing page is not as expected. With this case study, you'll familiar yourself with various TES interfaces.</p>

<ul>
<li>Record a test "Edit"<br />
Repeat steps in MailReader Demo case study to record the test "Edit".</li>
<li>Add interactions of "Edit" to a loop<br />
Select all interactions (test elements) inside "Edit", right-click them, and select Insert &gt; Loop. Change "Number of iterations" of the loop to 10.<br />

<div align="center"><img src="/i/education/rpt/Fig_3_10.png" alt="Figure 3.10" border="0" style="margin: 10px;" /></a><br />
Fig 3.10 Add test elements of "Edit" to a loop</div><br />

<div align="center"><img src="/i/education/rpt/Fig_3_11.png" alt="Figure 3.11" border="0" style="margin: 10px;" /></a><br />
Fig 3.11 Adjusted test "Edit"</div><br />
</li>

<li>Add 3 pieces of custom code to the loop, with the names "test.Initialize", "test.UsernameCheck" and "test.LoopCheck" respectively. Use Up/Down buttons to adjust their positions as depicted in Fig 3.12.<br />

<div align="center"><img src="/i/education/rpt/Fig_3_12.png" alt="Figure 3.12" border="0" style="margin: 10px;" /></a><br />
Fig 3.12 Loop with custom code</div><br />
</li>

<li>Edit custom code test.Initialize<br />
Method exec of test.Initialize would be:<br />

<pre class="code">
public String exec(ITestExecutionServices tes, String[] args) {
    // Get the test's data area and set a flag indicating that nothing
    // has failed yet. This flag will be used later to break out
    // of the loop as soon as a failure is encountered.
    IDataArea dataArea = tes.findDataArea(IDataArea.TEST);
    dataArea.put("failed", "false");
return null;
}
</pre>
</li>

<li>Edit custom code test.UsernameCheck<br />
Method exec of test.UsernameCheck would be:<br />

<pre class="code">
public String exec(ITestExecutionServices tes, String[] args) {
    // Check if the username is the expected
    if (args[0].equals("test")) {
        // user name is correct
        tes.getTestLogManager().reportMessage("User name correct");
    } else {
    // user name is incorrect, log a message and set failure flag
    tes.getTestLogManager().reportMessage("User name incorrect");
        IDataArea dataArea = tes.findDataArea(IDataArea.TEST);
            dataArea.put("failed", "true");
    }
    return null;
}
</pre>

Then we need to add a reference to the argument indicating username (args[0] in the code), the argument will come from the editing page:<br />

    <ul>
    <li>Select test element "test.UsernameCheck", and click Add in the Arguments field.<br />
    
    <div align="center"><img src="/i/education/rpt/Fig_3_13.png" alt="Figure 3.13" border="0" style="margin: 10px;" /></a><br />
    Fig 3.13 Add argument reference</div><br />
    </li>
    
    <li>Select the "test" in editing page and click OK.<br />
    
    <div align="center"><img src="/i/education/rpt/Fig_3_14.png" alt="Figure 3.14" border="0" style="margin: 10px;" /></a><br />
    Fig 3.14 Select argument reference</div><br />
    </li>
    </ul>
</li>    

<li>Edit custom code test.LoopCheck<br />
Method exec of test.LoopCheck would be:<br />

<pre class="code">
public String exec(ITestExecutionServices tes, String[] args) {
    // exit the loop if failure flag is true
    IDataArea dataArea = tes.findDataArea(IDataArea.TEST);

    String flag = (String) dataArea.get("failed");
    if ("true".equals(flag)) {
        // break the loop
        tes.getLoopControl().breakLoop();
    }
    return null;
    }
</pre>
</li>

<li>Execute the test<br />
Execute the test "Edit" by right-clicking it, then selecting Run As &gt; Performance Test.</li>
<li>Check test log<br />
Check the test log of "Edit" run. The log will indicate that 10 iterations were all executed, and a message "User name correct" was logged for each iteration.<br />

<div align="center"><img src="/i/education/rpt/Fig_3_15.png" alt="Figure 3.15" border="0" style="margin: 10px;" /></a><br />
Fig 3.15 Test log of "Edit" run</div><br />

The loop was not interrupted because "test" was always used to log onto the application, thus the condition <i>arg[0].equals("test")</i> was always met. If we change the condition to <i>arg[0].equals("test1")</i>, then only one iteration would be executed and a message "Username incorrect" would be logged.<br />

<div align="center"><img src="/i/education/rpt/Fig_3_16.png" alt="Figure 3.16" border="0" style="margin: 10px;" /></a><br />
Fig 3.16 Test log of an interrupted loop</div><br />
</li>
</ul>

<p>Download the files for these two <a href="/i/education/downloads/rpt/RPT_casestudyprojects.zip">case studies</a>.</p>

<p><span class="bodySubtitle">4. Resources</span><br />
It is impossible to cover all of the aspects of RPT in such a short article. If you'd like to dig deeper, check out the resources below.</p>

<ul>
<li>RPT Official Documentation<br />
Official Documentation is the best references we have for RPT, after installing RPT, you can find it through Help &gt; Help Contents.</li>
<li>Performance testing tutorials<br />
Official tutorials shipped with RPT, you can find it through Help &gt; Tutorials Gallery &gt; Watch and Learn &gt; Test a Web application.</li>
<li>Performance testing samples<br />
Official samples shipped with RPT, you can find it through Help &gt; Samples Gallery &gt; Technology sample &gt; Performance Testing Plants by WebSphere.</li>
<li><a target="_blank" href="<tc-webtag:linkTracking link='http://www-128.ibm.com/developerworks/edu/r-dw-r-hellorptdl.html' refer='rationalPerformanceTester' />">Hello World: Learn how to discover and analyze performance issues using Rational Performance Tester</a></li>
<li><a target="_blank" href="<tc-webtag:linkTracking link='http://www.ibm.com/developerworks/rational/library/07/0130_kelly/index.html' refer='rationalPerformanceTester' />">Introduction to IBM Rational Performance Tester V7.0</a></li>
<li><a target="_blank" href="<tc-webtag:linkTracking link='http://www.ibm.com/developerworks/rational/library/07/0130_davis1/index.html' />">Handling test data with IBM Rational Performance Tester 7.0: Part 1: Using datapools for test data</a></li>
<li><a target="_blank" href="<tc-webtag:linkTracking link='http://www.ibm.com/developerworks/rational/library/07/0130_davis2/index.html' refer='rationalPerformanceTester' />">Handling test data with IBM Rational Performance Tester 7.0: Part 2: Using files for very large sets of test data</a></li>
</ul>

<p>Finally, good luck in your RPT series competitions!</p>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
