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
    <A href="/stat?c=round_overview&er=5&rd=10749">Match Overview</A><br>
    <tc-webtag:forumLink forumID="514951" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Open<br>Round 3</span><br>Saturday, April 14, 2007
<br><br>


<h2>Match summary</h2> 

<p>
The second round of the tournament was by no means easy. The easy problem was made way more
tricky than expected due to the use of doubles in the input. The medium problem was fairly
simple &ndash; once you understood what you had to do. Apparrently the problem statement was
not clear enough so a clarifying broadcast had to be issued. Finally, the hard problem, while
not conceptually difficult, required a lot of careful coding, and only a few coders had 
enough time to finish it. 
<tc-webtag:handle coderId="10574855" context="algorithm"/>
won the round with a comfortable 300-point lead before
second 
<tc-webtag:handle coderId="11829284" context="algorithm"/> 
and third <tc-webtag:handle coderId="144400" context="algorithm"/>
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7615&amp;rd=10749" name="7615">Defects</a></b> </font> <A href="Javascript:openProblemRating(7615)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A><A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514951" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level One: <blockquote><table cellspacing="2">
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
      604 / 817 (73.93%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      365 / 604 (60.43%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>x-ray</b> for 242.02 points (5 mins 11 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      161.76 (for 365 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
<p>
In my opinion the fact that doubles were used in this problem's input only made it unnecessarily
tricky. The idea of the solution would remain the same if integer coordinates were used.
This way, many coders were unnecessarily bitten by various precision issues. After the match
many coders remarked that the situation was not comfortable. For example, the standard "rule
of doubles" about 1e-9 error tolerance didn't apply for the input values, one had to consider
them as exact.
</p>

<p>
When approaching the task, we should first note that the rectangle is completely useless.
We are only allowed to move along the boundary, and its shape doesn't matter. The only thing
we need are the distances between consecutive points.
</p>

<p>
To calculate the distances, we can (for example) for each given point P calculate the
counter-clockwise distance d(P) from [0,0] to P. These values uniquely describe the given points,
and sorting them is equivalent to sorting the points along the boundary.
</p>

<p>
Given two points P and Q, their distance is the smaller of the two values (d(P)-d(Q)) and 
(perimeter-(d(P)-d(Q))).
</p>

<p>
After these preparations we are ready to look for the best point. 
Usually the thought process in similar situations is: Place the point somewhere 
and look at what happens if you move it slightly. You will probably be able to move
it and improve the solution until your point hits some special location. 
All that remains is to identify the special locations, and then try them and pick the best one.
</p>

<p>
Using this approach we may come to this conclusion:
<i>Either the location of one of the given points is the optimal place, or 
there is an optimal place such that one of the given points is exactly on the opposite point of the rectangle.</i>
</p>

<p>
Proof: Imagine that we stand in some place different from all the given points. 
Suppose that none of the given points is exactly
in the opposite place. For A of the given points the shorter
distance is clockwise, for B of them it is counter-clockwise. 
If A&lt;B, we may move by some small amount D clockwise. Clearly the sum of distances will
increase by D(B-A), and thus the place was not optimal. 
Similar reasoning may be applied for the case A&gt;B.
</p>

<p>
The case A=B remains. In this case we may move by a small amount in either direction and the sum
won't change at all. Pick any direction and start moving. Sooner or later one of the numbers A 
or B will change. This happens exactly when we pass one of the given points, or if a 
point is exactly on the opposite side. Q.e.d.
</p>

<p>
The theorem that we just proved can be improved upon (how?), but in our case it is not necessary.
We have a set of at most 2N candidate places for the optimal location.
For each of them compute the sum of distances, and pick the best one.
</p>

<p>
See <tc-webtag:handle coderId="144400" context="algorithm"/>'s <a
href="/stat?c=problem_solution&rm=264406&rd=10749&pm=7615&cr=144400">solution</a>
for a clean implementation.
</p>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7347&amp;rd=10749" name="7347">WordSplit</a></b> </font> <A href="Javascript:openProblemRating(7347)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A><A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514951" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      544 / 817 (66.59%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      274 / 544 (50.37%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Krzysan</b> for 488.67 points (4 mins 20 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      329.86 (for 274 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
<p>
Suppose that we decide where to make the first split. We are left with a suffix of the 
original string, and we have to decide how to split it so that the entire set of pieces
will be optimal.
</p>

<p>
We claim that in this case it is enough to solve the original task for our suffix.
</p>

<p>
Why is it so? Clearly we need to split it into as few pieces as possible. What remains
is to show that the resulting sequence of pieces will be the lexicographically smallest one.
</p>

<p>
Let P be the first part of our original string, and let S be the suffix. Suppose that
we have two arbitrary ways how to split S into an optimal number of pieces. 
Let the corresponding sorted piece sequences be B = (B[1], ..., B[n]) and C = (C[1], ..., C[n]), respectively.
Suppose that (B[1], ..., B[n]) &lt; (C[1], ..., C[n]). To construct the sequence
of pieces for the original string, we now only need to insert P into its appropriate
position in each of the sequences.
We need to show that after we insert P, the sequence B will still be smaller than
the sequence C.
</p>

<p>
Let i be the first position where B and C differ. We know that B[i]&lt;C[i].
We just need to check three cases. If P&le;B[i], we may insert it into B and C 
at the same position less than or equal to i, and the new sequences will differ in position i+1.
Similarly, if C[i]&le;P, the sequences will still differ in position i, as P may be
inserted after this position.
In the remaining case when B[i]&lt;P&lt;C[i], after inserting P we have:
B[i] remains the same, and C[i] changes to P. Clearly, in all cases we still
have B &lt; C.
</p>

<p>
Thus the task is now pretty simple: To compute the optimal partitioning
for a given string, try all valid places where the 
first piece ends, and for each of them take the optimal solution for the rest
of the string. In this way for each length of the first piece you will get 
one candidate. Pick the best candidate. 
</p>

<p>
Recursion with memoization / a linear dynamic programming 
was probably the most simple way how to implement
this task. As the time limit was not an issue with this approach, you could 
go for convenience. For example, C++ coders could use the power of STL &ndash;
do you know what operator&lt; does if the operands are vectors?
See my <a
href="/stat?c=problem_solution&rm=264428&rd=10749&pm=7347&cr=8357090">solution</a>
for a reasonably clean implementation of this approach.
</p>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7352&amp;rd=10749" name="7352">Neaten</a></b> </font> <A href="Javascript:openProblemRating(7352)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A><A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514951" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      45 / 817 (5.51%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      9 / 45 (20.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 691.88 points (21 mins 2 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      493.76 (for 9 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
<p>
We will show a solution that doesn't use any fancy BigInteger stuff. We don't need
too many operations on large numbers, and those we will need will be simple enough.
</p>

<p>
We will start by making the input number more pretty. We will convert it to a vector
of digits, with say 120 decimal places. To do this, start by locating the decimal
point. If it is not present, add it at the end. Add zeroes to the right end of the input 
number until it has enough decimal places.
Check whether the number is less than 10<sup>-<b>k</b></sup>. If yes, return "0" and exit.
Delete unnecessary leading zeroes.
</p>

<p>
Now we have to find the interval of valid approximations.
For the absolute error the interval is (<b>number</b>-10<sup>-<b>k</b></sup>,<b>number</b>+10<sup>-<b>k</b></sup>).
For the relative error the interval is (<b>number</b>*(1-10<sup>-<b>k</b></sup>),<b>number</b>*(1+10<sup>-<b>k</b></sup>)).
Clearly for <b>number</b>&ge;1 the relative error gives us the larger interval, and for 
<b>number</b>&lt;1 the absolute error is better. 
</p>

<p>
In either case, 
let L and U be the lower and upper bound of the interval of valid approximations. 
Clearly both L and U have a finite decimal expansion and they have less than 120 decimal digits.
Thus we can compute and store them exactly. All we need to compute them is to implement
addition and subtraction for large decimals &ndash; e.g., for the relative error we can compute U by 
adding <b>number</b> and (<b>number</b> shifted <b>k</b> digits to the right).
</p>

<p>
Now we need to find the "most round" number in the interval (L,U). This can be done simply by
manipulating the digits of L and U. We will show it on a simple example:
</p>

<pre>
L = 13.035935623512
U = 13.036253252352
</pre>

<p>
Suppose that we fix the number of digits left in the resulting approximation. Now we need to check
whether there is such a number in the interval (L,U). The number has to be larger than L. We can
obtain the smallest such number by taking L, removing its last digits to get the correct length, 
and then adding 1 to the last digit. If this candidate lies within (L,U), it is the approximation
we wanted. If not, we know that such an approximation is not possible.
</p>

<p>
For example, consider the above case and 8 digits.
</p>

<pre>
L_truncated = 13.035935
candidate   = 13.035936
candidate   &lt; U
</pre>

<p>
Thus we found an approximation with 8 digits. If we now consider 6 digits only, we get the following
approximation:
</p>

<pre>
L_truncated = 13.0359
candidate   = 13.0360
candidate   &lt; U
</pre>

<p>
Thus we found an approximation with 6 digits. This is clearly not an optimal approximation, as it
ends with a zero. However, this does not matter. In such a case we will always discover the same
approximation if we restrict ourselves to less (in our case, 5) digits.
</p>

<p>
And we are almost done. As the numbers are reasonably small, all we need to do is to check all
possible numbers of digits and for each of them check whether it leads to a valid approximation
Note that we are limited by the position of the decimal point, we can not drop the digits that
are to its left. The solution is reasonably simple to implement, we only need addition, subtraction
and comparison. And as we fixed the number of decimal places, these operations will look exactly 
the same as with big integers.
</p>

<p>
You can find my solution implementing this approach in the practice room.
</p>
</p>




<div class="authorPhoto">
    <img src="/i/m/misof_big.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
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
