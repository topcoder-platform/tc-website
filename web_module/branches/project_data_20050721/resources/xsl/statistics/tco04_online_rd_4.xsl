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

<title>TCO04 Online Round 4 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCO04 Online Round 4 Problem Set</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">September 29, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2> 

<p>
<b>reid</b> rode the fastest Easy and the fastest Medium to victory on a night
where no one solved all three problems.
Kudos to <b>gepa</b> for the lone successful solution to the Hard, but
resubmissions on both his Easy and Hard dropped him to fifth.
</p> 

<p>
At the conclusion of coding, only 22 coders had submitted more than one 
problem.  All but a few of the rest were within a single challenge of
the 24th-place cutoff for advancing, so tensions were especially high
entering the challenge phase.  However, only <b>ambrose</b>
and <b>AdrianKuegel</b> made successful challenges.  <b>ambrose</b> would
have made the cut anyway, but for <b>AdrianKuegel</b> the challenge made
the difference between advancing and not advancing.
System tests were uneventful for the Easy and the Medium, with only a single Easy failing and no Mediums.  The Hard was a different story, as all but
one of the nine submissions failed.
</p>
 
<p>
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2966&amp;rd=5881" name="2966">MitchellMovement</a></b> 
</font> 
<A href="Javascript:openProblemRating(2966)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      49 / 49 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      46 / 49 (93.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>reid</b> for 237.74 points (6 mins 31 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200.52 (for 46 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Many people simulated all the steps of the movement, but it was
cleaner to calculate the answer directly.  First, board B starts at
table T0 = (B-1)/3+1.  Between round 1 and round R, it moves to 
table T1 = T0 - (R-1), except that this value has to be wrapped to stay in
the range 1 to N.  Wrapping can be accomplished by a function
<pre>
  Wrap(X) = (X-1) mod N + 1
</pre>
but be careful because the <tt>%</tt> operator is not truly the
mod function!
T1 can be then written as Wrap(T0 - (R-1)).
Besides being the number of the table, T1 is also the number of the
North-South team at that table.
The East-West team came to T1 from distance (R-1) in the other direction,
ignoring skips.  This can be calculated as EW = Wrap(T1 - (R-1)).
If N is even and R &gt; N/2, then we also have to account for the skip, 
which can be accomplished by correcting EW to Wrap(EW-1).
See <b>reid</b>'s and <b>jms137</b>'s solutions for nice examples of this
approach.
</p>

<p>
This problem would be much cleaner and much less error prone if all the
ranges started at 0 instead of 1, but the bridge community has yet to
see the light when it comes to 0-based indexing.
</p>


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2982&amp;rd=5881" name="2982">HeatDeath</a></b> 
</font> 
<A href="Javascript:openProblemRating(2982)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      16 / 49 (32.65%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      16 / 16 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>reid</b> for 323.32 points (23 mins 57 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      280.37 (for 16 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This problem was harder than its 100% success rate might indicate.
Most people seemed to realize right away that a greedy strategy was
called for, but the trick was to come up with the <i>right</i>
greedy strategy.
</p>

<p>
Some obvious strategies, like choosing the pair with the maximum energy
difference or the pair with the minimum energy difference (greater than 1),
don't work.  The first is actually the quickest path to heat death.  The
second fails on an example like {1,2,3,6}.  The minimum energy difference
is between 1 and 3, but it is better to transfer energy from 6 to 3 in
the first microsecond.  Why?  Because transferring energy from 3 to 1
would lead to the state {2,2,2,6} in the first microsecond, 
and from there to {2,2,3,5} in the second microsecond.  In constrast,
we can take <i>three</i> microseconds to reach state {2,2,3,5} by going from
{1,2,3,6} to {1,2,4,5} to {1,3,3,5} to {2,2,3,5}.
</p>

