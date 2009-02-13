<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
    <td width="180">
    <jsp:include page="../includes/global_left.jsp">
      <jsp:param name="level1" value="statistics"/>
      <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505791" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 277</span><br>Saturday, December 17, 2005
<br><br>

<span class="bigTitle">Match summary</span>
<p>With 963 registrants, participants were bound to get a run for their money in both divisions. Division 1 coders were greeted by a complimentary 250 only to face a tricky 500 and a hard-to-code 1000. In the end, <b>antimatter</b> took the win with the help of two challenges, with <b>misof</b> and <b>krijgertje</b> (our newest target) closely in second and third, respectively.</p>

<p>In division 2, more than 200 coders solved both of the first two problems, but only 10 got the third one right. Newcomer <b>Rocking</b> had the highest score with 3 challenges for an impressive debut rating.</p>

 
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4806&amp;rd=8074" name="4806" onClick="return (false);">SandwichBar</a></b>
</font>
<A href="Javascript:openProblemRating(4806)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505791" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      412 / 499 (82.57%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      336 / 412 (81.55%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>N][M</b> for 247.38 points (2 mins 55 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      200.25 (for 336 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>In the problem we are asked to find the first sandwich wanted for which all ingredients are in the list of available ingredients. The solution comes down to some string parsing and simple logic. Here is an example of how the problem can be solved in Java:</p>

<pre>    public int whichOrder(String[] available, String[] orders) {
        Set&lt;String&gt; s = new TreeSet();
        for (int i = 0; i &lt; available.length; i++) 
            s.add(available[i]);
        for (int i = 0; i &lt; orders.length; i++) {
            boolean isok = true;
            String[] p = orders[i].split(&quot; &quot;);
            for (int j = 0; j &lt; p.length; j++) 
               isok &amp;= s.contains(p[j]);
            if (isok) return i;
        }
        return -1;
    }</pre>

<p>C++ coders who don't know how to use istringstreams were at a slight disadvantage for not having a straightforward string tokenizing routine. Here's how one could have used istringstreams to get the job done:</p>

<pre>   int whichOrder(vector &lt;string&gt; available, vector &lt;string&gt; orders) {
      for ( int i=0; i&lt;(int)orders.size(); ++i ) {
         istringstream iss( orders[i] );
         string s;
         bool ok = true;
         while ( iss &gt;&gt; s )
            if ( find( available.begin(), available.end(), s ) == 
                 available.end() )
               ok = false;
         if ( ok )
            return i;
      }

      return -1;
   }</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5870&amp;rd=8074" name="5870" onClick="return (false);">RogersPhenomenon</a></b>
</font>
<A href="Javascript:openProblemRating(5870)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505791" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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

      402 / 499 (80.56%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      312 / 402 (77.61%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jueyey</b> for 497.87 points (1 mins 51 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      380.53 (for 312 correct submissions)
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
      416 / 419 (99.28%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      352 / 416 (84.62%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 248.91 points (1 mins 53 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      219.40 (for 352 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>After realizing what's going on, it should be obvious that this is a pretty simple simulation problem. For each number in both of the sets, we have to check if moving it to the other set will increase the means of both sets. Checking can be done the straightforward way (moving then comparing means), or we can note that the source set's mean will increase if the number moved is less than the current mean, and that the destination set's mean will increase if the number moved is greater than its mean.</p>

<p>Comparing fractions is best done using cross-multiplication so we avoid the use of doubles, although in this problem you were safe using doubles as well (because the difference between denominators of the fractions compared is always exactly one, which makes it impossible for floating-point imprecision to wreak havoc upon calculations).</p>
</p>

<p>Many coders got unsuccessful challenges expecting solutions to crash with a divide-by-zero error. However, IEEE floating-point representations (floats and doubles) handle such cases silently with special values: dividing a non-zero double by zero yields the special value infinity (positive or negative), while dividing a zero by zero yields NaN (not-a-number). NaNs behave somewhat awkwardly because every comparison involving them is false (even comparing two NaNs for equality), which stumped challengers.</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4823&amp;rd=8074" name="4823" onClick="return (false);">UnionOfIntervals</a></b>
</font>
<A href="Javascript:openProblemRating(4823)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505791" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      80 / 499 (16.03%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      10 / 80 (12.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>Zephyrzzz</b> for 599.57 points (27 mins 25 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      489.01 (for 10 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>The problem asks us to find the n-th smallest number in a (potentially huge) list of integers, which is given as a union of intervals (numbers may appear more than once in the resulting list). Most solutions failed on large cases either because of timeout or overflow.</p>

<p>There are at least three different approaches to solving this problem. One of them is intersecting the intervals repeatedly to get a list of mutually disjoint intervals, which can then be sorted and processed, another is using a sweep-line style algorithm, processing the intervals left to right using a priority queue of events. I will describe the third approach in detail.</p>

<p>Observe that it's possible to quickly count how many numbers in the list are less than some chosen number X (by iterating through all of the intervals). Now, if this number is greater than n, the solution is certainly smaller than X. Similarly, if this number is less than or equal to n, the solution is greater than or equal to X. This ought to be enough to hint at a solution based on binary search. Here is how it can be implemented in Java:</p>

<pre>
   public int nthElement( int[] lowerBound, int[] upperBound, int n )
   {
      int lo = Integer.MIN_VALUE, hi = Integer.MAX_VALUE;
      while ( lo &lt; hi ) {
         int X = (int)( ((long)lo+hi+1)/2 );
         long count = 0;
         for ( int i=0; i&lt;lowerBound.length; ++i ) {
            if ( X &gt;= lowerBound[i] &amp;&amp; X &lt;= upperBound[i] ) {
               // part of interval i is less than X
               count += (long)X - lowerBound[i];
            }
            if ( X &gt;= lowerBound[i] &amp;&amp; X &gt; upperBound[i] ) {
               // all numbers in interval i are less than X
               count += (long)upperBound[i] - lowerBound[i] + 1;
            }
         }

         if ( count &lt;= n ) lo = X;
         else hi = X-1;
      }

      return lo;
   }
</pre>

<p>As with all binary search solutions, you needed to carefully implement it and cast to a larger integer type in the appropriate places to avoid overflow because of the extreme numbers in the calculations.</p>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4828&amp;rd=8074" name="4828" onClick="return (false);">AirlinerSeats</a></b>
</font>
<A href="Javascript:openProblemRating(4828)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505791" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      331 / 419 (79.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      170 / 331 (51.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gagik</b> for 480.36 points (5 mins 47 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      289.29 (for 170 correct submissions)
    </td>
  </tr>

</table></blockquote>
<p>
<p>Like with many problems that can be solved with a greedy approach, there is also a pretty dynamic programming solution hidden somewhere beneath. In this problem, the airplanes used were pretty wide so any dynamic programming approach in quadratic (or worse) time was doomed to time out. Hopefully, not many coders were too focused on finding <em>the right</em> DP solution.</p>

<p>Consider the following greedy algorithm (assume a row filled with aisles at the beginning): proceed from left to right and place seats in the pattern seat-aisle-seat: <tt>S.SS.SS.SS.SS.SS.</tt> ...
If we run out of seats before reaching the end of the row, optionally reverse the arrangement and return it. Otherwise, proceed from right to left, filling in aisles with the remaining seats.</p>

<p>This is all there is to the solution, and the code is also pretty short. In case you're not sure if this is working, you can try it out on a few examples. In order to prove the algorithm, we can argue that:<ol><li>At any point in the algorithm, the current arrangement always has the maximum number of aisle seats (for the number of seats placed so far).</li><li>There is no lexicographically smaller arrangement with the same number of aisle seats.</li></ol></p>

<p>In the first part of the algorithm (before we reach the end of the row), all seats placed are aisle seats so we can't do better than that (property 1 is satisfied). Also note that this arrangement uses the least amount of space to place that number of aisle seats, since each aisle is used to make exactly two seats aisle seats. Hence, when we reverse this arrangement, we'll get the arrangement with the maximum possible number of aisles (dots) on the left, which is the lexicographically smallest arrangement (property 2 is satisfied).</p>

<p>A special case is when only one seat is placed at the end, instead of the <tt>S.S</tt> triplet. For example, when width=4 and seats=3, the arrangement generated is <tt>S.SS</tt>, but this is lexicographically smaller than <tt>SS.S</tt>. Many coders missed this case and their solution was brought down by a similar case in system tests, where width=11 and seats=8.</p>

<p>If there are still seats left over after the first, we proceed with the second part of the algorithm. In order to maintain property 1, we now need to place seats so as to revert as few as possible aisle seats back to ordinary status. Recall that all seats currently in the arrangement are aisle seats. There are really three possible ways our current arrangement can look like:<ul><li><tt>S.SS.S</tt> &#8230; <tt>S.SS</tt> : each seat we put will make two previously aisle seats ordinary again, there's not much we can do about this. If we place seats from right to left, we'll get the lexicographically smallest arrangement.</li><li><tt>S.SS.S</tt> &#8230; <tt>S.SS.</tt> : placing a seat in the rightmost position makes only one aisle seat ordinary, so we do that. After that, we're basically left with the above situation.<li><tt>S.SS.S</tt> &#8230; <tt>S.SS.S</tt> : same as in the first case.</li></ul></p>

<p>Thus, it is always optimal to fill seats in right-to-left order, as we claimed in the algorithm.</p>

<p>It was also possible to generate only the first and last 50 characters of the arrangement, but it was probably easier to generate the entire string, then return as appropriate.</p>

<p>There are other greedy approaches that will work, but the above proof implies the greedy choice and optimal substructure properties that are necessary for any problem to be solved using a greedy algorithm. For more information on greedy algorithms, read <b>supernova</b>'s article <a href="/tc?module=Static&d1=tutorials&d2=greedyAlg">Greedy is good</a>.</p>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5918&amp;rd=8074" name="5918" onClick="return (false);">SafeJourney</a></b>

</font>
<A href="Javascript:openProblemRating(5918)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505791" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      24 / 419 (5.73%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      10 / 24 (41.67%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>krijgertje</b> for 593.00 points (27 mins 57 secs)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      472.83 (for 10 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
<p>Most division 1 coders can probably recognize a shortest-path problem when they see it: split the grid into width &#0215; length unit cells (vertices), put an edge of weight 0 between every two adjacent cells which aren't separated by a road and an edge of weight 1 when there is a road in between. The problem is that width and length can both go up to 2 billion, which gives 4&#8729;10<sup>18</sup> vertices in total. No shortest path algorithm can handle graphs of this magnitude so we have to resort to a trick.</p>

<p>With the relatively small number of roads (the input format allowed for no more than 300 vertical and 300 horizontal roads), there will surely be a lot of free space in the plane. Consider the following two cases:</p>

<table cellpadding="5" cellspacing="0" align="center">
   <tr>
      <td valign="top"><img src="/i/srm/srm277_1.png" alt="" border="0" /></td>
      <td>&nbsp;and&nbsp;</td>
      <td valign="top"><img src="/i/srm/srm277_2.png" alt="" border="0" /></td>
   </tr>
</table>

<p>These two cases have the same solution, which is no coincidence. However, the latter case is clearly better to us: we are left with a smaller grid for our shortest-path algorithm to work on. In fact, we can transform any grid to a (usually) much smaller grid that really represents the same case. To do this, we proceed from left to right in the source grid and assign increasing x-coordinates (starting from 0) wherever there is some object (boundary, home, work, or road endpoint) at that coordinate.</p>

<p>In the example above, we assign x-coordinates 0, 1, 2, 3, 4 and 5 in the new grid to x-coordinates 0 (boundary), 1 (home), 2 (road), 4 (road), 6 (work) and 10 (boundary) in the old grid. We proceed in a similar fashion for y-coordinates. What we're left with is a grid composed of at most <em>O</em>(H&#8729;V) unit cells, where H and V are the numbers of horizontal and vertical roads, respectively. Coordinate compression is a technique often needed in problems featuring huge (usually discrete) grids to be worked on, such as this one.</p>

<p>After we've compressed the grid and constructed a graph, we need to run a shortest-path algorithm. Not all choices will do, since the graph can get quite large (system tests included a grid of size 622 &#0215; 622). It was possible to use Dijkstra's algorithm (as <b>bmerry</b> did), implemented with time complexity <em>O</em>(E log V), but all other passing solutions used a modification of breadth-first search, which runs in <em>O</em>(E) time.</p>

<p>Breadth-first search is usually used on unweighted graph, but we can use it on 0-1 graphs as well, by using a deque (double-ended queue) instead of a regular queue: any time we expand over an edge of weight 0, we insert the neighbour vertex at the front on the queue. When we use an edge of weight 1, we push the vertex at the end of the queue. This way, closer vertices will be processed before the farther ones. Observe that a vertex may be pushed on the deque twice (first via a 1-edge, then a 0-edge before the first one is processed). However, the implementation will be careful to only process the first copy and in the worst case, this only adds a factor of at most two to the runtime.</p>
</p>

  <img src="/i/m/lovro_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
  By&#160;<tc-webtag:handle coderId="7390467" context="algorithm"/><br />
  <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
  </p>

</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170">
    <jsp:include page="../public_right.jsp">
     <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
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
