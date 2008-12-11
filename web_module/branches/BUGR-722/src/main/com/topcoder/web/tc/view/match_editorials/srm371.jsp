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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10787">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516068" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 371</span><br />Saturday, October 13, 2007
<br /><br />



<h2>Match summary</h2>

 
<p>SRM 371 had a record turnout, hitting the maximum of 1500 registrants
well before the end of registration. In Division I,
<tc-webtag:handle coderId="7340263" context="algorithm"/> opened the scoring with a lightning-fast
submission on the 500. However, <tc-webtag:handle coderId="10574855" context="algorithm"/> returned to his
usual form with the fastest submissions on the other two problems,
leaving him at the top of the division at the end of coding. The
challenge phase was fairly tame, with the top scorers largely
unchanged. <tc-webtag:handle coderId="10574855" context="algorithm"/> won the match, with
<tc-webtag:handle coderId="7442498" context="algorithm"/> and <tc-webtag:handle coderId="11829284" context="algorithm"/> coming
second and third respectively.</p>
<p>In Division II, coders faced a 250 that was more difficult to
understand than usual, with a very low success rate. At the end of the
coding phase, <tc-webtag:handle coderId="22698843" context="algorithm"/>, <tc-webtag:handle coderId="22696504" context="algorithm"/> and
<tc-webtag:handle coderId="22657007" context="algorithm"/> were the top three, but
<tc-webtag:handle coderId="22698843" context="algorithm"/> lost all three solutions to challenges and
<tc-webtag:handle coderId="22657007" context="algorithm"/> made four unsuccessful challenges,
leaving <tc-webtag:handle coderId="22696504" context="algorithm"/> in first place by a comfortable
margin. <tc-webtag:handle coderId="10116102" context="algorithm"/> came second and
<tc-webtag:handle coderId="22695529" context="algorithm"/> came a close third.</p>

 

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8240&amp;rd=10787" name="8240">CondorcetVoting</a></b>

</font>

