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
<tc-webtag:forumLink forumID="505640" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 185</span><br>Monday, March 1, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
Most Division 1 coders breezed through the Easy and Medium problems,
only to fall into a bottomless pit of a Hard.  Only <b>SnapDragon</b>
and <b>John Detheridge</b> succesfully completed all three problems,
with both of their submissions on the Hard coming in the last
few minutes.
In Division 2, there was a minor bloodbath on the Easy problem when
many coders rounded down instead of up.  <b>marek.cygan</b> eventually
prevailed by less than a challenge over runnerup <b>king</b>.  First-timer
<b>villiros</b> would have come in third if not for a mistaken challenge.
</p> 

<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>PassingGrade</b> 
</font> 
<A href="javascript:openProblemRating(1962)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505640" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      233 / 262 (88.93%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      135 / 233 (57.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>generator</b> for 245.20 points (3 mins 59 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      193.52 (for 135 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
The fact that you know the scores on individual assignments is a
distraction.  All you really need is three numbers: the total points
possible in the course (<tt>totalPoss</tt>), the total points you've
earned so far (<tt>earned</tt>), and the maximum points you can score
on the final exam (<tt>final</tt>).  You can calculate
<tt>totalPoss</tt> by summing the points possible on each assignment,
plus the points possible on the final exam.  Similarly, you can calculate
<tt>earned</tt> by summing the points earned on each assignment.
</p>

<p>
You can then loop over all integers from 0 to <tt>final</tt>, inclusive,
and return the smallest one that gives you an overall percentage of 65% or 
better.  If no such number exists, return -1.
</p>

<p>
Alternatively, you can calculate the points you need directly as
<pre>
   pointsNeeded = (65*totalPoss+99)/100 - earned
</pre>
The "+99" ensures that you round up.  Then you just have to check
that <tt>pointsNeeded</tt> is between 0 and <tt>final</tt>.  If it's
less than 0, return 0.  If it's greater than <tt>final</tt>, return -1.
</p>

<p>
The most common problem involved rounding <tt>pointsNeeded</tt> incorrectly.
If you accidentally rounded down then you would occasionally return an 
answer that would leave you just shy of the 65% mark.
Another easy mistake to make was to write
<pre>
   for (int pts = 0; pts &lt; finalExam; pts++)
      ...
</pre>
instead of
<pre>
   for (int pts = 0; pts &lt;= finalExam; pts++)
      ...
</pre>
Then you would fail to detect cases where you could only pass with a perfect
score on the final.
</p>

<font size="+2"> 
<b>TandemRepeats</b> 
</font> 
<A href="javascript:openProblemRating(2377)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505640" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      149 / 262 (56.87%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      101 / 149 (67.79%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>villiros</b> for 463.23 points (8 mins 8 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      326.58 (for 101 correct submissions) 
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
      233 / 238 (97.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      204 / 233 (87.55%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ZorbaTHut</b> for 247.04 points (3 mins 7 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      213.01 (for 204 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Brute force is the way to go here.  Try every neighboring pair of sequences
and count how many characters are different.  Keep track of the length of
the longest base sequence for which the number of errors is small enough.
</p>

<p>
The biggest variations in this problem are in the loops used to generate
all neighboring pairs of sequences.  In the following code snippets, let N
be the length of the overall sequence.  The first variation is to generate
all possible start points for the two sequences, making sure that there is
enough room for the second sequence
<pre>
  for (int i = 0; i &lt; N; i++)
     for (int j = i+1; j+(j-i)-1 &lt; N; j++)
        ...
</pre>
Notice that <tt>j-i</tt> is the length of the first sequence, so
<tt>j+(j-i)-1</tt> is the index of the last position in the second
sequence.
</p>

<p>
As a side note, many people would write the bound on the outer loop as
N-1 instead of N.  I prefer to write it as N because it is quicker to
type and requires less thought.  It'll have the same effect in the end
because when <tt>i</tt> is N-1, the inner loop will exit immediately.
</p>

<p>
The second major approach to writing these loops is to loop over the
possible sequence lengths and the possible start points of the first
sequence, as in
<pre>
  for (int len = 1; len &lt;= N/2; len++)
     for (int i = 0; i+2*len-1 &lt; N; i++)
        ...
</pre>
where <tt>i+2*len-1</tt> is again the index of the last position in the
second sequence (which starts at index <tt>i+len</tt>).
</p>

<font size="+2"> 
<b>Hilbert</b> 
</font> 
<A href="javascript:openProblemRating(2376)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505640" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      900 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      20 / 262 (7.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      11 / 20 (55.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>czh02</b> for 503.12 points (30 mins 57 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      411.70 (for 11 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
David Hilbert invented the Hilbert curve in 1891.  It is now
the most famous of the so-called space-filling curves, although
it was not the first (that honor goes to Peano).
</p>

<p>
A quick web search might have netted you several dozen implementations of
Hilbert curves, but they wouldn't have helped much because the constraints
allowed grids containing about a billion points.  You didn't have the luxury
of generating the entire curve, so you needed to come up with a way
to skip over large chunks of it at a time.
</p>

<p>
The key insight is to realize that identifying the quadrant of the
target point allows us to account for all the previous quadrants
without actually stepping through them.  For example, 
if we know that the target point is in the third quadrant, then we merely
include
4<sup><b>k</b>-1</sup> steps for each of the previous two quadrants.
All that remains is to determine the number of steps within the current
quadrant, which can be calculated recursively.
</p>

<p>
The tricky part is accounting for the different orientations of
the four quadrants.  When making a recursive call, we need to
modify the coordinates of the target point relative to the starting
point and orientation of that quadrant.  For the first quadrant,
this boils down to swapping the x and y coordinates.  For the second
and third quadrants, you simply subtract an offset from one or both
coordinates.  For the fourth quadrant...well, yes, then there's the
fourth quadrant.  I could try to explain the formula for the fourth
quadrant, but an explanation wouldn't help.  The only way to understand
the formula for that case is to draw a couple pictures and play with
them for a while.  (You do keep a pad of paper next to you during
SRMs for drawing pictures, don't you?)
</p>

<p>
Altogether, the code is surprisingly short
<pre>
  define steps(k,x,y) is
      if k == 0 then return 0

      dim = 2<sup>k-1</sup>           // <i>width of a quadrant</i>
      quad = dim*dim      // <i>steps in a quadrant</i>

      if (x,y) is in upper left quadrant then
          return steps(k-1,y,x)
      if (x,y) is in lower left quadrant then
          return quad + steps(k-1,x,y-dim)
      if (x,y) is in lower right quadrant then
          return 2*quad + steps(k-1,x-dim,y-dim)
      if (x,y) is in upper right quadrant then
          return 3*quad + steps(k-1,dim-y+1,2*dim-x+1)
</pre>
</p>

<font size="+2"> 
<b>EulerianRace</b> 
</font> 
<A href="javascript:openProblemRating(2373)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505640" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      550 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      171 / 238 (71.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      150 / 171 (87.72%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 508.20 points (8 mins 17 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      306.98 (for 150 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Leonhard Euler invented graph theory in about 1736 to solve a
puzzle about the bridges of Konigsberg (which also
happens to be the birthplace of David Hilbert, about a century
later).  Euler showed that you could not stroll through the town along
a route that crossed each of the town's seven bridges once and only
once, but that you could do so if each land mass touching the
bridges was connected to a positive, even number of bridges, and
furthermore that such a configuration allows you to return to your
starting point.  This problem is essentially a constructive proof of
this theorem.
</p>

<p>
Both the proof and the algorithm hinge on the ability to construct
cycles.  Suppose all checkpoints are connected to an even
number of unused bridges.  If you start at a checkpoint K and leave across
an unused bridge, then there is always a way to get back to K along some other
unused bridge.  Why?  Because it is impossible to get "stuck" someplace other
than K.  To get "stuck" you would have to enter a checkpoint but not be
able to leave it.  But because each checkpoint is connected to an <i>even</i>
number of unused bridges, you know that if there was an unused bridge that
you could use to enter the checkpoint, then there is another unused bridge that
you can use to leave the checkpoint.  Similarly, because there was an unused
bridge that you could use to leave checkpoint K, there will be another unused
bridge that you can use to re-enter checkpoint K.
</p>

<p>
The algorithm keeps building such cycles and splicing them together
until you run out of bridges.  The problem statement specified a certain
order in which to build the cycles and splice them together, so as long
as you followed those directions, you were probably okay.
</p> 

<p>
See <b>TAG</b>'s submission for a particularly clear implementation of this algorithm.
</p>

<font size="+2"> 
<b>CounterfeitCoin</b> 
</font> 
<A href="javascript:openProblemRating(2371)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505640" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1100 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      5 / 238 (2.10%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 5 (40.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>John Dethridge</b> for 457.21 points (53 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      455.88 (for 2 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This problem was brutal, with the only two successful submissions
taking nearly an hour each to code.  Lots of people found it relatively
easy to get started, but then you type...and type...and type...and type.
And even then you still have another three corner cases to deal with!
<b>SnapDragon</b> nominated it as the hardest SRM problem ever, but
the sentimental favorite in the ensuing discussion was <i>Cassette</i>.
</p>

<p>
To get anywhere on this problem, you had to realize that,
with a maximum of 26 coins, it is utterly hopeless to try all possible
weighings, even using dynamic programming or memoization.  The trick is
to classify coins in four categories:
<ul>
<li> Category A: those about which nothing is known</li>
<li> Category B: those that might be heavy, but are known not to be light</li>
<li> Category C: those that might be light, but are known not to be heavy</li>
<li> Category D: those that are known to be good</li>
</ul>
We can always swap coins in the same category without affecting the
maximum number of weighings that might be required, so for most of the problem
we can work with the numbers of coins in each category, without worrying
about the identities of those coins.  Let #A, #B, #C, and #D
represent the number of coins in each category.
</p>

<p>
The algorithm breaks into three stages:
<ol>
<li> Calculate #A, #B, #C, and #D from the results of the previous weighings.</li>
<li> From #A, #B, #C, and #D, determine the optimal number of weighings needed
     to find the counterfeit coin and whether it is heavy or light.</li>
<li> Choose the best coins to use in the next weighing from among the
     possible arrangements that achieve the optimal number of weighings.</li>
</ol>
</p>

<p>
In stage 1, we keep track of the category for each individual coin.
Initially, all coins are in category A.  For each "even" weighing, we
move all the coins involved in that weighing to category D.  For each
"left heavy" or "right heavy" weighing, we move all the coins
<i>not</i> involved in the weighing to category D, along with all
category C coins from the heavy side and all category B coins from the
light side.  In addition, we move all category A coins on the heavy
or light side to category B or C, respectively.
</p>

<p>
From #A, #B, #C, and #D, we can check for two special
cases.  If #A+#B+#C is 0, then there has been an error in the
previous weighings.  If #A is 0 and #B+#C is 1, then we have 
already found the counterfeit coin (and whether it is heavy or light).
</p>

<p>
In stage 2, we build a table W[a][b][c] of the numbers of weighings
required for the various combinations of #A, #B, and #C.  (Note that we
don't need W[a][b][c][d], because #D is fully determined by the other three values 
as #D = N-#A-#B-#C.)  To build this table,
we can use dynamic programming or memoization, but I found memoization to
be significantly easier to code for this problem.  Memoization has the
further advantage that it ignores those configurations that are impossible
to achieve.  For example, if N = 26, it is impossible to come up with
a set of weighings that would leave you with #A = 25.
</p>

<p>
For each configuration of #A, #B, and #C (which together imply #D), 
we try all possible ways of arranging the coins on the scale.  
There are various tricks you could
use to prune the number of arrangements to consider in this step, but
the only one I bothered with was to insist that category D coins could
only be used on the right-hand side of the scale.  I used six (!) nested
loops to generate the different possibilities for the numbers of
category A/B/C coins on the left/right side, adding category D coins
to the right-hand side at the end to even out the numbers of coins
on each side.  (Incidentally, this beats by one my previous personal record for deeply
nested loops in a TopCoder problem&#8212;and on <i>that</i> problem I had
four people unsuccessfully challenge me because they couldn't believe five
nested loops would run fast enough.)
</p>

<p>
For each arrangement, you figure out what the new values of #A, #B, and #C
would be for each possible result (even, left-heavy, and right-heavy).
Then you recursively check the optimal number of weighings after each of those 
three results, and keep the maximum, plus one for the current weighing.
That is the best you can do for <i>this</i> arrangement of coins.
As we loop through all possible arrangements, we keep the minimum of
all these maximums.
</p>

<p>
There are two corner cases to worry about here.  The first is that not
all results are possible on all weighings.  For example, if we have
determined which coin is counterfeit but still need to find whether it
is heavy or light, then we weigh it against one of the good coins.  It
is impossible for the result of this weighing to be "even".  One
way to handle such cases is to initialize W[0][0][0] to be some negative
value, so that it will never be chosen as the maximum.
</p>

<p>
The other corner case to worry about is weighings that give you
no new information.  For example, suppose #A is 0.  Then, if you
put all the category B coins on one side and all the category C
coins on the other side, you know the category B side will be
heavier.  If you're not careful, you can easily end up with an
infinite loop here.  The simplest solution is to test for such cases
and skip over them.
</p>

<p>
Finally, in stage 3, we decide which coins to use in the next weighing.
By now, we know the optimum number of weighings.
We can generate all possible ways of arranging
the various categories of coins using the same six nested loops from Stage 2,
and look for those arrangements that achieve the optimum.
For each such arrangement, we find the best (ie,
shortest and lexicographically earliest) way to assign the actual coin
labels
to this arrangement.  For example, we can loop through the coin labels
in order, and assign each coin to the left-hand side (if that side
still needs a coin of the appropriate category) or to the right-hand side (if
that side still needs a coin of the appropriate category).  Remember that 
we know the category of each coin from stage 1.  There was a slight
gotcha here that, if you insisted in stage 2 that category D coins
only go on the right-hand side, you still have to consider in this stage
the possibility that the category D coins should go on the left instead,
because that might produce a better string.
Fortunately, the preference
for short strings means we don't have to pad the answers with category
D coins on both sides.
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
