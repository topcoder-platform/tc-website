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
    <tc-webtag:forumLink forumID="516286" message="Discuss this article" />
</div>

<body><span class="bigTitle">TCO Preview: By the Numbers</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/timmac_big.jpg" alt="Author" />
</div>
<div class="authorText">

  By&#160;<tc-webtag:handle coderId="10407399" /><br />
      <em>TopCoder Member</em>
</div>
<br clear="all">

<p>Every year, the TCO brings together a most interesting group of people, coming from an increasingly diverse and remote cross-section of the world.  With the addition of two new competitions to this year's tournament, the 78 on-site competitors are even more widespread than previous years, representing 25 countries on six continents (better luck next time, Antarctica!). In the spirit of the famous quote about the three types of lies - "lies, damn lies, and statistics" - we'll look at some of the numbers behind these 78 attendees. Feel free to draw your own dubious conclusions as you see fit.</p>

<p>Before they could make it to Vegas, of course, they had to make it through a gauntlet of challenging qualifying and semifinal bouts. Their competition: a grand total of 4,692 individuals, a new TopCoder record, who registered for a total of 6,320 competition slots (thanks to the many members who competed in multiple tracks). Here are the overall registration numbers, by competition track:</p>
<ul>
    <li>Algorithm: 3,937</li>

    <li>Marathon Match: 1,249</li>
    <li>Component: 857</li>
    <li>Studio Design Competition: 277</li>
</ul>

<p>More than 4,500 competitors for 78 slots is stiff competition, by any measure. Which country did the best job of beating the odds?</p>

<p>Well, there's a couple of ways to answer that question. From a pure numbers stand point, here are the top 12 best-represented countries at the TCO (we'll leave out the remaining 13 countries that are sending one competitor each):</p>

<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
<tbody>
    <tr class="light"><td class="value">Russian Federation</td><td class="value">13</td></tr>    
    <tr class="dark"><td class="value">Poland</td><td class="value">10</td></tr>    
    <tr class="light"><td class="value">China</td><td class="value">8</td></tr>    
    <tr class="dark"><td class="value">Ukraine</td><td class="value">8</td></tr>    
    <tr class="light"><td class="value">United States</td><td class="value">6</td></tr>    
    <tr class="dark"><td class="value">Canada</td><td class="value">5</td></tr>    
    <tr class="light"><td class="value">Sweden</td><td class="value">4</td></tr>    
    <tr class="dark"><td class="value">Indonesia</td><td class="value">3</td></tr>    
    <tr class="light"><td class="value">South Korea</td><td class="value">3</td></tr>    
    <tr class="dark"><td class="value">India</td><td class="value">2</td></tr>    
    <tr class="light"><td class="value">Norway</td><td class="value">2</td></tr>    
    <tr class="dark"><td class="value">Slovakia</td><td class="value">2</td></tr>    
    <tr class="light"><td class="value">South Africa</td><td class="value">2</td></tr>    

</tbody>
</table>

<p>One of the recurring observations that keeps popping up around TopCoder, of course, is the steadily decreasing representation by competitors from the United States.  Some critics will point out that the US suffers from decreasing emphasis on education, while others will point out that such figures are consistent with the increase of programmers from areas such as Eastern Europe and Asia.</p>

<p>However, just saying that the US has 6 members on-site is, by itself, not terribly meaningful.  To get a better sense of the technical voracity of each country, let's consider the top 10 countries, ranked by per-capita representation:</p>

<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
<thead>
    <tr class="sidebarTitle" nowrap="nowrap">
<td class="header">Population</td><td class="header">Country</td><td class="header">Competitors</td><td class="header">Population per Member</td>

    </tr>
</thead>
<tbody>
<tr class="light"><td class="value">9,031,088</td><td class="value">Sweden</td><td class="value">4</td><td class="value">2,257,772 </td></tr> 
<tr class="dark"><td class="value">4,627,926</td><td class="value">Norway</td><td class="value">2</td><td class="value">2,313,963</td></tr> 
<tr class="light"><td class="value">5,447,502</td><td class="value">Slovakia</td><td class="value">2</td><td class="value">2,723,751</td></tr> 

<tr class="dark"><td class="value">38,518,241</td><td class="value">Poland</td><td class="value">10</td><td class="value">3,851,824</td></tr> 
<tr class="light"><td class="value">4,493,312</td><td class="value">Croatia</td><td class="value">1</td><td class="value">4,493,312</td></tr> 
<tr class="dark"><td class="value">46,299,862</td><td class="value">Ukraine</td><td class="value">8</td><td class="value">5,787,483</td></tr> 

