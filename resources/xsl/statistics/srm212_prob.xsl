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

<title>Single Round Match 212 Statistics at TopCoder</title>

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
							 <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 212</font></td>
							 <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
						 </tr>

						 <tr valign="middle">
							 <td class="bodyText">Saturday, September 25, 2004</td>
							 <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
						 </tr>
					 </table>
<!--end contextual links-->



<h2>Match summary</h2>



<p>
SRM 212 was a bit easier than average, giving coders still
in the TopCoder Open a nice break before Round 4, and giving
coders eliminated from the TCO a chance to build their confidence
back up.  The most interesting difficulty raised by this problem
set was not in the 1000-point problems, but rather a tricky
precision issue in the Division I easy and Division II medium
problem.
</p>
<p>
<b>Eryx</b> finished in the lead for Division I, after jumping from
third to first place with one of the few successful challenges in
the match.  <b>jshute</b>, with the fastest time on the Division I
hard problem, came in second, and <b>ploh</b> finished third.  Two
yellow coders, <b>dmks</b> and <b>riveria</b>, came in fourth and
fifth -- I expect they will soon be joining the ranks of the red
coders.
</p>
<p>
In Division II, newcomer <b>zahni</b> took the top spot with the
fastest time on the 1000-point problem and one successful challenge.
He beat out second-place finisher <b>zartheenumerato</b> by almost
250 points.  Rounding out the top 5 were coders <b>HiltonLange</b>,
<b>pingus</b>, and <b>tilps_kilm</b>.
</p>


<p>
<H1>

The Problems

</H1>

</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=1692&amp;rd=5858"
name="1692">YahtzeeScore</a></b>

</font>

<A href="Javascript:openProblemRating(1692)"><img hspace="10"
border="0" height=

"18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division Two - Level One: <blockquote><table
cellspacing="2">

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

       255 / 265 (96.23%)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>Success Rate</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       237 / 255 (92.94%)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>High Score</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       <b>Sabur</b> for 249.94 points (0 mins 25 secs)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>Average Score</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       232.44 (for 237 correct submissions)

     </td>

   </tr>

</table></blockquote>



<p>
To solve this problem, you must choose which die value yields
the highest score, and then count the number of dice with that value in order to calculate that score.  Since there are only 6
possible values, it is feasible to loop over all 6 values, and calculate the score for each.  To calculate the score for a given
value, you simply count the number of elements in the input equal to that value, and multiply the number by the value.  In C++:
</p>

<blockquote>
<pre>
int maxPoints(vector&lt;int&gt; toss) {
     int max = 0;
     for (int i=1; i&lt;=6; i++) {
         int score = 0;
         for (int j=0; j&lt;5; j++)
             if (toss[j] == i)
                 score += i;
         if (score &gt; max)
             max = score;
     }
     return max;
}
</pre>
</blockquote>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=3003&amp;rd=5858"
name="3003">WinningRecord</a></b>

</font>

<A href="Javascript:openProblemRating(3003)"><img hspace="10"
border="0" height=

"18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division Two - Level Two: <blockquote><table
cellspacing="2">

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

       221 / 265 (83.40%)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>Success Rate</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       125 / 221 (56.56%)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>High Score</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       <b>zartheenumerato</b> for 476.67 points (6 mins 20 secs)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>Average Score</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       345.87 (for 125 correct submissions)

     </td>

   </tr>

</table></blockquote>





Used as: Division One - Level One: <blockquote><table
cellspacing="2">

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

       187 / 192 (97.40%)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>Success Rate</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       147 / 187 (78.61%)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>High Score</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       <b>antimatter</b> for 246.51 points (3 mins 23 secs)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>Average Score</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       210.41 (for 147 correct submissions)

     </td>

   </tr>

</table></blockquote>



