<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Software Testing Competitions</title>
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
      <jsp:param name="node" value="testing_overview"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<div align="center" style="margin-bottom: 10px;">
<img src="/i/development/testing/banner.jpg" alt="TopCoder Software Testing Competitions" />
</div>
<span class="bigTitle">Overview</span>
<br><br>
TopCoder has created Testing Competitions to go hand-in-hand with the Assembly Competitions.  Through these competitions, participants will create high quality test code that will be used to ensure that the submissions received during each Assembly Competition meets the specified requirements and functionality.  
<br><br>
The competition will have the following phases:
<br><br>
<div align="center">
<div align="left" style="width: 200px; padding:10px; background:#EEEEEE; border: 1px solid #999999;">
<strong>
Phases:
<hr>
<A href="#contest_posting">Contest Posting</A><br>
<A href="#registration">Registration</A><br>
<A href="#competition">Competition</A><br>
<A href="#review">Review</A><br>
</strong>
</div>
</div>
<br><br>
<A name="contest_posting"></A>
<span class="bodySubtitle">Contest Posting</span><br>
Each Testing Competition will coincide with an Assembly Competition.  TopCoder will post the competition details and timeframe for both competitions on its website, as well as the specification and architecture deliverables that apply to both competitions.  Members interested in competing in the Testing Competition should read through the documentation and decide whether or not to register.
<br><br>
<A name="registration"></A>
<span class="bodySubtitle">Registration</span><br>
Click <A href="/tc?module=Static&d1=dev&d2=testing&d3=instructions">here</A> for details about registering for a Testing Competition.  Registration will remain open until either the competition deadline has passed or there have been the requisite number of submissions that pass screening, whichever comes first.
<br><br>
<div align="right"><A href="/tc?module=Static&d1=features&d2=071006"><img src="/i/development/testing/learn_more.gif" alt="Want to Learn More?" border="0" /></A></div>

<A name="competition"></A>
<span class="bodySubtitle">Competition</span><br>
The Competition phase consists of registrants creating test code that checks certain functionality requirements in the specific application being built in the Assembly Competition.  TopCoder will break up the application functionality into logical test case competitions.  Prizes will be assigned for first and second place per test case contest.  The prize purse for each Testing Competition will be based on the complexity and number of test case scenarios.  Each Testing Competition will consist of the test case scenarios focusing on specific areas of the application.  Each test case scenario will map to a use case.  The end result of this phase is a test code that will be run against submissions in the corresponding Assembly Competition.
<br><br>
Participants will be granted access to a private forum for each Testing Competition.  This forum will be monitored by TopCoder staff who will answer any and all technical questions in the forum.  	
<br><br>
Once a participant has submitted their code, it will be automatically screened to enforce coding standards.  Additional manual screening by a reviewer will be used to check the completeness of the test cases.  A reviewer will screen on a per submission basis.  When a submission is made, it will generate an open screening position that will be immediately filled by a qualified reviewer, who will then screen the submission.  Once four submissions for each test case scenario have passed the initial screening, no other submissions will be allowed.  
<br><br>
<span class="bigRed">NOTE:  For the Online Review Application, submissions will be taken based on a certain length of time from the start of the Competition phase and NOT on the number of submissions that pass the initial screening.</span>
<br><br>
Once a submission has passed screening, the Assembly Competition teams will be allowed to download the test code.  Testing Competition participants need to be available to provide answers to questions from the Assembly Competition teams regarding the test code.  Testing Competition participants are not eligible to compete in the corresponding Assembly Competition.
<br><br>
<A name="review"></A>
<span class="bodySubtitle">Review</span><br>
At the end of the corresponding Assembly Competition, all of the test case scenario submissions that passed screening will be fully reviewed.
<br><br>
Any of the Assembly Competition teams can challenge the validity of any test code.  A TopCoder Project Manager and Architect will review the challenge and will decide whether the test code is valid or invalid.  No invalid test code will be used.
<br><br>
The Testing competitions will be graded based on how well they meet the criteria set forth in the scorecard, including code coverage, number of test cases created, number of identified bugs, etc.  Be sure to review the <A href="/tc?module=Static&d1=dev&d2=testing&d3=sampleScorecard">scorecard</A> beforehand to see exactly what the criteria are.  
<br><br>
The first and second place finishers for each test competition will win prize money.
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

