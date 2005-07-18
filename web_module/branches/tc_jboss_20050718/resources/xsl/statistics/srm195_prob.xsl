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

<title>Single Round Match 195 Statistics at TopCoder</title>

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
                             <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 195</font></td>
                             <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                         </tr>

                         <tr valign="middle">
                             <td class="bodyText">Tuesday, May 18, 2004</td>
                             <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                         </tr>
                     </table>
<!--end contextual links-->

<h2>Match summary</h2> 
<p> 
In an exciting matchup between tomek and SnapDragon, the two coders at TopCoder
who keep swapping first and second place, SnapDragon walked away the clear
winner, even though he didn't win the division.  Instead that honor went to
venco, whose coding alone carried him to the top of the chart.  Vedensky, a
barely blue coder, propelled himself up 525 rating points when he took second
place in his third competition.  Another new coder, texel, took third, and has
an impressive rating of 2545 after only 5 matches.  tomek, whose score would
have been good enough for 3rd place if not for his flawed level 3, dropped 175
rating points for coming in 52nd.  SnapDragon, who finished very early in the
match with a score which would have taken first, dropped to fifth due to a
resubmission of his hard problem.  He made up for it with a couple of
successful challenges (using the test case that caused him to resubmit)  to get
into second place.  But when he tried for the sweep of the 950's in his room
with a killer timeout challenge against venco's correct 950 he dropped back to
fourth.  bstanescu (who was temporarily gray due to a bug in the ratings
system) rounded out the top 5.
</p> 

<p>
Division 2 had a harder time, having a level 3 problem that was quite similar
to the Division 1 level 3 that only 4 coders were able to solve.
Frodo_Baggins, the fastest submitter on the 1100 point hard, was still green
dispite winning his division.  In fact only 4 of the top 10 coders in division
2 made it to division 1, only one of those being a new coder.
</p>

<p>
One thing that made this match a little more hairy was a contradiction in the
Div 1 250 / Div 2 500.  Although it didn't affect most coders since the
constraints were changed to disallow test cases which exploited the
contradiction, some were left to swallow unnecessary resubmissions when they
noticed the contradiction.
</p>

 
<p>
<H1> 
The Problems 
</H1>
</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2016&amp;rd=5070">Rounder</a></b> 
</font> 
<A href="Javascript:openProblemRating(2016)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      176 / 186 (94.62%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      142 / 176 (80.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Krzysan</b> for 248.76 points (2 mins 0 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      217.94 (for 142 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
They don't get much simpler than this.  The simplest method to solve this
involves searching for a divisible number forwards and backwards.  A number can
be determined to be divisible by a base if the number MOD base is 0.  Since the
base can only be at most 500, you will have to search through at most 500
numbers to find the two limits.  Once you have them, subtract them from the
original number to get the difference.  If the differences are equal, return
the upper, otherwise, return the closest.
</p>

<p>
A shorter solution involves using the properties of integer division.  If you divide an integer by an integer, then multiply the result by the base, you get the lower bound we are searching for.  If you add base to the number before dividing, you can get the upper bound.  Then you can perform the difference check.  We can simplify this even further by adding half the base before dividing, which has the effect of producing the answer without having to check the differences!  Thus the code can be written in one line:
</p>

