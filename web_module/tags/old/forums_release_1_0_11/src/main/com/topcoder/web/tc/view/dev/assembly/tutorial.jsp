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
      <jsp:param name="node" value="assembly_tutorial"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="assembly"/>
<jsp:param name="title" value="Tutorial"/>
</jsp:include>

<span class="bigTitle">Tutorial</span>
<br><br>
<span class="bodySubtitle">Before You Begin</span><br>
Before you begin the Assembly Competitions, you need to download software, set up your environment, and <A href="/Registration">register</A> with TopCoder.
<br><br>
<strong>Required Software</strong><br>
TopCoder Software uses Poseidon software from <A href="http://www.gentleware.com">www.gentleware.com</A> to capture diagrams during the design process. You need to download a Community Edition of the software. Gentleware regularly publishes updates to Poseidon. However, TopCoder Software does NOT use the latest version as soon as it's available. Please consult the <A href="/tc?module=Static&d1=dev&d2=support&d3=desDocumentation">TopCoder Software documentation</A> for the version of Poseidon that you need to download.
<br><br>
In addition to diagrams, you need to deliver a component specification document. You need to submit a document in Rich Text Format (RTF). You can use Microsoft Word or Microsoft WordPad to produce RTF files. Microsoft WordPad is included with the default distribution of Microsoft Windows.
<br><br>
Finally, depending on the target platform of your design, you will need <A href="http://ant.apache.org/">ant</A> or <A href="http://nant.sourceforge.net/">nant</A> to prepare your design distribution for submission. See the <A href="/i/development/downloads/TopCoder_Software_Member_Guide.pdf">TopCoder Software Member Guide</A> for the required versions of these tools.
<br><br>
You will need to download the distributions for all components used during the competition.  All of these components will be stored in the forums.
<br><br>
<strong>Scorecards</strong><br>
Please review the Scorecards <<link to scorecard>> for information on how you will be evaluated by the Review Board.
<br><br>
<strong>Review the documentation</strong><br>
The goal of each Assembly Competition is to fit all of the components into a fully functional application.  In order to accomplish this task, you must review the available documentation.
<ul>
<li><strong>Use Case</strong> - You will be assigned a set of use cases to implement.  The use case diagram lays out all of the use cases for the application.
<li><strong>Activity Diagrams</strong> - The activity diagrams correspond directly to the use cases.  Each Activity Diagram is named after the Use Case in the following format: <em>Use Case Name Activity Diagram Name</em>.  The purpose of this document is to record the logical use case flow.
<li><strong>Requirement Specification</strong> - The requirement specification is formatted based on Use Cases.  Each use case is defined under the logical requirements section and is numbered as 2.X for each use case.  2.X.Y corresponds to each activity diagram.
<li><strong>Sequence Diagram</strong> - Each sequence diagram is named after the activity diagram it corresponds to.  These sequence diagrams will be the map to your assembly work.  Each sequence diagram will explain to the method level how to assemble the components to meet the functionality required for the use case.  If the sequence diagram cannot be followed exactly, participants are required to raise the issue to TopCoder via the contest forum.  You will be required to implement all <span style="color:#FF9900;">orange</span> colored objects.
<li><strong>Component Interface Diagram</strong> - This diagram defines the required interfaces for all components of the application.  As an assembly participant, you will implement all of the required interfaces exactly as specified.  Test cases will be developed based on these specific interfaces.
<li><strong>Design Specification</strong> - This document will detail and define all auditing, logging, and threading information for the system.  Additionally, you will find supplementary information to implement your prototype conversion.
<li><strong>Component Distributions</strong> - Download the complete implementation for all components to be used in the competition.
</ul>
<span class="bodySubtitle">Preparing Your Submission - Code</span><br>
Once you have received all of your documentation and have an understanding of the components and the application, it is time to assemble the code.  You need to perform four main tasks - prototype conversion, sequence diagram implementation, test case development, and deployment documentation. The following sections guide you through the process of creating these deliverables.  Remember that any code written must follow TopCoder coding conventions.  Our coding conventions are the published standards for Java and C#. You can view them at the following links:
<br><br>
<A href="http://java.sun.com/docs/codeconv/html/CodeConvTOC.doc.html">Java Coding Conventions</A><br>
<A href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vsent7/html/vxconcodingtechniques.asp">.NET Coding Conventions</A>
<br><br>
<strong>Sequence Diagram Implementation</strong><br>
The bulk of the work to be completed will be implementing the assigned sequence diagrams.  The key to implementing the sequence diagrams will be utilizing the TopCoder supplied comments and following the design specification.  All of the code you are required to write will be found in the orange colored objects.  You will find the corresponding contract and interface defined in the component interface diagram.  You will write the logic to call all of the components in the defined order while implementing the defined API.  
<br><br>
If you encounter any issues with a component or the sequence diagram API, immediately post a message to the forum and contact the PM.  TopCoder will immediately fix any issues with the component and, if necessary, extend the timelines.  Not using the specified components and not following the sequence diagrams is unacceptable.  This will cause you to fail review.  As part of the review process, a metric is used to measure lines of assembly code verses lines of component code.  If the number is incorrect, the submission will fail review.  Please view the scorecard to see more information on the scoring criteria.
<br><br>
<strong>Prototype Conversion</strong><br>
You will receive the HTML or thick client application prototype.  The first step is to take a look at the corresponding sequence diagram, interface diagram and prototype pages.  You will be responsible for converting the HTML pages into the specified front end technology such as JSP, ASPX, Servlets, etc.  The component interface diagram will define the API to implement for each front end page.  This API must be kept and followed exactly.  If you encounter any problems, bring them up immediately in the forums.  All links, style and formatting must be maintained from the HTML prototype to the final front end implementation.  
<br><br>
<strong>Test Case Development</strong><br>
Test case development is really where you can make your submission stand out.  Each language is a bit different for testing purposes.
<ul>
<li><A href="/tc?module=Static&d1=dev&d2=support&d3=devUnitTestsCSharp">Writing C# Unit Tests</A></li>
<li><A href="/tc?module=Static&d1=dev&d2=support&d3=devUnitTestsJava">Writing Java Unit Tests</A></li>
</ul>
It can be very tempting to simply aggregate all of your unit tests into one function. However, this greatly reduces the utility of your tests. In our example above, we could easily combine all three test functions into a single function, testSaveAs(). Instead of having three tests, we now only have one. If any of the three behaviors are broken, all tests will fail. In larger scale testing, this composite testing methodology can lead to very confusing failure conditions, and it can become difficult to debug your testing code. The smaller and more atomic your tests become, the more obvious the failure point and probable causes generally are.
<ul>
<li>ALWAYS implement a tested version of the demonstration from the component specification. 
<li>ALWAYS provide a meaningful message in assert and fail calls. 
<li>ALWAYS document your test code as thoroughly as you document your component code. 
<li>Break up your tests into discrete TestCase classes. If one TestCase becomes unmanageable, don't hesitate to break it into two or more classes. 
<li>Break up your tests within those classes into the smallest functions possible; that way, it is clear which areas of the component are failing. You will then be able to use the number of tests passing and failing as a completion metric. 
<li>Reduce code duplication and increase robustness with setUp() and tearDown(). 
<li>Test every public function for as much valid and invalid input as time allows. 
<li>Test expected component processes: for example, loading, processing data, and saving data. 
<li>Don't forget to clean up your environment! Unit tests should leave the system in the same state they found it in; there should be no persistent changes. This is checked during review. 
<li>Test classes are normal classes in every respect, except that they have special significance to the testing framework. These classes can inherit from a class intermediate between themselves and the final test. They may contain methods other than test methods. They may have state. 
<li>Because they are in the same package or namespace as the component classes they test, the unit tests can access package-private and protected classes and their members. 
<li>Interfaces cannot be tested directly, but methods that accept interface arguments can be presented with alternative implementations. This technique has great potential for verifying that the component does the expected things with and to its interface-typed fields and method arguments, and that it reacts correctly to exceptions thrown by methods invoked on such arguments.
</ul>
Make sure you write a comprehensive unit testing suite. Inadequate tests can cost you dearly because there are several scorecard items pertaining to the unit test suite. Tests should cover all non-private methods thoroughly, and they should be well documented. Doing a good job on the tests can be a big win because the unit test suite is one of the areas that is more frequently neglected. 
<br><br>
<strong>Deployment Documentation</strong><br>
This is another spot where you could lose a LOT of points.  If the engineer cannot deploy your application, you will be notified and potentially fail review.  Make sure your documentation clearly defines how to build and deploy your solution.  The more detail you provide here, the better.  Be meticulous in your documentation and steps.  This is one area of the competition where the review scorecard is very unforgiving.  Please view the deployment template, found in the distribution.
<br><br>
<span class="bodySubtitle">Challenging Test Cases</span><br>
<br><br>
<strong>Test Case Review</strong><br>
Make sure to download the test cases developed during the Testing Competitions.  These test cases will be used to grade your submissions.  You will need to review and run these test cases to make sure you have a successful submission.
<br><br>
<strong>Test Case Challenge</strong><br>
Once you have reviewed all of the test cases, you will have the opportunity to point out test cases that you believe are invalid.  You will need to write a succinct and factually accurate appeal to each test case you believe is wrong.  It will help your case to explain how it does not relate to the requirement specification.  Once the test case challenge has been filed, it will be reviewed by the Competition Manager and the test case will either be changed or your appeal will be rejected.
<br><br>
<span class="bodySubtitle">Submission</span><br>
You will package your submission and upload the submission to Project Submit and Review.  
<br><br>
<span class="bigRed">NOTE: For the Time Tracker Application, you will email your submission to TopCoder.  Your solution will be packaged based on the script attached with the distribution.  Please verify that your deployment documentation and all source code is packaged in your submission.</span>
<br><br>
<span class="bodySubtitle">Review</span><br>
The submission is now out of your hands, and the Review Board will judge it on the scorecard, which you can find <A href="/tc?module=Static&d1=dev&d2=assembly&d3=sampleScorecard">here</A>.  Sit back, relax and wait for your chance to appeal the review.
<br><br>
<span class="bodySubtitle">Appeals</span><br>
After review is complete, you will view and can appeal the score your application was given. You'll see the comments from the Review Board on each point in the Scorecard, and you can dispute any point. Please keep in mind that you must have a very good reason to appeal or it will be denied. If the reviewer makes a statement that is in conflict with the design, or if the reviewer has made an oversight, feel free to appeal. On the other hand, matters of opinion may not be appealed. If you are the winning assembler, you will have the opportunity to discuss reviewers' judgments in Final Fixes.
<br><br>
<span class="bodySubtitle">Final Fixes</span><br>
Congratulations! You won the competition.
<br><br>
However, there is probably still work to be done. Your review scorecard will be available via Project Submit & Review, and there you will find any and all problems the Review Board found with your submission. It will contain required and recommended fixes to your submission.
<br><br>
<strong>All required fixes must be addressed. Your application WILL NOT be completed, and you will not receive any payment, until all required fixes have been addressed.</strong> Every recommended fix should be attempted. Obviously, recommended fixes are of lower priority than required fixes, but if there is time, they should also be completed.
<br><br>
<strong>Communication</strong><br>
More than any at stage of the competition process, communication during final fixes is key.
<br><br>
If, for any reason, you have a question or comment on the review, post it as soon as possible in the contest forum and email the Project Manager. The PM will look into the issue and ensure that the primary reviewer is aware of the situation. If, for whatever reason, you feel a required fix is impossible within the given timeframe, you need to address it on the forums. Do NOT just resubmit without completing a required fix or a comment in a readme. This is never acceptable. Communicate with the reviewers to avoid these conflicts! The more detail you can give, and the sooner you give it, the more smoothly this stage will go. The Review Board is always open to communication from the your team; they may have overlooked something in the design or in your submission. Don't be afraid to question the Review Board. Questions and comments show that you're paying attention and actively involved; without communication, the Review Board doesn't know that you're working on the fixes, and can't clarify their requirements.
<br><br>
Remember that ALL test cases must successfully pass in order to complete final review!
<br><br>
<span class="bodySubtitle">Final Submission and Review</span><br>
Once you have successfully completed all of the required fixes, you should submit in the same manner as you originally did.  Follow the same guidelines above for ensuring all your files are uploaded properly. Try to be as complete as possible before resubmitting. This saves everyone time, including you.
<br><br>
If you've met all the requirements, and all the tests still pass, the assembly is complete, and goes into preparation for deployment. Your work is complete!
<br><br>
If anything is incomplete, you'll earn a return trip to Final Fixes.
<br><br>
<span class="bodySubtitle">Deployment</span><br>
The application will now be deployed for testing and certification.  The winning team will support any issues or bugs found during deployment for 30 days.  After 30 days any newly identified bugs will not be the winning team's responsibility.  If an enhancement is identified, TopCoder will pay the winning team an additional payment to enhance the application.
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

