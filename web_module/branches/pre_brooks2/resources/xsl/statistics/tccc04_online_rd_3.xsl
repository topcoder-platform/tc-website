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

<title>TCCC04 Online Round 3 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC04 Online Round 3</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Wednesday, March 10, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
It must be tournament time.  I've never seen so many reds open and abandon
multiple problems.  Of the fifty advancers, at least fourteen abandoned
either the easy or the medium problem.  And at the end of the night, seven
reds and yellows were left with all three problems open, but unsubmitted.
Congratulations to <b>bstanescu</b>, who rode two problems and a challenge
to victory!  The surprise of the night came when <b>tomek</b> resubmitted
the medium, dropping him to 19th for the night, and 2nd in the overall
rankings.
</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2289&amp;rd=5008">Fences</a></b>
</font>
<A href="javascript:openProblemRating(2289)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      70 / 95 (73.68%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      68 / 70 (97.14%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Ruberik</b> for 241.06 points (5 mins 30 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      193.18 (for 68 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
"Arghh!", you may have thought.  "Intersections?  Inclusion-exclusion to
avoid over counting?"  Then you took a deep breath and said to yourself,
"No way, it's only an Easy!"
</p>

<p>
The use of integer coordinates means that the smallest units of pasture
are 1 unit on each side.  And there are only a million such units under
consideration.  Just make a 1000-by-1000 array of booleans that say whether
each unit square is inside a rectangle or not.  For each rectangle, loop
through all its unit squares and set them all to true.  Note that if a
unit square is inside several rectangles it will be set to true several
times, but that does no harm.  At the end, loop through all the unit
squares and, for each unit square that is inside a rectangle, count how
many of its four borders touch either an outside square or an edge of the
1000-by-1000 array.  Return the total count at the end.
<pre>
  for each rectangle do // <i>(x1,y1) and (x2,y2) are opposite corners</i>
     for x in min(x1,x2) to max(x1,x2)-1 do
        for y in min(y1,y2) to max(y1,y2)-1 do
           set inside[x,y] to true
  count = 0
  for x in 0 to 999 do
     for y in 0 to 999 do
        if inside[x,y] then
           if x==0 or !inside[x-1,y] then count++
           if x==999 or !inside[x+1,y] then count++
           if y==0 or !inside[x,y-1] then count++
           if y==999 or !inside[x,y+1] then count++
  return count
</pre>
Note that <tt>inside[x,y]</tt> represents the unit square whose upper left
corner is at coordinates (<tt>x</tt>,<tt>y</tt>).
Also, notice the use of min and max to take care of the problem that we
don't know <i>which</i> corners of the rectangle we have been given, only
that they are opposites.
</p>

<p>
A nifty trick that's worth remembering anytime you have arrays
representing these kinds of maps is that you can avoid all the edge
checks by putting an extra layer of cells around all edges of the array.
In this case, you could use a 1002-by-1002 array and add 1 to all
the coordinates.
Then the four inner if-statements become
<pre>
           if !inside[x-1,y] then count++
           if !inside[x+1,y] then count++
           if !inside[x,y-1] then count++
           if !inside[x,y+1] then count++
</pre>
</p>

<p>
Now, there can be up to fifty rectangles, each of which can contain up
to a million unit squares.  That's 50 million unit squares we might touch.
And the final loop that counts the fence segments can touch nearly 5 million
more unit squares.  Doing something 55 million times should raise your
timeout antennae, because it is often the case that a few million operations
is enough to fill 8 seconds.  Ah, but that is a few million complex operations.
These are 55 million <i>simple</i> operations and they run in about a
second&#8212;or even less if you're in a language that doesn't do bounds checks on
arrays.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2326&amp;rd=5008">ImageCompress</a></b>
</font>
<A href="javascript:openProblemRating(2326)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      50 / 95 (52.63%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      29 / 50 (58.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>m00tz</b> for 385.47 points (16 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      277.28 (for 29 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
It was easy to time out on this problem.  The examples did not include
any large test cases, not out of deviousness but because the output
would not have fit comfortably on the screen.  It would have been straightforward
to test a large case manually, but many coders (myself included) have gotten
into the bad habit of submitting as soon as they pass all the example
cases.  Tonight, that was fatal.
</p>