<pre>
return ((number + (base / 2)) / base) * base;
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2235&amp;rd=5070">FanFailure</a></b> 
</font> 
<A href="Javascript:openProblemRating(2235)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      107 / 186 (57.53%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      95 / 107 (88.79%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Krzysan</b> for 454.37 points (9 mins 11 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      295.00 (for 95 correct submissions) 
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
      155 / 163 (95.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      150 / 155 (96.77%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 245.60 points (3 mins 48 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      190.29 (for 150 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
At first glance, it seems like this problem may be NP-hard, since it asks you
to verify that all sets of fans of size X or less can fail.  However, the
problem can be solved with a greedy algorithm which looks at the fans in order
of increasing capacity.
</p>

<p>
First, we determine the Maximum Failure Set count.  If the set of the smallest
N fans can be a failure set, then the maximum failure set must have a count of
N or greater.  The reason is because any other set of fans with count N or
greater is going to have the same or greater capacity.  If the smallest N fans
cannot be a failure set, then the MFS must have a count of less than N fans,
for the same reason.  Therefore, the count of the MFS is going to be N, where
the smallest N fans is a valid failure set, but the smallest N+1 fans are not.
</p>

<p>
Next, we determine the Maximum Failure Count.  For this, we want to find the
minimum number of fans that would cause the system to fail, and the answer will
be one less than that.  Essentially, we can repeat the MFS algorithm but use
the largest fans instead of the smallest.  Any other set of N or less fans is
going to have the same or less capacity, and therefore will not cause the
system to fail.  So the answer to the MFC is N-1, where the N largest fans are
not a valid failure set, but the N-1 largest fans are.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2442&amp;rd=5070">ChangePurse</a></b> 
</font> 
<A href="Javascript:openProblemRating(2442)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1100 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 186 (3.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 6 (66.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Frodo_Baggins</b> for 764.32 points (20 mins 51 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      605.53 (for 4 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Seasoned topcoders should be able to look at the limits on this problem and
immediately realize that brute force is not the answer.  With 50 types of
coins, and a possible 1 billion cents to make up, brute force will most
certainly time out.  There actually is a trick to this problem, which lies in
the constraints on the return money.  Since there must be exactly one way to
make up each amount of money, each coin must evenly divide the next highest
denomination coin, and the highest denomination coin must evenly divide value +
1.  Some intuition and working out on paper will give this fact away, but I
shall actually prove it is true.
</p>

<p>
For the first part, I shall prove that when a coin type is the highest
denomination, the only valid configuration is to use as many coins of that type
as possible.  Let's assign a value of N to that coin.  If we use as many coins
as possible, then the amount left over in value is less than N.  Let's assume
we could have used a maximum of X coins of denomination N, with a value &lt; N
left over.  Let's try using Y coins of denomination N, where 1 &lt;= Y &lt; X.
This means that the amount left over is greater than N.  We'll call the set of
coins that make up the remaining non-N coins S, and the sum of all the coin
values in S will be denoted as |S|.  For the next step, we'll repeatedly remove
the smallest coin in S, and put it in another set S'.  We do this until the
value left in S is &lt;= N.  If the value of S is now N, then we have a
contradiction because there can be only one means of paying the value N, but we
could either use the coins in the set S, or a single N coin.  In the case where
the value of S is now &lt; N, we just removed a coin valued at M.  |S| + M is
greater than N, because otherwise we would have stopped at N.  Therefore 0 &lt;
N - |S| &lt; M.  Due to the rules, we must be able to make the value N - |S|,
but we cannot use any coins from S, because all the coins are valued at M or
greater.  Therefore, the coins to make N - |S| must come from S'.  If we take
these coins, and add them back to S, |S| is now equal to N, and we again have a
contradiction.  Therefore, by contradiction, you must use all the coins
possible of value N.
</p>

<p>
OK, that was the hard part, now, we must prove that N is divisible into value + 1.  All the non-N coins in the set must add up to N-1.  If the add up to less than N-1, then you cannot make the value N-1, which is a requirement of the answer.  If they add up to more than N-1, then you have a contradiction as proven above.  Therefore, value must equal N*X + N-1.  If we add one to each side, we get value+1 = N*(X+1).  Therefore, value+1 must be divisible by N.
</p>

<p>
To prove that each subsequently smaller coin must divide the next largest coin evenly, we remove all the coins of value N.  This leaves a value of N-1.  We now have the same situation as above, except the next lowest coin is now the highest, and the value is N-1.  Since we already have proven it must divide N evenly, we are done.
</p>

<p>
Given all this information, we can use a greedy approach to figuring out which
coins should be present.  If we sort the coins and start with the highest
denomination, we don't have to do any comparisons.  We use each coin if it can
be used, and then move down to the next lowest coin.  Each time we use a coin
of a value v, we reduce the total value to v-1, and repeat on the next coin.
This all adds up to about 5 lines of code.
</p>

<p>
The last step is to map back the sorted coin amounts to the original order of
the coins.  This step can be done with two for loops, as the input size will
allow for.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2383&amp;rd=5070">SimpleIO</a></b> 
</font> 
<A href="Javascript:openProblemRating(2383)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      106 / 163 (65.03%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      69 / 106 (65.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 442.44 points (10 mins 31 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      292.96 (for 69 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This problem was inspired by my cell phone.  It has 3 states, changed by
holding down a button.  One of the states vibrates when it is entered.
Therefore, I can figure out what state it is in without looking at it by
pressing the button until it vibrates, and then proceeding to the desired
state.
</p>

<p>
To solve this problem, we'll simulate starting from any given state, and keep
track of which states it is possible to be in.  At the beginning, any state is
possible.  The order of feedback is dictated by which state the device is
actually in.  Each time we advance a state, we record which states are
eliminated.  I solved this by using a 50-bit integer where each 1-bit
represented a possible state.  Once there is only one state left, and it is the
target state, we have found the answer.
</p>

<p>
A difficulty arises when the entire machine consists of a repeated sequence.
Because the sequence repeats, we can't tell which part of the state machine we
are in.  In this case, we will never get down to one state.  However, we can
notice that in cases where the state machine is not repeating, we will go
through at most all the states until we narrow down to one possible state.
Therefore, we can limit our simulation to about 150 iterations, and if it is
not done by then, return -1.
</p>


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2827&amp;rd=5070">ChangeOptimizer</a></b> 
</font> 
<A href="Javascript:openProblemRating(2827)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      950 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      18 / 163 (11.04%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      9 / 18 (50.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 619.73 points (23 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      530.62 (for 9 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem is almost exactly the same as ChangePurse (the Div 2 hard), but
for one small detail.  We want the set with the smallest number of coins,
regardless of denomination.  Ties are broken by sets which have more higher
denomination coins.  The same explanation applies, however, we must now try
every combination of coins since, as the problem statement shows, the answer
may not contain the highest possible coin.  Essentially, this requires some
sort of dynamic programming or heuristics, as a DFS may time out.  In one case,
each coin was a power of two, meaning that all coins divided evenly into each
other.  This would turn a DFS into an O(2<sup>n</sup>) solution.
</p>

                     <p>
                     <img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                     By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=273217"><strong>schveiguy</strong></a><br />
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
