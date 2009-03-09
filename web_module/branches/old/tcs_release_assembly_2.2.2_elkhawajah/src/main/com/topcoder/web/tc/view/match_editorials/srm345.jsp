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
    <A href="/stat?c=round_overview&er=2&rd=10669">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506235" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 345</span><br>Wednesday, April 18, 2007
<br><br>



<h2>Match summary</h2> 

<p>
Division 1 coders faced a very tricky easy problem, a straightforward medium, and a difficult hard.  The result: Many successful challenges and only one correct hard submission.  <tc-webtag:handle coderId="20812309" context="algorithm"/> won the match by solving the easy and medium problems, and racking up 5 successful challenges.  This victory earned him a place in the Algorithm Top 10.

Division 2 also had a high level of difficulty.  Newcomer <tc-webtag:handle coderId="22680049" context="algorithm"/> won the division and was one of only four coders who solved the hard problem.
<br />
<br />
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7650&amp;rd=10669" name="7650">Trekking</a></b> </font> <A href="Javascript:openProblemRating(7650)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506235" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      595 / 651 (91.40%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      532 / 595 (89.41%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Torax</b> for 246.86 points (3 mins 12 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      205.59 (for 532 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem can be solved by simply iterating over all given plans and identifying ones that are valid.  Out of the valid plans, the one with the fewest camps has to be picked.

<pre>

for_each_plan <b>P</b>
    if <b>P</b> is valid, <b>result</b> = min(<b>result</b>, number of camps in <b>P</b>)

