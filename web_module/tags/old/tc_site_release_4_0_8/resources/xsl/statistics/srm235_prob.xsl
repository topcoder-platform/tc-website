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

<title>Single Round Match 235 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 235</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Tuesday, March 22, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>One hundred years ago, Albert Einstein published groundbreaking papers on Brownian motion, the photoelectric effect, and special relativity. Any one of these works alone would have been worthy of a Nobel prize, but Einstein managed to polish off all three in the span of about five months. He probably would have made a pretty good TopCoder. In commemoration of the centennial of Einstein's <i>Annus Mirabilis</i>, the United Nations has declared 2005 to be the <a href="http://www.wyp2005.org/internationalyear.html">International Year of Physics</a>, and I decided to celebrate by creating a physics-themed problem set for SRM 235.</p>

<p>As prolific as Einstein was, he would have needed to solve all three problems in under thirty-six minutes in order to beat <b>tomek</b> in this match. <b>ploh</b>, <b>Dazu</b>, and <b>rgrig</b> had the next three highest scores after the coding phase, but their solutions to the hard problem turned out to be flawed. When the dust settled from the challenge phase and system tests, <b>tomek</b>, <b>venco</b>, and <b>dgarthur</b> were the only coders to successfully solve all three problems. However, <b>m00tz</b> narrowly edged <b>dgarthur</b> for third place despite getting the easy problem wrong by racking up four successful challenges with four attempts.</p>

<p>In Division 2, newcomer <b>Petr</b> dominated the division by being the only one to solve all three problems and picking up two successful challenges as well. <b>symbad</b>, another newcomer, only solved one problem but racked up an impressive seven successful challenges to finish fifth. In all, 31 coders advanced to Division 1.</p>

<p>For all problems, the writer's solution is available in the practice rooms.</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4019&amp;rd=6534" name="4019">NoisySensor</a></b>
</font>
<A href="Javascript:openProblemRating(4019)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      256 / 289 (88.58%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      173 / 256 (67.58%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gdiitk</b> for 248.87 points (1 mins 55 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      200.57 (for 173 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Median filtering is a staple data analysis and noise reduction tool, and can probably be found in your favorite image editing software. In most applications, the filtering will take place on data with two or more dimensions using a variable window size. This problem asked you to implement a basic one-dimensional median filter with a window size of three. A straightforward solution was to make a copy of the input array and loop from the second element to the second last element, finding the median of the previous, current, and next element from the input array and storing it in the corresponding element of the output array. A quick and lazy way to find the median of three numbers is to put them in an array, sort them, and take the middle element. If you were implementing a general median filter with a potentially large window size on multidimensional data, you would probably want to use a <a href="http://en.wikipedia.org/wiki/Selection_algorithm#Linear_general_selection_algorithms">linear time selection algorithm</a> instead of sorting.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4427&amp;rd=6534" name="4427">StepperMotor</a></b>
</font>
<A href="Javascript:openProblemRating(4427)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      120 / 289 (41.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      7 / 120 (5.83%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 430.94 points (11 mins 46 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      285.17 (for 7 correct submissions)
    </td>
  </tr>
