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
    <A href="/stat?c=round_overview&er=5&rd=10800">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516076" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 379</span><br />Wednesday, November 28, 2007
<br /><br />



<h2>Match summary</h2> 

 

<p> 

The SRM 379 division 1 has ended with <tc-webtag:handle coderId="272072" context="algorithm"/>, 
<tc-webtag:handle coderId="7442498" context="algorithm"/> and 
<tc-webtag:handle coderId="22641658" context="algorithm"/> taking the first three places.
<tc-webtag:handle coderId="272072" context="algorithm"/> set a new SRM win record showing an
outstanding performance and being the fastest to solve the 250. <tc-webtag:handle coderId="22641658" context="algorithm"/>
and <tc-webtag:handle coderId="22689544" context="algorithm"/> were the fastest to solve the 500 and 1000, respecively.
</p>

<p>
<tc-webtag:handle coderId="22685475" context="algorithm"/> won the division 2 after 3 very fast submissions and
4 successful challenges. The second place went to <tc-webtag:handle coderId="22689641" context="algorithm"/> who 
had a very fast 1000 pointer and the third place to <tc-webtag:handle coderId="20937270" context="algorithm"/> with
6/7 successful challenges.

</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8400&amp;rd=10800" name="8400">DownloadingFiles</a></b> 

</font> 

