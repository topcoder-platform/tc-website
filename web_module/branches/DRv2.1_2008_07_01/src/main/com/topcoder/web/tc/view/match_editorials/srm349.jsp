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
    <A href="/stat?c=round_overview&er=5&rd=10673">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506239" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 349</span><br>Tuesday, May 15, 2007
<br><br>



<h2>Match summary</h2> 

In Division 2, coders faced a straightforward easy, an approachable but tricky medium, and a challenging
hard problem.  Only four coders successfully solved all three problems, placing them at the top of the pack.
The win was claimed by newcomer <tc-webtag:handle coderId="22682779" context="algorithm"/>, who vaulted into
division 1 with the maximum possible rating after a single match. He was followed by 
<tc-webtag:handle coderId="10200923" context="algorithm"/>,
<tc-webtag:handle coderId="22376958" context="algorithm"/>,
and <tc-webtag:handle coderId="19723179" context="algorithm"/>.

<br /><br />
In Division 1, coders faced a simple but tricky easy, a fairly straightforward medium, and a deceptively
ferocious hard.  In the end, only <tc-webtag:handle coderId="144400" context="algorithm"/>,
<tc-webtag:handle coderId="7394165" context="algorithm"/>, and 
<tc-webtag:handle coderId="7502813" context="algorithm"/> solved the hard (and in fact, all three problems)
correctly.  That, and a few challenges, easily gave them the top three slots.

<br />
<br />
In Division 2, the tricky set of cases on the medium problem, as well as issues with double precision,
saw a lot of problems fall during the challenge phase.  In Division 1, the slaughterhouse style challenge 
phase was even more cruel, with only 8 of the more than 100 hard submissions surviving until systests.</p>
 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7763&amp;rd=10673" name="7763">DocumentSearch</a></b> 

</font> 

