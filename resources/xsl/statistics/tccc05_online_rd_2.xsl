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

<title>TCCC05 Online Round 2 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC05 Online Round 2 Problem Set</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">January 19, 2005</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
Submissions to the first two problems came in fast and fierce during round 2 of
the TopCoder Collegiate Challenge.  Eryx was the first to submit both problems,
doing so in under 10 minutes.  Others were not far behind though, and after 20
minutes, most of room 1 was working on the last problem.  tomek was in his usual
form, and his time on the hard problem would have been enough to give him
yet another win.  However, an unsuccessful challenge knocked him down to second,
giving haha the narrow victory.  In third place, the ever-speedy antimatter
was only one point behind.
Amongst the advancers, president was the lowest rated member to advance to the
next round, while bstanescu, a regular at past onsite events, had the dubious
distinction of being the highest rated member not to advance.   
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3475&amp;rd=6529" name="3475">CalendarHTML</a></b>
</font>
<A href="Javascript:openProblemRating(3475)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      182 / 184 (98.91%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      166 / 182 (91.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>m00tz</b> for 245.85 points (3 mins 42 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      206.82 (for 166 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem was quite a bit easier than the easy from round 1, and most people
had little trouble with it.  First, you should add the header tags, which can
easily be hard coded.  Next, for the first row, you should add a number of empty
cells equal to <tt>start</tt>.  Then, just start iterating over days, adding a cell for
each day.  When you get to a day, <tt>d</tt>, such that <tt>d+start % 7 == 1</tt>,
you have reached the end of a row, and you should take the appropriate steps.  The one
special case you have to deal with is when <tt>start</tt> is 0, you don't want
to start two new rows on the first day.  Finally, at the end of the month, you need
to add enough days so that the final row has 7 cells.  Again, be careful not to
add an extra row of empty cells at the end when there are just enough days to
fill the calendar.  There are dozens of other good ways to
go about all this, so if you don't like this one, take a look at some of the high
scoring submissions, as they provide a number of alternative methods.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3436&amp;rd=6529" name="3436">NthFraction</a></b>
</font>
<A href="Javascript:openProblemRating(3436)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      124 / 184 (67.39%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      101 / 124 (81.45%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 486.46 points (4 mins 45 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      332.31 (for 101 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This was my favorite problem out of the bunch, as it was simple to state, and if
you saw how to do it, it was also quite simple to solve, which led to some
amazing scores.  The trick to it was to notice that there are the same number of
fractions in the set that are between 0 and 1, as there are between 1 and 2, and
between any pair of adjacent integers.  For example, consider the case where
<tt>bound = 4</tt>.  Between every pair of adjacent integers <tt>x</tt> and
<tt>x+1</tt>, we have the following fractions, which can also be
expressed as improper, reduced fractions, a/b:
<pre>
    x, x+(1/4), x+(1/3), x+(1/2), x+(2/3), x+(3/4), x+1
