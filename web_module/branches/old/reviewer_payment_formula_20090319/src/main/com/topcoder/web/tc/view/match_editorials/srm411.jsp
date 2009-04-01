<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 411 Problem Set &amp; Analysis</title>

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
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=12183">Match Overview</a><br />
    <tc-webtag:forumLink forumID="522384" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 411</span><br />Wednesday, July 23, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
In Division 1, many coders submitted solutions for the easy and medium problems very quickly. But the hard one turned out to be difficult when it received only six submissions, and none of them survived both the challenge and system test phases. Coders had to rely on their skill to challenge other coders to claim good places. At the end, with three successful challenges, <tc-webtag:handle coderId="144400" context="algorithm"/> won the match with less than two points ahead of <tc-webtag:handle coderId="22628392" context="algorithm"/>, who got five successful challenges. <tc-webtag:handle coderId="10597114" context="algorithm"/> secured the third place with fast submissions on the first two problems and a successful challenge.
</p> 

<p>
Coders in Division 2, in the other hand, faced an easy 900-point problem. With fast submissions on all three problems, <tc-webtag:handle coderId="22688641" context="algorithm"/>, <tc-webtag:handle coderId="22708912" context="algorithm"/>, and <tc-webtag:handle coderId="22690033" context="algorithm"/> rounded the top three. With no challenges, they still had a safe gap of points against the other coders.
</p>

