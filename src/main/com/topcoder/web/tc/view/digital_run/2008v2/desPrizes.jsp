<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<title>TopCoder - The Digital Run</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="digitalrun"/>
</jsp:include>
<jsp:include page="../../script.jsp" />
</head>
<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<!-- centerer -->
<div align="center">

    <!-- spacer -->
    <div id="pageSpacer">

<jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="design"/>
    <jsp:param name="tabLev2" value="prizes"/>
</jsp:include>

<span class="title">Prizes</span>
<br /><br />
The Prize Pool for the Design Cup will grow with every competition posted within that month's timeframe. TopCoder will set a guaranteed minimum Prize Pool of $10,000 for the Design Cup per month (the pool will never be less than that amount). Every contest launched has a specific amount of points associated to it. Each point adds $1 to the Design Cup Prize Pool. For example, if we launch a component design competition on July 12, 2009 with 800 Digital Run points then TopCoder will add $800 to the Design Cup for July 2009. The more contests we launch, the larger the Design Cup Prize Pool will grow.
<br /><br />
For each month, competitors will accumulate placement points according to the points table. In addition to the competition prize earnings, the top five (5) finishers will win large prizes and the top 1/2 of the point-getters in each month will receive a smaller prize. A total of 50% of the total Design Cup prize pool will be awarded in bonus prizes each month and will be distributed as follows: 
<br /><br />
<strong>Top Five Monthly Prizes</strong><br />
<strong>1st</strong> - 50%<br />
<strong>2nd</strong> - 25%<br />
<strong>3rd</strong> - 13%<br />
<strong>4th</strong> - 8%<br />
<strong>5th</strong> - 4%
<br /><br />
If there is a tie for a position among the top 5 finishers, the tie will be resolved in the following manner (in order):
<ol>
<li>The competitor who has the most higher-placed submissions in the month.</li>
<li>If a tie still remains, then the competitor with the highest average individual competition score of the lesser number of competitions used to develop the placement scores for the tied competitors.</li>
<li>If a tie still remains, then the tied competitors will share equally the prize money at hand.</li>
</ol>
<strong>Top Half Monthly Prizes</strong><br />
The remaining 50% of the Design Cup prize pool will be distributed among the top 1/2 of point-getters (all competitors tied for the last spot will be included) and will be allocated based on the value of each placement point.
<br /><br />
<%--
<strong>For example:</strong><br />
A total of 120 designers accumulate placement points during the Stage. We will sum the total number of placement points accumulated by the top 60 designers and divide $100,000 by that number to find the dollar per placement point bonus that is available to those 60 designers. If the total placement points of those 60 designers are 5,000, then each point is worth $20 ($100,000/5,000 = $20 per placement point). Each of the top 60 designers, including the top 5, will receive $20 for each placement point they earned during the Stage. In addition, the top 5 point-getters in each Stage will receive the Top Five Stage prizes outlined above.
<br /><br />
--%>
As an added prize, the top point-getter of each month starting in January, 2009 and ending in August, 2009 will win a trip to the 2010 TCO finals to be recognized at the Awards Ceremony. 
<br /><br />
Digital Run prize money will be paid at the end of each month within 60 days of announcing the Top Five and Top Half money winners.
<br /><br />

    </div>
</div>

<jsp:include page="../../foot.jsp" />

</body>

</html>