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
</head>

<body>

<jsp:include page="/top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180">
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505992" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 317</span><br>Thursday, August 24, 2006
<br><br>

<h2>Match summary</h2>


<p>
Single Round Match 317 started with a record number of 1,134 registrants. Also, many
top ranked coders had signed in, so the table was set for a great match. But just a
couple of minutes after the start of the match, some technical problems
had the competition stopped for about half an hour and made the remaining part strange
(including almost instant submissions of the easy problems) and also, of course, not worth
any money or rating points.
</p>
<p>
Surely this is the last time I add a joke in the <a href=/tc?module=Static&d1=match_editorials&d2=srm313>editorial of a match</a> 
about making things go wrong on purpose. (I didn't! I didn't!).
Anyhow, at least people who stayed got to do the problems for fun and practice.
After all, every problem deserves to be solved -- and later explained in an editorial --
so here we go.
</p>
<p>
Disclaimer: Since there will be no statistics about this match for the mentioned problems,
I won't add links to code that you can follow for implementations, but I suggest you check
any code that passed system tests to see the implementation in your favorite language,
or go to the practice room for this SRM and look for code there.

<H1>The Problems</H1>
</p>

<font size="+2"><b>ReversingBrackets</b></font>
<%--
<A href="Javascript:openProblemRating(6618)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505992" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
--%>
<br>
<p>
This problem was fairly easy, and most coders were able to solve it correctly. The only
tricky case was correctly handling an empty set of brackets, but that only made a few
submissions fail. Depending on how well you managed your own language string functionality,
you could submit almost instantly or a little bit slower. The solution involves two simple steps:
<ul>
<li>Find the position <i>i</i> of the opening bracket and the position <i>j</i>
of the closing bracket. If there are no brackets, return the same string as the input.
<li>Return <tt><b>s</b>.substr(0,i) + <b>s</b>.substr(i+1,j).reverse() + <b>s</b>.substr(j+1,n)</tt>
where <i>n</i> is the length of <b>s</b>.
</ul>
All languages have library functions for taking a substring and reversing a string, but
even if you didn't know them ahead, writing your own wasn't difficult.
</p>
<br>

<font size="+2"><b>PalindromicNumbers</b></font>
<%--
<A href="Javascript:openProblemRating(6619)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505992" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
--%>
<br>
<p>
Solving this problem depended only on the fact that in the entire range of possibilities
(integers between 1 and 10<sup>9</sup>) there is a small number of palindromic numbers
(exactly 109998), and they are easy to generate.
</p>
<p>
The best way to generate all palindromic numbers was to separate them between even and odd length.
</p>
<p>
The even length numbers can be generated by taking a number <i>n</i> and concatenating <i>n</i>
reversed (remembering to <b>use</b> the leading zeroes of the reversed form, because they will
not be leading in the resulting number). Note that if <i>n</i> has <i>k</i> digits, the generated palindromic
number has 2<i>k</i> digits. This means the biggest <i>n</i> that may be used to generate in this case has 4
digits (9999).
</p>
<p>
For generating the odd length palindromic numbers there were two similar approaches. Take <i>n</i> and a digit
<i>d</i> and concatenate <i>n</i>, then <i>d</i> and then <i>n</i> reversed (note that in this case we have
to handle the case of 1 digit numbers and the best way was to do it separately) or just take <i>n</i>,
reverse its digits and concatenate both but not use the last digit of <i>n</i> (or the first digit of it's
reversed form). In the first case, <i>n</i> can also have at most 4 digits and <i>d</i> has 10 choices, therefore in
total there are at most 9999*10 possibilities. In the second case, <i>n</i> can have up to 5 digits (because
<i>n</i> having <i>k</i> digits generates a 2<i>k</i>-1 digit number) and therefore the possibilities are 99999.
</p>
<p>
In both cases, after generating each number, see whether it lies in the specified range,
and if it does, increase the counter. Most correct solutions used a variation of this approach.
</p>
<br>

