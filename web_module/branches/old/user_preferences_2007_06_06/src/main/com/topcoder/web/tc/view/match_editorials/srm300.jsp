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
<tc-webtag:forumLink forumID="505866" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 300</span><br>Thursday, April 27, 2006
<br><br>

<span class="bigTitle">Match summary</span>
<p> 
The turnout for the 300th Single Round Match probably wasn't as high as some predicted,
with "only" 639 registered coders. Both divisions saw rather hard problem sets, and most
of the problems left just enough space for challenge opportunities. 
</p> 

<p>
In Division 1, tomek used this opportunity, and +175 points from the challenge phase
gave him a comfortable lead before misof and Egor.
</p>

<p>
In Division 2, only four coders were able to finish the hard problem in time, and
they took the top four spots. Also in this division the challenge phase altered
the top of the standings. Three successful challenges meant that Joshik won
today, followed by CandyShop, MartinMaas, and leiz.
</p>

<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6104&amp;rd=9821" name="6104">Taxi</a></b> 
</font> 
<A href="Javascript:openProblemRating(6104)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505866" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      207 / 301 (68.77%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      103 / 207 (49.76%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>rasto6sk</b> for 242.46 points (5 mins 2 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      173.33 (for 103 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The first thing one should realize after reading the problem statement is that the whole
allowed rectangle is large. More precisely, it is far too large for an approach that 
looks at all the grid points inside the rectangle. We have to come up with some idea.
</p>

<p>
The key observation is the following one: Suppose that [ax,ay] and [bx,by] are points with
the given taxi distance. Neither the taxi distance, nor the Euclidean distance changes
if we swap ax and bx. Thus we may assume that ax&le;ay, and similarly that bx&le;by.
Moreover, neither of the distances changes if we move both points in the same direction
by the same amount. Thus we may move the point [ax,ay] to [0,0].
</p>

<p>
We have just discovered that we only have to consider paths from [0,0] to some [x,y],
with x,y&ge;0. Note that the taxi distance from [0,0] to [x,y] is (x+y). This means that
once we know x, we may compute y as taxiDis-x.
</p>

<p>
We may now consider all allowed integer values of x, for each of them compute the corresponding
y, check whether it is allowed, and if yes, compute the distance from [0,0] to [x,y].
</p>

<b>Homework.</b>

<p>
<ul>
<li>
Why is it enough to consider integer values for x,y? The problem statement didn't say that a
path from [0,0] to [3.4,2.6] was invalid... (Did you note this during the contest?)
</li>
<li>
There is a constant-time solution that only considers a few cases. Find
it.<br>
(Hint: We want the taxi path from [0,0] to [x,y] to be as straight as
possible &ndash; the greater min(x,y) is, the shorter is the straight
line from [0,0] to [x,y]. If [0,taxiDis] or [taxiDis,0] is inside the allowed 
rectangle, this is the optimal solution. How does the optimal solution
look if the rectangle is not large enough?)
</li>
</ul>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4514&amp;rd=9821" name="4514">Dating</a></b> 
</font> 
<A href="Javascript:openProblemRating(4514)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505866" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      109 / 301 (36.21%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      35 / 109 (32.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>GAZZA</b> for 406.50 points (14 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      265.62 (for 35 correct submissions) 
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
      284 / 297 (95.62%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      149 / 284 (52.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>misof</b> for 234.85 points (7 mins 18 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      174.51 (for 149 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Clearly, the right approach here is simply to simulate the process described in the 
problem statement. 
The input is small enough, so we may use some brute force in doing the simulation.
</p>

<p>
Instead of a circle, imagine a queue, starting with the first person in the input.
As we count from 1 to k-1, we send the person from the beginning of the queue
to its end. Now, remove the person at the beginning of the queue, walk through
the queue to find the best match, and remove the match from the queue.
</p>

<p>
This process ends once we are not able to find a match, or once we run out of people.
</p>

<p>
C++ code follows.
</p>

<pre>
string dates(string circle, int k) {
  vector&lt;char&gt; V;
  for (unsigned i=0; i&lt;circle.size(); i++) V.push_back(circle[i]);

  string res;

  while (1) {
    // skip k-1 people
    for (int kk=0; kk&lt;k-1; kk++) { 
      char ch = V[0];
      V.erase(V.begin());
      V.push_back(ch);
    }
    
    // take the next one
    char current = V[0];
    V.erase(V.begin());
    
    // find the match
    char match = 127;
    for (unsigned i=0; i&lt;V.size(); i++) 
      if (islower(current) != islower(V[i])) 
        match &lt;?= V[i];
    if (match == 127) break;
    
    // delete the match
    V.erase(V.find(match));
    
    res += ' ';
    res += current;
    res += match;

    if (V.empty()) break;
  }

  if (!res.empty()) res=res.substr(1);
  return res;
}
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4431&amp;rd=9821" name="4431">CircleOrder</a></b> 
</font> 
<A href="Javascript:openProblemRating(4431)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505866" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      12 / 301 (3.99%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 12 (33.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Joshik</b> for 670.35 points (22 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      573.48 (for 4 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
It is easy to discover a necessary condition for the existence of a solution: The cars must be in
the same circular order as the respective unloading places. Sadly, this condition is not sufficient
for a solution to exist &ndash; consider the input "AcBdCaDb". 
</p>

<p>
We will show that a greedy approach works for this task. In each step, select the lexicographically
smallest car that can be moved to its final destination. Change the location of the car into a free
space, and the corresponding unloading place will become an obstacle. 
</p>

<p>
Why does this approach work? Clearly, if we find a solution, it will be the lexicographically
smallest one. The question is, if this approach fails, how can we be sure that another
approach won't work? 
</p>

<p>
Imagine a general situation that looks like this:<br>
....C.....c....<br>
where our greedy algorithm wants to move the car 'c' into the unloading place 'C'. 
We will call the places between 'C' and 'c' the inner part, and the remaining
places in the outer part.
</p>

<p>
Suppose that before this move there was a possible solution but after this move
there is none. We will show that this leads to a contradiction.
</p>

<p>
The places between 'C' and 'c' are either empty, or they contain unloading places.
This means that all cars (other than 'c') are in the outer part.
If moving 'c' to 'C' changes the existence of a solution, it means that in any
solution one of the unloading places in the inner part has to be occupied before 'c' moves. 
</p>

<p>
Pick any solution and look at the moment when 'c' moves to 'C'. 
From the above observation we get that 'c' has to move through the outer part,
as the inner part will contain at least one obstacle.
However, if at this moment it is possible to reach 'C' by moving 'c' through the
outer part, this means that all cars had to leave the outer part before. This
is only possible if all other unloading places are in the inner part,
and the initial situation looked as follows: <br>
defgCHIDEFGchi <br>
However, in such case starting by moving 'c' to 'C' <b>does</b> lead to a valid 
solution.
</p>

<p>
We have shown that if there is a valid solution and we greedily make the best
move available, there will still be a valid solution. The implementation of the 
algorithm outlined in the second paragraph is fairly straightforward.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4848&amp;rd=9821" name="4848">JumpyNum</a></b> 
</font> 
<A href="Javascript:openProblemRating(4848)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505866" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      112 / 297 (37.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      77 / 112 (68.75%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Egor</b> for 471.83 points (7 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      284.53 (for 77 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem almost calls for a dynamic programming/memoization solution. But as soon as we
start to look for one, nasty special cases will start to appear everywhere. 
So let's break the approach into simple steps to make sure nothing goes wrong.
</p>

<p>
First, we can get rid of one of the boundaries. Instead of counting jumpy numbers
in [low,high], we can count jumpy numbers in [0,high] and subtract the count of
jumpy numbers in [0,low-1].
We are left with a simpler problem: how to count jumpy numbers in [0,x]?
</p>

<p>
There are two possible approaches when building a jumpy number: either you 
add new digit to the beginning, or you add them to the end. In general,
each of these approaches can be converted to a dynamic programming algorithm,
or a recursive function that can be memoized.
</p>

<p>
We will present an algorithm that will add new digits to the beginning of a number.
Let's illustrate it on a simple example first:
</p>

<p>
All 2-digit jumpy numbers starting with the digit 3 are 30, 31, 35, 36, 37, 38, and 39.
Let X be any of these numbers. What digit can be added to the beginning of X? 
Clearly, this only depends on the first digit of X. In our case, the first digit is 3,
thus we can use the digits 0, 1, 5, 6, 7, 8, 9.
</p>

<p>
Now suppose that we only consider jumpy numbers in [0,31442], and we already decided 
that the last digit of our jumpy number is 7. Then the rest of the number has to
be a jumpy number from [0,3143], and its last digit must be "compatible".
</p>

<p>
This brings us to the idea of writing a memoized recursive function 
countJumpers(upperBound, lastDigit) that counts jumpy numbers that end in
lastDigit and are at most equal to upperBound.
For a clean implementation look at
<a
href="/stat?c=problem_solution&rm=248405&rd=9821&pm=4848&cr=144400">tomek's
solution</a>.
</p>

<p>
The nice thing about this task was that there were many different approaches.
For example 
<a
href="/stat?c=problem_solution&rm=248403&rd=9821&pm=4848&cr=8357090">misof's
solution</a> generates the numbers in the other direction (using DP instead of memoization),
Egor found that 
<a href="/stat?c=problem_solution&rm=248403&rd=9821&pm=4848&cr=14970299">his
solution</a> runs in time without the need to memoize, 
in 
<a
href="/stat?c=problem_solution&rm=248408&rd=9821&pm=4848&cr=15498334">jmzero's
solution</a> you can find pre-computed values for upper bound=k*100000, and brute force used
to count the rest, and so on.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6194&amp;rd=9821" name="6194">AllWoundUp</a></b> 
</font> 
<A href="Javascript:openProblemRating(6194)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505866" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      28 / 297 (9.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 28 (42.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Abednego</b> for 753.92 points (17 mins 28 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      592.35 (for 12 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Let's start by looking at the winding number in more detail. 
</p>

<p>
Suppose that P is a closed polyline, and X is a point not lying on P.
Place a boy into the point X, and a girl somewhere on the polyline.
Let the girl walk once around the polyline. During her walk, the boy
will rotate so that he always sees the girl directly in front of him.
</p>

<p>
After the girl finishes her walk, the boy will be looking in exactly 
the same direction as when she started. However, it is possible that 
he made more turns in one direction than in the other. E.g., if P is
a triangle with X inside, the boy will turn 360 degrees in one direction.
</p>

<p>
Let A be the total angle (in degrees) the boy turned counter-clockwise,
and let B be the angle he turned clockwise. Then the winding number can
be defined as (A-B)/360. The observation above proves that this is 
always an integer.
</p>

<p>
Given X and P, this leads us to an algorithm how to compute the winding
number corresponding to X &ndash; process segments of P, and for each
of them compute the angle the boy turned. The angle can be computed
e.g. from the <a href="http://mathworld.wolfram.com/CrossProduct.html">cross
product</a> of the boy's direction at the beginning and at the end of the 
segment.
</p>

<p>
However, winding number can be computed using integers only. 
Consider the classical algorithm (e.g., from the <a
href="/tc?module=Static&d1=tutorials&d2=geometry3">geometry
tutorial</a>) to determine whether a point lies
in a polygon. The winding number is a generalization of this 
algorithm. Note that for simple polygons P, if X is inside, its 
winding number is 1 or -1, if X is outside, the winding number is 0.
(Use the "boy and girl" example to visualize this. If the boy is inside,
the girl walks once around him.)
</p>

<p>
In fact, the winding number is exactly a way how "inside" can be defined for
closed polylines. The interesting thing is that the "intersections of a ray
and a polygon" approach can be modified to compute the winding number.
The only change is that we have to look whether we cross the ray going
"downwards" or "upwards"
A very thorough and readable explanation, including an integers-only implementation,
can be found at the 
<a
href="http://softsurfer.com/Archive/algorithm_0103/algorithm_0103.htm#Winding%20Number">SoftSurfer
Geometry Algorithms</a> page.
</p>

<p>
Now, how to plug this information into our solution? We have to find the largest 
winding number of some point on the x axis. If the polyline crosses the x axis,
it divides the x axis into several segments and two infinite rays. For points on
the rays the winding number is clearly zero. For each segment, the winding number
is the same for all its points. 
</p>

<p>
Thus we get the following algorithm:
<ul>
<li>find the intersections of the polyline P and the x axis;
<li>sort the intersections;
<li>for each segment between two neighboring intersections, compute the winding
  number for its midpoint
</ul>
</p>

<p>
If we process the segments in order, we may even reuse the information about the
ray-polyline intersections. This leads to an O(N log N) algorithm. Look at
<a
href="/stat?c=problem_solution&rm=248405&rd=9821&pm=6194&cr=144400">tomek's
solution</a> for an implementation of this approach. 
Alternately, look at <a
href="/stat?c=problem_solution&rm=248403&rd=9821&pm=6194&cr=8357090">misof's
solution</a> to see where a pre-written geometry library can get you.
</p><div class="authorPhoto">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
