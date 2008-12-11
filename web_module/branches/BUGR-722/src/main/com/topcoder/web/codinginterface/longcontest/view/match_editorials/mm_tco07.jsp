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
<tc-webtag:forumLink forumID="516304" message="Discuss this match" />
</div>

<span class="bodySubtitle">2007 TopCoder Open Marathon Match Final</span><br>06.27.2007
<br><br>

<img src="/i/m/Mojito1_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
by <tc-webtag:handle coderId="10600282" /><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<h2>The Beginning</h2>
<p>
I assume that you are all familiar with the problem statement. If not you can
find it <a href="/tc?module=Static&d1=features&d2=tco07ProblemStatement">here</a>.
It seems to look very straightforward. However, the whole problem statement is
quite long. So long that I did not manage to read it thoroughly and
thus lost some relevant issues. Luckily, my omissions were not as crucial as
<tc-webtag:handle coderId="22657262" context="marathon" />'s. He missed the third power in the gravitation
formula and during the whole event was certain that the impact of planets can
be neglected.
</p>
<p>
I believe that we all suffered from such kind of small omissions. A few
competitors (including me) did not notice that speed can be changed in the
visualizer and were wasting precious time watching painfully slow simulations.
Moreover, at least one of us (me) thought that User Interactive required us to
type commands in a similar way our programs do. Moreover, 
during the first hour and a half we were not able to run
our programs in the visualizer. During this time when <tc-webtag:handle coderId="287131" />
and <tc-webtag:handle coderId="7267401" /> were working hard fixing a bug and were
probably much more stressed by the whole situation than we were.
</p>
<p>
Finally, the visualizer became fully operational and I was able to watch the
most trivial idea in action. You can see what happens when you accelerate in
the direction of the next waypoint <a href="/contest/problem/vid1.avi">here</a>. My first submission
scored 0.6 points and was almost immediately nullified by somebody (probably
<tc-webtag:handle coderId="21932422" context="marathon" />).
</p>
<br />

<h2>Lunch</h2>
<p>
Three hours passed and what I had managed to do was: run the vizualizer, write
a program that interacts with the vizualizer, check the most trivial idea and
get frustrated because of my poor performance. Not much taking into account
the fact that only five hours were left.
</p>
<br />
 
<h2>My solution</h2>
<p>
During lunch I had plenty of time to thing about the problem, what I had been doing wrong and what should I do next. The break was very helpful as I needed only fifteen more minutes to make my first reasonable submission.
The prime decision I took was to stop my ship at each waypoint. The idea was supposed to eliminate situations when the ship misses the next waypoint by millimeters (or inches).
The formula I came up with that covered the whole process of approaching a waypoint looked as follows:
<pre>
   double speed=Math.Sqrt(distanceToWaypoint/10000);
   double accX=(xDistanceToWaypoint/distanceToWaypoint+1.2*xGravitaion)*speed-xCurrentVelocity;
   double accY=(yDistanceToWaypoint/distanceToWaypoint+1.2*yGravitaion)*speed-yCurrentVelocity; 
</pre>
</p>
<p>
The idea behind this formula is to accelerate in the direction of the target
and reach the maximal speed that still allows the ship to stop at the next
waypoint. Combining the equations <tt>s=a*t<sup>2</sup>/2</tt> and
<tt>v=a*t</tt> we have <tt>v=sqrt(s*2*a)</tt>. I
really don't remember why my actual implementation lacks the two between s and
a. I was so amazed with the formula's performance that I didn't fix its
shortcomings throughout the hours that were still remaining. If you are
interested in a better solution to the problem of traveling from one point to
another please refer to <tc-webtag:handle coderId="261024" context="marathon" />'s submission and his post
in <a href="http://forums.topcoder.com/?module=Thread&threadID=580237&start=0&mc=13">the
forum</a>.
</p>
<p>
Having the problem of hitting waypoints solved the issue of avoiding planets
gained the highest priority. My idea was to accelerate in the direction which
is perpendicular to the current gravitation. It worked astonishingly well and
was probably the $15,000 idea.
</p>
<p>
The last major improvement I managed to implement was a fuel saving mode. I
was constrained by the previously invented formula as I didn't want to change
it and spend the precious time on inventing new things that were definitely
not certain. Therefore, I decided that the ship's thruster should be turned
off when accX and accY are lower than 0.1. The idea was not the perfect one as
the ship was still wasting too much fuel. However, it was all I managed to
achieve as increasing the threshold was making the ship behave strange.
</p>
<p>
Other improvements, or rather changes as I wasn't able to judge if they were
really useful, were rather cosmetic. I was adjusting parameters, time limits
and checking approaches that finally I didn't use.
</p>
<br />

<h2>Abandoned ideas</h2>
<p>
An interesting approach that didn't receive a second chance was an idea to
always maintain an appropriate speed perpendicular to the gravitation. I
didn't even define an exact value of the appropriate speed and abandoned the
idea as it wasn't able to solve my biggest problem. The ship would still crush
after reaching waypoints that were too close to planets.
</p>
<p>
In order to solve the problem I was testing the idea of leaving the planet
system and then rush through the next waypoint with great speed. The
approach seemed to require a lot of coding and from the beginning I was
skeptical about it. Therefore, when the simplest implementation failed it was
abandoned. Currently I tend to think that it should work . However, it should
also consume a lot of fuel and time and thus seems to be useful only when it
can nullify scores of all other competitors. Note that,
<tc-webtag:handle coderId="7459326" context="marathon" /> was also testing this idea.
</p>
<br />

<h2>Winning solutions</h2>
<p>
You can find explanations of the approaches taken by <tc-webtag:handle coderId="261024" context="marathon" />
and <tc-webtag:handle coderId="7459326" context="marathon" /> in <a href="http://forums.topcoder.com/?module=Thread&threadID=580237&start=0&mc=13">the
forum</a>. <tc-webtag:handle coderId="9987185" context="marathon" />'s approach is also worth explaining as the
idea behind it is completely different and seems to be the best if we had had
more time onsite. He was checking 50 directions of thrust using the method from the problem
statement. Then he checked 50 more direction just around the previous
best. To choose the best he used a score function based on the nearest distance from
the way point and the speed at the nearest point (don't go too fast near
waypoint). The length of the path depended of the distance from the waypoint: from 20 to
4000 second (20 when very close and 400 when very far). He obviously  rejected
directions that crash on a planet. <tc-webtag:handle coderId="9987185" context="marathon" /> tried to do a sort of binary search to a the exact
best direction, but he didn't manage to make it work in time.  After the
competition <tc-webtag:handle coderId="287131" context="marathon" /> showed us his solution (obviously
written without the pressure and time constraints we faced), which used this
approach and was able to hit all the waypoints every time.
</p>
<br />

<h2>Final thoughts</h2>
<p>
Eight hours is definitely enough for the final round. We don't have to travel
to Las Vegas just to code during the whole time we are there. 
If something can be implemented in six hours it will be probably beaten by a
simpler idea that can be implemented in two hours and gradually improved
during the remaining four. Originally I wanted to write that Marathon Matches are less stressful than
Algorithms because there is no place there for bugs worth $24,000. However,
<tc-webtag:handle coderId="261024" context="marathon" /> proved that in this track bugs can also be very
expensive. Note that, <tc-webtag:handle coderId="261024" context="marathon" /> and <tc-webtag:handle coderId="7459326" context="marathon" /> are not
students and <tc-webtag:handle coderId="9987185" context="marathon" /> is losing his student status in a
couple of weeks. What is more, it seems that the majority of Marathon reds are
professionals. Feel free to draw any conclusions you want.
</p>
<br />


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