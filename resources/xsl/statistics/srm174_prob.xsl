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

<title>Single Round Match 174 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 174</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Saturday, December 13, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2>

<p>

TopCoder presented a gamblers' special on the weekend as, improbably
enough, every Division One problem dealt with chance. The horse to back
was <b>SnapDragon</b>, who galloped across the finish line after less than
thirty minutes' coding. <b>Yarin</b> would have been another good bet,
returning from his Final Four showing at the TopCoder Open (coincidentally
held in a casino) to place a distant second in this match. Half a pace
behind came <b>WishingBone</b> to complete the trifecta. Probabilistic
lunacy extended to the harder problems in Division Two, though the
easiest was a tame deterministic affair. <b>Olexiy</b> cruised through
them all for the division win, with fellow first-timers <b>monsoon</b>
and <b>pigworlds</b> rounding out the top three in a crowded field.

</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b>CrossWord</b>
</font>
<A href="Javascript:openProblemRating(2232)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      182 / 221 (82.35%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      160 / 182 (87.91%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>mpbailey</b> for 248.04 points (2 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      202.60 (for 160 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>

Given an array of strings filled with the characters '.' and 'X', we are
to count the substrings of given length that consist only of '.' and
that do not adjoin a '.' on either side. We can find all substrings
fitting this description by making a single pass over each string.
Upon encountering an 'X', we consider the number of uninterrupted
'.' characters we have seen thus far. To account for cases where a
suitable substring occurs at the very end of a string, we append a
sentinel 'X' to each.

<p></p>

<pre>
def crossword(board, size):
    seen = 0
    for row in board:
        row += 'X'
        count = 0
        for ch in row:
            if ch == '.':
                count += 1
            else:
                if count == size:
                    seen += 1
                count = 0
    return seen
</pre>

</p>

<p>

We must not forget to initialize the '.' count after seeing an 'X'.

</p>


