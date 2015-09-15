<%@ page contentType="text/html;charset=utf-8" %> 
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="517840" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>

<span class="bigTitle">TCCC07 Preview: The Marathon Match competition</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/lovro_big3.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="7390467" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>With the TCCC finals around the corner, now is a good time to look back at the three exciting online rounds, as well as look forward to the Championship round on October 31.</p>

<h3>Online Round 1 - Scruffle</h3>

<p>Scruffle is a game inspired by the ubiquitous board game <a target="_blank" href="http://en.wikipedia.org/wiki/Scrabble">Scrabble</a>. Contestants are given the values of all cells and a dictionary of allowed words. Each cell has a word or letter multiplier associated with it, influencing the score for placing a letter or word at a particular location. The goal of the game is to place words from the dictionary onto the board (in any order) and maximize the score.</p>

<p>With 363 competitors competing for 300 spots in Round 2 (and a TCCC Marathon t-shirt), getting just 40% of the top score was good enough to pass. Most passing contestants (including the top scorers) used variants of the same strategy, considering placing all words in all possible locations and then greedily selecting the best placements.</p>

<p>In the end, <tc-webtag:handle coderId="14927744" context="marathon_match" /> topped the rank list, with <tc-webtag:handle coderId="307060" context="marathon_match" /> coming in second.</p>

<h3>Online Round 2 - DeepMining</h3>

<div align="center"><a target="_blank" href="/i/education/feature101507/r2img1.png"><img src="/i/education/feature101507/r2img1_thumb.png"/></a>&nbsp;<a target="_blank" href="/i/education/feature101507/r2img2.png"><img src="/i/education/feature101507/r2img2_thumb.png"/></a></div>

<p>Based on the online Flash game <a target="_blank" href="http://www.xgenstudios.com/play/motherload">MotherLoad</a>, DeepMining placed contestants in charge of a mining operation. A machine is available and it can drill through the terrain and collect minerals: the deeper the terrain, the more valuable the minerals. The machine has a fuel tank with limited capacity that cannot be refueled. It also has limited cargo bay capacity, but can return to the surface and off-load collected minerals. The goal is to return minerals worth as much as possible to the surface before running out of fuel.</p>

<p>The tricky part is that the terrain (and with it the locations of minerals) is not initially revealed - as the machine moves, it reveals a small block of terrain around it. Another caveat is that, although the algorithm for generating the terrain is given, some of its parameters are hidden, so good solutions have elements of statistics and probability in them to estimate those parameters.</p>

<p>Successful contestants recognized two main strategies: going deep or staying near the surface. Going deep worked well because it allowed for collecting more valuable minerals, but at the same time, it was more fuel-efficient to stay near the surface and collect the low-value minerals. There were different ideas for choosing between the two strategies.</p>

<p>Catching one of the 100 seats in Round 3 was much tougher than in Round 2 and a score of almost 86% of the top score was needed. <tc-webtag:handle coderId="9987185" context="marathon_match" /> won the round, with <tc-webtag:handle coderId="8527113" context="marathon_match" /> in close second. Both had additional ideas that separated them from the rest of the pack.</p>

<h3>Online Round 3 - Advertising</h3>

<p>Round 3 saw 100 contestants battling it out over two weeks for only 8 finalist spots.</p>

<div align="center"><a target="_blank" href="/i/education/feature101507/r3img1.png"><img src="/i/education/feature101507/r3img1_thumb.png"/></a>&nbsp;<a target="_blank" href="/i/education/feature101507/r3img2.png"><img src="/i/education/feature101507/r3img2_thumb.png"/></a></div>

<p>The problem presents a model in which our company has produced a product and is trying to attract customers. Undecided customers initially prefer the competitor's product over ours, but we can place advertisements to offset their advantage.</p>

<p>Undecided customers can decide on one of the two products in two ways:</p>
    <ul>
        <li><strong>Direct advertising: </strong>when we place an ad, users will be influenced by it (how much depends on their distance from the ad). We can also place many ads at the same time, which will have a greater effect. Our competitor never advertises its product, which gives us the edge we need.</li>
        <li><strong>Word of mouth: </strong>customers who have purchased either our or the competitor's product will tell nearby undecided customers about the one they purchased, increasing the likelihood that the undecided customers will also buy that product.</li>
    </ul>
    
<p>The goal is to maximize our profit by attracting many customers, while spending as little money as possible on advertising.</p>

<p>An aspect of this problem I found interesting is clustering the customers. It is very easily done visually - if you look at the images on the right, you will easily see seven large clusters of points. However, developing an algorithm to do this for you is far from trivial.</p>

<p>The effects of direct and viral advertising were described in the problem statement with formulas. Some of the parameters were unknown, but could be estimated with an initial probing advertising run. As usual, trying many different approaches was crucial for getting a good score.</p>

<p>The final results were somewhat of an upset, with three competitors dropping out of the top 8. <tc-webtag:handle coderId="7394165" context="marathon_match" /> took the win, ahead of <tc-webtag:handle coderId="269788" context="marathon_match" /> and <tc-webtag:handle coderId="9987185" context="marathon_match" />.</p>

<h3>The Championship Round</h3>

<p>The top eight performers in Online Round 3 have been selected as <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=bracket">finalists</a> and will take each other on at the 2007 TCCC onsite finals. Three of them (<tc-webtag:handle coderId="9987185" context="marathon_match" />, <tc-webtag:handle coderId="10600282" context="marathon_match" />, and <tc-webtag:handle coderId="269788" context="marathon_match" />) were finalists in the 2007 TopCoder Open Marathon track earlier this year, with <tc-webtag:handle coderId="10600282" context="marathon_match" /> winning the competition. At the time of writing, <tc-webtag:handle coderId="9987185" context="marathon_match" /> is the top rated Marathon competitor, clinching six top-five finishes in the nine TopCoder Marathon Matches he participated in, and is definitely a strong contender for the overall win.</p>

<p>All competitors will have to adapt to a restricted work environment and a 9-hour round, quite a contrast to the one- and two-week online rounds.</p>


<br /><br />
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
