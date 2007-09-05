   <%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder</title>
<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
         <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="node" value="long_editorials"/>
         </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div class="bodyText" style="width: 100%; text-align: left;">

    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Match Editorials"/>
    </jsp:include>

<div style="float: right;" align="right"><A href="/longcontest/?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="506256" message="Discuss this match" />
</div>

<span class="bodySubtitle">Marathon Match 10</span><br>01.17.2007 - 01.31.2007
<br><br>

<img src="/i/m/jdmetz_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
by <tc-webtag:handle coderId="7459326" /><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<span class="bodySubtitle"><A href="/longcontest/?module=ViewProblemStatement&compid=6617&rd=10692">DiscretizedContinuousPacMan</A></span>
<br><br>

<h3>Introduction</h3>
<p>
In this game of PacMan, your program controls the PacMan on a 10,000x10,000
grid while he tries to eat a wandering piece of fruit and not get eaten by
the four ghosts that are following predetermined strategies to chase him.
The PacMan and ghosts can each move to any point on the grid that is within
100 units from their current position. Any objects within 75 units of each
other are considered to be touching, and any touching objects are removed from the
board.  Ghosts and PacMan respawn immediately, while the fruit has a 10%
probability of respawning during any turn it is not on the board.
</p>
<h3>Strategy</h3>
<p>
There are four ways to gain or lose points in this game, and our strategy will
need to address each of those.  PacMan gets 10 points for eating the fruit,
and 1 point for each ghost when two or more ghosts kill each other.  PacMan
loses 10 points if a ghost eats the fruit or if a ghost kills PacMan.
</p>
<h4>Eat the Fruit</h4>
<p>
The easiest part of this game is eating the fruit.  Each turn we could look at
every location that is within 100 units of PacMan's current location and choose
the one that is closest to the fruit.  The number of points can be reduced
considerably by only looking at those on the perimiter of this circle, and even
further by only looking within a certain angular distance of the vector from
PacMan to the fruit.  I looked at all points on the perimeter that had an x or y
coordinate within 8 units of the direct line to the fruit.  Once you get close
enough, any point within 75 units of the fruit will do.  Finally, when there is
no fruit on the board, we will go towards the center of the board to be as close
as possible to where the next fruit will appear.
</p>
<h4>Avoid the Ghosts</h4>
<p>
Once your PacMan is well fed, you will notice that he often gets killed
by ghosts touching him.  This costs you points but it can also hurt you indirectly, because PacMan often respawns farther from the fruit than he was before he was
killed.  It turns out that it is quite easy to stay alive, since the ghosts all
follow predetermined algorithms to try to get as close to PacMan as they can.
To stay ahead of them, simply calculate all of the possible positions each ghost could move to then
choose a new location for PacMan that is more than 75 units away from the
current position of every ghost, and from any of their possible positions on the
next turn.  This time, we can just look at all positions on the perimeter of the
100-unit circle from PacMan, or on the perimeter of a 76-unit circle from each
possible ghost position.  I found that by using only the PacMan 100-unit circle,
my PacMan was killed by a ghost only once in about 15,000 test cases on average.
</p>
<h4>Don't Eat My Fruit</h4>
<p>
Fortunately, the ghosts don't really want to eat fruit -- they just want to
kill PacMan.  Unfortunately, they can eat the fruit multiple times
each game on their way to kill PacMan.  This is even worse than a ghost killing
PacMan -- you lose 10 points and the fruit may respawn farther away, but it
might also be a while before the fruit respawns at all.  At least when PacMan
is killed you can count on him to respawn in the next turn.  Using empirical testing, I found that
PacMan was often approaching the fruit horizontally or vertically when it was
eaten by a ghost.  So, whenever I found that a ghost and I were approaching the
fruit horizontally or vertically from opposite sides, and the ghost was closer,
I tried to keep PacMan at least 175 units away from the fruit in a direction such that the ghost passes the fruit on its way to kill PacMan.  This
reduced the number of times ghosts 1, 2, and 4 ate the fruit, but didn't have
much affect on ghost 3.  So, I implemented a similar strategy whenever the fruit
was close to the straight line between PacMan and ghost 3.  Overall, these
avoidance maneuvers were able to cut in half the number of times the fruit was
eaten by ghosts.
</p>
<h4>Kill the Ghosts</h4>
<p>
If you looked at the breakdown of where points were coming from, you would find
that on average, 1740 points were earned from PacMan eating the fruit, 20 lost
to ghosts eating the fruit, none lost to PacMan being killed by ghosts, and
about 525 gained from ghosts killing each other.  That is quite a few
points that we get almost for free, just by chasing the fruit and avoiding the
ghosts when they get too close.  What if we changed our strategy, ignored the
fruit, and just tried to get ghosts to kill each other?  We will do this by
going towards the 2nd closest ghost, since the closest one will follow us.  I
found that I could get about 950 points using this strategy.  So, we definitely
still need to make eating the fruit our primary goal, but there must be a way
to get some more of those extra 425 points.  Watching my PacMan on the visualization tool, I saw that there
were many times in each test case when PacMan would be followed halfway across
the board by two ghosts that stayed too far apart to kill each other until
PacMan turned around after eating the fruit.  I decided to try turning around
in such cases and making the ghosts kill each other before chasing the fruit.
I found that, by doing this, I would gain some points from ghosts killing each
other but lose some from not eating as much fruit.  After much tweaking
of parameters, I was able to gain another 60 points while only losing 30.
</p>
<h3>Optimizations</h3>
<p>
At the beginning of each turn, I checked to see if the fruit was in danger of
being eaten by a ghost.  I also checked to see if two ghosts were close enough
to me that PacMan could kill them quickly, but not so close that they would
kill each other without my intervention.  (This, by the way, was the only part
of my algorithm that looked ahead more than the next move.)  If neither of
these was the case, I computed the point that PacMan should move to to get
closest to the fruit.  If this point was at least 175 units from every ghost,
I didn't bother computing the next positions of the ghosts.  Because of this,
the majority of the time my PacMan was simply moving as fast as possible
towards the fruit, and my program wasn't computing much else.  This allowed it
to complete each test case in an average of about 0.5 seconds, which brings me
to my final point.
</p>
<h3>Score Variability</h3>
<p>
In this problem, the score on a test case could vary quite a bit depending on
where PacMan, the ghosts, and the fruit were placed and when and where they
respawned.  This made it difficult to tell if one algorithm was better than
another, since small changes quickly resulted in the fruit and ghosts
respawning in completely different places and at different times.  To
compensate for this, I would test competing algorithms on sets of 5000 test
cases.  The score on 20 test cases for a submission could only be taken as a
very rough estimate.
</p>
<h3>Conclusion</h3>
<p>
Unique games provide everyone an opportunity to come up with unique algorithms.
Early on in this competition, I was worried that I would exhaust all my ideas
as soon as I had fruit chasing and ghost avoidance down.  I was pleasantly
surprised to find that I was still working hard at implementing and testing
various ideas up until the night before this two week competition ended.
Thank you, TopCoder, for an interesting competition, and especially for the
visualization tool, which had my whole family watching as PacMan easily
sidestepped ghosts on his way to fill up on fruit.
</p>
   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<jsp:include page="../foot.jsp"/>
</body>
</html>