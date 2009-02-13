<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - The Digital Run</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../../script.jsp" />
</head>
<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="digital_run"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="digital_run_20061031"/>
<jsp:param name="title" value="2008 Design Cup Series"/>
</jsp:include>

<jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="design"/>
    <jsp:param name="tabLev2" value="prizes"/>
</jsp:include>

<span class="title">Prizes</span>
<br /><br />
For each Stage, competitors will accumulate placement points according to the <A href="/tc?module=Static&d1=digital_run&d2=2008&d3=desOverview">points table</A>. In addition to the component earnings, the top five (5) finishers will win large prizes and the top 1/2 of the point-getters in each Stage will receive a smaller prize. A total of $205,000 will be awarded in bonus prizes each Stage and will be distributed as follows:
<br /><br />
<strong>Top Five Stage Prizes</strong><br />
<strong>1st</strong> - $50,000<br />
<strong>2nd</strong> - $25,000<br />
<strong>3rd</strong> - $15,000<br />
<strong>4th</strong> - $10,000<br />
<strong>5th</strong> - $5,000
<br /><br />
If there is a tie for a position among the top 5 finishers, the tie will be resolved in the following manner (in order):
<ol>
<li>The competitor who has the most higher-placed submissions in the Stage.</li>
<li>If a tie still remains, then the competitor with the highest average individual component score of the lesser number of components used to develop the placement scores for the tied competitors.</li>
<li>If a tie still remains, then the tied competitors will share equally the prize money at hand.</li>
</ol>
<strong>Top Half Stage Prizes</strong><br />
The remaining $100,000 will be distributed among the top ½ of point-getters (all competitors tied for the last spot will be included) and will be allocated based on the value of each placement point.
<br /><br />
<strong>For example:</strong><br />
A total of 120 designers accumulate placement points during the Stage. We will sum the total number of placement points accumulated by the top 60 designers and divide $100,000 by that number to find the dollar per placement point bonus that is available to those 60 designers. If the total placement points of those 60 designers are 5,000, then each point is worth $20 ($100,000/5,000 = $20 per placement point). Each of the top 60 designers, including the top 5, will receive $20 for each placement point they earned during the Stage. In addition, the top 5 point-getters in each Stage will receive the Top Five Stage prizes outlined above.
<br /><br />
As an added prize, the top three (3) point-getters from each Stage will win a trip to the 2009 TCO finals to be recognized. At the TCO awards presentation, the overall highest point-getter for the entire year will be recognized as the winner of the TopCoder&#174; Design Cup.
<br /><br />
Digital Run prize money will be paid at the end of each Stage within 60 days of announcing the Top Five and Top Half money winners.
<br /><br />
</div>

</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>