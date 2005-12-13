<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="level1" value="long_contests"/>
        <jsp:param name="level2" value="how_to_compete"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div style="width: 500px; text-align: left;">

<div align="center" style="padding-top: 15px;"><img src="/i/longcontest/banner.jpg" alt="TopCoder Marathon Matches" border="0" /></div>
<br><br>
<span class="bigTitle">Instructions</span>
<br><br>
TopCoder has created Marathon Matches in an effort to provide a more flexible competition format with an extended timeline that offers different types of problems than what can be offered in a traditional TopCoder algorithm round.  
<br><br>
<strong>Registration</strong><br>
In order to compete in a Marathon Match one must first register. One may register at any time during the submission phase. The submission phase will last for an extended period of time (a week for example). In order to register, you will need to click Register next to the appropriate Marathon Match within the Active Contests list, agree to the <A href="/longcontest/?module=Static&d1=rules">rules</A> of the event and you may need to answer a survey question.  Once registered, you may view the problem statement for the Marathon Match by clicking the Problem Name from within the Active Contests list.  During the submission phase, problem statements will only be made available to members who are registered for that specific event.
<br><br>
<strong>Submitting a solution</strong><br>
All members registered for a specific Marathon Match will see a Submit option for that event.  When a submission is made, it is immediately compiled and put on a queue for system testing. Unlike traditional algorithm competitions, the system is not necessarily testing for correctness. In Marathon Matches, the scoring mechanism may be different for each problem. A description of the scoring mechanism will be provided in the problem statement. Competitors will have to understand the scoring mechanism in order to effectively compete. Once testing has completed, the competitor's score and rank will be made available on the website. During the submission phase, score is the only piece of information that will be made available.
<br><br>
In a Marathon Match, competitors are encouraged to improve their solution and resubmit. Once a competitor submits, they have to wait 60 minutes before they can submit again. The number of submissions is therefore only limited by how much time is available in the submission phase. The most recent submission is the one that counts, so if a competitor makes a submission that does not score as well as a prior submission, the most recent is still the one that counts.  Participants may submit code written in one of the following languages: Java, C++, C# .Net, or VB .Net.
<br><br>
<strong>Viewing match standings</strong><br>
At any time during a Marathon Match, TopCoder members may view the latest standings of that event.  This will show the current score (for the latest submission) for each member who has registered for that Marathon Match, their rank, and the number of submissions they have performed during the Marathon Match.  Clicking on the submission count will display the date, time, and score of each submission for a given participant.
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
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<jsp:include page="foot.jsp"/>
</body>
</html>