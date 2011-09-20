<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 433 Problem Set &amp; Analysis</title>

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
    <a href="/stat?c=round_overview&er=5&rd=13695">Match Overview</a><br />
    <tc-webtag:forumLink forumID="525444" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 433</span><br />
Wednesday, January 21st, 2009
<br /><br />

<h2>Match summary</h2> 



<p> 

SRM 433 had an unbelievable challenge phase - 

<tc-webtag:handle coderId="306707" context="algorithm"/>

outchallenged 

<tc-webtag:handle coderId="10574855" context="algorithm"/>

and won the match by a mere 5 points. TopCoder titans 

<tc-webtag:handle coderId="19849563" context="algorithm"/>

and

<tc-webtag:handle coderId="8357090" context="algorithm"/>

were a hundred points behind.

In Division 2, 

<tc-webtag:handle coderId="22763061" context="algorithm"/>

dominated the field winning by more than 100 points, 

with veteran  

<tc-webtag:handle coderId="343655" context="algorithm"/>

and

<tc-webtag:handle coderId="22629065" context="algorithm"/>

coming second and third, respectively. 

The Division 2 - 1000 problem appeared to be quite hard, with only 12 correct submissions.

</p>

 

<H1> 

The Problems 

</H1>

</p> 



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10007&amp;rd=13695" name="10007">RoyalTreasurer</a></b> 

</font> 

