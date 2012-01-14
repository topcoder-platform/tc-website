<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>

<tc-webtag:forumLink forumID="506035" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 13</span><br>Monday, August 28, 2006
<br><br>

<h2>Match summary</h2>

<p>
Despite featuring some very fast submissions early on, HS SRM 13 was a close contest to the end.  
<tc-webtag:handle coderId="13298470" context="hs_algorithm"/>, <tc-webtag:handle coderId="22630298" context="hs_algorithm"/>, <tc-webtag:handle coderId="15803565" context="hs_algorithm"/>, <tc-webtag:handle coderId="22627711" context="hs_algorithm"/>, and <tc-webtag:handle coderId="15092597" context="hs_algorithm"/> each took a turn in the lead on the strength of quick early submissions.  They were overtaken by perennial top finisher <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>, who started a bit later but ended up submitting for 1559 points.  With many top competitors finished with all problems, the spotlight shifted to <tc-webtag:handle coderId="21468741" context="hs_algorithm"/>, another "red" who had arrived even later and was just starting.  At the 56 minute mark, <tc-webtag:handle coderId="21468741" context="hs_algorithm"/> had just submitted his medium problem and was racing a short clock to finish the hard - and an even shorter clock if he was to edge out <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>.  He finished, but at the end of coding he trailed <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>, <tc-webtag:handle coderId="15092597" context="hs_algorithm"/>, and <tc-webtag:handle coderId="15803565" context="hs_algorithm"/>.
</p>

<p>
In the challenge phase, <tc-webtag:handle coderId="21868978" context="hs_algorithm"/> identified 4 failed submissions to move into the lead - before losing his own hard solution to a timeout challenge from <tc-webtag:handle coderId="22630769" context="hs_algorithm"/>.  With the system tests eliminating a few more submissions, victory ended up with top-seeded <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>, followed by <tc-webtag:handle coderId="22630769" context="hs_algorithm"/> and <tc-webtag:handle coderId="21468741" context="hs_algorithm"/>.
</p>



<H1>

The Problems

</H1>

</p>



<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6502&amp;rd=10065" name="6502">WallRepair</a></b>

</font>

<A href="Javascript:openProblemRating(6502)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506035" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      93 / 96 (96.88%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      92 / 93 (98.92%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>vlad_D</b> for 248.82 points (1 mins 57 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      229.00 (for 92 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
Most competitors scored very well on this problem.  There are many ways one could approach this, with no single strategy necessarily the best.  One strategy is to loop through the grid and identify holes.  Each time you find a hole, check each position above the hole.  If you find one or more bricks above the hole, then this hole will need to be filled - so increment your "bricks needed" counter by one.  
</p>


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6581&amp;rd=10065" name="6581">DessertMaker</a></b>

</font>

<A href="Javascript:openProblemRating(6581)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506035" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      60 / 96 (62.50%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      54 / 60 (90.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>tomekkulczynski</b> for 482.80 points (5 mins 24 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      326.87 (for 54 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
Often the best way to approach a problem is to break it up into parts.  In this case, we can break the problem into three independent decisions:
</p>

<ol>
<li>How many "banana"s will be used?</li>
<li>How many "ice cream"s will be used?</li>
<li>Which other ingredients will be used?</li>
</ol>

<p>
Let's consider each of these decisions for the situation:
</p>

<pre>
    {"banana", "banana", "ice cream", "chocolate", "chocolate", "peanuts"}
</pre>

<strong>Decision #1</strong>

<p>
We have two "banana"s and two options - we can't have no "banana"s so we will have one or two in our dessert.  In general we will have the same number of "banana" options as we have bananas.  Conveniently, this holds for the case of 0 "banana"s as well.
</p>

<strong>Decision #2</strong>

<p>
Just like the "banana"s above - but in this case we have only one "ice cream" and thus only one option.
</p>

<strong>Decision #3</strong>

<p>
This is a trickier one.  What we really have here is <strong>n</strong> independent decisions, where <strong>n</strong> is the number of different other ingredients.  For "chocolate" we have 3 options (zero, one or two) and for "peanuts" we have 2 options (zero or one).  We multiply these together to get 6 total options for other ingredients.  However, one of these options - the option with zero "peanuts" and zero "chocolate" - is invalid as it would leave us with no other ingredients.  Thus we're left with 3*2-1=5 options.
</p>

<strong>Overall decision</strong>

<p>
Since the 3 decisions are independent, we multiply them out to get 2 * 1 * 5 = 10 total options.
</p>
<p>
The same logics applies in the general case. 
Let us have B bananas, C ice-creams, and k other ingredients (n<sub>1</sub> units of the first ingredient, ..., n<sub>k</sub> units of the k-th ingredient).  
The answer will be B * C * ((n<sub>1</sub> + 1)* ... * (n<sub>k</sub> + 1) - 1).
</p>


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6541&amp;rd=10065" name="6541">CircuitBoard</a></b>

</font>

<A href="Javascript:openProblemRating(6541)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506035" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      43 / 96 (44.79%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      14 / 43 (32.56%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>tomekkulczynski</b> for 827.59 points (13 mins 33 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      575.48 (for 14 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
Many coders got off to a good start on this problem (and a few solved it very fast) but it is not without tricks.  Essentially it is a maze problem that needs to be solved a few times.  As is often the case with maze problems, a simple solution here is to use a Depth First Search, or DFS.  The basic pattern of DFS in a grid maze is something like this:
</p>

<pre>
function FindPath(x,y) returns boolean
	If we are finished the maze at this point, return "true"
	
	For each possible next step from here:
		if FindPath(next step x, next step y)==true, return true

	We've tried every path and there is no path from here, so return false
end function
</pre>

<p>
This basic pattern will work for us here - we'll just keep trying to find paths from top to bottom until we can't find a path anymore, and count how many paths we made.  However, we'll need to watch out for a few problems:
</p>

<strong>Problem 1: Two data lines cannot use the same cell</strong>

<p>
To avoid re-using a cell we can mark each cell as "used" if it is involved in a valid path.  This is simple to add to our DFS: before each occurence of "return true," we set the current position as "used" or "blocked" to prevent it from being used again.
</p>

<strong>Problem 2: We want to avoid interfering with future paths</strong>

<p>
We want to make sure that the line we're drawing does as little as possible to block future lines.  In this case, it is sufficient to be "greedy" - we pick the "most left" or "most right" path we can take for each line.  To make our DFS greedy, we just have to try each possible starting point in order from left to right, and at each step try paths in left to right order.
</p>

<strong>Problem 3: We are operating under a time limit</strong>

<p>
Imagine a large blank grid that is closed at the bottom.  Now imagine our algorithm trying every possible path through that grid.  There's just too many paths there to consider them all in time.  We can drastically cut down on the number of paths we consider by marking each point as "used" or "blocked" if a valid path can't be made from that point to the bottom.  This, again, is simple to work into our DFS.  What we do is any time we're about to "return false", we set the current point as blocked (as though it was a screwhole).  If we can't make a path from that point now, we won't be able to in the future either.
</p>

<p>
The problem can also be solved using "max-flow" (which was the original intended solution) or using dynamic programming (see <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>'s solution).  If you think of any other approaches, drop a note in the forums.
<br><br>

<div class="authorPhoto">
    <img src="/i/m/jmzero_mug.gif" alt="" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15498334" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