</table></blockquote>


Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      300
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      202 / 220 (91.82%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      75 / 202 (37.13%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 290.41 points (5 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      213.51 (for 75 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem was so tricky, even I got it wrong. The maxed-out size of the bounds on the input rules out an approach based on iteratively adding or subtracting n from the current position, so modular arithmetic is clearly in order. The first step in determining the number of steps necessary to reach a given target from the current position to find their values modulo <i>n</i>. However, <i>a</i>&#160;%&#160;<i>b</i> doesn't quite compute <i>a</i>&#160;modulo&#160;<i>b</i> if <i>a</i> is negative. The correct modulus function, which is worth remembering, is (<i>a</i>&#160;%&#160;<i>b</i>&#160;+&#160;<i>n</i>)&#160;%&#160;<i>n</i>. In this problem, it was necessary to use long integers to avoid overflowing during the addition. Once the position and target modulo <i>n</i> are known, finding the shortest distance is a matter of trying both directions, carefully keeping track of sign and avoiding overflow, and handling the special case where one or more targets were equidistant in either direction from the current position.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4020&amp;rd=6534" name="4020">AcademicJournal</a></b>
</font>
<A href="Javascript:openProblemRating(4020)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      23 / 289 (7.96%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      4 / 23 (17.39%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 552.13 points (31 mins 37 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      489.24 (for 4 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem rewarded knowledge of standard libraries and utility functions. In particular, it was necessary to create a mapping from strings (the journal names) to journal objects (which keep track of the number of papers and citations for a single journal), and to sort a list of journal objects. One initial pass through the input should be used to build tables that map names to journal objects and paper indices to journal objects, and a second pass to count the citations to each journal. Finally, the journal objects could be placed in order by writing a comparison function that properly implements the tiebreaking rules, and then sorting using that comparison function. Note that it is possible to compare the impact factors using only exact integer arithmetic: <i>citeCount1</i>&#160;/&#160;<i>paperCount1</i>&#160;&lt;&#160;<i>citeCount2</i>&#160;/&#160;<i>paperCount2</i> if and only if <i>citeCount1</i>&#160;*&#160;<i>paperCount2</i>&#160;&lt;&#160;<i>citeCount2</i>&#160;*&#160;<i>paperCount1</i> since the <i>paperCount</i>s must be positive.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4436&amp;rd=6534" name="4436">PerforatedSheet</a></b>
</font>
<A href="Javascript:openProblemRating(4436)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      400
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      122 / 220 (55.45%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      69 / 122 (56.56%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 383.46 points (5 mins 57 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      244.55 (for 69 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The bounds on the sheet dimensions are too large to process the sheet one square unit at a time. The key realization is that the center of mass definition implies that holes can be treated as uniform rectangular objects with "negative mass". In other words, summing the weighted positions of just the points in the perforated sheet is equivalent to summing the weighted positions of all points in the original sheet and subtracting the weighted positions of the points removed by the hole punch. The main complication here is floating point error: subtracting two large floating point numbers that are almost (relative to their magnitude) equal can yield a very small number with a large error. Dividing by this number produces disastrously incorrect results. This is exactly the case when a large sheet has large holes punched out of it such that only a tiny rectangle remains. For this problem, both the total mass and the weighted sum of the rectangle center positions (multiplied by two) could be computed exactly using 64-bit integers, allowing the floating point error to be minimized by postponing the conversion and division until the very last step.</p>

<p>
This problem originally allowed holes to overlap, which would have made the problem more challenging. The writer solution actually solves this version of the problem using a plane-sweep (also known as coordinate compression and scanning) approach.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4022&amp;rd=6534" name="4022">RemoteRover</a></b>
</font>
<A href="Javascript:openProblemRating(4022)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      24 / 220 (10.91%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      7 / 24 (29.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>m00tz</b> for 694.12 points (16 mins 31 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      598.64 (for 7 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Numerical optimization is an eminently useful procedure, and highlights one way in which computational power has revolutionized physics. 
Generic search techniques such as gradient descent are well-suited to this problem because there aren't multiple local minima to get stuck 
in. <b>m00tz</b> was the only coder to successfully implement this approach. Unlike many difficult optimization problems encountered in 
physics, this one can be rigorously solved using calculus. Fix a coordinate system to the terrain such that the <i>n</i> strips are parallel to 
the x-axis, the rover starts at (0,0), and the target lies at (<i>offset</i>,&#160;<i>totalwidth</i>) where <i>totalwidth</i> is the sum of all strip 
widths. Let <i>x</i>[<i>i</i>] be the x-coordinate of the rover's position just before it enters strip <i>i</i>. The total time necessary to reach 
the target is the sum with <i>i</i> = 0 to <i>n</i>-1 of sqrt((<i>x</i>[<i>i</i>+1]&#160;-&#160;<i>x</i>[<i>i</i>])<sup>2</sup>&#160;+&#160;<i>width</i>[<i>i</i>]<sup>2</sup>)/<i>speed</i>[<i>i</i>], 
and the problem can be formulated as minimizing this total time as a function of the variables <i>x</i>[<i>i</i>] for <i>i</i> = 1 to <i>n</i>-1, 
with <i>x</i>[0] fixed at 0 and <i>x</i>[<i>n</i>] fixed at <i>offset</i>. The critical points of the time function occur where the partial derivatives 
of the function with respect to each of the variables are all zero. The partial derivative of the time function with respect to <i>x</i>[<i>j</i>] is 
(<i>x</i>[<i>j</i>]&#160;-&#160;<i>x</i>[<i>j</i>-1])/sqrt((<i>x</i>[<i>j</i>]&#160;-&#160;<i>x</i>[<i>j</i>-1])<sup>2</sup>&#160;+&#160;<i>width</i>[<i>j</i>-1]<sup>2</sup>)/<i>speed</i>[<i>j</i>-1]&#160;-&#160;(<i>x</i>[<i>j</i>+1]&#160;-&#160;<i>x</i>[<i>j</i>])/sqrt((<i>x</i>[<i>j</i>+1]&#160;-&#160;<i>x</i>[<i>j</i>])<sup>2</sup>&#160;+&#160;<i>width</i>[<i>j</i>]<sup>2</sup>)/<i>speed</i>[<i>j</i>]. Doing this for all of the <i>x</i>[<i>j</i>] and setting the derivatives to zero results in a chain of equations that relates <i>x</i>[1] to <i>offset</i>. Now, the terms in these equations look suspiciously trigonometric; in fact, they can be written as 1/<i>speed</i>[<i>j</i>-1]&#160;*&#160;sin(<i>theta</i>[<i>j</i>-1])&#160;=&#160;1/<i>speed</i>[<i>j</i>]&#160;*&#160;sin(<i>theta</i>[<i>j</i>]), where <i>theta</i>[<i>j</i>] is the angle between the y-direction and the line connecting points with x-coordinates <i>x</i>[<i>j</i>-1] and <i>x</i>[<i>j</i>] on opposite edges of strip <i>j</i>-1. This chain of equations takes any value of <i>theta</i>[0] and produces an optimal path to a point on the edge of the final strip. Since the optimal path will never go in the negative x-direction, the x-coordinate of this final point is a monotonically increasing function of <i>theta</i>[0] (for <i>theta</i>[0] = 0 to Pi/2). This calls for a binary search on <i>theta</i>[0] to find the exact value that makes the final x-coordinate value equal to <i>offset</i>. The only thing that remains to be done is to calculate the minimal time from the final values of <i>theta</i>.</p>

<p>Coders who have studied physics will recognize the above equation as Snell's law, which describes the refraction of a light ray across an interface between materials with different light propagation speeds. It is possible to derive Snell's law directly from Maxwell's equations without assuming that light always takes the path of minimum time. How is it that light rays just happen to be so clever? If this kind of question is interesting to you, you should study physics!
</p>

 

                <p>
                <img src="/i/m/the_one_smiley_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=156485"><strong>the_one_smiley</strong></a><br />
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