<tr class="light"><td class="value">33,390,141</td><td class="value">Canada</td><td class="value">5</td><td class="value">6,678,028</td></tr> 
<tr class="dark"><td class="value">8,199,783</td><td class="value">Austria</td><td class="value">1</td><td class="value">8,199,783</td></tr> 
<tr class="light"><td class="value">141,377,752</td><td class="value">Russian Federation</td><td class="value">13</td><td class="value">10,875,212</td></tr> 

<tr class="dark"><td class="value">49,044,790</td><td class="value">Korea, Republic of</td><td class="value">3</td><td class="value">16,348,263</td></tr>
</tbody>
</table>

<p>So, what does all of this say?  Well, apparently Sweden, Norway, and Slovakia are dense sources of TopCoder talent.  And sorted this way, the most stress is probably falling on <tc-webtag:handle coderId="15763373" context="algorithm" /> and <tc-webtag:handle coderId="20781137" context="algorithm" /> - as the two competitors from India, they're each representing around a half a billion of their countrymen (no pressure, guys!). Beyond that, I will let others abuse these statistics any way they choose in order to draw their own conclusions.</p>

<p>While national pride is great, it doesn't pay the rent. Among those attending the TCO, who's really bringing home the bacon? Here are the top 10 breadwinners heading to Vegas:</p>

<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
<thead>
    <tr class="sidebarTitle" nowrap="nowrap">
<td class="header">Track</td><td class="header">Handle</td><td class="header">Country</td><td class="header">Member Since</td><td class="header">Earnings</td>

    </tr>
</thead>
<tbody>
<tr class="light"><td class="value">Design</td><td class="value">argolite</td><td class="value">Canada</td><td class="value">6/4/2002</td><td class="value">$278,458.57</td></tr> 
<tr class="dark"><td class="value">Design</td><td class="value">AleaActaEst</td><td class="value">Canada</td><td class="value">12/18/2001</td><td class="value">$208,212.92</td></tr> 
<tr class="light"><td class="value">Design</td><td class="value">Pops</td><td class="value">United States</td><td class="value">4/17/2001</td><td class="value">$165,939.92</td></tr> 

<tr class="dark"><td class="value">Algorithm</td><td class="value">tomek</td><td class="value">Poland</td><td class="value">6/13/2001</td><td class="value">$117,512.00</td></tr> 
<tr class="light"><td class="value">Algorithm</td><td class="value">nicka81</td><td class="value">Russian Federation</td><td class="value">7/24/2002</td><td class="value">$109,895.92</td></tr> 
<tr class="dark"><td class="value">Design</td><td class="value">bendlund</td><td class="value">United States</td><td class="value">9/5/2006</td><td class="value">$68,511.93</td></tr> 

<tr class="light"><td class="value">Design</td><td class="value">kyky</td><td class="value">United States</td><td class="value">8/2/2001</td><td class="value">$67,338.11</td></tr> 
<tr class="dark"><td class="value">Development</td><td class="value">PE</td><td class="value">China</td><td class="value">5/27/2004</td><td class="value">$65,668.54</td></tr> 
<tr class="light"><td class="value">Algorithm</td><td class="value">SnapDragon</td><td class="value">Canada</td><td class="value">3/17/2002</td><td class="value">$36,862.00</td></tr> 

<tr class="dark"><td class="value">Design</td><td class="value">sql_lall</td><td class="value">Australia</td><td class="value">4/9/2001</td><td class="value">$29,759.48 </td></tr>
</tbody>
</table>

<p>These results may not be too surprising - if you've paid attention to things like the Digital Run, you'll know that Component Design is where the big money resides.  Note that <tc-webtag:handle coderId="293874" context="algorithm" />, although on-site this year for the Algorithm track, has actually made most of his money in Design competitions.  Although algorithm competitions, in raw numbers, attract far more participation than any other track, they also offer the least financial reward.  <tc-webtag:handle coderId="144400" context="algorithm" /> boasts the highest total among the competitors listed, and even the current "top coder", <tc-webtag:handle coderId="10574855" context="algorithm" />, would only make 9th place on this list were he competing in this year's tournament (rather than writing about it).</p>

<p>It seems to take time to be a big earner, though - half of the eight Design finalists have been TopCoder members for more than five years, and the Design contingent is the "oldest," in TopCoder terms, having registered an average of 4.3 years ago. One notable exception is bendlund, who has managed to rack up an impressive amount of earning is a mere 289 days.</p>

