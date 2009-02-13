<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 <xsl:import href="../top.xsl"/>
 <xsl:import href="../script.xsl"/>
 <xsl:import href="../includes/body_top.xsl"/>
 <xsl:import href="../foot.xsl"/>
 <xsl:import href="../includes/modules/srm_results.xsl"/>
 <xsl:import href="../includes/modules/white_last_srm.xsl"/>
 <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
 <xsl:import href="../includes/modules/coder_week2.xsl"/>
 <xsl:import href="../includes/modules/practice_room.xsl"/>
 <xsl:import href="../includes/modules/calendar.xsl"/>
 <xsl:import href="../includes/modules/top_room_wins.xsl"/>
 <xsl:import href="../includes/global_left.xsl"/>
 <xsl:import href="../includes/public_right_col.xsl"/>
 <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
 <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>Single Round Match 204 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
 win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
 win.location.href = url;
 win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">

<!-- Left Column Begins -->
     <td width="170" bgcolor="#FFFFFF">
         <xsl:call-template name="global_left"/>
     </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
     <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
     <td class="bodyText" width="100%">
         <xsl:call-template name="BodyTop">
             <xsl:with-param name="image1">white</xsl:with-param>
             <xsl:with-param name="image">statisticsw</xsl:with-param>
             <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
         </xsl:call-template>

         <table border="0" cellspacing="10" cellpadding="0" width="100%">
         <tr valign="top">
                 <td class="bodyText" width="100%">

<!--body contextual links-->
                     <table width="100%" border="0" cellspacing="0" cellpadding="3">
                         <tr valign="middle">
                             <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 204</font></td>
                             <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                         </tr>

                         <tr valign="middle">
                             <td class="bodyText">Wednesday, July 21, 2004</td>
                             <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                         </tr>
                     </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
Usually the top ten is dominated by reds, but this time five yellows
and a blue snuck in, leaving two targets and many other reds out in
the cold.  <b>SnapDragon</b> flirted with another top-ten
list, the list of Highest Match Totals, finishing in a blazing 
27 minutes.  <b>tomek</b> finished 2 minutes and a hundred points behind.
But then <b>SnapDragon</b> discovered an off-by-one bug in his Medium
and had to resubmit, handing <b>tomek</b> the win.
</p>

<p>
In Division Two, several coders entered the Challenge Phase with 1300+ points,
but none survived challenges and system tests.  Among those lurking just
behind the leaders, <b>anikov</b> rode a successful challenge to victory,
with rookie <b>jvpardon</b> taking second, also using a challenge to pass
veteran <b>dhyanesh</b>.
</p> 
 
<p>
<H1> 
The Problems 
</H1>
</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2916&amp;rd=5850" name="2916">Medici</a></b> 
</font> 
<A href="javascript:openProblemRating(2916)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      141 / 158 (89.24%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      118 / 141 (83.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>DamnEcuadorian</b> for 247.17 points (3 mins 3 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      205.27 (for 118 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
It's easy to find the best player using a loop like
<pre>
  int bestPlayer = -1, bestScore = -1;
  for (int i = 0; i &lt; fame.length; i++) {
    int score = min(fame[i], min(fortune[i], secrets[i]));
    if (score &gt; bestScore) { 
      bestPlayer = i; 
      bestScore = score;
    }
  }
  return bestPlayer;
</pre>
but this doesn't account for the treatment of ties.  We could
maintain a boolean flag to indicate ties, as in
<pre>
  int bestPlayer = -1, bestScore = -1;
  boolean tie = false;
  for (int i = 0; i &lt; fame.length; i++) {
    int score = min(fame[i], min(fortune[i], secrets[i]));
    if (score &gt; bestScore) { 
      bestPlayer = i; 
      bestScore = score;
      tie = false;
    }
    else if (score == bestScore) tie = true;
  }

  if (tie) return -1;
  else return bestPlayer;
</pre>
For example, <b>dukeola</b> and <b>jvpardon</b> took essentially this
approach.  <b>AleaActaEst</b> and <b>czar</b> used a counter instead of the boolean flag.
</p>

