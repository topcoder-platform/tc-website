<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder</title>
<jsp:include page="/script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="level1" value="long_contests"/>
        <jsp:param name="level2" value="topcoder_editorials"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div class="bodyText" style="width: 100%; text-align: left;">

    <jsp:include page="/page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Match Editorials"/>
    </jsp:include>

<div style="float: right;" align="right"><A href="/longcontest/?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505878" message="Discuss this match" />
</div>

<span class="bodySubtitle">Marathon Match Beta</span><br>12.15.2005 - 12.22.2005
<br><br>

<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<span class="bodySubtitle"><A href="/longcontest/?module=ViewProblemStatement&compid=5503&rd=9874">CostlySorting</A></span>
<br><br>

Sorting is a classic problem, and algorithms for it have been investigated since
the dawn of computers.  A very early result tells us that if the only
information we have comes from comparing two items, it will take at least O(N lg
N) comparisons to sort a list, in the worst case.  This result comes from
information theory.  After making the first i comparisons, there is some set S
of possible orders that are consistent with those i comparisons.  For comparison
i+1, there is some S' &sube; S such that all the orders in S' are consistent
with one of the outcomes of the comparison.   Naturally, the orders in the set
S-S' are all consistent with the other outcome of the comparison.  In the worst
case, the result of the comparison will be such that the consistent orders after
comparison i+1 are always the those in the larger of S' and S-S'.  Therefore,
it is best if the sorting algorithm chooses a comparison such that S' and S-S'
are exactly the same size.  If the algorithm can do this, then each comparison
will remove exactly half of the consistent orders.  Since there are N! orders
to begin with (before any comparisons are made), the number of comparisons
needed must be at least the number of times that N! must be halved before it is
1 or less.  This number is found by taking log<sub>2</sub>(N!).  By using <a
href="http://mathworld.wolfram.com/StirlingsApproximation.html">Stirling's
Approximation</a>, we know that this is roughly N log<sub>2</sub> N, for large
N.
<br><br>
This analysis gives us a hint about how to solve the problem.  We would like
roughly half of the orders to be eliminated by a comparison, regardless of its
outcome.  You might wonder if this is really best in the average case, since the
analysis above is only for the worst case.  If a fraction p of the cases are
left after one outcome of the comparison, and a fraction 1-p are left after the
other outcome of the comparison, then the expected number of cases left after
the comparison is p<sup>2</sup>+(1-p)<sup>2</sup>.  This function is minimized
when p = 0.5.  Thus, splitting the cases in half is best in both the average and
worst cases. Of course, this is a greedy method.  Picking the comparison that
splits S in half is a good strategy, but it is not necessarily the best.
Luckily, many simple sorting algorithms come close to the theoretical limit, so
it is reasonable to expect that our greedy selection will be good.
<br><br>
But this is just a start.  In order to have an algorithm, we need to define
two things.  First, how to we find p, the fraction of orders that a particular
outcome of a comparison are consistent with.  Second, once we have p for all
possible comparisons, how do we decide which one to use.  The first one is
probably the simpler of the two questions.  An effective way (used by the
winner, BradAustin) is to simply generate a large number of permutations that
are consistent with what is already known.  From these permutations, we simply
count how many times the comparison occurs one way, and how many times it occurs
the other way.  This Monte Carlo method isn't perfect, but we can generate
enough permutations (over 1000) within the timelimit to make it pretty good.
An alternative approach was used by SnapDragon (the second place finisher) and
is described <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=508413&start=75&mc=118#521087">here</a>.
<br><br>
Once we have found a good approximation of p for a particular comparison, we
would like to assign a score to that comparison that is based on the value of p,
and the cost of the comparison.  We know that we want to eliminate
half of the possible order, but if this is very expensive, it might be
better to make a slightly skewed comparison.  The question is exactly
what sort of tradeoff to use between cost and information gained.
There are a number of different ways to do this, but I'll just
describe those used by the first and second place finishers.
<br><br>
BradAustin used a variant on the classic entropy equation from information
theory.  On average, a split yields <tt>-p lg(p) - (1-p) lg(1-p)</tt> bits of information.With k bits of information, you can
encode 2<sup>k</sup> different things (orders in this cases).  The
goal, of course, is to get enough bits of information so that
2<sup>k</sup> &ge; N! and the correct order can be determined.
Naturally we want to do this as cheaply as possible.  Thus, we make
comparisons that give bits of information at the lowest cost, dividing
the entropy formula by the cost of the comparison to get the bits
gained per cost.  The way BradAustin uses the formula is slightly
different, as he essentially assumes that the outcome of the comparison
will be the worst case outcome, instead of the average case outcome.
Thus, his score is simply <tt>-lg(max(p,1-p)) / cost</tt>.  It's not
quite clear why this works better than using the more standard entropy
formula.  The main effect of using this variant is that even more
emphasis is put on finding comparisons that divide S in
half.
<br><br>
SnapDragon, on the other hand, uses an even simpler formula:
p*(1-p)/cost.  This has the same property as the other formulas in
that it is maximized at p = 0.5.  It also places a bit more emphasis
on dividing S in half than the standard entropy formula, though not as
much as the worst case version BradAustin used.
<br><br>
In the end it seemed like all of the top submissions used some
variation on the same scheme.  A greedy algorithm selected the best
comparison based on some score derived from the cost and the
information likely to be yielded by the comparison.  Comparisons that
are either too expensive, or that don't yield very much information
are not made.  It's hard to say why some methods worked better than
others, though it seems like perhaps the thing that set SnapDragon and
BradAustin apart was that they estimated the fraction p better than
most competitors.  The fact that their score functions were pretty
different seems to suggest that a good estimation of p is more
important than a good score function, though its hard to say much with
any certainty.
<br><br>
It is interesting to note a few other things about the results.  A
simple solution that many people came up with was to make comparisons
from cheapest to most expensive, skipping comparisons that yield no
new information.  This simple algorithm gave submissions a score of
40.41, indicating that they cost only a quarter more than the best
submissions, on average.
<br><br>
In addition, many competitors worried that the best submissions would
just be the best submissions on the small test set, not the best
submissions in general.  To investigate this, I ran the top 3
submissions on 1116 randomly generated cases.  Using the same scoring
system, BradAustin got 1100.75 points, SnapDragon got 1100.14 points,
and lyc1977 got 1086.82 points.  Though it's possible that some
submission other than the top 3 got unlucky, these results suggest that
BradAustin and SnapDragon did indeed have the best submissions in
general, and that they were roughly equal.
<br><br>
Another interesting experiment is to compare the top submissions to a
solution that makes the optimal comparison at each stage.  An optimal
comparison is one that minimizes the expected cost of the whole
process, given the known information.  Of course, doing this is hard
(or the problem wouldn't be interesting), but we can do it for a small
number of elements.  Unfortunately, I don't see how to solve the
problem optimally for more than 7 elements.  But, for sorting just 7
elements on 56 random cases, an optimal solution scored 54.3228, while
BradAustin scored 53.3325 and SnapDragon scored 53.5088.  While the
optimal solution is definitely a little bit better, it seems that the
submitted solutions are very close to optimal, at least for a small
number of elements.
<br><br>
   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="/public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<jsp:include page="/foot.jsp"/>
</body>
</html>