<p>
The simplest implementation is a recursive function that tries all
possible decomposition patterns and keeps the best, with memoization
to keep it efficient.  A key question is how to represent subimages.
Although you could actually construct each subimage as strings,
it is much simpler
and faster to store a single copy of the original image and specify
subimages with six numbers:
<ul>
<li> <tt>row</tt>: the topmost row in the subimage </li>
<li> <tt>col</tt>: the leftmost column in the subimage </li>
<li> <tt>rowCount</tt>: the number of rows in the subimage </li>
<li> <tt>colCount</tt>: the number of columns in the subimage </li>
<li> <tt>rowStep</tt>: the distance between adjacent rows in the subimage, relative to the original image </li>
<li> <tt>colStep</tt>: the distance between adjacent columns in the subimage, relative to the original image </li>
</ul>
The last two of these numbers allow us to handle the patterns that decompose
the image into even and odd rows/columns.  Initially, <tt>row</tt>
and <tt>col</tt> are the top left corner of the original image, and
both step sizes are 1.  There are four decomposition patterns:
<ul>
<li>Left-Right:
Sets <tt>colCount</tt> to <tt>half</tt> for the left subimage
and <tt>colCount-half</tt> for the right subimage, where <tt>half</tt> is
<tt>(colCount+1)/2</tt>.  Also sets <tt>col</tt> to <tt>col+half*colStep</tt>
for the right subimage.  All other values stay the same. </li>
<li>Upper-Lower: Sets <tt>rowCount</tt> to <tt>half</tt> for the upper subimage
and <tt>rowCount-half</tt> for the lower subimage, where <tt>half</tt> is
<tt>(rowCount+1)/2</tt>.  Also sets <tt>row</tt> to <tt>row+half*rowStep</tt>
for the lower subimage.  All other values stay the same. </li>
<li>Even-Odd Columns:
Sets <tt>colCount</tt> to <tt>half</tt> for the even subimage
and <tt>colCount-half</tt> for the odd subimage, where <tt>half</tt> is
<tt>(colCount+1)/2</tt>.  Also sets <tt>col</tt> to <tt>col+colStep</tt>
for the odd subimage, and <tt>colStep</tt> to <tt>2*colStep</tt> for
both subimages.  All other values stay the same. </li>
<li>Even-Odd Rows:
Sets <tt>rowCount</tt> to <tt>half</tt> for the even subimage
and <tt>rowCount-half</tt> for the odd subimage, where <tt>half</tt> is
<tt>(rowCount+1)/2</tt>.  Also sets <tt>row</tt> to <tt>row+rowStep</tt>
for the odd subimage, and <tt>rowStep</tt> to <tt>2*rowStep</tt> for
both subimages.  All other values stay the same. </li>
</ul>
For each image, you find the best encodings for each of the eight subimages,
combine them into the best encodings for each of the four decomposition
patterns, and pick the best of these as the encoding for the whole image.
Because you can reach the same subimage by different paths&#8212;for example,
splitting horizontally and then vertically produces the same subimages
as splitting vertically and then horizontally&#8212;you memoize the results
for each subimage to avoid recomputing them over and over again.
</p>

<p>
Dynamic programming and memoization are usually interchangable,
so it is instructive to consider why dynamic programming does not work
very well for this problem.  In dynamic programming, you usually use
a few loops to generate all the subproblems from smallest to largest.
But what should those loops look like here?
</p>

