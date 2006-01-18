<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505599" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 163</span><br>Monday, September 8, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<p>
Division 1 saw a feeding frenzy as most contestants completed a paint-by-numbers Level One 
problem and a mildly tricky Level Two with
ample time to spare. In the early running, <b>tomek</b> and <b>SnapDragon</b> led
the pack by slim margins. The tempo grew less hectic as coders plodded
through a Level Three specification torn from the pages of a bureaucratic
standard for week numbering. <b>jpo</b> and <b>Smiley=)</b> found, at length, that a
Java utility class could be tweaked to satisfy the shifted calendar,
but <b>bladerunner</b> pieced together an iterative solution that propelled
him ahead of the usual suspects and onto the winner's podium. Hot on
<b>bladerunner</b>'s heels was <b>tomek</b>, whose rating converged closer yet with
that of <b>SnapDragon</b>, the latter's elegant Level Three effort having
succumbed to an initialization bug.
</p>
<p>
The stalwart coders of Division 2 did well on a Level Three problem
cloned from the upper division's Level Two. Few stumbled on the Level
One, and many contended happily with their Level Two calendar problem,
a less than daunting affair leavened by the spirit of Elvis. Although
<b>bokbok</b> blazed with a fury through the first two problems, it was
<b>carambola5</b> who eked out a win over a clutch of other seasoned
competitors.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b>Inchworm</b>
</font><A href="Javascript:openProblemRating(1799)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505599" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      199 / 207 (96.14%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      165 / 199 (82.91%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>bokbok</b> for 248.34 points (2 mins 19 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      218.72 (for 165 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Ready for some nifty arithmetic? Begin by noting that the inchworm's point
of departure coincides with the first leaf on the branch. Subsequently,
a meal ensues at every distance that is divisible by the inchworm's
travel increment and by the leaves' growth interval. In other words,
we are looking for common multiples of <i>rest</i> and <i>leaf</i>. In last week's
match summary, <b>schveiguy</b> taught us that the lowest common multiple can
be calculated by
</p>
<pre>
    def lcm(rest, leaf):
        return rest / gcd(rest, leaf) * leaf
</pre>
<p>
where the greatest common denominator <i>gcd</i> is given, for example, by the
following recursive function.
</p>
<pre>
    def gcd(rest, leaf):
        if (leaf == 0):
            return rest
        return gcd(leaf, rest%leaf)
</pre>
<p>
Then we determine how many times the lowest common multiple fits into
the branch length, adding 1 to account for the initial leaf, so that
the total number of leaves eaten is calculated as follows.
</p>
<pre>
    def eaten(branch, rest, leaf):
        return branch / lcm(rest, leaf) + 1
</pre>
<p>
Those who are not so keen on factoring can forge ahead with a brute-force
approach. Since the longest branch is only a million inches long, it won't
take long to carry out a simulation. The following pseudocode shows how
we can advance the inchworm's position by <i>rest</i> until she falls off the
branch, all the while keeping track of how many distances are divisible
by <i>leaf</i>.
</p>
<pre>
    def eaten_sim(branch, rest, leaf):
        meals = 0
        pos = 0
        while (pos &lt;= branch):
            if (pos%leaf == 0):
                meals = meals+1
            pos = pos+rest
        return meals
</pre>


<font size="+2">
<b>CalendarRecycle</b>
</font><A href="Javascript:openProblemRating(1847)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505599" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      134 / 207 (64.73%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      85 / 134 (63.43%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>bokbok</b> for 456.07 points (8 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      313.26 (for 85 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
If two years start on the same day of the week, do they share a
calendar? It depends. If one is a leap year and the other is not, then
the weekdays fall out of sync at the end of February. But if both years
start on the same day of the week, and neither is a leap year or both are
leap years, then the weekdays march in lockstep from January 1 through
December 31.
</p>
<p>
The funny thing is that if we want to find the nearest future year that
shares a calendar with a given year, it isn't necessary to know what
weekday the given year starts on. Let us say, for the sake of argument,
that January 1 of this year is a Sunday. Now, what day of the week is
January 1 of the next year? If this is not a leap year, then 365 days
later, the weekday will have shifted by 365%7 = 1 day to Monday. But if
it is a leap year, the weekday shifts by 366%7 = 2 days to Tuesday. We
can apply the same reasoning year after year until we find one that
begins on a Sunday and has the same leap-year status as the original year.
</p>
<p>
We reach the same result regardless of whether we begin by assuming that
the given year starts on a Sunday or a Wednesday or anything else! Even
the choice of January 1 is arbitrary. We might just as well proceed on
the basis of, say, September 8.
</p>
<p>
We also use modulo arithmetic to identify leap years. In the following
pseudocode, <i>weekday</i> is initially 0 to indicate that some fixed
day in the initial year is a Monday.
</p>
<pre>
    def elvis(year):
        weekday = 0
        leap = 0
        if ((year%400 == 0) or ((year%100 != 0) and (year%4 == 0))):
            leap = 1
        yy = year
        ww = weekday
        while (1):
            yy = yy+1
            ww = (ww+1)%7
            ll = 0
            if ((yy%400 == 0) or ((yy%100 != 0) and (yy%4 == 0))):
                ll = 1
            if ll:
                ww = (ww+1)%7
            if ((ll == leap) and (ww == weekday)):
                break
        return yy
</pre>
<p>
By sheer coincidence, this pseudocode will run on a Python interpreter.
</p>


<font size="+2">
<b>Pool</b>
</font><A href="Javascript:openProblemRating(1809)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505599" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      56 / 207 (27.05%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      40 / 56 (71.43%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jnwood</b> for 882.85 points (10 mins 38 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      582.77 (for 40 correct submissions)
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
      127 / 150 (84.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      110 / 127 (86.61%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>bigg_nate</b> for 471.95 points (7 mins 0 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      337.50 (for 110 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
An effective but brutal solution is to swap balls blindly, exploring the
state space via memoized breadth-first search to discover the shortest
path to a desired configuration.
</p>
<p>
A more genteel approach proceeds from the observation that productive
swaps can be made independently of one another. Any swap that exchanges
two improperly placed balls is just as helpful in restoring order as
any other swap of two misplaced balls.
</p>
<p>
Suppose we want to form the first type of rack, where position 0 is
occupied by a stripe. If the eight-ball is not at position 4, we begin
by swapping it with whatever ball is usurping its rightful place. This
pretender ball may again end up in an improper location, but the effort
of swapping it later is equivalent to the effort it would have taken to
swap it before moving the eight-ball.
</p>
<p>
Once the eight-ball is in place, we need merely swap misplaced stripes
with misplaced solids. Since there are 14 stripes and solids altogether,
at most 14/2 = 7 swaps are made at this stage. If it requires <i>k</i> swaps such
that <i>k</i> >= 4, we see that we were working toward the wrong configuration,
since the other kind of rack, where stripes are exactly exchanged
for solids, would have required 7-<i>k</i> &lt; 4 swaps.
</p>
<p>
So we decide to make <i>k</i> or 7-<i>k</i> swaps, whichever is less, and add 1 if the
eight-ball was out of place. In sum, no more than 4 swaps are required
to rack any triangle.
</p>


<font size="+2">
<b>Rochambo</b>
</font><A href="Javascript:openProblemRating(1810)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505599" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      149 / 150 (99.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      148 / 149 (99.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 246.47 points (3 mins 24 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      211.76 (for 148 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The most clearheaded way to interpret the opponent's history is that
you win each time he makes the move you expect him to make. There's
no need to figure out what move you should make in response. (For the
first two moves, it's enough to know that you're expecting the opponent
to play Scissors.)
</p>
<p>
If you insist on calculating the ideal move at every turn, find the
character immediately following that of the opponent's move in the string "PSR", where R wraps around to P.
</p>
<p>
That's all, folks. No wonder the submission success rate was better
than 99%.
</p>


<font size="+2">
<b>CalendarISO</b>
</font><A href="Javascript:openProblemRating(1811)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505599" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      40 / 150 (26.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      20 / 40 (50.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>bladerunner</b> for 742.24 points (18 mins 6 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      568.67 (for 20 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The concept of the calendar week forms a small part of ISO 8601, a
standard for representing terrestrial dates and times. Sharp-eyed
readers will have noted that ISO is not a strict abbreviation of
"International Organization for Standardization", in the same way that
UTC matches neither the English "Universal Coordinated Time" nor the
French "Temps Universel Coordonne". Such is the ISO.
</p>
<p>
When calculating
ISO week numbers by hand, the chief difficulty is that although most
years have 52 calendar weeks, some have 53. It helps to observe that
such a "long year" can only be one that begins or ends on a Thursday,
since a leap year has 366=52*7+2 days and a non-leap year has 365=52*7+1.
Consider that in a non-leap year, if January 1 is a Thursday, then
exactly 52 weeks later comes another Thursday, hence the start of a 53rd week.
</p>
<p>
Under the Gregorian calendar, ISO week numbers can be calculated by
closed-form functions such as the following.
</p>
<pre>
    def week(y, m, d):
        a = (14-m)/12
        y = y+4800-a
        m = m+12*a-3
        j = d + (153*m+2)/5 + 365*y + y/4 - y/100 + y/400 - 32045
        d4 = ((((j+31741-(j % 7)) % 146097) % 36524) % 1461)
        L = d4/1460
        d1 = ((d4 - L) % 365) + L
        return d1/7 + 1
</pre>
<p>
If, as in our problem statement, the calendar is shifted by three
days, it's not obvious how such a magic formula can be adapted
to meet the new circumstances, nor how a ready-made class such as
java.util.GregorianCalendar can be employed. The motive for the three-day
shift was precisely to throw a wrench into the works.
</p>
<p>
As it was, two coders managed to harness GregorianCalendar
by a simple expedient. They set the minimal number of days in a week
to four, as required by ISO, but set the first day of the week to
Friday, three days ahead of the standard Monday. It is also possible
to use GregorianCalendar less directly, relying on it to calculate a
weekday-independent value, such as the day of the year, from which the
ISO week number may be calculated with relative ease.
</p>
<p>
The elementary solution is to start from a known calendar week and proceed
by first principles to deduce the ISO numbers of surrounding weeks. A
slightly more sophisticated approach is to manually calculate an ISO
week number in the sufficiently far past, so that one need only iterate forward
to the target. Let us, however, consider iteration in both directions.
</p>
<p>
We learn from a test case that December 26, 1642 is the first day of ISO
week 52 under the new regime. If the desired date is no earlier than this,
we can creep forward a day at a time, updating the year, month, day,
week number, and weekday as though they were wheels turning over in an
odometer. Weekdays are indexed from 1 to 7 in the pseudocode below. We
use a two-dimensional array to look up the days in a month according
to leap-year status. Notice, furthermore, that the week number rolls
over to 1 only on a Monday that falls between December 29 and January
4, inclusive.
</p>
<pre>
    months = [[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
              [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]]

    def week_forward(year, month, day):
        y = 1642; m = 12; d = 26; wd = 1; wn = 52; leap = 0
        while (1):
            if ((y == year) and (m == month) and (d == day)):
                return wn
            d = d+1 if (d > months[leap][m-1]):
                d = 1
                m = m+1
                if (m > 12):
                    m = 1
                    y = y+1
                    leap = 0
                    if ((y%400 == 0) or ((y%100 != 0) and (y%4 == 0))):
                        leap = 1
            wd = wd+1
            if (wd > 7):
                wd = 1
                wn = wn+1
                if (((m == 12) and (d &gt;= 29)) or ((m == 1) and (d &lt;= 4))):
                    wn = 1
</pre>
<p>
When creeping backward to a point earlier than the reference date,
the year-month-day odometer rolls backward. The most delicate question
is again that of updating the week number. It follows from the earlier
inference about long years that an ISO week 53 can end only on January 3,
or, in leap years, on January 2.
</p>
<pre>
    def week_backward(year, month, day):
        y = 1642; m = 12; d = 26; wd = 1; wn = 52; leap = 0
        while (1):
            if ((y == year) and (m == month) and (d == day)):
                return wn
            d = d-1
            if (d &lt; 1):
                m = m-1
                if (m &lt; 1):
                    m = 12
                    y = y-1
                    leap = 0
                    if ((y%400 == 0) or ((y%100 != 0) and (y%4 == 0))):
                        leap = 1
                d = months[leap][m-1]
            wd = wd-1
            if (wd &lt; 1):
                wd = 7
                wn = wn-1
                if (wn &lt; 1):
                    wn = 52
                    if ((d == 3) or ((d == 2) and ((y%4 == 1) and ((y%400 == 1) or (y%100 != 1))))):
                        wn = 53
</pre>
<p>
Even those who don't relish the intricacies of the ISO specification might appreciate
the underlying simplicity of our superficially quirky calendar.
</p>

<p>
<img src="/i/m/Eeyore_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="273434" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
