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

<title>Single Round Match 227 Statistics at TopCoder</title>

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
							 <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 227</font></td>
							 <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
						 </tr>

						 <tr valign="middle">
							 <td class="bodyText">Saturday, January 22, 2005</td>
							 <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
						 </tr>
					 </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
In Division 2, <b>Marto</b> and <b>valo_bg</b> took first and second, with <b>Dan [Popovici]</b> in a very close third. 
Partway through the match, three newbies held the top three spots, but that changed before too long.
<br /><br />
Nobody was terribly surprised in Division 1, when <b>tomek</b> took top honors. <b>marian</b> and <b>misof</b> were 
second and third, by good margins. <b>marian</b> deserves a lot of credit for a good fight, after working his 
way up to second with a dominating eight successful challenges. Also notably, <b>RalphFurmaniak</b> rung 
up six competitor's problems in the challenge round.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3532&amp;rd=6516" name="3532">StringCompare</a></b>
</font>
<A href="Javascript:openProblemRating(3532)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      232 / 236 (98.31%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      211 / 232 (90.95%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>supernova</b> for 249.35 points (1 mins 27 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      233.43 (for 211 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>This problem was very straightforward, and pretty much everyone used the same
basic approach to solving it.  Loop through the characters, starting at the 
beginning, until you get to the end of one or both strings (By using the min
function on the lengths of the strings), incrementing a counter value whenever
the characters were the same.</p>

