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
    <A href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&amp;rd=12169">Match Overview</A><br />
    <tc-webtag:forumLink forumID="520816" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 397</span><br />Saturday, April 12, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
This prime numbered SRM gathered together 1352 coders that were faced with a rather hard problem set. However, <tc-webtag:handle coderId="19849563" context="algorithm"/> rushed
through the set achieving his new highest rating. Congratulations!<br /><br />
The match in division one started slowly, as the easy problem was not so easy to code. <tc-webtag:handle coderId="20286298" context="algorithm"/> was the first one to submit the 250 and after his submit, solutions started to come in. Then, after about 15 minutes from
the beginning of the coding phase, we could saw the first submissions on the medium. From then, until the last minute of the coding phase,
solutions to the medium and the hard were coming in. After the coding phase
<tc-webtag:handle coderId="19849563" context="algorithm"/> was on top, with <tc-webtag:handle coderId="22285847" context="algorithm"/> and
<tc-webtag:handle coderId="20812309" context="algorithm"/> being close behind. Challenge phase was rather quiet, but unfortunately
<tc-webtag:handle coderId="20812309" context="algorithm"/>'s hard got challenged and <tc-webtag:handle coderId="251074" context="algorithm"/>
took his spot. <tc-webtag:handle coderId="20289202" context="algorithm"/> and <tc-webtag:handle coderId="7390224" context="algorithm"/> rounded
up the top five.<br /><br />
In division two, the whole match passed by rather smoothly, although there weren't too many submissions to the medium and hard problems (and out
of 128 hard submissions, only 21 were correct). After all, <tc-webtag:handle coderId="22692048" context="algorithm"/> won the division, with a
newcomer <tc-webtag:handle coderId="22652593" context="algorithm"/> and <tc-webtag:handle coderId="8415268" context="algorithm"/> rounding up
the top three.
</p> 
 