<p>
A slightly easier approach, taken by <b>bugloaf</b> and <b>egghead</b>,
is to reset <tt>bestPlayer</tt> to -1 when a tie is detected, as in
<pre>
  int bestPlayer = -1, bestScore = -1;
  for (int i = 0; i &lt; fame.length; i++) {
    int score = min(fame[i], min(fortune[i], secrets[i]));
    if (score &gt; bestScore) { 
      bestPlayer = i; 
      bestScore = score;
    }
    else if (score == bestScore) bestPlayer = -1;
  }
  return bestPlayer;
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2854&amp;rd=5850" name="2854">Aaagmnrs</a></b> 
</font> 
<A href="javascript:openProblemRating(2854)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      114 / 158 (72.15%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      80 / 114 (70.18%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>czar</b> for 480.45 points (5 mins 46 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      343.91 (for 80 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This problem boils down to deciding if two sequences of letters are 
permutations of each other, once you've removed all the spaces and converted
all lowercase letters to uppercase (or vice versa).  One appoach is to walk 
through the letters of the first string.  For each letter, search for an 
occurrence of that letter in the second string and delete it if found.  
If you can't find the letter, or if there are letters left over in the 
second string when you're done, then the strings were not anagrams.
</p>

<p>
A simpler approach, suggested by the title of the problem, is to sort both
strings and test if the sorted strings are equal.  See, for example,
<b>arun_zero</b>'s implementation of this test.  This sorting trick is an
instance of the general technique of checking if two objects are equivalent
by converting both into some normal form and testing if they both have the
same normal form.  Using normal forms to turn an equivalence check into
an equality check is a good idea whenever the notion of equivalence is
even a little bit complicated.
</p>

