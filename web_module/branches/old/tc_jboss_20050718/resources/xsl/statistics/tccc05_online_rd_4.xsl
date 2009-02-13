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

<title>TCCC05 Online Round 4 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC05 Online Round 4 Problem Set</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">February 2, 2005</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
You probably wouldn't be surprised if I told you that Poland took
first and second place in Round 4 of the TopCoder Collegiate
Challenge, but you might be surprised if I told you that neither coder
was named <b>tomek</b>.  <b>Eryx</b> dominated from start to finish,
which for him, occurred at the 35 minute mark.  He was so fast on the
Medium and Hard that even losing his Easy to a challenge on an
off-by-one bug could not drop him out of first place.  Fellow
countryman <b>cyfra</b> took second by less than five points over
Germany's <b>AdrianKuegel</b>.  But don't cry for <b>tomek</b>.  With
a sixth-place finish, he still advances to defend his title next month
in Santa Clara.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3467&amp;rd=6531" name="3467">MusicLicenses</a></b>
</font>
<A href="Javascript:openProblemRating(3467)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      46 / 49 (93.88%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      33 / 46 (71.74%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>dgarthur</b> for 242.33 points (5 mins 5 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      200.15 (for 33 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The most common approach was to loop over all prefixes and check if 
each one was legal:
<pre>
    for (int i = 0; i &lt; log.length; i++)
       if (<i>the prefix log[0..i] is illegal</i>)
          return i;
    return -1;
</pre>
As a minor optimization, you could start the loop at 7 instead of 0, 
because no prefix of length 6 or less can possibly be illegal.
</p>

<p>
One way to check if a prefix is illegal is to look for some index <i>i</i>
such that three characters different from the character at <i>i</i>
all occur both before and after <i>i</i>.  For example, the prefix
"ABCDABC" is illegal because 'A', 'B', and 'C' all occur both before
and after the 'D'.  <b>dgarthur</b> took a minor variation on this
approach.
</p>

<p>
Another way to check if a prefix is illegal is to try to determine
which computers need licenses when.  Whenever a new computer needs a
license, the license should be transferred from a computer that no
longer needs it (because the computer is not used again within the
current prefix).  If no such computer exists&#8212;that is, if
all three computers with licenses still need them&#8212;then the
current prefix is illegal.
</p>

<p>
All solutions that consider each prefix separately take quadratic time
or worse, but a linear solution is also possible using a greedy
algorithm.  Every time you need to transfer a license, transfer it
from the computer whose <i>next</i> use is farthest in the future (if
there is no next use, count it as infinitely far in the future).
When you reach a computer that has already owned and lost a license,
return the current index.  Finding the next use of each computer
requires a little preprocessing, but it is easy to build the required
table in linear time.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3449&amp;rd=6531" name="3449">Triptych</a></b>
</font>
<A href="Javascript:openProblemRating(3449)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      40 / 49 (81.63%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      26 / 40 (65.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 445.57 points (10 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      305.68 (for 26 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
At first this feels like a shortest-path problem, but it's really a
kind of minimal-spanning-tree problem.  You need to find the
lowest-cost tree that includes the origin and all three destinations.
Because the trip must end back at the origin, every edge in the
tree will end up being crossed exactly twice (i.e., every return
ticket will eventually be used), so the possibility raised in the
problem statement of not using a return ticket was a red herring.
</p>

<p>
The key is to realize that the lowest-cost tree must have the form
shown to the right,
<div align="center">
<img src="/i/srm/tccc05rd4_1.jpg" alt="tccc05rd4_1" />
</div>
where the green node is the origin and the three red nodes are the 
destinations.  The lines in this picture represent paths, not necessarily
direct flights.  There are, of course, other shapes that the optimal
tree might have, but all such variations are degenerate forms of the
tree shown here, in which two or more of the nodes have been merged.
For example, you might end up with a single intermediate point by
merging both of the blue nodes, or you might end up with a single path
by merging each of the blue nodes with one of its neighbors.  To find
the lowest-cost tree, we simply try every possible pair of
intermediate points.  For each pair, we try three different
arrangments of the destination cities, where each of the three cities
might be the red node on the left of the diagram (and the other two
are the red nodes on the right of the diagram).
In code, this can be written as
<pre>
    best = INFINITY;
    for (int i = 0; i &lt; n; i++)
       for (int j = 0; j &lt; n; j++)
          best = min(C[0][i]+C[d0][i]+C[i][j]+C[j][d1]+C[j][d2],
                     C[0][i]+C[d1][i]+C[i][j]+C[j][d0]+C[j][d2],
                     C[0][i]+C[d2][i]+C[i][j]+C[j][d0]+C[j][d1]);
    return (best==INFINITY) ? -1 : best;