<A href="Javascript:openProblemRating(7763)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506239" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      571 / 603 (94.69%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      404 / 571 (70.75%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Margarita</b> for 248.89 points (1 mins 54 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      206.24 (for 404 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

The only thing to worry about here is not making a mistake as we implement the algorithm
exactly as described in the problem statement.  We first concatenate the string.  Then, starting
at position 0, moving forward one character at a time, we check each substring, and if the next
several characters match the search string, we advance to the character immediately following the
search string, and increment our result counter.

<pre>
public int nonIntersecting(String[] doc, String search) {
    String s = "";
    for (int i = 0; i < doc.length; i++)
        s += doc[i];
    int i = 0;
    int ret = 0;
    while (i <= s.length() - search.length())
        if (s.substring(i, i + search.length()).equals(search)) {
            ret++;
            i += search.length();
        } else {
            i++;
        }
    return ret;
}
</pre>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7766&amp;rd=10673" name="7766">RadarFinder</a></b> 

</font> 

<A href="Javascript:openProblemRating(7766)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506239" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      457 / 603 (75.79%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      41 / 457 (8.97%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>GeKa</b> for 464.51 points (7 mins 58 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      290.89 (for 41 correct submissions) 

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

      533 / 548 (97.26%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      170 / 533 (31.89%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 248.46 points (2 mins 14 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      192.75 (for 170 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

This problem was good challenge bait, as there are several cases to consider.  Not only are we are
haunted by the typical problems that go along with using doubles, but we need to make sure we think
about all possible configurations of the two circles represented by the radar measurements.
<br />
<br />

Now, we can look first for the special case where there are an infinite number of possible points.
Namely, the case where two of the circles have the same radius, centered at the same location.
<br />
<br />

With that special case out of the way, note that the only things we care about, to describe all
other configurations, are the radii of the circles, and the distance between the centers.
Beyond that, the exact locations are not relevant.  Call these values <i>r1</i>, <i>r2</i>, and <i>d</i>.
Assume <i>r1</i> &gt;= <i>l2</i>.
<br /><br />

Now, we can have five basic cases (possibly more or less depending on exactly how one defines the
different cases):
<br /><br />

<table border="1" cellspacing="0">
    <tr>
        <th>Comparison Description</th>
        <th>Configuration Description</th>
        <th>Number of Points</th>
    </tr>
    <tr>
        <td><i>d</i> &lt; <i>r1</i> - <i>r2</i></td>
        <td>One circle completely inside the other</td>
        <td>0</td>
    </tr>
    <tr>
        <td><i>d</i> = <i>r1</i> - <i>r2</i></td>
        <td>Circles internally tangent</td>
        <td>1</td>
    </tr>
    <tr>
        <td><i>d</i> &gt; <i>r1</i> - <i>r2</i> and<br />
            <i>d</i> &lt; <i>r1</i> + <i>r2</i></td>
        <td>Circles intersect</td>
        <td>2</td>
    </tr>
    <tr>
        <td><i>d</i> = <i>r1</i> + <i>r2</i></td>
        <td>Circles externally tangent</td>
        <td>1</td>
    </tr>
    <tr>
        <td><i>d</i> &gt; <i>r1</i> + <i>r2</i></td>
        <td>Circles separate</td>
        <td>0</td>
    </tr>
</table>

<br />
One last consideration, to avoid the issues with doubles, is to use only (64-bit) integers.  We can easily
calculate <i>d</i><sup>2</sup> using only integers.  If we square both sides of each of the comparisons above,
we then have some equivalent comparisons that use only integer arithmetic.

<pre>
public int possibleLocations(int x1, int y1, int r1, int x2, int y2, int r2) {
    long sr = (long)(r1 + r2) * (long)(r1 + r2);
    long dr = (long)(r1 - r2) * (long)(r1 - r2);
    long d = (long)(x2 - x1) * (long)(x2 - x1)
        + (long)(y2 - y1) * (long)(y2 - y1);

    if (x1 == x2 && y1 == y2 && r1 == r2) return -1;
    if (d < dr || d > sr) return 0;
    if (d == sr || d == dr) return 1;
    if (d > dr && d < sr) return 2;

    // Never get to this line
    return 3;
}
</pre>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=4585&amp;rd=10673" name="4585">BoggleScore</a></b> 

</font> 

<A href="Javascript:openProblemRating(4585)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506239" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      184 / 603 (30.51%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      16 / 184 (8.70%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>hken</b> for 872.51 points (11 mins 12 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      562.26 (for 16 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

After understanding the problem here, we can make a few quick calculations that give us some idea
about what type of solutions may or may not work.  In particular, notice that when tracing out the
path of a word we find, there are at least three ways to get from one character to the next (namely,
if you're moving from a corner -- in other cases there are more than three ways).  So, if you are trying
to spell out a word with 50 characters, there are more than 3<sup>50</sup> ways to do it.  Clearly,
a brute force approach is doomed to failure, so we need to be a little more efficient.
<br />
<br />

Since we don't care about the actual paths used to spell out a word, but rather only the number
of ways to do so, this implies something about how we solve the problem.  More specifically, we can
ask the question, "How many ways can I spell a given word, such that it ends at a position (x,y)?"  We
can then answer this question by saying, if the character at that position is the right character,
then it's the sum of the number of ways to spell all but the last character of the word from each of
the adjacent positions.  This is enough to build a Dynamic programming solution.
<br /><br />

In the example solution below, I have actually built a 6x6 grid, with junk characters as the
border (also known as sentinnel values), to avoid having to worry about boundary checking.  Note
also the frequent usage of the modulus operation, to avoid overflowing a 64-bit value.

<pre>
public long bestScore(String[] grid, String[] words) {
  long mod = 10000000000000L;
  long total = 0;
  char[][] letters = new char[6][6];
  for (int i = 0; i < 6; i++)
    for (int j = 0; j < 6; j++)
      if (i == 0 || i == 5 || j == 0 || j == 5)
        letters[i][j] = '.';
      else
        letters[i][j] = grid[i - 1].charAt(j - 1);
  for (int k = 0; k < words.length; k++) {
    long[][][] count = new long[6][6][words[k].length()];
    char c = words[k].charAt(0);
    for (int i = 1; i <= 4; i++)
      for (int j = 1; j <= 4; j++)
        if (letters[i][j] == c)
          count[i][j][0] = 1;
    for (int m = 1; m < words[k].length(); m++) {
      c = words[k].charAt(m);
      for (int i = 1; i <= 4; i++)
        for (int j = 1; j <= 4; j++)
          if (letters[i][j] == c) {
            for (int x = -1; x <= 1; x++)
              for (int y = -1; y <= 1; y++)
                if (x != 0 || y != 0)
                  count[i][j][m] += count[i + x][j + y][m - 1];
            count[i][j][m] = count[i][j][m] % mod;
          }
    }
    long t = 0;
    for (int i = 1; i <= 4; i++)
      for (int j = 1; j <= 4; j++)
        t += count[i][j][words[k].length() - 1];
    t = t % mod;
    t *= words[k].length() * words[k].length();
    t = t % mod;
    total += t;
    total = total % mod;
  }
  return total;
}
</pre>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7601&amp;rd=10673" name="7601">DiceGames</a></b> 

</font> 

<A href="Javascript:openProblemRating(7601)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506239" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      415 / 548 (75.73%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      352 / 415 (84.82%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>JongMan</b> for 495.34 points (2 mins 45 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      380.60 (for 352 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

Many coders quickly saw the DP solution to this problem.  When we think about what a formation means, it's
nice to think of it as a "canonical form" where the values are in sorted order.  Furthermore, when we think
about ways to make a formation from the dice, we should assume that the lowest value of the formation came
from the die with the fewest sides.  Why is this?  Consider the case where you have two dice, with four and six
sides.  Formations like (2, 3) and (1, 4) can be made in two different ways (either die could show either value),
but formations like (4, 5) and (3, 6) can only be made in one way.  Assuming that the lowest values appear on
the dice with the fewest sides allows us to maximize the number of formations.
<br />
<br />

The most common approach to the problem goes something like this:  How many formations can be made is the
number of non-decreasing sequences that can be made from the dice.  So, how do we get the number of such
sequences?  If we consider the possible values that end (or start) the sequence, then we know that the previous
(or next) <i>n</i>-1 terms of the sequence must all be less than or equal to this value.  This leads us to
a fairly straightforward DP solution (shown below).
<br />
<br />

It is interesting to point out that, in the heat of a match, we often come up with other unique ways to
solve problems.  For instance, <tc-webtag:handle coderId="15917161" context="algorithm"/> offered up a slightly
different way of breaking down the problem.  Also starting with sorted dice, and noting that the maximum sum of
the values shown on the dice is limited by the constraints of the problem, his code asks the question, how
many ways can I make the first several dice sum up to a given value?  Implicitly, it accomplishes the same
thing as the previously explained approach, but it takes a slightly different thought process to get there.

<pre>
public long countFormations(int[] sides) {
    Arrays.sort(sides);
    long[][] ret = new long[sides.length][sides[sides.length - 1]];
    for (int i = 0; i < sides[0]; i++)
        ret[0][i] = 1;
    for (int i = 1; i < sides.length; i++)
        for (int j = 0; j < sides[i]; j++)
            for (int k = 0; k <= j; k++)
                ret[i][j] += ret[i - 1][k];
    long res = 0;
    for (int i = 0; i < sides[sides.length - 1]; i++)
        res += ret[sides.length - 1][i];
    return res;
}
</pre>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6067&amp;rd=10673" name="6067">LastMarble</a></b> 

</font> 

<A href="Javascript:openProblemRating(6067)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506239" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      130 / 548 (23.72%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      3 / 130 (2.31%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>tomek</b> for 558.48 points (23 mins 9 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      452.79 (for 3 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

When both <tc-webtag:handle coderId="10574855" context="algorithm"/> and
<tc-webtag:handle coderId="144400" context="algorithm"/> resubmit a problem, that is definitely a sign
that there is something tricky going on, and this problem was no exception.  Allegedly, based on buzz in the
forums, among all problems with a non-zero success rate, only one other has been more deceptively difficult.
<br /><br />

If this problem were simply a bag of red and blue marbles, without the unknown removed marbles, then it
would boil down to a fairly typical game theory problem, where the goal is to make the move that maximizes
one's chances of winning.  In fact, that is still the case, but the question remains of how to properly
calculate such values in light of the unknown removed marbles.
<br /><br />

An initial thought might be to calculate each of the possible initial states of the bag, after the
first set of unknown marbles is removed.  Then, for each possible state, determine the probability of
winning, compute the weighted average, and return the result.  This approach is flawed however, since
the player, during game play, does not know the exact state of the bag.
<br /><br />

Those individuals well-versed in probability theory, including those who have recently competed in 
marathon matches where the topic frequently arises, may see Bayes Theorem written all over this problem.
In fact, that is a mathemtically viable approach, but it creates a very large state space of the problem,
and is fairly complicated, making it prone to subtle bugs.
<br /><br />

The simpler solution, which is presented below, is to first make an important observation that
the probabilities of randomly choosing things is symmetric.  That is, from a set of <i>n</i> items,
the number of ways to choose <i>r</i> of them is the same as the number of ways to choose <i>n</i>-<i>r</i>
of them.  What this means for us is that the probability of the bag being in any given state
does not rely upon the order in which different random draws are made.  In particular, the probability of
the bag containing some quantity of red and blue marbles is the same regardless of at what point in the
game the unknown marbles are removed from the bag.  Thus, it is equivalent to play as though starting
with a full bag, and only removing the unknown marbles at the very end.  It may take some time to digest
this, as it seems counterintuitive at first.
<br /><br />

So, the end result is that we only need to consider a state space consisting of how many red marbles are
in the bag, how many blue marbles are in the bag, and who last drew a red marble.  The sample below uses three
values to indicate if the last red was drawn by the player, opponent, or nobody.  Two simple helper functions
define the typical combinatoral choose function, and calculate the probability of drawing (r,b) marbles from a
bag containing a given number of red marbles among the total.

<pre>
public double winningChance (int red, int blue, int removed) {
  int total = red + blue;
  double[][][] dp = new double[total + 1][red + 1][3];
  for (int i = 0; i <= red; i++)
    dp[removed][i][2] = 1;
  for (int i = removed + 1; i <= red + blue; i++)
    for (int j = 0; j <= red; j++)
      for (int k = 0; k <= 2; k++) {
        for (int m = 1; m <= Math.min(3, i - removed); m++) {
          double test = 0;
          for (int r = 0; r <= Math.min(m, j); r++)
            test += chooseProb(i, j, m - r, r)
              * (1.0 - dp[i - m][j - r][r > 0 ? 2 : (k * 2) % 3]);
          dp[i][j][k] = Math.max(dp[i][j][k], test);
        }
      }
  return dp[red + blue][red][0];
}

private int choose(int c, int r) {
  if (r > c) return 0;
  int ret = 1;
  for (int i = c; i > c - r; i--) ret *= i;
  for (int i = 1; i <= r; i++) ret /= i;
  return ret;
}

private double chooseProb(int total, int red, int b, int r) {
  double ret = 1.0;
  ret *= choose(total - red, b);
  ret *= choose(red, r);
  ret /= choose(total, b + r);
  return ret;
}
</pre>

 




<div class="authorPhoto">
    <img src="/i/m/timmac_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10407399" context="algorithm"/><br />
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
