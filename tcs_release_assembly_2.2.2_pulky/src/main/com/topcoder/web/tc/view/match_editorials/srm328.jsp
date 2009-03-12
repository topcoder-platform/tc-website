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
    <A href="/stat?c=round_overview&er=5&rd=10008">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506003" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 328</span><br>Wednesday, November 29, 2006
<br><br>

<h2>Match summary</h2>

More than 1,000 coders took the opportunity to practice their algorithmic skills and, with several targets competing, SRM 328 was bound to be an exciting event.
<br />
<br />
In Division 1 the first two problems caused little trouble, but a difficult third tripped up a lot of coders. At the end, only two coders managed to solve all three problems. <tc-webtag:handle coderId="7390224" context="algorithm"/> took home the win after edging out the coder with the most SRM wins, <tc-webtag:handle coderId="272072" context="algorithm"/>. In third came <tc-webtag:handle coderId="10544397" context="algorithm"/> with the best time on the hard, while <tc-webtag:handle coderId="2058177" context="algorithm"/> and <tc-webtag:handle coderId="15600311" context="algorithm"/>, with great times on the first two problems and some points in the challenge phase, rounded out the top five. The other two coders who solved the hard were <tc-webtag:handle coderId="344259" context="algorithm"/> and <tc-webtag:handle coderId="263396" context="algorithm"/>.
<br />
<br />
Division 2 was dominated by newcomers who took the top 3 spots: <tc-webtag:handle coderId="22660344" context="algorithm"/>, <tc-webtag:handle coderId="22658538" context="algorithm"/>, <tc-webtag:handle coderId="22658377" context="algorithm"/>. <tc-webtag:handle coderId="21290434" context="algorithm"/> and <tc-webtag:handle coderId="20877762" context="algorithm"/> rounded out the top 5.
<br />

