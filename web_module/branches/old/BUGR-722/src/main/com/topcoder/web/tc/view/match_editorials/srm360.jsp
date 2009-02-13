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
    <A href="/stat?c=round_overview&er=5&rd=10772">Match Overview</A><br>
    <tc-webtag:forumLink forumID="516057" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 360</span><br>Tuesday, July 24, 2007
<br><br>



<h2>Match summary</h2> 

 

<p>If each SRM makes the TopCoder community one degree better, we're on the
spot where we started more than 6 years ago.
Because 360 degrees make a full cycle.</p>

<p>SRM 360 Division 1 leader's title was taken by <tc-webtag:handle coderId="14970299" context="algorithm"/>, thanks to his five
successful challenges, allowing him to regain a target sign. Second place
went to <tc-webtag:handle coderId="19849563" context="algorithm"/>, whose 1000-pointer was the fastest. Top 3 was rounded out by
<tc-webtag:handle coderId="10574855" context="algorithm"/>, who continues in his long-term struggle for new records.

<p>Division 2 victory was deserved by Japanese newcomer <tc-webtag:handle coderId="22690109" context="algorithm"/>, who promises to be a worthy
Div 1 competitor: no one else could solve both the medium and the hard.
<tc-webtag:handle coderId="22000369" context="algorithm"/> and <tc-webtag:handle coderId="22656577" context="algorithm"/> follow, both with good time on the 1000-pointer that
allowed them to place in the top three without any successful challenges.</p> 

 

<H1> 

The Problems 

</H1>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8027&amp;rd=10772" name="8027">AzimuthMonitoring</a></b> 

</font> 

