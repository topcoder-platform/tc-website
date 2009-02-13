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
<tc-webtag:forumLink forumID="505783" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 270</span><br>Thursday, November 3, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
In the 270th SRM the coders in both divisions had to face a problem set with non-standard
point values: 250-600-900 in Division 2 and 300-600-900 in Division 1. In both divisions 
their medium problem had the highest failure rate and it offered a lot of great challenge
opportunities.
</p> 

<p>
Before the challenge phase started, in Division 1 roughly 50 coders submitted all three
problems. But many of them missed hidden catches in the medium problem or their solutions 
of the hard problem failed on some boundary cases. After the eventful challenge phase 
was over and the system tests claimed their share of the submitted solutions, only four coders
were left with all three tasks solved. Out of them, bmerry claimed fourth place, andrewzta
was third and krijgertje (with the help of 7 successful challenges) was second.
</p>

<p>
In Division 1 this match had a clear winner. Petr made 5 successful challenges, had the fastest
time on the hard problem and won the match by well over 250 points. His final score 1764.09 is
the seventh highest total score ever.
</p>

<p>
In Division 2 the winner was a newcomer &ndash; elhipercubo, thanks to a solid time on all three
problems, followed closely by gc0, motono and 11 other coders who managed to solve all three tasks.

</p> 

