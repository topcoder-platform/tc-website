<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505662" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 199</span><br>Wednesday, June 16, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p>
SRM 199 faced TopCoders with two of their most common fears: probability and
geometry.  <b>venco</b> took the top spot in Division-I with the only (out
of nine submitted) passing solution to the 1000-point problem.  A successful
challenge by <b>jonmac</b> lifted him up into second place, over third-place
<b>nullspace</b> who's rating is on track to shoot past the 2200 mark.
</p>
<p>
In Division-II, an unsuccesful challenge by <b>Savior</b> was not enough
to knock him out of the top spot, as he solved the 1000-point problem in
only 12 minutes and saw his rating jump 348 to bring him within 5 points
of Division-I.
<b>loveislife</b> and <b>Sputnik</b> finished second and third, separated
by less than 20 points.
</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1046&amp;rd=5074">StringMult</a></b>
</font>
<A href="Javascript:openProblemRating(1046)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505662" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      160 / 168 (95.24%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      151 / 160 (94.38%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>mckavity</b> for 247.81 points (2 mins 40 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      219.12 (for 151 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem required a program to multiply a string <b>sFactor</b> by an
integer <b>iFactor</b>,
according to a provided definition for performing such a multiplication.
The first step is to reverse <b>sFactor</b> if <b>iFactor</b> is negative.
Then, to an empty string, concatenate abs(<b>iFactor</b>) copies
of <b>sFactor</b>.
</p>
<p>
In pseudocode:
</p>
<pre>
    if <b>iFactor</b> &lt; 0 {
        reverse <b>sFactor</b>
        <b>iFactor</b> = -<b>iFactor</b>
    }

    ret = ""
    for i = 1 to i<b>Factor</b> {
        ret = ret + <b>sfactor</b>
    }

    return ret
</pre>
<p>
If implemented correctly, you do not need to worry about the special cases
of the string being empty or the integer being zero, although sometimes
it's easier to just code the special cases explicitly than to convince
yourself that your program handles them correctly.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2889&amp;rd=5074">TriangleCount</a></b>
</font>
<A href="Javascript:openProblemRating(2889)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505662" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      86 / 168 (51.19%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      76 / 86 (88.37%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>sputnik33</b> for 463.05 points (8 mins 9 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      305.09 (for 76 correct submissions)
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
      133 / 151 (88.08%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      128 / 133 (96.24%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>venco</b> for 245.63 points (3 mins 48 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      191.60 (for 128 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
To solve this problem, coders had to write a program to return the total
number of triangles (of any size) in a piece of a triangular grid.
This is by no means an original problem -- see the "<a
href = "http://mathworld.wolfram.com/TriangleTiling.html">Triangular
Tiling</a>" article on <a
href = "http://mathworld.wolfram.com">mathworld.wolfram.com</a>.
Some people solved this problem by counting the number of triangles
for the first few sizes, and then entering them into the <a
href = "http://www.research.att.com/~njas/sequences/">On-Line
Encyclopedia of Integer Sequences</a> to find the closed-form solution.
</p>
<p>
However, even without finding a closed-form solution, it was a simple matter
to loop over all the triangles and count them.  See <b>venco</b>'s program
for a nice example of such a solution.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2360&amp;rd=5074">Transpose</a></b>
</font>
<A href="Javascript:openProblemRating(2360)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505662" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      26 / 168 (15.48%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      19 / 26 (73.08%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Savior</b> for 853.22 points (12 mins 13 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      571.82 (for 19 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Taking the transpose of a non-square matrix in-place sounds like a simple
enough problem, but an elegant algorithm is elusive.
The key is to come up with a formula that gives you, for a given index
in the list, the new index that this element must be copied to.
This formula can be derived as follows:
</p>
<blockquote>
<p>
Given an index <i>i</i>, its position in a matrix with <b>M</b> rows and
<b>N</b> columns is:
</p>
<pre>
    row = <i>i</i> / <b>N</b> (integer division)
    col = <i>i</i> % <b>N</b> (modulo operator)
</pre>
<p>
Swapping the row and column, and <b>M</b> and <b>N</b>, the new location
<i>i<sub>2</sub></i>
is:
</p>
<pre>
    <i>i<sub>2</sub></i> = col*<b>M</b> + row = (<i>i</i> % <b>N</b>)*<b>M</b> + (<i>i</i> / <b>N</b>)
</pre>
</blockquote>
<p>
By iterating the above formula, you will eventually return to your starting
element, and there will likely be many such cycles.
Copying each element to its next position in a cycle of <i>n</i> elements
requires <i>n</i>-1 swaps.
So, to compute the total number of swaps required to copy each element to its
next position (and thus inverting the matrix), you simply must find all the
cycles, subtract 1 from their lengths, and compute the sum.  Note that since
the sum of all the cycle lengths must be <b>M</b>*<b>N</b>, this is equivalent
to <b>M</b>*<b>N</b> minus the number of cycles.
</p>
<p>
See <b>sputnik's</b> program for a clean implementation of this solution.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2436&amp;rd=5074">ChipRace</a></b>
</font>
<A href="Javascript:openProblemRating(2436)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505662" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      94 / 151 (62.25%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      72 / 94 (76.60%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gilbert</b> for 449.00 points (9 mins 48 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      302.75 (for 72 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Problems dealing with probability intimidate many people, but the nice
thing about this problem is that once you figure out how to solve it,
the program can actually be quite short and elegant.
</p>
<p>
The probability of a player winning a chip is equal to the sum of the
probabilities of all the different ways that can happen.
That is, it is the probability
that he will win the <i>first</i> chip, plus the probability that he will win
the <i>second</i> chip, plus the probability that he will win the <i>third</i>
chip, etc.
The probability that he will win the <i>first</i> chip is the chance that
he has the highest card, which is simply the number of cards he gets divided
by the total number of cards.
</p>
<p>
The probability that he will win the <i>second</i> chip is the chance that
he has the highest card of those remaining after <i>some other</i> player
wins the first chip.
This can computed by looping over all the other players and taking the sum
of the chance that that other player wins the first chip,
times the chance that our first
player wins the second chip (his number of cards divided by the number
of cards remaining).
The probabilities for winning the third and later chips can be computed
similarly.
</p>
<p>
This can be coded very succinctly as a recursive function.  For a nice
example, see <b>gilbert</b>'s solution, who, incidentally, took an early lead
after submitting his first two problems, only to knocked down later by a
successful challenge to his 250-point problem.  The small limits to the
input parameters allow a good recursive solution to work without the need
for memoization.
</p>
<p>
Of those who
submitted this problem, over three quarters got it right.  The most
common reasons for failing were due to precision problems or timing out
on the worst possible case (10 fours).
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2890&amp;rd=5074">ClosestPoints</a></b>
</font>
<A href="Javascript:openProblemRating(2890)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505662" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      9 / 151 (5.96%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1 / 9 (11.11%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>venco</b> for 466.48 points (42 mins 27 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      466.48 (for 1 correct submission)
    </td>
  </tr>
</table></blockquote>

<p>
At first, this problem seems simple: generate a bunch of random points
and find the closest pair.  However, the range of the input parameters (up
to 150,000 points with coordinates -1,000,000 to 999,999, obviously
prevents a simple brute force solution for running in under eight seconds.
The key to many TopCoder problems is to identify which algorithm to use,
but my goal for this problem was to emphasize selecting a good data structure.
</p>
<p>
This problem can be solved with the use of a "spatial" data structure,
which arranges the points based on their position in order to avoid testing
pairs of points that cannot possibly be the closest.  The simplest such
data structure is a fixed grid, where space is divided up into a
three-dimensional array of boxes, and as points are generated they are
sorted into their corresponding boxes.  Provided that the boxes are
sufficiently populated, points only need to be compared to other points
in their box and to the points in the 26 neighboring boxes.  Such a solution
would fail if there were too few points, and the closest pair were not
in neighboring boxes.  It would also time out of the points were not
evenly distributed, and all of the points ended up in just a few boxes.
Fortunately, the pseudo-random number generator used in this problem
distributes the points quite evenly.
</p>
<p>
Another solution is to use an "octree" or a "kd-tree", which are
three-dimensional versions of a binary trees.  Each node of an octree
is divided in x, y, and z, resulting in eight children.  As points are inserted
into the octree, nodes are adaptive subdivided when they contain too many
points.  Finding the closest pair of points can be accomplished by
recursively comparing the octree to itself, and stopping the recursion
early at each step when the two nodes being compared are farther apart
than the closest pair found so far.
</p>
<p>
A "kd-tree" (used by <b>venco</b> for the only passing solution to this
problem) is more efficient, splitting each node by a single plane, chosen
to divide the points along the major axis of their bounding box.
</p>
<p>
Several people attempted to solve this problem by sorting the points based
only on their x coordinate.  They then did an N<sup>2</sup> comparison,
but visited the points in sorted order, and broke out of the inner loop
early when the difference of their x-coordinate was larger than the
closest distance found so far.  These solutions actually worked fine for
the largest parameter values when the points were spread out far apart.
But when the range of coordinates was reduced, and there were several thousand
points with each possible x coordinate, these solutions still compared too many
points.
</p>
 
 
<p>
<img src="/i/m/legakis_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="287269" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
