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
    <A href="/stat?c=round_overview&er=5&rd=10802">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516077" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 380</span><br />Tuesday, December 4, 2007
<br /><br />



<h2>Match summary</h2> 

<p>
SRM 380 wasn't a usual match, it was a challenger's good dream. All problems,
except for Div2Easy provided excellent opportunity to gather a lot of points
during the challenge phase.
</p>

<p>
In division 1, all 3 coders, who were in the top 3 after the challenge phase,
have lost points on the systyem testing and have been dropped
from their high positions.
<tc-webtag:handle coderId="8375801" context="algorithm"/>, who was 3rd before
the system testing, managed to enter his name into
<a href="/stat?c=successful_challenges">
challenge success for a single match</a> statistics of the TopCoder algorithm competition record book
thank to 14 frags. Finally, <tc-webtag:handle coderId="14886245" context="algorithm"/>
won the match, <tc-webtag:handle coderId="7462740" context="algorithm"/> finished on the 2nd place
and <tc-webtag:handle coderId="7488783" context="algorithm"/> rounded the top 3.
</p>

<p>
Division 2 was been confidently won by <tc-webtag:handle coderId="22697859" context="algorithm"/>,
who managed to show the best time for the medium, make 6 frags and successefully solve the hard problem,
which was solved by nobody else in the 2nd division.
Notable performance! 2nd place is occupied by
<tc-webtag:handle coderId="22672953" context="algorithm"/>,
<tc-webtag:handle coderId="22696552" context="algorithm"/> settled on the 3rd place.
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8395&amp;rd=10802" name="8395">LuckyTicketSubstring</a></b>
</font>
<A href="Javascript:openProblemRating(8395)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516077" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      481 / 582 (82.65%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      404 / 481 (83.99%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>hysramp</b> for 249.61 points (1 mins 7 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      187.15 (for 404 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Let's just look over all substrings of even length, check for each substring
if it is a lucky ticket and choose the longest one. If the length of the given
string is n, then it has O(n ^ 2) substrings of even length. If a string has
length m, then it can be checked for "lucky ticket" condition in O(m)
complexity. So, the total complexity is O(n ^ 3), ehich is more than
small enough for n &lt;= 50.
</p>

<p>
C++ code follows:
</p>

<pre>
struct LuckyTicketSubstring {
  int maxLength(string s) {
  int ret, n, i, j, k, x;
  n = s.size();
  ret = 0;
  <font color="green">// i is the left end of a substring</font>
  for (i = 0; i &lt; n; i++)
    <font color="green">// j is the length of a substring (always even)</font>
    for (j = 2; i + j &lt;= n; j += 2) {
      for (x = k = 0; k &lt; j; k++)
        <font color="green">// if a digit is from left half, add it to x</font>
    <font color="green">// if it is from right half, subtract it from x</font>
    if (k &lt; j / 2) x += s[i + k] - '0';
    else x -= s[i + k] - '0';
      <font color="green">// if the substring is lucky ticket, x must be zero</font>
      if (x == 0) ret = max(ret, j);
    }
  return ret;
  }
};
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8183&amp;rd=10802" name="8183">LameKnight</a></b> </font> <A href="Javascript:openProblemRating(8183)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516077" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      257 / 582 (44.16%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      78 / 257 (30.35%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Alefas</b> for 446.25 points (10 mins 6 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      293.00 (for 78 correct submissions) 
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
      438 / 465 (94.19%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      273 / 438 (62.33%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 242.40 points (5 mins 3 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      184.99 (for 273 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem requires to determine the cases and treat all of them accurately.
These cases are:
</p>

<ol>
<li>height = 1. Knight can't move, answer is 1.</li>
<li>height = 2. Only 2 moves are available: (+2, +1) and (+2, -1).
Alternate these moves while possible. Thus, the answer is
min(4, (width + 1) / 2), because the knight misses only even columns and,
at the same time, the "4 different moves" condition can't be hold.</li>
<li>height &gt;= 3. Actually, if height is &gt; 3, we can treat it as = 3,
because each (+2, +1) move can be compensated with (+2, -1) move
and each (+1, +2) - with (+1, -2). There are 2 subcases:
<ol>
<li>width &gt;= 7. Knight makes all kind of a move once (he stays at
(7, 1) after it) and then, alternates (+1, +2) ans (+1, -2) moves.
Thus, the anser is width - 2, because only two columns are missed
(by (+2, +1) and (+2, -1) moves).</li>
<li>width &lt; 7. Knight can't make moves of all kinds at least once each,
so he is allowed to make at most 3 moves. He alternates (+1, +2) and (+1, -2)
moves. The answer is min(4, width).</li>
</ol>
</li>
</ol>

<p>
See <tc-webtag:handle coderId="22707497" context="algorithm"/>'s
<a href="/stat?c=problem_solution&cr=22707497&rd=10802&pm=8183">
solution</a> for clear implementation.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8228&amp;rd=10802" name="8228">CompilingDecksWithJokers</a></b>
</font>
<A href="Javascript:openProblemRating(8228)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516077" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      142 / 582 (24.40%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 142 (0.70%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Alefas</b> for 633.66 points (24 mins 51 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      633.66 (for 1 correct submission) 
    </td>
  </tr>
</table></blockquote> 

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
      385 / 465 (82.80%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      67 / 385 (17.40%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Revenger</b> for 479.59 points (5 mins 54 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      311.68 (for 67 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Such low success rate surprised me. I can't realize why so many contestants
submitted totally wrong solutions, obviously without whatever seriuos testing.
</p>

<p>
The problem can be solved in several ways, we will discuss
the binary search approach, beacuse it contains very few pitfalls in cotrast
to greedy approaches.
</p>

<p>
It's clear that if we can compile x decks, then y decks can also be compiled
if y &lt; x, where x and y are both non-negative integers. So, the problem could be
solved using binary search if we only could implement a boolean function f(x),
which is true if x decks can be compiled and false otherwise. Well, imagine,
that we are to compile x decks. Let's try to compile x decks without using any
jokers. It can be done only if there are at least x cards of each type.
Possibly, it will be not enough cards of some types. We need to
calculate the total number of missing cards (these cards should be replaced
by jokers). It is the sum of amounts of missing cards of each kind.
The only conditions that must be satisfied to compile x decks are the
following 2:
<ol>
<li>The number of available jokers must be not less than the total number
of missing cards.</li>
<li>The total number of missing cards must be not more than x, because it's
allowed to replace at most 1 card by joker in each deck.</li>
</ol>
</p>

<p>
See <tc-webtag:handle coderId="2058177" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=267480&rd=10802&pm=8228&cr=2058177">
solution</a> for clear implementation of the binary search approach.
<p>

<p>
Exercise:<br>
Design and implement a solution with O(n) complexity, where n is the number
of types of cards. Assume that the given array (int[] cards) is already sorted
in non-decreasing order.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7817&amp;rd=10802" name="7817">NestedDiamonds</a></b>
</font>
<A href="Javascript:openProblemRating(7817)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516077" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      99 / 465 (21.29%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      24 / 99 (24.24%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Vasyl(alphacom)</b> for 654.54 points (23 mins 25 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      477.40 (for 24 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Several days after TCO06 I had an interesting dream: I was solving
a geometrical problem on some TC on-site contest. I didn't manage to solve it
during the dream. This problem was NestedDiamonds.
I apologize for this math-overburden problem, but its beauty did not
allow me to hold it in the cage for more than
1.5 years.
</p>

<p>
Let's take a close look on the top-right quarter of a diamond.
Here <b>a</b> is a square of the length of the diamond's side, <b>x</b>
and <b>y</b> are the squares of halfs of its corresponding diagonals.<br>
Notice, that this three values are enough to describe every diamond.
Here <b>x + y = a</b>. It's obvious, that diamonds must be nested in descent
order of their side lengthes and nesting is impossible if there
exists at least one pair of diamonds with equal side lengthes.
Thus, the order of nesting is determined: the outer diamond has index 1,
most inner diamond has index <b>n</b>, and <b>a</sub>1</sub> &gt; a<sub>2</sub> 
&gt; ... &gt; a<sub>n</sub></b>.
Let's make some mathematical manipulations:<br>
<b>x<sub>i</sub> + y<sub>i</sub> = a<sub>i</sub>; 0 &le; x<sub>i</sub> &le; a<sub>i</sub>, 0 &le; y<sub>i</sub> &le; a<sub>i</sub></b>;<br>
tall diamond condition: <b>y<sub>i</sub> &ge; x<sub>i</sub> &lt;=&gt; a<sub>i</sub>/2 &le; y<sub>i</sub> &le; a<sub>i</sub>; y<sub>i</sub> = y<sub>i-1</sub> &lt;=&gt; x<sub>i</sub> = a<sub>i</sub> - y<sub>i-1</sub></b>;<br>
wide diamond condition (for non-outside diamond): <b>x<sub>i</sub> &ge; y<sub>i</sub> &lt;=&gt; a<sub>i</sub>/2 &le; x<sub>i</sub> &le; a<sub>i</sub>; x<sub>i</sub> = x<sub>i-1</sub> &lt;=&gt; y<sub>i</sub> = a<sub>i</sub> - x<sub>i-1</sub></b>;<br>
outside diamond condition: <b>0 &le; y<sub>1</sub> &le; a<sub>1</sub>/2</b>.<br>
Notice, that diagonals of every diamond can be expressed as a function from
variable <b>y<sub>1</sub></b> (<b>a<sub>1</sub>, a<sub>2</sub>, ..., a<sub>n</sub></b>
are all constants). Each diagonal of each diamond is constrained from both sides
by some constants. Thus, <b>y<sub>1</sub></b> is constrained from both sides by some
constants, i.e. <b>l &le; y<sub>1</sub> &le; r</b>. It means that we need to just
find <b>l</b>, which is the minimal allowed value for <b>y<sub>1</sub></b> (the answer for
the problem is <b>2 * sqrt(l)</b>). We'll discuss 2 approaches of its computation.
</p>

<p>
<h4>Approach 1 - Analitical solution of set of inequalities.</h3>
Each diamond applies one constraint to <b>y<sub>1</sub></b> of the following form:
<b>l<sub>i</sub> &le; y<sub>1</sub> &le; r<sub>i</sub></b> (for the i-th diamond).
<b>l = max(l<sub>i</sub>)</b>, <b>r = min(r<sub>i</sub>)</b>, for all <b>i = 1, 2, ..., n</b>.
So, in order to compute <b>l</b> and <b>r</b> we just need to construct <b>n</b> inequalities of the
mentoined form: one per diamond. Let's do it:<br>
<table><tr>
<td><table>
<tr><td> <b>0 &le; y<sub>1</sub> &le; a<sub>1</sub>/2</b> </td></tr>
<tr><td> <b>a<sub>2</sub>/2 &le; y<sub>1</sub> &le; a<sub>2</sub></b> </td></tr>
<tr><td> <b>a<sub>3</sub> &le; a<sub>2</sub> - y<sub>1</sub> &le; a<sub>3</sub></b> </td></tr>
<tr><td> <b>a<sub>4</sub>/2 &le; a<sub>3</sub> - a<sub>2</sub> + y<sub>1</sub> &le; a<sub>4</sub></b> </td></tr>
<tr><td> <b>a<sub>5</sub>/2 &le; a<usb>4</sub> - a<sub>3</sub> + a<sub>2</sub> - y<sub>1</sub> &le; a<usb>5</sub></b> </td></tr>
</table></td>
<td>
<b>&lt;=&gt;</b>
</td>
<td><table>
<tr><td> <b>0 &le; y<sub>1</sub> &le; a<sub>1</sub>/2</b> </td></tr>
<tr><td> <b>a<sub>2</sub>/2 &le; y<sub>1</sub> &le; a<sub>2</sub></b> </td></tr>
<tr><td> <b>-a<sub>3</sub> + a<sub>2</sub> &le; y<sub>1</sub> &le; -a<sub>3</sub>/2 + a<sub>2</sub></b> </td></tr>
<tr><td> <b>a<sub>4</sub>/2 - a<sub>3</sub> + a<sub>2</sub> &le; y<sub>1</sub> &le; a<sub>4</sub> - a<sub>3</sub> + a<sub>2</sub></b> </td></tr>
<tr><td> <b>-a<sub>5</sub> + a<usb>4</sub> - a<sub>3</sub> + a<sub>2</sub> &le; y<sub>1</sub> &le; -a<usb>5</sub>/2 + a<sub>4</sub> - a<sub>3</sub> + a<sub>2</sub></b> </td></tr>
</table></td>
</tr></table>
Let's generalize these formulas:<br>
<b>0 &le; y<sub>1</sub> &le; a<sub>i</sub>/2</b>, for <b>i = 1</b><br>
<b>a<sub>i</sub>/2 + [sum of all a<sub>j</sub> with even j &lt; i] -
[sum of all a<sub>j</sub> with odd j &lt; i] &le; y<sub>1</sub> &le;
a<sub>i</sub> + [sum of all a<sub>j</sub> with even j &lt; i] -
[sum of all a<sub>j</sub> with odd j &lt; i]</b>, for even <b>i</b> (<b>2 &le; i &le; n</b>)<br>
<b>-a<sub>i</sub> + [sum of all a<sub>j</sub> with even j &lt; i] -
[sum of all a<sub>j</sub> with odd j &lt; i] &le; y<sub>1</sub> &le;
-a<sub>i</sub>/2 + [sum of all a<sub>j</sub> with even j &lt; i] -
[sum of all a<sub>j</sub> with odd j &lt; i]</b>, for odd <b>i</b> (<b>3 &le; i &le; n</b>)<br>
Notice, that multiplication of all <b>x</b>'s, <b>y</b>'s and <b>a</b>'s by 2 enables to solve
the set of inequalities in integers (using 64-bit signed integer type).<br>
C++ code follows:
</p>

<pre>
struct NestedDiamonds {
    double minHeight(vector &lt;int&gt; sides) {
        vector &lt;long long&gt; a;
        long long l, r, li, ri, t;
        int n, i, j;
        <font color="green">// sort the diamonds in the neccessary order</font>
        sort(sides.begin(), sides.end(), greater&lt;int&gt;());
        n = sides.size();
        <font color="green">// check for equal side lengthes</font>
        for (i = 0; i &lt; n - 1; i++) if (sides[i] == sides[i + 1]) return -1;
        <font color="green">// prepare array a</font>
        for (i = 0; i &lt; n; i++) a.push_back(sides[i] * (long long)sides[i]);
        <font color="green">// initialize l and r with constraints of the outside diamond</font>
        l = 0; r = a[0];
        t = 0; <font color="green">// t is the properly signed sum of all aj, j &lt; i</font>
        for (i = 1; i &lt; n; i++) {
            if (i % 2) { <font color="green">// tall diamond</font>
                li = a[i] + t;
                ri = 2 * a[i] + t;
                t += 2 * a[i];
            } else { <font color="green">// wide diamond</font>
                li = t - 2 * a[i];
                ri = t - a[i];
                t -= 2 * a[i];
            }
            l = max(l, li);
            r = min(r, ri);
        }
        <font color="green">// if l &gt; r, it means that there is no allowed value of y1</font>
        if (l &gt; r) return -1;
        return 2 * sqrt(0.5 * l);
    }
};
</pre>

<p>
<h4>Approach 2 - Modified binary search.</h4>
Constraint <b>l &le; y<sub>1</sub> &le; r</b> means that all allowed values of <b>y<sub>1</sub></b>
lie on a contiguous interval of the number axis. Let's introduce the function f(z),
its possible values are:<br>
<ol>
<li><b>f(z) = -1</b>, if <b>z &lt; l</b>;</li>
<li><b>f(z) = 0</b>, if <b>l &le; z &le; r</b>;</li>
<li><b>f(z) = 1</b>, if <b>z &gt; r</b>.</li>
</ol>
Minima of <b>y<sub>1</sub></b> can be found using the modified binary search over this function:
if <b>f(z) = -1</b>, move right, otherwise move left.<br>
</p>




<br /><br />


<div class="authorPhoto">
    <img src="/i/m/gevak_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7340263" context="algorithm"/><br />
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
