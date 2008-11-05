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
    <A href="/stat?c=round_overview&er=5&rd=10759">Match Overview</A><br>
    <tc-webtag:forumLink forumID="514953" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Open<br>Round 4</span><br>Saturday, April 28, 2007
<br><br>


<h2>Match summary</h2> 

 

One hundred and forty-eight of the top algorithm coders gathered in a rumble for one of 48
spots in the 2007 TCO finals. As expected, the competition was vicious, denying three of the top 10 rated coders a place in the finals.

<br /><br />

Over recent years, it has often been the case that a single problem
was enough to advance through the later online rounds of a TopCoder
tournament. This was not the case this time around -- 16 contestants
solved all three problems and plenty of coders found themselves below
the cutoff line with two problems solved.

<br /><br />

<tc-webtag:handle coderId="7433858" context="algorithm"/> recovered
from his recent rating decline in the best possible way, winning the
match with the fastest hard despite resubmitting the easy. The
main subject of post-match chat, however, was underdog
<tc-webtag:handle coderId="15687886" context="algorithm"/>, who now
boasts a new yellow color thanks to his performance in this
tournament, including his second-place finish in this match. Close behind
them were usual suspects <tc-webtag:handle coderId="272072"
context="algorithm"/> and <tc-webtag:handle coderId="144400"
context="algorithm"/>.

<br /><br />

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7733&amp;rd=10759" name="7733">PolishNotation</a></b> 

</font> 

