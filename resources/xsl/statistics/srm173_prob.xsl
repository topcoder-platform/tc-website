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

<title>Single Round Match 173 Statistics at TopCoder</title>

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
        <td width="170" bgcolor="#CCCCCC">
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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 173</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Tuesday, November 25, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 

<p> 
SRM 173 had no big surprises, with many of the usual names in the top. <b>SnapDragon</b> proved
fastest on the first two problems and <b>WishingBone</b> on the last, but still the winner was
<b>ZorbaTHut</b> despite no challenges. Notably for a problem set that I write was that
5 people managed to solve the hard problem!</p>

<p>
Divison two was mainly a battle between <b>blackbeltcoder4</b> and newcomer <b>avenger</b>, where
in the end <b>blackbeltcoder4</b> got the best overall score.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>ProgressBar</b> 
</font> 
<A href="Javascript:openProblemRating(1975)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      253 / 267 (94.76%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      231 / 253 (91.30%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dRaa</b> for 248.38 points (2 mins 17 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200.22 (for 231 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
First we calculate how long time the installation has
been running by summing up the execution times of
the finished tasks (call this <b>elapsedTime</b>),
and then sum up all the times to get the <b>totalTime</b>.
Obviously, the amount (in percentage) that has been completed
is <b>elapsedTime</b>/<b>totalTime</b>. One could calculate
this percentage, using float or double, multiply with 20
and round down using the floor function (or simply cast
it to an int). However, since we're dealing with integers
only, it's nicer to use integer math completely. One
should know that integer division always round down.
So we can calculate 20*<b>elapsedTime</b>/<b>totalTime</b>
using integer math to directly get the number of '#' characters
to use in the resulting string. To create the string,
start with an empty string and use two for-loops: one
to fill the '#' characters and one to pad this with
'.' characters until the total length is 20. Shortcuts
may be possible, using the languages built-in functions
for string creation.
</p> 