</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7649&amp;rd=10669" name="7649">Pathfinding</a></b> </font> <A href="Javascript:openProblemRating(7649)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506235" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      224 / 651 (34.41%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      52 / 224 (23.21%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>zouyu9631</b> for 419.97 points (12 mins 55 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      243.71 (for 52 correct submissions) 
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
      465 / 595 (78.15%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      238 / 465 (51.18%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>alexilic</b> for 241.38 points (5 mins 24 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      138.24 (for 238 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
A low success rate suggests that this problem is harder than it appears at first glance.
<br />
<br />

The first thing to notice is that the lower bound for the answer is <i>|x| + |y|</i>, and that the actual answer might only be higher by 2 or 4.  That depends on the "general" direction of the given point and the directions of the two lines that it lies on.  To be more exact, we need to examine the signs of <i>x</i> and <i>y</i> and their remainder mod 2.  This gives us a solution that examines all the 25 possible cases.  Noticing that the problem is symmetric with respect to <i>x</i> and <i>y</i> reduces this number to 15. <!-- You can reduce it further, for example by noticing that the result for <i>x</i> and <i>y</i> is one more than for <i>x-1</i> and <i>-y</i>, if <i>y</i> is negative.<br><br>-->  You can keep trying to reduce the different cases and examining them by hand, or use a bfs to calculate the results for all <i>x</i> and <i>y</i> between -2 and 2, which will include all the possible cases.
<br />
<br />

Another solution to this problem is to walk one step at a time always minimizing the Euclid distance to the desired point (used by <tc-webtag:handle coderId="19852194" context="algorithm"/> in his <a href="http://www.topcoder.com/stat?c=problem_solution&rm=264446&rd=10669&pm=7649&cr=19852194">solution</a>).
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6763&amp;rd=10669" name="6763">BikeRiding</a></b> </font> <A href="Javascript:openProblemRating(6763)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506235" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      71 / 651 (10.91%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 71 (5.63%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACman</b> for 699.66 points (20 mins 34 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      633.20 (for 4 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Counting the number of paths in a directed, acyclic graph is a known problem and can be solved using dynamic programming.  The "extra" part of this problem is detecting the cycles and checking whether they can be used to produce an arbitrary number of paths from a starting point to the end point.  The reference solution used a modified <a href="http://en.wikipedia.org/wiki/Depth-first_search">DFS</a> to achieve this.

<pre>

int count_routes_from_vertex(vertex <b>v</b>)

    if (<b>cached_result</b>[<b>v</b>] &lt;&gt; <i>NULL</i>) then 
        // we've calulated this vertex before
        return <b>cached_result</b>[<b>v</b>]    

    <b>visiting</b>[<b>v</b>] := true

    <b>result</b> := 0

    if (<b>v</b>) is the <b>endPoint</b> then
        <b>result</b> := 1

    for each <b>w</b> in neighbors of <b>v</b> do
        if (<b>visiting</b>[<b>w</b>] = true) then
            // we have just found a cycle
            cycle_start[<b>w</b>] := true

        else <b>result</b> := <b>result</b> + count_paths(<b>w</b>)

    <b>visiting</b>[<b>v</b>] := false
    
    <b>cached_result</b>[<b>v</b>] := <b>result</b>

    return <b>result</b>

</pre>

To calculate the result using the above function:

<pre>

<b>result</b> := 0

for each vertex <b>v</b> in <b>startPoints</b> do
    <b>result</b> := <b>result</b> + count_routes_from_vertex(<b>v</b>)


for each vertex <b>v</b> do
    if (<b>cached_result</b>[<b>v</b>] &lt;&gt; <i>NULL</i> and
        <b>cached_result</b>[<b>v</b>] &gt; 0 and
        <b>cycle_start</b>[<b>v</b>] = true) then return -1

return <b>result</b>

</pre>

In the above code we first sum the results for each path point.  However, we must still check whether the answer is not infinite. The <i>if</i> statement in the second loop checks three things, respectively:
<ul>
 <li>whether <b>v</b> is accessible from any starting point</li>
 <li>whether the end point is accessible from <b>v</b></li>
 <li>whether there is a cycle passing through <b>v</b></li>
</ul>

Notice that if this holds true, there is an infinite number of paths.
<br /><br />

The only thing that this pseudocode is missing is the check of overflowing the <i>n</i> value.  Checking this in the place of every addition is left as an exercise.
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7238&amp;rd=10669" name="7238">StoneGame</a></b> </font> <A href="Javascript:openProblemRating(7238)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506235" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      397 / 595 (66.72%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      171 / 397 (43.07%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Burunduk1</b> for 483.66 points (5 mins 15 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      347.67 (for 171 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem has a simple greedy solution.  It assumes the best strategy is:<ul>
<li>if you can take a chest in one move (by picking the last stone from it), take the one with the most treasure, else</li>
<li>if possible take any stone that doesn't let your opponent take a chest in one move, else</li>
<li>take any stone</li>
</ul>

Simulating this behaviour gives a correct solution.
<br /><br />

To prove it, let's look at a case where there are no chests with a single stone on top.  It's easy to see that if the number of all the stones is odd, the first player takes everything, and if it's even, the second player does.  Using the described strategy ensures this result for the winning player.  This observation leads to the following: whoever takes the last chest, takes all the chests.
<br /><br />

In the general case, we have two groups of chests: ones with a single stone on top, and ones with multiple stones.  If we take a stone from one of the chests with multiple stones, the opponent can always react with taking a stone from the same chest, preserving the parity of the stones in the second group (and maybe taking the chest).  This proves that you can't change the result for the group of chests with multiple stones if it's not plausible for you. If you are going to get the treasure from the second group anyway, it's also best to take from the first group when possible.
<br /><br />

This way, it's always best to try step 1 from the described strategy.  When both players do that, the chests with multiple stones always stay until the end, and at that point, the result is known.
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7239&amp;rd=10669" name="7239">ByteLand</a></b> </font> <A href="Javascript:openProblemRating(7239)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506235" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      20 / 595 (3.36%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 20 (5.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>xhl_kogitsune</b> for 438.63 points (47 mins 44 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      438.63 (for 1 correct submission) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem turned out harder than the author thought it would be.
<br /><br />

First, let's reduce this problem to counting the number of new castles needed to preserve a given distance from a city to castle <i>d</i>.  This can be done by using a binary search over <i>d</i>.
<br /><br />

Next, let's examine a case when the graph is a tree.  You can define a recursive function that, for a given subtree, minimizes the number of built new castles, but tries to build them as close as possible to the root.  This function will return the number of new castles, the distance to the castle closest to the root, and the distance to the city that is the farthest away from the root and is still not "covered" by a castle.  Intuitively speaking, it's a greedy algorithm that builds the castles, but it tries to "pull" them up toward the root, not leaving any "uncovered" vertices behind.
<br />
<br />

Notice that although the graph is not a tree, it is close.  Every connected component is a tree with one additional edge or, from a different perspective, a cycle with one or more trees attached to it.
<br /><br />

Having the above function, you can do the following.  For each connected component locate its cycle, and try removing each road in the cycle, reducing the component to a tree.  The result for this component will be the minimum of the results for the examined trees.  This is because having some arrangement of the castles, you can always locate a road such that the cities on its two ends will be "covered" without using this edge.  Finally, sum up the results of all components.
<br />
<br />

For another explanation of the exact same algorithm read <a href="http://forums.topcoder.com/?module=Thread&threadID=572689&start=0&mc=2#791386"><tc-webtag:handle coderId="9958883" context="algorithm"/>'s</a> post.
<br />
<br />
</p>




<div class="authorPhoto">
    <img src="/i/m/rusolis_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20289593" context="algorithm"/><br />
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