<font size="+2">
<b>BirthdayOdds</b>
</font>
<A href="Javascript:openProblemRating(1848)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      179 / 221 (81.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      125 / 179 (69.83%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>hw_Tim</b> for 495.43 points (2 mins 44 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      356.05 (for 125 correct submissions)
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
      138 / 140 (98.57%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      106 / 138 (76.81%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>overwise</b> for 247.15 points (3 mins 3 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      217.13 (for 106 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Given the number of days in a planetary year and the number of people in
a room, we are to calculate the probability that at least two of them
share a birthday. Oops! That's not exactly what the problem says. It
asks us to calculate the number of people such that the probability of
a shared birthday reaches a given threshold. But the required number
of people in the room will not exceed the number of days in a year,
so we can start with an empty room and add people to it, calculating
the probability at each increment until we cross the threshold.

</p><p>

The superficial difficulty is that there are many ways for some set of
people to have a birthday in common. There may be one or more pairs of
people sharing a birthday, or several triples, even quadruples or greater.
We can dispose of this red herring by calculating the probability that
no two people share a birthday. There must be a shared birthday in all
other cases, so we subtract this probability from 1. Better yet, we can
leave it alone, aiming instead for 1 minus the threshold probability.

</p><p>

Just what is the probability that <i>n</i> people share no birthday
among <i>m</i> possible days? The first of these <i>n</i> people can be
born on any one of the <i>m</i> days. The second can only be born on one
of <i>m</i>-1 days remaining out of the <i>m</i> days in the year. The
third must be born on one of <i>m</i>-2 out of <i>m</i> days in the year,
and so on down to (<i>m</i>-<i>n</i>+1)/<i>m</i>. We multiply each of
these ratios to obtain the final odds.

</p><p>

<pre>
def people(threshold, days):
    threshold = 1.0 - threshold/100.0
    prob = 1.0
    i = 0
    while (prob > threshold):
        prob *= (1.0*days-i)/days
        i += 1
    return i
</pre>

</p><p>

Our calculation is simplified by the fact that we are interested in
all possible orderings of birthdays. All cases where person <i>x</i>
is born on March 3rd and person <i>y</i> on July 4th are distinct from
those where <i>x</i> is born on July 4th and <i>y</i> on March 3rd.

</p>


<font size="+2">
<b>ProbabilityTree</b>
</font>
<A href="Javascript:openProblemRating(2234)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      67 / 221 (30.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      43 / 67 (64.18%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>pigworlds</b> for 880.76 points (10 mins 45 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      580.60 (for 43 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

We are asked to compute the probability of each event in something
called a probability tree and to report which ones fall within a given
interval. There's some beating around the bush in the problem statement,
but the crucial facts are as follows.

</p><p>

Each node in the probability tree is marked with the probability <i>q</i>
that its event will occur if the event associated with its parent also
occurs, and the probability <i>r</i> that its event will occur even if
that of its parent does not. If we know the probability <i>p</i> that
the parent event will occur, we can calculate this event's probability
with the formula <i>p</i>*<i>q</i>+<i>p</i>*<i>r</i>.

</p><p>

If we don't know the probability of the parent event, we had better
wait until we've calculated it. This suggests an iterative approach in
which we make multiple passes over the nodes of the tree to calculate the
probability for every node whose parent probability is already known. We
make at least one new calculation with each pass until, finally, all
probabilities are known.

</p><p>

<pre>
def odds(tree, lower, upper):
    n = len(tree)
    indices = []
    probs = [-1] * n
    done = [0] * n
    probs[0] = float(tree[0])/100.0
    if (probs[0] &gt; lower/100.0 and probs[0] &lt; upper/100.0):
        indices.append(0)
    m = 1
    while (1):
        if (m == n):
            break
        for i in range(1, n):
            subs = tree[i].split()
            parent = int(subs[0])
            if (probs[parent] &lt; 0.0 or done[i]):
                continue
            p1 = float(subs[1])/100.0
            p2 = float(subs[2])/100.0
            probs[i] = p1*probs[parent] + p2*(1.0-probs[parent])
            m += 1
            done[i] = 1
            if (probs[i] &gt; lower/100.0 and probs[i] &lt; upper/100.0):
                indices.append(i)
    indices.sort()
    return indices
</pre>

</p><p>

The counter <i>m</i> is incremented with each new calculation until it
reaches <i>n</i>, the number of nodes. We use the strictly-greater and
strictly-less comparisons because an exclusive interval is specified. Note
also that we use a sentinel array to avoid duplicate calculation, and
that we sort the indices immediately before returning them.

</p>


<font size="+2">
<b>RangeGame</b>
</font>
<A href="Javascript:openProblemRating(2233)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      600
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      53 / 140 (37.86%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      33 / 53 (62.26%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 503.72 points (12 mins 56 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      300.57 (for 33 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

This problem is almost a generalization of the notorious brainteaser known
as Monty Hall's dilemma. Monty Hall was the host of a game show in which
the grand prize was a Mercedes Benz. If the contestant made it to the
final round of the game, she would confront three closed doors. Behind
one of them was the Mercedes, while the other two concealed a pair of
goats. The contestant would indicate her choice by pointing to one of
the doors. Instead of opening it, however, Monty Hall would open one
of the two other doors to reveal a goat. The contestant would then have
the opportunity to alter her choice of door before the final disclosure.

</p><p>

The question is whether the contestant stands to gain by switching to
the remaining door. One school of thought, a fallacious one, is that
the Mercedes is either behind the initially chosen door or behind the
other unopened one, so the contestant's chance of winning is one half
regardless of whether she changes her choice. Another fallacious line
of reasoning concludes that she has a two-thirds chance by staying with
her first choice, since Monty Hall can choose one of two doors if she
initially picked the Mercedes, but is constrained to only one if she is
standing before a goat.

</p><p>

In fact, the contestant has a two-thirds chance of winning if she
changes her selection. To see why this is so, consider the difference
between a contestant who has a policy of never switching and one who
always does. The non-switcher has a one-third chance of winning, since
she picks a door and sticks with it. The switching contestant, however,
loses only in those cases where the non-switcher would win, and wins
otherwise. An astute contestant will therefore double her chances by
switching, assuming the constraint that Monty Hall consistently reveals
a goat. In real life, the financial pressures of a television show might
make it less likely that the contestant is offered a chance to switch
when her initial choice is a door concealing a goat.

</p><p>

In the RangeGame problem, however, if the prize patterns are {"10", "20",
"30"} and the hint history is {"20"}, the answer is not {10, 20} but {10,
10}. Why the discrepancy? Note that on Monty Hall's game show, the host
will never open the door that is the contestant's initial choice. In
RangeGame, however, the host is as likely to open the contestant's
first choice as any other non-winning door. This changes the event
space in such a way that there is no longer any advantage to pursuing
the switching strategy.

</p>

<p>

The problem at hand is essentially asking us to identify the door whose
number is included in the greatest number of intervals. Because ties are
broken in favor of lower numbers, the optimal number will always be the
lowest number in some interval. This optimality principle can be proven by
contradiction. Suppose that the optimal number <i>x</i> is not the lowest
in any interval. Consider <i>x</i>-1, its lesser neighbor. If <i>x</i>-1
is included in as many intervals as <i>x</i>, then <i>x</i> is not
optimal. But if <i>x</i>-1 is included in fewer intervals, then <i>x</i>
must constitute the border of some interval and is therefore its lowest
number.  Hence, it cannot be the case that the optimal number is not the
lowest in any interval.

</p><p>

The upshot is that we can restrict our search to the lowest number in each
interval. First, let's delegate the door-pattern parsing to a helper
function. A pattern is formed of space-separated globs. We split each glob
into a pair of consecutive integers, so that the entire pattern is
represented by an integer array. Note the special case where an interval
begins and ends with the same integer.

</p><p>

<pre>
def intervals(patt):
    ret = []
    globs = patt.split(' ')
    for glob in globs:
        parts = glob.split('-')
        ret.append(int(parts[0]))
        if len(parts) == 1:
            ret.append(int(parts[0]))
        else:
            ret.append(int(parts[1]))
    return ret
</pre>

</p><p>

It's also convenient to have a function that decides whether one sequence
of intervals intersects another at any point. We step through consecutive
pairs of integers in each array, comparing them pairwise for overlap.

</p><p>

<pre>
def overlap(ar, br):
    for ai in range(0, len(ar), 2):
        for bi in range(0, len(br), 2):
            if (ar[ai] &lt; br[bi] and ar[ai+1] &lt; br[bi]):
                continue
            if (ar[ai] &lt; br[bi+1] and ar[ai+1] &gt; br[bi+1]):
                continue
            return 1
    return 0
</pre>

</p><p>

In order to find the optimal door number, we take the lower number in
each interval and double it, as it were, to make a temporary interval
that we can pass to <i>overlap</i>.

</p><p>

<pre>
def best(doors):
    max = -1
    maxlap = -1
    for door in doors:
        for i in intervals(door):
            ii = [i, i]
            lap = 0
            for d in doors:
                if (overlap(ii, intervals(d))):
                    lap += 1
            if (lap &gt; maxlap or (lap == maxlap and i &lt; max)):
                max = i
                maxlap = lap
    return max
</pre>

</p><p>

Finally, we step through the hints one by one, eliminating overlapping
doors and recalculating the optimal door number with each iteration.

</p><p>

<pre>
def guess(doors, hints):
    guesses = [best(doors)]
    for hint in hints:
        doomed = []
        for door in doors:
            if overlap(intervals(hint), intervals(door)):
                doomed.append(door)
        for door in doomed:
            doors.remove(door)
        guesses.append(best(doors))
    return guesses
</pre>

</p><p>

We use the <i>doomed</i> array to avoid modifying <i>doors</i> while we're
iterating over it.

</p>


<font size="+2">
<b>PointSystem</b>
</font>
<A href="Javascript:openProblemRating(1849)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      800
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      30 / 140 (21.43%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      21 / 30 (70.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 680.68 points (12 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      497.37 (for 21 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Given the minimum number of points and minimum lead required to
win a game, as well as the probability that the underdog wins the
point in any turn, we are to calculate the probability that the
underdog will eventually defeat his opponent. The key to solving this
problem is to envision the event space as a matrix of possible scores
(<i>x</i>,<i>y</i>) where the underdog has scored <i>x</i> points to
the favorite's <i>y</i>. We can then formulate a recurrence that uses
the probabilities of lower scores to calculate the probability of a
higher score.

</p><p>

If the underdog has chance <i>s</i> of winning any given point, the
odds that he can make the score (1,0) are exactly <i>s</i>, and the
odds of a (0,1) score are 1-<i>s</i>. What are the odds that the score
will become (1,1)? The case where the favorite catches up contributes
(1-<i>s</i>)*<i>s</i> to the probability of this event, and the case
where the underdog is the one who scores the second point contributes
<i>s</i>*(1-<i>s</i>). There are no other ways of reaching the score
(1,1) with the gain of a single point by either player.

</p><p>

In general, the odds of reaching a score (<i>x</i>,<i>y</i>)
are P(<i>x</i>,<i>y</i>) = <i>s</i>*P(<i>x</i>-1,<i>y</i>) +
(1-<i>s</i>)*P(<i>x</i>,<i>y</i>-1). We can put this formula directly
to use by implementing recursion with memoization. Alternatively, we
can start from the lowest scores and build our way up.

</p><p>

<pre>
def upset(min, lead, skill):
    skill = skill/100.0
    prob = 0.0
    odds = []
    for i in range(2001):
        odds.append(2001*[0.0])
    odds[0][0] = 1.0
    for games in range(2000):
        for underdog in range(games+1):
            favorite = games-underdog
            if (favorite &gt;= min and favorite-underdog &gt;= lead):
                continue
            if (underdog &gt;= min and underdog-favorite &gt;= lead):
                prob += odds[underdog][favorite]
                continue
            odds[underdog+1][favorite] += odds[underdog][favorite]*skill
            odds[underdog][favorite+1] += odds[underdog][favorite]*(1.0-skill)
    return prob
</pre>

</p><p>

The two <i>continue</i> clauses are vital to the correct functioning
of this program: we must skip scores that are unattainable because
the game would have ended at a prior point spread. Observe that as
<i>x</i>+<i>y</i> increases, the probability of a true underdog, with
<i>s</i> &lt; .5, attaining a score of (<i>x</i>,<i>y</i>) tends toward
zero. Experimentation shows that calculating the odds of every score up
to <i>x</i>+<i>y</i>=2000 yields sufficient precision for our purposes.

</p>


                        <p>
                        <img src="/i/m/Eeyore_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=273434"><strong>Eeyore</strong></a><br />
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

