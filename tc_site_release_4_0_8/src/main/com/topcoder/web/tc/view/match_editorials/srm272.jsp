<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

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
<tc-webtag:forumLink forumID="505786" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 272</span><br>Saturday, November 19, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>With twelve coders in Div1 solving all three problems, this match was 
easier than some, but not without its difficulties. <b>radeye</b> was able 
to come up with two successful challenges to pass <b>Eryx</b> and take 3rd 
in the match, but this wasn't enough to surpass <b>tomek</b> who got a 
successful challenge of his own to keep him in 2nd. But <b>Petr</b>, who had 
the fastest correct submission for both the 500 and 1000, easily took 
first.</p>
<p>In Div2, newcomers <b>Nevo</b> and <b>simonenko</b> took first and second 
place, despite being in the same room. In fact <b>simonenko</b> attempted a 
challenge on <b>Nevo</b>'s 1000 point problem, but to no avail as 

<b>Nevo</b> took the room and division win.

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5884&amp;rd=8069" 
name="5884">HammingDistance</a></b>
</font>
<A href="Javascript:openProblemRating(5884)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505786"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      415 / 445 (93.26%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      364 / 415 (87.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>[4m]Oliver</b> for 249.74 points (0 mins 55 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      215.51 (for 364 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>Given two strings of equal length, it is quite simple to calculate their 
Hamming distance. All you have to do is loop through each character of the 
first string and compare it to the analogous character in the second string, 
if they don't match then increment a counter. The runtime of this process is 
proportional to the length of the strings. </p>
<p>To find the minimum of Hamming distances of all pairs of strings you can 
calculate the Hamming distance between all pairs of strings. If there are N 
strings each with length L, then there are N(N-1)/2 pairs (be sure not to 
compute a string's distance to itself), so the total runtime will be 
O(N<sup>2</sup> L). Since N and L are both bounded by 50, this is around 
125,000 operations, which is small enough for this brute force method to 
work.</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=5886&amp;rd=8069" 
name="5886">FewestFactors</a></b>
</font>
<A href="Javascript:openProblemRating(5886)"><img src="/i/rate_it.gif" 
hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505786"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      286 / 445 (64.27%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      176 / 286 (61.54%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Xepo</b> for 483.16 points (5 mins 20 secs)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      325.78 (for 176 correct submissions)
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
      363 / 374 (97.06%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      301 / 363 (82.92%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Zuza</b> for 248.59 points (2 mins 8 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      214.36 (for 301 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>This is the first problem where permutations come in handy. We know that 
each of the elements in <b>digits</b> must be used exactly once, so the only 
decision left up to us is the order the digits are put in. Every ordering of 
the digits is a permutation, thus the problem is to determine the 
permutation of digits which yields the fewest number of factors. C++ coders 
could use the next_permutation function, other languages had to generate the 
permutations using some other method (it can be done recursively with a 
depth first search, see the Round Tables for details).</p>

<p>Once you have a permutation of <b>digits</b>, you must determine how many 
factors it has. First transform the permutation into a number by summing 
each digit times the proper power of ten. Once you have this candidate 
number, you can loop through each positive integer less than the candidate 
to see if it is a factor. A number is a factor if when you divide the 
candidate by it you get a remainder of 0. If the candidate has the fewest 
factors seen so far, keep it.</p>
<p> With at most 5 digits there can be up to 5! = 120 permutations. With 
each permutation you have to check at most 99,999 possible factors (since 
each number has at most 5 digits). This means that the entire process takes 
on the order of 120*100,000 = 12,000,000 operations. This is fast enough to 
pass.</p>
<p>Another way to count the factors is to note that for every factor less 
than the square root of the candidate there is exactly one factor greater 
than the square root. Thus you really only need to loop up to the square 
root counting each factor twice (and if the candidate is a square, only 
count the square root once). This cuts down significantly on the 
runtime.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5885&amp;rd=8069" 
name="5885">VectorPolygon</a></b>
</font>
<A href="Javascript:openProblemRating(5885)"><img src="/i/rate_it.gif" 
hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505786"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      60 / 445 (13.48%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      25 / 60 (41.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Nevo</b> for 761.27 points (17 mins 4 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      526.40 (for 25 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>One of the properties of a Convex polygon is that the angle each edge 
makes with a horizontal line increases as you go around it (and decreases as 
you go around it the other way). In fact, this is the property that the 
Graham scan algorithm for finding a convex hull is based on. Knowing this, 
you can sort all of the vectors by the angle they make with the horizontal. 
Then try each subset of vectors to see if it makes a polygon. The images 
included with the problem should give one the intuition that the vectors 
will only make a polygon if the sum of the vectors is <b>0</b>. To find the 
area of the polygon you should check out the <A 
href="/tc?module=Static&d1=tutorials&d2=geometry1#polygon_area">geometry 
article</A> in the Educational Content section. Thus for each subset, if the 
sum of the vectors is <b>0</b> and the area the polygon makes is larger than 
any that you've seen then store that area as your best.</p>

<p> A way of doing this problem without using the above property makes use 
of permutations. In this method you try every possible permutation of the 
vectors. Then start with the first vector in the permutation and keep on 
adding vectors until the sum is <b>0</b>. When this happens you know you 
have a polygon, so find its area. The only drawback of this method is that 
you aren't sure that the polygon is convex. Luckily this doesn't matter, 
because if you do find a polygon then some reordering of its sides is 
guaranteed to be convex (namely when the sides are sorted by angle with the 
horizontal). Further when the sides make a convex polygon that area will be 
larger (intuitively the concave parts of the polygon take area away from 
what could be). </p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4835&amp;rd=8069" 
name="4835">RoundTable</a></b>
</font>
<A href="Javascript:openProblemRating(4835)"><img src="/i/rate_it.gif" 
hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505786"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      160 / 374 (42.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      83 / 160 (51.88%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      <b>Petr</b> for 467.77 points (7 mins 33 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      265.95 (for 83 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>This problem, like many other combinatorial problems, can be solved with 
Dynamic Programming. The difficult part is coming up with the right 
formulation of what the sub-problem is, a way to describe the state space. 
To find what the state space should be more analysis of the problem is 
necessary.</p>
<p>The problem would be quite a bit easier if the table wasn't round. While 
we can't flatten the table we can make an observation which is just as good. 
Think of some distinguished member of company A (the CEO for instance). The 
CEO of company A has to sit in some chair, so lets label that chair 0 and 
then label the chair to it's right 1, the next one 2, and so on. Now the 
problem is how to seat the remaining people in the linear sequence of 
chairs1, 2... <b>chairs</b>-1. The only restrictions are you can't put a 
member of company B into the first or last <b>minDistance</b>-1 chairs, 
because the CEO of A is in chair 0. Also, once we get the result we must 
multiply it by <b>chairs</b> since any rotation of this solution is a 
distinct valid solution.</p>

<p>What else is part of our state space? We need to know which chair we want 
to try to place the next person at, call it <i>currentChair</i>. Since we 
can only place a member of company A if we know she is far enough away from 
the closest current member of company B, we also have to keep track of the 
<i>previousBrep</i> (which can have a special value indicating no B has been 
placed yet). Likewise we need to keep track of <i>previousArep</i>. Finally 
we need to know how many representatives of company A remain, 
<i>remainingAreps</i>, and similarly <i>remainingBreps</i>.</p>
<p>Thus the entire state space is described by the quintuple 
(currentChair,previousArep,previousBrep,remainingAreps,remainingBreps). 
Since the first three variables can take values from 0 to 50 and the last 
two can take values from 0 to 5, there are a total of 51<sup>3</sup> * 
6<sup>2</sup> states, which is about 5 million. If only a constant amount of 
work is done for the recurrence, then this solution will be fast enough.</p>

<p>In each state, there are only three things that can be done: 1) place a 
member of company A into <i>currentChair</i>, 2) place a member of company B 
into <i>currentChair</i>, or 3) leave <i>currentChair </i> empty. In the 
first case, you must make sure that a representative from company A can 
indeed be placed. This means that <i>currentChair</i> must be at least 
<b>minDistance</b> away from <i>previousBrep</i> and there must be at least 
1 <i>remainingAreps</i>. If these conditions are met, then add to the number 
of solutions of the current state the number of solutions to the state where 
you place a representative of A into <i>CurrentChair</i> times the number of 
representatives of A that remain, since you can put any of them into the 
seat. The second case is similar to the first case, but check if you can 
place someone from company B. Also remember you can't place a member of B 
into the last <b>minDistance</b>-1 chairs. The last case is the simplest 
because no checks need to be made.</p>

<p>The base case of the dynamic programming is when you get to the last 
chair. If all of the representatives have been placed then this is a unique 
valid solution so its value is 1, otherwise it is not a solution so its 
value is 0. So each state can be evaluated in constant time and this method 
will work.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5883&amp;rd=8069" 
name="5883">ManhattanDistance</a></b>
</font>
<A href="Javascript:openProblemRating(5883)"><img src="/i/rate_it.gif" 
hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505786"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      40 / 374 (10.70%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      19 / 40 (47.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 761.32 points (17 mins 4 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      573.66 (for 19 correct submissions)
    </td>
  </tr>

</table></blockquote>
<p>One of the first lessons in Euclidean geometry is that the shortest path 
between any two points is a straight line. If that were true in Manhattan 
then this would be a truely simple problem, but unfortunately buildings get 
in the way. So the only reason you would avoid a straight line path is if 
the path intersects some building. In such a case you have to "go around" 
the building, but you want to stay as close to the straight line path as 
possible. This means that you'll actually travel to one of the corners of 
the building (and you'll want to take a straight line path to the corner). 
So any path from the start to the target will involve a sequence of linear 
segments with the endpoints on either the starting point, the target point, 
or a corner to one of the buildings. This limits the amount of possible 
paths substantially.</p>
<p>With only 26 avenues and 50 streets, there are at most 1,300 buildings, 
so 5,200 corners. So a graph can be constructed with 5,202 nodes with an 
edge between two nodes if the straight line between the two points does not 
intersect a building. Once this graph is constructed a shortest path 
algorithm, such as Dijsktra's, can be used to find the length of the 
shortest path.</p>
<p>The construction of this graph is made even easier if you note that the 
corner of each building can only "see" the corners of buildings along the 
same avenue or street. This is because of that strange constraint that 
<b>width</b> will be no greater than half of <b>distance</b>.</p>
<p>One thing to notice which could improve your implementation is that from 
the regularity of the buildings in the city, one should always make each 
move to a corner which is closer to the target in straight line distance. 
Using this you can use dynamic programming where the state is which corner 
you are at and you populate the table starting with the closest points to 
the start.</p>

      <img src="/i/m/Ryan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="284007" context="algorithm"/><br />
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
