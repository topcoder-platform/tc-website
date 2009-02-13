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

<title>TCO05 Online Round 1 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCO05 Online Round 1 Problem Set</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">August 20, 2005</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
The first round of the TCO was as exciting as could be expected.  Give or take a tricky case on the
easy, most coders zoomed through the first two problems.  The hard problem, which was difficult
enough to appear in an onsite round, gave the reds plenty of trouble.  The 11 correct submissions
are a testament to how strong our current batch of competitors are.  An early wave of solutions
filled the leader board with high scores, but none would pass systests.  Correct solutions came much
later, either as resubmits or late submissions.  ivan_metelsky and elizarov took the top two places,
followed closely by Polish coders tomek and malcin.  malcin, who has competed in only a single SRM,
is definitely someone to keep an eye on.  If this round's hard problem was any indication of
the later rounds, we have a great competition ahead of us.  Good luck to everyone!
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4630&amp;rd=8019" name="4630">RectangleError</a></b>
</font>
<A href="Javascript:openProblemRating(4630)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />

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
      609 / 661 (92.13%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      469 / 609 (77.01%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>mathijs</b> for 246.26 points (3 mins 30 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      194.28 (for 469 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Each length we must find is the hypotenuse of a triangle.  To make the longest possible hypotenuse
we use the maximum top length.  Then, we try to make the left and right edges finish as far apart as
possible.  To make the shortest possible hypotenuse we use the minimum top length.  Handling 
the left and right sides is a bit more difficult.  If the ranges for the left and right ends overlap we get a
degenerate triangle with a height of 0.  Otherwise, we take the mininum of the absolute values of the
following differences: rightMin-leftMax, leftMin-rightMax.  Java code follows: <pre>

boolean r(double v, double m, double M) { return v &#8805; m &amp;&amp; v &#8804; M; }
public double bottomRange(double topMin, double topMax, 
                          double leftMin, double leftMax, 
           double rightMin, double rightMax) {
   double M = 0, m = 0;
   if (r(rightMin,leftMin,leftMax) || r(rightMax,leftMin,leftMax) ||
       r(leftMin,rightMin,rightMax) || r(leftMax,rightMin,rightMax) ) {
      m = topMin;
   } else {
      double x = min(abs(leftMin-rightMax),abs(leftMax-rightMin));
      m = sqrt(x*x + topMin*topMin);
   }
   double y = max(abs(leftMax-rightMin),abs(leftMin-rightMax));
   M = sqrt(y*y+topMax*topMax);
   return abs(M - m);
}   
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4629&amp;rd=8019" name="4629">FibonacciSum</a></b>
</font>
<A href="Javascript:openProblemRating(4629)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      606 / 661 (91.68%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      510 / 606 (84.16%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      <b>Cosmin.ro</b> for 496.73 points (2 mins 18 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      409.72 (for 510 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Most coders solved this problem using dynamic programming.  First construct an array containing all
of the Fibonacci numbers.  Then iteratively build another array whose ith element stores the minimum number of
Fibonacci numbers that sum to i.  Interestingly, a greedy approach works.  The largest Fibonacci
number that doesn't exceed k can always be used in the sum.  The proof, which is left to the reader, 
will probably turn up in the round tables.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4715&amp;rd=8019" name="4715">VariableSolve</a></b>
</font>
<A href="Javascript:openProblemRating(4715)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division One - Level Three: <blockquote><table cellspacing="2">

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
      75 / 661 (11.35%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      11 / 75 (14.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      <b>elizarov</b> for 533.25 points (39 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      428.16 (for 11 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The problem guaranteed that no variable would have degree higher than 2.  This allows us to focus on
solutions to linear and quadratic equations with integer coefficients.  As the first step, we
enumerate all possible solutions to these equations that could result from an input of 50
characters.  These values are stored in a set as doubles.  For each such value, and each letter that
occurs in the input, we plug in, and then use algebra to reduce the resulting equation.  
If the equation reduces to 0 = 0 we know we have found a solution.  If more than 2 solutions are
found for a given variable, we know there are an infinite number of solutions.
</p>

                        <p>
                        <img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=251317"><strong>brett1479</strong></a><br />
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