<font size="+2"><b>OrderingCount</b></font>
<%--
<A href="Javascript:openProblemRating(6538)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505992" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
--%>
<br>
<p>
This problem is about counting the number of <a href=http://en.wikipedia.org/wiki/Topological_sort>
topological sorts</a> of a given set of elements.
Topological sort of any directed graph can be achieved by a known algorithm, but that
algorithm gives <i>any</i> topological sort that satisfies all constraints, so we can only
use it to decide between zero and non-zero cases.
</p><p>
Seeing the number of elements being at most 20 should made you realise this probem was
probably an exponential one. In fact, as in many previous TC problems, the whole idea relied in
putting the number of orderings of some set as a function of the number of orderings of its
subsets. Since there are only 2<sup>20</sup> subsets (and this is a little above 1000000) this
seem like a feasible approach.
</p><p>
We can see any order of the subset <i>S</i> as an element <i>e</i> and an ordering of the
elements of <i>S</i> - {<i>e</i>}. We can only select as <i>e</i> the elements such that no
element of <i>S</i> (this includes <i>e</i> and therefore takes care of a<sub>i</sub> &lt;
a<sub>i</sub> requirements) is required to be before <i>e</i>. In this fashion, we iterate
all possible elements, and for each one of them we add f(<i>S</i> - {<i>e</i>}) to the result.
</p><p>
More formally, f(<i>S</i>) = sum over elements <i>e</i> of <i>S</i> such that no element
of <i>S</i> is required to be before <i>e</i> of [ f(<i>S</i> - {<i>e</i>}) ].
Of course, f on the empty set is 1 (because there is only one way to order no elements).
If defining the function on the empty set is not clear enough, you can say that f applied
to a set of a single element is 1 if the element is not required to be before itself and
0 if it is.
</p><p>
This recursive function is easily memoizable in an array of at most 2<sup>20</sup> positions,
or you could make an iterative dynammic programming approach can based on the same idea. There
are codes of both approaches among passed solutions.
</p>
<br>

<font size="+2"><b>CollectingPayment</a></b></font>
<%--
<A href="Javascript:openProblemRating(6540)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505992" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
--%>
<br>
<p>
This problem was pretty classic, but coders had a little more trouble with it than with the usual mediums --
although given the overall problems that arised on this match, the coders' concentration was probably affected.
</p>
<p>
By looking at the problem, the typical dynammic programming bell rings in a regular division 1
topcoder. But suddenly, a little problem appears: the final amount depends on previous events.
More precisely, since interest is added for the whole amount in your account, you can't forget
about previously deposited checks, because their amount is still to be increased.
</p>
<p>
But this problem can be solved by seeing that once you deposit a check, you can calculate
how its amount is going to be increased from that point up to the end of the year and
then forget about it. To clarify this, first let's see that increasing your account by
<b>rate</b>*A/1000, as the problem states, is the same as multiplying the amount by
<b>rate</b>/1000+1. Similarly, having <i>n</i> Sundays, means multiplying <i>n</i> times
by that number, which is the same as multiplying once by (<b>rate</b>/1000+1)<sup><i>n</i></sup>.
</p>
<p>
More formally, if f(<i>d</i>) is the function that says how much money you can make after
the day <i>d</i>, we can define f as the maximum over all possible days <i>d'</i> &gt; <i>d</i> of
f(<i>d'</i>) + check(<i>d</i>,<i>d'</i>)*(<b>rate</b>/1000+1)<sup>numberOfDays(<i>d</i>,<i>d'</i>)</sup>,
where check is the amount of a check that has all payments between <i>d</i> and <i>d'</i> (you can
define it as 0 if that amount is lower than the fee, since the final profit will never be lower
than 0) and numberOfDays is the number of interest adding days between them. This recursive
function leads, as usual, to a memoized or iterative version of a DP solution of the problem.
</p>
<p>
It was also possible to define the function f only on Sundays, because there is always an
optimal solution that asks all checks on Sundays. Another approach was to only ask for checks
in delivery days (i.e., in days mentioned in <b>moment</b>). The two approaches are a little
faster on runtime, but using every day was fast enough to get the problem correctly. Using only
Sundays simplify a little the problem, because the number of interest adding days between two
points is simpler to calculate.
</p>
<br>

