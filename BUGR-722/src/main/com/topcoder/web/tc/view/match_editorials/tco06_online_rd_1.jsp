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
<tc-webtag:forumLink forumID="505931" message="Discuss this match" /></div>
<span class="bodySubtitle">2006 TopCoder Open <br> Online Round 1 </span><br>March 4, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
Other complications aside, the problem set for this round generated
very few questions.  Each statement was fairly succinct, but as we all
know, tricky problems can have simple descriptions.  The medium,
which had the shortest problem statement, also had the fewest number
of correct submissions.  The usual suspects solved all three problems
fairly quickly.  Petr took first place by almost 150 points.  kia, the
second place finisher, earned 200 points challenging level 2 submissions.
</p> 

<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6095&amp;rd=9917" name="6095">SeparateConnections</a></b> 
</font> 
<A href="Javascript:openProblemRating(6095)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505931" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      350 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      558 / 685 (81.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      317 / 558 (56.81%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>antimatter</b> for 346.96 points (2 mins 39 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      269.43 (for 317 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem required coders to find a maximum matching in an
arbitrary graph.  This is much trickier than the bipartite case, but
luckily the constraints allowed for many simpler solutions.  One
possible solution
is to consider all possible ways of splitting the nodes into 2
roughly equal sized groups, and then run bipartite matching each
time.  Another is to sort the nodes by degree, and then run a simple
recursive algorithm that tries to add, for each node n, any
available edge incident to n to the matching.  The most popular
approach, which will be described here, was
memoization.  Using this technique, antimatter was able to solve the
problem in 2 minutes and 39 seconds!
</p>
<p>
To solve the problem using memoization, we write a function: 
<pre>   int solve(int bitmask, boolean[][] adjacencyMatrix) </pre>
Given a bitmask describing some subset of the vertices, solve will
determine the largest matching using only those vertices.  For each
edge e between allowed vertices, we recursively call solve on the
smaller vertex set obtained by removing the ends of e.  Using the
bitmask as a cache key, we can memoize solve, and thus achieve a fast
enough algorithm to pass systests.
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6054&amp;rd=9917" name="6054">FirstToLast</a></b> 
</font> 
<A href="Javascript:openProblemRating(6054)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505931" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      438 / 685 (63.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      118 / 438 (26.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>IvanRomanov</b> for 460.90 points (8 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      272.82 (for 118 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Our goal is to find the smallest positive integer n (less than 2
billion) such that 
<pre>   R(n) = pn/q, </pre>
where R(n) (rotate) is obtained by removing the leftmost (most significant) digit of n and
attaching it on the right side.  For example, R(71) = 17 and
R(103) = 31.  We first analyze the behavior of R(n) when n has k
digits, and the leftmost digit is d: 
<pre>   R(n) = (n - 10<sup>k-1</sup>d)*10 + d = 10n - 10<sup>k</sup>d + d.</pre>
Solving 'R(n) = pn/q' for n, we obtain: 
<pre>   n = dq(10<sup>k</sup> - 1)/(10q - p). </pre>
The denominator causes some worry, but observe that R(x) is always
less than 10x, so we
can immediately return -1 if p &gt;= 10q.  This formula is nice, since
we can try all possible d and k values very quickly, and each time get
an n.  Then we simply check that this generated n actually has length k and
starts with d.  We return the smallest positive n less than 2 billion
that works, or -1 if none do.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6052&amp;rd=9917" name="6052">NumPermutationOrders</a></b> 
</font> 
<A href="Javascript:openProblemRating(6052)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505931" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      900 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      219 / 685 (31.97%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      173 / 219 (79.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 880.74 points (4 mins 13 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      532.59 (for 173 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Here we must find the number of possible orders of permutations on the
set S = {1,...,n}.  The order of a permutation p is the smallest positive
k such that p<sup>k</sup> = 1, where 1 is the identity permutation.  When working
with permutations, one often looks at their cycle structure.  For
example, suppose we have the following permutation p: 
<pre>   1->3, 2->6, 3->5, 4->1, 5->4, 6->7, 7->2, 8->8</pre>
Then we can also write p as (1 3 5 4)(2 6 7)(8), where the numbers in
parentheses represent cycles.  As another example, suppose q is
defined as follows: 
<pre>   1->2, 2->1, 3->4, 4->3</pre>
Then the cycle structure of q is (1 2)(3 4).  To obtain the cycle
structure we just begin at 1, and keep apply the permutation until we
reach 1 again.  Then we repeat this process on another value.  Looking
at the cycle structure, we can see that the order of p is 12 and the
order of q is 2.  As it turns out, the order of a permutation is
actually the least common multiple (lcm) of the lengths of its cycles.  Our
problem actually looks at this issue from another direction: which
orders are possible?  An order k is possible if we can write a
permutation S whose cycle lengths add up to n, and the lcm of the
lengths is k.  Since we can always tag on cycles of length 1, we can
relax these constraints by letting the cycle lengths sum up to a value
that is at most n.  So now we are basically looking for a sequence of
lengths 
<pre>   L<sub>1</sub>, L<sub>2</sub>, ..., L<sub>r</sub></pre>
whose sum is minimal, and whose lcm is k.  We can achieve this by
using distinct prime powers for each L<sub>i</sub>.  Thus, we can solve this
problem by determining the number of sums of distinct prime powers
that are less than n.
</p>
<p>
To solve this new problem, we first enumerate all primes less than or
equal to n.  Then we write a function 
<pre>   int solve(int primeIndex, int n, int[] primes)</pre>
which determines the number of distinct prime power sums less than n
using only the elements of primes whose indices are at least primeIndex.
We can implement solve recursively by trying various powers of
primes[primeIndex], and then calling 
<pre>   solve(primeIndex+1,n-primes[primeIndex]<sup>j</sup>,primes)</pre>
to solve the associated subproblem.  Using primeIndex and n as the cache key, we
can memoize this function, and thus obtain a quick enough solution to pass tests.
</p>


<div class="authorPhoto">
    <img src="/i/m/brett1479_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />
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