</pre>
Now, lets say there are <tt>K</tt> reduced fractions between each pair of adjacent
integers (only counting one of the boundaries).  Then, to find the
<tt>N<sup>th</sup></tt> fraction, we can use integer division to find
<tt>N/K</tt>, which gives us integral part of the fraction to be returned.
Next, to find the fractional part of the return, we find the
<tt>N%K<sup>th</sup></tt> smallest fraction between 0 and 1.  Finally, add the
two together and return the result.  The only missing piece of the puzzle is:
how do we calculate <tt>K</tt>, and how do we find the <tt>N%K<sup>th</sup></tt> smallest
fraction between 0 and 1.  The answer is brute force.  With a bound of no more
than about a 1000, there are clearly no more than a million fractions between 0
and 1, and in fact there are much fewer (around 300 thousand).  With two nested
for loops, and a GCD function, we can simple enumerate all of the possible
fractions, make sure they are reduced, and then sort them once we have them all.
The only subtlety to this is that there is no fraction primitive, so unless
you've got your own fraction class handy (and many TopCoders do), you'll have to
deal with sorting the fractions.  An alternative to this is to just use doubles,
but then you have to convert from a double to a fraction before you return the
result (doubles have plenty of precision in this case).  In any event, the basic
idea remains the same - use brute force to count all the fractions up to 1, and
then use the division and modulus operators to compute the return.<br/><br/>
An even better, but much trickier, solution can be seen in Eryx' code.  Rather
than finding all the fraction and then sorting, he simply generates them in
order!  If you look at his code, the recursive sbpush method inserts all
fractions between an/ad and bn/bd into his list, in order.  In order to
accomplish this, he successively splits the interval, inserting things from the
lower half first.  So, on the first call, he goes from 0/1 to 1/1.  He splits
this into 0/1 to 1/2 and 1/2 to 1/1.  Then, the first of these is further split
into 0/1 to 1/3 and 1/3 to 1/2, and so on.  At each step, he first generates
everything from an/ad to (an+bn)/(ad+bd), and then generates everything from
(an+bn)/(ad+bd) to bn/bd.  Its a bit more difficult to prove that this method
does in fact generate all of the relevant fractions, but it can be done, though
I'll leave it as an excercise.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3501&amp;rd=6529" name="3501">Driving</a></b>
</font>
<A href="Javascript:openProblemRating(3501)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      32 / 184 (17.39%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      16 / 32 (50.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 596.95 points (27 mins 38 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      470.43 (for 16 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
There are two different approaches that most coders took to this problem.  In
both approaches, you need to be able to figure out the cost of a specific speed.
The linear interpolation method mentioned in the problem is left sort of vague,
so you have to figure out the details of the math.  However, its fairly simple,
if you are interpolating a function, <tt>f(x)</tt>, and want to find the value
of <tt>f(c)</tt>
between two points, <tt>a &lt; b</tt>, then you find how far <tt>c</tt> is from
<tt>a</tt>, as a fraction of
the distance from <tt>a</tt> to <tt>b</tt>: <tt>(c-a)/(b-a)</tt>.  You then multiply this by the difference
<tt>(f(b)-f(a))</tt>, and finally add <tt>f(a)</tt> to the result.  With this part of the problem
done, you still have to minimize the function.  If you consider a sorted list of
all of the speeds in the input, you should look at the interval between each
pair of adjacent speeds in the list separately.  Within one of these intervals,
if you look carefully at the cost function, you
will notice that it is of the form <tt>a+bx+c/x</tt>.  The minima will be at the
point where the derivative is 0, so we can find the derivative,
<tt>b-c/x<sup>2</sup></tt>, and then solve <tt>x = sqrt(c/b)</tt>.  If we find
each such value of x for all of the intervals, and check those along with all of the speeds in
the input, we are then guaranteed to find the minimum.<br/><br/>
An alternative to this approach, which does not require calculus and derivatives
is to do a ternary search.  This is similar to a binary search, except that it
is used on functions that are concave (like a quadratic, they have a single
minima or maxima).  To find the minima of a function <tt>f(x)</tt> between to
points, <tt>a &lt; b</tt>, you can use something like the following:
<pre class="code">
    min = a;
    max = b;
    while(max &gt; min+EPSILON){
        double s1 = (2*min+max)/3;
        double s2 = (min+2*max)/3;
        if(f(s1) &lt; f(s2)){
            max = s2;
        }else{
            min = s1;
        }
    }
</pre>
The idea here is that, at each iteration you chop off one third of the search
interval.  Because the function is concave, you are guaranteed that the third
you chop off will not contain the minima.  If you're not convinced, try drawing
out a few cases, and notice that no matter how you pick the two points to test,
cutting off the section as defined by the above algorithm will always leave the
minima in the search interval.<br/><br/>
Regardless of which approach you took, you needed to figure out the
interpolation, and then realize the form of the function you were dealing with.
If you got these two steps, and knew one of the two approaches mentioned above,
the details of the implementation were not too bad.
</p>

                        <p>
                        <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
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
