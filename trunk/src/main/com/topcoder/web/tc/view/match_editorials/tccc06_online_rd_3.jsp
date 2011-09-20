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
<style type="text/css">
.code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 12px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}

</style>
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
    <A href="/stat?c=round_overview&er=3&rd=10111">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506145" message="Discuss this match" />
</div>
<span class="bodySubtitle">2006 TopCoder Collegiate Challenge<br>Online Round 3</span><br>October 14, 2006
<br><br>


<h2>Match summary</h2>

    In the last online round before an onsite event, coding skills are not the only factor involved.
    Nerves can easily disrupt the thought process and ruin everything. Those who had been in this situation
    before certainly had an advantage. Only 28 coders solved more than one problem succesfully, and a reasonably fast submission on the easy
    problem was enough to advance to the onsite competition. The five contestants that solved all three problems deserve
    to be mentioned: <tc-webtag:handle coderId="9906197" context="algorithm"/> (the winner), <tc-webtag:handle coderId="310333" context="algorithm"/>,
    <tc-webtag:handle coderId="10574855" context="algorithm"/>, <tc-webtag:handle coderId="8355516" context="algorithm"/> and
        <tc-webtag:handle coderId="144400" context="algorithm"/>.

<br /><br />
    The problems were a bit more difficult than a regular Division 1 round, as should be the case.
    The first problem caused problems for many coders. Most submitted it in the end, but the submissions were evenly
    distributed across all 75 minutes. Many submissions also went down in challenge phase or the system test.
    The medium problem had a small performance trap, which caused many to resubmit their solution. Instead, solutions that weren't
    tested enough generally went down in the challenge phase or system test. The last problem required a fair amount
    of coding, and the submissions started to appear fairly late in the contest.
    In the end, only seven coders solved it, and all of them were among the highest ranked.
