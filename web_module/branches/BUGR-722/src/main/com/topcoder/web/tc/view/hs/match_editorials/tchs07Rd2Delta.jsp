<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10714&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514494" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Round 2 Delta</span><br>Monday, March 12, 2007
<br><br>

<h2>Match summary</h2> 

Delta Round 2 provided plenty of advancing slots for competitors. Just one room was enough for the competition, and the 20 competitors only needed a positive score to advance.
<br /><br />
China brought the top four scorers to the match. <tc-webtag:handle coderId="20812309" context="hs_algorithm"/>, 
with the fastest submissions for all three problems and some extra points earned during challenge phase, won the match by a solid margin. 
Rounding out the top four were 
<tc-webtag:handle coderId="22511078" context="hs_algorithm"/>, 
<tc-webtag:handle coderId="22661405" context="hs_algorithm"/> and 
<tc-webtag:handle coderId="22630769" context="hs_algorithm"/>.
<br /><br />
 
<H1> 
The Problems 
</H1>


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7572&amp;rd=10714" name="7572">FrequentPairs</a></b> 
</font> 
<A href="Javascript:openProblemRating(7572)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514494" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      20 / 20 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      17 / 20 (85.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ahyangyi</b> for 247.64 points (2 mins 46 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      225.40 (for 17 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

The small number of words and their sizes made it possible to simply test for all possible pairs of letters in every position still under runtime restrictions, in about 26<sup>2</sup>*50<sup>2</sup>=1.7M iterations. 
It would be faster, however, to cycle through all word positions only once, counting the different letter combinations in a table. 
Keep in mind in any case that the order does not matter, so a single counter should be used for both &quot;ab&quot; and &quot;ba,&quot; for example. 
<br />
<br />
See <a href="/tc?module=HSProblemSolution&cr=20330696&rd=10714&pm=7572">tranquiliser</a>'s for an example of the simplest solution mentioned, and you can see how big the word set (or sizes) might grow before timing out.
For the other type of solution (even if using strings and map as auxiliary tools), see <a href="/tc?module=HSProblemSolution&cr=22661405&rd=10714&pm=7572">gooooodle</a>'s -- and you can do the exercise of optimizing it without using maps as homework.
<br />
<br />

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7534&amp;rd=10714" name="7534">PipePatcher</a></b> 
</font> 
<A href="Javascript:openProblemRating(7534)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514494" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      19 / 20 (95.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      17 / 19 (89.47%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ahyangyi</b> for 492.50 points (3 mins 31 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      437.56 (for 17 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

This problem also has a simple solution that doesn't require a complex algorithm, but only  one strategy is optimal and quick to construct. 
Consider the leak positions ordered by distance the endpoint. To cover the first leak (which has to be done, at some moment) the most reasonable option is to put the <i>L</i>-inch tape in a way that it covers as many leaks as possible to the right. If this first leak was at position <i>k</i>, this will cover any leak up to position <i>k+L-1</i>, inclusive. 
There is no need to consider any more leaks up to that position. 
Following this strategy with the rest of the leaks will give an optimum way to choose where to put each tape. 
<br />
<br />

Most successful solutions implemented exactly that with two nested loops. 
Refer for example to the <a href="/tc?module=HSProblemSolution&cr=20812309&rd=10714&pm=7534">fastest solution</a>:

<pre>
int patches(int L, vector <int> leaks) {
  int i, j, s;
  sort(leaks.begin(), leaks.end());
  s = 0;
  for (i = 0; i < leaks.size(); ) {
    s ++;
    j = i;
    while (leaks[i] - leaks[j] < L)
      i ++;
  }
  return s;
}
</pre>


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6458&amp;rd=10714" name="6458">CalculatorDisplay</a></b> 
</font> 
<A href="Javascript:openProblemRating(6458)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514494" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      17 / 20 (85.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      10 / 17 (58.82%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ahyangyi</b> for 937.39 points (7 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      748.25 (for 10 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

This problem was not about complex algorithms but was about paying attention to a few small details. 
Most coders submitted the problem, but about half of the solutions served as targets for the challenge round.
<br />
<br />

Some simple steps plus testing for some different border cases would solve it. 
First, let's forget about floating point numbers and do the division in small integers with the help of strings, 
as you used to do with paper and pencil in the old school days: take digits from left to right, divide and keep each remainder for the next step.
<br />
<br />

Compute all the integer and fractional digits if possible, or stop once you are past the number available in the display -- in such a case you already know the result does not fit, so you can return &quot;E.&quot; 
If the number is less than zero, do as the calculator does and discard that leading &quot;0&quot; in the integer part. Also, if the number is an integer, do not include the decimal point in the result.
<br />
<br />

Finally concat the integer and fractional parts you obtained (which should not have extra zeros) and check if it fits in the display.
Remember to not count the decimal point as occupying a position.
If that result fits in the number of digits in the display, return it -- or return &quot;E&quot; otherwise. 
<br />
<br />

Refer to <a href="/tc?module=HSProblemSolution&cr=20812309&rd=10714&pm=6458">ahyangyi's</a> for a clear implementation of that solution. Many other coders simplified the procedure by dividing the integer part of the result in one operation and converting that intermediate result to a string, for example.
<br />
<br />



<div class="authorPhoto">
    <img src="/i/m/ged_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10505830" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
