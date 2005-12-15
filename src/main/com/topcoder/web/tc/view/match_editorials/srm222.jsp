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
<tc-webtag:forumLink forumID="505699" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 222</span><br>Tuesday, December 7, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p>In Division 2, <b>astaroth</b> took top honors, narrowly edging out <b>jachor</b>, and
<b>palo</b> in third.  Each of the top three solved all three problems correctly.  <b>cbudin</b>,
who finished in fourth was the last correct entry for the hard problem, although his easy fell
to system tests.</p>

<p>A special congratulations goes to <b>palo</b>, as the highest scoring newbie.</p>

<p>In Division 1, three top ranking coders took the top three slots, with <b>SnapDragon</b>
winning by a commanding margin.  <b>Yarin</b> and <b>Eryx</b> took second and third.
<b>ivan_metelsky</b>, in fourth, was the fourth of the coders who successfully solved the hard
problem.</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3442&amp;rd=5868" name="3442">TextCompressor</a></b>
</font>
<A href="Javascript:openProblemRating(3442)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505699" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level One: <blockquote><table cellspacing="2" ID="Table1">
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
      159 / 198 (80.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      81 / 159 (50.94%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>csd98412</b> for 243.89 points (4 mins 31 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      178.69 (for 81 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>This problem only deals with a string of at most 50 characters, so brute force searching
for a solution is not difficult.  The trick is to start with the largest possible substring,
and work your way down to a smaller one, returning the result you find first.  For each possible
size substring, start at the left and try to find a repeat.  Once you find a repeat, since you
started with the largest first, and started at the left, you know you've got the proper result.</p>

<pre>
public String longestRepeat(String sourceText) {
   for (int i = sourceText.length() / 2; i &gt; 0; i--)
      for (int j = 0; j &lt; sourceText.length() - i; j++)
         if (sourceText.indexOf(sourceText.substring(j, j + i), j + i) &gt; 0)
            return sourceText.substring(j, j + i);
   return "";
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3450&amp;rd=5868" name="3450">GroceryBagger</a></b>
</font>
<A href="Javascript:openProblemRating(3450)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505699" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2" ID="Table2">
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
      158 / 198 (79.80%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      130 / 158 (82.28%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>isv</b> for 486.85 points (4 mins 41 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      388.29 (for 130 correct submissions)
    </td>
  </tr>
</table></blockquote>


Used as: Division One - Level One: <blockquote><table cellspacing="2" ID="Table3">
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
      170 / 171 (99.42%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      164 / 170 (96.47%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>lars</b> for 248.94 points (1 mins 51 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      231.65 (for 164 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>There are several ways to go about this problem, all of which can work.  Essentially, you
must first identify which categories of items need to be bagged.  Then, count the number of items
in each category.  Then, for each category, determine how many bags are needed for the items of
that category.  Add up the number of bags, and you have a result.</p>

<p>One fast way to code the counting of the items in each category is to use a hashtable (of
which some variety is available in every language) where the category is the key, and the number
of items is the value.  Then, at the end, loop through all the entries in the hashtable.</p>

<p>Another interesting approach is to first sort the list of item types, and then work through
that list, keeping a count of how many of the "current" item types there are.  When you reach an
item of a new type, you can count the number of bags needed for the previous item type, and set
your current item type to the new type.  When you reach the end of the list, you add the last
number of bags, and you're done.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3439&amp;rd=5868" name="3439">YahtzeeRoll</a></b>
</font>
<A href="Javascript:openProblemRating(3439)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505699" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Three: <blockquote><table cellspacing="2" ID="Table4">
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
      12 / 198 (6.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      4 / 12 (33.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>astaroth</b> for 441.44 points (47 mins 8 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      421.15 (for 4 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>This problem perplexed a lot of coders, and even 2/3 of those who did manage to submit a
solution would ultimately see it fall in the challenge phase or system testing.</p>

<p>At first glance, it's very tempting to look at a given set of dice and try to identify
what hands are "almost made".  For instance, {2, 3, 4, 6, 6} is almost a small straight, if
only one of the 6's were a 1 or 5 instead.  But, attempting to code this kind of logic fails,
since there's also a possibility of this hand becoming a large straight, on that chance that
both of the 6's re-roll favorably.</p>

<p>So, how do we tackle the problem at hand?  Well, first we need a sound mechanism to score
a given set of five dice values.  This isn't terribly hard, and it's much easier when you first
sort the values.</p>

<p>Now, consider that the values appearing on the five dice can be any one of 6^5 = 7776 possible
configurations (note that {1,2,3,4,5} and {5,4,3,2,1} are different in this perspective).
Now, when considering which dice to re-roll, we can represent our selection by a 5-digit binary
number, where each digit indicates whether the corresponding die is re-rolled.  That's 32
different re-roll configurations.  So, this means brute force is efficient enough to work.</p>

<p>For each of the 32 possibilities of re-rolls, we simply check all possible outcomes of
re-rolling the remaining dice, and from that we can calculate the probability of each hand,
and hence the expected outcome.  We then return the best of the 32 possible expected outcomes.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3444&amp;rd=5868" name="3444">WalkingHome</a></b>
</font>
<A href="Javascript:openProblemRating(3444)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505699" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2" ID="Table5">
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
      135 / 171 (78.95%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      72 / 135 (53.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 448.10 points (9 mins 54 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      286.07 (for 72 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>Depending on your preference, this problem is either a classic breadth-first search, or a
flood fill of sorts.  However, the existence of multi-lane roads in the town requires that
some additional considerations be made when coding a solution.</p>

<p>Whatever approach is used, the problem simply breaks down to checking which of the four
adjacent squares can be walked.  For regular '.' locations, you simply move.  For '-' locations
you only move on to them if you're coming vertically, and vice-versa for '|' locations.  Also,
once you step onto a road, you continue moving in exactly the same direction until stepping
off the road, or coming to an obstruction that prevents you from continuing.</p>

<p>A 50x50 array of integers, where each value represents the fewest number of crossings required
to reach a given point, suffices for keeping track of results using a flood fill approach.  Of
course, you must be careful to bail out once you reach a location that you have already reached
in fewer crossings.  In the case where the flood fill never reaches the 'H' square, return -1,
otherwise return the value corresponding to the square that contains the 'H'.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3440&amp;rd=5868" name="3440">KingOfTheCourt</a></b>
</font>
<A href="Javascript:openProblemRating(3440)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505699" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2" ID="Table6">
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
      10 / 171 (5.85%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      4 / 10 (40.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 635.27 points (24 mins 44 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      557.78 (for 4 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>With four successful solutions out of only 10 submissions, it's clear this problem was
not obvious.  The first few examples are intended to show a few very simple cases involving only
two players.  As implied by the examples, such a scenario is indeed solvable algebraically
without too much effort.  But, hopefully the latter examples made it obvious that a pure
mathematical approach was no longer feasible once a third player was added.</p>

<p>At a glance, this appears to be a typical iterative probability problem, in which the task
is simply, for each round of play, to calculate the winning percentage from each possible state
(which is then accumulated into a single result value), and the probability of going to a
different state in the next round of play.  Then, repeat for the next round, and so on for
however many loops are necessary to get enough precision in the result.</p>

<p>In the case of two players, there are only two states, where either you are king, or your
opponent is king.  In general, with <i>n</i> players, there are <i>n</i>! states to consider.
After realizing this, it's obvious why the constraints are what they are.  Each state is simply
the ordering of the players in line (with the king being at the front of the line).</p>

<p>From any given state, one of several things can happen.  The king can lose the throne
immediately, the king can lose the throne after successfully scoring a point against one or
more opponents, or the king can successfully score a point against all opponents, and win the
game.  In general, with <i>n</i> players, each state has one of <i>n</i> possible results.</p>

<p>So, for each state, we determine which other states we can get to, and the probability of
each.  Then, once we have that, we iterate from one round to the next, accumulating the winning
probability for the first player.  An interesting note about this is that, because of the 
king having the 2-to-1 advantage in play, the probabilities converge rather quickly, and a few
hundred loops is more than sufficient to maximize the precision of the double data type.</p>

<p>I've saved for last what is one of the bigger difficulties in working out this problem.  How
does one efficiently represent the state space?  A simple bitmask won't work, since 3 bits times 
7 players = 21 bits, in which most values would equate to an invalid permutation (where a person
appeared more than once, for instance), and would be far too inefficient to process over hundreds
of loops.</p>

<p>One reasonable method involves building some kind of lookup table (indeed, it's possible to do
this using some of the various types of collections provided by the standard libraries of your
favorite language).  This way, each ordering of players can be mapped to an index.</p>

<p>A more elegant, purely mathematical method, is to make use of a technique known as
permutation mapping.  The basic theory is that any permutation of <i>n</i> elements can be
indexed with an integer from 0 to <i>n</i>-1.  The way to do this is to take the first element,
<i>a1</i> of the permutatation, and determine its ordinal position among the other elements
of the permutation.  For a permutation of integers from 0 to <i>n</i>-1, this is just the value
of <i>a1</i>.  Then, multiple that ordinal value by (<i>n</i>-1)! and add that to the permutation
index of the remaining subset of elements.  Reversing the process is not difficult when it is
known that the original permutation contained integers 0 through <i>n</i>-1.</p>

<p>Example methods (in Java) for determining the index of a permutation (of integers 0 through <i>n</i>-1),
and determining the original permutation given the index and the number of elements:</p>

<pre>
int[] indexToPerm(int j, int d) {
   if (d == 1)
      return new int[]{0};
   int f = 1;
   for (int i = 2; i &lt; d; i++)
      f *= i;      
   int[] r = new int[d];
   r[0] = j / f;
   int[] t = indexToPerm(j % f, d - 1);
   for (int i = 0; i &lt; t.length; i++)
      if (t[i] &gt;= r[0]) t[i]++;
   System.arraycopy(t, 0, r, 1, t.length);
   return r;
}

int permToIndex(int[] p) {
   if (p.length == 2)
      return p[0];
   int f = 1;
   for (int i = 1; i &lt; p.length; i++)
      f *= i;
   int[] r = new int[p.length - 1];
   System.arraycopy(p, 1, r, 0, p.length - 1);
   for (int i = 0; i &lt; r.length; i++)
      if (r[i] &gt; p[0]) r[i]--;
   return f * p[0] + permToIndex(r);
}
</pre>


<p>
<img src="/i/m/timmac_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="10407399" context="algorithm"/><br />
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