<font size="+2"> 
<b>WordForm</b> 
</font> 
<A href="Javascript:openProblemRating(2002)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      212 / 267 (79.40%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      169 / 212 (79.72%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dRaa</b> for 486.65 points (4 mins 43 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      344.68 (for 169 correct submissions) 
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
      191 / 193 (98.96%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      178 / 191 (93.19%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 247.20 points (3 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      215.23 (for 178 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This task can be broken into two sub task: The first
task is to deduce for each letter if it's a vowel or a consonant
while the second is to put together the return string.
</p>
<p>
This check is trivial for all letters except 'Y' (it's
probably convenient to first convert the letter to uppercase
using toupper or similar). Deducing whether 'Y' is
a vowel or a consonant requires that we know if the previous
letter was a vowel or a consonant. Therefore it makes sense
to check the letters from left to right, so when we reach a 'Y'
we already know if the previous letter was a consonant or a vowel.
This might sound trivial, but is actually an (easy) example of
dynamic programming, something I know many TopCoders have
problems with. The base case is of course the first letter,
then by definition 'Y' should be considered a consonant.
The 'C' and 'V' characters can either be appened to a new
string, or be stored in the input string by simply replacing
the original character.
</p>
<p>
In the second task we start with an empty result string and then
loop over all characters from left to right in the string with 'V' and 'C'.
A character from the latter string is appened to the end of the result string
if it's different from the last character added, or if the result string is empty.
These two steps can of course be done simultaneously:
Once we've figured out if a letter is a 'V' or a 'C',
we check if the last added letter to the return string
is the same. If not, we append the new character, otherwise
it's ignored.
</p> 

<font size="+2"> 
<b>Centipede</b> 
</font> 
<A href="Javascript:openProblemRating(1955)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      27 / 267 (10.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 27 (22.22%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>blackbeltcoder4</b> for 532.53 points (33 mins 38 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      460.04 (for 6 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
I've never played the original Centipede, and I am sure the
description of the centipedes movement in the problem
description differs from the original. I apologize for that...
</p>
<p>
I start this solution description by describing how
the actual simulation of the centipedes movement can
be implemented, and then show how to make it fast enough
to work on large inputs (i.e. when we have to simulate
more than, say, 100 million time units).
</p>
<p>
The centipede is easiest represented by an array containing
10 points (or two int arrays, one with the x-coordinates
and one with the y-coordinates), one point for each segment.
I will let index 0 in this array be the head and index 9
be the last part of the tail. We also need to know the
horizontal direction of the centipede, which is either 1 or -1.
</p>
<p>
Initially the head is located at 10,0 and the last part of
the tail at 1,0 (0,0 being the top left corner, which
will always be an obstacle) and the remaining segments
in between, since we're guaranteed that all these squares in
will be empty. The horizontal direction
should be set to 1.
</p>
<p>
We will need a function to move the centipede, given the
new position of the head and direction. This function should
shift all elements in the centipede array and update
the head location as well as the direction. One could
use a faster data structure (like a circular list)
to avoid shifting all elements, but this is really not
necessary when the array only contains 10 elements.
</p>
<p>
To simulate a time unit, we start by checking if
the centipede can move in its current direction, that is,
if the position where the head will be if it's moved in the
current horizontal direction is empty. If so, use the move
function defined in the previous paragraph. Otherwise
we check if the square directly below the head is empty. If so,
use the same move function to move the centipede down,
and also change the horizontal direction. Otherwise
we call the same function, but make sure to only
change the direction. It's critical that we call
the move function here even though the head doesn't
change position, but the remaining part of the centipede will!
The pseudocode for this simulation is thus as follows:
</p>

<pre>  
  if square_empty(centipede[0].x + centipede_dir,centipede[0].y)
    update_centipede(centipede[0].x + centipede_dir, centipede[0].y, centipede_dir)
  else if square_empty(centipede[0].x, centipede[0].y + 1, -centipede_dir)
    update_centipede(centipede[0].x, centipede[0].y + 1, -centipede_dir)
  else
    update_centipede(centipede[0].x, centipede[0].y, -centipede_dir)
</pre>

<p>
There is one minor complication: what should we do when the centipede
starts to move out at the bottom of the screen? The easiest solution
is to let the function called square_empty above return true for
all positions below the screen. This will make the centipede
move horizontally below the screen, but that's ok. Just make sure
that you don't do any array indexing using the x-coordinate, because it
might very well be negative (since there are no obstacles at all on that row)!
</p>
<p>
After the if-statements above, one thing remains, namely to check
if the centipede has completed a cycle. It has done so when
the last part of the tail has just left the screen, i.e. when centipede[9].y is
outside the screen. At this instant, immediately reset the centipede
at the top of the screen, preferably using the same routine
as when initializing the centipede at the beginning of the simulation.
Make sure you don't get any off-by-one errors here, like being a time unit too early or too late.
</p>
<p>
Finally, when all time units have been simulated, just loop through
all segments and mark them (if they're visible) in the screen layout.
</p>
<p>
So, that was a very detailed description of the simulation. It should
come as no surprise that you have to do slightly more than this to
get the solution working though, since the statement warns for large inputs,
and the last example case also demonstrates this. What one has to do here
is realize that every time the centipede restarts (i.e. every <i>cycle</i>),
it will take the exact same path again and again. It's thus pretty
pointless to simulate this path over and over again. Instead we could
simulate exactly one cycle, and find out how long time this takes, i.e.
the <i>cycle length</i> (note that the centipede will always complete
a cycle given enough time due to the input constraints).
We then take the given amount of time units modulo the cycle length
(that is, the remainder of the divison &lt;time units&gt;/&lt;cycle length&gt;)
and will then end up with the number of time units we need to simulate
the centipede in it's last cycle.
</p>
<p>
We can use the simulation algorithm above to both find the cycle length
and simulate the last cycle, or even do both tasks at once, doing the
modulo calculation when the centipede is about to start its second cycle.
Doing both tasks at once is slightly more error prone though, which
I found out when I first wrote my solution...
</p> 

<font size="+2"> 
<b>TreasureHunt</b> 
</font> 
<A href="Javascript:openProblemRating(1958)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      146 / 193 (75.65%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      77 / 146 (52.74%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 466.25 points (7 mins 45 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      289.09 (for 77 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
It surprised me that so many failed this problem. I suspect the reason
was failing to understand the details in the problem (maybe reading the problem statement
too fast). Or maybe it was just a poor wording from my part? The problem survey will probably tell...
</p> 

<p>
Once you understand the task, it's pretty straightforward. It can essential be described
like this in pseudocode:
</p>

<pre>
Find the location of the X on the map
Loop through all valid starting points:
  Walk according to the instructions
  If we didn't walk on any water squares:
    Did we end up on a square which is closer to the X?
    (or same distance and better tiebreaker)
      If so, update best position found
</pre>

<p>
A starting point is valid if it's a beach, which are precisely those
squares that:
<ul>
<li>Is a land square ('O' or 'X') <i>and</i></li>
<ul>
<li>Lies on the border of the map (since all squares outside the map are water) <i>or</i></li>
<li>Is adjacent to a '.' square on the map</li>
</ul>
</ul>
When simulating the walk, we have to be careful to not skip over any squares,
by doing things like x=x+dirx*paces - we have to simulate the walk pace
by pace. At the end of the simulation, we check the distance to the
estimated treasure location and if it's better than the best found so far,
update it.
</p>

<p>
To take care of the last two tiebreakers, we just have to loop over all points in row
major order (that is, y-coordinate in the outer loop, and x-coordinate in the inner).
If we only update the best starting location when a shorter distance has been found,
this will work because the order of the loops guarantee that we find the wanted location in case
of several treasure locations at the same distance. Note that we loop the start location
but that's it's the treasure location we should do these tiebreakers on. However,
when it comes to smallest x- &amp; y-coordinate, this doesn't matter as the treasure location
is just a translocation of the start location.
</p>

<font size="+2"> 
<b>ElectronicScarecrows</b> 
</font> 
<A href="Javascript:openProblemRating(1960)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      26 / 193 (13.47%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      5 / 26 (19.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>WishingBone</b> for 666.26 points (22 mins 38 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      535.57 (for 5 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Ignoring the story and concentrating on the underlying problem,
one quickly realizes it can be formulate like this: Given a set of points P,
find a subset S of these so that |S| &lt;= k and that the area
of the convex hull of S is maximized.
</p>
<p>
It's tempting to begin to find the convex hull of P and then work
from there, but this turns out not to be necessary. Of course,
for those who have prewritten convex hull code lying around, it doesn't hurt
either, especially since having a convex hull might make the rest of the
solution seem easier. I won't explain how to find the convex hull from a
set of points as this is one of the first computational geometry algorithms
taught, and there are plenty of resources on the web - just search for
"convex hull" and "graham's scan" on Google.
</p>
<p>
It should maybe be noted that a point <i>p</i> that is not in the convex hull
can not be part of an optimal solution because then another point <i>q</i>
in the convex hull would exist so that replacing the <i>p</i> with
<i>q</i> would create a new polygon which contains the whole old polygon;
again, I won't explain this further since as I said, there's no need
to calculate the convex hull.
</p>

<img align="right" src="/i/srm/srm173.gif" border="0" width="300" height="200"/>
<p>
There are many ways to solve this problem, but the "easiest" of them (which also
is the slowest probably) works like this:
</p>

<p>First select a starting point (loop over all points in P) and call
this one Q<sub>1</sub>. In the picture to the right, this point is marked
with 1. Create a new set Q of points where Q<sub>1</sub> is the origin.
All points strictly to the left or with the same x-coordinate and below
of Q<sub>1</sub> are not included in Q (for instance, if the gray
points in the figure exist in P, they should not exist in Q). Now sort
the points in Q according to their angle. If several points have the
same angle (like point 3 and 4 to the right), select the one closest
to Q<sub>1</sub> first. We then get an ordered list of points, and the numbers
next to the points in the figure shows this ordering in this particular case.
</p>

<p>The idea is now that if we create a polygon starting at
Q<sub>1</sub> and then select points with increasing numbers (and
end with Q<sub>1</sub>), we will always end up with a <i>simple</i> polygon (a simple polygon
is one where the edges don't intersect). As stated in the
problem description, the area formula for the polygon only works
properly if the polygon is simple. Also, all <i>convex</i> polygons that we
can create from these points can be found this way, so we won't miss
the polygon with the maximum area.
</p>

<p>The next step requires that you understand how the polygon area
formula works. When going betweeen two points, say Q<sub>1</sub>
and Q<sub>2</sub>, we calculate the area below this edge. The
formula for this is, as you should have learned in high school,
(x<sub>2</sub> - x<sub>1</sub>)(y<sub>2</sub> + y<sub>1</sub>) / 2 =
(x<sub>2</sub>y<sub>2</sub> + x<sub>2</sub>y<sub>1</sub> - x<sub>1</sub>y<sub>2</sub> - x<sub>1</sub>y<sub>1</sub>) / 2.
(However, the two terms x<sub>k</sub>y<sub>k</sub> will both be canceled out when going from
Q<sub>k</sub> to the next (or previous) point, which is why we only have to
care about (x<sub>2</sub>y<sub>1</sub>-x<sub>1</sub>y<sub>2</sub>) / 2, and doing
this over all edges gives us the polygon area formula.)
</p>

<p>If we look at the original
formula (x<sub>2</sub> - x<sub>1</sub>)(y<sub>2</sub> + y<sub>1</sub>) / 2 we see
that if we go from left to right (x<sub>2</sub> > x<sub>1</sub>), the area increases, but when going left,
it decreases (asssuming we're above the x-axis anyway, otherwise everything will be inversed).
Now look at the picture. Here we have started to select a polygon, choosing the points
Q<sub>1</sub>, Q<sub>2</sub>, Q<sub>3</sub> and Q<sub>6</sub>. The area in blue is the
current area of the polygon that we have added. If the next point would be, say,
Q<sub>7</sub>, we would remove the area below the edge between Q<sub>6</sub> and Q<sub>7</sub>
since we're going from right to left.
</p>

<p>
So how do we find the <i>largest</i> area we can create? We can visualize this problem
as a graph problem actually, where each node in the graph correspond to a point in Q, and let
the edges in the graph correspond to selecting an edge in the polygon. The weight of each edge
is of course the area that walking this edge would add (or decrease) from the polygon area.
Since all edges are from a node with a lower index to a node with a higher index, we have
what is called a <i>direct acyclic graph (DAG)</i>. Since we have to "close" the polygon,
it might be convenient to create a copy of Q<sub>1</sub> and let it be the
last vertex (with no outgoing edges). What we want to do now is to find the
<i>longest path</i>, starting at Q<sub>1</sub> and ending at the duplicated Q<sub>1</sub> node,
traversing <i>exactly k edges</i>. Such a path will correspond to selecting the polygon
with the largest area, since the length of the path is the area of the selected polygon.
</p>

<p>
Finding this path can be done using dynamic programming. If we define the function longest_path like this:
</p>

<pre>
longest_path(current_node, selected_nodes) =
  set max_area= 0
  loop through all nodes x greater than current_node  
    if longest_path(x,selected_nodes+1) + area_below(current_node,x) > max_area
      update max_area
  return max_area
</pre>

<p>the largest polygon has the area longest_path(1,0).</p>

<p>This is a mathematical function without side effects, so the size of the input domain
is <i>kn</i>, where <i>k</i> = number of nodes to select and <i>n</i> = number of nodes in Q.
Thus we only have to compute it <i>kn</i> times, and evaluating it once requires at most
looping through <i>n</i> nodes. Since we already have an outer loop checking all start points, the
overall complexity of this algorithm becomes O(<i>k</i> <i>n</i><sup>3</sup>).
There are several ways to optimize this algorithm, but doing so in a SRM is not
necessary and only a waste of time. I'll leave them to the reader as an exercise...
</p>

<p>
It turns out that the fastest algorithms is very much faster than this.
The best I've found has a worst case complexity O(<i>k</i><i>n</i> + <i>n</i>log <i>n</i>). An implementation of this
algorithm can be found in the huge computational geometry library CGAL,
<a href="http://www.cgal.org">http://www.cgal.org</a>. The function is called
maximum_area_inscribed_k_gon_2 and requires that you first compute the convex hull of P.
</p>


                        <p>
                        <img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=269554"><strong>Yarin</strong></a><br />
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

