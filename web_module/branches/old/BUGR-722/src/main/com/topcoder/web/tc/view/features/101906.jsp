<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
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
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>


<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="506150" message="Discuss this article" />
</div>

<span class="bigTitle">TCCC Preview: By the Numbers</span>
<br><br>

<div class="authorPhoto">
    <img src="/i/m/kzimmerman_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21196141" context="algorithm"/><br />
      <em>TopCoder Staff</em>
</div>

<br clear="all">

In this article, I'll take a look at some of the numbers and trivia behind the upcoming 2006 TopCoder Collegiate Challenge, and how those compare to last year's tournament and the last few Topcoder Opens. One caveat, though -- these numbers are based on the <A href="/tc?module=SimpleStats&c=tccc06_alg_adv_overview&trans=true&d1=tournaments&d2=tccc06&d3=alg_adv_overview">TCCC '06 Round 3 advancers</A>, though the final group of on-site competitors may differ somewhat.
<br><br>
<span class="subtitle">Registration</span><br>
The TopCoder community rose to this year's Collegiate Challenge, with registrations significantly exceeding 2005 numbers. A total of 3,317 competitors registered for the tournament, more than double the 2005 total. This increase was particularly notable among Component Design and Development competitors; more than 700 members registered for components this year, while less than 200 did a year ago. 
<br><br>
<span class="subtitle">Ratings</span><br>
This year's Algorithm advancers have an average rating of 2562, compared to a 2005 TCCC average of 2691 (based on the "current rankings" published in the 2005 program). This difference is due to 2005's smaller amount of competitors - 24, compared to this year's 48 - which concentrated the field at the top. Expanding the 2005 field to include the <A href="/tc?module=SimpleStats&c=tccc05_alg_adv_overview&trans=true&d1=tournaments&d2=tccc05&d3=alg_adv_overview">top 48 advancers</A> actually leads to an average of 2341, though the apples-vs.-oranges nature of the comparison precludes any meaningful analysis. 
<br><br>
<span class="subtitle">Seedings</span><br>
Not surprisingly, the larger field seems to be more dynamic. In 2005, only one competitor seeded higher than 99th made it onsite. For comparison purposes, 10 competitors from the 2006 TCO and 11 from the 2005 TCO were seeded higher than 99. Among this year's Collegiate Challenge crop, though, there are 15 competitors with seeds in the triple digits - hopefully a sign of an unpredictable and exciting tournament. 
<br><br>
<span class="subtitle">Countries</span><br>
A total of 19 countries are represented by the 48 Round 3 advancers. By far the biggest number comes from the Russian Federation, which boasts 15 - or 31% - of the final 48. Here are the top seven countries, ranked in order of the number of competitors:

<div align="center" style="margin: 20px">
<table cellpadding="0" cellspacing="0" class="stat" width="300">
<tbody>
    <tr>
        <td class="header" colspan="2">
            2006 TCCC
        </td>
    </tr>
    <tr class="light">
        <td class="value">
        <strong>Russian Federation</strong>
        </td>
        <td class="valueR">
        15
        </td>
    </tr>
    <tr class="light">
        <td class="value">
        <strong>China</strong>
        </td>
        <td class="valueR">
        7
        </td>
    </tr>
    <tr class="light">
        <td class="value">
        <strong>Poland</strong>
        </td>
        <td class="valueR">
        4
        </td>
    </tr>
    <tr class="light">
        <td class="value">
        <strong>United States</strong>
        </td>
        <td class="valueR">
        3
        </td>
    </tr>
    <tr class="light">
        <td class="value">
        <strong>Canada</strong>
        </td>
        <td class="valueR">
        2
        </td>
    </tr>
    <tr class="light">
        <td class="value">
        <strong>Netherlands</strong>
        </td>
        <td class="valueR">
        2
        </td>
    </tr>
    <tr class="light">
        <td class="value">
        <strong>Spain</strong>
        </td>
        <td class="valueR">
        2
        </td>
    </tr>
    <tr class="light">
        <td class="value">
        <strong>Ukraine</strong>
        </td>
        <td class="valueR">
        2
        </td>
    </tr>
</tbody>
</table>
</div>

The remaining eleven countries have one competitor each: Belarus, Croatia, Georgia, Germany, Indonesia, Italy, Japan, Norway, Slovakia, South Africa, and Sweden.
<br><br>
The Russian prominence this year is particularly noteworthy considering that last year's TCCC had a total of zero competitors from the Russian Federation. Last year's best-represented countries were Germany, Poland and the United States, with four competitors each. The Netherlands had three; China, Croatia and Slovakia had two each; and Australia, Canada, and Norway each had one.
<br><br>
Here are the top five best-represented countries from the past two TopCoder Opens:
<br><br>

