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

<title>Single Round Match 192 Statistics at TopCoder</title>

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
                             <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 192</font></td>
                             <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                         </tr>

                         <tr valign="middle">
                             <td class="bodyText">Tuesday, April 27, 2004</td>
                             <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                         </tr>
                     </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
<b>SnapDragon</b> started out quickly with the first 250 submission, but then,
shockingly, he dropped back into the pack when he was forced to resubmit the easy
problem.  <b>tmyklebu</b> ended up with the fastest successful time on the
Div-I 250 of 4
minutes and 5 seconds. All in all the 250 went pretty
quickly. <b>SnapDragon</b> also got the fastest successful submission on the
medium
problem of 19 minutes and 22 seconds. This put him in within 100 points of the
current leader <b>antimatter</b> who submitted in 13 minutes and 3 seconds on
the medium.
Things really slowed down when the coders got to the hard problem. The problem
was simple to state, but had many complex special cases hidden deep inside. As
the clock ticked down, it became clear that if anyone got that problem they
would win the match. In the end there were only two serious submissions on the
problem by <b>SnapDragon</b> and <b>Eryx</b> but both went down in the system
tests, as did <b>antimatter</b>'s medium. After the dust settled,
<b>nicka81</b> came out the winner with 686.89 points, <b>SnapDragon</b> in
second with 568.01, and <b>hauser</b> in third with 562.41.
</p>

<p>In Division II <b>krijgertje</b> finished with 874.03 points on the strength
of quick submissions on the easy and medium to win in an
impressive debut SRM. This shoots <b>krijgertje</b> up to a initial  rating of
1820.  <b>krijgertje</b> submitted the hard also, but like in Div-I this time,
no one was successful on the Div-II hard (which was shared as the Div-I
medium). <b>riveria</b> finished in second with 679.07 points and
<b>mkschmidt</b> took third with 658.80.
</p>

<H1>
The Problems
</H1>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2403&amp;rd=4780">BoxLoader</a></b>
</font>
<A href="Javascript:openProblemRating(2403)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      138 / 172 (80.23%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      116 / 138 (84.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SlimJim</b> for 246.19 points (3 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      189.41 (for 116 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
You are asked how many <b>itemX</b> by <b>itemY</b> by <b>itemZ</b> unit items
can
fit in a <b>boxX</b> by
<b>boxY</b> by <b>boxZ</b> unit box, will all items in the same orientation.
The number of boxes that can fit in one dimension is easily calulated by the
convienient floor rounding built into integer division.

A long slow way to type this in is shown below for illustrative purposes.
</p>

