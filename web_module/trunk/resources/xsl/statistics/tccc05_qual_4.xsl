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

<title>TCCC05 Qualification 4 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC05 Qualification Problem Set 4</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">January 11-12, 2005</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3506&amp;rd=6526" name="3506">ImageEnlarger</a></b> 
</font> 
<A href="Javascript:openProblemRating(3506)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br /> 
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
      139 / 161 (86.34%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      124 / 139 (89.21%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ruberik</b> for 248.21 points (1 mins 56 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      204.59 (for 124 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Unlike last year's problem dealing with bitmaps, this one was relatively simple.
Basically, you just need to make an array with <tt>factor</tt> times as many elements as
the input, and then fill in the characters.  If you notice that <tt>ret[i][j] ==
    input[i/factor][j/factor]</tt>, when using integer division, then the task of
generating the output becomes particularly simple.
<pre class="code">
for (int i = 0; i &lt; input.length*factor; i++)
    ret[i] = "";
    for (int j = 0; j &lt; input[0].length(); j++){
        ret[i] += input[i/factor].charAt(j/factor);
    }
}
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3504&amp;rd=6526" name="3504">Justify</a></b> 
</font> 
<A href="Javascript:openProblemRating(3504)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br /> 
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
      52 / 161 (32.30%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 52 (23.08%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>John Dethridge</b> for 741.01 points (14 mins 32 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500.87 (for 12 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This was probably the hardest problem of the qualification round.  It requires
the use of <a href="/index?t=features&amp;c=feat_040104">dynamic programming</a>.
The basic idea is that you want to figure out the optimal way to place the last
<tt>wordCount-k</tt> words for all <tt>k</tt>.  Once you know the optimal placement for
all <tt>k &gt; j+1</tt>, you can then calculate the optimal placement for 
<tt>j</tt>.  Here is the basic algorithm in pseudocode:
<pre class="code">
    <font color="blue">//Finds the optimal placement for the last wordCount-j words</font>
    findOptimalPlacement(int j){
        <font color="red">if(cache contains j){
            return cache[j]
        }</font>
        placement best = BAD_PLACEMENT;
        foreach (k &gt; j+1 and k &#8804; wordCount){
            <font color="blue">//Within this loop, we will consider each 
            //placement starting with word j at the beginning 
            //of a line, by trying to put words j 
            //through k-1 on a single line, and then 
            //recursively calling findOptimalPlacement to get
            //the placement for the words starting at k.</font>
            placement p = findOptimalPlacement(k)
            prepend a single line with words j through k-1 to p
            if(p is better than best){
                best = p
            }
        }
        <font color="red">cache[j] = best</font>
        return best
    }
</pre>
This method will calculate the optimal placement for every <tt>j</tt> by first
trying to place some words, starting at <tt>j</tt>, on a single line, and then
placing the rest of the words on subsequent lines.  The reason this words is
because there is an <i>optimal subproblem</i> that you can solve.  That is, once the first
<tt>N</tt> words have been placed, the best way to place the remaining words is
always the same, regardless of how you placed the first <tt>N</tt> words.  The
key to making the solution run within the 8 second time limit is to use
memoization (the red code) so that you only compute the solution to the 
subproblem once for each <tt>N</tt>.  If you were to omit the red code, you're
solution would still return the correct answer, but the resulting runtime would
not pass the constraints from the round 3 hard problem, as it would take over 1000
years for some inputs.
</p>

                        <p>
                        <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
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