<div align="center" style="margin: 20px">
<table cellpadding="0" cellspacing="0" class="stat" width="300">
<tbody>
    <tr>
        <td class="header" width="50%">
            2006 TCO
        </td>
        <td class="headerR B">&nbsp;
            
        </td>
        <td class="header" width="50%">
            2005 TCO
        </td>
        <td class="headerR">&nbsp;
            
        </td>
    </tr>
    <tr class="light">
        <td class="value">
        <strong>Poland</strong>
        </td>
        <td class="valueR B">
        11
        </td>
        <td class="value">
        <strong>United States</strong>
        </td>
        <td class="valueR">
        10
        </td>
    </tr>
    <tr class="light">
        <td class="value">
        <strong>Russian Federation</strong>
        </td>
        <td class="valueR B">
        8
        </td>
        <td class="value">
        <strong>Poland
        </td>
        <td class="valueR">
        8
        </td>
    </tr>
    <tr class="light">
        <td class="value">
        <strong>China
        </td>
        <td class="valueR B">
        4
        </td>
        <td class="value">
        <strong>Russian Federation
        </td>
        <td class="valueR">
        6
        </td>
    </tr>
    <tr class="light">
        <td class="value">
        <strong>Norway
        </td>
        <td class="valueR B">
        4
        </td>
        <td class="value">
        <strong>China
        </td>
        <td class="valueR">
        4
        </td>
    </tr>
    <tr class="light">
        <td class="value">
        <strong>United States
        </td>
        <td class="valueR B">
        4
        </td>
        <td class="value">
        <strong>Canada
        </td>
        <td class="valueR">
        3
        </td>
</table>
</div>

<span class="subtitle">Continents</span><br>
The rise of the Russian Federation, however, doesn't have much of an impact on the global spread of competitors. Among the 48 Algorithm advancers, 33 are from Europe. This European majority (69%) is consistent with past tournaments - the 2006 TCO also had 33 Europeans, last year's Collegiate Challenge was 67% European, and the 2005 TCO was 52% European.  
<br><br>
The big continental drift has been in second place, where North America and Asia have swapped places since the 2005 TCCC: 
<br><br>

<div align="center" style="margin: 20px">
<table cellpadding="0" cellspacing="0" class="stat" width="300">
    <tr>
        <td class="header" width="50%">
            2006 TCCC
        </td>
        <td class="headerR B">&nbsp;
            
        </td>
        <td class="header" width="50%">
            2005 TCCC
        </td>
        <td class="headerR">&nbsp;
            
        </td>
    </tr>
    <tr class="light">
        <td class="value">
            <strong>Europe</strong>
        </td>
        <td class="valueR B">
            69%
        </td>
        <td class="value">
            <strong>Europe</strong>
        </td>
        <td class="valueR">
            67%
        </td>
    </tr>
    <tr class="light">
        <td class="value">
            <strong>Asia</strong>
        </td>
        <td class="valueR B">
            19%
        </td>
        <td class="value">
            <strong>North America</strong>
        </td>
        <td class="valueR">
            21%
        </td>
    </tr>
    <tr class="light">
        <td class="value">
            <strong>North America</strong>
        </td>
        <td class="valueR B">
            10%
        </td>
        <td class="value">
            <strong>Asia</strong>
        </td>
        <td class="valueR">
            8%
        </td>
    </tr>
    <tr class="light">
        <td class="value">
            <strong>Africa</strong>
        </td>
        <td class="valueR B">
            2%
        </td>
        <td class="value">
            <strong>Australia</strong>
        </td>
        <td class="valueR">
            4%
        </td>
    </tr>
</tbody>
</table>
</div>

Continental trivia: What was the last tournament to have competitors from six continents? (And no, Antarctica wasn't one of them.)
<br><br>
<span class="subtitle">Universities</span><br>
This year's algorithm competitors are affiliated with 32 institutions of higher learning around the world. Here are the schools with more than one competitor this year:
<br><br>

<ul>
<li>TsingHua University, China</li>
<li>Moscow State University, Russian Federation</li>
<li>St. Petersburg SU, Russian Federation</li>
<li>Warsaw University, Poland</li>
<li>SPbSU ITMO, Russian Federation</li>
<li>ZheJiang University, China</li>
<li>NTUU "KPI," Ukraine</li>
<li>Ufa State Technical University of Aviation, Russian Federation</li>
<li>University of Waterloo, Canada</li>
<li>Universitat Politècnica de Catalunya, Spain</li>
</ul>

The only repeats among the top five from last year's tournament are Warsaw University, which also had three competitors last year, and the University of Waterloo, which had two.
<br><br>
In addition to those listed above, the rest of this year's universities include a wide range of schools from around the world, with diverse histories and areas of expertise. 
<br><br>
University trivia:
<ul>
<li>Which university, founded in 1614, is the oldest attended by a competitor?</li>
<li>Which of the American universities attended by competitors can boast the most Nobel prizes?</li>
</ul>

Post your trivia answers in the forum, and watch for a breakdown of the TCCC Component Design and Development numbers, coming soon.
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170"id="onRight">
         <div id="onBottom">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </div>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
