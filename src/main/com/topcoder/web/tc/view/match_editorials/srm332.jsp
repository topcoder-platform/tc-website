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
    <A href="/stat?c=round_overview&er=5&rd=10012">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506007" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 332</span><br>Thursday, December 28, 2006
<br><br>

<h2>Match summary</h2> 

After the dust settled in Division One, three targets took the top spots on the leaderboard:
<tc-webtag:handle coderId="9906197" context="algorithm"/>,
<tc-webtag:handle coderId="10574855" context="algorithm"/> and
<tc-webtag:handle coderId="8355516" context="algorithm"/>.
Only two coders managed to solve all three problems. A tricky 550-pointer had a success rate of only 11.11%
and proved to be one of the hardest Division One mediums ever.
The lesson: never underestimate problems that look easy.
Make a careless implementation or overlook a crucial corner case, and you could end up with 0 points.
<br />
<br />
In Division Two, the top three spots went to newcomers:
<tc-webtag:handle coderId="22663872" context="algorithm"/>
(whose quick solutions and 300 points on challenges gave him  fifth place
in the <a href="/stat?&c=highest_totals&dn=2">Highest Match Total</a>
chapter of the Algorithm Competition Record Book),
<tc-webtag:handle coderId="22661230" context="algorithm"/> and
<tc-webtag:handle coderId="22658346" context="algorithm"/>.

<br><br>
<H1> 
The Problems 
</H1>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7277&amp;rd=10012" name="7277">TextStatistics</a></b> 

</font> 

