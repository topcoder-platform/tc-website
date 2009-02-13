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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=11120">Match Overview</A><br />
    <tc-webtag:forumLink forumID="518781" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 386</span><br />Saturday, January 5, 2008
<br /><br />



<h2>Match summary</h2>
<p>
1324 coders showed up to the first SRM of 2008, and they were greeted by relatively difficult problem sets.<br><br>

Division 1 saw a challenging implementation-oriented easy problem, followed by a geometry-based medium problem which gave some coders trouble.  The hard problem proved to be difficult and deceptive, as <tc-webtag:handle coderId="19849563" context="algorithm"/> was the only
coder who ended up with a successful solution.  As the only coder to solve all three problems, <tc-webtag:handle coderId="19849563" context="algorithm"/> won the match by a huge margin, also capturing the #1 algorithm ranking from <tc-webtag:handle coderId="10574855" context="algorithm"/>.  Rounding out the top three were <tc-webtag:handle coderId="22074760" context="algorithm"/> who was 
aided by three successful challenges and <tc-webtag:handle coderId="10256411" context="algorithm"/>, who had a roller-coaster of a challenge phase.<br><br>

Division 2 saw a fairly simple easy problem, but many coders became stuck once they opened the medium (which was also division 1's easy).  The hard problem proved to be very conceptually challenging, as only three coders
provided successful solutions.  <tc-webtag:handle coderId="22666424" context="algorithm"/> won the division by a wide margin as the only competitor to solve all three problems, and second place newcomer <tc-webtag:handle coderId="22710119" context="algorithm"/> failed his medium problem.  Rounding out the top 3 was <tc-webtag:handle coderId="13339297" context="algorithm"/> with 3 successful challenges.<br><br>

Following a recent trend started by <tc-webtag:handle coderId="8357090" context="algorithm"/>, there are exercises at the end of each section that may help you gain a more in-depth understanding of the problems.  Feel free to ask questions about them or discuss them in the forums.
</p> 
 
<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8541&amp;rd=11120" name="8541">TrophyShelf</a></b> </font> <A href="Javascript:openProblemRating(8541)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518781" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      690 / 722 (95.57%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      601 / 690 (87.10%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>saintqdd</b> for 249.15 points (1 mins 39 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      216.67 (for 601 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem is solved most easily by realizing that when we're trying to determine if a trophy is visible or not, we only need to know the height of the tallest trophy in front of it.  If the current trophy is taller, then it is visible,
otherwise it's obstructed.  We then perform a possible update of the tallest trophy encountered thus far after determining if the current trophy is visible.  A sample java implementation of this approach follows:
<pre>
public class TrophyShelf {
    public int[] countVisible(int[] trophies) {
        int[] ret = {1, 1};
        int big = trophies[0];
        for (int i = 1; i &lt trophies.length;i++) {
            if(trophies[i]>big) ret[0]++;
            big=Math.max(big, trophies[i]);
        }
        big = trophies[trophies.length-1];
        for (int i = trophies.length - 2; i >= 0; i--) {
            if(trophies[i]>big) ret[1]++;
            big=Math.max(big, trophies[i]);
        }
        return ret;
    }
}
</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8444&amp;rd=11120" name="8444">CandidateKeys</a></b> </font> <A href="Javascript:openProblemRating(8444)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518781" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      175 / 722 (24.24%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      79 / 175 (45.14%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>nikolaymakarov</b> for 364.56 points (18 mins 51 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      238.90 (for 79 correct submissions) 
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
      521 / 598 (87.12%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      435 / 521 (83.49%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 241.35 points (5 mins 24 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      167.69 (for 435 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The low constraints on this problem should be a clear sign that a brute-force solution is intended.  The simplest solution (conceptually) to this problem is to generate all possible keys,
and for each one check to see if it's a superkey.  If so, we add it to our list of superkeys.  Afterwards, we can iterate through each of our superkeys and check to see if any other superkey
is a proper subset of it.  If not, then the superkey in question is a candidate superkey.<br><br>

Determining if a key is a superkey is fairly simple.  We just get the Strings formed by our key's attributes for each pair of entries, and if any two entries are the same, then the key is not a superkey.<br><br>

Generating all keys is a task that is best solved by using bitmasks, which very frequently appear in TopCoder problems, and so are well worth learning about.  To do so, I recommend reading bmerry's excellent
bitmask <a href="/tc?module=Static&d1=tutorials&d2=bitManipulation">tutorial</a>.<br><br>

Of course, the solution above can be optimized in a couple of ways.  First, assume that we're generating our keys with bitmasks, going from 1 to (1 &lt&lt n) - 1 in numerical order, and we're keeping track
of all superkeys we've seen before the current one.  It turns out that these are the only superkeys that can possibly be subsets of the current superkey.  To see why, let's imagine that
the bitmask describing the current key is 001101.  It's impossible for this key to be a superset of any key with a numerical value that's greater than it, because to get a key that's a subset of 001101
we must <i>remove</i> one or more '1' bits, and these keys must be numerically smaller than the current key.<br><br>

For the above algorithm, we must generate all superkeys, and for each one, check if each superkey numerically smaller than it is a subset of it.  We can improve this by observing that if we wish to check if
our current superkey is a candidate superkey, we only need to check if any keys formed by removing a single '1' bit from the current key is also a superkey.  If so, then the current key is not a candidate superkey.
This observation greatly reduces the time complexity of our algorithm.  You can view <tc-webtag:handle coderId="307060" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=267978&rd=11120&pm=8444&cr=307060">solution</a> for a clean implementation of this approach.<br><br>

<b>Exercises:</b><br>
2.1: Prove why we only need to check if any keys formed by removing a single '1' bit from the current key are superkeys in the above approach.<br>
2.2: Give an O(2^N * (N*M + M log M)) algorithm to solve this problem, noting that comparing two strings of length K is O(K).  Here, N is the number of columns of tables and M is the number of rows.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8486&amp;rd=11120" name="8486">LittleTree</a></b> </font> <A href="Javascript:openProblemRating(8486)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518781" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      15 / 722 (2.08%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      3 / 15 (20.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>nikolaymakarov</b> for 570.94 points (29 mins 51 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      505.37 (for 3 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
There are several correct approaches to this problem, with varying time complexities.  An important observation that's useful in each solution is that if we eventually end up augmenting the subtree rooted at a vertex W and one of
its ancestors V, then we never want to augment the subtree rooted at W before V.  This is because augmenting the subtree rooted at V first potentially decreases the amount that the W subtree will need to be augmented by, while still performing the necessary augmentation 
to the V subtree.<br><br>

<b>Solution #1: Dynamic Programming</b><br>
The result that we wish to compute is F(V,H) which means that we're trying to make the height of the subtree rooted at V to be less than or equal to <b>height</b> as cheaply as possible, and V is currently at level H.
First, let us consider our base case, that is whenever V is a leaf vertex.  Here we have two cases: either H &lt= <b>height</b>, or H > <b>height</b>.  For the first case, we have that F(V,H)=0, since there's no need
to augment V's subtree.  Otherwise, F(V,H)=1, since we will compute F(V,H) for non-base cases such that the only time that H > <b>height</b> is when H = <b>height</b> + 1.<br><br>

Now we may try augmenting the subtree rooted at V to be at any level from 1,2,...,H-1 and get the result A<sub>k</sub>=(H-K)+F(V,K), where K is V's new level.
Alternatively, if H &lt= <b>height</b>, we can try not augmenting V, and instead recurse on V's children, which gives the result B=F(V<sub>0</sub>,H+1)+F(V<sub>1</sub>,H+1)+...+F(V<sub>m</sub>,H+1), where each V<sub>i</sub> is a child of V.
Thus, if H &gt <b>height</b>, then F(V,H)=min{A<sub>1</sub>,A<sub>2</sub>,...,A<sub>H-1</sub>} since we <i>must</i> augment V's subtree.  However, if H &lt= <b>height</b>, then F(V,H)=min(B,min{A<sub>1</sub>,A<sub>2</sub>,...,A<sub>H-1</sub>}),
since we can choose whether or not we wish to augment V's subtree.<br><br>

A java implementation of this approach that uses memoization follows.  Here, adj[V] is a vector of children of vertex V.<br>
<pre>
int F(int V, int H) {
    if (adj[V].size() == 0) return (H &lt = height) ? 0 : 1;
    if (dp[V][H] !=- 1) return dp[V][H];
    int ret = 10000000;
    for (int i = 1;i &lt H; i++) {
        int res = (H - i) + F(V, i);
        ret = Math.min(ret, res);
    }
    if (H &lt = height) {
        int res = 0;
        for(int i = 0; i &lt adj[V].size(); i++) res += F(adj[V].elementAt(i), H + 1);
        ret = Math.min(ret, res);
    }
    return dp[V][H] = ret;
}
</pre>

However, we can improve this algorithm by noticing that we only need to try augmenting the subtree rooted at V by a single level, which improves the running time to O(V*height).<br><br>

<b>Solution #2: Greedy</b><br>
Say we know that vertex V has descendants that are at a level of greater than <b>height</b>.  Is there any reason to augment this vertex's descendants rather than augmenting V?  The answer is no,
because we can reduce potentially many descendants' levels with one augmentation.  Therefore, we can repeatedly augment subtrees rooted at vertices that are at level 2 to be at level 1, so long as these subtrees have some
vertices that are at a level greater than <b>height</b>.<br><br>

<b>Exercises:</b><br>
3.1: Prove why we only need to augment subtrees by a single level in the DP algorithm.<br>
3.2: Give an O(V^2) implementation of the greedy algorithm.<br>
3.3: Solve this problem in O(V) time.<br>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8540&amp;rd=11120" name="8540">PolygonCover</a></b> </font> <A href="Javascript:openProblemRating(8540)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518781" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      248 / 598 (41.47%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      156 / 248 (62.90%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Gassa</b> for 480.43 points (5 mins 46 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      309.30 (for 156 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
To solve this problem, we'll use one of the most fundamental and powerful tools in computational geometry: polygon triangulation.  Every convex polygon can be decomposed into a set of non-overlapping
triangles, with all three vertices of each triangle lying on the original polygon's vertices.  This fact allows us to only consider triangles for covering our points.<br><br>

We can make implementing this problem easier by noticing that we actually only need to consider triangles that don't contain any points, besides the points that define its vertices.  This is true because we can take any triangle
that contains a point in its interior and decompose it into three nonoverlapping triangles whose union has the same area as the original triangle (see the illustration below).  This argument can also be extended inductively for triangles that contain several points in their interiors.  To simplify
implementation, we can just implement this algorithm assuming that no triangle covers any points besides those at its vertices.<br><br>
<img src="/i/education/srm386.gif" /><br><br>

Armed with these observations, we're ready to solve the problem.  Our solution will use dynamic programming, where we wish to compute F(P), which is defined as the smallest area of triangles required to cover all points in set P.
To compute F(P), we simply iterate through each triple of points {a,b,c} (such that at least one such point must be covered), and consider F(P-{a,b,c})+area(a,b,c)) as a possible return value.  Our final result is the smallest
such value.  Of course, if P is the empty set, then we simply return 0.  Since there are O(2^n) states, and each state uses O(N^3) iterations, this algorithm runs in O(2^N * N^3).
See <tc-webtag:handle coderId="284007" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=267984&rd=11120&pm=8540&cr=284007">submission</a> for a nice implementation of this approach.<br><br>

Though we haven't described how to find the area of a triangle, the best method here is to use the cross-product, as outlined in <tc-webtag:handle coderId="159052" context="algorithm"/>'s geometry <a href="/tc?module=Static&d1=tutorials&d2=geometry1">tutorial</a>,
which is well worth reading for a variety of concepts on computational geometry.<br><br>

<b>Exercises:</b><br>
4.1: Prove why we can assume that no triangle covers any points besides those at its vertices, and still have this algorithm be optimal.<br>
4.2: Prove or disprove: If we allow triples of collinear points, our observations about triangles that contain points in their interiors still holds.<br>
4.3: Solve this problem in O(2^N * N^3), where triples of collinear points are allowed.<br>
4.4: How would our problem change if we were able to use any simple polygon to cover our points?
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7953&amp;rd=11120" name="7953">EscapeArtist</a></b> </font> <A href="Javascript:openProblemRating(7953)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518781" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      11 / 598 (1.84%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 11 (9.09%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 501.07 points (37 mins 22 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      501.07 (for 1 correct submission) 
    </td>
  </tr>
</table></blockquote>
<p>
The main challenge of this problem was avoiding various pitfalls.  For complex, multi-layered problems such as this one, it's important to take your time while thinking and make sure you know exactly how your solution will work before you begin coding. 
The most common mistake that competitors seemed to make here was not using information gathered on your path in order to correctly compute the probability of being captured in the future.  For those unfamiliar with probability theory,
please take the time to read <tc-webtag:handle coderId="7371063" context="algorithm"/>'s <a href="/tc?module=Static&d1=tutorials&d2=probabilities">tutorial</a>.<br><br>

We can model this problem as a graph theory problem, with rooms as vertices and corridors as edges.  We will solve this problem by constructing several mathematical functions, and we'll create efficient algorithms to compute and combine them.  Assume there are <i>m</i> agents.
Let's define P(V) to be the probability that we're captured at some point in the future, given that we've visited vertices V=(V<sub>0</sub>,..,V<sub>k</sub>) without being captured.
We will compute this function inductively, so our base case is when V<sub>k</sub>=finish, and thus P(V)=0, as we've safely reached the finish room.  Now let us examine each neighbor W of V<sub>k</sub>
that may eventually lead us to the finish room on a shortest path.  If we decide to use vertex W as our next vertex, then there are two ways of being captured: we can either be captured during this second, or sometime after this second.  Here, a second
consists of the amount of time that it takes us to traverse the current edge, and arrive at the next vertex.<br><br>

To compute the probability that we will be captured in the second that we go from V<sub>k</sub> to W, we'll require the assistance of three helper functions:<br>
<ul>
<li>Define F<sub>a</sub>(V,W) to be the number of shortest paths that agent <i>a</i> may take, such that he doesn't visit any vertex in V at the same time that we do, but he does visit vertex W at the same time that we do.</li>
<li>Define C<sub>a</sub>(V,W) to be the number of shortest paths that agent <i>a</i> may take, such that he doesn't visit any vertex in V at the same time that we do, but he traverses edge (V<sub>k</sub>,W) at the same time that we go through
the same edge in the opposite direction, i.e. (W,V<sub>k</sub>).</li>
<li>Define G<sub>a</sub>(V) to be the number of shortest paths that agent <i>a</i> may take, such that he doesn't visit any vertex in V at the same time that we do.</li>
</ul>

It's important to note that at this time, the total number of shortest paths that agent <i>a</i> could have decided to take is G<sub>a</sub>(V), rather than the total number of shortest paths that agent <i>a</i> could have chosen from at the beginning.
This is because the information that we weren't captured at any vertex in V tells us that no agent could have been at any vertex in V at the same time as we were, which allows us to potentially reduce the number of shortest paths
that an agent may have decided to take.<br><br>

Now we can compute the probability that we will be captured in the second that we go from V<sub>k</sub> to W.  The number of shortest paths that agent <i>a</i> may take that leads to our capture in <i>this second</i> is F<sub>a</sub>(V,W)+C<sub>a</sub>(V,W), and so the
probability that agent <i>a</i> captures us in this second is T<sub>a</sub>(V,W)=(F<sub>a</sub>(V,W)+C<sub>a</sub>(V,W))/G<sub>a</sub>(V).  We can use this value to compute the following probabilities:
<ul>
<li>The probability of being captured by agent <i>a</i> in the next second: T<sub>a</sub>(V,W)</li>
<li>The probability of not being captured by agent <i>a</i> in the next second: 1-T<sub>a</sub>(V,W)</li>
<li>The probability of not being captured by <i>any</i> agents in the next second: (1-T<sub>0</sub>(V,W))*(1-T<sub>1</sub>(V,W))*...*(1-T<sub>m</sub>(V,W))</li>
<li>The probability of being captured by some agent in the next second: H(V,W)=1-(1-T<sub>0</sub>(V,W))*(1-T<sub>1</sub>(V,W))*...*(1-T<sub>m</sub>(V,W))</li>
</ul>

Looking back at the big picture, we're finally ready to compute P(V) if our next vertex is W.  As noted above, we can either be captured during this second, or sometime after this second.  The probability of being captured
during this second is H(V,W).  Thus, the probability that we're captured after this second depends on two things.  First, we must know the probability that we aren't captured during this second, which as we know is 1-H(V,W).
We must also know the probability that we're captured at some point after this second, which we know by induction is P(V+W).  So the probability that we're captured sometime after this second if we visit W next is
(1-H(V,W))*P(V+W).<br><br>

Thus, the total probability that we're captured in the future if we visit W next is H(V,W)+(1-H(V,W))*P(V+W).  Since we wish to visit the vertex that minimizes this probability, we can finally determine
that P(V)=min{H(V,W)+(1-H(V,W))*P(V+W) for all shortest path edges to some vertex W}.  Note that our final result is P({}), where {} is the empty set.<br><br>

Of course, there's a glaring issue with the implementing the above approach: its runtime depends on the number of shortest paths that we may take.  However, with a maximum number of 25 vertices, there's under 4,500 shortest paths to consider, meaning
that if we can efficiently compute F, C, and G then this approach can work.  It turns out that we can indeed compute these functions with simple dynamic programming algorithms.  Here, we'll show how to compute F, as computing C and G
is similar.<br><br>

Suppose we wish to compute F<sub>a</sub>(V,W).  To do this, let's define the function F<sub>a</sub>(V,W,U) which will represent the number of shortest paths agent <i>a</i> may take from vertex U to to his destination vertex, such that agent <i>a</i> doesn't visit any vertex in V at the same time as we do,
but does visit vertex W at the same time as we do.  Note that it assumed that agent <i>a</i> has already taken a shortest path to U, and U lies on some shortest path from agent <i>a</i>'s start vertex to his end vertex.<br><br>

We can also assume that the length of the shortest path from our start vertex to W is the length of the shortest path from agent <i>a</i>'s start vertex to vertex W, since F<sub>a</sub>(V,W,U)=0 otherwise.  To compute F<sub>a</sub>(V,W,U), there are three cases to consider:<br><br>
<i>Case 1:</i> The length of the shortest path from agent <i>a</i>'s start vertex to U is the same as the length of the shortest path from agent <i>a</i>'s start vertex to W, but U &ne W.  Here, F<sub>a</sub>(V,W,U)=0, as we've violated
the condition that agent <i>a</i> must visit W at the same time that we do.<br>
<i>Case 2:</i> U is agent <i>a</i>'s end vertex.  Here, F<sub>a</sub>(V,W,U)=1, as the only path that we may take is the empty path.<br>
<i>Case 3:</i> Neither of the above.  Here, we consider each "shortest path edge" that leads to a vertex T such that the length of the shortest path from our start vertex to T is not the same length of the shortest path from agent <i>a</i>'s
starting vertex to T.  We now recurse on F<sub>a</sub>(V,W,T), and add its result to our answer.<br><br>

C++ code that computes F<sub>a</sub>(V,W,U) using memoization follows.  Here, vMask is a bitmask of vertices that represents the set V above, agentBegin[a] and agentEnd[a] are the start and end rooms, respectively, for agent <i>a</i>, and onPath[a][U][T]
is a boolean value that tells us if edge (U,T) lies on a shortest path from agentBegin[a] to agentEnd[a].
<pre>
int F(int U, int vMask, int W) {
    if (sPath[agentBegin[a]][U] == sPath[agentBegin[a]][W] && U != W) return 0;
    if (U == agentEnd[a]) return 1;
    if (dp[U] != -1) return dp[U];
    int ret = 0;
    for (int T = 0; T &lt n; T++) if((vMask & (1 &lt&lt T)) == 0 && onPath[a][U][T]) ret += F(T,vMask,W);
    return dp[U] = ret;
}
</pre>

Another solution to this problem is found by observing that our problem is equivalent to the following: "Find a fixed shortest path from start to finish such that the probability of being captured is smallest."
Further, the "events" of being captured by specific agents are independent from one another, so it suffices to compute the probabilies of being captured by each agent individually.  Thus, if P(V,a) represents the probability
of being captured on our fixed path V by agent a, then the probability of being captured on path V is 1-(1-P(V,0))*(1-P(V,1))*...*(1-P(V,m)).  P(V,m) can be computed via dynamic programming, but its implementation is left as an exercise to the reader.<br><br>

<b>Exercises:</b><br>
5.1: Prove an exact upper bound on the maximum number of shortest paths possible between start and finish in an input graph for this problem.<br>
5.2: Generalize exercise 5.1 to solve the following problem: Given a positive integer N, output an undirected graph with N vertices with unit-weight edges such that,
for some pair of vertices, the number of shortest paths between them is maximum.<br>
5.3: Prove that the "fixed shortest path" formulation of this problem is equivalent to the original problem.<br>
5.4: For the "fixed shortest path" formulation of this problem, show that each agent may be treated independently when computing the probability of being captured.<br>
5.5: Can you use conditional probabilities to provide a solution to this problem that generates your path one vertex at a time?
</p>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/eleusive_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8369955" context="algorithm"/><br />
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
