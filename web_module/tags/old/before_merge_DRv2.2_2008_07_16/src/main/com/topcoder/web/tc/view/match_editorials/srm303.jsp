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
<tc-webtag:forumLink forumID="505869" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 303</span><br>Thursday, May 18, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
With 843 registrants, this single round match again had a healthy
amount of participants, even though no money prizes were at
stake. Unfortunately, some of the top-ranked competitors were missing
out, as they were busy winning <A target="_blank"
HREF="http://ipsc2006.ksp.sk/index.php">the internet problem solving
contest</A>. Congratulations to <tc-webtag:handle coderId="260835"
context="algorithm"/>, <tc-webtag:handle coderId="144400"
context="algorithm"/>, and <tc-webtag:handle coderId="270505"
context="algorithm"/> for this impressive feat! (and in the individual
division the top 3 were TopCoders as well: congrats to
<tc-webtag:handle coderId="10574855" context="algorithm"/>,
<tc-webtag:handle coderId="275071" context="algorithm"/>, and <tc-webtag:handle coderId="7433858" context="algorithm"/>.)
</p>
<p>
In this SRM the division 1 coders faced a tricky-to-code 250, a
tricky-to-see 500 and a pretty straightforward 1,000. The division 2
coders had the tricky 250 of division 1  
as the medium and an interesting problem concerning a combination of
primes and palindromes as the 1,000.
The tricky 500 of division 1 lured a large number of coders (including
yours truly) into coding a solution taking the wrong (greedy) approach. As
always, the challenge phase is exciting with this kind of
problem. With 158 challenged problems in division 1, this SRM ranks
within the top 10 of matches with the most challenges.
</p>
<p>
In the end, <tc-webtag:handle coderId="7442498" context="algorithm"/>
took home the win. <tc-webtag:handle coderId="15868491"
context="algorithm"/> came in second and, with 5 challenges on the 500,
<tc-webtag:handle coderId="8355516" context="algorithm"/> took the bronze. In division 2, newcomer <tc-webtag:handle
coderId="20289202" context="algorithm"/> secured the win with a fast
1,000 and 3 correct challenges. <tc-webtag:handle coderId="15906238"
context="algorithm"/> was a close second, with <tc-webtag:handle
coderId="11787671" context="algorithm"/> coming in third.
</p>
 
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6251&amp;rd=9824"
name="6251">Segments</a></b>
</font>
<A href="Javascript:openProblemRating(6251)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505869"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      239 / 471 (50.74%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      44 / 239 (18.41%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dubna</b> for 238.13 points (6 mins 24 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      150.68 (for 44 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Although coding a few 'if's' to handle the different configurations of
line segments may seem tempting at first, boundary cases make such an
approach hard 
to get right (as is reflected by the success rate of this problem). In
this problem, one such a boundary case consists of a 
line segment that actually is just a point, which lies on another
segment. Many if-based solutions return "SEGMENT" in this case,
instead of "POINT". An easier solution is to write code that naturally
handles all possible cases. 
</p><p>
With a few min's and max's we can easily determine the overlapping
region of
the two line segments, and then see if this is a point, a segment, or
if there is no overlap.
</p><p>
In code: 
<pre>
  int left = max(min(s1x1, s1x2), min(s2x1, s2x2));
  int right = min(max(s1x1, s1x2), max(s2x1, s2x2));
  int top = max(min(s1y1, s1y2), min(s2y1, s2y2));
  int bottom = min(max(s1y1, s1y2), max(s2y1, s2y2));

  if(top > bottom || left > right)
    return "NO";

  if(top == bottom && left == right)
    return "POINT";    

  return "SEGMENT";
</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6093&amp;rd=9824"
name="6093">SpiralNumbers</a></b>
</font>
<A href="Javascript:openProblemRating(6093)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505869"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      157 / 471 (33.33%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      44 / 157 (28.03%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>marting</b> for 433.23 points (11 mins 31 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      290.09 (for 44 correct submissions) 
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
      279 / 310 (90.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      178 / 279 (63.80%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gevak</b> for 244.92 points (4 mins 6 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      161.42 (for 178 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem asks for a simple simulation of a spiraling sequence of
numbers. However, with a maximum number of steps of more than 2
billion, a naive solution will time out. Observing that the lowest odd
square number lower than N gives the last number of the last completed
square can be used to start the search at a much higher number. This
reduces the runtime from O(n) to O(n<sup>1/2</sup>), which easily runs
in time.
</p><p>
Maybe an even simpler approach is to simulate the spiral using bigger
steps than 1, as the spiral takes 1 step right, then 1 step down, then 2 steps
left, then 2 steps up, then 3 steps right, etc. In pseudocode:
<pre>
  cur = 1
  direction = right
  size = 1
  x = 0, y = 0
  
  while(true) {
    repeat twice {
      if(N - cur > size) {
        update x and y with (size) steps in the current direction
	direction = rotate(direction)
	cur += steps
      }
      else
      {
        update x and y with (N-cur) steps in the current direction
	return "(x,y)";
      }
    }
    size ++;
  }
</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6063&amp;rd=9824"
name="6063">PrimePalindromic</a></b>
</font>
<A href="Javascript:openProblemRating(6063)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505869"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      18 / 471 (3.82%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 18 (44.44%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>wojtekt</b> for 711.42 points (19 mins 52 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      565.63 (for 8 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem can be solved by simply checking all integers in the
requested range one-by-one whether they are prime 
palindromic. To check this for a certain integer, the list of prime
factors of that integer needs to be determined, and then one can
simply try every 
permutation of these factors to see if they form a
palindrome. Checking all permutations may seem slow, especially with a
maximum number of prime factors that can be 13 (for 8192=2<sup>13</sup>).
But as all these factors are the same, there is only one true
permutation instead of 13!. The
number with the maximum number of permutations is 
7560 (=2<sup>3</sup>*3<sup>3</sup>*5*7), and this number has only 1120
permutations. With such small numbers of permutations, the factor-finding and
palindrome-checking routine don't even need to be sophisticated to let
a solution run in time.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6070&amp;rd=9824"
name="6070">Knights</a></b>
</font>
<A href="Javascript:openProblemRating(6070)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505869"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      128 / 310 (41.29%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      16 / 128 (12.50%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ying</b> for 433.60 points (11 mins 29 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      312.28 (for 16 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
With knights attacking eachother on a chess board, a graph
representation immediately springs to mind. We're asked to find a
minimal set of nodes (knights) to remove so that no edges (attacking
knights) in the graph remain. 
This is exactly the
<a href="http://en.wikipedia.org/wiki/Vertex_cover_problem">vertex
cover problem</a>. But hey, isn't this the same thing as the <a
href="/stat?c=problem_statement&pm=6165&rd=9983">250
problem</a> from the wildcard round of the last TCO? Yes, almost, but in
the wildcard problem the graph was guaranteed to be a tree. For a
tree, a simple solution can repetitively pick nodes that
are attached to a tree leaf, and this is guaranteed to yield a minimal
cover. We could try the same thing in this
problem too, but in most cases, we'll end up with a connected
component, which is hard to handle. As the referenced wikipedia page
mentions, minimal vertex cover is 
an NP-complete problem in general graphs. It is equivalent to a
maximum matching in the same graph (as the maximum matching
automatically selects the minimum number of edges from which one of
both attached nodes should be removed). This translation is the
key to this problem, together with the observation that the graph in
this problem is by no means general. A knight that stands on a white
square can only attack knights on black squares and vice versa. This
means that the graph is bipartite. Therefore, the maximum matching can
be easily calculated. See the topcoder algorithm tutorial about this
subject for more information (<a
href="/tc?module=Static&d1=tutorials&d2=maxFlow">[part
1]</a><a
href="/tc?module=Static&d1=tutorials&d2=maxFlow2">[part
2]</a>).</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6062&amp;rd=9824"
name="6062">FourBears</a></b>
</font>
<A href="Javascript:openProblemRating(6062)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505869"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      13 / 310 (4.19%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 13 (46.15%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 607.16 points (26 mins 49 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      548.59 (for 6 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Probably the main reason why so few people solved this 1000 is the 500
took many people too much time. 
The question is how to search all possible paths the four bears could
take to get together. It is easy to see that once two bears
are in the same square, they will always travel together, because then
they have to clear fewer passages. 
Therefore, all possible solutions are checked when we try to join the
left two bears at all possible locations, and join the right two bears
at all possible locations. (Except in some cases, it is better to join
the top two bears and bottom two bears, and let those two pairs
meet. This exception was already demonstrated by test case #2.)
In pseudocode:
<pre>
  result = MAX
  foreach meet1 in squares:
    foreach meet2 in squares:
      value  = distance(bear1, meet1) + distance(bear2, meet1) +
               distance(bear3, meet2) + distance(bear4, meet2) +
	       distance(meet1, meet2) + correction(meet1, meet2);
      value2 = distance(bear1, meet1) + distance(bear3, meet1) +
               distance(bear2, meet2) + distance(bear4, meet2) +
	       distance(meet1, meet2) + correction(meet1, meet2);	       
      result = min(min(value,value2, result)
    
  return result;
</pre>

The "correction" function mentioned above is needed to make sure that
when either meet1 or meet2 are rocks, the clearing of those rocks
isn't counted double. To have all the distance(x,y) functions ready,
we do a <a
href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs3#floydWarshall">Floyd-Warshall</a>.
The initial state of the distance matrix must be carefully constructed
so that the constraint that bears can't move vertically on the first
and last columns is taken care of.
</p><div class="authorPhoto">
    <img src="/i/m/mathijs_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="262056" context="algorithm"/><br />
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
