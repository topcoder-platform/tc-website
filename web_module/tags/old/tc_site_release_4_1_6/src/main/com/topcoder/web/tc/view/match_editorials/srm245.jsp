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
<tc-webtag:forumLink forumID="505736" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 245</span><br>Wednesday, June 1, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
In 1957, the Soviet Union launched Sputnik I, marking the beginning of the space race.
SRM 245 may be remembered as TopCoder's version of Sputnik.
With a convincing win in only his eighth match, <b>Petr</b> rocketed to 4th place in the Top 10 list, only one point
out of 3rd.  His countrymen also put on a show in Division 2, with newcomers from the
Russian Federation&#8212;led by <b>andrewzta</b> and <b>halyavin</b>&#8212;taking positions 1, 2, 4,
12, and 16.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4561&amp;rd=7220" name="4561">Straights</a></b>
</font>
<A href="Javascript:openProblemRating(4561)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505736" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      205 / 236 (86.86%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      195 / 205 (95.12%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kartun</b> for 249.98 points (0 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      193.42 (for 195 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
If you have, say, X 5s, Y 6s, and Z 7s, then you have X*Y*Z 5-6-7 straights.  So, the
problem boils down to taking products of adjacent numbers, as in

<pre>
    int sum = 0;
    for (int i = 0; i &lt;= hand.length-k; i++) {
       int prod = 1;
       for (int j = 0; j &lt; k; j++) prod *= hand[i+j];
       sum += prod;
    }
    return sum;
</pre>
Every solution I looked at took this approach.  A more efficient algorithm
takes advantage of the fact that
neighboring products overlap.  For example, the product of positions 1-5 and the product of
positions 2-6
share the product of positions 2-5.  To get the new product, you multiply the old product
by hand[6] and divide by hand[1], being careful to avoid dividing by 0.  In this fashion,
you can get an O(N) algorithm instead of an O(N^2) algorithm.  Of course, efficiency
was not an issue for this problem, so it was probably wiser to stick with the slower but
simpler code.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4487&amp;rd=7220" name="4487">Flush
</a></b>
</font>
<A href="Javascript:openProblemRating(4487)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505736" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      600
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      26 / 236 (11.02%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      18 / 26 (69.23%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>halyavin</b> for 495.51 points (13 mins 39 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      316.04 (for 18 correct submissions)
    </td>
  </tr>
</table></blockquote>

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      300
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      123 / 191 (64.40%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      117 / 123 (95.12%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>RalphFurmaniak</b> for 284.64 points (6 mins 40 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      193.14 (for 117 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
If you have A cards from suit 0, B cards from suit 1, and so on, then the size
of your largest flush is max(A,B,C,D).  There are Choose(suits[0],A) * ... *
Choose(suits[3],D) hands with this distribution, out of a total of
Choose(suits[0]+...+suits[3],A+B+C+D) possible hands.  Therefore, the contribution
of this type of hand to the overall expected size is
<pre>
                  Choose(suits[0],A) * ... * Choose(suits[3],D)
   max(A,B,C,D) * ---------------------------------------------
                     Choose(suits[0]+...+suits[3], A+B+C+D)
</pre>
We sum up these values for all possible values of A, B, C, and D that add up to the
desired number of cards.  The easiest way to generate these possible values is four nested
loops:
<pre>
    double expected = 0;
    for (int A = 0; A &lt;= suits[0]; A++)
      for (int B = 0; B &lt;= suits[1]; B++)
        for (int C = 0; C &lt;= suits[2]; C++)
          for (int D = 0; D &lt;= suits[3]; D++) {
            if (A+B+C+D != number) continue;
            expected += ...
          }
    return expected;
</pre>
Actually, because D = number-A-B-C, we could get by with three nested loops instead of
four, but efficiency doesn't matter for this problem, and the four-loop version is slightly
easier to code.
</p>

<p>
It is possible to use the straightforward definitions of factorial and choose, provided you
use doubles instead of integers.  Also, since all the fractions share the same denominator,
it is a good idea to do that division once at the end, rather than dividing every term
along the way.  The most common variation on this theme was to calculate the denominator 
by keeping a running sum of the numerators, instead of using choose directly, thereby
avoiding some very large factorials.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4502&amp;rd=7220" name="4502">CardCosts</a></b>
</font>
<A href="Javascript:openProblemRating(4502)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505736" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      13 / 236 (5.51%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      3 / 13 (23.08%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>andrewzta</b> for 701.49 points (20 mins 27 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      642.71 (for 3 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Many people probably tried to use dynamic programming on this problem, but a greedy
solution was all that was necessary.  The basic idea is to buy the cards one at a time,
from whichever round is currently cheapest.  If you have already purchased c cards from
round r, then the next card from round r will cost k^r * (2*c + 1), where the 2*c + 1 comes
from the difference between (c+1)^2 and c^2.  You can use this formula to
find the cheapest round.  Then you add the cost to a running total and increment the
count for that round, as in
<pre>
    totalCost = 0
    count = new int[1000] // number of cards in each round

    loop n times
       loop over the rounds to find the cheapest one

       totalCost += cost of cheapestRound
       count[cheapestRound]++

    return totalCost
</pre>
The key is to limit the number of rounds you need to consider.  One possibility is
to find the largest round for which k^r &lt; n^2. (k^r &lt; 2*n is an even better bound,
but takes a little more thinking.)  Another possibility is to ignore round
r+1 until you have already purchased a card from round r.  Either approach works fine, except
when k=1.  In that case, the best strategy is to buy each card in a different round, for
a total cost of n.  In all other cases, the number of rounds will be small because of
the exponential growth of k^r.
</p>

<p>
See <b>andrewzta</b>'s solution for a nice implementation of this approach.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4572&amp;rd=7220" name="4572">BikeLock</a></b>
</font>
<A href="Javascript:openProblemRating(4572)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505736" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      28 / 191 (14.66%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      18 / 28 (64.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>liympanda</b> for 372.48 points (17 mins 57 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      270.42 (for 18 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
I wonder about this problem every day when I attach one of these locks to my laptop.
This problem is easiest to solve using dynamic programming/memoization.  First, note that
the order in which rotations are performed does not matter, so we might as well do them from
left to right.  Of course, because a single rotation can involve up to three adjacent disks,
the notion of left to right is a little ambiguous.  Here I mean left to right according to
the leftmost disk involved in each rotation.
</p>

<p>
In the process of turning the leftmost disk to the desired position, we can also turn
the next two disks into whatever positions we want.  So we consider all 100 possibilities
for the positions in which we leave the next two disks while turning the leftmost disk
to its desired position.  For each possibility, there are two costs to be considered:
the cost of turning the leftmost three disks into the appropriate positions plus
the cost to recursively solve the rest of problem for all but the leftmost disk.
We add these two costs together for each of the 100 possibilities, and keep the
cheapest result.
</p>

<p>
The key calculation is the cost of turning the leftmost three disks into their appropriate
positions.  All turns that do not involve the first disk will be accounted for in
the recursive call, so for this part of the calculation, we can assume that all turns
involve the first disk.  In other words, we can turn the first disk by itself, the
first two disks together, or the first three disks together.  Now, if the first
three disks are currently on positions A, B, and C, and we want to turn them to positions
X, Y, and Z, then the cost can be calculated as follows:
<pre>
    // first get the third disk into position by turning all three disks
    cost = turns[abs(Z-C)]
    A = (A + Z - C + 10) % 10
    B = (B + Z - C + 10) % 10

    // then get the second disk into position by turning the first two disks
    cost += turns[abs(Y-B)]
    A = (A + Y - B + 10) % 10

    // finally get the first disk into position
    cost += turns[abs(X-A)]
</pre>
The turns array says how many turns are necessary to rotate the disk by a given
distance:
<pre>
    turns = {0,1,1,1,2,2,2,1,1,1}
</pre>
</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4587&amp;rd=7220" name="4587">SandTimers</a></b>
</font>
<A href="Javascript:openProblemRating(4587)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505736" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      7 / 191 (3.66%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1 / 7 (14.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 507.21 points (36 mins 34 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      507.21 (for 1 correct submission)
    </td>
  </tr>
</table></blockquote>

<p>
Normally I'm a big fan of dynamic programming, but this one seems easier to me to approach
as a graph problem.  The nodes are the different amounts of sand that can be in the upper
chambers of the sand timers.  For example, if you have a 5-minute timer and a 7-minute
timer, then one node in the corresponding graph might be 0 minutes left in the 5-minute
timer and 2 minutes left in the 7-minute timer.  There is an edge from state S to state T
if you can reach state T by turning over some number of timers and letting the sand fall
until one non-empty timer becomes empty. The cost of this edge is the amount of time
needed for the timer to run out.  Building the reachable portion of the graph can be
accomplished by a depth-first search.
</p>

<p>
Once the graph is built, we process it in two ways.  First, we find the earliest time that
each node can be reached, using either Dijkstra's algorithm or a simpler-to-code floodfill
to find the shortest path from the start node (all timers empty) to every reachable
node.  Second, we determine which intervals can start at each node.  This can be accomplished
by a kind of backwards depth-first search using a boolean array at each node to keep
track of which intervals are possible.  We start
by marking each node as being the start of an interval of length 0.  Then, whenever we
mark a node with an interval of length I, we recursively mark all its predecessors with
intervals of length I+W, where W is the weight of the edge from the predecessor to the
current node.  We stop whenever the corresponding boolean has already been set.
Performing this marking in the backwards direction means that we have to store reverse
edges when we build the graph.  We could certainly try to do marking in the forwards
direction, but that would yield information about the intervals that <i>end</i> at
each node, and it seems more useful to find which intervals <i>start</i> at each node.
</p>

<p>
Finally, we can determine all the possible intervals by combining the results of the
previous two phases.  For each reachable node and each interval beginning at that node,
if the shortest path to that node plus the length of the interval does not exceed
maxTime, then this interval is marked as possible in a global array.  At the end,
we make an array of all the intervals that are not marked.
</p>

<p>
<img src="/i/m/vorthys_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="299177" context="algorithm"/><br />
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

