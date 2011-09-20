<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 422 Problem Set &amp; Analysis</title>

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
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13513">Match Overview</a><br />
    <tc-webtag:forumLink forumID="523990" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 422</span><br />Saturday, October 18, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
American (1-st, 4-th and 6-th places) and Chinese (2-nd and 3-rd places) coders occupied most of the top spots
for this SRM.
 
<tc-webtag:handle coderId="22663117" context="algorithm"/>
won the match having 5 successful challenges, 

<tc-webtag:handle coderId="22675094" context="algorithm"/>

 was second, and 

<tc-webtag:handle coderId="19849563" context="algorithm"/>

was the third with the most impressive challenge phase of the day (+375 points). Rating favorite 

<tc-webtag:handle coderId="10574855" context="algorithm"/>

was only 9-th, significantly lowering his rating.
In Division 2, 

<tc-webtag:handle coderId="21177840" context="algorithm"/> and 
<tc-webtag:handle coderId="22744865" context="algorithm"/> 
got the 1-st and 3-rd places thanks to high scores on 
all problems, while <tc-webtag:handle coderId="22656739" context="algorithm"/>  was second thanks to a +150
challenge phase.
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10072&amp;rd=13513" name="10072">MultiNumber</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10072)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523990" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      896 / 952 (94.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      536 / 896 (59.82%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>oa12gb</strong> for 247.58 points (2 mins 49 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      203.43 (for 536 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
As it often happens, to solution to the easy problem in Division 2 was pure brute force.
You try all ways to split the number into 2 parts, multiply all digits in each of the parts,
and check whether the results are the same. The only trick in this problem is to make
sure that you don't leave any of the parts empty. See <tc-webtag:handle coderId="15781230" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;cr=15781230&amp;rd=13513&amp;pm=10072">solution</a>
for an implementation.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10033&amp;rd=13513" name="10033">PrimeSoccer</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10033)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523990" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      318 / 952 (33.40%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      288 / 318 (90.57%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Archimedean1</strong> for 469.43 points (7 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      293.31 (for 288 correct submissions) 
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
      609 / 676 (90.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      606 / 609 (99.51%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>ainu7</strong> for 246.69 points (3 mins 18 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      193.17 (for 606 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem required basic knowledge of <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=probabilities">probability theory</a>
 and <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=combinatorics">combinatorics</a>. 
</p>

<p>
First, let assume we know the probability that team A will score a prime number of goals (lets call this probability Pa) and
that team B will score a prime number of goals (Pb).
Since those events are independent, the probability that at least one team scores
a prime number of goals will be equal to Pa + Pb - Pa * Pb.
</p>
<p>
Now lets try to compute the probability that a team will score a prime number of goals.
A 90-minute game contains only 18 5-minute intervals, and a team can score at most
one goal during such interval, therefore a team can score at most 18 goals. 
Now we need to find all prime numbers Pi not greater than 18, compute the probabilities
for each team to score exactly Pi goals, and sum those probabilities to get numbers
Pa and Pb. To find primes you may either use the sieve of Eratosthenes, or just pre-code 
them into an array.
</p>
<p>
The last but not the least - how to compute the probability for a team with skill S to
score exactly K goals during a game? Assume that we've selected K intervals and 
want to compute the probability that the team has scored in each of those K intervals 
and did not score during any other interval. This probability is equal to S<sup>K</sup> *
 (1 - S)<sup>(18 - K)</sup> (S<sup>K</sup> is the probability to score during K intervals, 
and (1 - S)<sup>(18 - K)</sup> is the probability not to score in any of other (18 - K) intervals).
And the last step - since there are 18! / (K! * (18 - K)!) ways to select K intervals,
the final answer is Pa = (Sum over all primes K) (18! * SkillOfTeamA<sup>K</sup> * (1 - SkillOfTeamA)<sup>(18 - K)</sup> / (K! * (18 - K)!).
Of course, to compute Pb you'll need to replace SkillOfTeamA by SkillOfTeamB.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10036&amp;rd=13513" name="10036">BirthdayCake</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10036)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523990" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      145 / 952 (15.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      21 / 145 (14.48%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>unbing</strong> for 838.05 points (13 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      575.97 (for 21 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Brute force problems are my favorites - check all possibilities (different cakes with exactly <strong>K</strong> ingredients), 
find the one which will be eated by the largest number of friends and return. 
Oops, unfortunately we can have too many fruits, so we won't be able to check all possible cakes with 25 out of possible 50 ingredients
within a reasonable time limit. On the other hand, I still have a feeling this problem
can be brute-forced, and I try to use a brute-force solution when possible - since
it is the easiest to implement and to verify.
</p>
<p>
If we can't check all possible cakes, maybe we can brute-force over the answer?
There can be at most 20 friends, which screams 2^N algorithm. 
What if we'll try all possible groups (subsets) of friends, computing the number of 'bad' fruits 
(a fruit is bad if at least one person of the subset will not eat it). 
Then we discard subsets which result in less than K good fruits and return the 
maximal number of friends in other subsets.
</p>
<p>
The idea sounds good, but we need to make sure the solution will run in time. 
You can easily optimize computing the number of friends in a group, 
store the fruits someone doesn't like as a bitmask, memoize the fruits which are
not liked by a group, don't check the groups which contain less people than the best
answer we've already found, etc. 
You can even try binary searching over the answer, when on each step of binary search
you check only groups of the same number of people.

See <tc-webtag:handle coderId="22723036" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;cr=22723036&amp;rd=13513&amp;pm=10036">solution</a>
for an implementation.

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10123&amp;rd=13513" name="10123">CavePassage</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10123)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523990" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      324 / 676 (47.93%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      81 / 324 (25.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>bmerry</strong> for 403.67 points (14 mins 37 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      264.75 (for 81 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem is a mix of a classical algorithm (BFS) and a complicated implementation.
In therms of graph theory, the problem asks us to find the shortest path in a weighted graph, where
each vertex is described by two parameters: the set of people who are on the entrance of the cave and 
by the position of the map (whether a person with a map is on the entrance or on the exit of the cave).
In the initial position everybody is in the entrance and map is on the entrance as well, and at the end
all people are at the exit with the map. Edges between vertices correspond to groups which pass through the cave,
and you must be very careful to add only those groups which are allowed to do so.
</p>
<p>
To make your sol run in time, you may want precompute some oftenly used values - like the time 
needed by a group to pass the cave (time needed for group of people A, B, ... Z to pass the cave is equal to the maximum
of two numbers - the time needed for group B, ... Z, which can be memoized, and the time for person A) or check whether the group can pass through.
On the other hand, be careful not to "overoptimize" your solution. One of the most common mistakes 
was assuming the optimal solution will never require more than one person to carry the map back to the entrance.
See <tc-webtag:handle coderId="251074" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;cr=251074&amp;rd=13513&amp;pm=10123">solution</a>
for an implementation.

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9751&amp;rd=13513" name="9751">WorkersOnPlane</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9751)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523990" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      89 / 676 (13.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      31 / 89 (34.83%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>crazyb0y</strong> for 856.98 points (12 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      577.63 (for 31 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem can be split into several logical parts. First, you need to parse the input, and enumerate all workers, silver and gold mines.
Second, you need to check which mines can be assigned to each worker (this can be done, for example, by running a simple BFS starting at each of the workplaces). 
</p>
<p>
And the last but not the simplest - you need to assign mines to the workers in an optimal way. 
If you were to assign workers to only one type of mines (for example, silver ones), you would have used
bipartite matching algorithm, which was used multiple times in previous TopCoder problems. 
Since this problem asks you to assign workers to two differents types of resources, so you'll need 
to use a general version of bipartite matching - <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=maxFlow">maximal flow algorithm</a>.
</p>
<p>
First intention is to build a graph to represent our problem. This part is simple - each mine and each workplace will
represent a vertex, and a worker vertex will be connected to a mine vertex only if the corresponding mine
is reachable by worker. Since we want each unit of the flow to come through worker vertex and two mine
vertices of different types, we may want to force it by connecting the source of the flow to all gold mines, 
and connecting all silver mines to the sink. To make sure that each mine is used only once, we will
set the capacity of all edges to one unit.
</p>
<p>
It seems the graph we built will solve our problem, but after some testing you may notice it sometimes returns answers greater than the correct one.
For example, for K = 5 and the following map:
</p>
<pre>
SS
W.
GG
</pre>
<p>
our algorithm will return 2. It is easy to find the reason: our graph looks as the following 
(blue circle represents source, yellow - gold mines, black - worker, grey - silver mines, green - sink).
</p>
<center><img src="/i/education/srm422_flow.jpg" /></center>
<p>
It is clear why we do return 2: because our network allows worker to work on 2 gold and 2 silver mines at ones. We need to change 
our network a bit to limit workers to at most one gold and one silver mine. This can be done by adding a special vertex
for each worker, connecting it to the initial worker vertex by an extra edge of capacity one, and redirecting 
all worker's flow through that edge:
</p>
<center><img src="/i/education/srm422_flow2.jpg" /></center>
<p>
Once you get the idea and build a proper network, the rest of the solution is just implementing a reasonably 
fast maximal flow algorithm, which shouldn't be a problem if you got so far (if it IS a problem, 
just implement it 3-5 times and the problem will disappear. The examples of the implementation can be found either in our tutorial,
or in <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=299006&amp;rd=13513&amp;pm=9751&amp;cr=10574855">solution</a>).
</p>
<br />


<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
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