<A href="Javascript:openProblemRating(7733)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<br> 

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

      144 / 148 (97.30%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      132 / 144 (91.67%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>JongMan</b> for 242.29 points (5 mins 5 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      202.08 (for 132 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 



It didn't take long for most coders to warm up their dynamic
programming circuits, as evidenced by the high success rate on this
problem.

<br /><br />

The rules in the problem statement describing a valid expression in
prefix notation form the backbone of the DP solution:
<ul>
  <li>If a string is all digits (without a leading unary minus), then
  there is only one way of interpreting that string in prefix
  notation, as the integer contained in the string.</li>
  <li>If a string starts with an operator, then it must be composed of
  two valid subexpressions in prefix notation, as described by the
  second rule. Moreover, these are independent so we can separately
  calculate the number of ways of interpreting each of them (this is
  the dynamic programming part, splitting a problem into smaller
  subproblems of the same form), and multiply them together. We do
  this for each possible split point and sum the products.</li>
  <li>Additionally, if the string starts with a minus and all remaining
  characters are digits, then there is an additional way to interpret it,
  as a negative integer.</li>
</ul>

For slick implementations of the above idea, take a peek at
<tc-webtag:handle coderId="7446789" context="algorithm"/>'s
highest-scoring <a
href="http://www.topcoder.com/stat?c=problem_solution&rm=264582&rd=10759&pm=7733&cr=7446789">solution</a>
or
<tc-webtag:handle coderId="310333" context="algorithm"/>'s
<a
href="http://www.topcoder.com/stat?c=problem_solution&rm=264583&rd=10759&pm=7733&cr=310333">solution</a>.

<br /><br />

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7743&amp;rd=10759" name="7743">SortingInIterations</a></b> 

</font> 

<A href="Javascript:openProblemRating(7743)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

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

      96 / 148 (64.86%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      60 / 96 (62.50%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>tomekkulczynski</b> for 462.41 points (12 mins 52 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      320.29 (for 60 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

With constraints as high as 400000 on all parameters, quadratic
solutions were bound to time out, for example on the
decreasing-subsequence case, which can easily be generated with
a0=399999, X=1, Y=399999, M=400000 and n=400000.

<br /><br />
  
Suppose the distinct numbers appearing in the sequence are sorted and
labeled x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub> etc. so that
x<sub>1</sub> &lt; x<sub>2</sub> &lt; x<sub>3</sub> ... and so
on. Here is another way to rephrase the process in the problem:
<ol>
  <li>In iteration 1, remove all occurrences of x<sub>1</sub> from the
  blackboard.</li>
  <li>If x<sub>2</sub> appears after the last occurrence of the
  element removed (initially x<sub>1</sub>), all such occurrences of
  x<sub>2</sub> can be removed in the same iteration. If all
  occurrences of x<sub>2</sub> have been removed, repeat this step for
  x<sub>3</sub> etc.</li>
  <li>If not all occurrences of x<sub>2</sub> (or one of the later
	 elements, if we got further in step 2) were removed, then we have to start a
	 new iteration to remove them &ndash; back to step 1.</li>
</ol>


Even though a single iteration of step 2 can take long (when it
handles multiple elements), if we can implement each operation in it
in sublinear time, then the overall running time of the solution will
be subquadratic.

<br /><br />

This is because each distinct value is considered at most twice
&ndash; once in step 2 and possibly again in step 1 (if not all
occurrences were removed in step 2 and a new iteration was
started). If we handle multiple elements in step 2, we will go back to
step 1 fewer times.

<br />
<br />
  
The final trick is the <em>If x<sub>2</sub> appears after</em>
condition in step 2. To evaluate the condition, we need to keep track
of where numbers are on the blackboard and be able to update this
information efficiently. Various structures were used by contestants,
for example mapping numbers to lists containing indices where they
appear (and keeping these sorted), or having a big sorted list of
(<em>number</em>, <em>position</em>) pairs. All of these suffice as
long as they guarantee that the amortized operation complexity doesn't
become linear on degenerate cases. As described by
<tc-webtag:handle coderId="10157606" context="algorithm"/>
in <a
href="http://forums.topcoder.com/?module=Message&messageID=796730">this
forum post</a>, this operation can even be done in amortized constant
time, for a total time running time of O(n+M).

<br />
<br /> 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7668&amp;rd=10759" name="7668">FourSubstrings</a></b> 

</font> 

<A href="Javascript:openProblemRating(7668)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

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

      62 / 148 (41.89%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      39 / 62 (62.90%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>liympanda</b> for 775.28 points (11 mins 47 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      549.16 (for 39 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

The problem begged for a dynamic programming solution, but it wasn't
necessarily obvious what the solution was.

<br /><br />

Suppose we scan the text from left to right and, at each character, we
contemplate placing substrings there (if any of them match the
text). In order to be able to calculate how many of the newly covered
letters have already been covered by words placed recently (and
shouldn't be counted again), we also need to keep track of how many
letters starting from the current character have already been
covered. Additionally, we need to know which of the four
substrings we've already placed &ndash; a 4-bit bitmask will do.

<br /><br />

The state space in our DP solution will thus consist of
(<em>index</em>, <em>covered</em>, <em>mask</em>) triplets, indicating
that we're currently at character <em>index</em>, that the
next <em>covered</em> letters have already been covered by previously
placed substrings and should not be counted towards the score again,
and that strings still to be found in the text are represented
by <em>mask</em>. A sample state using the example in the problem
statement is (1, 3, 0001), meaning that we're at character 1, have
just placed the substring "our" (last bit in bitmask is set), and since we only just
did it, the next 3 letters are already covered:

<div align="center">
<img src="/i/srm/tco07_rd_4.png" alt="" style="margin: 10px;" />
</div>

Now, when calculating some function <em>f</em>(<em>index</em>, <em>covered</em>, <em>mask</em>), one
option is not to place a substring at the current position and move on
to the next character. This leads us to state (<em>index</em>+1, max(0,
<em>covered</em>-1), <em>mask</em>). If we place substring <em>i</em>,
we go to state (<em>index</em>, max(<em>covered</em>, length of
substring <em>i</em>), <em>mask</em> with set bit <em>i</em>). When
placing a substring, we don't move to the next character because the
problem statement allows us multiple substrings to begin at a single
location.

<br />
<br />

Since we have to calculate two different values (the least and most
covered characters), we calculate two DP functions in parallel (say, <em>mini</em> and <em>maxi</em>). Sample
code for the calculation function (without the base cases):

  <pre>   mini[index][covered][mask] = mini[index+1][max(0, covered-1)][mask];
   maxi[index][covered][mask] = maxi[index+1][max(0, covered-1)][mask];
   
   for ( int i=0; i&lt;4; ++i ) {
      if ( (mask&(1&lt;&lt;i)) != 0 || !starts[index][i] ) continue;

      int nextc = max( covered, len[i] );
      int nextm = mask | (1&lt;&lt;i);
      calc( index, nextc, nextm );
      mini[index][covered][mask] = 
         min( mini[index][covered][mask],
              mini[index][nextc][nextm] + max(0, len[i]-covered) );
      maxi[index][covered][mask] = 
         max( maxi[index][covered][mask],
              maxi[index][nextc][nextm] + max(0, len[i]-covered) );
   }</pre>
   
<br /><br />



<div class="authorPhoto">
    <img src="/i/m/lovro_big3.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="7390467" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="/public_right.jsp">
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