<A href="Javascript:openProblemRating(7277)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506007" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      328 / 346 (94.80%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      183 / 328 (55.79%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>wilan</b> for 247.83 points (2 mins 39 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      207.03 (for 183 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

This is an fairly easy problem for Division Two, and didn't require much effort or code to solve.
Each letter in the text adds one to the sum of all the words' length.
Each letter not preceded by another letter begins a word, so it adds one to the words counter:

<pre>
length = 0, words = 0
<b>for each</b> character <b>in</b> text:
   <b>if</b> this character is a letter:
      ++length
      <b>if</b> this is the first character <b>or</b> the previous character wasn't a letter:
         ++words
<b>if</b> words == 0: <b>return</b> 0
<b>else</b>: <b>return</b> length/words
</pre>

See <tc-webtag:handle coderId="22656668" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=263132&rd=10012&pm=7277&cr=22656668">solution</a> for a clear implementation.

<br />
<br />
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7309&amp;rd=10012" name="7309">CreatePairs</a></b> 

</font> 

<A href="Javascript:openProblemRating(7309)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506007" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      262 / 346 (75.72%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      94 / 262 (35.88%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>fhoward</b> for 481.38 points (5 mins 37 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      309.40 (for 94 correct submissions) 

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

      303 / 309 (98.06%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      221 / 303 (72.94%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Eryx</b> for 247.75 points (2 mins 42 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      201.27 (for 221 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

The first thing to notice in this problem is that there is no reason to pair positive and negative integers,
so we can do pairings in these two groups separately.
Because zeros are neither positive nor negative we will handle them as a special case,
and will treat ones as a special case as well (because pairing ones is pointless).

<br />
<br />

We have four groups &mdash; <i>A</i>: zeros, <i>B</i>: ones, <i>C</i>: integers greater than 1 and <i>D</i>: negatives.
We handle them as follows:
<ul>
<li>Elements from <i>B</i> remain unpaired.</li>
<li>It doesn't require much time to see that the optimal way to pair elements from <i>C</i>
is to pair adjacent elements after sorting them in descending order. In this way all elements
(with the possible exception of the smallest one) will be paired.</li>
<li>The same method can be applied to <i>D</i> (due to the fact that the product of two negative numbers is a positive one).
If the group <i>A</i> is nonempty, we can get rid of the smallest unpaired element from <i>D</i>
(which remained negative) by pairing it with zero.</li>
</ul>

Here's the above algorithm in pseudocode:

<pre>
<b>for each</b> i <b>in</b> data:
   <b>if</b> i == 0: zeros++
   <b>elif</b> i == 1: ones++
   <b>elif</b> i &gt; 0: positive.append(i)
   <b>else</b>: negative.append(i)
<b>if</b> length(positive) is odd:
   positive.append(1)
<b>if</b> length(negative) is odd:
   <b>if</b> zeros &gt; 0: negative.append(0)
   <b>else</b>: negative.append(1)
sort(positive)
sort(negative)
answer = ones
<b>for</b> i = 1 <b>to</b> length(positive)/2:
   answer += positive[2*i-1] * positive[2*i]
<b>for</b> i = 1 <b>to</b> length(negative)/2:
   answer += negative[2*i-1] * negative[2*i]
<b>return</b> answer
</pre>

Take a look at <tc-webtag:handle coderId="21029913" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=263126&rd=10012&pm=7309&cr=21029913">solution</a> for an implementation of a similar method.

<br />
<br />

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7323&amp;rd=10012" name="7323">Squares</a></b> 

</font> 

<A href="Javascript:openProblemRating(7323)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506007" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      110 / 346 (31.79%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      19 / 110 (17.27%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>jwy258</b> for 907.67 points (9 mins 15 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      624.10 (for 19 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

The solution to this problem is rather straithforward.
Every square is determined by its two adjacent vertices. We can iterate over every pair of vertices,
check whether the square determined by them fits in the board and is valid (all vertices
contain the same letter):

<pre>
<b>for each</b> cell (x1, y1) on field:
   <b>for each</b> cell (x2, y2) on field:
      <b>if</b> cells (x1, y1) and (x2, y2) are distinct <b>and</b> contain the same letter:
         dy = y2 - y1
         dx = x2 - x1
         y3 = y2 + dx
         x3 = x2 - dy
         y4 = y3 - dy
         x4 = x3 - dx
         <b>if</b> points (x3, y3) and (x4, y4) are on field <b>and</b> they contain the same letter as (x1, y1):
            count++
<b>return</b> count/4
</pre>

The last division is necessary, because we counted every square four times.

Since <b>w</b> and <b>h</b>, dimensions of the field, are limited by 50, this
<b>O(w<sup>2</sup>h<sup>2</sup>)</b> solution easily runs in time.

The highest scorer on this problem,
<tc-webtag:handle coderId="22663872" context="algorithm"/>, used a similar
<a href="/stat?c=problem_solution&rm=263126&rd=10012&pm=7323&cr=22663872">approach</a>.

<br /><br /> 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6402&amp;rd=10012" name="6402">RestoringPolygon</a></b> 

</font> 

<A href="Javascript:openProblemRating(6402)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506007" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      144 / 309 (46.60%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      16 / 144 (11.11%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>gawry</b> for 383.60 points (20 mins 42 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      275.02 (for 16 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

There are no more than 16 horizontal line segments, therefore we can try all the 2<sup>16</sup> possibilities
of removing some of them. Assume that we have a set of <b>n</b> horizontal segments that have to be used.
They are mutually disjoint and their endpoints are <b>2n</b> vertices of our polygon. A polygon with <b>2n</b>
vertices has <b>2n</b> edges, so it's clear that we have to add exactly <b>n</b> vertical segments.
<br />
<br />
How to find them? Fix the <b>y</b> and consider all vertices that have the second coordinate equal to <b>y</b>. If there is an odd number of them you should stop -- construction is impossible. If not, sort them
by the first coordinate and pair the adjacent ones.
<br />
<br />
Now we have constructed a <b>2n</b>-polygon, but we have to check two more things before we are done
(failure to do so trapped many competitors). From the problem statement we know that the polygon "must
have a single, non-intersecting boundary."
To test if the boundary is single we can treat the polygon as a graph and apply one of many algorithms
for checking graph connectivity.
For the second requirement we can test all pairs of segments to see whether they intersect points different
from vertices.
<br />
<br />
The total running time is <b>O(2<sup>n</sup>n<sup>2</sup>)</b>.
A similar
<a href="/stat?c=problem_solution&cr=22662132&rd=10012&pm=6402">approach</a>
was successfully used by <tc-webtag:handle coderId="22662132" context="algorithm"/>.
<br />
<br />

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6175&amp;rd=10012" name="6175">LadderPermutation</a></b> 

</font> 

<A href="Javascript:openProblemRating(6175)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506007" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      61 / 309 (19.74%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      31 / 61 (50.82%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Astein</b> for 869.02 points (8 mins 50 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      597.59 (for 31 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


The first step to solving this problem is to determine what cases have no solution.
Some <b>m</b> distinct integers must belong to a longest increasing subsequence,
and some <b>k</b> integers must belong to a longest decreasing subsequence.
These subsequences can share at most one integer, therefore a <b>(m,k)</b>-ladder
permutation has to have at least <b>k+m-1</b> elements.
<br />
<br />
On the other hand, this permutation cannot have more than <b>mk</b> elements.
This fact is known as <a href="http://mathworld.wolfram.com/Erdos-SzekeresTheorem.html">Erdos-Szekeres
Theorem</a>: a sequence of <b>mk+1</b> different elements contains an increasing
subsequence of <b>m+1</b> elements or a decreasing subsequence of <b>k+1</b> elements.
The reader is encouraged to find an elementary proof of this theorem using the pigeonhole principle.
<br /><br />
It turns out that if <b>k+m-1 &le; n &le; mk</b> the solution always exists.
To construct one follow this procedure (illustrated with <b>n</b> = 13, <b>m</b> = 5, and <b>k</b> = 4):
<ul>
<li>write integers in ascending order from 1 to <b>n</b>:
    <pre>1 2 3 4 5 6 7 8 9 10 11 12 13</pre>
<li>divide them in <b>m</b> consecutive blocks of size at most <b>k</b> elements
    (with at least one block actually having size of <b>k</b>). This is possible due to
    previously derived contraints on <b>n</b>:
    <pre>[ 1 2 3 ] [ 4 ] [ 5 6 7 8 ] [ 9 10 ] [ 11 12 13 ]</pre>
<li>reverse the order of integers in each block:
    <pre>[ 3 2 1 ] [ 4 ] [ 8 7 6 5 ] [ 10 9 ] [ 13 12 11 ]</pre>
<li>as you can see, blocks form decreasing subsequences, and every decreasing subsequence
    is contained in some block &mdash; therefore the longest one has size of <b>k</b>.
    On the other hand, all increasing subsequences are formed by picking at most one integer
    from each block and we can easily find one with length <b>m</b>.
    So forget about blocks and admire your <b>(m,k)</b>-ladder permutation:
    <pre>3 2 1 4 8 7 6 5 10 9 13 12 11</pre>
</ul>

Dividing integers in blocks to make the initial blocks
as small as possible will result in lexicographically smallest permutation:

<pre>[ 1 ] [ 2 ] [ 5 4 3 ] [ 9 8 7 6 ] [ 13 12 11 10 ]</pre>

Most coders used variations of the following algorithm:

<pre>
<b>if</b> k+m-1 &gt; n <b>or</b> n &gt; m*k:
   <b>return</b> no answer
n -= m
<b>for</b> i = m <b>downto</b> 1:
   count[i] = 1 + min(n, k-1)
   n -= min(n, k-1)
n = 0
<b>for</b> i = 1 <b>to</b> m:
   <b>for</b> j = count[i] <b>downto</b> 1:
      perm.append(n+j)
   n += count[i]
<b>return</b> perm
</pre>

<tc-webtag:handle coderId="22653739" context="algorithm"/>'s
<a href="/stat?c=problem_solution&cr=22653739&rd=10012&pm=6175">solution</a> is one of them.

<br /><br />
 

<div class="authorPhoto">
    <img src="/i/m/monsoon_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7502813" context="algorithm"/><br />
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
