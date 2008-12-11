<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder</title>
<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180" id="onLeft">
         <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="node" value="long_editorials"/>
         </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div class="bodyText" style="width: 100%; text-align: left;">

    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Match Editorials"/>
    </jsp:include>

<div style="float: right;" align="left"><A href="/longcontest/?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
<span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="515307" message="Discuss this match" />
</div>

<span class="bodySubtitle">TCO07 Round #1 / Marathon Match 13</span><br>03.7.2007 - 03.14.2007
<br><br>

<img src="/i/m/venco_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="274023" /><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<span class="bodySubtitle"><A href="/longcontest/?module=ViewProblemStatement&compid=6780&rd=10722">DensityImaging</A></span>
<br>
<p>Let’s try to look again what we have and what we need to calculate.</p>
<p>The test case generation procedure tends to generate mountains of about 8000 squares, densities of which we have to find. We are allowed to perform up to 10000 measures, so it seems 10000 points of data allow us to find 8000 of unknown variables. Unfortunately, there is noise which makes the problem much harder.</p>
<p>One possible way to solve it is to measure square cells one by one if it’s possible to direct a measuring ray through only one square. In this case the error due to noise has a very small effect because the signal is quite strong. This approach leads to the famous group of equal scores - 641.78. You can enhance this approach by allowing rays to go through previously determined cells. Unfortunately, in this case the error accumulates very quickly.  On top of this, the signal to noise ratio is decreased because the rays are passing through longer distances inside the mountain, so you cannot find all densities with this method.</p>

<p>So we have to think mathematically a bit before programming a code.</p>

<p>First, let’s recall how measure value is determined:<br>
(1)&#160;<img alt="" src="/i/longcontest/match_editorials/mm_13_tco07_rd_1/01.png" align="middle" style="padding: 10px"><br></p>

<p>where the signal is calculated as:<br>
(2)&#160;<img alt="" src="/i/longcontest/match_editorials/mm_13_tco07_rd_1/02.png" align="middle" style="padding: 10px"><br></p>

<p>The equation (2) is hard to deal with so let’s work with its logarithm instead and use a linear approximation, because the densities are small enough:<br>
(3)&#160;<img alt="" src="/i/longcontest/match_editorials/mm_13_tco07_rd_1/03.png" align="middle" style="padding: 10px"><br></p>

<p>On the other hand, from (1) we can approximate the logarithm of the signal as<br>
(4)&#160;<img alt="" src="/i/longcontest/match_editorials/mm_13_tco07_rd_1/04.png" align="middle" style="padding: 10px"><br></p>

<p>And finally we can determine the value of error from measures and densities:<br>
(5)&#160;<img alt="" src="/i/longcontest/match_editorials/mm_13_tco07_rd_1/05.png" align="middle" style="padding: 10px"><br></p>

<p>The noise added has Gaussian distribution: <br>
(6)&#160;<img alt="" src="/i/longcontest/match_editorials/mm_13_tco07_rd_1/06.png" align="middle" style="padding: 10px"><br></p>

<p>Since errors of different measures are independent we can easily find the combined probability of all measured errors by multiplying probabilities of individual ones:<br>
(7)&#160;<img alt="" src="/i/longcontest/match_editorials/mm_13_tco07_rd_1/07.png" align="middle" style="padding: 10px"><br></p>

<p>We are trying to find most probable set of densities for the observed measures, so the result should minimize the sum:<br>
(8)&#160;<img alt="" src="/i/longcontest/match_editorials/mm_13_tco07_rd_1/08.png" align="middle" style="padding: 10px"><br></p>

<p>Now, how do we take into account that not all sets of densities are equally probable?</p>
<p>The blurring process makes a cell density to be closer to densities of neighbor cells. So it looks reasonable to check how a cell value differs from the average of its neighbors, for simplicity only 4 nearest ones.</p>
<p>Let’s consider the densities after just one blurring process.</p>
<p>The cell density in terms of original independent random values is equal to:<br>
(9)&#160;<img alt="" src="/i/longcontest/match_editorials/mm_13_tco07_rd_1/09.png" align="middle" style="padding: 10px"><br></p>

<p>The average density of its neighbors is:<br>
(10)&#160;<img alt="" src="/i/longcontest/match_editorials/mm_13_tco07_rd_1/10.png" align="middle" style="padding: 10px"><br></p>

<p>The difference is equal to a weighted sum of independent initial values:<br>
(11)&#160;<img alt="" src="/i/longcontest/match_editorials/mm_13_tco07_rd_1/11.png" align="middle" style="padding: 10px"><br></p>

<p>The average value of the difference is zero, and its distribution is a bit closer to the normal distribution by Central Limit Theorem, because this difference is sum of several independent random values. The number of independent variables in the sum is even bigger for higher number of blurs. So it seems reasonable to approximate those differences as some Gaussian random numbers with some variance depending on number of blurring steps.</p>

</p>We can include probabilities of those differences in the equation of total probability (7) and find that instead of (8) we have to minimize a bit bigger sum:<br>
(12)&#160;<img alt="" src="/i/longcontest/match_editorials/mm_13_tco07_rd_1/12.png" align="middle" style="padding: 10px"><br></p>

<p>where the Const is determined by the number of blurring steps, and errors are calculated from cells’ densities and measures using (5).</p>

<p>So we have to minimize a quadratic function of about 8000 variables. This can be done by differentiation and solving a set of 8000 linear equations, but I decided that it’s impossible to do it this way in a given memory and time constraints, so I chose to use gradient descent instead.</p>

<p>Now, as we have a good function to minimize, independent of a strategy of measures, we can freely choose the rays to cover the mountain as uniformly as possible. I decided to run sets of uniformly spaced parallel rays at different angles. My tests have also shown that it’s better to skip rays passing through small number of cells in favor of more various angles to use.</p>

<p>The constant in (12) is defined by number of blurring steps used in test case generation. Unfortunately we don’t know this number, although we can try to guess it looking at statistics. This is a weak part of my solution, because I didn’t find a reliable way to do it. Anyway, what I did is to look at correlation between measures along parallel rays with small distance. The examples with high number of blurring steps tend to be smoother, and nearby regions tend to have similar densities. The most reliable scans are horizontal and vertical, as they pass through regular and non-overlapping bands of squares, so I did them first, also doing two measures along them to reduce the effect of noise. If the correlation is very small my code decides that only one blurring step was used and switches to one measure along each line at the very beginning to gather more information under various angles. Otherwise, I keep measuring 2 times along each line to better estimate the number of blurring steps before the minimization step.</p>
<br><br>
</p>
   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170" id="onRight">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>
</body>
</html>