<A href="Javascript:openProblemRating(8027)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516057" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      616 / 670 (91.94%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      445 / 616 (72.24%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>tstan436</b> for 246.09 points (3 mins 35 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      192.90 (for 445 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>There was no trick in this problem. The correct solution was to
follow the given instructions one by one and calculate the new azimuth
correctly after each instruction.</p>

<p>A slippery place is the fact that the azimuth must be between 0 and 359.
A natural way to implement it is to write</p>

<p><pre>
    azimuth += change; // ATTENTION!
    azimuth %= 360;    // IT'S WRONG!
</pre></p>

<p>Be aware that the remainder operation '%' can return negative result, for example</p>

<p><pre>
    (-99) % 360 produces -99
    (-566) % 360 produces -206
</pre></p>

<p>A detailed explanation can be found in
<a href="http://java.sun.com/docs/books/jls/third_edition/html/expressions.html#24956">Java Language Specification</a>
or other sources.</p>

<p>To take a remainder modulo 360 and ensure it's between 0 and 359, one can write</p>

<p><pre>
    azimuth = ((azimuth % 360) + 360) % 360; // Works for general case
</pre></p>

<p>or</p>

<p><pre>
    azimuth = (azimuth + 360) % 360; // In this specific problem
</pre></p>

<p>The fastest <a href="/stat?c=problem_solution&rm=265676&rd=10772&pm=8027&cr=22635428">solution</a> by <tc-webtag:handle coderId="22635428" context="algorithm"/> explains what was expected.</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7875&amp;rd=10772" name="7875">SumOfSelectedCells</a></b> 

</font> 

<A href="Javascript:openProblemRating(7875)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516057" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      233 / 670 (34.78%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      23 / 233 (9.87%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>omeometo</b> for 429.06 points (11 mins 57 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      247.33 (for 23 correct submissions) 

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

      500 / 573 (87.26%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      196 / 500 (39.20%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Egor</b> for 241.39 points (5 mins 24 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      160.62 (for 196 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>In this problem, a square table turns out to be a special case. Let's
investigate the non-square case first. Suppose the width of the table is
greater that its height.</p>

<p>The number of cells selected by Jessie will be the height of the table. Hence
it is possible to unselect one cell and select another one in the same row.
In order for the hypothesis to be correct, the integers written in these two
cells must be equal. Consequently, the entire table should look like</p>

<p>
A<sub>1</sub> A<sub>1</sub> A<sub>1</sub> ... A<sub>1</sub> A<sub>1</sub><br/>
A<sub>2</sub> A<sub>2</sub> A<sub>2</sub> ... A<sub>2</sub> A<sub>2</sub><br/>
.<br/>
.<br/>
A<sub>H</sub> A<sub>H</sub> A<sub>H</sub> ... A<sub>H</sub> A<sub>H</sub><br/>
</p>

<p>This condition is necessary and turns out to be sufficient, because in such
table, Jessie's sum will always equal A<sub>1</sub> + A<sub>2</sub> + ... + A<sub>H</sub>.</p>

<p>Similarly, if the height is greater than the width, checking the hypothesis
reduces to checking that the table is of the following form:</p>

<p>
A<sub>1</sub> A<sub>2</sub> ... A<sub>W</sub><br/>
A<sub>1</sub> A<sub>2</sub> ... A<sub>W</sub><br/>
A<sub>1</sub> A<sub>2</sub> ... A<sub>W</sub><br/>
.<br/>
.<br/>
A<sub>1</sub> A<sub>2</sub> ... A<sub>W</sub><br/>
A<sub>1</sub> A<sub>2</sub> ... A<sub>W</sub><br/>
</p>

<p>Now, consider a square table. Take four cells on the intersections of two rows
and two columns: A<sub>ip</sub>, A<sub>jp</sub>, A<sub>iq</sub>, A<sub>jq</sub>.</p>

<p>Assume the following inequality: A<sub>ip</sub> + A<sub>jq</sub> &ne; A<sub>jp</sub> + A<sub>iq</sub>. In this case, in some
Jessie's selection, she can unselect the left two integers and select the right
two, thus changing the overall sum.</p>

<p>Hence, in order to satisfy the hypothesis, all such pairs of sums should be
equal. Fortunately, the opposite also holds: if all equalities are satisfied,
the hypothesis is correct.</p>

<p>More detailed analysis shows that it is enough to check the following
equality for all i and j:</p>

<p>A<sub>11</sub> + A<sub>ij</sub> = A<sub>i1</sub> + A<sub>1j</sub></p>

<p>By the way, that means that one column and one row determine the rest of the
table.</p>

<p><tc-webtag:handle coderId="14970299" context="algorithm"/> showed the best understanding of this problem, writing a coherent and
fast <a href="/stat?c=problem_solution&rm=265630&rd=10772&pm=7875&cr=14970299">solution</a> first, and making 5 successful challenges later.</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8026&amp;rd=10772" name="8026">TakeSubstringGame</a></b> 

</font> 

<A href="Javascript:openProblemRating(8026)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516057" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      54 / 670 (8.06%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      19 / 54 (35.19%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>omeometo</b> for 749.92 points (17 mins 41 secs)

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      570.02 (for 19 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>The contestants were asked to find a winning strategy for yet another <a href="http://en.wikipedia.org/wiki/Impartial_game">impartial game</a>.
As explained in a previously written <a href="/tc?module=Static&d1=tutorials&d2=algorithmGames">tutorial</a>,
such games should most usually be analyzed in terms of winning and losing positions.</p>

<p>In this game, position is the number written on the board.
According to the rules, single-digit numbers 1 through 9 are losing positions,
because the player that faces such number can't make a move.
For all greater numbers, the following general rule should be used:</p>

<p><em>If there is a move from the current position to a losing position, then
the current position is winning.<br/>Otherwise, it is losing.</em></p>

<p>The following pseudocode performs the analysis of all the positions.</p>

<p><pre>
    for i = 10 to n do
      for m : all proper substrings of i do
        if (m > 0) and (not winning[i - m]) then
          // There is a move to a losing position.
          winning[i] = true;
</pre></p>

<p>Now, if <b>winning</b>[<b>n</b>] is true, find the smallest substracted m that leads us to
a losing position and return this m.</p>


<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7876&amp;rd=10772" name="7876">PrinceOfPersia</a></b> 

</font> 

<A href="Javascript:openProblemRating(7876)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516057" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      319 / 573 (55.67%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      144 / 319 (45.14%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>jakubr</b> for 457.44 points (8 mins 49 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      300.17 (for 144 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>Based on a classical video game plot, this problem allowed two approaches.</p>

<font size="+1"><b>Approach 1: MaxFlow</b></font>

<p>Note: to understand this approach one needs a thorough understanding of
<a href="http://en.wikipedia.org/wiki/Flow_network">flow networks</a>. A <a href="/tc?module=Static&d1=tutorials&d2=maxFlow">tutorial</a> is available in the Educational Content section.

<p>Build a flow network according to the following rules:</p>

<ul>
<li>For each empty cell x create two vertices A<sub>x</sub> and B<sub>x</sub>,
and an edge A<sub>x</sub> &rarr; B<sub>x</sub> with capacity 1.
<li>For each pair of adjacent empty cells x and y create edges
B<sub>x</sub> &rarr; A<sub>y</sub> and B<sub>y</sub> &rarr; A<sub>x</sub> of infinite capacity.
<li>If p is the Prince's cell and q is the Princess's cell,
call B<sub>p</sub> the source and A<sub>q</sub> the sink of the network.
</ul>

<p>Now a route from the Prince to the Princess corresponds to a simple flow of
size 1 in this network. And the suggested problem is to find the size of the
minimum cut, which is the same as the size of maximum flow, 
according to the <a href="http://en.wikipedia.org/wiki/Max_flow_min_cut_theorem">Max-flow min-cut theorem</a>.</p>

<p>There is a (still increasing) number of maximum flow algorithms, many of which
could have been implemented in this problem, say Ford-Fulcerson algorithm
implemented by <tc-webtag:handle coderId="10574855" context="algorithm"/> in his <a href="/stat?c=problem_solution&rm=265632&rd=10772&pm=7876&cr=10574855">solution</a>.</p>

<p>Note that an infinite maximum flow corresponds to the answer -1.</p>

<h3>Approach 2: Specificity of the problem</h3>

<p>The answer is -1 if and only if the two 'P' cells are adjacent.</p>

<p>If they are not, here's a non-optimal solution for Jaffar: lock the poor
Princess. She has 0 to 4 empty cells adjacent to her cell, so put obstacles
in each of these cells and prevent her from any movement.</p>

<p>Hence, the correct answer for the problem is no more than 4.</p>

<p>How can we check that the answer is 3 or less? Iterate over all triples of
empty cells, and for each triple try to put obstacles in these three cells and
check whether the Prince and the Princess are disconnected. To check this
property use any graph search algorithm, DFS being probably the easiest to
implement.</p>

<p>Similarly, (better even before checking triples) check the empty set of cells,
all single empty cells and all pairs of empty cells. As soon as the set being
checked separates the heroes, return the size of that set.</p>

<p>If S is the size of the maze (height &times; width), the number of sets to
check is O(S<sup>3</sup>) and each check takes O(S), thus the complexity is O(S<sup>4</sup>).</p>
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7877&amp;rd=10772" name="7877">ConvexArray</a></b> 

</font> 

<A href="Javascript:openProblemRating(7877)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516057" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      56 / 573 (9.77%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      30 / 56 (53.57%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ACRush</b> for 740.04 points (18 mins 14 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      567.91 (for 30 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>First, imagine a n-gon with n > 3. Remove the last vertex. The remainder is
still a valid convex polygon.</p>

<p>Thus if we can concatenate some array of length 2+ to our <b>beginning</b>
and get a valid n-gon with n > 3, then the last two concatenated integers
were unnecessary.</p>

<p>From this, the following statement arises:<br>
Let n be the length of <b>beginning</b>.
If the answer is not {-1}, then the length of the answer equals
m = max(6 - n, n % 2).</p>

<p>Now, the correct solution is to check all arrays of
length m in lexicographical order, and for each array check whether
<b>beginning</b> concatenated with this one gives a convex array.</p>

<p>How to check that an array is convex?</p>

<p>The first three conditions are already satisfied, provided we only consider
arrays of length m containing integers of range 1..50.</p>

<p>Now check the convexity. Since 180 degree angles are not allowed, we are to
check that orientation of all triples of consecutive vertices is the same.</p>

<p>Probably, if the 4th example weren't given, a number of coders wouldn't go
beyond this check. But it is useful to know that this check is incomplete,
the simplest counterexample being a five-point star.</p>

<p>There are several workarounds to that, here's a suggestion that is easy to code:
count the groups of consecutive vertices with strictly increasing y coordinates,
and the groups with strictly decreasing y coordinates.</p>

<p>In a simple polygon there will be no more than 3 such groups. In all polygons
that were falsely considered convex by the previous check, this number will be
at least 4. (Prove this as an exersize.)</p>

<p>The only dubious place is how do we check all the arrays when m is 6 (or 5).
Well, the specificity of the problem delights us here: when searched
lexicographically, the correct answer {1, 1, 1, 2, 2, 1} will be found instantaneously.</p>

<br /><br />






<div class="authorPhoto">
    <img src="/i/m/darnley_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21971539" context="algorithm"/><br />
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