</pre>
In this code, C[x][y] represents the minimum cost to travel from city
x to city y.  It is easy to build the C table from the original cost data
using Floyd's All-Pairs Shortest-Path algorithm.  (If you don't know
Floyd's algorithm, learn it.  Other than your system sorting routine,
it may very well be the single most useful "off-the-shelf" algorithm
around for programming contests.)
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3522&amp;rd=6531" name="3522">HanoiDistance</a></b>
</font>
<A href="Javascript:openProblemRating(3522)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      10 / 49 (20.41%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      6 / 10 (60.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 805.30 points (14 mins 43 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      585.34 (for 6 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
To solve this problem, you had to remember or reconstruct how to solve the
original Towers of Hanoi problem.  The following procedure moves a
tower of n discs from one peg to another peg:
<pre>
   procedure moveTower(n,fromPeg,toPeg,auxPeg) is
      if (n == 0) return

      moveTower(n-1,fromPeg,auxPeg,toPeg)
      <i>move disc n from fromPeg to toPeg</i>
      moveTower(n-1,auxPeg,toPeg,fromPeg)
</pre>
A simple inductive proof shows that it takes 2<sup>n</sup>-1 moves
to move a tower of n discs.
</p>

<p>
The moveTower procedure basically tells us where each disc needs to be in a
valid configuration.  For example, the biggest disc needs to be on either
peg A (the "from" peg) or peg C (the "to" peg).  The possible
locations of the next biggest disc depend on which peg the biggest
disc is on.  If the biggest disc is on peg A, then the next biggest
disc can be on either peg A or peg B.  On the other hand, if the
biggest disc is on peg C, then the next biggest disc can be on either
peg B or peg C.
</p>

<p>
Now, if the bottom disc is already on peg A or peg C, then we'll leave
it in place.  But if it's on peg B, then we need to move it to either
peg A or peg C, whichever one requires fewer moves.  Suppose we want
to move it to peg A.  Then we'll first have to move all the remaining
discs to peg C.  After we move the biggest disc from peg B to peg A,
what do we do with the dics on peg C?  It turns out that we need to
move the entire tower to either peg A or peg B.  (Recall that when the
biggest disc is on peg A, the next biggest disc needs to be on either
peg A or peg B.)
</p>

<p>
All this can be accomplished using the following two recursive
functions, the first for finding the minimum cost to get to a valid
configuration and the second for finding the minimum cost to build a tower on
a given peg:
<pre>
   function minMoves(n,fromPeg,toPeg,auxPeg) is
      if n == 0 then return 0

      p = <i>the peg that disc n is currently on</i>
      if p == fromPeg then return minMoves(n-1,fromPeg,auxPeg,toPeg)
      if p == toPeg then return minMoves(n-1,auxPeg,toPeg,fromPeg)

      -- <i>otherwise p == auxPeg</i>
      count1 = minMovesToBuildTower(n-1,fromPeg)
      count2 = minMovesToBuildTower(n-1,toPeg)
      return min(count1,count2) + 2^(n-1)

   function minMovesToBuildTower(n,toPeg) is
      if n == 0 then return 0

      p = <i>the peg that disc n is currently on</i>
      if p == toPeg then return buildTower(n-1,toPeg)
      other = 3-toPeg-p  -- <i>assumes pegs are numbered 0,1,2</i>
      return buildTower(n-1,other) + 2^(n-1)
</pre>

See <b>krijgertje</b>'s solution for a nice implementation of this approach.
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
