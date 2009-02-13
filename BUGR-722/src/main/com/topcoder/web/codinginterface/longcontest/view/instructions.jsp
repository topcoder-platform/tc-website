<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
<jsp:include page="script.jsp" />
<jsp:include page="style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
  <jsp:include page="includes/global_left.jsp">
      <jsp:param name="node" value="long_how_to_compete"/>
  </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div style="width: 500px; text-align: left;">

<div align="center" style="padding-top: 15px;"><img src="/i/longcontest/banner.jpg" alt="TopCoder Marathon Matches" border="0" /></div>
<br><br>
TopCoder has created Marathon Matches in an effort to provide a more flexible competition format with an extended timeline that offers different types of problems than what can be offered in a traditional TopCoder algorithm round.  
<br><br>
<span class="bodySubtitle">Instructions</span>
<br><br>
<strong>Registration</strong><br>
In order to compete in a Marathon Match one must first register. One may register at any time during the submission phase. The submission phase will last for an extended period of time (a week for example). In order to register, you will need to click Register next to the appropriate Marathon Match within the <A href="/longcontest">Active Contests</A> list, agree to the rules of the event and you may need to answer a survey question.  Once registered, you may view the problem statement for the Marathon Match by clicking the Problem Name from within the Active Contests list.  During the submission phase, problem statements will only be made available to members who are registered for that specific event.
<br><br>
<strong>Submitting a solution</strong><br>
Unlike traditional algorithm competitions, the system is not necessarily testing for correctness. In Marathon Matches, the scoring mechanism may be different for each problem. A description of the scoring mechanism will be provided in the problem statement. Competitors will have to understand the scoring mechanism in order to effectively compete. 
<br><br>
All members registered for a specific Marathon Match will see a Submit option for that event. Clicking the Submit link will take you to a page that will allow you to paste in a solution, select the proper language and either submit (for compilation and testing) or save your code. When the Submit button is selected, the code will be immediately compiled. Any compilation messages or errors will be shown in the Messages Area. If the compilation was successful, the submission will then be placed on a queue for automated testing. Example test cases will not be tested. When your submission has been processed, you will receive an email indicating such and your place in the standings will be adjusted accordingly. During the submission phase, overall ranking and provisional score are the only pieces of information that will be made available. A given competitor will only be allowed to submit once every 4 hours.  Additionally, if a competitor has a pending submission on the testing queue it must finish testing before they may submit again.
<br><br>
Clicking the Test Examples button will immediately compile and place your submission on a queue for automated testing of just the example test cases. Detailed feedback will be made available when the tests are complete, including processing time, score, and any output from the program. Competitors may submit test examples once every 30 minutes. The competitor's rank and overall score will not be updated.
<br><br>
In a Marathon Match, all competitors are encouraged to improve their solutions and resubmit iteratively throughout the length of the submission phase.  The most recent submission is always the one that counts, so if you make a submission that does not score as well as a prior submission, the most recent will still be the one that counts in the standings. Participants may submit code written in one of the following languages: Java, C++, C#.NET, VB.NET, or Python.
<br><br>
<strong>System Testing</strong><br>
After a match completes all full submissions will be placed on a queue for automated system testing.  During system tests, each submission will be run against a larger set of test cases and be issued a final score. Only this final score will be used to determine final rankings.
<br><br>
<strong>Viewing match standings</strong><br>
At any time during a Marathon Match event, TopCoder members may view the latest standings of that event. This will show the current rank and provisional score (for the latest submission) for each member who has registered for that event and the number of submissions they have performed during the event. Clicking on the submission count will display the date,  and time of each submission for a given participant.
<br><br>
<strong>Match results</strong><br>
Once the submission phase of a Marathon Match has ended, the final results will become available by clicking the Results link.  Competitors will be able to see the test cases, other competitors' submissions, and results.
<br><br>

   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<jsp:include page="foot.jsp"/>
</body>
</html>