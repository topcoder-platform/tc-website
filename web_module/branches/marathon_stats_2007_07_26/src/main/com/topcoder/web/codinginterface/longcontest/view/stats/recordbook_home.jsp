<%@ page language="java" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="long_recordbook"/>
    </jsp:include>
</td>


<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">

        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Marathon Competition Record Book"/>
        </jsp:include>


        <table cellpadding="6" cellspacing="0" border="0">
            <tr valign="top">
                <td width="50%">
                    <strong>Consecutive Rating Increases</strong><br>
                    Most rating increases in a row.  If a competitors rating does not change, their streak is broken.
                    <br>
                    <a href="/longcontest/?module=Recordbook&c=marathon_consecutive_rating_increases&amp;wst=8">Non-Tournament</a> |
                    <a href="/longcontest/?module=Recordbook&c=marathon_consecutive_rating_increases&amp;wst=9">all</a>
                </td>
                <td width="50%">
                    <strong></strong><br>
                    <br>
                    <a href="/longcontest/?module=Recordbook&c=">Overall</a> 
                
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <strong>Most Match Wins</strong><br>
                    The number of times a competitors has won a match.  A tie for first place is considered a win.
                    <br>
                    <a href="/longcontest/?module=Recordbook&c=marathon_most_wins">Non-Tournament</a> |
                    <a href="/longcontest/?module=Recordbook&c=marathon_most_wins&amp;all=true">all</a>
                </td>
                <td>
                    <strong></strong><br>
                    <br>
                    <a href="/longcontest/?module=Recordbook&c=">Overall</a>                 
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <strong>Rating Point Gain</strong><br>
                    Largest rating point gain in a single match.
                    <br>
                    <a href="/longcontest/?module=Recordbook&c=marathon_highest_rating_gain">Overall</a> 
                </td>
                <td>
                    <strong></strong><br>
                    <br>
                    <a href="/longcontest/?module=Recordbook&c=">Overall</a> 
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <strong>Most Rated Events</strong><br>
                    The competitors that have participated in the greatest number of rated events.
                    <br>
                    <a href="/longcontest/?module=Recordbook&c=marathon_most_rated_events">Overall</a> 
                </td>
                <td>
                    <strong></strong><br>
                    <br>
                    <a href="/longcontest/?module=Recordbook&c=">Overall</a> 
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <strong></strong><br>
                    <br>
                    <a href="/longcontest/?module=Recordbook&c=">Overall</a> 
                </td>
                <td>
                    <strong></strong><br>
                    <br>
                    <a href="/longcontest/?module=Recordbook&c=">Overall</a> 
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <strong></strong><br>
                    <br>
                    <a href="/longcontest/?module=Recordbook&c=">Overall</a> 
                </td>
                <td>
                    <strong></strong><br>
                    <br>
                    <a href="/longcontest/?module=Recordbook&c=">Overall</a> 
                </td>
            </tr>
        </table>
</table>

</div>

</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="/public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>