<pre>
xcount = boxX / itemX ;
ycount = boxY / itemY ;
zcount = boxZ / itemZ ;
totalcount = xcount * ycount &amp; zcount ;
</pre>
<p> But in the heat of battle, you would do something more like this for
the fastest submission.
</p>
<pre>
c=(bx/ix)*(by/iy)*(bz/iz);
</pre>
<p>
Then you just have to do the six different cases, switching around itemX, ItemY
and ItemZ (or boxX, boxY and boxZ) and pick the biggest one. This is a quick
job with cut and paste (or
"^K^K^Y^Y^Y^Y^Y^Y" if your are using a real nerd's editor like me).
</p>
<pre>
int c, m=0;
c=(bx/ix)*(by/iy)*(bz/iz); if(c&gt;m)m=c;
c=(bx/ix)*(by/iz)*(bz/iy); if(c&gt;m)m=c;
c=(bx/iy)*(by/ix)*(bz/iz); if(c&gt;m)m=c;
c=(bx/iy)*(by/iz)*(bz/ix); if(c&gt;m)m=c;
c=(bx/iz)*(by/ix)*(bz/iy); if(c&gt;m)m=c;
c=(bx/iz)*(by/iy)*(bz/ix); if(c&gt;m)m=c;
return m ;
</pre>
<p>
 The only thing to be
careful about is making sure you got all six cases. You could use nextperm() in
C++ but that is really overkill and probably slower to type in.
</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2823&amp;rd=4780">BigCube</a></b>
</font>
<A href="Javascript:openProblemRating(2823)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      80 / 172 (46.51%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      29 / 80 (36.25%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>riveria</b> for 435.03 points (11 mins 19 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      294.93 (for 29 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
BigCube asks you to find the largest perfect cube within a bunch of intervals.
The key to this problem is
to see that you must generate cubes and test them to see if they are contained
in the intervals (there are 100,000 possible cubes) and not go through the
intervals testing to see if each member is a cube (that would be
50,000,000,000,000,000 tests). Examples were included which would
demonstrate that looping within the intervals would time out. There was an
unfortunate typo in the constraints which listed the maximum as
"1000000000000000000 (1e15)"  Those who counted the zeros found there were 18
not the intended 15, which is quite different. But most people trusted the 1e15
and didn't bother to count the zeros.
</p>
<p>
Here is all you needed to do except make some variables.
</p>
<pre>
for(i=0;i;&gt;ranges.length;i++)
   { low[i]=Long.parseLong(ranges[i].split("-")[0]);
    high[i]=Long.parseLong(ranges[i].split("-")[1]); }
long n;
for(n=100000;n&gt;=0;n--)
   for(i=0;i;gt;ranges.length;i++)
       if ( n*n*n &lt;= low[i] &amp;&amp; n*n*n &gt;= high[i] )
          return n*n*n+"" ;
return "" ;
</pre>



<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2423&amp;rd=4780">EigenVector</a></b>
</font>
<A href="Javascript:openProblemRating(2423)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      4 / 172 (2.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 4 (0.00%)
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
      84 / 170 (49.41%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      37 / 84 (44.05%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 359.95 points (19 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      245.66 (for 37 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p> Eigenvector is a big scary math word. But you don't have to do any big
scary math in this problem. In fact it turned out that some coders that were
familiar with
eigenvectors and eigenvalues were at a disadvantage on this problem, because
the problem statement disallowed eigenvalues of zero, which is a perfectly good
possible eigenvalue. A second difficulty with this problem was one of the
example answers was incorrect, which when discovered, showed the reference
solution had a bug, and the test solutions of two problem testers also had the
same exact bug (what are the chances?), so it had crept by unnoticed. Oh, yeah,
L<sub>0</sub> should have been L<sub>1</sub> too. Ouch.
</p>
<p>
The solution was not nearly as bad as the problem statement.
Because the range of the allowable answers is so
small, you can just generate all the possible answers and test each one to see
if it works. If you generate them in order by L<sub>0(1)</sub> norm and then
in lexicographic order, you don't even have to write any comparison code, just
return the first one you find.
</p>
<p> The basic algorithm looks like this.
</p>
<pre>
For (L0=1;L0&lt;10;L0++)
   {
   vec=first(L0);
   while ( ok(vec)) ;
      {
      if ( proportional(vec,multiply(matrix,vec))
         return vec ;
      vec=next(vec,L0) ;
      }
   }
</pre>
<p>
All you have to write is a parser() for the input into "matrix", multiply(),
proportional(), first(), next() and ok() which are all pretty straightforward.
</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2450&amp;rd=4780">DigitMultiples</a></b>
</font>
<A href="Javascript:openProblemRating(2450)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      166 / 170 (97.65%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      122 / 166 (73.49%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tmyklebu</b> for 244.95 points (4 mins 5 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      188.64 (for 122 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>
Find the longest substring of digits in <b>single</b> which has a corresponding
substring in <b>multiple</b> that is a digit by digit multiple of
<b>single</b>'s substring. This problem is very similar to the DNA sequence
matching problems we saw recently, so everyone should have been exposed to lots
of different algorithms that could be used here. The 50 character limitation on
the length of the strings allowed inefficient algorithms of O(n<sup>4</sup>) or
so. The thing to do for the most points, is to go with the fastest one to type
in and debug.
</p>
<p>
Oh yeah, there is an O(n) algorithm for this problem, if the
base of the number system is considered constant, but that is really really
really overkill for a level 1 (easy) problem. But if you had a prewritten
maximum substring matching algorithm that runs in linear time you could do
this (or any other prewritten matcher).
</p>

<pre>
m=0 ;
for(k=0;k&lt;9;k++)
  {
  for(i=0;i&lt;single.length();i++)
      {
      vec[i]='0'+(single[i]-'0')*k ;
      }
   m=max(m, linearmatcher(vec,multiple));
   }
return m ;
</pre>
<p>
Otherwise, coding from scratch, something like this suffices.
</p>
<pre>
max=0;
for(offset = -single.length() ;
    offset &lt; multiple.length(); offset++ )
   for(k=0;k&lt;10;k++)
   {
   count = 0 ;
   for(i=0;i&lt;single.length();i++)
      if (i+offset &gt;=0&amp;&amp;i+offset&lt;multiple.length())
         if ((single(i)-'0')*k==(multiple[i+offset]-'0'))
         {
         count ++ ;
         if ( count&gt;max) max=count ;
         {       
      else
         count = 0 ;
   }     
return max ;
</pre>
<p>
Here <b>multiple</b> is compared to <b>single</b> character by character,
noting the length of the longest consecutive sequence of matches. Then the
process is repeated for a different character offset between the two strings.
This is O(n<sup>2</sup>) which isn't bad (if the base of the
number system, b, is allowed to vary then there is an additional factor of b in
the complexity because there is a loop from 0 to b-1, but it is a constant in
this problem.)
</p>
<p>
The matching  code is much simpler if the k loop is outside the i loop. It is
possible to do it the other way, but takes more bookkeeping.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2451&amp;rd=4780">SquarePoints</a></b>
</font>
<A href="Javascript:openProblemRating(2451)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      3 / 170 (1.76%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 3 (0.00%)
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



<p> Given a set of points, do they determine a unique square? The problem
statement is so simple, you would think this problem would be easy. The
problem is trivial for circles. Not so. It is a mess. This is clearly a
"think about the problem and reason out all the cases" kind of problem than
a just "remember the right algorithm" kind of problem.
</p>

<p> If you have five or more points on a square, by the pigeonhole principle,
of the four sides at least one side must have at least two points. So you
only need loop over all the pairs of
points to find one side of all the possible squares. There are at most 1225
pairs with 50
points. And once you find a valid square for
a particular slope (or multiple of 90 degrees rotation of that slope) you
don't have to check that slope again, as you would be recounting the same
square.
</p>
<p>
So the basic algorithm is to count squares trying all the pairs of points with
slopes that don't
(so far) have a valid square detected. As soon as we find two squares we know
the configuration is ambiguous, or some configurations will immediately signal
ambiguity. If we go through all the points and only one square is found, the
configuration is
consistent. If no squares are found the configuration is inconsistent.
</p><p>
To reduce the number of variables, and simplify the calculations, what I did
was to first select the pair of points, then rotate all the points about the
origin so that the selected pair is horizontal. Then translate all points so
the selected points so that are on the x-axis. Now we are almost in a standard
configuration for testing. Then find the bounding box of the points. If the
bounding box extends above and below the x-axis, then no square through these
two points is possible and this pair is discarded (although a square with an
edge containing two other points, parallel to these two might still be
possible).</p>
<p>Now we know the bounding box is either up from the x-axis or down from the
x-axis. If it is down, I reflect all the points about the x-axis. Now all the
points are in a standard configuration where it is easier (for me) to analyse
and test
all the possible cases.
</p>
<blockquote>
<p>
About rotations: Many people shy away from rotating a coordinate system because
they are afraid they will get the transformation matrix wrong. Do not fear. In
two dimensions rotating about the origin is very easy and every coder that is
good enough to try to
solve a Div-I hard problem should have this formula memorized.
</p>
<pre>
x<sub>r</sub> = x<sub>o</sub> cos(a) - y<sub>o</sub> sin(a)
y<sub>r</sub> = x<sub>o</sub> sin(a) + y<sub>o</sub> cos(a)
</pre>
<p>
This rotates the point (x<sub>o</sub>,y<sub>o</sub>) by an angle of "a"
counterclockwise about the origin.
</p>
</blockquote>
<p> Back to the problem:
If any point is not on the edge of the bounding box, (then it is in the
interior) consideration of the
current pair of points is terminated. But other pairs of points may still yield
valid squares.
</p>
<p>
Next we classify the locations of the points and determine if any of the
following cases hold (where "edges" refers to edges of the bounding box).
Remember, we are inside a loop over all pairs of points, and we are keeping
track of a
count of how many squares we have found, and marking the slopes of those found
squares as "used". Actually we exit the loop and return "ambiguous" if we find
two squares, so we only need ever mark one slope as used. Here are the cases:
</p>
<p>
Case "-": All points colinear. Return "ambiguous".
</p>
<p>
Case "L": All points on two adjacent edges. Return "ambiguous".
</p>
<p>
Case "U": At least one point on bottom edge not a vertex, and a point on each
side edge with
x &gt; 0. Increment count and mark this slope as used if the bounding box
height is less than or equal to the bounding box width.
</p>
<p>
Case "n": Similar but upside down. Only two points on bottom "edge" each a
vertex of the bounding box. At least one point on one vertical edge not a
vertex.
At least one point on both vertical edges with y &gt; 0. At least one point on
the top edge not a vertex. Same test as case "U", Increment count and mark this
slope as used if the bounding box
height is less than or equal to the bounding box width.
</p>
<p>
Case "C": Same thing on its side. Reverse height and width in test. At least
one point on top edge not a vertex. At least one point on one side not a
vertex. No points on the edge on the other side except possibly vertices.
Because we start out knowing that there are at least two points on the bottom
"edge" the three cases U, n, and C are not quite exactly same to detect,
although they are just rotations of the same kind of configuration.
</p>
<p>
Case "L'": (L prime) At least one point on bottom edge not a vertex. At least
on point on
one side edge not a vertex. No points on the other side edge which are not
vertices. Top vertex of "other" side must be present.
This configuration always yields a square, increment the count and mark slope used.
</p>
<p>
Case "||": No non-vertex points on the top or bottom edges. Return ambiguous if
the bounding box height is less than the bounding box width. Increment the
count and mark the slope used if they are equal. 
</p>
<p>
Case "_-": The parallel case on its side. No non-vertex points on either side
edge.  Return ambiguous if
the bounding box height is greater than the bounding box width. Increment the
count and mark the slope used if they are equal.
</p>
<p>
Case "O": Non-vertex points on all edges and the default if none of the other
cases hold. If bounding box height ==
bounding box width, increment count and mark slope used.
</p>
<p>
There, that wasn't so hard was it? Ok, It was pretty hard.
But did we learn anything? I learned how to spell "ambiguous".
</p>
<p>
If I were writing a production code for this problem, I would probably do the
rotations, then test each point and set one of eight bits in an int. One for
each vertex of the bounding box and one for each side of the bounding box
excluding the vertices. Then with a the results of the height/width of the
bounding box comparison (three possible values), just use a hardwired lookup
table with 768 entries. Not quite a many cases as the four-color map problem,
but pretty impressive.
Good luck for the guy after me that has to debug it.
</p>



                     <p>
                     <img src="/i/m/Rustyoldman_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                     By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=282718"><strong>Rustyoldman</strong></a><br />
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
