<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
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
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/stat?c=round_overview&er=5&rd=10775">Match Overview</A><br>
    <tc-webtag:forumLink forumID="516059" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 362</span><br>Tuesday, August 7, 2007
<br><br>



<h2>Match summary</h2> 

<p>
Attracting 1121 participants, SRM 362 provided both divisions with difficult problem sets, Division 1 especially.  In Division 1, <tc-webtag:handle coderId="10574855" context="algorithm"/> continued to show us why he's #1 by being the only competitor to successfully solve all three problems, while newcomer <tc-webtag:handle coderId="22689350" context="algorithm"/>
won Division 2 by a comfortable margin.<br />
<br />

Division 1 didn't see any submissions until about 6 minutes into the coding phase, when people began rapidly submitting the easy problem.  The medium problem turned out to be harder than it
seemed, as is shown by its low success rate.  The hard problem proved to be quite difficult, with only <tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="7442498" context="algorithm"/> submitting successful solutions and <tc-webtag:handle coderId="19849563" context="algorithm"/> failing because of an implementation error.<br />
<br />

Division 2 was greeted by a fairly easy 250 point problem that had a relatively high success rate.  The medium problem (which was also Division 1's easy) turned out to be fairly difficult
for a problem worth only 500 points.  While almost 50 people submitted the hard, only 4 coders passed the system tests, as there were many tricky details to consider.
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8077&amp;rd=10775" name="8077">ThrowTheBall</a></b> </font> <A href="Javascript:openProblemRating(8077)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516059" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      538 / 604 (89.07%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      493 / 538 (91.64%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kilvdn</b> for 248.45 points (2 mins 14 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      186.76 (for 493 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
One way to solve this problem was to simply simulate the ball's movement, using an array to keep track of how many times each person has held the ball.  First, assume that the first player is actually numbered "player 0".
If there are <strong>N</strong> players, and player <strong>k</strong> needs to pass the ball <strong>L</strong> places to his left, then using modular arithmetic, the player who he passes the ball to is player
(<strong>k</strong>+<strong>L</strong>)%<strong>N</strong>.  Similarly, if player <strong>k</strong> needs to pass the ball <strong>L</strong> places to his right, he passes the ball to player (<strong>k</strong>-<strong>L</strong>+<strong>N</strong>)%<strong>N</strong>.
As soon as a player has held the ball <strong>M</strong> times, we return how many times the ball was thrown.<br /><br />

However, there's a solution to this problem that doesn't involve any simulation.  It turns out that the ball is repeatedly passed in circles to and from player 1 over and over again.
Using elementary number theory, if player 1 has the ball, then the ball will return to him after <strong>N</strong>/gcd(<strong>N</strong>,<strong>L</strong>) tosses, regardless of the direction.  Therefore, the answer
becomes (<strong>M</strong>-1)*<strong>N</strong>/gcd(<strong>N</strong>,<strong>L</strong>).
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7735&amp;rd=10775" name="7735">MaximizeSquares</a></b>
</font>
<A href="Javascript:openProblemRating(7735)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516059" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      199 / 604 (32.95%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      139 / 199 (69.85%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>sumant_bhardvaj</b> for 441.44 points (10 mins 38 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      281.67 (for 139 correct submissions) 
    </td>
  </tr>
</table></blockquote> 

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
      446 / 508 (87.80%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      394 / 446 (88.34%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>shell</b> for 239.72 points (5 mins 55 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      166.98 (for 394 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Intuition tells us that there should be an optimal solution where all of the points are on lattice points.  But how do we choose which lattice points to use?
If <strong>N</strong> is a perfect square such that <strong>N</strong>=<strong>M</strong>x<strong>M</strong>, then the best solution is clearly an <strong>M</strong>x<strong>M</strong> block of lattice points.<br /><br />

If <strong>N</strong> is not a perfect square, then it makes sense that we should try to keep the construction as square-like as possible.  Therefore we want to
find the largest <strong>M</strong>x<strong>M</strong> block of points that uses at most <strong>N</strong> points, then place the remainder of the points on either the column to the left of the block
or the row to the bottom of the block.  We should also try not to have any "holes" in the row or column, so we fill up the column from top-to-bottom,
then fill up the row from left-to-right.<br /><br />

It turns out there's a constant-time solution to this problem (assuming that the square root operation is constant time) that can be derived as follows.
First, find the largest <strong>M</strong>x<strong>M</strong> block of points that uses at most <strong>N</strong> points.  Now we define a recurrence relation F(<strong>M</strong>) that describes the number of squares
formed by an <strong>M</strong>x<strong>M</strong> block of points.  Assume that we know the value of F(<strong>M</strong>-1), and that an (<strong>M</strong>-1)x(<strong>M</strong>-1) block of points is used in our solution.  Then we have 2*<strong>M</strong>-1 
points left to distribute.  As described above, we will add points in the column to the left and the row to the bottom of the (<strong>M</strong>-1)x(<strong>M</strong>-1) block.
First filling up the column, the first point we place doesn't add any squares, the second point we place allows for one additional square, the third point adds 3 squares, and so on, until we place the last
point in the column, which adds no new square.  We then fill up the bottom row similarly.  You can verify that the number of squares added by this process is (<strong>M</strong>-1)<sup>2</sup>.
Thus F(<strong>M</strong>)=F(<strong>M</strong>-1)+(<strong>M</strong>-1)<sup>2</sup>.  Solving this recurrence relation yields F(<strong>M</strong>)=<strong>M</strong>*(<strong>M</strong>-1)*(2*<strong>M</strong>-1)/6.<br />
<br />

Now that we've computed the number of squares formed by the first <strong>M</strong>x<strong>M</strong> points, we must find the number of squares formed by the remaining points.  This can be done identically
to the method we used to fill up the left column and bottom row in the preceding paragraph.  Java code that uses these observations follows:
<pre>
int squareCount(int N) {
    if (N &lt; 4) return 0;
    int square = (int) Math.floor(Math.sqrt(N));
    int ret = square * (square - 1) * (2 * square - 1) / 6;
    int rem = N - square * square;
    if (rem == 0) return ret;
    if (rem &lt;= square) return ret + rem * (rem - 1) / 2;
    ret += square * (square - 1) / 2;
    rem -= square;
    return ret + rem * (rem - 1) / 2;
}</pre>

Of course, this problem can also be solved iteratively using these same ideas.  See <tc-webtag:handle coderId="10157606" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265763&rd=10775&pm=7735&cr=10157606">solution</a> for a good implementation of the iterative approach.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8056&amp;rd=10775" name="8056">SignificanceArithmetic</a></b>
</font>
<A href="Javascript:openProblemRating(8056)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516059" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      48 / 604 (7.95%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 48 (8.33%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>juanvp</b> for 747.10 points (17 mins 50 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      576.13 (for 4 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
While this problem was very straightforward, there were many implementation issues that could cause a seemingly good solution to fail.  Careful implementation and attention to the problem statement were crucial.  This problem is solved by 
using a sequence of tests and actions such as the following:<br />
<br />

1) Remove all leading zeros that are at least two places to the left of the decimal point from both numbers.<br />
2) For each number, determine how many digits it has to the right of the decimal point (including trailing zeros), and call the smaller of these K.<br />
3) Compute the result of the addition without regard to rounding issues.<br />
4) Determine the value of the digit immediately to the right of the Kth digit after the decimal point.<br />
5) If this digit is less than 5, the number is rounded down.  If greater than 5, the number is rounded up.<br />
6) If the digit is equal to 5, see if there is a non-zero digit that comes after it.  If so, the number is rounded up.<br />
7) If the digit is equal to 5, and there are no non-zero digits after it, round up if the Kth digit is odd, and round down if the Kth digit is even.<br /><br />

As far as evaluating the expression goes, one way to do it is to simply perform manual addition like you would with a pencil and paper.  Another way is to seperately compute the result of the addition
of the fractional and integral parts of the numbers, making sure to carry the leftover result of the fractional addition onto the integral addition if necessary.<br /><br />

The "rounding up" step can also be performed manually.  If you want to round the Mth digit and the Mth digit is less than 9, then simply add 1 to the digit.  Otherwise, try rounding up the M-1th digit (one digit to the left), and set the Mth digit to 0.
If you get all the way to the first digit of the number and this digit is 9, then set the first digit to 0 and add a '1' digit to the beginning of the number.
The rounding down step is simple; you just truncate the number after the digit to round down after.<br /><br />

For a clean implementation, see <tc-webtag:handle coderId="22689350" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265804&rd=10775&pm=8056&cr=22689350">solution</a>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8048&amp;rd=10775" name="8048">PartialSeries</a></b> </font> <A href="Javascript:openProblemRating(8048)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516059" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      128 / 508 (25.20%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      24 / 128 (18.75%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Per</b> for 441.66 points (10 mins 36 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      246.13 (for 24 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
While this problem first seems like a very straightforward <a href="/tc?module=Static&d1=tutorials&d2=dynProg">dynamic programming</a> problem, coders quickly found that it was full of subtle implementation challenges that made the problem not so clear.<br />
<br />

A first attempt at defining our state space is to have each state as a quadruple of integers: the position in the series, a <a href="/tc?module=Static&d1=tutorials&d2=bitManipulation">bitmask</a> representing the available numbers that had been used, and the values
of the last two used available numbers.  Whenever we discover a new number in the series, there are two ways for this number to create a new extremum.  If both the new number and the second-to-last number are greater than the previous number,
then the previous number is a local minimum.  Similarly, if both the new number and the second-to-last number are less than the previous number, then the previous number is a local maximum.<br />
<br />

For each state, there are two possibilities: the current number in series is missing, or it isn't.
If the number is known, then we simply recursively find the number of extrema in the remaining part of the series, adding one if the previous number is an extremum.  If the number is unknown, then we
iterate through each unused number and recursively find the number of extrema in the remaining part of the series, adding one if using this number makes the previous number an extremum.  The result for this
state will then be the smallest value of all of these results.  To aid with reconstructing the optimal series, we store the choices that we make at each state so that we can then iterate or recurse through each position of the series and add the best choice to the result.<br /><br />

However, the state space described above would use over 500MB of memory, which is well over the TopCoder memory limit.  The first optimization that we can make is to notice
that it's unnecessary to store the position in the series as part of our state space, since it's possible to have the number of '1' bits in the bitmask correspond to which missing number  we're currently
trying to replace.  However, every time we enter a new state we need to make sure that we're at a missing number, and not a known number, by simply evaluating extrema of known numbers until we get to an unknown number.<br />
<br />

Now our state space consists of a triple of integers: a bitmask representing the available numbers that have been used, and the values of the last two used available numbers.  We can optimize this further by noticing
that we don't actually need the values of the last two numbers.  Instead, we only need the value of the last number, and the relative order of the second-to-last number in relation to the last one (greater than, less than, or equal to).
So now our state space only uses about 2^15 * 11 * 3 * 4 = 4.3MB of memory, which is well within our limits.  Since we need to make up to 15 iterations per state, the time complexity of this approach is O(2^n * n^2).<br /><br />

For a good implementation of this approach, see <tc-webtag:handle coderId="19849563" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265770&rd=10775&pm=8048&cr=19849563">solution</a>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8015&amp;rd=10775" name="8015">CoolRectangles</a></b>
</font>
<A href="Javascript:openProblemRating(8015)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516059" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      3 / 508 (0.59%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 3 (66.67%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 582.76 points (28 mins 49 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500.39 (for 2 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
There are a few crucial observations that allow us to dissect this problem properly.  First, notice that if one cool rectangle (call this rectangle A) contains another (call this rectangle B), then rectangle A won't be used
to shrink an input rectangle.  Why?  Well, consider an optimal solution that uses rectangle A.  Then whichever input rectangle is assigned to rectangle A also contains rectangle B.  Thus, we may reassign this input
rectangle to rectangle B.  Since rectangle B has a smaller area than rectangle A, then it may lead to more input rectangles being shrunk, which would be a contradiction.  Otherwise, this new solution is still
better than the original, since the total area of used cool rectangles is smaller, which is also a contradiction.<br /><br />

Using this observation, we can focus our attention only on cool rectangles that contain no other cool rectangles (we call these awesome rectangles).  We can find all awesome rectangles by observing that a cool rectangle is awesome
if, and only if, there are no line segments that pass through the interior of the cool rectangle.  Therefore, we can use a simple algorithm to determine if a cool rectangle is awesome by seeing if any line
segments formed by input rectangles pass through its interior by intersecting its edges.  However, we must also make sure that no input rectangles are contained within the cool rectangle.<br /><br />

Now that we have our set of awesome rectangles (none of which overlap, and thus are independent of one another), we must assign each input rectangle to an awesome rectangle, such that the sum of the areas of the awesome rectangles is minimum.  In terms of graph theory, we construct a bipartite graph
with partite set A consisting of all awesome rectangles, and partite set B consisting of all input rectangles.  There is an edge between two vertices in opposite sets whenever an input rectangle contains an awesome rectangle.  
In addition, we assign each vertex in set A a weight that is equal to the area of the awesome rectangle that it represents.  Therefore, we're looking for the maximum matching in a bipartite graph such that the sum of the vertex weights
is minimum.<br /><br />

One way of solving this is with <a href="/tc?module=Static&d1=tutorials&d2=minimumCostFlow1">minimum-cost maximum flow</a>, by assigning the edges weights that correspond to the areas of the awesome rectangles that they connect to (see <tc-webtag:handle coderId="7442498" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265766&rd=10775&pm=8015&cr=7442498">solution</a>).  However, a simpler solution
can be found by realizing that you can greedily match the awesome rectangles, which is done by computing the lexographically first <a href="/tc?module=Static&d1=tutorials&d2=maxFlow2">maximum bipartite matching</a> when set A is ordered by vertex
weight.  See <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265783&rd=10775&pm=8015&cr=10574855">solution</a> for a clean implementation of this approach.<br /><br />

While it is clear that there are O(N^4) possible cool rectangles, there are only O(N^2) possible awesome rectangles (these are known as the <a href="http://en.wikipedia.org/wiki/Centered_square_number">centered square numbers</a>).  We can find the awesome rectangles
in O(N^5), and since finding the lexographically first maximum bipartite matching can be solved in O(V*E), where V=O(N^2) and E=O(N^3), this solution has a time complexity of O(N^5).
</p>
<br /><br />



<div class="authorPhoto">
    <img src="/i/m/eleusive_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8369955" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