<font size="+2"><b>CuttingPaper</b></font>
<%--
<A href="Javascript:openProblemRating(6621)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505992" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
--%>
<br>
<p>
This problem proved to be quite difficult, and not many coders were able to solve it -- even
when a good number seemed to be on the right track, it was difficult to get the whole idea
together.
</p>
<p>
The first thing to notice is the "graph" smell the problem has. The graph to build here
is seeing vertices of squares as nodes and lines between squares as edges (actually, we'll
think as edges only those lines that are to be cut -i.e., lines
that separate two different non-space characters). With this graph built, you can rethink
the problem as "given this graph, what's the least number of disjoint simple paths that
cover the whole graph" with the only additional restriction of at most 1 path going
through each node (this arises by carefully examining example 5, note that we call going through
to passing by it, not start or end on it). Also, all nodes must be
reachable from empty space (to make the thing cuttable), which means in each
<a href=http://en.wikipedia.org/wiki/Connected_component_%28graph_theory%29>connected component</a>
that has at least one edge there must be at least one node that is a vertex of a non-papered
square. We'll further call this nodes "space nodes.&quot; If that does not happen (we can check
it with a simple DFS or flood), we return -1.
</p>
<p>
Making use of knowledge about <a href=http://en.wikipedia.org/wiki/Eulerian_path>eulerian
paths</a> you can see that, without the additional restriction, the problem is simply the sum
of the number of odd degree nodes divided by 2. But that restriction makes the problem a bit
different. This is when good knowledge of the theory comes into play. By carefully looking at
the demonstration for the quoted euler theorem, one can see that is a "greedy approach" that
still works in this case, but slightly modified.
</p>
<p>
Let's suppose a given node has degree <i>d</i>. Suppose <i>p</i> paths pass through (i.e., use
the node, but don't start or end on it) the node. That means <i>d</i>-2<i>p</i> paths start or
end in it. In this case, by the additional restriction mentioned, <i>p</i> is at most 1. Also
in "space nodes" <i>p</i> has to be 0, because a cut cannot pass through that point. Since we want
to minimize cuts, is better to have <i>p</i>=1 in each of the other nodes, and that's always
possible because at this point each connected component has at least one "space node" (the only
restriction for a node that has a degree greater than 1 to be a passing node would be to be part
of a component with all <i>p</i>=1 edges, because someone has to be the starting node, but since
"space nodes" can play that part, there's no trouble to assign <i>p</i>=1 to each possible edge).
Therefore, the final algorithm is, for each node with degree <i>d</i> we sum
<i>d</i> to the accumulated result if its a space node or it has degree less or equal than 1
(cases for <i>p</i>=0) or <i>d</i>-2 otherwise (cases for <i>p</i>=1). Finally, since each path
has 2 endpoints, divide the accumulated result by 2, and return that number.
</p><p>
Note: Actually, in non-space nodes with <i>d</i>&gt;1 we <b>must</b> have <i>p</i>=1, because if
we have <i>p</i>=0, that means that <i>d</i> cuts starts or ends there, and the first one that
does it will be violating cutting rules (you can only start a cut in an already used vertex/node
or in a "space node"). With <i>p</i>=1 we can have first the cut that passes
through and after that the cuts that start or end, that are then valid as in example 5.
</p><p>
As a final comment, as you can see by the proof, it was also possible to do a greedy approach:
start at any possible point and cut until you can't go on. Add 1 to the counter. Cut again.
Add 1... and so on. If all parts left are all single-coloured, return the counter, else return
-1. The reason why this works is the same as the reason why the analytical approach works.
Of course, coming up with both is similar in difficult, and once you have the idea, the analytical
approach is much easier to code. Probably that's why no passed solution and no reference or
tester solution used the greedy approach.
</p><div class="authorPhoto">
    <img src="/i/m/soul-net_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="15231364" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>


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
