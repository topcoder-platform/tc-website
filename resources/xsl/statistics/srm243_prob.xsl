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

<title>Single Round Match 243 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 243</font></td>
                     <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Tuesday, May 17, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
Eryx won this match easily, with high scores on two of the problems.  Almost 90
points behind, petr took second place, and got his target after only 6 matches,
beating the record held by snewman of 8 matches.  Round out the top 3 was
Jan_Kuipers, helped by 25 points in the challenge phase.  In division 2, zolom
too first in his fourth match, while bramandia and kolo took second and third.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4510&amp;rd=7218" name="4510">ComputationalComplexity</a></b>
</font>
<A href="Javascript:openProblemRating(4510)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      175 / 207 (84.54%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      100 / 175 (57.14%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Qool</b> for 245.14 points (4 mins 0 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      182.08 (for 100 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Implementing the given formula is straightforward, and can be done using
built-in power functions, or by writing your own.  Once you find the runtimes for
each algorithm, you just need to find the minimum by iterating over them.  A
number of coders made the mistake of initializing a variable (which would
contain the speed of the fastest algorithm) that was too small.  Others cast the
result to an integer or double, and lost the precision they would need.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3043&amp;rd=7218" name="3043">Generators</a></b>
</font>
<A href="Javascript:openProblemRating(3043)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      100 / 207 (48.31%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      63 / 100 (63.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>nickel</b> for 487.80 points (4 mins 30 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      339.42 (for 63 correct submissions)
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
      189 / 199 (94.97%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      177 / 189 (93.65%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 249.23 points (1 mins 35 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      217.09 (for 177 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Despite the math terminology, this problem is really very straightforward.  You
can loop from 1 to p-1, and check each number to see if it's a generator.  Using
the equation given in the notes, it's easy to generate the sequence, and then you
just need to make sure that the sequence is equal to Z<sub>p</sub>.  There are
a few ways to do this, but the most obvious is to just have a boolean array
indicating which numbers have been generated in the sequence.  After you
generate p-1 numbers, just make sure that all the integers from 1 to p-1 have
been generated.  
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4004&amp;rd=7218" name="4004">FastSpider</a></b>
</font>
<A href="Javascript:openProblemRating(4004)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      20 / 207 (9.66%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      10 / 20 (50.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>zolom</b> for 909.00 points (9 mins 10 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      589.74 (for 10 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
There were two different ways to do this.  One way requires you to use calculus,
while the other is a numerical approximation.
For the calculus approach, you can think of how far the spider moves in a second, in proportion to the
length of the rubber band.  At second t, the length of the rubber band is <tt>1+t*manSpeed</tt>
feet.  At this exact point (time t), the spider is moving at a rate of
<tt>spiderSpeed/(1+t*manSpeed)</tt> percent of the total rubber band length per
second.  More precisely, the derivative with respect to t of the percent along the band of the
spider's position is <tt>spiderSpeed/(1+t*manSpeed)</tt>.  Therefore, over some
number of seconds, x, the percent of the band length that the spider has moved is 
<tt>Integral(spiderSpeed/(1+t*manSpeed),t)</tt> evaluated from 0 to x, or
<tt>spiderSpeed*ln(1+manSpeed*t)/manSpeed</tt>.  Since we want the spider to go
all the way along the rubber band, we set this to 1, and solve for t:
<pre>
    spiderSpeed*ln(1+manSpeed*t)/manSpeed = 1
    ln(1+manSpeed*t) = manSpeed/spiderSpeed
    1+manSpeed*t = exp(manSpeed/spiderSpeed)
    t = (exp(manSpeed/spiderSpeed)-1)/manSpeed
</pre>
If you calculus was rusty, there was another way.  You could simply simulate the
spider with a large number of very small steps, alternating between the man
moving and the spider moving.  Because of the constraints, it is possible to
achieve enough precision with a solution like this to solve the problem.

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4453&amp;rd=7218" name="4453">TopFive</a></b>
</font>
<A href="Javascript:openProblemRating(4453)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      114 / 199 (57.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      84 / 114 (73.68%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>radeye</b> for 472.97 points (6 mins 52 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      301.18 (for 84 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem obviously refers to the TopCoder contests.  In the first step, you
should calculate the probability of beating each of the other people
independently.  You can do this by examining each of the 8 outcomes (2 outcomes
for each of 3 problems) for each person.  Then, you can use brute force to find
all the possible ways to get 1st, 2nd, 3rd, 4th, or 5th.  A simple way to do
this is to recursively find all sets of 0, 1, 2, 3 and 4 people, representing
the people who beat you.  Then, for each of these sets, compute the probability
that those people beat you, and that you beat everyone else.  This is done by
simply multiplying all the individual probabilities (of beating people or being
beat by people) together.  Add up the results from all sets, and return this
result.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4582&amp;rd=7218" name="4582">TwoKings</a></b>
</font>
<A href="Javascript:openProblemRating(4582)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      22 / 199 (11.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      7 / 22 (31.82%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 641.33 points (24 mins 19 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      505.08 (for 7 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
At first glance, the state space for this problem seems huge, as there are
10,000<sup>3</sup> different board positions.  However, there is a simple strategy to
capture a king in 4 moves.  First, move the queen to the same row as king 1 (if
you can't do this, it means you can capture a king right off).  The king will
then have to move to one of the two adjacent rows.  Next, move the queen to the
same column as king 2.  This will force the second king to move to one of the
adjacent columns.  Now, you can move the queen diagonally one space in one of
the four directions to fork the kings, attacking them both, and on the next move
you can capture one of them.  Therefore, if we haven't forked the kings
(including cases where they are lined up) or cornered one on the edge of the
board after 2 moves, we need not continue, as we already know an equal or better
way to do it.<br/><br/>

This allows us to write a brute force solution that will run in time.  We know
that the answer is at most 4, so we are only interested in cases where the
answer is 3 or less.  If we haven't forked the kings or cornered one of them
after 2 moves, then we won't be able to capture a king on the third.  Each time
we move the queen, there are at most 400 positions it can end up with.  Moving
it twice gives 400*400 possibilities.  One of the kings moves once in between,
for a maximum of 400*16*400 = 2,560,000 possibilities, each of which can be
evaluated quickly to determine if a king is cornered, or if they are forked.  
</p>


                <p>
                <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
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
