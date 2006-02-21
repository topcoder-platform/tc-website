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
<tc-webtag:forumLink forumID="505616" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 172</span><br>Thursday, November 20, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<p>

Greased lightning! <b>NGBronson</b> took charge of Division One last night
and put on a speed-coding clinic for the kiddies, shading <b>ZorbaTHut</b>
by a handful of points. (Please note that our Zorba is not related to
Zorba the Greek, nor does he have the girth of Jabba the Hutt.) Another
fiendishly clever gent, <b>snewman</b>, took the bronze. There was
gnashing of teeth and rending of garments in Division Two, where coders
faced a devious Level One problem. <b>Osric</b> flew high in his first
TopCoder foray, besting another sharp newbie, <b>jerky</b>, by nearly 100
points. The ominously named but probably quite jolly <b>Darkmaster</b>
placed third.

</p>
 
<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b>SkipRope</b>
</font>
<A href="Javascript:openProblemRating(1968)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505616" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      228 / 272 (83.82%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      95 / 228 (41.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>hw_Tim</b> for 236.34 points (6 mins 54 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      176.63 (for 95 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

We are asked to find the two height measurements closest to a target
height from among a list of candidates. The simpler but perhaps less
elegant way to accomplish this is to identify the closest height,
discard it, and then search for the closest height in the reduced list.

</p>
<p>

In the pseudocode below, we begin by sorting the candidates in
non-descending order. Now it's easy to break ties in favor of larger
values: we process the list from smallest to greatest, always updating
our best choice if the current candidate is at least as close to the
target height as any earlier candidate. Also note that we measure how
close some number <i>a</i> is to a number <i>b</i> by computing the
absolute value of their difference, <i>abs(a-b)</i>. Finally, we mustn't
forget to sort the return values.

</p>
<p>
<pre>
def skip(candidates, height):
  candidates.sort()
  ret = []
  best = 0
  for i in range(len(candidates)):
    if (abs(candidates[i]-height) &lt;= abs(candidates[best]-height)):
      best = i
  ret.append(candidates[best])
  del(candidates[best])
  best = 0
  for i in range(len(candidates)):
    if (abs(candidates[i]-height) &lt;= abs(candidates[best]-height)):
      best = i
  ret.append(candidates[best])
  ret.sort()
  return ret
</pre>
</p>
<p>

The more concise approach is to run through the candidates only once,
maintaining a list of the top two candidates at any given moment. If some
candidate is closer to the target height than the currently top-ranked
candidate, we insert this candidate at the head of the rankings and
chop off the last element in the rankings. Otherwise, we compare the
same candidate to the currently second-ranked height. If the candidate
is better, we perform a similar insert-and-chop routine.

</p>
<p>
<pre>
def skip2(candidates, height):
  k = 2
  candidates.sort()
  ret = [-1]*k
  for i in range(len(candidates)):
    for j in range(k):
      if (ret[j] == -1 or abs(candidates[i]-height) &lt;= abs(ret[j]-height)):
        ret.insert(j, candidates[i])
        del(ret[k])
        break
  ret.sort()
  return ret
</pre>
</p>
<p>

This code is readily adapted to the general problem of returning the
top <i>k</i> candidates for any given <i>k</i>.

</p>



<font size="+2">
<b>BadClock</b>
</font>
<A href="Javascript:openProblemRating(1969)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505616" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      115 / 272 (42.28%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      49 / 115 (42.61%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jerky</b> for 473.25 points (6 mins 49 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      302.72 (for 49 correct submissions)
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
      148 / 175 (84.57%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      107 / 148 (72.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 244.52 points (4 mins 16 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      192.28 (for 107 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>

We are given two 12-hour analog clocks, one of which is accurate whereas
the other gains or loses some number of seconds per hour, and asked to
find the number of hours that will elapse before the clocks agree. The
immediate difficulty of carrying out calculations with analog clocks is
that they're much too fussy, what with their three different hands. Why
use three when one will do? After all, the minute hand is merely marking
off the seconds in multiples of 60, while the hour hand deals with blocks
of 3600.

</p>
<p>

We can streamline matters by keeping track of the time solely in terms
of seconds. Imagine that we have a minimalist clock equipped with
a single hand and a dial divided into 12*60*60=43200 seconds. If a
conventional clock shows <i>m</i> minutes and <i>s</i> seconds past
<i>h</i> o'clock, we can translate the time into pure seconds by
computing <i>3600*(h-1)+60*m+s</i>.

</p>
<p>

Having done this to the true clock as well as the skewed clock, we can
take the two minimalist clocks and superimpose one on the other, as it
were, so that we are looking at a single minimalist clock with two second
hands traveling at different rates. Which one is faster? Well, if the
skewed clock is gaining a positive number of seconds per hour, then the
hand corresponding to the skewed time is the faster of the two. But if the
skewed clock gains a negative number of seconds per hour, so that it is
actually losing time, then the faster hand corresponds to the true time.

</p>
<p>

The question now is this: how long will it take the fast hand to catch
up with the slow one? Consider the lead, in seconds, that the slow one
currently enjoys over the fast one. After an hour, the fast hand will
have traveled the same distance as the slow hand plus a fixed number
of seconds, so that the lead is reduced by that number. As another hour
passes, the lead is reduced by the same fixed number. Thus, the number
of hours that must elapse before the lead becomes zero is the number of
times that the hourly gain fits into the lead! Another way to put it is
that we divide the size of the lead by the size of the hourly gain.

</p>
<p>

We must pay attention when calculating the size of the lead, since the
fast hand may be nominally before or behind the slow hand according to
the analog clock. If the span of seconds from the fast hand to the slow
hand works out to a negative number, we normalize it by adding a full
clock's worth of seconds, or 12*60*60.

</p>
<p>
<pre>
def clock(true_time, skew_time, gain):
  true_secs = 3600*(float(true_time[0:2])-1) + 60*float(true_time[3:5]) + float(true_time[6:8])
  skew_secs = 3600*(float(skew_time[0:2])-1) + 60*float(skew_time[3:5]) + float(skew_time[6:8])
  lead = true_secs - skew_secs
  if (gain &lt; 0):
    lead = skew_secs - true_secs
  if (lead &lt; 0):
    lead += 12*60*60
  return abs(lead/gain)
</pre>
</p>
<p>

We could have performed an algebraic reduction to arrive at the conclusion
that we need <i>abs(lead/gain)</i>, but it's wise to expend no more
brain cells than necessary.

</p>


<font size="+2">
<b>Cubism</b>
</font>
<A href="Javascript:openProblemRating(1815)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505616" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      24 / 272 (8.82%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      18 / 24 (75.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tox</b> for 779.00 points (16 mins 7 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      581.88 (for 18 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>

A four-by-four-by-four lattice is filled with 64 black and white cubes,
and we are asked to count the number of orthogonal and diagonal lines
(of length four) that are formed by cubes of a given color. Masochists
will want to embark on a case-by-case analysis, analyzing the possible
pairs of endpoints and classifying these by type: corner to corner,
side to side, and edge to edge. The pain-free approach is to let your
for-loops do the walking.

</p>
<p>

First, we shall use nested loops to enumerate the various directions in
which a line may stretch. Since each consecutive pair of cubes within a
line must be neighbors, let's look at all possible neighbors of a given
cube. From a cube with coordinates <i>(i, j, k)</i> in the lattice,
we may reach a neighboring cube by stepping no more than one unit away in
each of the three dimensions. In each dimension, then, we make a step of
-1, 0, or 1. If we let the dimensional increments <i>di</i>, <i>dj</i>,
and <i>dk</i> iterate over these three values in a triply nested loop,
not forgetting to exclude the case where all three increments are zero,
we end up generating all 3*3*3-1=26 non-zero direction vectors.

</p>
<p>

We can use a further triply nested loop to generate all 4*4*4=64 locations
within the lattice, striking out in each of the 26 possible directions
to see whether we can form a line of four cubes. If, in the course of
stepping in some direction, we run out of cubes of the desired color or
leave the confines of the lattice altogether, we just cease stepping in
that direction and move to the next location.

</p>
<p>
<pre>
def cubism(lattice, color):
ct = 0
  for di in range(-1, 2):
    for dj in range(-1, 2):
      for dk in range(-1, 2):
        if (di == 0 and dj == 0 and dk == 0):
          continue
        for i in range(4):
          for j in range(4):
            for k in range(4):
              ii = i
              jj = j
              kk = k
              for n in range(4):
                if (ii &lt; 0 or ii == 4 or jj &lt; 0 or jj == 4 or kk &lt; 0 or kk == 4):
                  break
                if (lattice[ii][4*jj+kk] != color[0].upper()):
                  break
                if (n == 3):
                  ct += 1
                ii += di
                jj += dj
                kk += dk
  return ct/2
</pre>
</p>
<p>

It is important to note that since we are generating all possible
locations and all possible directions, each line will be counted in two
directions. We discover not only the line from A to B, but from B to
A. The remedy is to divide the total count by two.

</p>


<font size="+2">
<b>Fifteen</b>
</font>
<A href="Javascript:openProblemRating(1850)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505616" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      78 / 175 (44.57%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      58 / 78 (74.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Larry</b> for 426.85 points (12 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      295.09 (for 58 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>

In the game of Fifteen, two players take turns covering one of the nine
numerals from 1 through 9. The dealer always moves first. His opponent,
the patron, wins only if he can cover three numerals that sum to 15 before
the dealer does the same. Given the move history of a game in progress,
the dealer having moved most recently, we are asked to decide the optimal
outcome for the patron.

</p>
<p>

This little game is no more complicated than tic-tac-toe. (In some
parts of the British Commonwealth, read "noughts and crosses".) Indeed,
Fifteen is just tic-tac-toe in disguise. To see why this is true,
construct a three-by-three magic square in which every row, column,
and diagonal sums to 15. One such magic square is the following.

</p>
<p>
<pre>
        2 7 6
        9 5 1
        4 3 8
</pre>
</p>
<p>

Playing tic-tac-toe on this grid, with the proviso that stalemates are
decided in favor of the player who moves first, is equivalent to Fifteen.
Since tic-tac-toe is such a simple game, and since we are only dealing
with move histories of length 1, 3, 5, and 7, it is tempting to solve the
problem with case-by-case analysis. Anyone who has played a dozen rounds
of tic-tac-toe can tell that the dealer is able to win from any opening
move, so the result for a move history of length 1 is always "LOSE". It
is also evident that when the move history has length 7, the patron
is making his last move, so he can win only by immediately making 15.
The remaining cases are not multitudinous, but enumerating them does
allow considerable latitude for error in the matter of array indexing.

</p>
<p>

The safer course is to write a recursive solution: the state space is
so small that we can carry out a depth-first search without fear of
timing out.  We shall work from the perspective of the player who has
moved most recently. We begin by examining all combinations of three
numerals drawn from that player's contribution to the move history. There
are few such combinations, and at any rate they can be generated with
a triply nested loop. Observe that only the moves at positions 0, 2,
4, and 6 of the move history can contribute to the dealer's sum, while
positions 1, 3, 5, and 7 belong to the patron.

</p>
<p>

If there is at least one winning sum, the player in question has
won. Otherwise, we iterate over each numeral still available for play,
recursively computing the outcome of using it as the opposing player's
next move. If the opposing player wins with at least one of these moves,
we must lose the game. But if the opposing player loses in every case,
then we will win, and the most recent move is to be considered a
winning move.

</p>
<p>
<pre>
def wins(moves, pi):
  poss = [[0, 2, 4, 6], [1, 3, 5, 7]]
  if (pi == 0 and len(moves) == 9):
    return 1
  for i in poss[pi]:
    for j in poss[pi]:
      for k in poss[pi]:
        if (i == j or j == k or k == i):
          continue
        if (i >= len(moves) or j >= len(moves) or k >= len(moves)):
          continue
        if (moves[i]+moves[j]+moves[k] == 15):
          return 1
  for m in range(1, 10):
    if (m not in moves and wins(moves+[m], not pi)):
      return 0
  return 1

def fifteen(moves):
  for m in range(1, 10):
    if (m not in moves and wins(moves+[m], 1)):
      return 'WIN '+str(m)
  return 'LOSE'
</pre>
</p>
<p>

The one special case is when the move history has length 9, which implies
that the dealer has won.

</p>


<font size="+2">
<b>Amoebae</b>
</font>
<A href="Javascript:openProblemRating(1814)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505616" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      17 / 175 (9.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      15 / 17 (88.24%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>NGBronson</b> for 780.43 points (16 mins 2 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      581.88 (for 15 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>

Ah, those slippery amoebae. We are given an array of Strings describing
a rectangular petri dish in which Culture X is cultivated. Every
character is either 'X', indicating a portion of an amoeba, or '.'
to signify emptiness. Amoebae are what in graph theory we would call
components, and what in this case look like clumps of edgewise connected
'X' characters. Given a second dish of the same dimensions but not
necessarily the same content, and knowing that amoebae are identical
under rotation, reflection, and translation, our job is to calculate the
size of the symmetric difference between the two collections of amoebae.

</p>
<p>

This is a long task, but not an unpleasant one if we go about it
methodically. It is best to begin with a floodfill that accomplishes
two things. On the one hand, it identifies the groups of squares
that constitute individual amoebae, marking each with a unique ID
number. On the other, it records the locations of the upper-leftmost
and bottom-rightmost squares of each amoeba so that we can enclose it
in a bounding box.

</p>
<p>

Let's look at some actual Java code that does this. (I tend to think
in C++, so the code is written in a style that should make for easy
translation.) We declare a pair of two-dimensional character arrays
to store the contents of each petri dish. We also have a pair of
two-dimensional integer arrays to store amoeba IDs, and another pair
for the corresponding bounding boxes. Finally, we declare variables to
conveniently store the dimensions of the petri dishes, and a two-element
linear array to store the number of amoebae in each dish.

</p>
<p>
<pre>
  char[][][] dishes = new char[2][50][50];
  int marked[][][] = new int[2][50][50];
  int boxes[][][] = new int[2][2500][4];
  int xlen, ylen, anum[] = new int[2];
</pre>
</p>
<p>

Before invoking the floodfill, we convert the input String arrays to
character arrays, and initialize the ID of every square to a sentinel
value. Then we iterate over all squares in each dish. If a given
square is 'X', we preemptively set the bounding box of the next amoeba
under construction to exactly this square, and then call the floodfill
function, passing it the index of the petri dish and the coordinates
of the current square. This functions bails out immediately if the
coordinates are invalid or if the square has already been assigned an
amoeba ID number. Otherwise, the square is assigned the ID of the newest
amoeba, and we update the bounding-box coordinates as necessary. Finally,
we step over to each of the four neighboring grid locations and call
the function recursively.

</p>
<p>
<pre>
  void markit(int n, int m, int r, int c) {
    if (r &lt; 0 || r &gt;= xlen || c &lt; 0 || c &gt;= ylen)
      return;
    if (marked[n][r][c] >= 0 || dishes[n][r][c] != 'X')
      return;
    marked[n][r][c] = m;
    boxes[n][m][0] = r &lt; boxes[n][m][0] ? r : boxes[n][m][0];
    boxes[n][m][1] = c &gt; boxes[n][m][1] ? c : boxes[n][m][1];
    boxes[n][m][2] = r &gt; boxes[n][m][2] ? r : boxes[n][m][2];
    boxes[n][m][3] = c &gt; boxes[n][m][3] ? c : boxes[n][m][3];
    markit(n, m, r-1, c);
    markit(n, m, r+1, c);
    markit(n, m, r, c-1);
    markit(n, m, r, c+1);
  }

  public int cultureX(String[] known, String[] candidate) {
    int i, j, n, m, t, t0, t1, r0, c0, r1, c1, rr, cc, diff, c;
    char sigs[][] = new char[8][3000];
    String sig, nsig;
    String[][] canons;
    xlen = known.length;
    ylen = known[0].length();
    anum[0] = anum[1] = 0;
    for (i = 0; i &lt; xlen; i++)
      for (j = 0; j &lt; ylen; j++) {
        marked[0][i][j] = marked[1][i][j] = -1;
        dishes[0][i][j] = known[i].charAt(j);
        dishes[1][i][j] = candidate[i].charAt(j);
      }
    for (n = 0; n &lt; 2; n++)
      for (i = 0; i &lt; xlen; i++)
        for (j = 0; j &lt; ylen; j++)
          if (marked[n][i][j] &lt; 0 &amp;&amp; dishes[n][i][j] == 'X') {
            boxes[n][anum[n]][0] = boxes[n][anum[n]][2] = i;
            boxes[n][anum[n]][1] = boxes[n][anum[n]][3] = j;
            markit(n, anum[n], i, j);
            anum[n]++;
          }
</pre>
</p>
<p>

So the floodfill is done, and we've got ID numbers and bounding boxes
for every amoeba. At this point, we could perform a pairwise comparison
of amoebae from each dish under every geometric operation. This would
take time in the order of <i>anum[0]*anum[1]</i> (liberally assuming
constant time to scan amoebae), which is eminently feasible, considering
that a 50-by-50 dish contains about 1000 small amoebae or 100 largish
ones. Nonetheless, we prefer to construct a concise linear-time solution
(again assuming constant cost per amoeba) that would run in reasonable
time on much larger data sets.

</p>
<p>

The idea is to map all geometric variants of a given amoeba shape to a
single string representation. We can then sort these canonical strings,
and merge the two lists derived from the two dishes in order to find
their intersection and hence the symmetric difference. To make the
canonical string for a given amoeba, we shall scan its bounding box,
appending '.' to the string each time we come across a square that does
not have the appropriate ID, and 'X' for each constituent square. We
also append an 'n' at the end of each line, so that the canonical string
encodes the dimensions of the bounding box.

</p>
<p>

We actually scan the bounding box in eight different ways. If the bounding
box encloses <i>rr</i> rows and <i>cc</i> columns, we shall scan four
<i>rr</i>-by-<i>cc</i> boxes and four virtual <i>cc</i>-by-<i>rr</i>
boxes. This distinction is necessary because half the rotations, namely
those of 90 and 270 degrees, have the effect of reversing the dimensions
of the amoeba. For each rotation, we scan the amoeba as well as its mirror
image. We do the same for rotations of 0 and 180 degrees, which do not
alter the amoeba dimensions. Note that the amoebae need only be reflected
in one axis, since the transformations that can be achieved with rotation
and horizontal reflection are exactly those that can be achieved with
rotation and vertical reflection. Once we have made all eight renderings,
we choose the lexicographically least as the canonical string. In this
way, all variations of an amoeba shape are reduced to the same thing.

</p>
<p>
<pre>
    canons = new String[2][anum[0] > anum[1] ? anum[0] : anum[1]];
    for (n = 0; n &lt; 2; n++)
      for (m = 0; m &lt; anum[n]; m++) {
        r0 = boxes[n][m][0];
        c0 = boxes[n][m][1];
        r1 = boxes[n][m][2];
        c1 = boxes[n][m][3];
        rr = r1-r0+1;
        cc = c1-c0+1;
        t = 0;
        for (i = 0; i &lt; rr; i++) {
          for (j = 0; j &lt; cc; j++) {
            sigs[0][t] = marked[n][r0+i][c0+j] == m ? 'X' : '.';
            sigs[1][t] = marked[n][r1-i][c0+j] == m ? 'X' : '.';
            sigs[2][t] = marked[n][r1-i][c1-j] == m ? 'X' : '.';
            sigs[3][t] = marked[n][r0+i][c1-j] == m ? 'X' : '.';
            t++;
          }
          sigs[0][t] = sigs[1][t] = sigs[2][t] = sigs[3][t] = 'n';
          t++;
        }
        t0 = t;
        t = 0;
        for (i = 0; i &lt; cc; i++) {
          for (j = 0; j &lt; rr; j++) {
            sigs[4][t] = marked[n][r1-j][c0+i] == m ? 'X' : '.';
            sigs[5][t] = marked[n][r1-j][c1-i] == m ? 'X' : '.';
            sigs[6][t] = marked[n][r0+j][c1-i] == m ? 'X' : '.';
            sigs[7][t] = marked[n][r0+j][c0+i] == m ? 'X' : '.';
            t++;
          }
          sigs[4][t] = sigs[5][t] = sigs[6][t] = sigs[7][t] = 'n';
          t++;
        }
        t1 = t;
        sig = new String(sigs[0], 0, t0);
        for (i = 1; i &lt; 8; i++)
          if ((nsig = new String(sigs[i], 0, i &lt; 4 ? t0 : t1)).compareTo(sig) &lt; 0)
            sig = nsig;
        canons[n][m] = sig;
      }
</pre>
</p>
<p>

The final step is to sort the two lists of canonical strings and merge
them. We step through the lists using a pair of indices. If the current
amoebae in each list are identical, we increment both indices. If they're
different, we increment the one pointing to the lesser amoeba, and also
increment the magnitude of the symmetric difference.

</p>
<p>
<pre>
    for (n = 0; n &lt; 2; n++)
      Arrays.sort(canons[n], 0, anum[n]);
    diff = 0;
    i = j = 0;
    while (i &lt; anum[0] &amp;&amp; j &lt; anum[1]) {
      if ((c = canons[0][i].compareTo(canons[1][j])) == 0) {
        i++;
        j++;
      }
      else {
        diff++;
        if (c &lt; 0)
          i++;
        else
          j++;
      }
    }
    diff += (anum[0]-i)+(anum[1]-j);
    return diff;
  }
</pre>
</p>
<p>

Once we have exhausted at least one of the lists, the magnitude of
the symmetric difference is augmented by the number of amoebae left in
the other.

</p>

<p>
<img src="/i/m/Eeyore_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="273434" context="algorithm"/><br />
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