<H1> 
The Problems 
</H1>


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8743&amp;rd=12169" name="8743">BreakingTheCode</a></b> 
</font> 
<A href="Javascript:openProblemRating(8743)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520816" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      718 / 786 (91.35%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      615 / 718 (85.65%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>brosmike</b> for 245.21 points (3 mins 59 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      191.16 (for 615 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem was just a simple simulation of the algorithm described in the statement.
If there are only letters in the <b>message</b>, we replace each letter with its assigned
number. And if there are only digits, we take every two consecutive ones and replace
them with a letter that's assigned the given code. This should be clear enough, but you
can see the fastest <a href="/stat?c=problem_solution&amp;cr=22722687&amp;rd=12169&amp;pm=8743">submission</a>
by <tc-webtag:handle coderId="22722687" context="algorithm"/> for reference.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8745&amp;rd=12169" name="8745">SortingGame</a></b> 
</font> 
<A href="Javascript:openProblemRating(8745)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520816" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      145 / 786 (18.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      92 / 145 (63.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SlNPacifist</b> for 467.77 points (7 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      284.87 (for 92 correct submissions) 
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
      474 / 560 (84.64%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      436 / 474 (91.98%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kia</b> for 247.29 points (2 mins 59 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      174.78 (for 436 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Low constraints guaranteed that there were no more than 8! = 40320 possible states. So,
how can we find the shortest path from the initial state to a final one? By 
<a href="http://en.wikipedia.org/wiki/Breadth-first_search">BFS</a>, of course. We only
need to map the states that can be represented by vectors, numbers or strings to their
values, that are lengths of the respective shortest paths. It is easy to generate
the permutations that we can achieve from the given one in one move. Please see the 
fastest and extremely clear <a href="/stat?c=problem_solution&amp;cr=20286298&amp;rd=12169&amp;pm=8745">implementation</a>
of the above by <tc-webtag:handle coderId="20286298" context="algorithm"/>. This code shows, that in C++, the STL
could solve the problem for us.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8746&amp;rd=12169" name="8746">CollectingMarbles</a></b> 
</font> 
<A href="Javascript:openProblemRating(8746)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520816" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      127 / 786 (16.16%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      21 / 127 (16.54%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>eagaeoppooaaa</b> for 832.33 points (13 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      634.81 (for 21 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem was rather standard. With at most 13 marbles we can represent the state
as a set of marbles that we already have, the number of bags left, and the space left
in the bag we are trying to fill now. So we start with an empty set, <b>numberOfBags</b>
bags and <b>bagCapacity</b> space left in the bag we're filling. In each state we can either
put to the current bag any marble we don't have yet or put the current bag aside and start
to fill the next one. Representing sets as bit masks gives us approximately
2<sup>13</sup> * 20 * 10 = 1638400 possible states. That's ok to use memoization on them
and with a simple recursion compute the answer. Sample Java implementation follows:

<pre>
 public class CollectingMarbles {
   int[][][] dp;
   int[] w;
   int c;

   public int recur (int mask, int left, int cur) {
     if (left == 0) return 0;
     if (dp[mask][left][cur] == -1) {
       dp[mask][left][cur] = 0;
       for (int i = 0; i &lt; w.length; i++)
         if ((mask &amp; (1 &lt;&lt; i)) == 0 &amp;&amp; w[i] &lt;= cur)
           dp[mask][left][cur] = Math.max( dp[mask][left][cur],
                                 1 + recur(mask | (1 &lt;&lt; i), left, cur - w[i]));
       dp[mask][left][cur] = Math.max( dp[mask][left][cur],
                                       recur(mask, left - 1, c));
     }
     return dp[mask][left][cur];
   }

   public int mostMarbles (int[] mW, int bC, int nOB) {
     w = mW;
     c = bG;
     dp = new int[1 &lt;&lt; w.length][nOB + 1][c + 1];
     Arrays.fill(dp, -1);
     return recur(0, nOB, c);
   }
 }
</pre>

</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8725&amp;rd=12169" name="8725">SumOfPowers</a></b> 
</font> 
<A href="Javascript:openProblemRating(8725)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520816" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      158 / 560 (28.21%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      98 / 158 (62.03%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Loner</b> for 447.83 points (9 mins 56 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      288.51 (for 98 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Well, this problem was an interesting one. The idea, with its simplicity and mathematical
background, caused many coders to search the internet for the formula. It could end with a
success, but not necessarily. Many coders, after reading all these formulas with Bernoulli
numbers were angry at the problem as they thought that you have to be a genius to come up with them.
Well, maybe you have to be, and maybe Bernoulli was. But what if he had Google? Maybe
he wouldn't even bother to invent all this stuff. Ok, so suppose that we don't have Google.
What do we have here? We are given the sum 1<sup>k</sup> + 2<sup>k</sup> + ... +
n<sup>k</sup>. Ok, let a<sub>i</sub> = 1<sup>k</sup> + ... + i<sup>k</sup>.
Everyone who finished high school knows that<br /><br />
<center><img src="/i/education/srm397_1.jpg" /> .</center><br /><br />
Pascal <a href="http://en.wikipedia.org/wiki/Pascal's_triangle">showed us</a> some day how we can effectively compute
binomial coefficients, so let's suppose that we know their values and forget about them. So it looks
like we have some number of recursively defined sequences. Now, the second thing that every top coder should know.
The most obvious way to find the n-th term of a recursive sequence is to use a matrix multiplication. Again,
we don't have to be very bright to see that:<br /><br />
<center><img src="/i/education/srm397_2.jpg" /></center><br /><br />
That looks nice. But let's get our a<sub>i</sub> sequence into play:<br /><br />
<center><img src="/i/education/srm397_3.jpg" /></center><br /><br />
Now, because matrix multiplication is associative, we can compute the n-th power of our magic
matrix in time O(k<sup>3</sup> * log n) and then multiply it by the vector for a<sub>1</sub>
(it will contain only ones) to get a<sub>n</sub>. Well, that definitely didn't hurt us. There were of
course many different approaches. We could for example use Lagrange's 
<a href="http://en.wikipedia.org/wiki/Lagrange_polynomial">polynomial interpolation</a> (as
the given sum is of course a polynomial) or use
a different recursion then the one described here (please see the <tc-webtag:handle coderId="22663468" context="algorithm"/>'s
solution for a reference). There was also a solution based on Bernoulli numbers - use Google to find it!
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8762&amp;rd=12169" name="8762">HouseProtection</a></b> 
</font> 
<A href="Javascript:openProblemRating(8762)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520816" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      92 / 560 (16.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      51 / 92 (55.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 830.85 points (13 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      628.48 (for 51 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Let's think for a moment about an easier version of the problem - let's think how we can find the biggest
number of radars we're able to place for some given range. To begin, we'll place radars in all possible
points. Now, we want to remove the smallest number of radars in such way, that in the remaining set there
won't be any pair of intersecting radars that have different colors. That starts to sound like a vertex cover
problem - let's build a graph out of our radars and let's connect two radars of different colors with an edge if
their areas intersect. The general vertex cover problem is a well-known NP-complete problem. But, luckily, we have
a bipartite graph here, so according to <a href="http://en.wikipedia.org/wiki/K%C3%B6nig%27s_theorem_%28graph_theory%29">
Konig's theorem</a> we know that the minimal vertex cover is equivalent to maximal matching. We know how to find 
the latter, so let's return to the original problem.<br /><br />
The safety factor is defined by two values -the number of
radars and their range. So, let's try every possible number of radars and for each such number, let's find the
biggest range that allows us to place the radars. It isn't a surprise that we can do it with a binary search - 
if we can place the radars setting them on radius <i>r</i>, we could also set them to any range smaller than
<i>r</i>. That was quick, but enough to pass - you can see the fastest, but very clear 
<a href="/stat?c=problem_solution&rm=269718&amp;rd=12169&amp;pm=8762&amp;cr=19849563">implementation</a>
of the above by <tc-webtag:handle coderId="19849563" context="algorithm"/>.<br /><br />
However, we can get rid of
the binary search here. The observation is that in the optimal solution the range of the radars will be either
the given <b>R</b> or half of the distance between some two red and blue points. Why? If it was not the case,
we could increase the range to let the areas of some radars touch. Now, if we consider the possible ranges
in an increasing order, we don't have to cancel the matching every time we have a new range (provided, we use
an augmenting path algorithm) as we aren't removing any edges from the graph, but just adding the new ones, so
the matching we have so far is ok with a new graph. For
every range candidate, we will compute the biggest number of radars we can place. That's enough to compute
the answer. This solution has time complexity of O(n<sup>4</sup>) instead of O(n<sup>4</sup> * <i>binary search</i>). You
can see a nice <a href="/stat?c=problem_solution&rm=269727&amp;rd=12169&amp;pm=8762&amp;cr=8365685">implementation</a>
of this by <tc-webtag:handle coderId="8365685" context="algorithm"/>.
</p>


<br /><br />


<div class="authorPhoto">
    <img src="/i/m/mateuszek_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="11801002" context="algorithm"/><br />
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
