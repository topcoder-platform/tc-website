<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="505987" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 312</span><br>Saturday, July 22, 2006
<br><br>

<h2>Match summary</h2>
<p>Division 1 coders faced a 250-pointer that didn't stop them for long, but that was definitely not the case with the 500-pointer and the 1050-pointer. 
Eventually <tc-webtag:handle coderId="16056363" context="algorithm"/> enjoyed his first win thanks to 4 successful challenges!</p>
<p>As the coding proceeded, most of the coders managed to submit the 500-pointer, many managed to resubmit it, too. In the closing minutes
several 1050's were in, although not for long. The challenge phase saw more than a half of 1050's and 500's go down, completely
changing the standings. So did the systests. In the end <tc-webtag:handle coderId="16056363" context="algorithm"/> was followed by 
<tc-webtag:handle coderId="8416646" context="algorithm"/> (another 4 successful challenges here). The only coder
solving the 1050-pointer, <tc-webtag:handle coderId="8394868" context="algorithm"/>, came 3rd.
Surprisingly, targets
could not book places on the top of the standings today. </p>
<p>Division 2 coders faced a geometry-oriented set, with both 500-pointer and 1050-pointer having geometric origin. 
That couldn't trick the duo of newcomers, <tc-webtag:handle coderId="22628829" context="algorithm"/> and 
<tc-webtag:handle coderId="22627696" context="algorithm"/>, taking the top two spots from 
regular div2 competitors.</p>
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6584&amp;rd=9992" name="6584">EsperantoNumbers</a></b>
</font>
<A href="Javascript:openProblemRating(6584)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505987" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      474 / 517 (91.68%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      362 / 474 (76.37%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>stupidcoder</b> for 248.32 points (2 mins 20 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      201.90 (for 362 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>This problem was pretty straightforward. The solution should carefully
address several different cases: where x is 1 through 10, where x is 11 through 19,
where x ends in 0, and the remaining x's. For an implementation of this
approach, see <tc-webtag:handle coderId="11818890" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=249239&rd=9992&pm=6584&cr=11818890">solution</a>.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6498&amp;rd=9992" name="6498">ParallelepipedUnion</a></b>
</font>
<A href="Javascript:openProblemRating(6498)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505987" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      331 / 517 (64.02%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      263 / 331 (79.46%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>pinc</b> for 480.88 points (5 mins 42 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      315.75 (for 263 correct submissions) 
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
      399 / 406 (98.28%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      380 / 399 (95.24%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 247.46 points (2 mins 53 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      205.77 (for 380 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>There were two approaches available. First approach took advantage
of the fact that coordinates were integer and not more than 100. We separate the 
entire space into unit cubes, and for each unit cube check if it belongs to at
least one of the parallelepipeds. Then the volume of the union is the total 
number of such unit cubes. For an implementation of this
approach, see <tc-webtag:handle coderId="251074" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=249209&rd=9992&pm=6498&cr=251074">solution</a>.</p>
<p>Second approach was based on the formula for the volume of a parallelepiped:
the volume of a parallelepiped is a product of lengths of three edges going from
any its vertex. When transformed to the xyz-form, it becomes 
V=(z2-z1)&sdot;(y2-y1)&sdot;(x2-x1). To compute the volume of the union, we first
just add up the volumes of both parallelepipeds. In case these parallelepipeds
do not intersect, we're already there. In case they do, we've counted the 
intersection volume twice and need to subtract it to get the correct answer.
To find the intersection volume, we note that the intersection of two
parallelepipeds is also a parallelepiped (possibly singular, like segment or 
rectangle), and thus the same formula can be applied. To understand why this is
the case, simply realize that the parallelepiped is a set of points (x,y,z)
satisfying the following constraints: x1&le;x&le;x2, y1&le;y&le;y2, z1&le;z&le;z2; suppose
we have a second one of the form x3&le;x&le;x4, y3&le;y&le;y4, z3&le;y&le;z4 &mdash; one can
deduce now that the intersection is specified by the inequalities
max(x1,x3)&le;x&le;min(x2,x4), max(y1,y3)&le;y&le;min(y2,y4), max(z1,z3)&le;z&le;max(z2,z4),
also following the same pattern. For an implementation of this
approach, see <tc-webtag:handle coderId="8355516" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=249223&rd=9992&pm=6498&cr=8355516">solution</a>.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6493&amp;rd=9992" name="6493">PizzaDivision</a></b> </font> <A href="Javascript:openProblemRating(6493)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505987" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      25 / 517 (4.84%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      7 / 25 (28.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dyatlov</b> for 716.37 points (19 mins 35 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      441.63 (for 7 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>For all the geometric stuff required for this problem refer to
<tc-webtag:handle coderId="159052" context="algorithm"/>'s 
<a href="/tc?module=Static&d1=tutorials&d2=geometry1">tutorial</a>.</p>
<p>Let's follow the solution for this problem step-by-step. First, we need a 
function that checks whether two given points are mirror images of each other
for the given cut. It can be easily seen what we can only consider cuts passing
through the point of origin O(0,0) (because the pizza must be cut into equal halves), 
so each cut can be specified by any point on 
it, or, in other words, by its direction vector. Suppose the direction vector of
the cut is V(x<sub>0</sub>,y<sub>0</sub>), and the points given are 
A(x<sub>A</sub>,y<sub>A</sub>) and B(x<sub>B</sub>,y<sub>B</sub>).
What we need to check is whether the cut passes through the middle of AB
and is perpendicular to AB. The middle point of AB is: C((x<sub>A</sub>+
x<sub>B</sub>)/2,(y<sub>A</sub>+y<sub>B</sub>)/2), and cut passing through
it means vectors V and OC are collinear, i.e. their cross product is zero, i.e.
x<sub>0</sub>(y<sub>A</sub>+y<sub>B</sub>)/2-y<sub>0</sub>(x<sub>A</sub>+
x<sub>B</sub>)/2=0, i.e. x<sub>0</sub>(y<sub>A</sub>+y<sub>B</sub>)-y<sub>0</sub>(x<sub>A</sub>+
x<sub>B</sub>)=0. The cut being perpendicular to AB means the dot product
of the vectors V and AB is zero, i.e. x<sub>0</sub>(x<sub>B</sub>-x<sub>A</sub>)+y<sub>0</sub>(y<sub>B</sub>-
y<sub>A</sub>)=0.</p>
<p>Now that we're past the geometric part of the problem (almost), it becomes
simpler. Using the function described above, we construct a function that
checks whether the given cut is beautiful. It just iterates over all toppings, and
checks whether there exists a mirror image for them (in case the topping is right
on the cut, it will be the mirror image for itself).</p>
<p>Now that we can check whether a cut is beautiful or not, all we need is to 
find all possible candidates for being beautiful. For example, pick any topping X
that has at least one nonzero coordinate; it must have a mirror image. So we can
iterate over all other toppings and try to consider them as a mirror image to X;
we should also consider the case when it's the mirror image of itself. When 
we've
fixed one pair of mirrored points, the cut is uniquely determined (it's the middle
perpendicular to the corresponding segment), so we can
check it for beauty. To simplify the formula for finding middle perpendicular, we can
note that mirror images must be equidistant from the point of origin, and thus the
direction vector for middle perpendicular to X(a,b)Y(c,d) has coordinates (a+c,b+d).
The latter formula for finding the direction vector also works when X=Y. </p>
<p>This problem's constraints also allowed a more straighforward approach:
just check all the possible direction vectors with both coordinates integer and not 
exceeding 1000 by absolute value. To understand why this is enough, reread
the previous paragraph :)</p>
<p>See <tc-webtag:handle coderId="22627696" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=249237&rd=9992&pm=6493&cr=22627696">solution</a> for an implementation of the
former approach.</p>
<p>It seems intuitive (and I can't find a counterexample) that the answer for this problem
is always -1,0,1,2 or 4. I have an idea how to prove it, related to irrationality of e<sup>&pi;i/n</sup> 
for integer n >= 3, but could not make the proof formal, nor could I find a solution that relies
on this fact. The reader is invited to bridge this gap :)</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6501&amp;rd=9992" name="6501">AntarcticaPolice</a></b>
</font>
<A href="Javascript:openProblemRating(6501)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505987" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      282 / 406 (69.46%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      79 / 282 (28.01%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gawry</b> for 387.57 points (16 mins 19 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      252.98 (for 79 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>The first observation we need is that if there's a town with no incoming roads,
we definitely need a police station there. Let's make this more generic. 	We'll require some graph
theory definitions here, as we'll consider Antarctica as a directed graph, and one-way roads 
as edges in it.</p>
<p>A directed graph is called <i>strongly connected</i>, if for every pair or vertices u and v
there exist paths from u to v and from v to u. The <i>strongly connected components</i> of a directed
graph are its maximal (one can't add any more vertices to it) strongly connected subgraphs. For example,
consider a graph with 6 vertices A,B,C,D,E and F, and edges A-->B, B-->C, C-->D, D-->E, E-->F, F-->E, 
E-->D, B-->A. Then it has three strongly connected components: one with vertices {A,B}, vertex C itself,
and one with vertices {D,E,F}. Strongly connected components have several useful properties, one of them
being each cycle in the graph belongs entirely to one of the strongly connected components. An easy
way to find strongly connected components is Floyd-Warshall's algorithm (see 
<tc-webtag:handle coderId="268851" context="algorithm"/>' 
<a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs3#floydWarshall">tutorial</a>).</p>
<p>Let's separate all edges of the graph into two groups: <i>internal</i> edges are between vertices in
the same strongly connected component, <i>external</i> edges are all others.
Consider any strongly connected component in our graph without any incoming external edges. Let's call
such components <i>starter</i> components. 
Then we must build at least one police station there, because these vertices are not reachable from
outside. And if we must - why not build the cheapest one? To prove this, consider the case when
we don't build the cheapest station X, but build some other station Y in this component. Let's flatten
the station Y, and build X instead. X and Y are in the same strongly connected component, thus X is
reachable from Y and vice versa, thus "reachability" didn't change, but the average cost decreased (or
stayed the same if Y had the same cost as X). So it's always good to take the cheapest station in each
starter component.</p>
<p>Moreover, if we build at least one police station in each starter component, then all towns are
already reachable by police. The formal proof is left to the reader, but the general idea is as follows.
Consider any town. If it's in a starter component, then it's reachable from the station we built there. If it's not in the 
starter component, then its component has an incoming external edge. If that edge originates in a starter
component, then our vertex is reachable from the police station in that component. Continuing this "reverse"
path on external edges, we'll eventually finish in a starter component, and thus complete the proof.</p>
<p>So, what do we have now? We've already built a police station, the cheapest one, in each starter 
component, and all towns are already reachable by police. In case we were required to minimize the total 
cost, that would be enough. But it may happen that we can build some extra stations to lower the average
cost. More specifically, if there is a station that is cheaper that the current average cost, then 
building it is good for us. So what we do is take the cheapest station that's not already built and 
build it, and repeat this process until the cost of the cheapest station left is more than the current
average cost. That completes the solution for this problem. The proof of this 'greedy' part is left to the reader,
as this proof goes just along the lines of the proof above about taking the cheapest station in each
starter component.</p>
<p>See <tc-webtag:handle coderId="9906220" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=249214&rd=9992&pm=6501&cr=9906220">solution</a> for an implementation of this approach.</p>
<p>Coders taking part in the match have found many other solutions for this problem, check the 
<a href="http://forums.topcoder.com/?module=Thread&threadID=512163">forum</a> for some of those.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6482&amp;rd=9992" name="6482">CheapestIsland</a></b>
</font>
<A href="Javascript:openProblemRating(6482)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505987" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1050 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      27 / 406 (6.65%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 27 (3.70%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>rem</b> for 447.47 points (50 mins 35 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      447.47 (for 1 correct submission) 
    </td>
  </tr>
</table></blockquote>
<p>Let's imagine if the field was no larger than 4x4. What we could do was to consider all the possible
2<sup>16</sup> subsets of the set of the cells, and check each for connectedness.  This could be written
as the following recursive function:</p>
<p><tt>[01]int rec(x, field)&nbsp;{<br/>
[02]&nbsp;&nbsp;if (x >= height * width) {<br/>
[03]&nbsp;&nbsp;&nbsp;&nbsp;check the field for connectedness<br/>
[04]&nbsp;&nbsp;&nbsp;&nbsp;if it's connected, return zero, else return infinity<br/>
[05]&nbsp;&nbsp;} else {<br/>
[06]&nbsp;&nbsp;&nbsp;&nbsp;set current_min to infinity<br/>
[07]&nbsp;&nbsp;&nbsp;&nbsp;mark cell x as taken in field<br/>
[08]&nbsp;&nbsp;&nbsp;&nbsp;if [cost of cell x + the return value of rec(x + 1, field)] is less than current_min, assign it to current_min<br/>
[09]&nbsp;&nbsp;&nbsp;&nbsp;mark cell x as not taken in field<br/>
[10]&nbsp;&nbsp;&nbsp;&nbsp;if the return value of rec(x + 1, field) is less than current_min, assign it to current_min<br/>
[11]&nbsp;&nbsp;&nbsp;&nbsp;return current_min<br/>
[12]&nbsp;&nbsp;}<br/>
[13]}</tt></p>
<p>We could calculate the cost of the field after checking it for connectedness, but 
this 'accumulating' way is more convenient for the following.
Now let's suppose it was 5x5 or even 6x6. How to improve the previous approach? By adding an early
exit to the recursive function. Namely, if we can determine that there's no way to make the current
field connected, we can safely return infinity. And this is the case when there exists a connected component
in the processed part of the field that is not reaching the bottomline of the processed part. For example, 
we could return infinity at the following point (pluses are taken cells, minuses are not taken cells,
dots are yet undecided cells):</p>
<p><tt><font size=+2>--<font color="blue">+++</font>--<br/>
-<font color="blue">++</font><font color="orange">--++</font><br/>
<font color="orange">---</font>....<br/>
.......</font></tt></p>
<p>Blue pluses show the connected component that is already not reaching the bottomline 
(highlighted with orange color). </p>
<p>	This is a good improvement, but not yet enough to process 9x9 testcases.
Let's look closer at the bottomline notion we introduced. Do we really need to pass the entire
field into the recursive calls at the lines 8 and 10 of the above code? The answer is no. What we're
interested in is what cells are taken on the bottomline and which of them are connected between each other.
For example, the two following cases are really the same for us (the return value will be the same):</p>
<p><tt><font size=+2>+++++--&nbsp;&nbsp;+++----<br/>
+++--++&nbsp;&nbsp;+-+--++<br/>
+-+....&nbsp;&nbsp;+-+....<br/>
.......&nbsp;&nbsp;.......</font></tt></p>
<p>as in both cases the bottomline contains 4 pluses at the columns 0, 2, 5 and 6, 0 and 2 are connected, and
5 and 6 are connected. Considering this, let's rewrite our function the following way:</p>
<p><tt>[01]int rec(x, bottomline)&nbsp;{<br/>
[02]&nbsp;&nbsp;if (x >= height * width) {<br/>
[03]&nbsp;&nbsp;&nbsp;&nbsp;if all the taken cells in the bottomline are connected, return zero, else return infinity<br/>
[04]&nbsp;&nbsp;} else {<br/>
[05]&nbsp;&nbsp;&nbsp;&nbsp;set current_min to infinity<br/>
[06]&nbsp;&nbsp;&nbsp;&nbsp;mark cell x as taken in bottomline, correctly maintaing connectedness<br/>
[07]&nbsp;&nbsp;&nbsp;&nbsp;if [cost of cell x + the return value of rec(x + 1, bottomline)] is less than current_min, assign it to current_min<br/>
[08]&nbsp;&nbsp;&nbsp;&nbsp;mark cell x as not taken in the bottomline, correctly maintaining connectedness<br/>
[09]&nbsp;&nbsp;&nbsp;&nbsp;if the above procedure didn't result in a connected component losing reach to the bottomline, then:<br/>
[10]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if the return value of rec(x + 1, bottomline) is less than current_min, assign it to current_min<br/>
[11]&nbsp;&nbsp;&nbsp;&nbsp;else<br/>
[12]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if the component losing reach to the bottomline was the only one, and current_min is positive, set it to zero<br/>
[13]&nbsp;&nbsp;&nbsp;&nbsp;return current_min<br/>
[14]&nbsp;&nbsp;}<br/>
[15]}</tt></p>
<p>bottomline pseudo-variable holds information about what cells are taken in the bottomline 
and their interconnections. Line 3 is the new way of checking if the field is connected: anything above
the bottomline is connected because we've reached the current state, so we just check the bottomline.
Line 9 is the early exit check, and line 13 is for finding the components that don't reach the bottom row of
the grid.</p>
<p>Only one step is left between our solution and the correct solution. Can't you guess?
We need to memoize the results of function rec!
It appears that there are &lt;200000 possible rec parameters for a 9x9 board. With some more
thinking one can convert memoized solution to a DP solution, and the latter appears even easier 
in this case. A DP solution could be formulated in different terms, but it is essentially
the same as the recursive approach with memoization, so one could choose the way he likes to implement
more. Writing the state of that DP formally (that is, writing formally what 'rec' returns) and inventing
a way to store the 'bottomline' are left as good exercises for the reader.</p>
<p>See <tc-webtag:handle coderId="8394868" context="algorithm"/>'s only passing <a href="/stat?c=problem_solution&rm=249215&rd=9992&pm=6482&cr=8394868">solution</a> 
as an example of another possible approach, moving row-by-row instead of moving cell-by-cell. It is slower, but
could be optimized to pass, too.</p><div class="authorPhoto">
    <img src="/i/m/Petr_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10574855" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
