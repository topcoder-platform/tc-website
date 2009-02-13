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

<title>Single Round Match 258 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 258</font></td>
                     <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Wednesday, August 10, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>Both divisions saw a good number of coders finishing all three problems fairly quickly.  In both
divisions, the challenge phase proved to be very eventful, with a lot of solutions dropping
like flies.  In Division 1, system testing knocked down a fair number of the easy and hard
submissions as well.</p>
<p>In the end, Division 1 was led by <b>ivan_metelsky</b>, followed by <b>Eryx</b> and <b>rem</b>.
In Division 2, <b>malcin</b> took top honors, with <b>RizLA</b> and <b>TheJanitor</b> not far behind.</p>

<p>I'd also offer a special note of congratulations to <b>HiltonLange</b>, for becoming the first (and
currently only) VB coder to go red.</p>
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4710&amp;rd=7993" name="4710">ClassScores</a></b>
</font>
<A href="Javascript:openProblemRating(4710)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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
      297 / 356 (83.43%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      221 / 297 (74.41%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>hubPL</b> for 247.41 points (2 mins 55 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      204.07 (for 221 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>Since our task here is to find the value(s) that occur most frequently,
a good way to start is by counting how many times each value occurs.
If we are given <i>n</i> values initially, then no element will appear more
than <i>n</i> times.  So, we can start by looking for any elements that
appear <i>n</i> times, and if there are any, that's our result.  If not, 
look for elements that appear <i>n</i>-1 times, etc.</p>

<pre>
public class ClassScores {

public int[] findMode(int[] scores) {
  int[] count = new int[101];
  for (int i = 0; i &lt; scores.length; i++)
    count[scores[i]]++;
  for (int i = scores.length; i &#8805; 1; i--) {
    int c = 0;
    for (int j = 0; j &#8804; 100; j++)
      if (count[j] == i)
        c++;
    if (c &gt; 0) {
      int p = 0;
      int[] ret = new int[c];
      for (int j = 0; j &#8804; 100; j++)
        if (count[j] == i) {
          ret[p] = j;
          p++;
        }
      return ret;
    }
  }
  return new int[0];
}

}
</pre>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3970&amp;rd=7993" name="3970">AutoLoan</a></b>
</font>
<A href="Javascript:openProblemRating(3970)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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
      61 / 356 (17.13%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      17 / 61 (27.87%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>darkknight7</b> for 400.51 points (14 mins 57 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      281.72 (for 17 correct submissions)
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
      262 / 309 (84.79%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      145 / 262 (55.34%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 244.16 points (4 mins 24 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      183.93 (for 145 correct submissions)
    </td>
  </tr>

</table></blockquote>

<p>Simulating the payoff of a loan at a given interest rate is not too difficult
to code (we just need to follow the procedure as described in the problem), and
since there are at most 600 iterations, we can repeatedly run this simulation as
we attempt to find the correct interest rate.  If our simulation results in
paying off the loan before all of the payments are made in full, then our
interest rate is too low.  If we have made all of the payments, but there is
still a balance left on the loan, then the interest rate is too high.  Using
these guidelines, we can then do a binary search, or similar method, to
iteratively calculate our way to the correct value.</p>

<p>Now, the mathematically minded might be tempted to play with the formula a bit,
and move a few things around to expose a geometric series, which can be expressed
in a closed form.  I'll leave the mathematical gruntwork as an exercise to the
reader, but it goes something like this:</p>

<p>Let the monthly compounding factor,
<i>c</i> = 1 + interestRate / 1200  (Thus, for 12% interest, <i>c</i> = 1.01),<br />
<i>m</i> = monthlyPayment,<br />

<i>p</i> = price,<br />
<i>n</i> = loanTerm</p>

<p>Then, <i>m</i> * (<i>c</i> ^ <i>n</i> - 1) = <i>p</i> * <i>c</i> ^ <i>n</i> * (<i>c</i> - 1).</p>

<p>You might now notice that algebraic manipulation will get us a closed form expression to
isolate any of the variables, except for <i>c</i>, which is needed to calculate the interest rate.
Thus, even with some mathematical insight, some programmatic work is still necessary
to find the desired result.</p>

<pre>
public class AutoLoan {

private double amort(double principal, double payment, int term, double interest) {
  double m = interest / 1200;
  if (principal * m &gt; payment)
    return 1;
  for (int i = 0; i &lt; term; i++)
    principal = principal * (1 + m) - payment;
  return principal;
}

public double interestRate(double price, double monthlyPayment, int loanTerm) {
double ret = 0;
double inc = 1000000000;
while (inc &#8805; 1.0E-18) {
  double d = amort(price, monthlyPayment, loanTerm, ret + inc);
  if (d &#8804; 0) {
    ret += inc;
  }
  inc /= 2.0;
}

return ret;

}

}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4705&amp;rd=7993" name="4705">MissileTarget</a></b>
</font>
<A href="Javascript:openProblemRating(4705)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />

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
      124 / 356 (34.83%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      64 / 124 (51.61%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Xero</b> for 954.31 points (6 mins 16 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      693.88 (for 64 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>This is another problem that is fairly easily solved with a bit of grunt work
to calculate out the desired values.  Since we are looking for the lattice point that
is closest to our best fit, our best bet is to first calculate the location of the
actual best fit point (using floating point, that is), and then find the closest
lattice point.</p>

<p>To find the best fit point, we one important observation:  calculating the best fit
x-coordinate and the best fit y-coordinate separately will give us our best fit point.
Why?  Since the scoring of a point as being best fit is based upon the sum of the squares
of the distances from each of the points, we see that:</p>

<p>score = sum(<i>d</i>^2) = sum(sqrt((<i>x</i> - <i>x0</i>)^2 - (<i>y</i> - <i>y0</i>)^2)^2)<br />

&#160;&#160;= sum((<i>x</i> - <i>x0</i>)^2 + (<i>y</i> - <i>y0</i>)^2)<br />
&#160;&#160;= sum((<i>x</i> - <i>x0</i>)^2) + sum((<i>y</i> - <i>y0</i>)^2)</p>

  
<p>So, to minimize the score, it suffices to minimize each sum separately.</p>

<p>To minimize each sum, a ternary search works well.  However, in this case, if you
were inclined to do the mathematical gruntwork, then you found a nice shortcut.
The average of the x-coordinates will give you the x-coordinate of the best fit point,
and the same goes for the y-coordinates.  (Why?  Hint: Use calculus to prove where
the minimum value is.)</p>

<p>Either way, once you have the location of the best fit point it's just simply a
matter of finding the closest lattice point, and the easiest way to do this is
by rounding.  (Note the constraints were intended to prohibit the case where a point
was equidistant from multiple lattice points.)</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4703&amp;rd=7993" name="4703">CompressionText</a></b>
</font>
<A href="Javascript:openProblemRating(4703)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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
      254 / 309 (82.20%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      98 / 254 (38.58%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 485.03 points (5 mins 1 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      354.32 (for 98 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>Since we are selecting two strings, each 3 characters in length, we know that, in order
for them to be of any consequence to our ability to compress the string, they must appear
in the string at least once.  There are at most 48 3-characters substrings of our input, and
thus at most 48 * 48 = 2304 possible pairs, so we can easily brute force through all of
these possibilities.</p>

<p>The only trick is how to generate the best possible compressed string, given a source
string.  Simply search and replacing one string followed by the other is not guaranteed to
give us the best possible result.  Instead, we need to work left to right, and if the next
3 characters are either of the strings, we know we will compress by one character, and 
continue searching following that string.  Otherwise, we increment by one character, and
continue searching.</p>

<p>The only other thing that may have caused issues was short inputs.  Anything 6-8 characters
in length will compress by exactly 2 characters, always.  Anything 3-5 characters in length
will compress by 1 character.  Anything 1 or 2 characters long can't be compressed at all,
so we return the original length.</p>

<pre>
public class CompressionText {

public int shortestLength(String original) {
  int best = original.length();
  for (int i = 0; i &lt; original.length() - 2; i++)
    for (int j = 0; j &lt; original.length() - 2; j++) {
      int cur = original.length();
      int pos = 0;
      String s1 = original.substring(i, i + 3);
      String s2 = original.substring(j, j + 3);
      while (pos &lt; original.length() - 2) {
        String s = original.substring(pos, pos + 3);
        if (s.equals(s1) || s.equals(s2))
          { cur--; pos += 3; }
        else
          pos++;
      }
      best = Math.min(best, cur);
    }
  return best;
}

}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4701&amp;rd=7993" name="4701">ChutesAndLadders</a></b>
</font>
<A href="Javascript:openProblemRating(4701)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br />
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
      34 / 309 (11.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      22 / 34 (64.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      <b>rem</b> for 665.27 points (22 mins 42 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      521.16 (for 22 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>At first glance, a board with 100 spaces and up to four players suggests a state space
of 100,000,000 possibilities, making it computationally impossible to simply look at every possible
state.  Instead, we need to consider each player individually.</p>

<p>We can calculate, for a given player, the possibility that they win the game after exactly
<i>n</i> moves, having started on space <i>i</i>, as the sum of the probabilites of rolling a given
value, multiplied by the chances of them finishing the game after exactly <i>n</i>-1 moves, starting
from space <i>j</i> (where <i>j</i> is the space they land on after making their move).  As we calculate
these values, we also keep track of the probability that the player has _not_ finished the game
after <i>n</i> moves.  Then, the probability of a player winning the game on his <i>n</i>-th move is
the probability that he finishes on that move, multiplied by the probabilities that each of his
opponents hasn't yet finished.  Iterate this, starting from <i>n</i> = 1, and sum the results, to determine
the overall probability of a player winning.</p>

<p>Notice the constraints in this problem are setup so that a board where a player can never win (e.g.
twelve consective chutes), or where the probability of getting to the finish is very very small, are
not allowed.  The worst case scenario allowed under the constraints is where there are the maximum possible
number of chutes, all going back to space 0, that alternate location.  e.g. chutes on spaces 98, 96, etc.
In this case, calculating out 10,000 moves for each player gives sufficient precision.</p>

<pre>
public class ChutesAndLadders {

int REPS = 12000;

public double[] winningChance(int[] start, int[] end, int[] players) {
  // Define probabilities of rolling 2, 3, ... , 12
  double[] p = new double[]{0, 0, 1.0/36, 2.0/36, 3.0/36, 4.0/36,
   5.0/36, 6.0/36, 5.0/36, 4.0/36, 3.0/36, 2.0/36, 1.0/36};
  // Where does each space "land"
  int[] dest = new int[100];
  // First assume no chute/ladder
  for (int i = 0; i &lt; 100; i++)
    dest[i] = i;
  // If there is a chute/ladder, assign it
  for (int i = 0; i &lt; start.length; i++)
    dest[start[i]] = end[i];
  // Keep track of the probability that a player will get to the end,
  // assuming they stated in space X, and have taken Y moves.
  double[][] win = new double[100][REPS];
  // Probabiliy that a player will NOT have won after Y moves.
  double[][] notWin = new double[100][REPS];
  for (int i = 0; i &lt; 99; i++) {
    win[i][0] = 0;
    notWin[i][0] = 1;
  }
  // On space 99, you've already gotten to the end
  win[99][0] = 1;
  notWin[99][1] = 0;
  
  double[] ret = new double[players.length];
  double eps = 1.0;
  
  // Calculate the probabilities of exiting the board after r moves, starting from space s
  for (int r = 1; r &lt; REPS; r++) {
    for (int s = 0; s &lt; 99; s++) {
      for (int d = 2; d &#8804; 12; d++)
        if (s + d &#8805; 99)
          win[s][r] += p[d] * win[99][r - 1];
        else
          win[s][r] += p[d] * win[dest[s + d]][r - 1];
      win[s][r] = Math.min(win[s][r], 1.0);
      notWin[s][r] = notWin[s][r - 1] - win[s][r];
    }
    for (int c = 0; c &lt; players.length; c++) {
      double pr = 1;
      for (int m = 0; m &lt; players.length; m++)
        if (m &gt; c)
          pr *= notWin[players[m]][r - 1];
        else if (m &lt; c)
          pr *= notWin[players[m]][r];
        else
          pr *= win[players[m]][r];
      ret[c] += pr;
      eps -= pr;
    }
  }

  return ret;
}

}
</pre>



                <p>
                <img src="/i/m/timmac_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=10407399"><strong>timmac</strong></a><br />
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
