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

<title>TCCC05 Qualification 5 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC05 Qualification Problem Set 5</font></td>
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
The results for this set were close. Im2Good got the top score, but 16 other competitors had scores within 100 of his.
<br /><br />
The 250 was a simple simulation problem. The 1000 was a probability/dynamic programming problem. 
<br /><br />
Partially because of sample data on the 250 that omitted some cases, many
competitors ended up with a total score of 0 and a positive score was enough to qualify on this set .
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3507&amp;rd=6527" name="3507">TimeOfPossession</a></b>
</font>
<A href="Javascript:openProblemRating(3507)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
     145 / 172 (84.30%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     80 / 145 (55.17%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>robymus</b> for 239.51 points (4 mins 48 secs)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     172.90 (for 80 correct submissions)
   </td>
 </tr>
</table></blockquote>

<p>
The sample input for this problem didn't include cases in which B started with the ball, or in which a posession change other than a "SWITCH" happened during the game, which tripped some competitors up. Aside from lack of sample input for all cases, this problem is straightforward.
<br /> <br />
Because of the note about multiple events, we know that the events are given in
the order in which they happen. This means that we can go through the events in
order, keeping track of which team posesses the ball after each event, and add up the segments of time during which team A has the ball.
<br /> <br />
A simple way to represent times is in seconds since the game started, which can
be calculated from the clock time mm:ss as mm*60 + ss.  
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3510&amp;rd=6527" name="3510">NestedRandomness</a></b>
</font>
<A href="Javascript:openProblemRating(3510)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
     104 / 172 (60.47%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     64 / 104 (61.54%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>Im2Good</b> for 954.91 points (4 mins 59 secs)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     711.40 (for 64 correct submissions)
   </td>
 </tr>
</table></blockquote>

<p>
The chance of getting the result <tt>x</tt> on a single call to
<tt>randomInt(N)</tt> is <tt>1/N</tt> for <tt>x | 0 &#8804; x &lt; N</tt>, or 0 otherwise.
<br /><br />

Now consider nested calls. The result of a call depends on the result of earlier calls to randomInt. For example, if the first call to randomInt returns 5, then there is no chance of the second call returning 6. 
<br /><br />

On the <tt>n</tt>th call, the chance of the result being <tt>x</tt> depends on
the result, <tt>r</tt>, of the <tt>n-1</tt><sup>st</sup> call. If <tt>x &#8805;
    r</tt> then there is no chance of <tt>randomInt(r)</tt> returning
<tt>x</tt>. Otherwise the chance is <tt>1/r</tt>. This means that in order to
calculate the chance of getting <tt>x</tt> on the <tt>n</tt>th call to
<tt>randomInt</tt>, we need to sum the probability of getting <tt>x</tt> over
all possible return values, <tt>r</tt>, from the <tt>n-1</tt><sup>st</sup> call. 
<br /><br />

As a recurrence, <tt>C(n,x)</tt>, the chance of <tt>x</tt> being the result from
the <tt>n</tt><sup>th</sup> call to <tt>randomInt</tt>, can be expressed:
<br /><br />

<tt>C(n,x) = (sum from i = x+1 to n of C(n-1, i)/i)</tt>
<br /><br />

The table <tt>C</tt> can be built using dynamic programming: 
</p>
<pre class="code">
/* Initialize the table with the probabilities 
 * for the first call to randomInt */
for(int x = 0; x &lt; N; x++)
  chance[0][x] = 1.0/N;

/* Build the rest of the table using the recurrence for C */
for(int n = 1; n &lt; nestings; n++)
  for(int x = 0; x &lt; N; x++)
    for(int k = x+1; k &lt; N; k++)
      chance[n][x] += chance[n-1][k]/k;

/* Return the chance of the result being target */
return chance[nestings-1][target];
</pre>
<p>
The algorithm above is <tt>O(N*N*nestings)</tt>, which is small enough that it easily runs in 8 seconds for <tt>N = 1000</tt> and <tt>nestings = 10</tt>. It is possible, however, to write an algorithm that runs in <tt>O(N*nestings)</tt>. Notice that <tt>C(n,x) - C(n,x+1) = C(n-1, x+1)/(x+1)</tt>. This suggests the following replacement for the nested loops in our algorithm:
</p>
<pre class="code">
for(int n = 1; n &lt; nestings; n++)
  for(int x = N-n; x &gt;= 0; x--)
    chance[n][x] = chance[n][x+1] + chance[n-1][x+1]/(x+1);
</pre>




                        <p>
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=8587884"><strong>kaylin</strong></a><br />
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