<A href="Javascript:openProblemRating(10007)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525444" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      768 / 824 (93.20%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      728 / 768 (94.79%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>devil911</b> for 249.98 points (0 mins 13 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      220.79 (for 728 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This was a pretty classical problem. If you want to minimize the sum of A<sub>i</sub> * B<sub>i</sub>, you should

multiply the smallest A<sub>i</sub> by the largest B<sub>i</sub>, the second-smallest A<sub>i</sub> by the second-largest B<sub>i</sub>,

and so on. In other words, if B<sub>i</sub> > B<sub>j</sub>, then A<sub>i</sub> must not be greater than A<sub>j</sub> (you can

prove this by contradiction). The java code follows:

</p>

<pre>

	public int minimalArrangement(int[] A, int[] B) {

		Arrays.sort(A);

		Arrays.sort(B);

		int res = 0;

		for (int i=0; i < A.length; i++)

			res += A[i] * B[B.length - i - 1];

		return res;

	}

</pre>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10195&amp;rd=13695" name="10195">MagicWords</a></b> 

</font> 

<A href="Javascript:openProblemRating(10195)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525444" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      276 / 824 (33.50%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      71 / 276 (25.72%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>shyym</b> for 441.43 points (10 mins 38 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      251.21 (for 71 correct submissions) 

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

      542 / 637 (85.09%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      328 / 542 (60.52%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>jzd</b> for 243.28 points (4 mins 44 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      161.26 (for 328 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem was harder than a usual problem of this slot. 

Nevertheless, there are at least 3 solutions which are guaranteed to pass any test under the given constraints.

</p>

<ol>

<li>

<p>Let us call a string S which has exactly K shifts equal to itself a <i>K-magic</i> string.

You may notice that string S being K-magic is equivalent to "string S can be divided into K equal substrings and cannot be divided into X > K equal substrings".

For example, string S = "ABCABCABCABC" is 4-magic because it consists of 4 "ABC"-s and can not be divided into a larger number of equal substrings. </p>

<p>

Therefore, to check whether string S of length L is K-magic you must first check if S is a concatenation of K equal substrings. 

If it doesn't, then S definitely is not K-magic. If it does, S can still possibly be divisible into X > K substrings.

To ensure S is a K-magic string, S must not be a multiple of a substring of length L / i (for each i between (K + 1) and L).

Each this check can be done in O(L) if i divides L, and in constant time if not, which gives us

the total estimation of O(L * sqrt(L)).

Multiplying this by the number of permutations of the input strings, we get the final time estimation at O(N! * L * sqrt(L)).

<tc-webtag:handle coderId="20315020" context="algorithm"/>'s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=300081&rd=13695&pm=10195&cr=20315020">solution</a> is an example of this approach.

</p>

</li>

<li>

Another approach was to use a KMP or some other string searching algorithm. 

After choosing a permutation from N! possibilities and obtaining a concatenation S (with length L) of the permuted strings, take string S2=S+S. The number of indices i (0 &lt;= i &lt; L) such that S = S2.substr(i,L) is exactly the number of shifts of S equal to the original. Using a Knuth-Morris-Pratt algorithm, you can find this number in O(L). So the overall complexity is O(N! * L).

</li>

<li>

You also may write an inefficient algorithm and optimize it using the following trick.

Let us permute the input strings in order {2,3,0,1} and concatenate to receice string S.

If S is K-magic, then concatenations of input for permutations {3,0,1,2}, {0,1,2,3}, {1,2,3,0} will be K-magic as well. 

(all these concatenations are cyclic shifts of each other). 

Therefore, your solution may check only permutations of the input which leave the first element of input on its place,

and then multiply the result by the total number of elements in the input.

</li></ol>



Besides those approaches, many coders had solutions using hash, memoization or other coding optimizations.







</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10009&amp;rd=13695" name="10009">MakingPotions</a></b> 

</font> 

<A href="Javascript:openProblemRating(10009)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525444" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      63 / 824 (7.65%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      12 / 63 (19.05%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>osan</b> for 691.84 points (21 mins 2 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      476.86 (for 12 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem splits into 2 independent parts: parsing the input into some data structure 

(should be easy for most coders trying to solve the problems of this level) 

and computing the price of LOVE. We'll concentrate on the latter.

</p>

<p>

Computing the price of any potion should be simple - either the potion could be bought on the market,

or there is a recipe which results in that potion.

Unfortunately, you need to compute the prices of recipes in a specific order - for example,

if you need WATER to get COFFEE, then you can not compute the price of COFFEE until you know the 

price of WATER. 

To make things worse, the dependencies may be cyclic, so you can not <a href="http://en.wikipedia.org/wiki/Topological_sorting">topologically sort</a> 

the potions to get the order of computations.

</p>

<p>

Fortunately, the constraints on this problem are quite low, so we can try using the following algorithm:

<ol>

<li>

Set the price of each potion to the market price (or to infinity, if the potion is unavailable on the market).

</li>

<li>

For each recipe, compute the price of the resulting potion using the current prices of all ingredients.

Update the current price of the resulting potion if needed.

</li>

<li>Return to point 2 <b>if needed</b>.</li>

</ol>

</p>

<p>

In general, the algorithm is not that hard. The only problem is "if needed" part. 

How do we know whether we've achieved the optimal price?

The answer to this question is very simple: 

if (in point 2) we tried all recipes and didn't update the price for any of the resulting components,

then we've reached the optimum. See <a href="http://www.topcoder.com/stat?c=problem_solution&cr=11955233&rd=13695&pm=10009">the fastest solution</a>

for an example of implementation (note that <tc-webtag:handle coderId="11955233" context="algorithm"/> didn't bother 

with checking for update on each loop).

</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10191&amp;rd=13695" name="10191">SettingTents</a></b> 

</font> 

<A href="Javascript:openProblemRating(10191)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525444" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      121 / 637 (19.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      91 / 121 (75.21%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 451.72 points (9 mins 29 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      281.67 (for 91 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem is quite similar to <a href="http://www.topcoder.com/stat?c=problem_statement&pm=8043">IsoscelesTriangle</a>,

and <a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=algoSemi02">the approaches</a> are quite similar.

</p>

<p>

The solution splits into 2 parts: a) checking all possible shapes of rhombs and 

b) computing the number of ways such a rhomb can be placed inside the designated area 

(if your implementation is not careful enough, then you have also part c) - make sure you dodn't count any rhomb more than once).

Subproblem b) is quite simple - you compute the dimensions Bx*By of the bounding box of the rhomb,

and the number of ways the rhomb can be placed inside the N*M area is either (N - Bx + 1)*(M - By + 1), 

or zero (if Bx > N or By > M).

</p>

<p>

Lets find a way to check all possible rhomb shapes.

To do that, lets start from the bottom vertex A of the rhomb (if a rhomb has 2 bottom vertices at the same level, choose the leftmost of them).

Now you need to check all possible directions and lenghts of the 2 edges coming out of the vertex A.

Checking all of them in a brute-force way will be too slow, since there are 100*100 = 10000 possibilities

for each edge. To optimize the search, we do the following trick: check all possibilities for the left of two

edges (10000 possibilities), and then start 'rotating' it clockwise to check all possibilities for the second edge (they must be of the same length).

</p>

<p>

'Rotation' can be implemented in the following way. 

Let the first edge be (x, y). We start incrementing x, checking the length of the new edge and adjusting it

when needed (increasing y if the edge is too short and decreasing if the edge is too long). 

If the length of the edge is equal to the length of the first edge, then these edges correspond to a rhomb.

We check the number of ways this rhomb can be placed inside the area (see subproblem b) above), 

and return the total for all possible directions of the first edge. 

The time complexity of this solution is O(N^3) - checking all possible directions on the first edge takes

O(N^2) and checking all rotations of the edge can be done in linear time.

</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10013&amp;rd=13695" name="10013">BarbarianInvasion</a></b> 

</font> 

<A href="Javascript:openProblemRating(10013)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525444" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      24 / 637 (3.77%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      11 / 24 (45.83%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>pmnox</b> for 809.92 points (14 mins 29 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      619.75 (for 11 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

<i>This problem is solved by maximum flow algotithm, so unexperienced coders may 

want to <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=maxFlow">read the tutorial</a> before going further.</i>

</p>

<p>

Lets start by solving easier versions of the problem. 

For example, what if all detachments would be of the same size?

This is a classical minimal cut problem. Indeed - think of all barbarian lands outside the country as of source,

the capital will be the sink, and all cells become the intermediate vertices of the graph. 

Two vertices in that graph will be connected only if the enemy can move directly between the 

corresponding cells on the map.

Since the flow can be limited in the cells  only(the barbarians can be stopped in the cells only, not between cells), 

we need to eliminate vertex capacities as it shown <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=maxFlow2">in the tutorial</a> (see Figure 7).

Lets call the edges added on this step (edges between vertices of the same color on Figure 7 in the tutorial)

<i>auxiliary edges</i>.

The capacities should be set to 1 for all auxiliary edges, and to infinity (replaced by a very big integer number) for all other edges. 

Now the answer of this simplified problem will be the size of the minimal cut in the graph.

</p>

<p>

Lets now try another simplification. 

Forget about "the minimal number of detachments" requirement, and 

try to find the minimal total size of all detachments needed to protect the capital 

(now detachments may be of different sizes).

This version differs only slightly from the previous one - the capacity of each auxiliary edge will be changed to 

the size of the detachment needed to block the corresponding cell, 

and the capacities of all non-auxiliary edges remain infinite.

</p>

<p>

And the last step - we are to change the problem solved in the previous paragraph and minimize the 

total number of detachments used prior to minimizing the total size of all detachments.

So, using X detachments of total size S1 should be more expensive than using (X - 1)

detachment of total size S2, even if S2 > S1.

In other words, using an extra detachment should be very expensive, and we can simulate this by 

adding a very big number T to the sizes of ALL detachments. 

If the mincut in the corresponding graph will be equal to M, this will mean we needed

[T / M] detachments of total size (T % M).

</p>

<p>

See 

<tc-webtag:handle coderId="306707" context="algorithm"/>'s 

<a href="http://www.topcoder.com/stat?c=problem_solution&rm=300063&rd=13695&pm=10013&cr=306707">solution</a> for an example of this approach.

</p>

<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
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
