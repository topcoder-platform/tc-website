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

<title>TCCC05 Online Round 1 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC05 Online Round 1 Problem Set</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">January 15, 2005</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
The first online elimination round in the TCCC caused no major upsets,
as all the high seeds easily moved on. The problem set, containing three chess related
problems, was fairly easy (compared to regular division 1 SRM's), and 22 participants
solved all the problems. This number would have been much greater, had the last problem not
contained a nasty (unintentional) surprise, causing many solutions to fail in the
challenge phase and system tests.
</p>

<p>After the challenge phase, <b>krijgertje</b> had a clear lead thanks to
an impressively fast submission on the last problem. However, as was the case
with many other hard submissions, it went down in the system tests, and instead
veteran <b>John Dethridge</b> became top scorer, closely followed by <b>Per</b>.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3478&amp;rd=6528" name="3478">ChessTournament</a></b>
</font>
<A href="Javascript:openProblemRating(3478)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      325
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      357 / 425 (84.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      320 / 357 (89.64%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>marian</b> for 308.97 points (6 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      220.01 (for 320 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The easiest way to solve this problem is to not slavishly follow the
algorithm in the problem statement, but to realize that we only need to do
one single sort (instead of one for every distinct number of points).
</p>

<p>
If one uses C++, the sorting can be done using the <tt>pair&lt;&gt;</tt> template (see <b>Per</b>'s solution).
A more structured implementation is to create a class Player containing
the data fields score, rating and index. This class should
also implement the interface Comparable (Java) / IComparable (C#), which means
that you write a method for the class which determines the order of two elements.
If you don't know how to do this in your language, you should really learn it,
since it's something that you have to do quite often in "real life" programming.
For a Java implementation, see <b>Cosmin.ro</b>'s solution. For a C# implementation,
see <b>DimaGer</b>'s solution.
</p>

<p>
Once the elements are sorted, we find the top scorers by looping from the top
of the sorted list in steps of 2 until we reach a player with a lesser score than the
first. An inner loop loops through half of these, assigning the appropriate opponents.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3509&amp;rd=6528" name="3509">ChessKnight</a></b>
</font>
<A href="Javascript:openProblemRating(3509)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      450
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      303 / 425 (71.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      283 / 303 (93.40%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Im2Good</b> for 443.55 points (3 mins 26 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      365.01 (for 283 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
When dealing with directions (and this happens almost once every SRM/tournament round),
I recommend that you <i>always</i> create arrays containing the x- and y-delta
values. There is really no reason not to do this; the code gets shorter, and much
less error prone compared to copy-and-paste code (the latter is close to obfuscation
in my eyes!). Usually the directions are limited to up, down, left and right (with or without
diagonals). Here we have a chess knight's direction, so the delta arrays become like this:
</p>

<pre>
int dx[] = new int[] { 1, 2, 2, 1, -1, -2, -2, -1 };
int dy[] = new int[] { 2, 1, -1, -2, -2, -1, 1, 2 };
</pre>

<p>
Note that the second array is the same as the one above except that it's just two steps;
knowing this both speeds things up and makes it easier to avoid mistakes.
</p>

<p>
Now for the actual problem. One can solve the problem either with dynamic programming
or memoization; I will describe the DP solution here. The idea is to keep track for
each number of moves the probability that the knight will be on a certain square.
Initially the probability is 1 (100%) that it will be on the start square
and 0 on all other squares. After one move, the probability is 0.125 that it will be
on any of the eight squares a knight distance away from the start, and 0 on all the other squares.
If any of these 8 squares is outside the board, it's
simply ignored - it doesn't affect the probability for any of the other squares.
</p>

<p>
Generally, the probability that the knight will be on a certain square after
<i>n</i> moves is the sum of the probabilities of it being on the 8 squares
a knight distance away after <i>n - 1</i> moves, divided by 8 (this is basic probability math).
By first determining the probability of the knight being on all 64 squares after 1 move,
then 2 moves etc, we get an efficient algorithm:

</p>

<pre>
for(int i=1; i&lt;=n; i++) // n = number of moves we want the answer for
    for(int x=0; x&lt;8; x++)
        for(int y=0; y&lt;8; y++) {
            double prob = 0.0;
            for(int d=0; d&lt;8; d++) {
                if (x+dx[d] &gt;= 0 &amp;&amp; x+dx[d] &lt; 8 &amp;&amp;
                    y+dy[d] &gt;= 0 &amp;&amp; y+dy[d] &lt; 8)
                    prob += boardprob[i-1][y+dy[d]][x+dx[d]] / 8.0;
            }
            boardprob[i][y][x] = prob;
        }

</pre>      

<p>
The answer is then simply the sum of the knight being on the 64
squares after <i>n</i> moves.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3480&amp;rd=6528" name="3480">ChessMatch</a></b>
</font>
<A href="Javascript:openProblemRating(3480)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      83 / 425 (19.53%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      23 / 83 (27.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>John Dethridge</b> for 772.84 points (16 mins 26 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      542.00 (for 23 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Since there can be 20 members in a team, trying all permutations is not feasible
(as a general rule in TopCoder, you probably don't want to try all permutations
in a set if the size of the set is greater than 10 or 11), so something else must be done.
</p>

<p>
Let us for the moment not consider the restriction in the ordering
(i.e., that certain player must play before others depending on the rating difference).
The idea is to split the problem into several smaller sub problems, solve
those, and then merge those answers to get the answer to the original problem.
The split consists of trying all <i>n</i> players on position 0 in the permutation
(for each player we can calculate the expected score according to the given formula)
and the sub problem consists of solving the same problem for the <i>n - 1</i> players left.

</p>

<p>
If this is done naively without caching, we will end up testing all permutations.
However, note that the input parameters to the sub problem is a set of players, namely the set of the
players left. We do <i>not</i> have to know which position in the permutation we are at;
this can be deduced from the set of players left (if there originally was 8 players,
and we now have 6 left, we are at position 2). There
are 2<sup><i>n</i></sup> sets of <i>n</i> players, which for <i>n = 20</i> is about 1 million.
Hence the input domain for the sub problem is small enough that we can cache the results
("memoize"). Some pseudo code:
</p>

<pre>
double solve(int setOfPlayers)
{
    if setOfPlayers is empty, return 0
    if cache contains setOfPlayers
        return cache[setOfPlayers]
    int permutationPosition = totalNumberOfPlayers - size of setOfPlayers
    double best = -INFINITY
    foreach player in setOfPlayers {
        double e = expectedScore(player,opponent[permutationPosition])
        e = e + solve(setOfPlayers - player)
        best = max(best,e)        
    }
    cache[setOfPlayers] = best;
    return best;
}
</pre>

<p>
I recommend using a bitmask for keeping track of the set of players.
This also makes the next step easier: implementing the ordering restriction.
The best way to do this is to precalculate for each player which other players
(i.e. set of players) must appear before him in the permutation. That is,
if player <i>i</i> has rating 2200, and <i>lim</i> is 100, then the set of players
with rating greater than 2300 should be stored in <i>pre[i]</i>. When looping
through all players in the code above, we can check if the current player can be at
permutationPosition by verifying that none of the players in the "pre-set"
is left among setOfPlayers. This check can be done with a bitwise-and operation
if we use bitmasks.
</p>

<p>
The running time for this algorithm is O(2<sup><i>n</i></sup> * <i>n</i>). It turns out that
one can get a O(2<sup><i>n</i></sup> * <i>n</i><sup>2</sup>) solution (with two loops in the recursion above)
to run fast enough as well, but only barely so. What caught <i>many</i>
submissions though, is that you should precalculate the
expectedScore function above, since the pow function in the math library
(for both C++ and Java) is quite slow - <i>no one</i> who used it without precalculation
passed the system tests (one solution that did pass used the less known pow10 instead,
and apparently that was fast enough).

</p>

<p>
The lesson to learn from this is that you should
<i>always</i> test your solution with the worst case, something apparently a lot
coders didn't.
</p>





                        <p>
                        <img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=269554"><strong>Yarin</strong></a><br />
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