<br /><br />
    

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6790&amp;rd=10111" name="6790">Diamonds</a></b>
</font>
<A href="Javascript:openProblemRating(6790)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506145" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      127 / 140 (90.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      98 / 127 (77.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 237.67 points (6 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      169.52 (for 98 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
In the first part of the solution, we determine the size of the diamond for each coordinate <i>x</i>, <i>y</i> containing a <tt>'#'</tt>.
This can be done in several ways. Perhaps the easiest is to find the <tt>'.'</tt> closest to <i>x</i>, <i>y</i> (using the <a href="http://en.wikipedia.org/wiki/Manhattan_distance">Manhattan distance</a>).
The radius of the diamond equals this shortest distance, if we take into account that all cells outside the given
grid only contains <tt>'.'</tt>.
</p>

<p>
In the second part, we need to determine the maximum radii sum. The examples showed that it's not always desirable
to pick the largest diamond. However, the size of the input allows us to test all pairs of possible diamond centers (there are
at most 50<sup>2</sup> * 50<sup>2</sup> such pairs). Given two diamonds, we need to determine if they intersect. This is done
similarly to how you determine if two circles intersect, the difference being that we here use the Manhattan distance
rather than the Euclidean distance. So, if the Manhattan distance between the center of the diamonds plus one is less than
the sum of their radii, the diamonds intersect. If they do intersect, we have to decrease the size of the diamonds so that
they are just less than the limit.
</p>
<p>
See <tc-webtag:handle coderId="10574855" context="algorithm"/>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=250007&rd=10111&pm=6790&cr=10574855">solution</a> for a clean
implementation of this algorithm. A possible corner case is when an empty diamond has to be used. The last example in the
problem statement covered this case, however, so there shouldn't have been any nasty surprises.    
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6718&amp;rd=10111" name="6718">WordGuessingGame</a></b>
</font>
<A href="Javascript:openProblemRating(6718)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506145" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      78 / 140 (55.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      26 / 78 (33.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kalinov</b> for 422.43 points (12 mins 39 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      309.31 (for 26 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
The unusual limitation that there were at most 18 guesses should hint that an exponential solution is required (always look
at the constraints to get a hint on how to solve the problem). The problem can be solved by an exhaustive search, using
memoization. Recursively, we try all 26 letters at the first position. For each letter, we try all 26 letters at the second
position, and so on. But since the maximum word length is 9 characters, this yields 26<sup>9</sup> combinations, which obviously
is way too much. This is where the memoization part comes in.
</p>
<p>
At any time during this recursive process, each guessed word can be considered
to be either "even" or "odd", meaning that an even or odd number of the letters left must be correct for that
particular guessed word. When we try a letter at some position, all guessed words matching that letter should switch their even-odd status,
since now one letter less must be correct (and hence the parity change). If, at some point during the recursion, we are at
the same letter position and have the same set of even and odd words as at some previous point, then we don't have to go down
that path again <i>unless</i> we found some solution last time (since we must return all solutions). Thus the state space in the search is at most 9 * 2<sup>18</sup>,
and each state is only visited once, except when we know that some path down this road contains a solution (and this happens at most 100
times, because the problem constraint specified that there were at most 100 solutions).
</p>

<p>
Inside the recursive function, we test all 26 letters, and for each letter do the necessary parity switches. This parity switching stuff can be done
without any loop, which is essential if the solution is to run in time. To do this, the set of even and odd words must be represented during the
recursion as a bitmask. Before the recursion starts, we calculate the effect of trying some specific letter at some specific position. 
That is, we calculate a bitmask where each bit set marks a guessed word that should switch parity. During the recursion, switching parities can then
be done using bitwise xor on the current mask with a precalculated value. This speed-up trick is probably what caused the majority of solutions to fail,
and was an intended trap from my side...
</p>

<p>
See <tc-webtag:handle coderId="310333" context="algorithm"/>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=250006&rd=10111&pm=6718&cr=310333">solution</a>
for a short and elegant implementation of this algorithm.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6648&amp;rd=10111" name="6648">TopologicalEquivalence</a></b>
</font>
<A href="Javascript:openProblemRating(6648)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506145" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      13 / 140 (9.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      7 / 13 (53.85%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>bmerry</b> for 586.52 points (28 mins 29 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      552.69 (for 7 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Each figure can be represented by a graph where each endpoint of a line segment corresponds to a vertex.
The constraints guarantee that each such graph will have at most 8 vertices, which will be useful later on.
So the first part of the problem is to create these graphs. This can be done by first mapping all distinct
points to some global id, and then create a big adjacency matrix where each edge between
two ids represents a line segment. Which point belongs to which figure can then be deduced using a depth first search.
</p>

<p>
Now to the tricky part of the problem. When exactly are two figures equivalent, and how do we determine it
from the graphs representing the figures? Many different graphs, with a different number of vertices, can all
represent the same figure. The key lies in finding a canonical graph for each figure. That is, some graph
that all other graphs representing a topological equivalent figure can be reduced or transformed into.
It should be obvious that splitting a line segment into two parts doesn't affect the figures topological feature,
even though it does introduce a new vertex in the graph. So we want to reverse this operation. That is, any
vertex that has exactly two edges should be <i>contracted</i>. This means that the vertex should
be removed from the graph, and the two edges going from the vertex should be replaced by a single edge
connecting the two surrounding vertices. This procedure of finding vertices with exactly two neighbors should then
continue until no more such vertices are found. Some care must be taken so we don't reduce the graph completely.
We might end up with a graph containing a single vertex with a single edge connecting the vertex to itself;
this graph should not be reduced any further.
</p>

<p>
This graph reduction is the only operation needed to get a canonical graph. To determine the number of unique graphs, we can compare all pairs
of graphs and see if they are isomorphic. Another method is to find a canonical representation of the set of
isomorphic graphs, so that two isomorphic graphs map to the same canonical representation. The internal adjacency matrix
of a graph is a 8x8 binary matrix. This matrix can be represented by an unsigned 64 bit integer. By testing
all permutations of the vertices in the graph, we potentially get 8! = 40320 distinct adjacency matrices. Among
them, we can simply pick the smallest unsigned integer as the representation of this graph. This value is then
inserted in a set, and the answer to the problem is the size of this set.
</p>

<p>
This algorithm was used by <tc-webtag:handle coderId="9906197" context="algorithm"/>,
whose <a href="http://www.topcoder.com/stat?c=problem_solution&rm=250003&rd=10111&pm=6648&cr=9906197">solution</a>
is also the cleanest of all successful solutions to this problem (if you don't mind the extensive use of C++ #define macros).
</p>

<div class="authorPhoto">
    <img src="/i/m/Yarin_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="269554" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
            <jsp:include page="/public_right.jsp">
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
