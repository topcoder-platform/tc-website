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
        <jsp:param name="level2" value="topcoder"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

    <jsp:include page="page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Contest Overview"/>
    </jsp:include>

    <p>
        TopCoder has created Marathon Matches in effort to provide a competition format with an extended
        timeline that offers different types of problems than what can be offered in a traditional TopCoder
        algorithm round.
    </p>

    <p>
        In order to compete in a Marathon Match one must first register.  One may register at any time during
        the submission phase.  The submission phase will last for an extended period of time (a week for example).
        Competitors may read the problem statement and submit a solution at any time during the submission phase.
    </p>

    <p>
        When a submission is made, it is immediately compiled and put on a queue for system testing.  Unlike
        traditional algorithm competitions, the system is not necessarily testing for correctness.  In Marathon Matches,
        the scoring mechanism may be different for each problem.  A description of the scoring mechanism will be provided
        in the problem statement.  Competitors will have to understand the scoring mechanism in order to effectively compete.
        Once testing has completed, the competitor's score and rank will be made available on the website.  During the submission
        phase, score is the only piece of information that will be made available.
    </p>

    <p>
        In a Marathon Match, competitors are encouraged to improve their solution and resubmit.  Once a competitor
        submits, they have to wait 60 minutes before they can submit again.  The number of submissions is therefore only
        limited by how much time is available in the submission phase.  The most recent submission is the one that counts,
        so if a competitor makes a submission that does not score as well as a prior submission, the most recent is still
        the one that counts.
    </p>

    <p>
        Once the submission phase is over, more details will be made available on the website.  Competitors will be able
        to see the test cases, other competitors' submissions and results.
    </p>


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