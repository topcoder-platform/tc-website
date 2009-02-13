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
      <jsp:param name="node" value="testing_tutorial"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="testing"/>
<jsp:param name="title" value="Tutorial"/>
</jsp:include>


<span class="bigTitle">Tutorial</span>
<br><br>
<span class="bodySubtitle">Before You Begin</span><br>
Before you begin, you need to get the software, set up your environment, and <A href="/reg/">register</A> with TopCoder Software.
<br><br>
<strong>Required Software</strong><br>
TopCoder Software uses Poseidon software from <A href="http://www.gentleware.com">www.gentleware.com</A> to capture diagrams during the design process. You need to download a Community Edition of the software. Gentleware regularly publishes updates to Poseidon. However, TopCoder Software does not switch to the latest version right away. Please consult <A href="http://www.topcoder.com/tc?module=Static&d1=dev&d2=support&d3=devDocumentation">TopCoder Software web site</A> for the version of the software that you need to download.
<br><br>
In addition to diagrams, you need to deliver a component specification document. You need to submit a document in Rich Text Format (RTF). You can use Microsoft Word or Microsoft WordPad to produce RTF files. The Microsoft WordPad is included with the default distribution of Microsoft Windows.
<br><br>
Finally, depending on the target platform of your design, you need <A href="http://ant.apache.org/">ant</A> or <A href="http://nant.sourceforge.net/">nant</A> to prepare your design distribution for submission. See <A href="/tc?module=Static&d1=dev&d2=support&d3=devMemberGuide">TopCoder Software Member Guide</A> for the required versions of these tools.
<br><br>
You will need to download the distributions for all components used during the competition.  All of these components will be stored in the forums.
<br><br>
<strong>Scorecards</strong><br>
Please review the <A href="/tc?module=Static&d1=dev&d2=testing&d3=sampleScorecard">Scorecard</A> for information on how you will be scored.
<br><br>
<strong>Review the documentation</strong><br>
The goal of the assembly competition is to assemble all the components into a fully working application.  In order to accomplish this task, one must review the available documentation.
<ul>
<li><strong>Use Case</strong> - You will be assigned a set of use cases to implement.  The use case diagram lays out all of the use cases for the system.</li>
<li><strong>Activity Diagrams</strong> - The activity diagrams correspond directly to the use cases.  Each Activity Diagram is named after the Use Case in the following format, Use Case Name Activity Diagram Name.  The purpose of this document is to document the logical use case flow.</li>
<li><strong>Requirement Specification</strong> - The requirements specification is formatted based on Use Cases.  Each use case is defined under logical requirements section and is numbered as 2.X for each use case.  2.X.Y corresponds to each activity diagram.</li>
<li><strong>Prototype</strong> - The prototype is a full scale working example of the completed application.  It will be converted into a fully dynamic and functioning application.</li>
<li><strong>Testing Scenarios</strong> - The test scenarios are tied to individual use cases.  Each test scenario describes the specific test case that must be automated.</li>
</ul>
<span class="bodySubtitle">Preparing Your Submission - Code</span><br>
Once you have received all of your documentation and have an understanding of the components and the application, it is time to create the test code.  You will need to create automated test cases for each scenario including setup and tear down functions for all tests. Remember also any code written must follow TopCoder coding conventions.  Our coding conventions are the published standards for Java and C#. You can view them at the following links:
<br><br>
<A href="http://java.sun.com/docs/codeconv/html/CodeConvTOC.doc.html">Java Coding Conventions</A><br>
<A href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vsent7/html/vxconcodingtechniques.asp">.NET Coding Conventions</A>
<br><br>
<strong>Test Case Development</strong><br>
Test case development is really where you can make your submission stand out.  Each language is a bit different for testing purposes.
<ul>
<li><A href="/tc?module=Static&d1=dev&d2=support&d3=testingUnitTestsCSharp">Writing C# Unit Tests</A></li>
<li><A href="/tc?module=Static&d1=dev&d2=support&d3=testingUnitTestsJava">Writing Java Unit Tests</A></li>
</ul>
It can be very tempting to simply aggregate all of your unit tests into one function. However, this greatly reduces the utility of your tests. In our example above, we could easily combine all three test functions into a single function, testSaveAs(). Instead of having three tests, we now only have one. If any of the three behaviors are broken, all tests will fail. In larger scale testing, this composite testing methodology can lead to very confusing failure conditions, and it can become difficult to debug your testing code. The smaller and more atomic your tests become, the more obvious the failure point and probable cause generally are.
<ul>
<li>ALWAYS implement a tested version of the demonstration from the component specification.</li>
<li>ALWAYS provide a meaningful message in assert and fail calls.</li>
<li>ALWAYS document your test code as well as you document your component code.</li>
<li>Break up your tests into discrete TestCase classes. If one TestCase becomes unmanageable, don't hesitate to break it into two or more classes.</li>
<li>Break up your tests within those classes into the smallest functions possible; this way, it is clear which areas of the component are failing. You can then use the number of tests passing and failing as a completion metric, as well.</li>
<li>Reduce code duplication and increase robustness with setUp() and tearDown().</li>
<li>Test every public function for as much valid and invalid input as time allows.</li>
<li>Test expected component processes: loading, processing data, and saving data, for instance.</li>
<li>Don't forget to clean up your environment! Unit tests should leave the system in the same state they found it in; there should be no persistent changes. This is checked during development review.</li>
<li>Test classes are normal classes in every respect, except that they have special significance to the testing framework. These classes can inherit from a class intermediate between themselves and the final test. They may contain methods other than test methods. They may have state.</li>
<li>Because they are in the same package or namespace as the component classes they test, the unit tests can access package-private and protected classes and their members.</li>
<li>Interfaces cannot be tested directly, but methods that accept interface arguments can be presented with alternative implementations. This technique has great potential for verifying that the component does the expected things with and to its interface-typed fields and method arguments, and that it reacts correctly to exceptions thrown by methods invoked on such arguments.</li>
</ul>
Make sure you write a comprehensive unit testing suite. Inadequate tests can cost you dearly because there are several review line items pertaining to the unit test suite. Tests should cover all non-private methods thoroughly, and they should be well documented. Doing a good job on the tests can be a big win because the unit test suite is one of the areas that are more frequently neglected. 
<br><br>
<strong>Configuration information</strong><br>
If your test cases need to be configured, all of the configurable parameters must be documented.  The reviewers will need to tweak the test cases to their individual environments.  
<br><br>
<span class="bodySubtitle">Submission</span><br>
You will package your submission and upload the submission to Project, Submit and Review.  <span class="bigRed">Note: For the Online Review Application, you will email your submissions into TopCoder.</span> Your solution will be packaged based on the script attached with the distribution.  Please verify your deployment documentation and all source code is packaged in your submission.
<br><br>
<span class="bodySubtitle">Challenging Test Cases</span>
<br><br>
<strong>Test Case Appeal Response</strong><br>
The assembly competitors will have the opportunity to appeal your test cases.  They will document any instances where the test cases are incorrect.  Once the appeal is filed, you will have a chance to defend why you created and how you implemented the test case.  The competition manager will have final say on all test case challenges.
<br><br>
<span class="bodySubtitle">Review</span><br>
The submission is now out of your hands, and the Review Board will judge it on the scorecard which you can find <A href="/tc?module=Static&d1=dev&d2=testing&d3=sampleScorecard">here</A>.  Sit back, relax and wait for your chance to appeal the review.
<br><br>
<span class="bodySubtitle">Final Fixes</span><br>
Congratulations! You won the competition.
<br><br>
However, there is probably still work to be done. Your review scorecard will be available via Project Submit & Review, and there you will find any and all problems the Review Board found with your submission. It will contain required and recommended fixes to the submission as received.
<br><br>
<strong>Every single required fix must be addressed. Your application WILL NOT be completed until they are.</strong> Every recommended fix should be attempted. Obviously, they follow the required fixes in priority, but if there is time, they should be completed.
<br><br>
<strong>Communication</strong><br>
More than any stage of the component, communication during final fixes is key.
<br><br>
If, for any reason, you have a question or comment on the review, post it as soon as possible. If there is any blocking issue, email the PM immediately, and post to the forum. The PM will look into the issue, and ensure that the primary reviewer is on top of things. If, for whatever reason, you feel a required fix is impossible, you need to address it on the forums. Do NOT just resubmit without the fix done, or a comment in a readme. This is never acceptable. Communicate with the reviewers to avoid these conflicts! The more detail you can give, and the sooner you give it, the more smoothly this stage will go. The Review Board is always open to communication from the developer; they may have overlooked something in the design or in your submission. Don't be afraid to question the Review Board. Questions and comments show that you're paying attention and actively involved; without communication, the Review Board doesn't know that you're working on the fixes, and can't clarify their requirements.
<br><br>
Remember ALL test cases must successfully pass in order to complete final review!
<br><br>
<span class="bodySubtitle">Final Submission and Review</span><br>
This is just another submission as you did originally.  Follow the same guidelines above for ensuring all your files are uploaded properly. Try to be as complete as possible before resubmitting. This saves everyone time, including you.
<br><br>
If you've met all the requirements, and all the tests still pass, the assembly is complete, and goes into preparation for deployment. Your work is complete!
<br><br>
If anything is not done, you've earned a return trip to Final Fixes.
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