<p>
The concept behind solving this problem was simple: loop from
3 to N, calculate the fraction of winning games, keep track of
the highest and lowest, and break ties by preferring a fraction
with a larger denominator over an equal fraction with a smaller
denominator.  It was this tiebreaking policy that gave people
trouble, with only a 57% success rate in Division II and a 79%
success rate in Division I.
</p>
<p>
The main reason for failures was the use of floating-point
arithmetic.  It is important to understand that a computer's
representation of floating-point numbers is not exact, and
arithmetic on floating-point numbers is only approximate.
For example, if you write the line of code "a = 1.0 / 3.0",
the variable "a" will not hold exactly one third, but rather
the closest representable floating-point number to that value.
</p>
<p>
One should be very careful about writing code that tests for
equality of floating-point values, such as:
</p>
<blockquote>
<pre>
     double a = 2.0 / 7.0;
     double b = 14.0 / 49.0;
     if (a == b) {
         ...
     }
</pre>
</blockquote>
<p>
Now it turns out that the code above will behave as expected,
and the problem that caught many coders off guard was more
subtle than that.  It turns out than on some modern processors,
floating-point arithmetic is done in 80 bits of precision as
long as the values stay in registers.  But once they are spilled
to memory, they are reduced to 64 bits.  So, depending on the
code the compiler creates for your method, you may end up comparing
a 64-bit and 80-bit version of the same number, which is likely
to fail, producing unexpected results.  Some coders reported
that simply adding a printf() statement changed how their solution
behaved, most likely because this affected when registers
were being spilled to memory, forcing a 80-bit to 64-bit conversion.
See the round tables for a continued discussion of floating-point
precision on modern processors.
</p>
<p>
Java appears to be immune to such issues, as the vast majority
of the failing solutions were written in C++.
</p>
<p>
By now you may be wondering if this problem was fair.  Why should
we have to understand obscure compiler-dependent precision issues
to successfully solve this problem?  The answer is: you don't.
Good programmers should develop a healthy fear of floating-point
arithmetic, or at least an understanding of the pitfalls associated
with it.  Your first reaction to a problem that appears to require
floating-point arithmetic should be "Can I solve this any other way?"
In this case, you can.
</p>
<p>
Rather than storing floating-point versions of the best and worst
willing records found so far, you can store the integer numerator
and denominator of each of the two fractions.  When comparing two fractions,
rather than dividing like this:
</p>

<blockquote>
<pre>
     if (double(a)/b &gt;= double(c)/d) {
         ...
     }
</pre>
</blockquote>

<p>
you can do an equivalent comparison by cross multiplying, like this:
</p>

<blockquote>
<pre>
     if (a*d &gt;= c*b) {
         ...
     }
</pre>
</blockquote>

<p>
The significant difference here is, of course, the absence of
floating-point arithmetic.
For a good example of a complete solution using this method, see
<b>ploh</b>'s solution (Division I, 250-point problem).
</p>

<p>
The lesson to be learned here is to avoid precision problems by
using integer arithmetic whenever possible.
A well-written problem will allow for some slight error if
you are expected to use floating-point arithmetic in your solution.
If you don't see a statement to that effect, that is a good sign
that there probably exists an integer-only solution.
This isn't the first
TopCoder problem in which the unnecessary use of floating-point
arithmetic can get you in to trouble, and I guarantee it won't
be the last.
</p>


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=3005&amp;rd=5858"
name="3005">LargestCircle</a></b>

</font>

<A href="Javascript:openProblemRating(3005)"><img hspace="10"
border="0" height=

"18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division Two - Level Three: <blockquote><table
cellspacing="2">

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

       52 / 265 (19.62%)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>Success Rate</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       16 / 52 (30.77%)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>High Score</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       <b>zahni</b> for 786.42 points (15 mins 43 secs)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>Average Score</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       515.57 (for 16 correct submissions)

     </td>

   </tr>

</table></blockquote>



<p>
This problem boils down to finding which grid squares a circle
passes through.  We just need to find the circle with the largest
radius that does not pass through any of the marked squares, and
return the radius of that circle.  The simplest solution uses 5
nested loops:
</p>

<blockquote>
<pre>
   for each radius
     for each center x coordinate
       for each center y coordinate
         for each x in the grid
           for each y in the grid
             test if circle passes through this square
</pre>
</blockquote>

<p>
The largest possible radius is the minimum of half the width and
half the height of the grid (rounding down).  If we start the loop
at the largest possible radius and work down to 1, then the program
can just return the radius as soon as it finds any circle that fits.
The range of x coordinates is [radius, width-radius], and similarly
the range of y coordinates is [radius, height-radius].  The 5 loops
above become:
</p>