<p>
Consider the <tt>rowCount</tt> value.  How should a loop generate the
possible values of <tt>rowCount</tt>?  It would be easy to write a
loop from 1 to the number of rows in the original image.  However,
this would be wasteful because not all of those values are actually
needed.  For example, suppose the original image had 21 rows.  Then
various subimages have 1, 2, 3, 5, 6, 10, 11, or 21 rows, but <i>not</i>
4, 7, 8, 9, or 12-20 rows.  A dynamic programming solution would have
to work very hard indeed to avoid computing answers for subimages with
invalid numbers of rows.   (Here is a challenge for the round tables: write
a simple loop that takes a number of rows and produces the sequence of
the numbers of rows that occur in subimages, from smallest to largest!)
On the other hand, a recursive function augmented
with memoization naturally considers only those values that are valid.
It is no extra work to filter out the unwanted values&#8212;in fact, it
would take substantial extra work to include the unwanted values if
we decided we wanted them for some perverse reason.
</p>

<p>
And yes, the last example case was indeed a black heart, which some
took as evidence of the writer's character.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2401&amp;rd=5008">Decaffeinated</a></b>
</font>
<A href="javascript:openProblemRating(2401)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      2 / 95 (2.11%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 2 (0.00%)
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

<p>
Don't be fooled.  This problem was hard, but not as hard as the submission
stats suggest.  People spent so much time on the other two problems
that they ran out of time on this one.
</p>

<p>
In this problem, you had to find the shortest path through a state space.
I guess you could break out the big shortest-path guns, like Dijkstra's
algorithm, but that would be silly when breadth-first search is all you need.
</p>

<p>
A state includes at most 5 numbers: the amount of coffee in each serving cup
and the amount (and type) of coffee in each measuring cup.  For the measuring
cups, I used negative numbers to indicate regular coffee and positive numbers
to indicate decaffeinated coffee.  You could also use a boolean flag
to distinguish between regular and decaffeinated, but then you would have
to be very careful how you handled an empty cup.  For example, you would
not want to avoid pouring regular coffee into an empty measuring cup just
because its boolean flag said decaffeinated.
</p>

<p>
The tricky part about this problem is handling all the possible state
transitions, because a single transition can involve up to three
simultaneous pouring actions.  Handling all the possible cases here
(to and from the reservoirs, to the serving cups, or between measuring
cups, with one, two, or three simultaneous actions) probably accounted
for most of the time and code spent on this problem.
</p>

<p>
In breadth-first search, you usually use a queue.  You begin by
putting the initial state (all cups empty) into the queue, and then go
into a loop where you repeatedly pull a state out of the queue and put
all the new states reachable from that state at the end of the queue,
stopping when either you find the end state (both serving cups full) or
the queue becomes empty, in which case there is no way to get to the
end state.
</p>

<p>
To keep the search efficient, it is important to avoid putting
states in the queue if you've already seen them before.  There
might be several hundred thousand to a few million states,
so you have to be careful how you keep track of what states you've
seen.  A hashtable or tree runs the risk of taking up
too much memory and/or being too slow, although the constraints were
small enough that you could probably get away with it.  A big bitvector
works well, because even the maximum of 4.5 million possible states can
be represented in about half a megabyte.
</p>

<p>
Once you find the end state, you still need to return the number of seconds
it took to get there.  You could add this information to each state, but
an easier approach is to rethink the use of a queue.  Instead of one queue,
you can use <i>two</i> queues: one that contains the states reachable in
the current second, and one that contains the states reachable in the next
second.  You then take states out of the queue for the current second, and
add new states to the queue for the next second.  When the queue for the
current second becomes empty, you increment a clock variable and swap the
two queues so that the queue for the next second becomes the queue for the
current second, and the queue for the current second (which is empty) becomes
the queue for the next second.  When you find the end state, you simply
return the clock variable.  One pleasant feature of this approach is that
the queues don't need to be queues anymore.  Stacks would work just as
well&#8212;the order in which states are removed from the data structure no
longer matters.
</p>

<p>
Finally, there is a cute trick for determining that the end state is going
to be unreachable without searching at all.  Take the GCD of the measuring
cup sizes and if it does not divide evenly into both serving cup sizes, then
the end state is unreachable.
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