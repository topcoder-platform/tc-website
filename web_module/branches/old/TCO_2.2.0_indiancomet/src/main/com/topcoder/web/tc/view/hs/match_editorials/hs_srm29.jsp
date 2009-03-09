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
    <A href="/tc?module=HSRoundOverview&rd=10653&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506245" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 29</span><br>Monday, January 22, 2007
<br><br>

<h2>Match summary</h2> 

 

<p> 

TopCoder High School algorithm competitors once again demonstrated impressive speed and accuracy in tackling a difficult set of problems.  Many competitors submitted very fast solutions on the easy and medium problems, with the hard providing a stiffer challenge -- as well as some excitement during the challenge phase.  In the end, Croatian sensation <tc-webtag:handle coderId="11972352" context="hs_algorithm"/> came away with the win, followed closely by <tc-webtag:handle coderId="22375930" context="hs_algorithm"/> and <tc-webtag:handle coderId="22641901" context="hs_algorithm"/>.

</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6557&amp;rd=10653" name="6557">ReverseSums</a></b> 

</font> 

<A href="Javascript:openProblemRating(6557)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506245" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      162 / 167 (97.01%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      159 / 162 (98.15%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>cypressx</b> for 249.80 points (0 mins 48 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      235.42 (for 159 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The shortest way to code this problem is to convert the number to a string and then use an appropriate library function to reverse the string.  Once that's done, we can convert the reversed string back to an integer and add it to the original number.  In VB, a possible solution is simply "return N + StrReverse(N)".  <tc-webtag:handle coderId="21931776" context="hs_algorithm"/> demonstrated a similar quick solution in Java (using the StringBuffer object), completing his <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=21931776&rd=10653&pm=6557">solution</a> in just 51 seconds.

Amazingly, 3 coders (<tc-webtag:handle coderId="8471704" context="hs_algorithm"/>, <tc-webtag:handle coderId="15117368" context="hs_algorithm"/>, and <tc-webtag:handle coderId="22652634" context="hs_algorithm"/>) were able to solve the problem faster than that 51 second mark, and without resorting to string manipulation.  Instead, they built the reversed number one digit at a time by successively peeling off the last digit of the input using the modulus (%) operator.  <tc-webtag:handle coderId="22652634" context="hs_algorithm"/>'s 49 second solution demonstrates this approach nicely, storin the reversed number in y and using x to store the digits of N that have yet to be processed:

<pre>
  int x = N;
  int y = 0;
  while (x) {
    y = y * 10 + x % 10;
    x /= 10;
  }
  return y + N;
</pre>

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6509&amp;rd=10653" name="6509">CommutePlan</a></b> 

</font> 

<A href="Javascript:openProblemRating(6509)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506245" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      111 / 167 (66.47%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      92 / 111 (82.88%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>fatit</b> for 494.58 points (2 mins 59 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      382.61 (for 92 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Many coders chose to use a bottom-up dynamic programming approach for this problem.  In this approach, one counts up from 0 to the end distance, and for each distance figures out the best way to arrive at that distance.  Naturally we can get to the 0th kilometer in 0 kilometers of travel, and from there we work up through each kilometer one by one and consider the best way to reach each point.
<br /><br />
For example, suppose we're currently figuring out the best way to get to kilometer number 500.  One possible way to get there is to drive to 499, and then drive 1 more kilometer. Because we have already calculated the best way to get to 499 we simply have to add 1 to that number to find the cost of getting to 500 in this way.  The other possible option is that we have taken a shortcut that ends at 500.  To test these options, we loop through all of the possible shortcuts and check whether each ends at 500.  For each shortcut that does, we look to our memo to find the best possible way to get to the location where that shortcut began, and then add to that number the length of the shortcut we're considering.  This sum tells us the length of the best route to get to our current kilometer while using that shortcut.  As we process shortcuts, we keep track of the best overall option we have found so far to get to the current kilometer.  We continue this process until we've processed our destination, at which point we'll know the length of the best overall route.
<br /><br />
It is also possible to solve this problem recursively.  Our recursive function is set up to answer the question "If I start at kilometer x, what is the length of the shortest path to the destination?" For a given position, we calculate the cost of driving from that position to the end directly or, alternatively, by using any shortcut that begins after our current position.  To calculate the cost of using a given shortcut, we add the cost of driving to the beginning of that shortcut, the length of that shortcut, and the distance from the end of that shortcut to the overall destination.  The first two of those figures are easy to calculate or retrieve, and the third can be found by making a recursive call to our distance function.  The low constraints mean that we can simply try every possibility recursively, though memoization is also easy to add (and avoids an otherwise exponential run time).

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6583&amp;rd=10653" name="6583">FiveStarPatterns</a></b> 

</font> 

<A href="Javascript:openProblemRating(6583)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506245" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      41 / 167 (24.55%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      12 / 41 (29.27%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Zuza</b> for 780.17 points (16 mins 3 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      526.74 (for 12 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Most coders opted to use a combination brute-force/greedy algorithm to solve this problem.  The brute-force part is determining where to place vertical lines.  The only time we can use vertical lines at all is when the grid has a height of 5 (the maximum value) and even in this case there is a manageable number of combinations to try because of the limited width of the grid.  Each of 10 columns can either have or not have a vertical line, leading to a total possibility of 2<sup>10</sup>=1024 different sets of vertical lines.  Of course, depending on the configuration of '*'s in the layout, many of these combinations may not actually be possible.
<br /><br />
For each combination of vertical lines we count the number of horizontal lines required to fill the remaining '*'s.  First, we create a copy of our original layout that contains only the '*'s that weren't dealt with by vertical lines.  We iterate over this grid processing each point in order from left to right.  As we encounter '*'s, we can be sure that they need to be dealt with by a horizontal line.  We greedily draw these lines such that they cover an area as far as possible to the right.  However, we must also consider the possibility that there is not enough room to draw a full horizontal line of 5 '*'s that covers the current point.  In this case we return a value indicating that there is no way to complete the grid with the current configuration of vertical lines.
<br /><br />
Our overall plan, then, is to consider each combination of vertical lines, greedily determine the number of horizontal lines required to complete the layout for each combination, and return the minimum total we encounter.
<br /><br />
It is also possible to write a dynamic programming based solution, and I'll outline one approach here.  Our memo has dimensions for column number and for the configuration of any "overlap" from horizontal lines that come out of previous columns.  We process each column in turn from left to right and top to bottom.  Each time we encounter a '*' that hasn't been dealt with, we try processing it as part of either a vertical or horizontal line, and store the best results.  In drawing possible lines, we are greedy in extending the line either as far right or as far down as possible.
<br /><br />
This approach is fast enough to work on grids of somewhat larger size.  However, handling the memoization is somewhat awkward, resulting in the greedy solution above being somewhat easier to implement.

</p>



 

<div class="authorPhoto">
    <img src="/i/m/jmzero_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15498334" context="algorithm"/><br />    <em>TopCoder Member</em>
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