<A href="Javascript:openProblemRating(8400)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516076" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      345 / 484 (71.28%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      307 / 345 (88.99%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>wooyaggo</b> for 245.35 points (3 mins 55 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      173.11 (for 307 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem can be solved with many different approaches. The problem statement 
gave the competitors the freedom to choose the method they like by distributing
the available bandwidth however they want every time. However, one could notice that
the required answer is actually the <b>totalSizeLeft / totalBandwidth</b> where
<b>totalSizeLeft</b> is the sum of the products <b>remainingTime[i]*speed[i]</b> and
<b>totalBandwidth</b> is the sum of the <b>speed</b>s of all files. So those who could
read behind the lines had a fairly advantage against those who simulated the procedure. 

</p>

<p>
Here is <tc-webtag:handle coderId="22685475" context="algorithm"/>'s
quick <a href="/stat?c=problem_solution&rm=267441&rd=10800&pm=8400&cr=22685475">submission</a>. 
You can also check out <tc-webtag:handle coderId="22706770" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=267430&rd=10800&pm=8400&cr=22706770">solution</a> for a simulation approach.

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8440&amp;rd=10800" name="8440">SellingProducts</a></b> 

</font> 

<A href="Javascript:openProblemRating(8440)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516076" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      334 / 484 (69.01%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      167 / 334 (50.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>obellik</b> for 483.09 points (5 mins 21 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      363.25 (for 167 correct submissions) 

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

      391 / 392 (99.74%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      305 / 391 (78.01%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>SnapDragon</b> for 248.48 points (2 mins 13 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      217.52 (for 305 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem required a simple iteration over every possible price and calculate the profit we can
make. For a certain price <b>p</b> the profit is the sum of every positive difference <b>p-cost[i]</b> for every
customer i that is willing to pay <b>p</b> or more. If two different prices give the same profit the smallest
one must be kept. If we can't get a positive profit then the optimal price is 0.

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8401&amp;rd=10800" name="8401">TVGameWinnings</a></b> 

</font> 

<A href="Javascript:openProblemRating(8401)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516076" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 

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

      51 / 484 (10.54%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      28 / 51 (54.90%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>lhchavez</b> for 570.05 points (24 mins 52 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      453.37 (for 28 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

In this game, the player can't choose two dominoes from the same row or the same column. Without loss
of generality we can consider that the player picks the rows in order starting from the first one and 
then chooses a domino from a column he hasn't chosen yet. By this procedure it is clear that the player
is actually choosing a permutation of the columns. Since the maximum number of columns is 6 there are
only 6!=720 different ways to pick the n dominoes so we can use brute force and try them all. Contestants
that use C++ could use the next_permutation function of STL otherwise they had to write their own function
for generating permutations.
</p>
<p>
For a given permutation <b>p</b> we are calculating the product of all elements <b>board[i,p[i]]</b>. Now all
that is left to find is whether or not to multiply this product by -1. To find this we must count the number
of cycles in our permutation. To do this consider the following algorithm:<br/>
<pre>
    mark every element of the permutation as unvisited
    cycleCount = 0
    
    while there exists an unvisited element i
        Iterate through the cycle i-&gt;p[i]-&gt;p[p[i]]-&gt;..-&gt;i and
        mark every reached element as visited
        Increase cycleCount by 1
    
    return cycleCount
</pre>
If cycleCount is even multiply the product of the numbers by -1 and update the minimum and maximum values.<br/>
See <tc-webtag:handle coderId="22689641" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=267440&rd=10800&pm=8401&cr=22689641">solution</a> for an implementation of this approach.

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8442&amp;rd=10800" name="8442">FillBox</a></b> 

</font> 

<A href="Javascript:openProblemRating(8442)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516076" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      221 / 392 (56.38%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      88 / 221 (39.82%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>gozman</b> for 479.09 points (5 mins 59 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      265.15 (for 88 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

There were many different approaches that contestants used to solve this problem.
I will describe the one that was used by <tc-webtag:handle coderId="22641658" context="algorithm"/>. This
solution takes the cubes in decreasing order of size and at each point places as many as possible. 
The maximum number of cubes of size <b>p</b> that can be placed in the box is <b>K=[L/p]*[W/p]*[H/p]</b>,
where <b>[x]=floor(x)</b>. Considering that we have already covered a volume <b>V</b> by using larger cubes, 
the maximum number of cubes that can be placed is <b>M = K - V/(p^3)</b> (V/(p^3) is the volume measured
in p^3 cubes, V is always divisible by p^3 since the volume of every cube larger than p is divisible by p^3). 
If we have less cubes at this point we will use those instead. At the end, the required number
of cubes of size 1 will be equal to the remaining volume. If we have fewer of those cubes then 
there is no solution.
</p>
<p>
This solution always finds the (unique) optimal solution S. Suppose that there is another solution S'
that uses the same number of 2^j-cubes for all j>i but uses less 2^i-cubes. Then we can always reach 
S' from S by breaking larger cubes into smaller ones so this solution would use more cubes and it wouldn't
be optimal.
</p>
<p>
Other methods first calculate the minimum number of cubes needed to cover the whole box supposing
we have an infinite number of cubes and then iteratively breaking them into smaller ones until they
reach a feasible solution.

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8174&amp;rd=10800" name="8174">TVGame</a></b> 

</font> 

<A href="Javascript:openProblemRating(8174)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516076" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      36 / 392 (9.18%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      11 / 36 (30.56%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>wata</b> for 698.42 points (20 mins 38 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      576.62 (for 11 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem is similar to the one used for div2 900 but here we must calculate the sum of
every possible outcome instead of finding the minimum and maximum values. Here, the constraints are much
higher (N&lt;=50) so brute force would take astronomically long time to compute. However, we are
able to solve several cases in polynomial time. So what we should try to do is to reduce the other
cases to them. Here are two special cases that we are able two solve:
</p>
<p>
Case 1: Our matrix is <a href="http://en.wikipedia.org/wiki/Triangular_matrix">triangular</a>.
        Then every possible choice of n dominoes (besides the main diagonal) would include a 0
        (so its outcome would be 0). Choosing the numbers of the main diagonal would give an
        outcome equal to the product of those numbers multiplied by -1 if N is even. That is because
        every domino of the main diagonal is a cycle by itself.
</p>
<p>
Case 2: Our matrix has two rows i1, i2 where Row_i1 = k*Row_i2. Then if we chose domino (i1,j1) and
        domino (i2,j2) the product of the hidden numbers would be the same as choosing dominoes (i1,j2)
        and (i2,j1) instead, but the number of cycles in those two choices would differ by one because
        by swaping those elements we would either break a cycle into two or join two cycles together. Either
        way the sign of the two products would be different. So for every possible outcome there exists its negative
        one. Summing those outcomes altogether gives us 0.        
</p>
<p>
You can easily see now that if we add a row multiplied by some number to another one the answer remains the same.
<img src="/i/education/srm379_eq.jpg"/><br/>
Here J is the set of permutations (possible choices) and C(p) is the number of cycles in the permuation.
The erased term is equal to 0 because we have two equal rows.<br/>
Also swaping two rows i, j changes the sign of the answer (add row i to row j, subtract j from i, add i to j).
</p>
<p>
Now you can see that we can apply <a href="http://en.wikipedia.org/wiki/Gaussian_elimination">Gaussian Elimination</a> 
to our matrix and reduce it to a triangular.
Every addition, subtraction and multiplication however must be done mod 121547. Divisions turn into multiplications
with the inverses (mod 121547) which can be calculated by the 
<a href="http://en.wikipedia.org/wiki/Extended_Euclidean_algorithm">Extended-Euclidean algorithm</a>.
The whole process is very similar to determinant calculation. They only differ at the last part because here
we have to multiply by -1 if N is even. So the required answer is actually (-1)^(N+1)*determinant.
</p>
<p>
Homework: After those observations can you find an O(2^N) algorithm for solving the div2 900?

</p>



<br /><br />

<%--
<div class="authorPhoto">
    <img src="/i/m/bmerry_big2.jpg" alt="Author" />
</div>
--%>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21052072" context="algorithm"/><br />
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
