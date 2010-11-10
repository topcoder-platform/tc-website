<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 430 Problem Set &amp; Analysis</title>

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
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13515">Match Overview</a><br />
    <tc-webtag:forumLink forumID="525104" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 430</span><br />Saturday, December 20, 2008
<br /><br />

<h2>Match summary</h2> 



<p> 

The problems for this SRM were quite hard - only 75% of participants were able to solve the easy in both divisions,

and the medium in Div 1 also was a tough test for most coders. 

One challenge helped <tc-webtag:handle coderId="22689544" context="algorithm"/> to win an incredibly close race over 

<tc-webtag:handle coderId="22504795" context="algorithm"/> by and 

<tc-webtag:handle coderId="8394868" context="algorithm"/>, with the third place being within 6 points 

of the win. The next trio of 

<tc-webtag:handle coderId="10574855" context="algorithm"/>

<tc-webtag:handle coderId="22653720" context="algorithm"/>

<tc-webtag:handle coderId="306707" context="algorithm"/> was packed as well, with less than point separating 

<tc-webtag:handle coderId="306707" context="algorithm"/> from making the top-5.

Division 2 was a relatively easy win for 

<tc-webtag:handle coderId="20105072" context="algorithm"/> - 

<tc-webtag:handle coderId="22727272" context="algorithm"/> got +225 during the challenge phase and still was more than 70 points behind.



</p> 



<H1> 

The Problems 

</H1>

</p> 



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8376&amp;rd=13521" name="8376">CreateGroups</a></b> 

</font> 