<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9753&amp;rd=12183" name="9753">MaximumScoredNumber</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9753)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522384" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
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
      562 / 627 (89.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      376 / 562 (66.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>nitdgp</strong> for 248.30 points (2 mins 21 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      186.02 (for 376 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
To solve this problem, we can use a straightforward approach which calculates the score for each number in the given range, then chooses the biggest number with the highest score. We just need to be careful when calculating the score so that no pair of numbers is counted more than once or missed out. The following Java function will return the correct score of a number:
</p>

<font face="monospace">
<font color="#804040">&nbsp;1 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;score(<font color="#2e8b57"><strong>int</strong></font> x) {<br />
<font color="#804040">&nbsp;2 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;cnt = <font color="#ff00ff">0</font>;<br />

<font color="#804040">&nbsp;3 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>&nbsp;(<font color="#2e8b57"><strong>int</strong></font>&nbsp;i = <font color="#ff00ff">0</font>; i*i &lt;= x; i++)&nbsp;{<br />
<font color="#804040">&nbsp;4 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;j&nbsp;=&nbsp;(<font color="#2e8b57"><strong>int</strong></font>)&nbsp;Math.floor(Math.sqrt(x - i*i));<br />
<font color="#804040">&nbsp;5 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font>&nbsp;(i&nbsp;&lt;=&nbsp;j&nbsp;&&&nbsp;i*i+j*j&nbsp;==&nbsp;x)&nbsp;cnt++;<br />
<font color="#804040">&nbsp;6 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
<font color="#804040">&nbsp;7 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font> cnt;<br />
<font color="#804040">&nbsp;8 </font>&nbsp;&nbsp;&nbsp;&nbsp;}
</font>
<p>
The condition (i &lt;= j) in line 5 ensures that no pair of numbers will be counted twice. To make the solution faster and easier to write, instead of calculating the score for one number at a time, we can sacrifice some memory to be able to calculate the scores for all numbers at the same time:
</p>
<font face="monospace">
<font color="#804040">&nbsp;1 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>[]&nbsp;score&nbsp;=&nbsp;<font color="#804040"><strong>new</strong></font>&nbsp;<font color="#2e8b57"><strong>int</strong></font>[upperBound + <font color="#ff00ff">1</font>];&nbsp;<font color="#0000ff">// all elements are initialized to zeroes</font><br />
<font color="#804040">&nbsp;2 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>&nbsp;(<font color="#2e8b57"><strong>int</strong></font>&nbsp;i = <font color="#ff00ff">0</font>; i &lt;= <font color="#ff00ff">100</font>; i++)<br />
<font color="#804040">&nbsp;3 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>&nbsp;(<font color="#2e8b57"><strong>int</strong></font>&nbsp;j = <font color="#ff00ff">0</font>; j &lt;= i; j++)<br />
<font color="#804040">&nbsp;4 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font>&nbsp;(i*i+j*j &lt;= upperBound) score[i*i+j*j]++;
</font>
<p>
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8692&amp;rd=12183" name="8692">SentenceDecomposition</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8692)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522384" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      207 / 627 (33.01%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      87 / 207 (42.03%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>maksay</strong> for 528.35 points (10 mins 45 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      329.72 (for 87 correct submissions) 
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
      463 / 491 (94.30%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      383 / 463 (82.72%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>blackmath</strong> for 244.24 points (4 mins 22 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      188.07 (for 383 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This is a <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=dynProg">dynamic programming (DP)</a> problem since:
<ul>
<li>we can solve it by solving the similar subproblems with shorter sentences. If it is possible to translate <strong>sentence</strong> to a sequence of valid words, we can always remove the first valid word after being transformed from <strong>sentence</strong> to obtain a sub-problem with a shorter <strong>sentence</strong>.</li>
<li>it is possible to memorize the results of the subproblems. If we meet a subproblem which has been solved before, it won't be computed again. Since we always remove transformed valid words from the beginning, the length of the current <strong>sentence</strong> is good enough to describe a subproblem.</li>
</ul>

<p>
The only thing left is to check if a word can be transformed to another word, and at what cost. A simple checking is to sort the letters of each word in the same order (ascending or descending in alphabet order), then compare if the two sorted words are equal. If they are equal, they can be transformed to each other. The cost can be computed by simply counting the positions where the two words differ.
</p>

<p>
<tc-webtag:handle coderId="144400" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=298124&amp;rd=12183&amp;pm=8692&amp;cr=144400">solution</a> is a good reference. The only difference between his code and the above idea is that he removed a transformed valid word from the end of the current <strong>sentence</strong> instead of from the beginning.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9752&amp;rd=12183" name="9752">HoleCakeCuts</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9752)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522384" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      900 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      92 / 627 (14.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      21 / 92 (22.83%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>mRefaat</strong> for 744.04 points (13 mins 36 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      523.81 (for 21 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

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
      365 / 491 (74.34%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      214 / 365 (58.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>ahyangyi</strong> for 477.48 points (6 mins 13 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      308.71 (for 214 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
There are several approaches to solve this problem:
</p>
<h3>Approach 1</h3>
<p>
Flood-filling by Depth-first search (DFS) or Breadth-first search (BFS) is used to count the number of pieces. The cake can be divided into many unit squares (each has a side length of 1), and a piece is a maximal connected group of  unit squares which has the property that no common border (if existing) between any two squares in the group lies on a cut. So from a unit square of some piece we can visit all other unit squares belonging to that piece by limiting DFS or BFS not to cross any cut while travelling between squares. See <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=298121&amp;rd=12183&amp;pm=9752&amp;cr=10574855">solution</a> for a clean implementation of this approach.
</p>

<h3>Approach 2</h3>
<p>
This approach also counts one piece at a time, but in another way. First we sort the arrays of cuts and then examine each pair of consecutive horizontal cuts <strong>horizontalCuts[i]</strong> and <strong>horizontalCuts[i+1]</strong> and each pair of consecutive vertical cuts <strong>verticalCuts[i]</strong> and <strong>verticalCuts[i+1]</strong>. Those four cuts make up a rectangle which may or may not intersect with the hole. There are few special cases:
</p>
<p>
If the rectangle is inside the hole (its sides can touch the sides of the hole), there is no piece inside that rectangle. The figures below give two examples for this case, one is completely inside the hole while the other one touches the borders of the hole:
</p>
<p align="center">
<table>
<tr><td><img src="/i/education/srm411_holecakecuts_case_1_1.jpg" alt="srm411_holecakecuts_case_1_1.jpg" /></td>
<td width="30"></td>
<td><img src="/i/education/srm411_holecakecuts_case_1_2.jpg" alt="srm411_holecakecuts_case_1_2.jpg" /></td></tr>
</table>
</p>
<p>
If the rectangle is cut by two opposite sides of the holes, there are two pieces inside the rectangle. The pieces are highlighted in orange:
</p>
<p align="center">
<table>
<tr><td><img src="/i/education/srm411_holecakecuts_case_2_1.jpg" alt="srm411_holecakecuts_case_2_1.jpg" /></td>
<td width="30"></td>
<td><img src="/i/education/srm411_holecakecuts_case_2_2.jpg" alt="srm411_holecakecuts_case_2_2.jpg" /></td></tr>
</table>
</p>
<p>
In all the other cases, there will be exactly one piece inside the rectangle. So by examining all such rectangles, we can count the number of cake pieces divided by the given cuts. See <tc-webtag:handle coderId="22628392" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=298134&amp;rd=12183&amp;pm=9752&amp;cr=22628392">solution</a> for an implementation of this approach.
</p>

<h3>Approach 3</h3>
<p>
Another approach which has a smaller time complexity is to reduce the original problem to a problem with a cake and no hole. This can be done by finding two horizontal cuts:
<ul>
<li>the horizontal cut which is inside the hole and closest to the top side of the hole. It can be the cut going through the top side of the hole.</li>
<li>the horizontal cut which is inside the hole and closest to the bottom side of the hole. It can be the cut going through the bottom side of the hole.</li>
</ul>
These two cuts (which may be the same cut) together with the vertical sides of the hole divide the outer square of the cake into four rectangles each of which can be considered as a cake with no hole. The fifth rectangle in the center always contains no pieces. The four rectangles are colored differently in the following illustration:
</p>
<p align="center"><img width="300" src="/i/education/srm411_holecakecuts_approach_3.jpg" alt="srm411_holecakecuts_approach_3.jpg" /></p>
<p>
If the two horizontal cuts of interest cannot be found, we can search for two vertical cuts with similar properties. And if, again, we cannot find the cuts, we can safely remove the hole from the original cake to obtain a reduced problem.
</p>

<p>
Solving a reduced problem is trivial. We just count the numbers of horizontal and vertical cuts which completely cut through the cake (not going through any border of the cake), add one to each number, and then multiply them together to get the number of pieces.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=7620&amp;rd=12183" name="7620">MinimumTours</a></strong> 
</font> 
<a href="Javascript:openProblemRating(7620)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522384" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
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
      6 / 491 (1.22%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 6 (0.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td> 
  </tr> 
</table></blockquote> 
<p>
After reading the problem statement, our intuition tells us that this looks like a graph problem. The critical point is to find out how the graph should be constructed. If only islands are used to build the graph, it is hard to find an algorithm to work on that graph. But if both islands and seas are used, we can obtain a special graph which is easier to work on: a tree.
</p>
<p>
The tree has two types of nodes: island nodes and sea nodes. An island node can be visited only once, but a sea node can be travelled through as many times as we want. If an island connects to a sea in the map, there will be an edge connecting them in the graph. There are no edges between two islands or two seas.
</p>

<p>
Starting from any island, we use Depth-first search (DFS) to travel through the tree. At each node <strong>x</strong>, assuming that all islands of the subtree having <strong>x</strong> as the root have been optimally assigned to tours, we can calculate the status for <strong>x</strong>:
<ul>
<li>If <strong>x</strong> is an island node, let's consider all tours assigned to the subtree:
    <ul>
    <li>If there is a tour starting at some island (not <strong>x</strong>) in the subtree and ending at <strong>x</strong>, <strong>x</strong> will have the status of 1. This tour can still be extended to end at some island outside of the subtree.</li>
    <li>If there is a tour both starting and ending at <strong>x</strong>, the status of <strong>x</strong> will be 2. This tour can be extended to start and/or end at islands outside of the subtree</li>
    <li>If <strong>x</strong> has been assigned to some tour which starts and ends inside the subtree, it will have the status of 0. No tour can be extended to other nodes outside of the current subtree.
    </ul>
</li>
    
<li>If <strong>x</strong> is a sea node, again, let's consider all tours assigned to the subtree:
    <ul>
    <li>If there is a tour starting at some island in the subtree and ending at an island node which is a direct child of <strong>x</strong>, <strong>x</strong> will have the status of 1. This tour can still be extended to the father node of <strong>x</strong> and other nodes outside of the current subtree.</li>
    <li>If there is a tour which does not start or end at a direct child nodes of <strong>x</strong>, but travel through the sea represented by <strong>x</strong>, then <strong>x</strong> will have the status of 2. This tour can be easily extended to cover the father of <strong>x</strong>, but not any other nodes outside.</li>
    <li>Other than the above two cases, <strong>x</strong> has the status of 0. No tour can be extended.
    </ul>
</li>
</ul>
</p>

<p>
Using DFS we can recursively calculate the statuses for all nodes, and along the way we can determine the optimal number of tours needed. The following pseudo-code describes how it can be done:
</p>

<font face="monospace">
<font color="#804040">&nbsp;1 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font> visitIsland(<font color="#2e8b57"><strong>int</strong></font> x)  <font color="#0000ff">// return the status of island node x</font><br />
<font color="#804040">&nbsp;2 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cnt1 = <font color="#ff00ff">0</font>;<br />
<font color="#804040">&nbsp;3 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;has2 = <font color="#ff00ff">false</font>;<br />
<br />
<font color="#804040">&nbsp;4 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for each</strong></font> y <font color="#804040"><strong>in</strong></font> the set of child (sea) nodes of x<br />
<font color="#804040">&nbsp;5 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;status_y = visitSea(y);<br />
<br />
<font color="#804040">&nbsp;6 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font> (status_y == <font color="#ff00ff">1</font>) cnt++;<br />
<font color="#804040">&nbsp;7 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font> (status_y == <font color="#ff00ff">2</font>) has2 = <font color="#ff00ff">true</font>;<br />
<font color="#804040">&nbsp;8 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>end for</strong></font><br />
<br />
<font color="#804040">&nbsp;9 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font> (cnt1 == <font color="#ff00ff">0</font>)<br />
<font color="#804040">&nbsp;10 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font> (has2 == <font color="#ff00ff">true</font>) <font color="#804040"><strong>return</strong></font> <font color="#ff00ff">0</font>; <font color="#804040"><strong>else return</strong></font> <font color="#ff00ff">2</font>;<br />
<font color="#804040">&nbsp;11 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>else if</strong></font> (cnt == <font color="#ff00ff">1</font>)<br />
<font color="#804040">&nbsp;12 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font> <font color="#ff00ff">1</font>;<br />
<font color="#804040">&nbsp;13 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>else</strong></font><br />
<font color="#804040">&nbsp;14 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;result += cnt1 - <font color="#ff00ff">1</font>; <font color="#0000ff">// two child nodes are connected through x</font><br />
<font color="#804040">&nbsp;15 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font> <font color="#ff00ff">0</font>;<br />
<font color="#804040">&nbsp;16 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>end if</strong></font><br />
<font color="#804040">&nbsp;17 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>end function</strong></font><br />
<br />
<br />
<font face="monospace">
<font color="#804040">&nbsp;18 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font> visitSea(<font color="#2e8b57"><strong>int</strong></font> x)  <font color="#0000ff">// return the status of sea node x</font><br />
<font color="#804040">&nbsp;19 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cnt1 = <font color="#ff00ff">0</font>;<br />
<font color="#804040">&nbsp;20 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;has2 = <font color="#ff00ff">false</font>;<br />
<br />
<font color="#804040">&nbsp;21 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for each</strong></font> y <font color="#804040"><strong>in</strong></font> the set of child (island) nodes of x<br />
<font color="#804040">&nbsp;22 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;status_y = visitSea(y);<br />
<br />
<font color="#804040">&nbsp;23 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font> (status_y == <font color="#ff00ff">1</font>) cnt++;<br />
<font color="#804040">&nbsp;24 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font> (status_y == <font color="#ff00ff">2</font>) has2 = <font color="#ff00ff">true</font>;<br />
<font color="#804040">&nbsp;25 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>end for</strong></font><br />
<br />
<font color="#804040">&nbsp;26 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#0000ff">// each pair of two child nodes with status of 1 can be connected</font><br />
<font color="#804040">&nbsp;27 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;result += cnt1 / <font color="#ff00ff">2</font>;<br />
<br />
<font color="#804040">&nbsp;28 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font> (cnt1 == <font color="#ff00ff">0</font>)<br />
<font color="#804040">&nbsp;29 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font> (has2 == <font color="#ff00ff">true</font>) <font color="#804040"><strong>return</strong></font> <font color="#ff00ff">1</font>; <font color="#804040"><strong>else return</strong></font> <font color="#ff00ff">0</font>;<br />
<font color="#804040">&nbsp;30 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>else if</strong></font> (cnt1%<font color="#ff00ff">2</font> == <font color="#ff00ff">1</font>)<br />
<font color="#804040">&nbsp;31 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font> <font color="#ff00ff">1</font>;<br />
<font color="#804040">&nbsp;32 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>else</strong></font><br />
<font color="#804040">&nbsp;33 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font> <font color="#ff00ff">2</font>;<br />
<font color="#804040">&nbsp;34 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>end if</strong></font><br />
<font color="#804040">&nbsp;35 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>end function</strong></font><br />
<br />
<br />
<font color="#804040">&nbsp;36 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#0000ff">// root is any island node</font><br />
<font color="#804040">&nbsp;37 </font>&nbsp;&nbsp;&nbsp;&nbsp;result = 0;<br />
<font color="#804040">&nbsp;38 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font> (visitIsland(root) != <font color="#ff00ff">0</font>) result++;<br />
</font>
</font>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/hken_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10413344" context="algorithm"/><br />
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
