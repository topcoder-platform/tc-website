<%@ page language="java" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder Statistics</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

    <c:if test="${not empty isNewStyle && isNewStyle}">
        <jsp:include page="/script.jsp" />
    </c:if>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="mainContent">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="../includes/global_left.jsp">
        <jsp:param name="node" value="comp_recordbook"/>
    </jsp:include>
</td>


<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
    <div align="center">

        <div class="fixedWidthBody">

            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="statistics_w"/>
                <jsp:param name="title" value="Component Competition Record Book"/>
            </jsp:include>


            <table cellpadding="0" cellspacing="0" border="0" class="recordBook">
                <tr valign="top">
                    <td width="50%" style="padding-right:10px;">

                        <strong>Best Component Challenge Winning Percentage</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=win_percentage&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=win_percentage&type=development">development</A> |
                        <A href="/tc?module=ComponentRecordbook&c=win_percentage&type=component">overall</A>

                        <br><br>

                        <strong>Best Average Component Challenge Placement</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=avg_placement&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=avg_placement&type=development">development</A> |
                        <A href="/tc?module=ComponentRecordbook&c=avg_placement&type=component">overall</A>

                        <br><br>

                        <strong>Best Average Component Challenge Score</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=avg_score&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=avg_score&type=development">development</A> 
                        <br><br>

                        <strong>Most Component Challenge Wins</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=most_wins&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=most_wins&type=development">development</A> |
                        <A href="/tc?module=ComponentRecordbook&c=most_wins&type=component">overall</A>

                        <br><br>

                        <strong>Highest Component Challenge Scores</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=high_scores&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=high_scores&type=development">development</A> |
                        <A href="/tc?module=ComponentRecordbook&c=high_scores&type=component">overall</A>

                        <br><br>

                        <strong>Most Component Challenge Submissions</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=most_submissions&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=most_submissions&type=development">development</A> |
                        <A href="/tc?module=ComponentRecordbook&c=most_submissions&type=component">overall</A>

                        <br><br>

                        <strong>Most Component Reviews</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=most_reviews&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=most_reviews&type=development">development</A> |
                        <A href="/tc?module=ComponentRecordbook&c=most_reviews&type=component">overall</A>

                        <br><br>

                        <strong>Most Submission Reviews</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=most_submissions_reviews&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=most_submissions_reviews&type=development">development</A> |
                        <A href="/tc?module=ComponentRecordbook&c=most_submissions_reviews&type=component">overall</A>

                        <br><br>

                        <strong>Highest Rating Point Gain</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=highest_rating_gains&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=highest_rating_gains&type=development">development</A>
                    </td>
                    <td width="50%" style="padding-left:10px;">

                        <strong>Highest Component Challenge Overall Earners</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=overall_money">overall</A>

                        <br><br>

                        <strong>Highest Component Challenge Prize Earners</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=component_money&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=component_money&type=development">development</A> |
                        <A href="/tc?module=ComponentRecordbook&c=component_money&type=component">overall</A>

                        <br><br>

                        <strong>Highest Component Challenge Royalty Earners</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=royalties">overall</A>

                        <br><br>

                        <strong>Largest Single Component Challenge Prizes</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=largest_comp_prize&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=largest_comp_prize&type=development">development</A> |
                        <A href="/tc?module=ComponentRecordbook&c=largest_comp_prize&type=component">overall</A>

                        <br><br>

                        <strong>Highest Component Tournament Winnings</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=tournament_money&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=tournament_money&type=development">development</A> |
                        <A href="/tc?module=ComponentRecordbook&c=tournament_money&type=component">overall</A>

                        <br><br>

                        <strong>Highest Appeal Success Percentage</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=appeal_percentage&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=appeal_percentage&type=development">development</A> |
                        <A href="/tc?module=ComponentRecordbook&c=appeal_percentage&type=component">overall</A>

                        <br><br>

                        <strong>Impressive Debuts</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=impressive_debut&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=impressive_debut&type=development">development</A> 
                        <br><br>

                        <strong>Consecutive Wins</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=consecutive_winnings&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=consecutive_winnings&type=development">development</A>
                        <br><br>

                        <strong>Consecutive Top 2 finishes</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=consecutive_paid&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=consecutive_paid&type=development">development</A> 
                        <br><br>

                        <strong>Consecutive Rating Increase</strong><br>
                        <A href="/tc?module=ComponentRecordbook&c=consecutive_rating_increase&type=design">design</A> |
                        <A href="/tc?module=ComponentRecordbook&c=consecutive_rating_increase&type=development">development</A>
                    </td>
                </tr>
            </table>

        </div>
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















