<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
</head>

<body>

<div align="center">
    <div id="content">

        <jsp:include page="top.jsp"/>

        <jsp:include page="primaryNav.jsp">
            <jsp:param name="selectedTab" value="leaderboardOverview"/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Series Prizes</span>
            </div>

<h3>Placement Points</h3>
<p>
Each mashup posted during the Connected Services Framework Competition Series Creative Mashup Design Competitions will carry a point value of up to 500 placement points. Placement Points will be awarded as follows:
</p>
 
<div align="center" style="margin-bottom: 10px;">
<table cellpadding="2" cellspacing="0">
<tbody>
    <tr>
        <td align="right" width="50%">
            <strong>1st</strong>
        </td>
        <td width="50%">
            235
        </td>
    </tr>
    <tr>
        <td align="right">
            <strong>2nd</strong>
        </td>
        <td>
            130
        </td>
    </tr>
    <tr>
        <td align="right">
            <strong>3rd</strong>
        </td>
        <td>
            75
        </td>
    </tr>
    <tr>
        <td align="right">
            <strong>4th</strong>
        </td>
        <td>
            30
        </td>
    </tr>
    <tr>
        <td align="right">
            <strong>5th</strong>
        </td>
        <td>
            15
        </td>
    </tr>
    <tr>
        <td align="right">
            <strong>6th</strong>
        </td>
        <td>
            10
        </td>
    </tr>
    <tr>
        <td align="right">
            <strong>7th</strong>
        </td>
        <td>
            5
        </td>
    </tr>
</tbody>
</table>
</div>
 
<p>
If more than seven (7) submissions pass screening, the competitors who place in 8th position or below will not receive any placement points.
</p>
 
<h3>Prizes</h3>
<p>
During the competition series, competitors will accumulate placement points according to the points table above. In addition to the individual competition earnings, the top five (5) finishers in the series will win cash prizes. A total of $40,000 will be awarded in additional prizes for the Connected Services Framework Competition Series Creative Mashup Design Competitions and will be distributed as follows: 
</p> 

<div align="center" style="margin-bottom: 10px;">
<table cellpadding="2" cellspacing="0">
<tbody>
    <tr>
        <td align="center" colspan="2">
            <strong>Top Five Series Prizes</strong>
        </td>
    </tr>
    <tr>
        <td align="right" width="40%">
            <strong>1st</strong>
        </td>
        <td width="60%">
            $20,000
        </td>
    </tr>
    <tr>
        <td align="right">
            <strong>2nd</strong>
        </td>
        <td>
            $10,000
        </td>
    </tr>
    <tr>
        <td align="right">
            <strong>3rd</strong>
        </td>
        <td>
            $5,000
        </td>
    </tr>
    <tr>
        <td align="right">
            <strong>4th</strong>
        </td>
        <td>
            $3,000
        </td>
    </tr>
    <tr>
        <td align="right">
            <strong>5th</strong>
        </td>
        <td>
            $2,000
        </td>
    </tr>
</tbody>
</table>
</div>

<p>
If there is a tie for a position among the top 5 finishers, the tie will be resolved in the following manner (in order): 
</p>

<ol>
<li>The competitor who has the most higher-placed submissions in the Series.</li>
<li>If a tie still remains, then the tied competitors will share equally the prize money at hand.</li>
</ol>

        </div>

        <jsp:include page="foot.jsp"/>
    </div>
</div>

</body>
</html>