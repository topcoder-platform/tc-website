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
    <A href="/stat?c=round_overview&er=5&rd=10765">Match Overview</A><br>
    <tc-webtag:forumLink forumID="516053" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 356</span><br>Monday, July 2, 2007
<br><br>



<h2>Match summary</h2> 

<p> 
It was the first SRM after the TopCoder Open, and coders weary from
the TCO were greeted by a problem set hard enough to be used onsite.
In both divisions nobody solved all three problems and only 144 Division 1 coders
were able to solve at least one problem.
<br /><br />
<tc-webtag:handle coderId="7488783" context="algorithm"/>,
a yellow rated coder from Hong Kong, won the match
in a close race with <tc-webtag:handle coderId="10509376" 
context="algorithm"/> from New Zeland and
<tc-webtag:handle coderId="8527113" context="algorithm"/> from Poland.
Two Russian coders - <tc-webtag:handle coderId="20286298" context="algorithm"/>
and <tc-webtag:handle coderId="15812946" context="algorithm"/> closed 
the top five in the first Division.
Another notable finish was <tc-webtag:handle coderId="22504795" context="algorithm"/>, who managed to take the 40th 
spot without solving any problem thanks to his +300 in challenges!
<br /><br />
<tc-webtag:handle coderId="11877201" context="algorithm"/> regained his 
blue rating by winning second the Division with two solved problems and four 
successful challenges.
<br /><br />
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7929&amp;rd=10765" name="7929">SMSLanguage</a></b> 
</font> 
<A href="Javascript:openProblemRating(7929)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516053" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      439 / 490 (89.59%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      274 / 439 (62.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>DavidAlves</b> for 248.23 points (2 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      197.76 (for 274 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem is about accuracy in implementing what you're asked for.
You need to implement a function (or use standard), that replaces all
occurrences of one subword with another word. After that you need to
apply all the translation rules,
in the order that they appear in the problem statement. It's easy to see that
the order is important. For example, if you start with replacing all
"at" by '@', the subword "ate" will never appear further,
so the rule about '8' will be useless. Another tricky case is about
subwords, which may appear after removing punctuation symbols.
For example, "a.n.d" must be translated as "&".
<br />
<br />
For brief implementation, see <tc-webtag:handle coderId="22681821" context="algorithm"/>'s
<a href = "/stat?c=problem_solution&rm=265397&rd=10765&pm=7929&cr=22681821">solution</a>
in Java and <tc-webtag:handle coderId="11877201" context="algorithm"/>'s
<a href = "/stat?c=problem_solution&rm=265404&rd=10765&pm=7929&cr=11877201">solution</a> in C++.
<br /><br />
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7901&amp;rd=10765" name="7901">AverageProblem</a></b> 
</font> 
<A href="Javascript:openProblemRating(7901)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516053" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      121 / 490 (24.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      3 / 121 (2.48%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Rustyoldman</b> for 246.85 points (38 mins 21 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      224.88 (for 3 correct submissions) 
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
      331 / 392 (84.44%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      131 / 331 (39.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Egor</b> for 242.28 points (5 mins 6 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      170.02 (for 131 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Consider some mark <i>m</i>. Let's denote its real value by <i>r</i> 
(i.e. <i>m</i> is the result of truncation <i>r</i>'s decimal
notation as it was described in the problem statement).
<i>r</i> can be represented as a rational fraction, <i>r = p/q</i>.
Here <i>q</i> is the number of the participants of the survey,
and <i>p</i> is an integer in range from 0 to 10<i>q</i>.
<br />
<br />

The key observation is the following inequality:
<i>m</i>&nbsp;&le;&nbsp;<i>p/q</i>&nbsp;&lt;&nbsp;<i>m+0.001</i>.
In other words,
1000<i>mq</i>&nbsp;&le;&nbsp;<i>1000p</i>&nbsp;&lt;&nbsp;(1000<i>m</i>+1)<i>q</i>.
<br />
<br />

Now we are going to fix some <i>q</i> and to check if there exists such
<i>p</i>, that satisfies the inequality above. To avoid problems with precision, let's get rid of real-valued numbers:
1000<i>m</i> is always an integer in range from 0 to 10000, we'll denote 
it by <i>n</i> (The easiest way is just to remove
all dots ('.') from the input and parse marks as integers.).
<br /><br />

The inequality now will look as: 
<i>nq</i>&nbsp;&le;&nbsp;<i>1000p</i>&nbsp;&lt;&nbsp;(<i>n</i>+1)<i>q</i>.
<br /><br />

It's easy to see that the required <i>p</i> exists if and only if interval
[<i>nq</i>; (<i>n</i>+1)<i>q</i>)
(left bound inclusive, right - not) contains an integer that is
divisible by 1000. Note, that if <i>q</i> &ge; 1000, such <i>p</i> always
exists.  In this case we need to check only denominators
 in the range from 1 to 999.
<br />
<br />

How to check if given interval [<i>a</i>, <i>b</i>) contains an integer, divisible by 1000? We need to check only
two integers: ([a/1000])*1000 and ([a/1000] + 1)*1000. If one of them belongs to interval [<i>a</i>, <i>b</i>) the
answer is yes, and no otherwise.
<br /><br />
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7921&amp;rd=10765" name="7921">RoadReconstruction</a></b> 
</font> 
<A href="Javascript:openProblemRating(7921)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516053" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      21 / 490 (4.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      9 / 21 (42.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ral</b> for 631.28 points (25 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      511.68 (for 9 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem can be solved by modification of standard <a href = "http://en.wikipedia.org/wiki/Kruskal_algorithm">Kruskal
algorithm</a> of finding MST (minimal spanning tree) in undirected graph. 
Cities will be the vertice of that graph, and roads will be its edges. Each damaged road will provide the corresponding edge the weight
that equals the cost of the reconstruction. Other (non-damaged) roads will have weight 0.
<br />
<br />

Now, let's sort all the edges in ascending order of their weights, and in the case of a tie - in the lexicographical order of
their identifiers.
<br /><br />

The Kruskal algorithm gives us the minimal spanning tree. Finally, to obtain the answer to the problem let's remove all edges
that don't need to be reconstructed from MST. Don't forget to sort the remaining identifiers in the lexicographical order!
<br />
<br />

For implementation details see
<tc-webtag:handle coderId="21185521" context="algorithm"/>'s
<a href = "/stat?c=problem_solution&rm=265407&rd=10765&pm=7921&cr=21185521">solution</a>.
<br /><br />
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6608&amp;rd=10765" name="6608">MarriageProblemRevised</a></b> 
</font> 
<A href="Javascript:openProblemRating(6608)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516053" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      550 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      85 / 392 (21.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      27 / 85 (31.76%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ahyangyi</b> for 446.75 points (14 mins 21 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      309.26 (for 27 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem can be easily reformulated in terms of bipartite graphs. But despite this,
it shares nothing with the matchings.
<br />
<br />

First, note that the answer is "-1" if and only if there exists a 
man (or woman) that dislikes all people of the opposite gender.
Therefore, we check that condition at the beginning.
<br />
<br />

Now, let's consider one special type of marriage: when a person marry himself.
Such marriages are not allowed by the problem statement, but it's easy to see that they will never
appear in an optimal solution. Therefore, allowing such strange kind of marriages won't change the answer to the problem.
<br /><br />

Now, let's fix some subset of men, and some subset of women. We designate each of them to his (her) own 
marriage group and try to distribute all other people among those groups, if it's possible. As we'll show below, such check can be done at O(<i>n</i>), 
which provides us an O(<i>n</i>2^<i>n</i>) solution by bruteforcing for all the subsets (here <i>n</i> is the total number of men and women).
<br /><br />

For a subset <i>X</i> of men (or women) we define <i>D(X)</i> as a subset of 
people of the opposite gender, such that each member of <i>D(X)</i> can marry 
with at least one member of <i>X</i>.
Now, if we fix some subset <i>X</i> of men, and subset <i>Y</i> of woman 
we just need to check if <i>X + D(Y)</i> includes all men, and 
<i>Y + D(X)</i> includes all women. Such a check can be obviously done in 
<i>O(n^2)</i>, and it can be improved to <i>O(n)</i> by storing 
preferences as a bit masks.
<br /><br />

Also, there are two optimizations which will allow it to work much faster.
Firstly, note that there always exist a solution with [n/2] marriages - 
we can select either all men, or all women.
Now, if we have some current answer <i>x</i>, we'll consider only subsets <i>X</i> and <i>Y</i>, such that
the cardinality of <i>X+Y</i> is smaller then <i>x</i>. This will allow us to consider at most half of
the subsets in the worst case and much less on average.
<br /><br />

Second, for fixed subset <i>X</i> we can calculate <i>D(X)</i> and 
consider only such subsets <i>Y</i>, that  <i>X+D(Y)</i> includes all 
women. Being combined, the given two optimizations will allow us to fit the time limit with a huge gap.
<br />
<br />
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7353&amp;rd=10765" name="7353">EscapeTheJail</a></b> 
</font> 
<A href="Javascript:openProblemRating(7353)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516053" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      950 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      92 / 392 (23.47%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      11 / 92 (11.96%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Triple_M</b> for 787.22 points (13 mins 30 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      566.69 (for 11 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem can be reduced to a system of linear equations.
First of all, let's check if there exists an exit, reachable from the starting position of a prisoner.
If not, the answer is "-1", in the other case the expected number of moves is always finite.
<br /><br />

Now, let's denote the expected number of moves to reach the exit from row <i>i</i> and column <i>j</i> by X[i][j].
If position (i,j) is the exit cell, X[i][j] equals to zero. In the other 
case it will satisfy the following linear conditions:
<br /><br />

X[i][j] = 1 + (X[i + 1][j] + X[i-1][j] + X[i][j+1] + X[i][j-1]) / D[i][j],
<br /><br />

where D[i][j] will be the number of free cells, adjacent to position (i,j). 
Also, we consider X[p][q] = 0 for occupied and non-existing cells. (i.e. 
if there is a wall at position (p,q) or if this position is outside the 
jail).
<br /><br />

Combining such equations for every cell, reachable from the initial position of the prisoner, we'll obtain a 
system of linear equations that will give us an answer.
<br />
<br />

See <tc-webtag:handle coderId="20286298" context="algorithm"/>'s <a 
href="/stat?c=problem_solution&rm=265382&rd=10765&pm=7353&cr=20286298"> 
solution</a> for clear implementation.
<br /><br />
</p>


<br /><br />






<div class="authorPhoto">
    <img src="/i/m/Pawa_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10323773" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