<A href="Javascript:openProblemRating(8240)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516068" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      562 / 759 (74.04%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      201 / 562 (35.77%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>softhacker</b> for 245.76 points (3 mins 44 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      165.59 (for 201 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>Possibly the hardest part of the problem is understanding exactly
what was required. Once the problem is understood, implementation is
relatively straightforward, the only catch being to watch out for &lt;
versus &le;.</p>
<p>Create an N by N table with the
number of times each candidate is ranked ahead of each other candidate,
initialised to all zeros. Then go through each voter and each table
entry, and increment if necessary. At the end, check whether each
candidate is a Condorcet winner by checking the appropriate table
entries, remembering that the candidate does not have to beat
himself. See <tc-webtag:handle coderId="10116102" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=266761&amp;rd=10787&amp;pm=8240&amp;cr=10116102">solution</a>
as an example.</p>
 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8262&amp;rd=10787" name="8262">SpiralRoute</a></b>

</font>

<A href="Javascript:openProblemRating(8262)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516068" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      348 / 759 (45.85%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      260 / 348 (74.71%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>vijeth.d</b> for 465.59 points (7 mins 50 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      305.36 (for 260 correct submissions)

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

      615 / 650 (94.62%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      575 / 615 (93.50%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Petr</b> for 246.76 points (3 mins 16 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      188.73 (for 575 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>A simulation that follows the spiral walk will suffice, but it is
both slow and relatively complex (nevertheless, <tc-webtag:handle coderId="10574855" context="algorithm"/>'s
<a href="/stat?c=problem_solution&amp;rm=266694&amp;rd=10787&amp;pm=8262&amp;cr=10574855">solution</a>
was the fastest and used this approach). A simpler solution is to
note that after walking around all four sides, the situation is exactly
the same except that a layer has been peeled off the outside. This
makes for a simple recursion, with the base case occurring when either
<b>width</b> or <b>length</b> is 1 or 2:</p>
<pre>public class SpiralRoute {
    public int[] thronePosition(int W, int L) {
        if (L == 1) return new int[] {W-1, 0};
        if (L == 2) return new int[] {0, 1};
        if (W == 1) return new int[] {0, L-1};
        if (W == 2) return new int[] {0, 1};
        int[] res = thronePosition(W-2, L-2);
        res[0]++; res[1]++;
        return res;
    }
}</pre>

<p>For the more mathematically inclined, there is also a constant-time
solution. Suppose <b>width</b> &gt; <b>height</b>, and <b>height</b> is
even. The spiral will end with a Westwards section along row
<b>height</b> / 2, and it is not hard to see that it will end in column
<b>height</b> / 2 - 1. There are three other cases to handle, depending
on which dimension is larger, and whether the other dimension is odd or
even.</p>
 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8243&amp;rd=10787" name="8243">FloodRelief</a></b>

</font>

<A href="Javascript:openProblemRating(8243)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516068" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      102 / 759 (13.44%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      68 / 102 (66.67%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>zizavino</b> for 912.08 points (8 mins 59 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      664.96 (for 68 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>The first step is to identify flat levels of the map, where water
is free to flow back and forth. A <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=graphsDataStrucs2#depth">depth first search</a> is the simplest way to do this: keep track of
which cells have been seen, and when you find one that hasn't,
recursively find everything adjacent that is at the same height.</p>

<p>Having found the regions, it is simply a matter of placing a pump
in every region that is lower than all its neighbours. For every pair
of adjacent cells of differing heights, set a flag to indicate that
the region owning the higher of the cells does not need a pump. A pump
is required for each region that remains unflagged at the end.</p>
 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7726&amp;rd=10787" name="7726">ChessMatchup</a></b>

</font>

<A href="Javascript:openProblemRating(7726)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516068" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      508 / 650 (78.15%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      405 / 508 (79.72%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>gevak</b> for 497.99 points (1 mins 48 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      376.71 (for 405 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>At first glance, this may appear to be the same problem as <a href="/stat?c=problem_statement&amp;pm=3002">PlayGame</a>,
but the draws in this problem mean that the algorithm needs to be a bit more
sophisticated.</p>

<p>Let's suppose you've decided that you're going to lose L games. You might
as well lose those games by putting your worst L players against their best L
players. For the remaining games, imagine that your players A and B (A
&gt; B in skill) respectively play their players X and Y (X &le; Y in skill).
By assumption, B does not lose, so B &ge; Y. It follows that A would beat Y,
and B would do at least as well against X as he/she would against Y, so it
would not reduce your score to swap A and B. Applying this idea
repeatedly, you see that it is optimal, amongst the games that you do
not lose, to put your players in the same order as their opponents
(strong against strong, weak against weak). And since the order of your
players in losing games is irrelevant, there is an optimal solution
which involves simply rotating your ordered list of players when
matching it to their ordered list of players.</p>

<p>The only remaining problem is to determine the optimum number of games to
lose. This can be handled simply by trying all possibilities, in other words,
all rotations of our players.</p>

<p><tc-webtag:handle coderId="7340263" context="algorithm"/> chose to use heavy machinery in his <a href="/stat?c=problem_solution&amp;rm=266692&amp;rd=10787&amp;pm=7726&amp;cr=7340263">solution</a>:
he took the scores of every potential game as edge weights on a bipartite
graph, and used a pre-coded min-cost flow implementation to find the
optimum assignment. <tc-webtag:handle coderId="11829284" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=266710&amp;rd=10787&amp;pm=7726&amp;cr=11829284">solution</a>
also takes a heavy approach, using dynamic programming to find the
best way of matching your best P players against their best Q players.</p>
 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7703&amp;rd=10787" name="7703">RaceOrdering</a></b>

</font>

<A href="Javascript:openProblemRating(7703)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516068" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">

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

      155 / 650 (23.85%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      61 / 155 (39.35%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Petr</b> for 785.32 points (11 mins 11 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      491.01 (for 61 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>Let's start by getting a solution that is correct but slow. Find a
contestant that is not known to be behind any other, assume he/she is
in first, and count the number of ways to order the remaining
contestants ignoring the first one (recursively). Repeat with each
possible winner, and you will have an answer. However, this is O(N!),
which is far too slow. The first optimisation is to note that the
number of ways to order any subset is always the same, regardless of
the order of previous contestants. Thus, we can memoise on the subset
to the ordered. This requires O(2<sup>N</sup>) time and memory &mdash;
still too slow.</p>

<p>The final twist is that although there may be up to 30 contestants
in total, there are at most 16 in any component of the dependency
graph. The algorithm may be applied separately to each component. If
components with sizes M<sub>1</sub> and M<sub>2</sub> can be ordered
in C<sub>1</sub> and C<sub>2</sub> ways respectively, then their union
can be ordered in
C<sub>1</sub>C<sub>2</sub>.c(M<sub>1</sub> + M<sub>2</sub>,
M<sub>1</sub>) different ways, where c(n, r) is the number of ways to
choose r out of n.</p>

<p>An alternative approach is to ignore components, but apply the DP
keeping track of only which runners from <b>first</b> have been
placed, together with the total number of runners placed. The insight
is that if two runners do not appear in <b>first</b> and can both be
placed, then they are interchangeable because placing them has no
effect on which runners may be placed later on. See
<tc-webtag:handle coderId="7462740" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=266706&amp;rd=10787&amp;pm=7703&amp;cr=7462740">solution</a>
for a nice implementation of this approach.</p>

<br /><br />



<div class="authorPhoto">
    <img src="/i/m/bmerry_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="251074" context="algorithm"/><br />
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