<p>
Once you've converted the strings into normal form, you can compare them
pairwise (see <b>czar</b>'s or <b>ronit_dragon</b>'s solutions) or 
check for duplicates by putting
them into some kind of set (see <b>Toivoa</b>'s solution).
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2312&amp;rd=5850" name="2312">Apothecary</a></b> 
</font> 
<A href="javascript:openProblemRating(2312)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      33 / 158 (20.89%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      19 / 33 (57.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>JavaLinZi</b> for 669.55 points (18 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      526.20 (for 19 correct submissions) 
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
      148 / 173 (85.55%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      132 / 148 (89.19%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 298.27 points (2 mins 10 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      220.16 (for 132 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This problem was amenable to brute force (see, for example, <b>NeverMore</b>'s
fourteen nested loops), but a more elegant solution arises by thinking
about the relationships between the weights.
</p>

<p>
Consider, for example, the 1-grain weight.  Notice that the other weights are
multiples of 3, so any combination of the other weights will yield a net
result that is a multiple of three.  If your target weight is not a multiple
of three, then the 1-grain weight must be involved.  If the target weight mod 3
is 1, then the 1-grain weight goes in the opposite pan.  If the target
weight mod 3 is 2, then the 1-grain weight goes in the same pan as the
object.  If the target weight mod 3 is 0, then the 1-grain weight is not used
at all, because combining the 1-grain weight with other weights could never 
yield a multiple of three.
</p>

<p>
Once you've placed the 1-grain weight, similar logic can be used to place
each successive weight, as in
<pre>
   answer = create a new vector or list;
   current_size = 1;
   while W &gt; 0 do
      if W % 3 == 1 then
         W -= 1;
         add current_size to answer;  // place on opposite pan
      if W % 3 == 2 then
         W += 1;
         add -current_size to answer; // place on same pan
      W /= 3;
      current_size *= 3;
   sort(answer);
</pre>
<b>Ryan</b> and <b>marian</b> had particularly clean implementations of
this idea.
</p>

<p>
If you like weird number systems, another way of looking at this problem
is that you are converting W into a base-3 number system where the
allowable digits are {-1,0,1} instead of {0,1,2}.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2842&amp;rd=5850" name="2842">Sortitaire</a></b> 
</font> 
<A href="javascript:openProblemRating(2842)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
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
      40 / 173 (23.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      28 / 40 (70.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 513.59 points (12 mins 4 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      348.28 (for 28 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
You could use memoization (<b>SnapDragon</b>) or dynamic programming (<b>radeye</b>) here, but a greedy approach works even better.
</p>

<p>
Basically, you test each possible number of turns to find the smallest
one that yields a solution.
<pre>
  for (int n = 0; n &lt;= stock.length; n++) {
    int[] partialStock = ...copy first n elements of stock...
    if (canSolve(tableau, partialStock)) return n;
  }
  return -1; 
</pre>
The hard work is done by the <tt>canSolve</tt> function.
Begin by sorting the cards in the partial stock.  This will mean
that the order in which we process cards from the stock will not
be the same as the order in which they were dealt, but this is okay
because we get to see all the cards ahead of time.  Once we know where
we want to put each card, we could go back and make all those moves
in the correct order.  The real game is much harder because
you must decide what to do with each card before you
get to draw the next card.
</p>

<p>
Now, which card should end up in the first position in the tableau?  
There are only two candidates, either the existing first card in 
the tableau or the first card in the sorted stock, of which we pick
the smaller one in order to give maximum freedom in placing future cards.
This is the greedy choice.  It may be possible to win the game by picking
a different card to go in the first position, either the bigger of the two or a different card from the stock, but in all such cases picking
the indicated card would also lead to a win.  For example, if we picked
some larger card from the stock to go in the first position, 
then we must have discarded the smallest card from the stock, 
in which case we could just as easily have kept the smallest card and
discarded the larger card instead.  Similar arguments hold
if we choose to keep the existing first card in the tableau 
when it is bigger than the smallest card in the stock, or if we choose
to replace the first card in the tableau when it is actually smaller
than the smallest card in the stock.
</p>

<p>
Once we've settled which card goes in the first position, we move
on to the second position.  Again there are two candidates, either the
existing card in that position or the smallest remaining card in the
stock, and again we pick the smaller of the two, with one exception.  If the
existing card in the second position is smaller than the card that
we picked for the first position, then we cannot pick it.  (This 
special case
is not a concern for cards from the stock, because
they will never be smaller than the card we picked
for the previous position.)
</p>

<p>
We continue in this fashion until either we fill the tableau, in which
case we have won the game, or we run out of stock,
in which case we check if the rest of the tableau just happens to be sorted
but if it's not, then know we cannot win.
</p>

<p>
In code, this algorithm could be written
<pre>
   boolean canSolve(int[] tab, int[] stock) {
      sort(stock); // remember this is a portion of the real stock
      int prev = -1;
      int i = 0, j = 0;
      for (; i &lt; tab.length &amp;&amp; j &lt; stock.length; i++) {
         if (stock[j] &lt; tab[i] || tab[i] &lt; prev)
            prev = stock[j++];
         else
            prev = tab[i];
      }
      for (; i &lt; tab.length; i++) {
         if (tab[i] &lt; prev) return false;
         prev = tab[i];
      }
      return true;
   }
</pre>
<b>jms137</b> and <b>tomek</b> gave nice implementations of this algorithm,
<b>tomek</b> even including a semi-gratuitous binary search for the
right number of turns.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2420&amp;rd=5850" name="2420">WorldPeace</a></b> 
</font> 
<A href="javascript:openProblemRating(2420)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      14 / 173 (8.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 14 (57.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 933.62 points (7 mins 41 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      650.16 (for 8 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
There are lots of different ways to approach this problem.  Some are
hard to think of but easy to code, others are easy to think of but hard
to code.
</p>

<p>
<b>SnapDragon</b> had what was perhaps the easiest algorithm to explain.
Suppose you wanted to determine whether it is possible to form <i>M</i>
groups.  He imagined a grid <i>M</i> columns wide by <i>k</i> rows
high, where each column represents a group.  Then, he tried to fill in the grid
row by row.  He filled in people from the first country starting in the top
left corner, then people from the second country starting from where the
first country ended, and so.  If a given country had fewer than <i>M</i>
people, he used them all; otherwise, he only used the first <i>M</i> people
from that country.  If he succeeded in filling the entire grid, then it was
possible to form <i>M</i> groups.  A binary search on different values
of <i>M</i> finds the largest value of <i>M</i> that works.
</p>

<p>
Let <i>sum</i> be the sum of all the populations.  Then the maximum
number of groups that could possibly be formed is <i>sum/k</i>.
<b>SnapDragon</b>'s algorithm serves as a constructive proof for the following
theorem: If the biggest country contains no more than <i>sum/k</i>
people, then it is in fact possible to form <i>sum/k</i> groups.  
This theorem provides the base case for a simple recursive algorithm.
If the biggest country contains more than <i>sum/k</i> groups,
then you figure you will use one person from this country in every
group and discard the rest.  The number of groups is determined
by how many groups of <i>k</i>-1 people can be formed from the
remaining countries.
</p>

<p>
These two algorithms are trivial to code, but require a lot of
insight up front.  At the other extreme is an algorithm that
requires little insight up front, but ends up being much harder
to code.  This algorithm is based on the idea that groups should
be formed greedily.
In other words, to form each group, we should take one person from each
of the <i>k</i> countries that currently have the most people remaining.
Of course, with the possibility of billions of groups, we cannot afford
to form groups one at a time.  So how can we form many groups at once?
</p>

<p>
Suppose that the <i>k</i>-th largest country is, say, 100 bigger than the
(<i>k</i>+1)-st largest country.  Then we can safely form 101 groups from
the <i>k</i> largest countries.  At that point, what was the (<i>k</i>+1)-st
largest country replaces what was the <i>k</i>-th largest country in the
top <i>k</i>.  This technique lets us make a big jump at the very beginning
of the algorithm, but, unfortunately, once the <i>k</i>-th largest
country and the (<i>k</i>+1)-st largest country are within one of each other,
we can never make such a large jump again.  Instead, we are again
limited to forming groups one or two at a time.  And with possibly billions
of groups still to form, we are little better off than before.
</p>

<p>
But with smarter handling of the <i>k</i>-th and (<i>k</i>+1)-st largest
countries, we can extend this technique into something manageable.  Divide
the countries into four sets:
<ul>
<li> the <i>frontier</i>: countries with the same size as the <i>k</i>-th largest country </li>
<li> the <i>subfrontier</i>: countries one smaller than the <i>k</i>-th largest country </li>
<li> the <i>bigs</i>: countries larger than those in the frontier </li>
<li> the <i>littles</i>: countries smaller than those in the subfrontier </li>
</ul>
Designate the number of countries in each set as <i>F</i>, <i>S</i>, <i>B</i>, and 
<i>L</i>, respectively.
</p>

<p>
Now, when we form a single group of penpals, what happens?  We take one person
from each country in the bigs, and fill out the rest of the group from 
<i>k-B</i> countries in the frontier.  This moves <i>k-B</i> countries from
the frontier to the subfrontier.  If there are still more countries in
the frontier, then we check whether any countries in the bigs are now
small enough to join the frontier.  If the frontier is empty, then the subfrontier becomes the new frontier, and we check whether any countries in the littles
are now big enough to join the now-empty subfrontier.
</p>

<p>
Let <i>M</i> be the least common mulitple of <i>F+S</i> and <i>k-B</i>.
Then, if we form <i>M</i>/(<i>k-B</i>) groups, we will end up using each member
of the frontier and subfrontier exactly <i>M</i>/(<i>F+S</i>) times.  However,
the composition of the frontier and subfrontier will not change at all; that 
is, they will contain exactly the same countries as before, assuming no
countries from the bigs have joined the frontier and no countries from
the littles have joined the subfrontier.
</p>

<p>
At each step, we want to take the largest multiple of <i>M</i>/(<i>k-B</i>)
groups that we can without causing the smallest country in the bigs to
join the frontier or the largest country in the littles to join the 
subfrontier.  Let <i>above</i> be the gap between the sizes of the
smallest country in the bigs and the countries in the frontier,
and let <i>below</i> be the gap between the sizes of the largest country
in the littles and the countries in the subfrontier.  How
quickly are these gaps closing?  For every <i>M</i>/(<i>k-B</i>) groups we
form, the below gap closes by <i>M</i>/(<i>F+S</i>) and the above gap closes by
<i>M</i>/(<i>k-B</i>) - <i>M</i>/(<i>F+S</i>).  
Therefore, we can safely form <i>Q</i> groups,
where <i>Q</i> is <i>M</i>/(<i>k-B</i>) times the minimum of
<i>below</i>/(<i>M</i>/(<i>F+S</i>)) and <i>above</i>/(<i>M</i>/(<i>k-B</i>) - <i>M</i>/(<i>F+S</i>)).
If <i>Q</i> is 0, then we merely form a single group, but we will not
have to do this very many times until the frontier or the subfrontier has
absorbed the member of the bigs or littles that was blocking further
progress.  Then we can again make potentially large jumps.
</p>

<p>
Many people appeared to be working on variations on this theme as time
expired, but none successfully completed it.
</p>
                     <p>
                     <img src="/i/m/vorthys_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                     By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=299177"><strong>vorthys</strong></a><br />
                     <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                     </p>
                 </td>
             </tr>
         </table>

         <p><br /></p>

     </td>
<!-- Center Column Ends -->

<!-- Gutter -->
     <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
     <td width="170">
         <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
         <xsl:call-template name="public_right_col"/>
     </td>
<!-- Right Column Ends -->

<!-- Gutter -->
     <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

 </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

 </xsl:template>
</xsl:stylesheet>