<p>
This example suggests a greedy strategy that does
work.  First sort the list.  Then, always choose a pair of <i>adjacent</i> 
locations with an energy difference of two or more, whenever such a pair exists.
If there is more than one such pair, all of them will eventually yield the 
same result, so pick one arbitrarily.  
If there is no such pair of adjacent locations, then any
pair of locations with an energy difference of exactly two will work.
Again, pick one arbitrarily.  For example, given {1,2,3,4,5}, you might
pick 1&amp;3 or 2&amp;4 or 3&amp;5.
The process ends when the maximum energy level is within one unit of the 
minimum energy level.
</p>

<p>
One concise way to formulate this greedy strategy is to always
pick the two feasible locations that are closest together in the
array.  See <b>ambrose</b>'s solution for a nice implementation of
this approach.  A pleasant feature of this formulation is that updating
the energy levels of the two locations always leaves the array sorted.
Maintaining the order of the array is trivial when picking adjacent
locations, but takes some care when choosing non-adjacent locations.
</p>

<p>
Choosing adjacent locations is not always better than choosing
non-adjacent locations, but it is never worse.  For example, if we start
with {1,1,2,2,3,3,5}, then we can achieve the same optimal result by 
transferring energy either between 3 and 5, or between 1 and 3.  This
typically happens when we would have to choose the non-adjacent locations
eventually anyway, even if we did pick the adjacent locations first.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2967&amp;rd=5881" name="2967">BridgeArrangement</a></b> 
</font> 
<A href="Javascript:openProblemRating(2967)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      9 / 49 (18.37%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 9 (11.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gepa</b> for 339.82 points (47 mins 28 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      339.82 (for 1 correct submission) 
    </td> 
  </tr> 
</table></blockquote>

<p>
If the Medium was not as easy as its success rate suggests, this
problem was not as Hard as its success rate suggests.  Many
more coders would have gotten it if they hadn't spent so much
time trying different strategies in the Medium.
</p>

<p>
There are at most eight ways to order the suits in alternating colors, 
so we can just try them all.  However, we must be able to recognize when
a particular ordering is invalid because of a missing suit (called a
<i>void</i> in bridge lingo).  For example, the ordering
Clubs-Diamonds-Spades-Hearts is invalid if we have a void in either
Diamonds (because the two black suits would be adjacent) or Spades
(because the two red suits would be adjacent).  The general rule is
that, if we have exactly one void and that void is in one of the two
middle suits, then that particular ordering of suits will not work.  If
we have two or even three voids, then any ordering of suits will work.
</p>

<p>
Given a particular ordering of suits, we want to find the minimum
number of cards we have to move to achieve that ordering.  Or, looking
at it in the other direction, we want to find the <i>maximum</i>
number of cards we can leave in place to achieve the ordering.  This
turns out to be the famous Longest Increasing Subsequence problem,
previously seen in a similar form in the <i>Books</i> problem from <a
href="http://www.topcoder.com/index?t=statistics&amp;c=srm175_prob">SRM
175</a>.  (In our case, it would more accurately be called the
Longest Non-Decreasing Subsequence problem, but I'll stick to the
traditional terminology.)  For example, if we want to achieve the
ordering Clubs-Diamonds-Spades-Hearts, then we look for the longest
increasing subsequence, treating the suits as numeric values with
Clubs &lt; Diamonds &lt; Spades &lt; Hearts.  If our cards were
<tt>DCSCDHSSH</tt> (considering only the suits), then the longest increasing
subsequence is <tt>-C-CD-SSH</tt>, where the dashes indicate the cards that
have to be moved.
</p>

<p>
Longest Increasing Subsequence is one of the classic applications of
<a href="http://www.topcoder.com/index?t=features&amp;c=feat_040104">dynamic
programming</a>.  We maintain an array <tt>longest[N]</tt>, where
<tt>longest[i]</tt> is the length of the longest increasing subsequence ending
with the card at index <tt>i</tt>.  We can fill in this array as follows:
<pre>
  for (int i = 0; i &lt; N; i++) {
    longest[i] = 1;
    for (int j = i-1; j &gt;= 0; j--) {
      // <i>can we put card i after card j in an increasing subsequence?</i>
      if (suit[j] &lt;= suit[i])
        longest[i] = max(longest[i], 1 + longest[j])
    }
  }
