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

<title>TCCC05 Qualification 2 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC05 Qualification Problem Set 2</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">January 11-12, 2005</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
This set was of the "Think. Think. Think. Type." variety rather than
the "Think. Type. Type. Type." variety.  Both problems were easy to
code once you figured out exactly what they were asking for.
Congratulations to newcomer <b>B_Carvalho</b> and veteran
<b>MikeMirzayanov</b> for blazing fast solutions to the easy and hard
problems, respectively.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3497&amp;rd=6524" name="3497">Hiking</a></b>
</font>
<A href="Javascript:openProblemRating(3497)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      154 / 171 (90.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      134 / 154 (87.01%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>B_Carvalho</b> for 247.53 points (2 mins 16 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      198.23 (for 134 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem arose out of a math puzzle in which you must show that,
given appropriate conditions, a man who walks up a hill one day and
down the hill the next day must at some point have been at exactly the
same place on the trail at exactly the same time of day both going up
and coming down.  The trick is to imagine that he is two people hiking
on the same day and to realize that the two hikers would inevitably
meet somewhere on the trail.
</p>

<p>
To code this, you first add up the total distance covered by one of
the hikers to find the height of the hill.  Then you iterate through
the two lists, looking for the point at which the cumulative combined 
distance traveled by the two hikers equals or surpasses the height of
the hill.  The main loop looks like
<pre>
    combined = 0;
    for (int i = 0; ; i++) {
      combined += alice[i] + bob[i];
      if (combined &gt; heightOfHill) return i;
      if (combined == heightOfHill) return i+1;
    }
</pre>
You don't need to worry about running off the end of one of the arrays 
because the hikers are guaranteed to meet by the time one of them finishes.
</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3492&amp;rd=6524" name="3492">Inversions</a></b>
</font>
<A href="Javascript:openProblemRating(3492)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      112 / 171 (65.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      40 / 112 (35.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kalinov</b> for 869.10 points (9 mins 6 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      596.83 (for 40 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
To make the lexicographically earliest permutation, you want to leave
the largest possible prefix unchanged.  Put another way, you want to
confine the changes to the smallest possible suffix.  A suffix of size
M has at most Choose(M,2) = M*(M-1)/2 inversions, with the maximum
occurring when the suffix is in reverse order.  When the desired
number of inversions is of the form M*(M-1)/2, then the permutation
consists of a prefix of consecutive numbers in increasing order,
followed by a suffix of consecutive numbers in decreasing order, as in
<pre>
    1 2 3 4 5 9 8 7 6
</pre>
</p>

<p>
The question is what happens when the number of inversions is not of
the form M*(M-1)/2.  Rounding up to the next higher value of M tells
us how many elements must be involved in the suffix, but the suffix
will no longer be in strictly decreasing order.  Consider the amount
by which M*(M-1)/2 exceeds the desired number of inversions.  This is
the number of inversions that we want to <i>remove</i> from the
strictly decreasing suffix, and we want to do so in the way that
brings the smallest possible value in the suffix to the front of the
suffix.
Suppose the suffix was <tt>9 8 7 6 5 4</tt>.  If we bring the 8 to the
front but leave the rest in decreasing order (<tt>8 9 7 6 5 4</tt>),
then we have removed one inversion.  Similarly, if we bring the 7 to
the front but leave the rest in decreasing order (<tt>7 9 8 6 5
4</tt>), then we have removed two inversions.  In general, if we want
to remove K inversions from the suffix, then we move element N-K to
the front of the suffix and leave the rest in decreasing order.
Altogether, the final permutation looks like
<pre>
    1...(N-M) (N-K) N...(N-K+1) (N-K-1)...(N-M+1)
</pre>
where M is the smallest integer such that M*(M-1)/2 is greater than or
equal to the desired number of inversions, and K is M*(M-1)/2 minus
the desired number of inversions.
</p>

                        <p>
                        <img src="/i/m/vorthys_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=299177"><strong>vorthys</strong></a><br />
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