<blockquote>
<pre>
   for radius = MIN(width/2, height/2) to 1
     for cx = radius to (width-radius)
       for cy = radius to (height-radius)
         for x = 0 to (width-1)
           for y = 0 to (width-1)
             test if circle passes through this square
</pre>
</blockquote>

<p>
Now, one easy way to test if the circle passes through a given square
is to compute the distance from the center of the circle to each of the
4 corners.  If all 4 distances are less than or equal to the radius,
then the square is inside the circle.  If all 4 distances are greater
than or equal to the radius, then the square is outside of the circle.
Otherwise, the circle passes through the square.
</p>

<p>
If you wish to follow the advice I given for the problem WinningRecord,
and avoid floating point, you can do so.  Rather than compute the
distances to the four corners of the square, compute the distance squared
(which is an integer), and compare that to the square of the radius.
</p>

<p>
For an implementation of this algorithm see <b>zahni</b>'s solution, or
the <b>writer</b>'s solution in the practice room.
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=2943&amp;rd=5858"
name="2943">SumOfSquareRoots</a></b>

</font>

<A href="Javascript:openProblemRating(2943)"><img hspace="10"
border="0" height=

"18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division One - Level Two: <blockquote><table
cellspacing="2">

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

       161 / 192 (83.85%)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>Success Rate</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       147 / 161 (91.30%)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>High Score</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       <b>antimatter</b> for 488.76 points (4 mins 19 secs)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>Average Score</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       363.14 (for 147 correct submissions)

     </td>

   </tr>

</table></blockquote>



<p>
A sum of square roots can be simplified by factoring out all
perfect squares, collecting terms, and then squaring the integer
coefficients to put them back underneath the square root sign.
I expected this problem to give people more trouble than it did,
and for coders to get hung up on trying to prove that this really
does result in the shortest list of integers that yeild the same
result when their square roots are summed.  Either people generalized
the example given in the problem statement, guessing (correctly) that
it would always give the correct result, or TopCoder members know
much more number theory than I anticipated.
</p>
<p>
<b>jms137</b> coded a particularly concise solution to this problem.
</p>


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=2944&amp;rd=5858"
name="2944">Arcs</a></b>

</font>

<A href="Javascript:openProblemRating(2944)"><img hspace="10"
border="0" height=

"18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division One - Level Three: <blockquote><table
cellspacing="2">

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

       22 / 192 (11.46%)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>Success Rate</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       14 / 22 (63.64%)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>High Score</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       <b>jshute</b> for 542.47 points (32 mins 35 secs)

     </td>

   </tr>

   <tr>

     <td class="bodyText" style="background: #eee;">

       <b>Average Score</b>

     </td>

     <td class="bodyText" style="background: #eee;">

       461.66 (for 14 correct submissions)

     </td>

   </tr>

</table></blockquote>



<p>
This problem can be solved with a simple breadth-first search.
The nodes are coordinate pairs on the grid, and the edges are arcs
between nodes that do not intersect blocked squares.  All edges
have a weight of 1.  The interesting part of this problem is
determining the legal edges.
</p>

<p>
There can only be an arc between two points if they are
connected by a 45-degree line.  And if so, there are two
potential arcs between those two points.  If either of those
arcs passes through only unblocked squares, then there exists
an edge between the points.
</p>

<p>
One way to determine which squares are intersected by a given
arc is to simply test each square in the bounding box of the
arc.  This part is the same as the core of LargestCircle, the
Division II 1000-point problem.  For each square, compute the
distance from the center of the circular arc to the 4 corners
of the square.  If all four distances are less than or equal
to the radius if the arc, or all four distances are greater than
or equal to the radius of the arc, then the arc does not
intersect that square.  Otherwise, the arc does intersect the
square, and if that square is blocked then this arc is not
allowed.
</p>
<p>
<b>jms137</b>'s solution is particularly easy to read.  Method
add() determines the two possible arcs between two points, method
block() checks if a single arc is legal, and method ok() checks
the intersection of an arc with a single square in the grid.
</p>


					 <p>
					 <img src="/i/m/legakis_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
					 By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=287269"><strong>legakis</strong></a><br />
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
