<%@ page language="java" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder Statistics</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="algo_recordbook"/>
    </jsp:include>
</td>


<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">

        <jsp:include page="../page_title.jsp">
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Algorithm Competition Record Book"/>
        </jsp:include>


        <table cellpadding="6" cellspacing="0" border="0">
            <tr valign="top">
                <td width="50%">
                    <strong>Consecutive Rating Increases</strong><br>
                    This chart represents the longest consecutive rating increase streaks.<br>
                    <a href="/stat?&amp;c=consecutive_rating_increases&amp;wst=3">SRMs</a> |
                    <a href="/stat?&amp;c=consecutive_rating_increases&amp;wst=4">SRMs and Tournaments</a>
                </td>
                <td width="50%">
                    <strong>Submission Accuracy</strong><br>
                    Submission Accuracy is measured by dividing the number of correct submissions by the number of total
                    submissions by a member<br>
                    <a href="/stat?&amp;c=highest_accuracy">Overall</a>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <strong>All-Time Room Wins</strong><br>
                    This chart ranks the Top-10 in Room Wins.<br>
                    <a href="/stat?&amp;c=all_time_wins">Overall</a> |
                    <a href="/stat?&amp;c=all_time_wins_by_div&amp;dn=1">Division I</a> |
                    <a href="/stat?&amp;c=all_time_wins_by_div&amp;dn=2">Division II</a>
                </td>
                <td>
                    <strong>Impressive Debuts</strong><br>
                    This chart represents the members who have made the most impressive debuts.<br>
                    <a href="/stat?&amp;c=impressive_debuts">Overall</a>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <strong>Highest Match Total</strong><br>
                    This chart represents the Top-10 highest point totals earned.<br>
                    <a href="/stat?&amp;c=highest_totals&amp;dn=1">Division I</a> |
                    <a href="/stat?&amp;c=highest_totals&amp;dn=2">Division II</a>
                </td>
                <td>
                    <strong>Consecutive Wins</strong><br>
                    This chart represents the longest consecutive room win streaks in Single Round Matches.<br>
                    <a href="/stat?&amp;c=most_consecutive_wins&amp;dn=1">Division I</a> |
                    <a href="/stat?&amp;c=most_consecutive_wins&amp;dn=2">Division II</a>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <strong>Rating Point Gain</strong><br>
                    This chart represents the biggest rating point gain.<br>
                    <a href="/stat?&amp;c=biggest_rating_gains&amp;dn=1">Division I</a> |
                    <a href="/stat?&amp;c=biggest_rating_gains&amp;dn=2">Division II</a>
                </td>
                <td>
                    <strong>Challenge Success</strong><br>
                    Challenge Success is a percentage based on successful challenges divided by total challenges.<br>
                    <a href="/stat?&amp;c=best_challengers">Overall</a>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <strong>Most Match Wins</strong><br>
                    This chart shows the coders with the most Single Round Match wins.<br>
                    <a href="/stat?c=division_wins&dn=1">Division I</a> |
                    <a href="/stat?c=division_wins&dn=2">Division II</a>
                </td>
                <td>
                    <strong>Challenge Success for a Single Match</strong><br>
                    This chart shows the coders that have gotten the most successful challenges in a single match.<br>
                    <a href="/stat?c=successful_challenges">Overall</a>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <strong>Most Rated Events</strong><br/>
                    This chart shows the coders that have participated in the most rated events.<br/>
                    <a href="/stat?c=rated_events">Overall</a>
                </td>
                <td>
                    <strong>Consecutive SRM Appearances</strong><br>
                    This chart represents the longest consecutive appearances in Single Round Matches.
                    It includes only rated events.<br>
                    <%-- we should probably change this so that all matches that didn't "fail" count --%>
                    <a href="/stat?&amp;c=consecutive_srm_appearances">Overall</a>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <strong>Most High Scores</strong><br/>
                    This chart shows the competitors that have gotten the highest score on a problem the most times.<br/>
                    <a href="/stat?c=most_best_score&amp;dn=1">Division I</a> |
                    <a href="/stat?c=most_best_score&amp;dn=2">Division II</a>
                </td>
                <td>
                </td>
            </tr>
        </table>

</div>

</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>















