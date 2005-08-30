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

<title>Single Round Match 191 Statistics at TopCoder</title>

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
                             <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 191</font></td>
                             <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                         </tr>

                         <tr valign="middle">
                             <td class="bodyText">Saturday, April 24, 2004</td>
                             <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                         </tr>
                     </table>
<!--end contextual links-->

<h2>Match summary</h2> 
<p> 
Pity poor <b>SnapDragon</b>'s thumbs.  After brutalizing the first-time 
writer's problems in a mere 25 minutes, he had nothing to do but twiddle
them for the next 65 minutes, before he was finally able to challenge
yet another hapless victim.  And how demoralizing must it have been for
third-place finisher <b>Klinck</b>?  First, he looks up from finishing
all three problems in an astonishing 33 minutes, only to find that he was more
than 30% slower than the leader.  Then he was to watch as <b>gepa</b> passes
him with three successful challenges.  <b>Klinck</b> fought back with
a challenge of his own in the waning minutes, but it wasn't enough.
</p> 

<p>
In Division Two, it was a good day for newcomers, who took four of
the top five spots, led by <b>texel</b>, <b>HilbertRaum</b>, and
<b>tenshiyuan</b>.  <b>boets</b> was able to partially defend the
honor of TopCoder veterans with a respectable fourth-place finish.
</p>

<p>
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2297&amp;rd=4775">BettingMoney</a></b> 
</font> 
<A href="javascript:openProblemRating(2297)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      159 / 167 (95.21%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      154 / 159 (96.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>haowei</b> for 246.40 points (3 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      216.49 (for 154 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
An easy problem to start the day.  Most of the successful solutions looked
essentially like this:
<pre>
  int netGain = 0;
  for (int i = 0; i &lt; amounts.length; i++)
     if (i == finalResult)
        netGain -= amounts[i] * centsPerDollar[i];
     else
        netGain += amounts[i] * 100;
  return netGain;
</pre>
A slightly shorter variation, but one that is easier to get wrong, is
to pretend everybody lost their bets in the loop, and then adjust for
those who actually won afterwards.
<pre>
  int netGain = 0;
  for (int i = 0; i &lt; amounts.length; i++) 
     netGain += amounts[i] * 100;
  netGain -= amounts[finalResult] * 100;
  netGain -= amounts[finalResult] * centsPerDollar[finalResult];
  return netGain;
