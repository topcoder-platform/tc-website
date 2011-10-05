<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 417 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13508">Match Overview</a><br />
    <tc-webtag:forumLink forumID="523296" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 417</span><br />Thursday, September 11, 2008
<br /><br />



<h2>Match summary</h2> 


<p> 
In the first division competitors faced a technical easy problem, a tricky hard, and a medium where they had to choose between two completely different approaches.
<tc-webtag:handle coderId="9941146" context="algorithm"/> enjoys his first match victory thanks to his good performance on all three problems. He was followed by <tc-webtag:handle coderId="22671864" context="algorithm"/> and <tc-webtag:handle coderId="15812946" context="algorithm"/>.
Victory in the second division went to <tc-webtag:handle coderId="22693715" context="algorithm"/>.
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9925&amp;rd=13508" name="9925">ReversedSum</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9925)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523296" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      795 / 866 (91.80%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      716 / 795 (90.06%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>KnightOfTheSun</strong> for 249.27 points (1 mins 32 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      212.96 (for 716 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem is about how to implement the <em>Rev(x)</em> function.
This can be done in many ways.
The "classic" aporoach is illustrated in <tc-webtag:handle coderId="22714770" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;cr=22746599&amp;rd=13508&amp;pm=9925">solution</a>. Another approach is to convert integers to strings,
reverse them, and parse the integers back. See <tc-webtag:handle coderId="22676038" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;cr=22676038&amp;rd=13508&amp;pm=9925">C# solution</a> for the reference.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9943&amp;rd=13508" name="9943">TemplateMatching</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9943)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523296" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      234 / 866 (27.02%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      141 / 234 (60.26%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>peterLiang</strong> for 420.35 points (12 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      251.79 (for 141 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      584 / 640 (91.25%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      470 / 584 (80.48%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>arti_kz</strong> for 243.81 points (4 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      174.44 (for 470 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem was a technical one. All you needed to do was described in the problem statement: iterate over all the substrings and select the best one.
You also need to resolve ties carefully.
See <tc-webtag:handle coderId="21971539" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=298596&amp;rd=13508&amp;pm=9943&amp;cr=21971539">solution</a> for clear implementation in Java and <tc-webtag:handle coderId="19849563" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=298598&amp;rd=13508&amp;pm=9943&amp;cr=19849563">soluton</a> in C++.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9944&amp;rd=13508" name="9944">TripleJump</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9944)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523296" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      28 / 866 (3.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      3 / 28 (10.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>damnerd</strong> for 436.60 points (48 mins 10 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      359.09 (for 3 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The first thing you need to understand clearly before solving this problem is the following fact.
Consider two independent random variables X and Y, uniformly distributed over some range [A, B].
Then their sum can possess values in range [2A, 2B], but values from this range will come with different probabilities!
To illustrate this fact consider throwing two coins: the probability to get two "heads" or two "tails" is 0.25 each, but you have a 50% chance to get one "head" and one "tail".
<br />
Now let's go back to the problem. First of all let's substract the length of our first jump from all opponent's results. This will reduce the problem to a "double jump", where the length of each of the two jumps is a random variable.
The core part of the solution is implementing the following function: F(z) = probability that your two remaining jumps will have total length at least z.
Those of you who are familiar with theory of probablity might now that such function F(z) is called a <a href="http://en.wikipedia.org/wiki/Cumulative_distribution_function">distribution function</a>.
In our problem z = x + y, where x and y are random values, uniformly distributed in range [lower, upper].
Let's illustrate this on the cartesian plane Oxy.
<br /><table align="center"><tr><td><img src="/i/education/srm417_triple_jump.gif" alt="Triple Jump" /></td></tr></table><br />
F(z) is proportional to the area of the red figure above the line x + y = z. Indeed, each point inside this figure has coordinates that in sum are greater than z.
Some basic calculations allows us to find F(z) as:
<br /><table align="center"><tr><td><img src="/i/education/srm417_triple_jump_formula.gif" alt="Triple Jump Formula" /></td></tr></table><br />
Now, lets sort the opponents results in the descending order. In this case our chance to get the first plase will be F(opponents[0]). 
Chance to get second place F(opponents[1]) - F(opponents[0]), third: F(opponents[2]) - F(opponents[1])  and so on.

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9942&amp;rd=13508" name="9942">CubeNets</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9942)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523296" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      240 / 640 (37.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      130 / 240 (54.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>jbernadas</strong> for 443.34 points (10 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      278.39 (for 130 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
There are two different approaches for this problem.
The first one is just to google for "cube net" and find out that there
are only 11 distinct cube nets. After that you just need to compare the figure
from the input with these eleven "canonical" cube nets carefully. This is still not
a trivial coding task and many competitors, who selected this approach, failed it.
See <tc-webtag:handle coderId="21971539" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=298596&amp;rd=13508&amp;pm=9942&amp;cr=21971539">solution</a> for the
implementation details.
<br />
Another approach is to find any position with an '#' and "put" the cube there. After that start "rolling" the cube recursively while you have adjacent '#' cells. One each roll assign the
the cell to the surface of the cube that touches it. At the end check if all the '#' cells had an assigned surface. See <tc-webtag:handle coderId="22653044" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=298611&amp;rd=13508&amp;pm=9942&amp;cr=22653044">solution</a> for clear implementation.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9924&amp;rd=13508" name="9924">WalkingDistance</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9924)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523296" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      109 / 640 (17.03%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 109 (11.01%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>kefir</strong> for 799.98 points (15 mins 0 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      553.99 (for 12 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Let's start from an example that illustrates that both two points where the maximal walking distance is achieved are not necessary be the vertices of the graph.
<br /><table align="center"><tr><td><img src="/i/education/srm417_walking_distance.gif" alt="Walking Distance" /></td></tr></table><br />
There are several approches for this problem. But in any case we need to calculate shortest distances among each pair of vertices, and to iterate through all pairs of edges.
Now, when the two edges (let's call them AB and CD) are fixed lets find points p from AB and q from CD with the maximal possible walking distance between them.
Basicly, there are four candidates for the shortest p-q path: p-A-C-q, p-A-D-q, p-B-C-q, p-B-D-q.
If we think about p and q as a real-valued parameter in range [0, AB] and [0, CD] correspondingly, the length of the shortest path
is the minimum of four linear function of arguments p and q. Let's denote them by f<sub>1</sub>..f<sub>4</sub>.
We need to find the maximum of <em>min</em>{f<sub>1</sub>, f<sub>2</sub>, f<sub>3</sub>, f<sub>4</sub>} over all possible p and q.
For those of you who are familiar with linear programming theory it might be
obvious that to get the maximal length of the shortest path we need to check all
intersection points of lines f<sub>1</sub> - f<sub>2</sub> = 0, f<sub>1</sub> - f<sub>3</sub> = 0, f<sub>1</sub> - f<sub>4</sub> = 0, f<sub>2</sub> - f<sub>3</sub> = 0, f<sub>2</sub> - f<sub>4</sub> = 0, f<sub>3</sub> - f<sub>4</sub> = 0, p = 0, p = AB, q = 0, q = CD.
<br />
For the rest of you I suggest simplier, and actually, more efficient, approach.
It happens that the following pairs of paths are equal for the optimal values of p and q:
p-A-C-q = p-B-D-q and p-A-D-q = p-B-C-q. This can be proved from the contrary:
if this is not true we can always increase the length of the shortest path.
In this case, the length of the shortest path can be found as a half of the minimum of the two following
cycle lengths: p-A-C-q-D-B-p and p-A-D-q-C-D-p. See <tc-webtag:handle coderId="7452866" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=298606&amp;rd=13508&amp;pm=9924&amp;cr=7452866">solution</a> for clear implementation.
<br />
<tc-webtag:handle coderId="9958883" context="algorithm"/> in his <a href="/stat?c=problem_solution&amp;rm=298601&amp;rd=13508&amp;pm=9924&amp;cr=9958883">solution</a> introduced another approach, that is based on two nested ternary searches to determine p and q.
</p>

<br />


<div class="authorPhoto">
    <img src="/i/m/Pawa_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10323773" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
