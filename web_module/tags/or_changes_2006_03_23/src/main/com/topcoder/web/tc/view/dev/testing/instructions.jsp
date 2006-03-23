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
      <jsp:param name="node" value="testing_how_to_compete"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="testing"/>
<jsp:param name="title" value="How to Compete"/>
</jsp:include>

<span class="bigTitle">How to Compete</span>
<br><br>
In order to participate in the Testing Competitions, there are a few steps you need to follow:
<br><br>
<span class="bodySubtitle">Registration</span><br>
To sign up as a participant, send an email to <A href="mailto:TestingCompetitions@topcoder.com">TestingCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Name of Testing Competition in which you would like to participate</li>
</ul>
TopCoder staff will respond as to whether you are registered or not.
<br><br>
<span class="bodySubtitle">Submitting test code</span><br>
Once you have test code you are ready to submit, you can do so by emailing your source code to <A href="mailto:TestingSubmissions@topcoder.com">TestingSubmissions@topcoder.com</A> by the submission deadline.  Once a submission is received, it will be screened.  All code that passes screening will be made available to the Assembly Competition teams.
<br><br>
<span class="bodySubtitle">View your code status</span><br>
To see the status of your submitted code, you can check the Active Contests page and click on Standings.  This will display a list of participant names and what the status of their code is: Not Submitted, Submitted, Passed Screening, Failed Screening, Passed Review, or Failed Review.  
<br><br>
<span class="bodySubtitle">Competition results</span><br>
Once the competition is final, you can see the full list of results by checking the Active Contests page and clicking on Results.  This will show all participants and their final score.  
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