</pre>
I've written the last three lines separately for clarity, but they can
easily be combined into a single, long line.
</p>
<p>
With so few failures, it's hard to generalize any common mistakes, but
the only mistake that appears to have been made twice is to covert the loss
into dollars before eventually converting the total into cents.
</p>


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2330&amp;rd=4775">VolumeGuess</a></b> 
</font> 
<A href="javascript:openProblemRating(2330)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      97 / 167 (58.08%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      58 / 97 (59.79%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>wilsong</b> for 443.37 points (10 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      292.50 (for 58 correct submissions) 
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
      129 / 146 (88.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      103 / 129 (79.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Larry</b> for 247.14 points (3 mins 3 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      184.89 (for 103 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This was perhaps the most interesting problem of the match, because it admits
such an amazing variety of solutions.  At least five major families of 
algorithms were used successfully in the competition&#8212;and I don't pretend
to have looked at every solution!
</p>

<p>
In the first variation, hordes of C++ programmers, including <b>SnapDragon</b>
and <b>gepa</b>, were seduced by the availability of the 
<tt>next_permutation</tt> function.  In this variation, you create a 
sequence of all the distinct
volumes, where element <i>k</i> of the sequence stands for the volume 
of box <i>k</i>.  The volume of the largest box does not appear anywhere in
queries, so you add a large dummy value to the sequence to stand in for
the missing volume.
Then you loop through all the permutations of this sequence until
you find one that satisfies all the queries, 
and return element <tt>ithBox</tt> of the sequence.  Personally, I hate
this solution, because O(n!) algorithms offend my sensibilities.  <i>Kids,
do not try this at home!</i>
</p>

<p>
The second variation was probably the least common, but a few coders such
as <b>centipede80</b> and <b>Im2Good</b> did a depth-first search through 
the queries.  For query <tt>x,y,vol</tt>, you first try assigning the
given volume to box <tt>x</tt> and then to box <tt>y</tt>, backtracking
whenever a box is assigned incompatible volumes.  You can prune the search
space considerably by remembering that, if we assign the given volume
to box <tt>x</tt>, then the other box must already have a larger volume,
or must eventually be given a larger volume.
</p>

<p>
In the third variation, used by <b>jms137</b> and <b>texel</b>, 
you take advantage of the fact that only the box with the minimum volume
will have the same volume in all of its queries.  Find that box and the 
associated volume.  If it is the box numbered <tt>ithBox</tt>, then return
the volume.  Otherwise, remove all queries for that box and repeat.
</p>

<p>
In the fourth variation, exemplified by <b>Wernie</b>, you realize that,
if the same volume appears in two different queries involving a given
box, then that must be volume of that box.  So, you can scan through
the queries involving <tt>ithBox</tt> until you find a duplicate volume,
and return that volume.
</p>

<p>
The fifth variation was the simplest and fastest of all, both fastest
in running time and fastest to code.  Speedster <b>Larry</b> used this
approach, as did macro-happy <b>Eryx</b>.  In this variation, you realize
that if two queries involving the same box have different volumes, then
the smaller of the two volumes cannot be the volume of the given box.
Therefore, by process of elimination, the volume of a given box is the
maximum volume that appears in any query involving that box.  So, just
look through all the queries involving <tt>ithBox</tt>, and keep
track of the biggest volume.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2329&amp;rd=4775">CuboidJoin</a></b> 
</font> 
<A href="javascript:openProblemRating(2329)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      34 / 167 (20.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 34 (23.53%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>texel</b> for 775.06 points (16 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      609.87 (for 8 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The first temptation in a problem like this is to loop through all the
possible unit cubes and just count the ones that are inside one or more
cuboids.  But with a grid that is 10001-by-10001-by-10001, there are just too
many unit cubes for this brute-force approach to be feasible.
</p>

<p>
The approach taken by most of the successful solutions (see, for example, <b>HilbertRaum</b>'s) is to reduce
the problem to a much-more-manageable 10-by-10-by-10 grid.  There are at
most 10 x-coordinates of interest&#8212;namely, those that appear in
one or more of the cuboids.  Similarly, there are at most 10 y-coordinates of
interest and at most 10 z-coordinates of interest.  We can collect
all the coordinates of interest into three sets, sort them, and then
brute-force our way through this much smaller grid, considering
all possible regions formed by neighboring coordinates.
</p>

<p>
For example, suppose there are only two cuboids, one with 
0 &lt; x &lt; 100, 15 &lt; y &lt; 115, and 22 &lt; z &lt; 122, and 
the other with
96 &lt; x &lt; 196, 15 &lt; y &lt; 115, and 7 &lt; z &lt; 122.  
The x-coordinates of interest are {0, 96, 100, 196}, the y-coordinates
of interest are {15, 115}, and the z-coordinates of interest are
{7, 22, 122}.  Now there are only six regions that we have to check,
beginning with the region defined by
0 &lt; x &lt; 96, 15 &lt; y &lt; 115, and 7 &lt; z &lt; 22.
</p>

<p>
For each region, we check if it falls inside one or more of the original
cuboids, and, if so, add the region's volume to the total.  Because of
the way we choose the boundaries of the regions, we know that each
region should be counted entirely or not at all&#8212;it is impossible for
one of the regions to fall partly inside and partly outside some
cuboid.
</p>

<p>
Two of the successful solutions, including <b>texel</b>'s, were based
instead on the inclusion-exclusion principle.  You begin by adding all the
volumes of the individual cuboids.  But this overcounts those regions that
appear in more than one cuboid.  To correct for this error, you subtract all
the intersections of two cuboids.  But now you are undercounting those regions
that appear in more than two cuboids, so you add back in all intersections
of three cuboids.  Continuing in this fashion, you subtract all intersections
of four cuboids, and finally add the intersection (if any) of all five
cuboids.
</p>

<p>
To calculate the intersection of several cuboids, you take the maximums of
their left, bottom, and front coordinates, and the minimums of their right,
top, and back coordinates.  Then just verify that the resulting left, bottom,
and front coordinates are less than the resulting right, top, and back
coordinates.
</p>


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2331&amp;rd=4775">PolicePair</a></b> 
</font> 
<A href="javascript:openProblemRating(2331)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      82 / 146 (56.16%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      63 / 82 (76.83%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 452.91 points (9 mins 21 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      316.24 (for 63 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First, build a table of how many officers have skill <i>s</i> (call
this <tt>numWith[</tt><i>s</i><tt>]</tt>).
Then just brute-force it baby!  Consider the possible sums of the skills
of the two officers per squad car.  These sums range from 2 to 2000.  For
each sum, calculate how many officers would be unassigned, and keep the
sum that results in the fewest unassigned officers.  At the end, just remember
to divide the sum by 2 to get the average.
</p>

<p>
For each sum, consider all possible individual skill levels and determine how
many of the officers with that skill level would remain unassigned.  Officers
of skill level <i>s</i> would be paired with officers of skill level 
sum-<i>s</i>.  If <tt>numWith[</tt><i>s</i><tt>]</tt> <tt>&lt;=</tt> <tt>numWith[</tt>sum-<i>s</i><tt>]</tt>, then all officers with skill level <i>s</i> would be
assigned.  If
<tt>numWith[</tt><i>s</i><tt>]</tt> <tt>&gt;</tt> <tt>numWith[</tt>sum-<i>s</i><tt>]</tt>, then 
<tt>numWith[</tt><i>s</i><tt>]</tt> <tt>-</tt> <tt>numWith[</tt>sum-<i>s</i><tt>]</tt> would
be left unassigned.  There is a special case when <i>s</i> is half of sum.
In that case, officers with skill level
<i>s</i> would be paired with each other, so one officer would be
left unassigned if <tt>numWith[</tt><i>s</i><tt>]</tt> is odd, and none
if <tt>numWith[</tt><i>s</i><tt>]</tt> is even.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2346&amp;rd=4775">MagicianTour</a></b> 
</font> 
<A href="javascript:openProblemRating(2346)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      54 / 146 (36.99%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      27 / 54 (50.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 839.93 points (7 mins 42 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      614.58 (for 27 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
As Hard problems go, this one was pretty easy, as reflected
by the unusually high submission rate.  At least, it was easy
if you are familiar with textbook algorithms such as Depth-First
Search and Knapsack.
Even so, <b>SnapDragon</b>'s
speed on this problem was awfully impressive.
</p>

<p>
This problem can be broken down into four steps, although the first
three steps were done at the same time in most successful solutions.
<ol>
<li> Partition the cities into connected components, most likely using
     DFS, but perhaps using union-find if you happen to have that
     precoded.</li>
<li> Assign shows to the cities in each component.  For each component,
     begin by assigning show 1 to an arbitrary city.  Then assign show 2
     to all of its neighbors, show 1 to all of its neighbors' neighbors,
     and so on.  The constraints guarantee that such an assignment will
     always be possible.  Furthermore, for each set of connected
     cities, the assignment will be unique, except for the possibility
     of switching all show 1 cities to show 2 cities, and vice versa.
     This step is most easily accomplished using DFS, probably the same
     DFS that determined the components to begin with.</li>
<li> For each component, calculate the difference between populations of
     the show 1 cities and the show 2 cities.  Again, this is 
     probably done during the same DFS as the first two steps.  If the 
     difference is D, then the contribution of this component to the 
     overall difference is either D or -D.  The latter difference
     can be achieved by switching
     the shows for all cities in the component simultaneously.</li>
<li> Finally, use a knapsack-like algorithm to make the overall difference
     between the populations of the show 1 cities and the show 2 cities as
     small as possible.  Essentially, you want to choose either D or -D for
     each component in such a way that you minimize the absolute value of
     final sum.
     This is sometimes known as the "tug-of-war" problem (and in fact
     appeared as a TopCoder problem of the same name once upon a time),
     named for the problem of trying to create two tug-of-war teams that
     are as evenly balanced as possible.  Most of the successful coders,
     like <b>SnapDragon</b>, 
     used a minor variation of the classic dynamic-programming knapsack
     algorithm.
     <b>Ryan</b> took a slightly different approach, but his code for
     this step is particularly understandable.</li>
</ol>
</p>

<p>
Many of the unsuccessful submissions on this problem fell to timeout 
challenges.  One common mistake was trying to solve the problem with 
a single DFS, without separating the cities into connected components.
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
