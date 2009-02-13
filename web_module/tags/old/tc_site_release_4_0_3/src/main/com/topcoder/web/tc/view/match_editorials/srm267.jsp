<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statisics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505775" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 267</span><br>Wednesday, October 5, 2005
<br><br>

<span class="bigTitle">Match summary</span>
<p>
This was the last SRM before the Open tournament finals next week, and a number of the finalists were competing in this match to practice.
<br></br>
The Division 1 problems were all quite approachable, with 42 coders finishing the hard problem and 11 coders finishing all three correctly.
<b>Petr</b> had the highest score with 1514.72 total points, including 3 successful challenges.
<b>Ying</b> finished second with 1343.01 and <b>Jan_Kuipers</b> third with 1316.99.

<br></br>
First and second place in Division 2 were newcomers <b>fuwenjie</b> and <b>janos</b>, followed by <b>tolkienfan</b> in third.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4511&amp;rd=8000" name="4511">TaxTable</a></b>
</font>
<A href="Javascript:openProblemRating(4511)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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

      259 / 311 (83.28%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      111 / 259 (42.86%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>dby</b> for 241.01 points (5 mins 31 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      177.68 (for 111 correct submissions)
    </td>
  </tr>

</table></blockquote>

<p>

In this problem, a function for converting income into tax was described.  Coders then had to write the inverse of this function: given an amount of tax, check if it is possible to produce this amount from some income.  If it is, return that income rounded to the nearest integer.  
<br></br>
This was fairly easy since the function was a monotonic piecewise-linear function typical of taxation systems, but still many coders handled very large or small values incorrectly, or didn't properly convert to or from floating point.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4720&amp;rd=8000"name="4720">Airways</a></b>
</font>
<A href="Javascript:openProblemRating(4720)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      27 / 311 (8.68%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      11 / 27 (40.74%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>fuwenjie</b> for 460.84 points (8 mins 25 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      277.47 (for 11 correct submissions)
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
      155 / 280 (55.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      98 / 155 (63.23%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ploh</b> for 242.78 points (4 mins 55 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      161.38 (for 98 correct submissions)
    </td>
  </tr>

</table></blockquote>

<p>
This geometry problem reduced to some standard trigonometry and linear algebra.  Once we know two legal flight directions which we can use to create an optimal solution, we can solve a 2x2 matrix to find how far in each direction we must fly, and then add the two values to get the answer.
<br></br>
We can find these two directions by finding the direction of the destination from the origin, and choosing the closest legal directions clockwise and anti-clockwise from that.  If the destination lies in a legal direction, we just return the distance to the destination.
<br></br>
A simpler solution is to try every pair of directions, and choose the minimum result from the pairs of directions that lead to a valid solution.

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3488&amp;rd=8000" name="3488">WordNumber</a></b>
</font>
<A href="Javascript:openProblemRating(3488)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      105 / 311 (33.76%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      29 / 105 (27.62%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      <b>fuwenjie</b> for 963.45 points (5 mins 34 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      644.03 (for 29 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

In this combinatorics problem, we must find string number <i>n</i> in the list of all non-empty strings consisting of the first <i>alpha</i> letters of the alphabet, sorted first by size and then alphabetically.


<br></br>
If <i>n</i> is between 1 and <i>alpha</i>, then clearly we want a one-letter string consisting of the <i>n</i>th letter.
There are <i>alpha</i>-squared strings of two letters, so if <i>n</i> is between (<i>alpha</i>+1) and (<i>alpha</i>+<i>alpha</i>*<i>alpha</i>), then we want string number (<i>n</i> - <i>alpha</i>) of the two-letter strings.


<br></br>

This pattern continues, so we can easily find the length L of the required string in the following way:

<br></br>
<pre>
FindString(N,alpha):
	L = 1
	If N <= alpha^L
		find the Nth string of length L
		Return
	Else
		N = N-alpha^L
		L = L+1
</pre>
To find the Nth string of length L, note that the first alpha^(L-1) strings have 'a' as the first letter, the next alpha^(L-1) strings have 'b' as the first letter, and so on.  Once we know which letter is first, we can subtract the appropriate multiple of alpha^(L-1) from N, and then we need to find the Nth string of length L-1.  This lends itself to an iterative or recursive approach:

<br></br>

<pre>
FindString(N,L,alpha):
	x = ceiling (N/alpha^(L-1))
	output the xth letter of the alphabet
	If L > 1
		FindString(N-(x-1)*alpha^(L-1),L-1,alpha)
</pre>
Most of these calculations are more convenient when we begin counting strings from zero, and most coders are used to zero-based indexing, so subtracting one from <i>n</i> at the beginning of the code is probably a good idea.

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4679&amp;rd=8000" name="4679">ValetParking</a></b>
</font>
<A href="Javascript:openProblemRating(4679)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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

      114 / 280 (40.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      42 / 114 (36.84%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>AdrianKuegel</b> for 398.92 points (15 mins 7 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      265.68 (for 42 correct submissions)
    </td>
  </tr>

</table></blockquote>

<p>

This is a shortest path/dynamic programming problem.  We want to find the minimum number of moves to take the customer's car
to the exit.

<br></br>

The important information to determine how many more moves are required is the location of the customer's car C and the location
of the empty space E.  The valid moves from any position are the following:

<br></br>
1)	Move the customer's car into the space, swapping C and E, if the car and the space are adjacent.<br>
2)	Move some other car in the 100x100 grid into the space, moving E by one square.
<br></br>

There are approximately 10^8 possible combinations of values of C and E, which is too many to use Dijkstra's algorithm or a breadth-first search directly on this state space.

<br></br>

However, once we have moved the empty space to be adjacent to the car, it is subsequently not necessary in an optimal solution for the space to be more than one row or one column away from the customer's car.  So by restricting the states we consider in this way we can use a breadth-first-search algorithm.

<br></br>

One can also compute the answer directly, noting that it is best to move the car in alternating directions where possible, and that to begin we want to move the space to either the west or south of the car.  See <b>Jan_Kuipers</b>'s code for a good example of this.

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4721&amp;rd=8000"
name="4721">HairCuts</a></b>
</font>
<A href="Javascript:openProblemRating(4721)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      55 / 280 (19.64%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      42 / 55 (76.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>krijgertje</b> for 939.34 points (7 mins 18 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      694.06 (for 42 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

How hard this problem was depends on how clever you were about it!

<br></br>

We can write a function to determine whether it is possible to satisfy the conditions, given an upper limit on haircut time.

<br></br>

To do this, we iterate through the customers in order of arrival and find the minimum and maximum times at which each customer's haircut can finish.  (The possible finish times are the interval between these.)
If the last customer's haircut can finish at <i>lastExit</i>, then we can satisfy the conditions with this upper bound on haircut time.

<br></br>

Using this function, we can first test if it is possible to create a schedule at all by setting the maximum to 10 hours.  If it is not possible, we return -1.
Next we note that if it is possible to create a schedule with a given upper bound, then it is possible with a higher bound; and if it is not possible to create a schedule with a given bound, then it is not possible with a lesser bound.

<br></br>

So if a schedule is possible at all, then there is some value X such that all bounds above X are possible, and all bounds below X are not possible.  There must be some schedule which has maximum haircut length X, so this is the required answer.  The value X can be found with a binary search on all values between 5 minutes and 10 hours.

<br></br>

For example, consider the case with customer entry times 3:00 and 4:00, and <i>lastExit</i> at 6:00.
If the haircuts can be at most 2 hours long, then we can give each customer a 90 minute haircut.  If the upper bound were higher, we could still give each of them a 90 minute haircut.
If the upper bound were only 1 hour, then we could not finish at 6:00.  If the upper bound were even lower, then it would still not be possible to finish at 6:00 since we would have less choice for the length of the haircuts.
So the answer X must lie between 1 hour and 2 hours, and we can continue a binary search in this interval.

<br></br>

A better approach is to note that there is an optimal solution in which each haircut takes the same amount of time.  Let this length be X.  If the Nth-last customer arrives R minutes before <i>lastExit</i>, then X <= R/N.  Also we must have X = R/N for some customer, or we will finish before <i>lastExit</i>.  If both these constraints are satisfied, we can construct a schedule with maximum haircut length X.

<br></br>
So we take the minimum value of R/N over all customers.  If this is less than 5 minutes, then no schedule is possible.  Otherwise, we return this value.
<br></br>
See <b>Ying</b>'s and <b>mbee</b>'s solutions for good examples of this algorithm.
<p>
<img src="/i/m/John_Dethridge_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="270505" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
