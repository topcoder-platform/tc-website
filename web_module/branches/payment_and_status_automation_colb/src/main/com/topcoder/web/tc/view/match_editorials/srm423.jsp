<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 423 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13514">Match Overview</a><br />
    <tc-webtag:forumLink forumID="524126" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 423</span><br />Tuesday, October 28, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
This match featured another conceptual problem set from <tc-webtag:handle coderId="13351270" context="algorithm"/>. If
in the previous his SRM 403 all problems
were about numbers composed of digits 4 and 7, in this SRM all problems were about checkers on rectangular board.
Somewhat unexpectedly, the match turned out to be very tough. In Division 1 only 17 coders solved the Medium and only
4 coders solved the Hard. Nobody was able to finish both these problems correctly.
<tc-webtag:handle coderId="20315020" context="algorithm"/> won his first SRM with
correct solutions on first two problems and 275 challenge points.
<tc-webtag:handle coderId="14769155" context="algorithm"/> had the fastest Hard, but got only
the second place because of skipped Medium.
<tc-webtag:handle coderId="10574855" context="algorithm"/> rounded the Top-3.
<tc-webtag:handle coderId="14970299" context="algorithm"/>, the author of the fastest Medium,
took the fourth place.
</p>
<p>
In Division 2 nobody was able to solve the Hard problem and only 16 coders succeded in solving the Medium. The fastest among
them was <tc-webtag:handle coderId="22723484" context="algorithm"/>, however he didn't get anything during the Challenge phase and took only the second place.
The first place was taken by <tc-webtag:handle coderId="22263402" context="algorithm"/> with 200
challenge points. <tc-webtag:handle coderId="22702691" context="algorithm"/> with 150 challenge points got the bronze.
</p>
 