<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4754&amp;rd=8067" name="4754">BuyingCheap</a></b> 
</font> 
<A href="Javascript:openProblemRating(4754)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505783"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      260 / 292 (89.04%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      220 / 260 (84.62%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>elhipercubo</b> for 249.12 points (1 mins 41 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      214.48 (for 220 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem was as simple as it gets. Maybe the only thing worth noting is:
don't reinvent the wheel. If there is a library function for a problem, use it.
</p>

<p>
In this case, most programming languages include a function to remove duplicate
elements from a (sorted) list. A very nice and simple way to solve this task
in C++ is to convert the input vector into a set (it gets sorted and duplicates
are removed), back into a vector and output its third element (or -1).
</p>

<pre>
int thirdBestPrice(vector<int> prices) {
  set<int> S ( prices.begin(), prices.end() );
  vector<int> V ( S.begin(), S.end() );
  if (V.size() < 3) return -1;
  return V[2];
}

</pre>
Java code without complicated data structures follows:
<pre>
int thirdBestPrice(int[] prices) {
  Arrays.sort(prices);
  int cnt = 1;
  for (int i = 1; i < prices.length; i++) if (prices[i] != prices[i - 1] && ++cnt == 3) 
    return prices[i];
  return -1;
}
</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4745&amp;rd=8067" name="4745">TippingWaiters</a></b> 
</font> 
<A href="Javascript:openProblemRating(4745)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505783"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      184 / 292 (63.01%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      49 / 184 (26.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>fir</b> for 553.66 points (8 mins 21 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      377.27 (for 49 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The moral of the story for this task is: don't use "real" numbers if you don't have to.
</p>

<p>
The problem was solvable by brute force: For each round number between the bill and the amount
I have, calculate the tip and check whether its size is appropriate. (As an optimalization,
you may stop as soon as the tip exceeds 10% of the sum you pay).
</p>

<p>
However, there is also a solution in constant time. Let B be the value of the bill and S the sum
I pay. Then the tip is S-B. For it to be appropriate, this value must be between S/20 and S/10,
inclusive. We get two inequalities: S/20&le;S-B; S-B&le;S/10. We may rewrite these equations
to get S&ge;20B/19 and S&le;10B/9. 
</p>

<p>
In other words, sums that lead to an appropriate tip lie in the interval [20B/19, 10B/9].
The boundaries of this interval are not necessarily integers. To get integral bounds, we take the
ceiling of the lower bound and the floor of the upper bound. Now we only have to compute the number
of round sums in this interval, which is a pretty easy task.
</p>

<pre>
public static int possiblePayments(int bill, int cash) {
  // compute the smallest and largest valid sums
  int minPay = bill + (bill + 18) / 19; // this is the ceiling of the lower bound
  int maxPay = bill + bill / 9;
  if (cash < maxPay) maxPay = cash;
  
  // adjust the bounds to be round
  while (minPay % 5 != 0) minPay++;
  while (maxPay % 5 != 0) maxPay--;

  int result = 0;
  if (maxPay >= minPay) result = 1 + (maxPay - minPay) / 5;
  return result;
}
</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4658&amp;rd=8067" name="4658">CountriesRanklist</a></b> 
</font> 
<A href="Javascript:openProblemRating(4658)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505783"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
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
      45 / 292 (15.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      34 / 45 (75.56%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Nitz</b> for 601.23 points (22 mins 32 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      453.49 (for 34 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      300 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      219 / 267 (82.02%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200 / 219 (91.32%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Krzysan</b> for 265.20 points (10 mins 34 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      181.95 (for 200 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
There are not many tasks that can be shared as an easy problem in Division 1 and a hard
problem in Division 2, but the results show that this was one of them. It required some 
thinking before you started to write code, but once you saw how to solve this task, the
code becomes pretty straightforward. As a consequence, this problem had a pretty high success
rate in both divisions.
</p>

<p>
First of all, suppose that I know the exact scores for each of the countries. How to compute
the place of a given country? Simply, it's one plus the number of countries that had a higher
total score. 
</p>

<p>
Knowing this, how to compute the best possible placement for some country C? We start by finding
the worst announced coder. Let his score be S. Now the best scenario for C is that each of
its missing contestants scored S-1 points and all the other missing contestants scored zero.
This uniquely determines the score of each of the countries, hence we can compute the best possible
placement for C.
</p>

<p>
When looking for the worst possible placement the computation is reversed, i.e., contestants
from C score zero and all the others score S-1 points.
</p>

<p>
Note: The presented solution was quadratic in the number of countries. There is a linear time solution.
We leave it as an exercise for the readers.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4755&amp;rd=8067" name="4755">SalesmansDilemma</a></b> 
</font> 
<A href="Javascript:openProblemRating(4755)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505783"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      123 / 267 (46.07%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      13 / 123 (10.57%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>krijgertje</b> for 521.53 points (11 mins 22 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      421.98 (for 13 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Tricky, tricky, tricky! I don't remember seeing such a low success rate for quite a while...
The number of submissions was much higher than I expected &ndash; and as the success rate
shows, many of the coders weren't alerted by the high point value and they didn't spend 
enough time testing their solutions. 
</p>

<p>
This task offered quite a lot of different opportunities to make a mistake &ndash; and 
many of them weren't covered by examples in the problem statement. If you stopped to
think about this problem and discovered them, they could be (and in many cases they were)
converted into "killer" test cases for the challenge phase.
</p>

<p>
The first step towards a correct solution is to construct a directed graph, where the
value of each edge is its travel cost minus the profit in the destination city. 
In this graph we are interested in the shortest walk from our origin to our destination.
</p>

<p>
The simple case is when destination is not reachable. But if it is reachable, there may
be no shortest walk in the graph, because of negative cycles. This was the problematic
case we had to detect. (In the original problem statement, this was the "endless profit"
case.)
</p>

<p>
What are these negative cycles we just mentioned? If the salesman discovers a cycle
with a negative sum of edge costs, he may start going around this cycle, making an arbitrarily
large profit. Of course, the occurrence of a negative cycle somewhere in the graph
is not a sufficient condition to output "endless profit" &ndash; the cycle must be reachable
from the origin and the destination must be reachable from the cycle.
</p>

<p>
So basically the problem boils down to detecting negative cycles reachable from the origin.
If there is one such that the destination is reachable from it, we have the endless profit
case, otherwise the shortest walk from origin to destination is a path (i.e., it visits no vertex 
twice) and it can be found using some standard algorithm.
</p>

<p>
Author's solution uses the algorithm by Bellman and Ford to compute the shortest paths from
origin and detect reachable negative cycles. Then all vertices reachable from them are found 
using a simple breadth-first search. In the contest, some of the coders solved this task
using the algorithm by Floyd and Warshall. Both are standard textbook algorithms, if you 
don't know them, there are lots of online resources on this topic.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4751&amp;rd=8067" name="4751">PackingShapes</a></b> 
</font> 
<A href="Javascript:openProblemRating(4751)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505783"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br>
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
      95 / 267 (35.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      20 / 95 (21.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 829.69 points (8 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      578.73 (for 20 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem wasn't as nasty as other geometry problems, but still many of the solutions
failed due to precision problems and/or handling some boundary cases incorrectly.
</p>

<p>
The circle part is simple, its diameter (=twice the given radius) mustn't exceed either
dimension of the frame. The interesting part were the rectangles.
</p>

<p>
Basically, there were three possible approaches. The first one is iterative: Take the small
rectangle and start to rotate it in small steps. After each rotation, measure its projection
on both coordinate axes and check whether it currently fits the frame or not.
</p>

<p>
Submitting such a solution is a gamble. It may pass, if you are lucky, but it may very easily
fail. And the prepared set of test cases contained both hand-crafted and autogenerated cases
meant to cause such solutions to fail. As far as I was able to find out after the match,
most such solutions failed.
</p>

<p>
A second, far better way, was to employ binary search on the correct angle. Imagine a rectangle
lying on its longer side. If we start rotating it, its projection on the x axis will start to
shrink. What we want is to find the smallest angle such that the rectangle fits into the frame
horizontally... and check whether for this angle the rectangle fits also vertically.
</p>

<p>
Doubles are precise enough for this solution to work reliably, as long as we choose a suitable
margin for error tolerance. In the contest this was probably the best solution.
</p>

<p>
The third possibility was to compute the correct angle directly. Here we had to be 
extremely careful so that we don't overlook some special corner case.
</p>

<p>
As the author of this task, I had to make sure the outputs are correct. Thus I had to choose
a fourth possibility &ndash; do some exact computation, using integers only!
My code follows, with some explanation below.
</p>

<pre>
  // small rectangle: c*d, large rectangle: a*b 

  if (c<=a && d<=b) return "YES";
  if (c<=b && d<=a) return "YES";

  // let
  // f: y = (b-x)c / d
  // g: y = -xd/c + a
  // we want a point [x,y] lying below f,g such that x>0, y>0, x^2+y^2 = c^2

  // check whether one of the lines cuts away the whole arc
  if (a <= c && a <= d) return "NO";
  if (b <= c && b <= d) return "NO";

  // now we are interested in whether they intersect... 
  // ... and whether the intersection point lies outside the arc

  // parallel if c==d, but this case should already be handled
  long kc = b*c - a*d;
  long km = c*c - d*d;
  
  long xc = c * kc;
  long yc = a * km - d * kc;

  if (xc*xc + yc*yc < km * km * c * c) return "NO";
  return "YES";

</pre>

<p>
The idea? Either the sides of the "small" rectangle are parallel with the sides of the "large"
rectangle, or not. The first case is easy to check. For the second case, we may assume that 
both endpoints of a side with length c touch the large rectangle. Why? Consider an arbitrary
correct placement of the small rectangle inside the large rectangle. We may now move it (without
rotating it) until the endpoints of a side of our choice touch the large rectangle.
</p>

<p>
In the corner of the large rectangle we get a right triangle with the hypotenuse c. Let x and y
be the lengths of the other two sides. Using x and y we can easily compute the width and height
of the rotated "small" rectangle. None of them may exceed the corresponding dimension of the 
"large" rectangle. This leads to two linear inequalities for x and y. We compute whether they
have a solution such that x*x + y*y = c*c. If yes, the "small" rectangle can be rotated and
the answer is positive, otherwise the answer is negative.
</p>



      <img src="/i/m/misof_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
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