</pre>
The overall longest subsequence is found by taking the largest value in <tt>longest</tt>.  The number of cards that need to be moved is then the total number of cards minus this largest value.
<pre>
  int best = 0;
  for (int i = 0; i &lt; N; i++) best = max(best, longest[i]);
  return N - best;
</pre>
</p>

<p>
So far, I've only talked about the suits of the cards, but
what about their ranks?  We have to make sure that no suit ends up in increasing
or decreasing order by rank (not counting suits with only one or two cards).  
This is trivial for suits that start out unsorted, but for suits that start
out in sorted order, we need to find the longest increasing subsequence that
<i>excludes</i> at least one card in that suit.  Then, when that card
is moved, we can be careful to put it in a position that will make the
suit unsorted (although we do not have to go so far as to actually
find that position in this problem).
</p>

<p>
We can adapt the LIS algorithm above to handle this extra constraint.
We extend the <tt>longest</tt> array to have dimensions
<tt>longest[N][2][2][2][2]</tt>.  The four binary dimensions represent
whether or not we are required to exclude a card in each of the
four suits:
1 means that we want the longest subsequence that definitely does
exclude a card in that suit, and 0 means that we want the longest subsequence,
regardless of whether or not it excludes a card in that suit.
For example, <tt>longest[5][0][1][1][0]</tt> would be the length of the longest
increasing subsequence ending at position 5 that is known to have
excluded a diamond and a heart.  It may or may not have excluded a
club and/or a spade&#8212;the 0's means we don't care.  
Adding these ideas to the previous algorithm, we get:

<pre>
  for (int i = 0; i &lt; N; i++)
    for (int c = 0; c &lt; 2; c++)         // <i>clubs</i>
      for (int d = 0; d &lt; 2; d++)       // <i>diamonds</i>
        for (int h = 0; h &lt; 2; h++)     // <i>hearts</i>
          for (int s = 0; s &lt; 2; s++) { // <i>spades</i>
            int[] x = new int[]{ c, d, h, s};
            // <i>Do we still need to exclude a card in each suit?</i>

            int best = -999; // <i>initialize to an impossible value</i>
            for (int j = i-1; j &gt;= 0; j--) {
              if (suit[j] &lt;= suit[i])
                best = max(best, 1 + longest[j][x[0]][x[1]][x[2]][x[3]]);
              // <i>Otherwise, we are excluding card j,</i>
              // <i>so no longer need to exclude this suit.</i>
              x[ suit[j] ] = 0;
            }
            if (x[0]+x[1]+x[2]+x[3] == 0) // <i>ok to have card i by itself</i>
              best = max(best, 1);
            longest[i][c][d][h][s] = best;
          }
</pre>

Now, to find the overall longest subsequence, assume we have a
function <tt>sorted(i)</tt> that returns 1 if suit <tt>i</tt> is
sorted (and has more than two cards).  The sorted suits are exactly
the ones for which we need to exclude a card somewhere along the line.
We look through <tt>longest</tt> to find the largest value, keeping in
mind when looking at position <tt>i</tt> that we are presumably excluding all
cards at higher positions.

<pre>
  int best = 0;
  int[] x = new int[]{ sorted(0), sorted(1), sorted(2), sorted(3) };
  for (int i = N-1; i &gt;= 0; i--) {
    best = max(best, longest[i][x[0]][x[1]][x[2]][x[3]]);
    // <i>Otherwise, we are excluding card i</i>
    x[ suit[i] ] = 0;
  }
  return N - best;
</pre>
If you are comfortable with bitmasks, they can be used to clean up this code
quite a bit, replacing the four binary dimensions with a single dimension from 0 to 15 and replacing the <tt>x</tt> arrays with simple integers.
</p>

<p>
On a personal note, I actually do arrange my bridge hands more or less
like in this problem, but without making a deliberate effort to keep
the individual suits unsorted&#8212;they usually end
up that way on their own.
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