<h1> 
The Problems 
</h1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9966&amp;rd=13514" name="9966">TheSimpleGame</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9966)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524126" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      515 / 555 (92.79%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      469 / 515 (91.07%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>kemo</strong> for 248.46 points (2 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      208.18 (for 469 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem is really straightforward. We need to consider each checker separately and choose the closest corner to it.
This is done by calculating the distance from the checker to each of 4 corners and choosing the minimum. The distance
between cells (x, y) and (x', y') is equal to |x - x'| + |y - y'|.
</p>
<pre>
public class TheSimpleGame {
  public int count(int n, int[] x, int[] y) {
    int res = 0;
    int[] cx = new int[] {1, 1, n, n};
    int[] cy = new int[] {1, n, 1, n};
    for (int i=0; i &lt; x.length; i++) {
      int dst = 10000;
      for (int j=0; j &lt; 4; j++)
        dst = Math.min(dst, Math.abs(x[i] - cx[j]) + Math.abs(y[i] - cy[j]));
      res += dst;
    }
    return res;
  }
}
</pre>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9976&amp;rd=13514" name="9976">TheTower</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9976)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524126" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      167 / 555 (30.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      16 / 167 (9.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Secluder</strong> for 512.48 points (12 mins 10 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      346.75 (for 16 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      300 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      326 / 435 (74.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200 / 326 (61.35%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Petr</strong> for 295.59 points (3 mins 28 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      228.88 (for 200 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Let's fix some K and try to find the best way to gather some K checkers in the same cell. To do this, we first consider
a very slow approach: iterate through all possible subsets of K checkers and for each subset find the best way to gather
all checkers from it in the same cell. The following question immediately arises: how to solve the problem for a fixed subset
of K checkers? If we have K checkers located at (x[1], y[1]), ..., (x[k], y[k]) and wish to move them into the cell (x, y),
the number of required moves will be (|x - x[1]| + ... + |x - x[k]|) + (|y - y[1]| + ... + |y - y[k]|)
= (|x - x[1]| + ... + |x - x[k]|) +
(|y - y[1]| + ... + |y - y[k]|). The sum is broken into two separate sums, where the first one is dependent only on x and the
second one is dependent only on y. It means we can choose x and y independently.
</p>
<p>
Let's show that the best x is one of x[i] (in fact, the best x is the median of all x[i], but we don't need this fact to solve
the problem). Sort x[i] in non-descending order: x[1] &le; ... &le; x[k]. Suppose that the best x is not one of x[i] and is located
between points x[j] and x[j+1]: x[j] &lt; x &lt; x[j+1]. We have j points to the left of x and k - j points to the right.
If j &lt; k - j, then changing x to x + 1 will increase the distance to the left points by j and decrease the distance
to the right points by k - j. In total the distance will decrease by k - 2*j &gt; 0. Similarly, if j &gt; k - j, then changing
x to x - 1 will decrease the total distance by 2*j - k &gt; 0. So the only case when x can be optimal, is when
j = k - j. But in this case the distance is the same on the whole segment [x[j], x[j+1]], so x = x[j] or x = x[j+1] also
produce the best total distance.
</p>
<p>
So what we have is that the best meeting point for any subset of checkers is of form (x[i], y[j]), where both x[i] and y[j]
are some input coordinates. At the first glance, it doesn't help much because we can't iterate through all subsets of checkers
(it can be as much as 2^50 subsets).
But the correct idea is near: we can iterate through all possible meeting points (it can be at most 2500 such points)!
For each meeting point we will then need to answer the question: which subset of K checker is best gathered at this meeting
point? And the answer is simple: this is the subset containing K closest checkers to this meeting point. So finally
our solution in pseudocode looks as follows:
</p>
<pre>
Fill <em>result</em> array by sufficiently large numbers
Iterate through all x[i]
  Iterate through all y[j]
    Iterate through all K
      Choose a subset containing K closest checkers to the cell (x[i], y[j])
      Calculate the <em>cost</em> of gathering these checkers in (x[i], y[j])
      Set <em>result</em>[K] := min(<em>result[K]</em>, <em>cost</em>)
</pre>
<p>Java implementation of this approach follows.</p>
<pre>
import java.util.*;
public class TheTower {
  public int[] count(int[] x, int[] y) {
    int N = x.length;
    int[] res = new int[N];
    Arrays.fill(res, 1000000000);
    int[] dst = new int[N];
    for (int i=0; i&lt;N; i++)
      for (int j=0; j&lt;N; j++) {
        // calculate distance from (x[i], y[j]) to all checkers
        for (int k=0; k&lt;N; k++)
          dst[k] = Math.abs(x[i] - x[k]) + Math.abs(y[j] - y[k]);

        // sort distances
        Arrays.sort(dst);

        // for each K choose the subset of K closest checkers
        int sum = 0;
        for (int k=0; k&lt;N; k++) {
          sum += dst[k];
          res[k] = Math.min(res[k], sum);
        }
      }
    return res;
  }
}
</pre>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9977&amp;rd=13514" name="9977">TheEasyChase</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9977)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524126" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      28 / 555 (5.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 28 (0.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>null</strong> for null points (NONE) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td> 
  </tr> 
</table></blockquote> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      120 / 435 (27.59%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      17 / 120 (14.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Egor</strong> for 336.07 points (22 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      239.54 (for 17 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Despite very low success rate, this problem is nothing more than standard combinatorial game problem. Though there
are two things that make this problem harder:
</p>
<ol>
<li>Usually you are only asked for a winner, but here you should additionally return the number of
moves before the game finishes.</li>
<li>Combinatorial games are usually acyclic, i.e. it's impossible to repeat the same position
two or more times in the games. In this game it's possible.</li>
</ol>
<p>
Let's describe a general way of solving such problems. First, we need to identify the set of states (positions) that
can occur during the game. Here the state of the game is vector (white piece position, black piece position,
player to do the next move).
</p>
<p>
For each state we need to find the outcome of the game (WIN if the player to do the next move will win, LOSE if this
player will lose, DRAW if the game will last infinitely without either player winning). Note that for this game DRAW is
impossible, but there are games where some states lead to DRAW. For each state where the outcome is not DRAW we additionally
need to calculate the number of moves the game will last.
</p>
<p>
There are two possible approaches to do this calculations. The first one is iterative and the second one is a variation
of breadth first search. The first approach works slower, but for this problem both algorithms are fine. The proof of
algorithms' correctness is left to the reader, but it's worth noting that both are based on the following simple
recursive definitions:
</p>
<ul>
<li>the position's outcome is WIN if there's a move from it that leads to a position with outcome LOSE;</li>
<li>the position's outcome is LOSE if all moves from it lead to positions with outcome WIN;</li>
<li>outcome for all other positions is DRAW.</li>
</ul>
<p>
The pseudocode for iterative algorithm is given below (it uses two array - OUTCOME[state] is game's outcome and
MOVES[state] is the number of moves before the game's end):
</p>
<pre>
Set OUTCOME for all states as UNKNOWN

Set OUTCOME to WIN and MOVES to 1 for all states
    where it's possible to win in 1 move

Do the following iteration until there are updates in OUTCOME:
  Iterate through all states
    If from some state A there's a move to a state B where OUTCOME[B] = LOSE:
      Set OUTCOME[A] to WIN
      Set MOVES[A] to min{MOVES[B]+1} by all B such that
        a) there's a move from A to B
        b) OUTCOME[B] = LOSE
    If all moves from some state A lead to states B where OUTCOME[B] = WIN:
      Set OUTCOME[A] to LOSE
      Set MOVES[A] to max{MOVES[B]+1) by all B such that
        there's a move from A to B

For all states where OUTCOME is UNKOWN, set OUTCOME to DRAW
</pre>
<p>
Check <tc-webtag:handle coderId="8357090" context="algorithm"/>'s
 <a href="/stat?c=problem_solution&amp;rm=299103&amp;rd=13514&amp;pm=9977&amp;cr=8357090">code</a>
for an implementation of similar approach.
</p>
<p>
The complexity of the previous approach can be estimated as
O(MAX_MOVES_BEFORE_GAME_FINISH * STATES_NUMBER * MAX_MOVES_FROM_A_SINGLE_STATE).
Another approach uses a queue which contains all positions for which outcome is known.
Each state is thus visited at most one time and the complexity of the algorithm is
O(STATES_NUMBER * MAX_MOVES_FROM_A_SINGLE_STATE). The approach is very similar to breadth first
search, of course with some modifications. The pseudocode for it is shown below (it additionally
uses one more array NEED; it contains the number of moves to winning positions from a state we still
need to find in order to confirm that the outcome for this state is LOSE):
</p>
<pre>
Set OUTCOME for all states as UNKNOWN
Set NEED for all states as the number of possible from from the state

For all states where it's possible to win in 1 move
  Set OUTCOME to WIN
  Set MOVES to 1
  Put this state into the queue

While the queue is not empty
  Get the state A from the queue
  For all states B such that there's a move from B to A
    If OUTCOME[A] is WIN
      Decrease NEED[B] by 1
    If (OUTCOME[A] is LOSE) or (OUTCOME[A] is WIN and NEED[B] is 0)
      Set OUTCOME[B] to (not OUTCOME[A])
      Set MOVES[B] to MOVES[A]+1
      Add B to the queue

For all states where OUTCOME is UNKNOWN, set OUTCOME to DRAW
</pre>
<p>
For a contest submission using this approach take a look at <tc-webtag:handle coderId="10574855" context="algorithm"/>'s
<a href="/stat?c=problem_solution&amp;rm=299099&amp;rd=13514&amp;pm=9977&amp;cr=10574855">solution</a>.
</p>
<p>
You can also find <a href="http://forums.topcoder.com/?module=Thread&threadID=626602&start=0">this</a> and
<a href="http://forums.topcoder.com/?module=Thread&threadID=626748&start=0">this</a> threads about this problem
helpful.
</p>
<p>
<u>Excercise.</u> Initially this problem allowed <strong>n</strong> up to 50. How to solve the problem under such constraints?
Note that even the second described approach will be too slow.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9975&amp;rd=13514" name="9975">TheBeautifulBoard</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9975)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524126" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      27 / 435 (6.21%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 27 (14.81%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>lukasP</strong> for 463.64 points (42 mins 56 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      372.19 (for 4 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Main difficulty in this problem comes from the necessity to count different checkers placements as equal if they become the
same after one or several board rotations. Note that each placement becomes the same after 4 board rotations, however
some placements repeat themselves after 2 or even 1 board rotations. Let's denote the number of placements that require
at least 4 rotations to repeat themselves as C4, that require at least 2 rotations - as C2 and that require
just 1 rotation - as C1.
</p>
<p>
It's not hard to see that all C4 placements are broken into groups of four, where all placements within a group are the same,
all C2 placements are broken into the pairs of the same placements, and all C1 placements are distinct. Therefore, the
total number of distinct placements is C4/4 + C2/2 + C1.
</p>
<p>
Now, let's denote the number of placements that become the same after 4 rotations (this includes those placements that become
the same after 2 or 1 rotations) as T4, that become the same after 2 rotations (including those that become the same after
1 rotation) as T2, and that become the same after 1 rotation as T1. T and C values are connected as follows:
</p>
<pre>
T4 = C4 + C2 + C1
T2 = C2 + C1
T1 = C1

&lt;=&gt;

C1 = T1
C2 = T2 - T1
C4 = T4 - T2
</pre>
<p>
So, it's enough for us to calculate T1, T2 and T4. First let's calculate T4, i.e. the number of all possible placements.
Denote the number of checkers we have of each color as ch[0], ..., ch[k-1]. If n^2 &lt; ch[0] + ... + ch[k-1], then there's
no possible placements and we can return 0. Otherwise, there are C(n^2, ch[0]) ways to put checkers of color 0, C(n^2 - ch[0], ch[1])
ways to put checkers of color 1 on the remaining positions, and so on. Here C(N, M) is the number of ways to choose M positions
from N, i.e. N! / (M! * (N-M)!). We get the following formula for T4:
</p>
<pre>
T4 = C(n^2, ch(0)) * C(n^2-ch[0], ch[1]) * ... * C(n^2-ch[0]-...-ch[k-2], ch[k-1]) =

  n^2 * (n^2 - 1) * ... * (n^2 - ch[0] - ... - ch[k-1] + 1)
= ---------------------------------------------------------
             ch[0]! * ch[1]! * ... * ch[k-1]!
</pre>
<p>
We will need to do similar calculations several more times, so let's denote the number of ways to put objects of k colors
where there are ch[i] object of color i onto N positions as choose(N, ch[0], ..., ch[k-1]). So T4 = choose(n^2, ch[0], ...,
ch[k-1]).
</p>
<p>
Now let's calculate T2. To do this, note that all cells of the board are broken into pairs of cells that come into each other
after 2 rotations. The only exception is the case when n is odd, in this case the central cell always remains the same
after rotation and the other cells are still broken into pairs. In order for a placement to repeat itself after two
rotations, we need to ensure for each pair that either both cells in it contain checkers of the same color or
both cells in it are empty. We have 2 possible cases here:
</p>
<ol>
<li>n is even. If at least one of ch[i] is odd, then T2 = 0 (we can't distribute odd number of checkers into pairs).
Otherwise we need to distribute checkers into n^2/2 pairs, so T2 = choose(n^2/2, ch[0]/2, ..., ch[k-1]/2).</li>
<li>n is odd. Here we have (n^2-1)/2 pairs and one central cell. If none of ch[i] is odd, then we
just distribute all checkers into pairs and leave the central cell empty: T2 = choose((n^2-1)/2, ch[0]/2, ..., ch[k-1]/2).
If only one ch[i] is odd, we put one checker of color i into the central cell and distribute all other cells into pairs:
T2 = choose((n^2-1)/2, ch[0]/2, ..., (ch[i]-1)/2, ..., ch[k-1]/2). Finally, if two or more ch[i] are odd, then T2 = 0.</li>
</ol>
<p>
Calculation of T1 is similar. All cells are broken into groups of four (except central cell for odd n) and all cells within a
group must be either empty or filled by checkers of the same color. This gives the following cases:
</p>
<ol>
<li>n is even. If at least one of ch[i] is not divisible by 4, then T4 = 0, otherwise
T1 = choose(n^2/4, ch[0]/4, ..., ch[k-1]/4).</li>
<li>n is odd. At most one ch[i] can be not divisible by 4 and it should give 1 in remainder, otherwise T4 is 0.
If all ch[i] are divisible by 4, then T1 = choose((n^2-1)/4, ch[0]/4, ..., ch[k-1]/4). If only one ch[i]
gives 1 in remainder, then T1 = choose((n^2-1)/4, ch[0]/4, ..., (ch[i]-1)/4, ..., ch[k-1]/4).</li>
</ol>
<p>
One final note is that for calculation of choose it's useful to precalculate inversions of all factorials upto 100,000!.
To calculate inversion of an integer X it's helpful to apply Small Fermat Theorem: inv(X) = X^1234567889 MOD 1234567891 (note
that 1234567891 is a prime number).
</p>
<p>
Java implementation of this approach follows. In this implementation I tried to treat calculations of T1, T2 and T4 in a
similar way.
</p>
<pre>
public class TheBeautifulBoard {
  final long MODULE = 1234567891;
  long[] inv = new long[100001];

  // a^b MOD 1234567891
  long pow(long a, long b) {
    if (b==0) return 1;
    long x = pow(a, b/2);
    x = (x * x) % MODULE;
    if (b % 2 == 1) x = (x * a) % MODULE;
    return x;
  }

  // multiplicative inversion of x
  long calcInv(long x) {
    return pow(x, MODULE-2);
  }

  // calculating choose(all, cnt[0], ..., cnt[k-1])
  long choose(long all, int[] cnt) {
    long res = 1;
    long sum = 0;
    for (int i=0; i &lt; cnt.length; i++)
      sum += cnt[i];
    all %= MODULE;
    for (int i=0; i &lt; sum; i++) {
      res = (res * all) % MODULE;
      all--;
      if (all&lt;0) all += MODULE;
    }
    for (int i=0; i &lt; cnt.length; i++)
      for (int j=1; j &lt;= cnt[i]; j++)
        res = (res * inv[j]) % MODULE;
    return res;
  }

  // calculates T based on a parameter rot
  // rot = 4 gives T1
  // rot = 2 gives T2
  // rot = 1 gives T4
  long calcT(long n, int[] A, int rot) {
    int C1 = 0;
    for (int i=0; i &lt; A.length; i++) {
      if (A[i] % rot &gt; 1) return 0;
      if (A[i] % rot == 1) C1++;
    }
    if (C1 &gt; 1) return 0;
    if (C1 == 1 &amp;&amp; n % 2 == 0) return 0;
    for (int i=0; i &lt; A.length; i++)
      A[i] /= rot;
    return choose(n * n / rot, A);
  }

  public int count(int n, int[] A) {
    // precalculate inversions
    for (int i=1; i&lt;=100000; i++)
      inv[i] = calcInv(i);

    // checking whether all checkers fit onto the board
    long all = (long)n * (long)n;
    int sum = 0;
    for (int i=0; i &lt; A.length; i++)
      sum += A[i];
    if (sum &gt; all) return 0;

    // calculate T
    long T1 = calcT(n, A.clone(), 4);
    long T2 = calcT(n, A.clone(), 2);
    long T4 = calcT(n, A.clone(), 1);

    // calculate C
    long C1 = T1, C2 = T2 - T1, C4 = T4 - T2;
    while (C2 &lt; 0) C2 += MODULE;
    while (C4 &lt; 0) C4 += MODULE;

    // calculate answer
    long res = C1;
    res = (res + C2 * inv[2]) % MODULE;
    res = (res + C4 * inv[4]) % MODULE;
    return (int)res;
  }
}
</pre>
<br />


<div class="authorPhoto">
    <img src="/i/m/ivan_metelsky_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10481120" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
