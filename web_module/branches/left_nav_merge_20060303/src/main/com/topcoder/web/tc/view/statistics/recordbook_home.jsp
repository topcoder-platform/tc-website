<%@ page language="java"
         import="com.topcoder.shared.dataAccess.resultSet.*" %>

<%@ page import="java.util.Iterator" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
<jsp:include page="/script.jsp" />
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
        <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

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
Submission Accuracy is measured by dividing the number of correct submissions by the number of total submissions by a member<br>
<a href="/stat?&amp;c=highest_accuracy">Overall</a>
</td>
</tr>
<tr valign="top">
<td>
<strong>All-Time Wins</strong><br>
This chart ranks the Top-10 in Wins.<br>
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
</table>



<%--
<table cellpadding="0" cellspacing="0" border="0">
<tr valign="top">
<td width="50%" style="padding-right:10px;">

<strong>Consecutive Rating Increases</strong><br>
This chart represents the longest consecutive rating increase streaks.<br>
<a href="/stat?&amp;c=consecutive_rating_increases&amp;wst=3">SRMs</a> | 
<a href="/stat?&amp;c=consecutive_rating_increases&amp;wst=4">SRMs and Tournaments</a>

<br><br>

<strong>All-Time Wins</strong><br>
This chart ranks the Top-10 in Wins.<br>
<a href="/stat?&amp;c=all_time_wins">Overall</a> | 
<a href="/stat?&amp;c=all_time_wins_by_div&amp;dn=1">Division I</a> | 
<a href="/stat?&amp;c=all_time_wins_by_div&amp;dn=2">Division II</a>

<br><br>

<strong>Highest Match Total</strong><br>
This chart represents the Top-10 highest point totals earned.<br>
<a href="/stat?&amp;c=highest_totals&amp;dn=1">Division I</a> | 
<a href="/stat?&amp;c=highest_totals&amp;dn=2">Division II</a>

<br><br>

<strong>Rating Point Gain</strong><br>
This chart represents the biggest rating point gain.<br>
<a href="/stat?&amp;c=biggest_rating_gains&amp;dn=1">Division I</a> | 
<a href="/stat?&amp;c=biggest_rating_gains&amp;dn=2">Division II</a>

</td>
<td width="50%" style="padding-left:10px;">

<strong>Submission Accuracy</strong><br>
Submission Accuracy is measured by dividing the number of correct submissions by the number of total submissions by a member<br>
<a href="/stat?&amp;c=highest_accuracy">Overall</a>

<br><br>

<strong>Impressive Debuts</strong><br>
This chart represents the members who have made the most impressive debuts.<br>
<a href="/stat?&amp;c=impressive_debuts">Overall</a>

<br><br>

<strong>Consecutive Wins</strong><br>
This chart represents the longest consecutive room win streaks in Single Round Matches.<br>
<a href="/stat?&amp;c=most_consecutive_wins&amp;dn=1">Division I</a> | 
<a href="/stat?&amp;c=most_consecutive_wins&amp;dn=2">Division II</a>

<br><br>

<strong>Challenge Success</strong><br>
Challenge Success is a percentage based on successful challenges divided by total challenges.<br>
<a href="/stat?&amp;c=best_challengers">Overall</a>
</td>
</tr>
</table>
--%>
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















