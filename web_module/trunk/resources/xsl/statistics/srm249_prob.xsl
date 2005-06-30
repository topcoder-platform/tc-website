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

<title>Single Round Match 249 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 249</font></td>
                     <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Wednesday, June 29, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
An amazingly difficult Division 1 Easy/Division 2 Hard gave this SRM an unusual flavor.
Less than one-third of Div 1 received credit for the problem.  Not a single Div 2
submission passed system tests.
Despite the round's oddities, <b>natori</b> and <b>jdmetz</b> took the top 2 spots with first rate
performances.  In Division 2, <b>sempiq</b> won by a comfortable margin.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4613&amp;rd=7224" name="4613">ChatTranscript</a></b>
</font>
<A href="Javascript:openProblemRating(4613)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      231 / 246 (93.90%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      169 / 231 (73.16%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Sleeve</b> for 249.51 points (1 mins 16 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      231.28 (for 169 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem is easily solved using the available string processing routines.  Java code follows:
<pre>
public int howMany(String[] transcript, String name) {
    int ret = 0;
    for (int i = 0; i &lt; transcript.length; i++) 
	if (transcript[i].startsWith(name+":")) ret++;
    return ret;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4615&amp;rd=7224" name="4615">FieldPairParse</a></b>
</font>
<A href="Javascript:openProblemRating(4615)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      142 / 246 (57.72%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      119 / 142 (83.80%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>sempiq</b> for 459.22 points (8 mins 37 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      303.66 (for 119 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
In this problem, we loop through each column checking whether it is entirely blank or not.
When a blank column is found, we count the adjacent blank columns, and store this value in an
array.  When this loop is done, the array contains all necessary information.  The
constraints eliminate the potentially tricky cases where delimiters occur on the ends.  Java code follows:
<pre>
public int[] getPairs(String[] data) {
    ArrayList&lt;Integer&gt; al = new ArrayList();
    int cnt = 0;
    for (int c = 0; c &lt; data[0].length(); c++) {
	boolean allSpaces = true;
	for (int r = 0; r &lt; data.length; r++) 
		if (data[r].charAt(c) != ' ') allSpaces = false;
	if (!allSpaces &amp;&amp; cnt &gt; 0) {
		al.add(cnt); 
		cnt = 0;
	}
	if (allSpaces) cnt++;
    }
    int[] ret = new int[al.size()];
    for (int i = 0; i &lt; ret.length; i++) ret[i] = al.get(i);
    return ret.length % 2 == 0 ? new int[0] : ret;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4616&amp;rd=7224" name="4616">TableSeating</a></b>
</font>
<A href="Javascript:openProblemRating(4616)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      6 / 246 (2.44%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 6 (0.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>null</b> for null points (NONE)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      No correct submissions
    </td>
  </tr>
</table></blockquote>


Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      350
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      102 / 233 (43.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      73 / 102 (71.57%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>venco</b> for 253.32 points (19 mins 9 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      195.76 (for 73 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem asks for the <i>expected</i> number of seats filled.  An expectation is computed by
summing Prob{e}*Value(e) over all possible events e.  Prob{e} is the probability that event e will
occur.  Value(e) is the value we associate with event e.  Following the above explanation, we must
consider all possible seating arrangements, counting how many tables are used in each.  <br/>
<br/>
Our recursive solution will take the current seating arrangement as a parameter (perhaps
in a bitmask), and return the expected number of tables used.  For each possible group size, we must
consider all ways of seating them, and then recursively call our function with the new
configuration. For example, suppose there was an empty restaurant with 10 tables, and a group
requiring 2 tables enters.  Each way of seating them occurs with probability 1/9 (on top of whatever
probability is associated with a group arriving that requires 2 tables).  One possible way is
drawn below (T for empty table, U for used table):
<pre>
	T   T   T   U   U   T   T   T   T   T
</pre>
Our function can now be called recursively with this seating configuration.  Combining the
expectations associated with each possible seating (accounting for their respective probabilities), 
we can compute the total expectation. Sadly, the method described here is too slow to work.  Fortunately, we can
quickly fix it by caching the expectation associated with each seating configuration. <br/>
<br/>
More information on probability can be found in the following TopCoder tutorial: 
<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=probabilities">Understanding
Probabilities</a>. Information about expected values and the linearity of expectation can be found in any
text on probability and statistics, and many texts on algorithms.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4614&amp;rd=7224" name="4614">ChatExit</a></b>
</font>
<A href="Javascript:openProblemRating(4614)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      105 / 233 (45.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      52 / 105 (49.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jdmetz</b> for 455.96 points (9 mins 0 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      326.94 (for 52 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Problems like this are always a little funny.  Tricky to solve yet easy to code.  The algorithm
described here 
simulates the chat with the provision that lower numbered people should leave as early as possible.
Our simulation is made easier by the fact that message order is irrelevant between user exits.  This
gives rise to the following pseudcode: 
<pre>
    For 1 .. (number of people)
        1) Allow everyone who can write a message do so (see below).
	2) Let the lowest numbered person that can leave do so.  
	   If no person can exit, return invalid.
</pre>
Now we explain who <i>can</i> write a message.  If everyone in the chat room needs to see a
particular person write a message, then that person is allowed to do so.  Otherwise, writing a message
would cause someone to see too many messages.  This process is repeated until noone can write.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3996&amp;rd=7224" name="3996">CultureGrowth</a></b>
</font>
<A href="Javascript:openProblemRating(3996)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      850
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      65 / 233 (27.90%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      21 / 65 (32.31%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jdmetz</b> for 818.21 points (5 mins 38 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
-    </td>
    <td class="bodyText" style="background: #eee;">
      658.62 (for 21 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Abstracting away the unnecessary details of the problem, we have a set of points and a method for
generating new points.  We can immediately throw out the cases with 1 point, or where the initial points are
colinear, since the resulting figure will have 0 area.  Otherwise, we have at least 3 non-colinear
points.  Making justified assumptions about how the organisms reproduce, we end up with a figure
that has positive area (we either assume that the organisms each have some very small positive area, or that
a particular organism could have been created after an infinite number of reproductions).  This
figure is precisely the convex hull of the original set of points.  Finally, we return the area of
this hull.  The reader is directed toward the following TopCoder tutorials on geometry:
<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=geometry2#convexhull">Convex
Hull</a> and <a
href="/tc?module=Static&amp;d1=tutorials&amp;d2=geometry1#polygon_area">Polygon Area</a>.
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