<pre>
public int simpleDifference (String a, String b) {
	int ret = 0;
	for (int i = 0; i &lt; Math.min(a.length(), b.length()); i++)
		if (a.charAt(i) == b.charAt(i))
			ret++;
	return ret;
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3520&amp;rd=6516" name="3520">ClientsList</a></b>
</font>
<A href="Javascript:openProblemRating(3520)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      194 / 236 (82.20%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      159 / 194 (81.96%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>eoj</b> for 487.18 points (4 mins 37 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      353.26 (for 159 correct submissions)
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
      240 / 242 (99.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      229 / 240 (95.42%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>marian</b> for 248.24 points (2 mins 23 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      223.47 (for 229 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>This problem was again, pretty straightforward, as indicated by the fairly high
success rates.  However, it took a little more effort to work out a solution here.
Depending upon one's level of confidence and understanding of their standard libraries,
using a custom comparison method was certainly one option.  However, with a fairly
short list (no more than 50 total), one could afford to be very inefficient, and so
a less-than-elegant, but fast to code solution was equally successful.  This one passes
through the list once, putting everyone's names in "Last, First" format.  Then, it
uses the standard sort method on the array.  (In the "Last, First" format, this works
just fine!)  Finally, it puts everyone's names into the required "First Last" format.</p>

<pre>
public String[] dataCleanup(String[] names) {
	for (int i = 0; i &lt; names.length; i++) {
		if (names[i].indexOf(',') &gt; -1)
			names[i] = names[i].replaceAll(",", "");
		else {
			String[] s = names[i].split(" ");
			names[i] = s[1] + " " + s[0];
		};
	};
	Arrays.sort(names);
	for (int i = 0; i &lt; names.length; i++) {
		String[] s = names[i].split(" ");
		names[i] = s[1] + " " + s[0];
	};
	return names;
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3515&amp;rd=6516" name="3515">TreePlanting</a></b>
</font>
<A href="Javascript:openProblemRating(3515)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      94 / 236 (39.83%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      34 / 94 (36.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>valo_bg</b> for 945.04 points (6 mins 55 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      607.28 (for 34 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>Here, we need to get a little creative to come up with a workable solution.
Consider placing <i>f</i> fancy trees along a total of <i>n</i> locations, so that
no two are adjacent.  Call our function, C, the number of ways to do this.  At our
first location, we can either plant a fancy tree, or not plant a fancy tree.  If
we plant a fancy tree, then we can't plant a fancy tree in the second spot, and hence
will have <i>n</i>-2 locations in which to plant the remaining <i>f</i>-1 fancy trees.
If we don't plant a fancy tree in the first spot, then we have <i>n</i>-1 locations
in which to place all <i>f</i> fancy trees.  This gives us our recursive formula,
<i>C(n, f) = C(n - 2, f - 1) + C(n - 1, f)</i>.  Our starting values are of course,
<i>C</i>(1, 1) = 1, and <i>C</i>(0, 0) = 1.</p>

<p>However, with the problem constraints as they are, a simple recursive function
by itself is not sufficient.  We either need to implement memoization, whereby we
store the values of previous recursive calls, to avoid recalculating them repeatedly,
or we can use dynamic programming, as shown here:</p>

<pre>
public long countArrangements(int total, int fancy) {
	long[][] count = new long[total + 1][fancy + 1];
	count[0][0] = 1;
	count[1][1] = 1;
	for (int i = 0; i &lt; = total; i++) 
		for (int j = 0; j &lt; = fancy; j++) {
			if (i &gt; 0)
				count[i][j] += count[i - 1][j];
			if (i &gt; 1 &amp;&amp; j &gt; 0)
				count[i][j] += count[i - 2][j - 1];
		};
	return count[total][fancy];
}
</pre>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3518&amp;rd=6516" name="3518">TreeSpreading</a></b>
</font>
<A href="Javascript:openProblemRating(3518)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      178 / 242 (73.55%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      83 / 178 (46.63%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Per</b> for 488.70 points (4 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      375.10 (for 83 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>This problem was homologous to the division 2 hard problem, but with the twist that
there are now four different kinds of trees, none of which can be next to another of the
same variety.  So, unlike it's division 2 counterpart, the proper recursion (or more
typically, DP model) was not as obvious.  As an interesting side note, the presence
of four types of trees also makes the number of possible arrangements increase much
faster than with only two types of trees.  The constraints, of no more than ten of each
kind of tree, may seem low, but were actually in place to avoid overflowing a 64-bit
signed integer value.</p>

<p>What we need to keep track of programmatically as we solve this is the number of 
each kind of tree planted so far, and the type of the last tree that was planted.  This
way, we know what type of tree we cannot plant next.  A simple recursion with memoization
is plenty fast enough for this problem, but some might argue that a DP solution is a bit
cleaner.</p>

<pre>
public long countArrangements(int a, int b, int c, int d) {
  if (a == 0 &amp;&amp; b == 0 &amp;&amp; c == 0 &amp;&amp; d == 0)
    return 1;
  long[][][][][] count = new long[21][21][21][21][4];
  count[1][0][0][0][0] = 1;
  count[0][1][0][0][1] = 1;
  count[0][0][1][0][2] = 1;
  count[0][0][0][1][3] = 1;
  for (int w = 0; w &lt; = 20; w++)
    for (int x = 0; x &lt; = 20; x++)
      for (int y = 0; y &lt; = 20; y++)
        for (int z = 0; z &lt; = 20; z++) 
          for (int i = 0; i &lt; = 3; i++) {
            if (w &gt; 0 &amp;&amp; i != 0)
              count[w][x][y][z][0] += count[w - 1][x][y][z][i];
            if (x &gt; 0 &amp;&amp; i != 1)
              count[w][x][y][z][1] += count[w][x - 1][y][z][i];
            if (y &gt; 0 &amp;&amp; i != 2)
              count[w][x][y][z][2] += count[w][x][y - 1][z][i];
            if (z &gt; 0 &amp;&amp; i != 3)
              count[w][x][y][z][3] += count[w][x][y][z - 1][i];
          };
  return count[a][b][c][d][0] + count[a][b][c][d][1] + count[a][b][c][d][2] + count[a][b][c][d][3];
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3514&amp;rd=6516" name="3514">QuadrilateralSearch</a></b>
</font>
<A href="Javascript:openProblemRating(3514)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      83 / 242 (34.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      26 / 83 (31.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>misof</b> for 831.12 points (13 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      533.14 (for 26 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>This problem was intended to involve a lot of time thinking.  With lots of geometry, trig,
a pseudo-random generator function, and constraints large enough to make timeout a very
real problem, there was plenty to consider in formulating a solution.  As it turned out,
a few types of solutions actually worked for this.  The most typical method was to
determine the x and y coordinates of the red points, and use the Sum(xi * yj - xj * yi)
method of calculating the area of the polygon, and after brute-force choosing the first
three points, pick the best fourth point.  With a reasonably efficient code base, this
worked out.</p>

<p>The originally devised solution for this, although much less obvious at first, is to
brute force consider every pair of points as being a diagonal of the quadrilateral.  Then,
one can quickly find (by binary search) the "furthest away" points on each side of the
diagonal.  That is, the point closest to midway between the two points of the diagonal.
Why is this the largest?  I'll leave a formal proof as an exercise to the reader, but to
put it simply, the diagonal divides the quadrilateral into two triangles, and each triangle's
area is maximized when the third point is as far away from the diagonal as possible.</p>

<p>To calculate the area in a way other than the usual polynomial area function, one
has to take advantage of the fact that the quadrilateral is cyclic (inscribed in a circle).
The four points create four arcs, proportional to the difference in the indices of the two
points.  For instance, with <i>n</i> = 360, points 2 and 20 would be exactly 18 degrees apart.
Now, imagine lines drawn from the center of the circle to the four points.  This creates
four triangles, and the angles in the center are exactly the same as the degree measures
of the arc lengths.  The area of one of these triangles, where <i>t</i> is the angle in
the center of the circle is then given by
(<i>d</i>/2 * cos(<i>t</i>/2)) * (<i>d</i>/2 * sin(<i>t</i>/2)).  Remembering the double
angle formula for the sin function, this reduces to d^2 * sin(<i>t</i>) / 8.  If we first
cache the values of this for each possible <i>t</i> (of which there are at most 500
choose 2, or roughly 125,000), then this is fairly efficient.</p>

<p>As another interesting note, the above method of calculating area offers a proof
that the largest possible area of an inscribed quadrilateral is, in fact, a square.</p>

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