<p>The Development finalists are "younger," with average TopCoder membership a little under 3 years, with Marathon and Algorithm averages hovering around or just over the 3 year mark. The Studio squad is the youngest, with the only two members of less than six months (<tc-webtag:handle coderId="22673573" context="algorithm"/> and <tc-webtag:handle coderId="22673857" />) and average membership time of less than 18 months. </p>

<p>What do they do in all that time? They compete - a lot, and not just in their own category. Fifty-one of the 78 on-site attendees have competed in at least two of the four competition tracks at the TCO (not including Studio), 20 have tried three of the four, and a handful -- <tc-webtag:handle coderId="252022" context="design" />, <tc-webtag:handle coderId="7479769" context="algorithm" />, <tc-webtag:handle coderId="8433628" context="algorithm" />, and <tc-webtag:handle coderId="20092786" context="development" /> -- have tried their hand at all four of them. <tc-webtag:handle coderId="252022" context="design" /> also heads up the top 10 list for the most overall TopCoder competitions, with a whopping 549:</p>

<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
<thead>
    <tr class="sidebarTitle" nowrap="nowrap">
<td class="header">Track</td><td class="header">Handle</td><td class="header">Country</td><td class="header">Member Since</td><td class="header">Total Competitions</td>
    </tr>
</thead>
<tbody>

<tr class="light"><td class="value">Design</td><td class="value">AleaActaEst</td><td class="value">Canada</td><td class="value">12/18/2001</td><td class="value">549</td></tr> 
<tr class="dark"><td class="value">Design</td><td class="value">kyky</td><td class="value">United States</td><td class="value">8/2/2001</td><td class="value">343</td></tr> 
<tr class="light"><td class="value">Algorithm</td><td class="value">nicka81</td><td class="value">Russian Federation</td><td class="value">7/24/2002</td><td class="value">253</td></tr> 

<tr class="dark"><td class="value">Design</td><td class="value">argolite</td><td class="value">Canada</td><td class="value">6/4/2002</td><td class="value">222</td></tr> 
<tr class="light"><td class="value">Design</td><td class="value">Pops</td><td class="value">United States</td><td class="value">4/17/2001</td><td class="value">202</td></tr> 
<tr class="dark"><td class="value">Algorithm</td><td class="value">ploh</td><td class="value">United States</td><td class="value">10/1/2003</td><td class="value">179</td></tr> 

<tr class="light"><td class="value">Algorithm</td><td class="value">wleite</td><td class="value">Brazil</td><td class="value">4/17/2003</td><td class="value">163</td></tr> 
<tr class="dark"><td class="value">Marathon</td><td class="value">Maris</td><td class="value">Sweden</td><td class="value">3/2/2002</td><td class="value">152</td></tr> 
<tr class="light"><td class="value">Algorithm</td><td class="value">SnapDragon</td><td class="value">Canada</td><td class="value">3/17/2002</td><td class="value">148</td></tr> 

<tr class="dark"><td class="value">Design</td><td class="value">sql_lall</td><td class="value">Australia</td><td class="value">4/9/2001</td><td class="value">146</td></tr>
</tbody>
</table>

<p>But it's not just time, and it's not just practice - it's about talent, too. As evidenced by the average rating, this year's crop of on-site contestants looks like a strong one. The Algorithm contingent's average rating of 2637 (based on the TCO07 program) compares favorably to the TCO06 average of 2607 and the TCCC06 average of 2562.</p>

<p>The average Marathon Match rating, for finalists in the track, is 2092, which seems pretty impressive for the very first on-site match. (The marathoners are no slouches in the Algorithm arena, either, with the average Algorithm rating for Marathon Match finalists around 1959.) As for the component numbers, the average rating for Design finalists is 1703, with the Developer average at 1414. </p>

<p>We could slice and dice the numbers into stranger and stranger categories (for example, which competition category wears the largest average shirt size*), but we're probably reaching a point of diminishing returns, and these numbers have less and less to do with the ultimate question here -- who will walk away the big checks in Vegas next week.</p>

<p>For more on that story, watch the continuing TCO coverage next week from <tc-webtag:handle coderId="10574855" context="algorithm" /> and <tc-webtag:handle coderId="15498334" context="algorithm" />. Good luck to all!</p>

<p><em>*Design wears the largest - with assigned values of 1 to 5 for the size range from Small to XX-Large, the Design finalists average out to a shirt size of 2.875. Mathematically speaking, that'd round up to a Large with a little extra room in the sleeves.</em></p>
<br>

<p>&nbsp;</p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