<A href="Javascript:openProblemRating(8376)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525104" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      275 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      589 / 782 (75.32%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      430 / 589 (73.01%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>wxGO</b> for 274.61 points (1 mins 4 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      199.92 (for 430 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>





Let <i>N</i> denote the number of schedules.

It is easy to see that the problem has no solution if and only if the total number of students 

is either too big (i.e., there are more than <b>maxSize</b>*<i>N</i> students) or too small (less than <b>minSize</b>*<i>N</i>).



Otherwise, there are two ways to calculate the minimal number of reassignments.



The first one is to simulate the reassignments. On each step, we find the largest group, the smallest group, and

reassign some students from the largest group to the smallest.

</p>

<p>

The second approach has been used by the majority of coders. 

It calculates the result in linear time and works in the following manner:

<ol>

<li>

Let consider schedules, where the number of students is greater than <b>maxSize</b> and calculate the total number of students needed to leave those groups (<i>needToErase</i>).

</li>

<li>

Then consider schedules, where the number of students is less than <b>minSize</b>. Calculate the total number of students needed to join them (<i>needToAccept</i>).

</li>

</ol>

The answer to the problem, as can be easily proved, is the maximum of <i>needToErase</i> and <i>needToAccept</i>. 

See <tc-webtag:handle coderId="22708534" context="algorithm"/>'s solution for an example of a clear implementation of this.

</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=9921&amp;rd=13521" name="9921">BitwiseEquations</a></b> 

</font> 

<A href="Javascript:openProblemRating(9921)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525104" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      301 / 782 (38.49%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      139 / 301 (46.18%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>yeputons</b> for 468.12 points (7 mins 30 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      308.18 (for 139 correct submissions) 

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

      653 / 679 (96.17%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      489 / 653 (74.89%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 247.83 points (2 mins 39 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      198.60 (for 489 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>





One can prove that number <i>y</i> is a solution of the given equation if and only if <i>y</i> 

has zeroes in all positions where <i>x</i> has ones (in binary notation, of course). 

In other words, we need to determine the digits of <i>y</i> for positions where <i>x</i> has zeroes.



For instance, if <i>x</i>&nbsp;=&nbsp;<tt>1001101001</tt> in binary (617 in decimal notation), 

then the last ten digits of <i>y</i> must be <i>y</i>=&nbsp;<tt>0**00*0**0</tt>, where '*' denotes either zero or one.

Also, we can pad any number of any digits to the beginning of the number, since all higher bits are zeroes.

</p>

<p>

Any replacement of all '*' by binary digits gives us a solution.

Clearly, the smallest non-zero solution can be received by replacing asterisks by "00001" for the asterisks, 

so it will be 1001101011 (or 619 in decimal).

The second smallest solution replaces asterisks by "00..00010", the third - by "00011", and so on.

In other words, the K-th smallest solution can be received by replacing all asterisks in <i>x</i> by 

digits of binary representation of number K.



See <tc-webtag:handle coderId="14769155" context="algorithm"/>'s solution for a clear implementation of this.





</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7583&amp;rd=13521" name="7583">ImageTraders</a></b> 

</font> 

<A href="Javascript:openProblemRating(7583)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525104" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      167 / 782 (21.36%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      33 / 167 (19.76%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>smilitude</b> for 901.09 points (9 mins 37 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      633.86 (for 33 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>



Probably, experienced coders didn't need much time to determine this one is <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=dynProg">a DP problem</a>.

The state of the problem can be represented by a triple (mask, i, p), where the image is ownded by trader <i>i</i>,

 who bought it for price <i>p</i>, and only traders from mask didn't own the image yet. 

For example, state (0010110, 3, 5) means that trader 3 owns the image, bought it for price of 5 and 

he may sell it to traders 3, 5 and 6. 



Since each trader can sell the image to maximum of <i>N</i> traders, each such a subproblem can be solved in linear time.

</p>



<p>

Using memoization instead of DP provides some advantages to implement

 the idea above. 

See 

<tc-webtag:handle coderId="20105072" context="algorithm"/>

 fastest solution as a short implementation of this.

</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10138&amp;rd=13521" name="10138">TwinTowns</a></b> 

</font> 

<A href="Javascript:openProblemRating(10138)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525104" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      320 / 679 (47.13%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      63 / 320 (19.69%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 363.32 points (18 mins 59 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      250.93 (for 63 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>



DP again!

The key constraints here are the total number of towns (at most 10) and the maximal partners which a town may have 

(at most 3).



The state of the problem will be <i>P[f<sub>1</sub>,f<sub>2</sub>,...,f<sub>n</sub>]</i> - and the answer for this state

will be the maximal number of twin towns, if 

<i>f<sub>i</sub></i> is the maximal number of partners allowed for the i-th city. 

Clearly, the initial problem is equivalent to <i>P[<b>maxPartners</b>, <b>maxPartners</b>, <b>maxPartners</b>,...,<b>maxPartners</b>]</i>.



We will solve each subproblem <i>P[f<sub>1</sub>,f<sub>2</sub>,...,f<sub>n</sub>]</i> in the following way:



<ul>

<li>Pick a city <i>i</i> such that <i>f<sub>i</sub></i> is minimal, but greater than zero.</li>

<li>Find partners for city <i>i</i> (it may have between 0 and <i>f<sub>i</sub></i> partners, inclusive).</li>

</ul> 

What follows, we want to reduce the original problem to solve several subproblems in the form 

<i>P[f'<sub>1</sub>,f'<sub>2</sub>,...,f'<sub>n</sub>]</i>.



<ol>

<li>The city <i>i</i> may have no twin. 

We set <i>f'<sub>i</sub> := 0 </i> and solve the subproblem

P[f'<sub>1</sub>,f'<sub>2</sub>,...,f'<sub>n</sub>].

</li>



<li>The city <i>i</i> may have exactly one twin.

We go through each possible twin <i>a</i> for our town <i>i</i> and set

<i>f'<sub>i</sub> := 0 </i>, <i>f'<sub>a</sub> := f<sub>a</sub>-1</i> 

and then

and solve the subproblem

P[f'<sub>1</sub>,f'<sub>2</sub>,...,f'<sub>n</sub>].

</li>



<li>The city <i>i</i> may have exactly two twins:

We find all possible twins <i>a, b</i> for our town <i>i</i>.

We set 

<i>f'<sub>i</sub> := 0 </i>, <i>f'<sub>a</sub> := f<sub>a</sub>-1</i>, <i>f'<sub>b</sub> := f<sub>b</sub>-1</i>

and then

solve the subproblem

P[f'<sub>1</sub>,f'<sub>2</sub>,...,f'<sub>n</sub>].

</li>



<li>The city <i>i</i> may have exactly three twins:

We find all possible twins <i>a, b, c</i> for our town <i>i</i>.

Set



<i>f'<sub>i</sub> := 0 </i>, <i>f'<sub>a</sub> := f<sub>a</sub>-1</i>, 

<i>f'<sub>b</sub> := f<sub>b</sub>-1</i>, <i>f'<sub>c</sub> := f<sub>c</sub>-1</i>

and then solve the subproblem

P[f'<sub>1</sub>,f'<sub>2</sub>,...,f'<sub>n</sub>].



</li>

</ol>



The last issue is the time complexity of this solution. 

Clearly, there exists at most 4<i><sup>n</sup></i> subproblems of the problem

(since each f<sub>i</sub> may vary between 0 and 3). 

Now lets estimate the time needed to solve one subproblem.

<ol>

<li>If <i>f<sub>i</sub></i>=1, it takes <i>O(n)</i> time, since we have up to <i>n</i> choices for <i>a</i>.</li>

<li>If <i>f<sub>i</sub></i>=2, it takes <i>O(n<sup>2</sup>)</i>, since we have up to <i>n<sup>2</sup></i> choices for <i>a</i> and <i>b</i>.</li>

<li>If <i>f<sub>i</sub></i>=3, it takes <i>O(n<sup>3</sup>)</i>, since we have up to <i>n<sup>3</sup></i> choices for <i>a</i>, <i>b</i> and <i>c</i>.</li>

</ol>



But how many subproblems require in <i>O(n<sup>3</sup>)</i>? We think this number can not be more than <i>2<sup>n</sup></i>, 

because this happens only if all <i>f</i> are either 0 or 3.

Similarly, at most <i>3<sup>n</sup></i> subproblems take <i>O(n<sup>2</sup>)</i> time, 

and the rest of subproblems can be solved in linear time. 

Therefore, the overall time complexity is 

<i>O(2<sup>n</sup>n<sup>3</sup> + 3<sup>n</sup>n<sup>2</sup> + 4<sup>n</sup>n)</i>.



<tc-webtag:handle coderId="22758647" context="algorithm"/>,

<tc-webtag:handle coderId="16125061" context="algorithm"/> and 

<tc-webtag:handle coderId="7459080" context="algorithm"/>

use this idea (they don't take minimal "free" capacity, but its still fast enough).

The rest of solutions is based on brutal n<sup>2</sup> * 4<sup>n</sup> complexity.



</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=9887&amp;rd=13521" name="9887">PickingUp</a></b> 

</font> 

<A href="Javascript:openProblemRating(9887)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525104" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      62 / 679 (9.13%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      15 / 62 (24.19%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>rem</b> for 601.87 points (27 mins 14 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      521.94 (for 15 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The key idea is to divide the players into two groups of the same size. 

Lets put the first <i>N</i>/2 players to the left group, and other <i>N</i>/2 players to the right group. 

Now, we generate each possible assignment in the left group and each possible assignment in the right group. 

In both cases, we'll check exactly 2<sup><i>N</i>/2</i></sup> possibilities. 

For each possibility we keep a bitmask of the assignment and its score difference. 

For example, if a possibility is (01011,-8), this means 

the first and third player were assigned to the team of the first captain, 

and the score difference between the teams is -8 (second team is 8 points better).

</p>

<p>

Now we are to combine the assignments for left part with the assignments for the right part.

Let left[<i>i</i>] be an array containing all those assignments for the left part, which put

 exactly <i>i</i> players into the first team. 

Similarly, let right[<i>i</i>] contain assignments for the right part with exactly <i>i</i> players being in the first team. 



It is clear we have to combine the possibilities from left[<i>i</i>] with the possibilities from right[<i>N</i>-<i>i</i>].

Lets forget for a second about the need for the lexicographically first solution.

Sort all arrays left[i] by score differences and similarly sort right[i] by score differences. 

For instance, the left part contains score differences (-8,-3,+2,+7,+9) and the assignments for right part (-7,-5,-1,+3,+6). 



Now one can easily use the two pointers technique to find the pair of numbers with sum as close to 0 as possible.

To do that, set A to 0 and B to the last element of right[<i>N</i>-<i>i</i>].

Compute the sum S = left[i][A] + right[<i>N</i>-<i>i</i>][B]. If S < 0, then, since you want to move S as close to 0 as possible,

you need to make the sum bigger. Therefore, you increment A. If S > 0, you want to decrease S and therefore decrement B.

As soon as either A or B go outside the array limits, you are done and return the best achieved S.



</p>

<p>

To find the lexicographically first answer, you need to modify the sort algorithm, order the equal elements of left[i] by their corresponding masks in

ascending order, and order equal elements of right[] arrays by masks in descending order.

The overall time complexity of this algorithm is <i>O(N*2<sup>N/2</sup>)</i>.



</p>






<div class="authorPhoto">
    <img src="/i/m/Janq_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10389461" context="algorithm"/><br />
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