<H1>The Problems</H1>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6855&amp;rd=10008" name="6855">MarbleNecklace</a></b>
</font>
<A href="Javascript:openProblemRating(6855)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506003" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
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
      428 / 528 (81.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      297 / 428 (69.39%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ebd</b> for 247.65 points (2 mins 46 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      194.05 (for 297 correct submissions)
    </td>
  </tr>
</table></blockquote>

To solve this problem we have to consider all descriptions equivalent to the given necklace. At first consider only the first direction of iterating through the marbles. We do exactly what we are told in the statement: loop through all starting positions <i>i</i> and build the current description by concatenating the substring starting at <i>i</i> and ending at the last character of necklace with the substring consisting of the first <i>i</i> characters. To consider the second direction as well, we have to reverse <b>necklace</b>, and then follow the same steps as above. We pick and return the smallest of these strings. One can use the built-in string compare for this. See <tc-webtag:handle coderId="8471704" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=262891&rd=10008&pm=6855&cr=8471704">solution</a> for an implementation of this algorithm. In his <a href="http://www.topcoder.com/stat?c=problem_solution&rm=262888&rd=10008&pm=6855&cr=14927099">solution</a>, <tc-webtag:handle coderId="14927099" context="algorithm"/> used the trick of concatenating the input string with itself. After that, the description considered at the <i>i</i>th step is simply the substring starting at <i>i</i> and with a length equal to the number of marbles.

<br /><br />

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7250&amp;rd=10008" name="7250">LightsCube</a></b>

</font>

<A href="Javascript:openProblemRating(7250)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506003" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      156 / 528 (29.55%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      128 / 156 (82.05%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>lacungus</b> for 427.75 points (12 mins 6 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      271.62 (for 128 correct submissions)

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

      387 / 414 (93.48%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      361 / 387 (93.28%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>SnapDragon</b> for 246.74 points (3 mins 16 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      175.93 (for 361 correct submissions)

    </td>

  </tr>

</table></blockquote>

There are several ways to approach this problem. Most coders chose to simulate the process second by second. At every second, we iterate through all squares of the cube and turn on the lights that are off and are adjacent to at least one turned-on light. See <tc-webtag:handle coderId="144400" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=262865&rd=10008&pm=7250&cr=144400">solution</a> for an example of this approach.
<br /><br />
A nicer approach, and quicker to implement, is to calculate for each light the time when it can take each of the colors in the input. Considering the way the lights spread through the cube, this is really the Manhattan distance between the positions of the two lights. We then pick the color with the minimum time, and in case of ties, the one with a lower number. See <tc-webtag:handle coderId="272072" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=262869&rd=10008&pm=7250&cr=272072">solution</a> for a nice implementation of this algorithm.
<br /><br />
The fastest solution is based on the <a href="http://en.wikipedia.org/wiki/Breadth-first_search">breadth-first search</a> on a graph whose vertices are the squares of the cube, and the edges correspond to adjacent squares. See <tc-webtag:handle coderId="21468741" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=262873&rd=10008&pm=7250&cr=21468741">solution</a>.
<br /><br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6854&amp;rd=10008" name="6854">ScoreDifference</a></b>
</font>

<A href="Javascript:openProblemRating(6854)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506003" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      15 / 528 (2.84%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      7 / 15 (46.67%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>frankpzh</b> for 632.79 points (24 mins 55 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      550.31 (for 7 correct submissions)

    </td>

  </tr>

</table></blockquote>

In this problem we are told the rules of a board game and we are asked to calculate the score difference at the end of the game assuming both players are following an optimal strategy.
<br /><br />
To solve it, we will write a recursive function <i>maximize</i> that takes as input the current board state and returns the maximum score difference that could be obtained on this board by the player to move. We will consider every valid move (ie. a piece that can be removed from the board), perform it, and recurse on the new board state. The score difference that can be obtained with this move is the difference between the point value of the piece removed by the player to move and the score difference his opponent can achieve on the new board state. We have to use substraction here, since the score difference returned by the recursion is from the opponent’s point of view. In pseudocode, the function would look in the lines of:

<pre>
maximize (boardState)
	score = -infinity
	for each valid move m
		newBoardState = performMove(boardState, m)
		score = max(score, moveScore(m) – maximize(newBoardState))
	return score
</pre>

A board state must contain information about which squares are empty and which are occupied. As experienced coders have guessed, we can use bitmasks to efficiently describe a board state. We will use 16 bits, one for each square of the board. If a square is free, its corresponding bit in the bitmask will be 0, otherwise it will be 1. To determine if a move is valid, it is easiest to use a <a href="http://en.wikipedia.org/wiki/Depth_first_search">depth-first search</a> on the graph where the vertices are the squares of the board, and the edges correspond to adjacent squares. Of course, we should memoise the function to avoid time-out. For a clean implementation of this algorithm, see <tc-webtag:handle coderId="21290434" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=262904&rd=10008&pm=6854&cr=21290434">solution</a>.
<br /><br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6852&amp;rd=10008" name="6852">BlockEnemy</a></b>
</font>

<A href="Javascript:openProblemRating(6852)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506003" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      187 / 414 (45.17%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      132 / 187 (70.59%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>gawry</b> for 437.29 points (11 mins 5 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      287.43 (for 132 correct submissions)

    </td>

  </tr>

</table></blockquote>

This problem sounds as dynamic programming at first, but it has a greedy solution as well. Some of the more experienced coders have chosen to code the safer dynamic programming solution instead of looking/proving the greedy one. See <tc-webtag:handle coderId="144400" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=262865&rd=10008&pm=6852&cr=144400">solution</a> for an example. In his nice <a href="http://www.topcoder.com/stat?c=problem_solution&rm=262873&rd=10008&pm=6852&cr=7390224">solution</a>, <tc-webtag:handle coderId="7390224" context="algorithm"/> worked on this approach and turned it into a greedy one.
<br /><br />
Let’s associate a weighted undirected graph to the map described in the problem statement. The towns will be the vertices and the bidirectional roads between them will be the edges, with the weight equal to the effort. The vertices corresponding to the occupied towns will be marked. Note that the graph described in the statement is actually a tree. We are asked to remove some of the edges of the tree in order to disconnect any two of the marked vertices. After doing this we will end up with a number of smaller trees, possibly consisting of only one vertex. Each of these smaller trees will contain at most one marked vertex. In fact, it will contain exactly one marked vertex: if one tree without any marked vertex existed, we could add back one of the removed edges and merge it with another subtree, without adding a path between two marked vertices, and lowering the total cost. It is now easy to see that the number of edges that must be removed from the original tree is one less than the number of marked vertices.<br /><br />
Let us denote by <i>e</i> the edge with the smallest weight among the edges that, when removed, disconnects (at least) a pair of marked vertices. We will now prove that there exists an optimal solution in which this edge is removed. Let’s take an optimal solution in which edge <i>e</i> is not removed. If we remove it, we split one of the subtrees in two smaller subtrees, and only one of them contains the marked vertex. Since we do not allow subtrees that don’t contain a marked vertex, we have to merge this subtree with another one by adding one edge. Because of the way we have chosen <i>e</i>, this edge will have a weight greater or equal to <i>e</i>’s weight. Since we added one edge to the set of removed edges, <i>e</i>, and removed another with a greater or equal weight, we end up with a solution with a total cost less than or equal to the cost of the original solution. Since we assumed that solution was optimal, we conclude that the edges have equal weight, and the new solution with <i>e</i> removed will be optimal as well.
<br />
<br />
Based on the key observation above, we can build a greedy solution: choose the edge <i>e</i> as above, remove it, and then recurse on each on the two subtrees obtained. The base case is when the tree contains only one marked vertex and there is no need to remove any edge. There are a few ways in which this algorithm can be implemented, some more efficient than others. In his <a href="http://www.topcoder.com/stat?c=problem_solution&rm=262884&rd=10008&pm=6852&cr=7506429">solution</a>, <tc-webtag:handle coderId="7506429" context="algorithm"/> iterated through the edges in increasing order of weight, and if an edge disconnected two marked vertices he removed it. Others coders solved a complementary problem: they found a set of edges that must not be removed, with a maximum total weight, using a variation of the <a href="http://en.wikipedia.org/wiki/Kruskal_algorithm">Kruskal’s algorithm</a> for finding a minimum spanning tree. See <tc-webtag:handle coderId="7364893" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=262871&rd=10008&pm=6852&cr=7364893">solution</a> for an example of this. Another <a href="http://www.topcoder.com/stat?c=problem_solution&rm=262866&rd=10008&pm=6852&cr=2058177">interesting approach</a> was taken by <tc-webtag:handle coderId="2058177" context="algorithm"/>, who iterated through all pairs of marked vertices, and, if necessary, removed the edge with the smallest weight on the path connecting them.
<br /><br />
As a sidenote, the greedy algorithm does not work for general undirected graphs. If there are only two marked vertices we obtain an instance of the minimum-cut problem, solvable with max-flow.
<br /><br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6620&amp;rd=10008" name="6620">BackyardTrees</a></b>
</font>

<A href="Javascript:openProblemRating(6620)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506003" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      17 / 414 (4.11%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      5 / 17 (29.41%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>CatalinT</b> for 507.63 points (36 mins 31 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      445.69 (for 5 correct submissions)

    </td>

  </tr>

</table></blockquote>

This problem may look intimidating at first, but the observations and ideas behind it are not that difficult.
<br /><br />
Of all the requirements of a way to plant the trees on the grid, the hardest to workaround is the one that all trees should be on the same line. To manage this, we will plant the first two trees at two points on the grid, and then plant the remaining ones on the segment connecting these two points. Next we need to calculate how many grid points are on this segment, and then the number of ways to plant the remaining trees on these points.
<br /><br />
Say the two grid points are <i>(x1, y1)</i> and <i>(x2, y2)</i>. We will enforce <i>x1 &le x2</i>, otherwise we would count solutions two times. The first part is easy: let <i>w = x2 – x1</i> and <i>h = y2 – y1</i>. First perform a translation and move these points to <i>(0, 0)</i> and <i>(w, h)</i> (the second point is not necessarily a grid point, since the second coordinate could be negative). A point <i>(x, y)</i> on this segment must have: <i>x/w = y/h</i> which implies <i>x * h = y * w</i>. Let <i>p = gcd(w, abs(h))</i>. Constraining these points to be on the segment, and neglecting the two endpoints, we can prove that there are <i>p - 1</i> grid points on the segment (if you can’t prove it, you may ask in the <a href="http://forums.topcoder.com/?module=ThreadList&forumID=506003&mc=24">forums</a>), and the distance between two adjacent grid points is <i>sqrt(w/p*w/p + h/p*h/p)</i>.
<br /><br />
For the second part, we first need to calculate the number <i>s</i> of grid points that must be skipped between two adjacent trees, in order to leave between them a distance of at least <b>distance</b>. We get <i>s = <b>distance</b> / d</i>. There is a corner case here: when <i>d</i> is an integer and <b>distance</b> is divisible by <i>d</i>, we should substract 1 from <i>s</i>.
<br /><br />
We can now use either dynamic programming or a direct relation to count the ways the remaining points could be placed on the segment. For the former, let <i>R[q][n]</i> be the number of ways that <i>q</i> trees could be planted on <i>n</i> points, if we leave at least <i>s</i> free points between adjacent trees. There are two cases to consider: plant a tree at the <i>n</i>th point or not. This gives you the recurrence: <i>R[q][n] = R[q-1][n-1-s] + R[q][n-1]</i> (of course, one should work with modular arithmetic). Writing the base cases for this recurrence could be tricky, <i>R[q][n]</i> is 1 when <i>q = 0</i> (including negative values for <i>n</i>) and 0 when <i>q > 0</i> and <i>n &le 0</i>. However, there is a way to calculate <i>R[q][n]</i> directly using the <a href="http://en.wikipedia.org/wiki/Choose">binomial coefficient</a>. Substract from <i>n</i> the number of points that will be skipped with certainty: <i>(n-1) * s</i>, and then choose any way to place the <i>q</i> trees on the remaining points, giving: <i>R[q][n] = C(n - (n-1)*s, q)</i>.
<br /><br />
We are not done, since fixing both endpoints of a segment would certainly time-out. We will fix the direction and the magnitude of the vector determined by the two endpoints (<i>w</i> and <i>h</i> from above) and then count how many pairs of points <i>(x1, y1)</i> and <i>(x2, y2)</i> from the grid could be its endpoints:<br> <i>(width – w + 1) * (height – h + 1)</i>.
<br /><br />
See <tc-webtag:handle coderId="344259" context="algorithm"/>’s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=262868&rd=10008&pm=6620&cr=344259">solution</a> for an implementation of the above algorithm. Slower DP solutions were implemented by <tc-webtag:handle coderId="10544397" context="algorithm"/> (<a href="http://www.topcoder.com/stat?c=problem_solution&rm=262881&rd=10008&pm=6620&cr=10544397">code</a>) and <tc-webtag:handle coderId="263396" context="algorithm"/> (<a href="http://www.topcoder.com/stat?c=problem_solution&rm=262874&rd=10008&pm=6620&cr=263396">code</a>).
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/_efer__big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8593420" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
