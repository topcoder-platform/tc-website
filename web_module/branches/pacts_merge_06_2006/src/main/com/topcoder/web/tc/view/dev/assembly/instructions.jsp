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
      <jsp:param name="node" value="assembly_how_to_compete"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="assembly"/>
<jsp:param name="title" value="How to Compete"/>
</jsp:include>

<span class="bigTitle">How to Compete</span>
<br><br>
In order to participate in the Assembly Competitions, there are a few steps you need to follow:
<br><br>
<span class="bodySubtitle">Registration</span><br>
To sign up as a Team Captain or a Free Agent, send an email to <A href="mailto:AssemblyCompetitions@topcoder.com">AssemblyCompetitions@topcoder.com</A>.  In the email, include the following information:
<ul>
<li>Handle</li>
<li>First & Last Name</li>
<li>Position desired (Team Captain or Free Agent)</li>
<li>Team you wish to work with (Not necessary for Team Captains and Optional for Free Agents)</li>
<li>Percentage of team earnings desired</li>
   <ul>
   <li>Note that for the Time Tracker competition, all team members, including the Team Captain, will receive the same % of the prize money.</li>
   </ul>
</ul>
TopCoder staff will facilitate the team assignments and will communicate with you via email and in the forums.
<br><br>
<span class="bodySubtitle">Submitting code</span><br>
Once your team has working code you are ready to submit, you can do so by emailing your source code to <A href="mailto:AssemblyCompetitions@topcoder.com">AssemblySubmissions@topcoder.com</A> by the submission deadline.  Your team can submit code as many times as you wish before the submission deadline without any penalties.  The code that was last submitted before the deadline will be used as your final submission.
<br><br>
<span class="bodySubtitle">View competition standings</span><br>
To see the other teams that are competing, you can check the Active Contests page and click on Standings.  This will display a list of team names and what the status of their project is: Not Submitted, Submitted, Passed Screening, Failed Screening, Passed Review, or Failed Review.  
<br><br>
<span class="bodySubtitle">Competition results</span><br>
Once the competition is final, you can see the full list of results by checking the Active Contests page and clicking on Results.  This will show all teams who participated and their final score.  

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

