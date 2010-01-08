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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10780">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516062" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 365</span><br />Wednesday, September 12, 2007
<br /><br />



<h2>Match summary</h2> 

<p>
In Division 1 the coders were faced with tricky problems, all of which required careful implementation and 
creative thinking rather than fast coding of well-known algorithms. A harder than usual easy held up even some
 high-rated contestants for  longer than usual, while rather simple example tests for the hard allowed a vast 
amount of seemingly correct submissions. The medium had to be approached with caution in order to avoid overflow of 64-bit integers.
In the challenge phase the hunt for incorrect greedy approaches for the 1000-pointer (or uncovered corner cases
in the easy and medium) was fierce and many coders managed to earn a fair amount of additional points. When the dust
settled after the system tests, <tc-webtag:handle coderId="22664154" context="algorithm"/> was on the top thanks to 5 
successful challenges, with <tc-webtag:handle coderId="7442498" context="algorithm"/> close behind and 
<tc-webtag:handle coderId="15805598" context="algorithm"/> rounding out the top 3.</p>

<p>Division 2 was marked with a straightforward 250-pointer, an unusual 600-pointer and rather standard though 
clean implementation requiring 1000-pointer. Newcomer <tc-webtag:handle coderId="10113097" context="algorithm"/> won the 
round and <tc-webtag:handle coderId="22671209" context="algorithm"/> and <tc-webtag:handle coderId="22691946" context="algorithm"/> 
finished second and third respectively.
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<strong><a href="/stat?c=problem_statement&amp;pm=7600&amp;rd=10780" name="7600">TournamentsAmbiguityNumber</a></strong>
</font>
<A href="Javascript:openProblemRating(7600)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516062" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      558 / 704 (79.26%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      522 / 558 (93.55%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>abdo88</strong> for 247.89 points (2 mins 37 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      197.01 (for 522 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The problem is completely straightforward: as the constraints allow O(n<sup>3</sup>) solution, one should
iterate through all triples of players (a, b, c) and check if a defeated b, b defeated c, and c defeated a.
If so, increment the cumulative answer and proceed. Java code implementing this approach follows:</p>

<pre>
int ans = 0;
int n = table.length;
for(int i = 0; i < n; i++)
   for(int j = 0; j < n; j++)
      for(int k = 0; k < n; k++)
         if(table[i].charAt(j) == '1' && table[j].charAt(k) == '1' 
        && table[k].charAt(i) == '1') ans++;
return ans;
</pre>
</p>

<font size="+2">
<strong><a href="/stat?c=problem_statement&amp;pm=7787&amp;rd=10780" name="7787">PointsOnCircle</a></strong>
</font>
<A href="Javascript:openProblemRating(7787)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516062" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      128 / 704 (18.18%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      23 / 128 (17.97%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>stef2n</strong> for 463.78 points (16 mins 26 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      314.30 (for 23 correct submissions) 
    </td>
  </tr>
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      300 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      329 / 621 (52.98%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      184 / 329 (55.93%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>PaulJefferys</strong> for 284.81 points (6 mins 37 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      189.26 (for 184 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
As everybody knows from high school geometry the locus of points (x, y) lying on the circle with radius r centered
at the origin is given by x<sup>2</sup> + y<sup>2</sup> = r<sup>2</sup>. Finding the number of lattice points
lying on this circle means finding the number of integer solutions to the above equation. As noted in the
problem statement this number is given by 4*(d<sub>1</sub>(r<sup>2</sup>) - d<sub>3</sub>(r<sup>2</sup>)). There are
many correct approaches you could take at this point and I will explain one of them.</p>

<p>If we find the number of divisors of r<sup>2</sup> that leave remainder 1 upon division by 4, and the number
of divisors of r<sup>2</sup> that leave remainder 3 upon division by 4 we are done. Since r is too big we can
not use the trivial O(r) algorithm to find all the divisors of r<sup>2</sup>. However, the maximal number of
divisors is not huge and we can still analyze all of them. One of the ways to accomplish this is the following:
<ol>
<li>Note that we don't care about even divisors so divide r by 2 while r is even.</li>
<li>Find all the divisors of r using standard O(r<sup>1/2</sup>) algorithm and store them in an array <strong>v</strong>.</li>
<li>Note that a divisor of r<sup>2</sup> has a form a*b where both a and b are the divisors of r.</li>
<li>Motivated by the third step, iterate through all pairs of elements of <strong>v</strong> (a, b) and check if we already
encountered a divisor a*b (we store all previously encountered divisors in a set <strong>lookup</strong>). If not, check
its remainder upon division by 4, increment respective counter (either for remainder 1, or remainder 3), and
insert this divisor in <strong>lookup</strong>.
</ol>
Knowing the number of both types of divisors we return the desired answer immediately.</p>

<p>For details of implementation of the aforementioned solution consult
<tc-webtag:handle coderId="309453" context="algorithm"/> <a
href="/stat?c=problem_solution&rm=266204&rd=10780&pm=7787&cr=309453">code</a>.
</p>

<font size="+2">
<strong><a href="/stat?c=problem_statement&amp;pm=7575&amp;rd=10780" name="7575">HittingPerfectTarget</a></strong>
</font>
<A href="Javascript:openProblemRating(7575)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516062" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      28 / 704 (3.98%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      16 / 28 (57.14%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>bigheadghost</strong> for 788.02 points (15 mins 38 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      562.43 (for 16 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The problem was not hard but, as is usual with geometry, one had to be very careful to cover all the
corner cases. The solution goes in following steps:
<ol>
<li>As the vertices are given in any order it would be comfortable to have them in, say, counter-clockwise order.
So apply to both given polygons steps 2 and 3.</li>
<li>Sort the vertices in the order of increasing value of x-coordinate (in case of
ties in the order of increasing value of y-coordinate).</li>
<li>Fix the first vertex and sort the remaining vertices in the order of increasing value of angle (measured
clockwise in this case, but this is not really important) between the ray
(<strong>x[0]</strong>, <strong>y[0]</strong>) ---> (<strong>x[i]</strong>, <strong>y[i]</strong>) and the vertical down pointing ray with origin in 
(<strong>x[0]</strong>, <strong>y[0]</strong>). We thus obtain an array of vertices in which two consecutive vertices are connected
by an edge of our polygon and vertices are sorted in counter-clockwise order.</li>
<li>Iterate through all pairs of points (x, y) lying in the big square to check if in hitting this particular
point one makes a lucky shot. To check this one has to check if the point lies both within the first and the
second convex polygon. To check this for both polygons apply steps 5-6.</li>
<li>Check if a point (<strong>x</strong>, <strong>y</strong>) lies on the boundary of a polygon (or coincides with a vertex). To 
do this iterate through all edges and check if (<strong>x</strong>, <strong>y</strong>) lies on a current edge. </li>
<li>Consider a horizontal ray originating in (<strong>x</strong>, <strong>y</strong>) and going rightwards. Count how many times
this ray intersects the boundary of the polygon. To do this once again iterate through all the edges and check if the ray
intersects current edge. If the ray goes through a vertex of the polygon this intersection should be counted
once if the preceding and succeeding vertices are on different sides of the ray, and twice otherwise.</li>
<li>The point (<strong>x</strong>, <strong>y</strong>) lies inside the polygon if the ray intersects the boundary of the polygon
an odd number of times, and outside otherwise.</li>
<li>Knowing the total number of points that you can hit to make a lucky shot <strong>n</strong> return <strong>n</strong>/(201*201) 
(note that 201*201 is the total number of lattice points within the big square).</li> 
</ol>
For more detailed instructions on the basic geometric computations used in this solution check out 
the <a
href="/tc?module=Static&d1=tutorials&d2=geometry1">geometry tutorial</a>. 
</p>

<p>Note than it this problem our polygons are convex so to check if a point is inside one you can check if the point
lies in some sense on the same side of all the sides of the polygon. This can be implemented exploiting the
properties of the cross-product. See <tc-webtag:handle coderId="10113097" context="algorithm"/>'s <a
href="/stat?c=problem_solution&rm=266258&rd=10780&pm=7575&cr=10113097">solution</a> for
further inspection.
</p>

<font size="+2">
<strong><a href="/stat?c=problem_statement&amp;pm=7856&amp;rd=10780" name="7856">ArithmeticProgressions</a></strong>
</font>
<A href="Javascript:openProblemRating(7856)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516062" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      228 / 621 (36.71%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      108 / 228 (47.37%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>andrewzta</strong> for 430.78 points (11 mins 47 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      300.58 (for 108 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
We will prove the following lemma:</p>
<p><em>There exists a proper arithmetic progression having maximal possible aptitude and containing no more than 4
elements of <strong>numbers</strong>.</em></p>
<p>Indeed, from all possible <em>proper</em> arithmetic progressions that have maximal aptitude take the one that
has least elements from <strong>numbers</strong>. Note that this progression is comprised of two subprogressions ("odd and 
even") both having the same difference 2*d (d is the difference of the original progression). Denote the number
of elements of <strong>numbers</strong> in these subprogressions by <em>a<sub>1</sub></em> and <em>a<sub>2</sub></em>, and 
the total number of elements (number of elements of subprogressions that lie in range [m = min(numbers[i]); M = 
max(numbers[i])]) by <em>b<sub>1</sub></em> and <em>b<sub>2</sub></em>, respectively. Then the aptitude of our 
proper arithmetic progression is <em>(a<sub>1</sub> + a<sub>2</sub>)/(b<sub>1</sub> + b<sub>2</sub>)</em>. Suppose,
for the sake of contradiction, that our arithmetic progression contains at least 5 elements of <strong>numbers</strong>, i.e.,
<em>a<sub>1</sub> + a<sub>2</sub></em> is at least 5. Then one of the subprogressions contains at least 3 elements
and hence is proper. Without loss of generality say <em>a<sub>1</sub> >= a<sub>2</sub></em>, so that <em>a<sub>1</sub> 
 >= 3</em>. Note that <em>b<sub>1</sub></em> and <em>b<sub>2</sub></em> differ by at most 1 by construction of 
subprogressions. If they were equal then the aptitude of the progression would be the arithmetic mean of the aptitudes
of the subprogressions and hence the first subprogression (having at least as many elements of <strong>numbers</strong>
as the second one) would be proper, have the same aptitude as the original progression (because its aptitude
was maximal possible) and have less elements from <strong>numbers</strong>. So we would obtain a contradiction to the choice of the original
progression. The case when <em>b<sub>1</sub></em> and <em>b<sub>2</sub></em> differ by 1 is left to the reader to convince
oneself that still the first subprogression has aptitude at least that of the original progression and less
elements from <strong>numbers</strong> than the original progression.</p>

<p>Having established the aforementioned lemma we proceed by iterating through all triples of elements of
<strong>numbers</strong> and for each triple a < b < c finding g = gcd(c - b, b - a), the difference of the minimal
arithmetic progression containing a, b and c. Knowing a, b, c and g we may check how many elements of this progression
lie in range [m; M] in constant time. Knowing this number N we check if 3/N is a better aptitude than currently
stored one. If so, we update the stored maximal aptitude. Afterwards we iterate through all 4-tuples 
a < b < c < d and analogously check if 4/N is better than currently stored aptitude. We may precompute and store
the values of gcd in an array to save time. Note that, at any point of the solution, the numerator of the fraction
representing the maximal aptitude does not exceed 4 and thus we would not overflow using 64-bit integers and
cross-multiplication for comparison.</p>

<p>Java code implementing the above described approach follows.</p>
<pre>
//numbers is a sorted array of given numbers
//gcd is a fuction for the greatest common divisor of two longs
long[][][] G = new long[n][n][n];
for(int i = 0; i < n; i++) 
   for(int j = i + 1; j < n; j++) 
      for(int k = j + 1; k < n; k++) 
         G[i][j][k] = gcd(numbers[k] - numbers[j], numbers[j] - numbers[i]);
long[] best = new long[2];
best[0] = 0;
best[1] = 1;
long m = numbers[0], M = numbers[n-1];
for(int i = 0; i < n; i++)
   for(int j = i+1; j < n; j++)
      for(int k = j + 1; k < n; k++) {
         long g = G[i][j][k];
         long a1 = (numbers[k] - m)/g;
         long a2 = (M - numbers[k])/g;
         long A = a1 + a2 + 1;
         long v = 3;
         if(A%3==0) {
            A /= 3;
            v = 1;
         }
         if(best[1] * v > best[0] * A) {
            best[0] = v;
            best[1] = A;
         }
      }
for(int i = 0; i < n - 3; i++) 
   for(int j = i + 1; j < n - 2; j++) 
      for(int k = j + 1; k < n - 1; k++) 
         for(int r = k + 1; r < n; r++) {
            long g1 = G[i][j][k];
            long g = gcd(g1, numbers[r] - numbers[k]);
            long a1 = (numbers[r] - m)/g;
            long a2 = (M - numbers[r])/g;
            long A = a1 + a2 + 1;
            long v = 4;
            if(A%2==0) {
               v/=2;
               A/=2;
            }
            if(A%2==0) {
               v/=2;
               A/=2;
            }
            if(best[1] * v > best[0] * A) {
               best[0] = v;
               best[1] = A;
            }
        }
String[] B = new String[2];
B[0] = String.valueOf(best[0]);
B[1] = String.valueOf(best[1]);
return B;
</pre>
</p>

<font size="+2">
<strong><a href="/stat?c=problem_statement&amp;pm=7860&amp;rd=10780" name="7860">RelabelingOfGraph</a></strong>
</font>
<A href="Javascript:openProblemRating(7860)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516062" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      295 / 621 (47.50%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      41 / 295 (13.90%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Krzysan</strong> for 962.05 points (5 mins 41 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      666.61 (for 41 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
First, apply the <a
href="http://en.wikipedia.org/wiki/Floyd-Warshall_algorithm">Floyd-Warshall</a> algorithm to our graph to find
shortest paths between pairs of vertices. If in the resulting graph there are edges from some vertex to itself
then in the original graph there was a cycle -- in this case, we clearly cannot assign a new label in the desired
fashion. Otherwise our original graph is a topologicaly ordered set and the relabeling is feasible. We will not
be interested in numerical values of computed paths between pairs of vertices but will want to know whether 
in the resulting graph there is an edge (i, j), i.e., whether i <<sub>T</sub> j (henceforth notation
i <<sub>T</sub> j will mean that i and j are comparable and i is less than j, i.e., in our original graph there  
is a path from i to j). Bearing this in mind Floyd-Warshall may be adjusted accordingly.</p>

<p>To obtain the minimal relabeling we will act according to the following algorithm:
<ol><li>Analyse vertices <strong>v</strong> of our graph one by one in the order of increasing label in the original
graph and for each vertex that has not yet been processed apply the following steps.</li>
<li>For a vertex <strong>v</strong> count for how many vertices we have i <<sub>T</sub> <strong>v</strong>. Call this number <strong>m</strong></li>
<li>Assign to <strong>v</strong> <strong>m</strong>-th (0-based indexing) yet not used label <strong>L(v)</strong>.</li>
<li>Iterate through all the vertices i <<sub>T</sub> <strong>v</strong> in the order of increasing label in the original
graph and if some vertex i has not yet been processed process it right now (i.e., apply to it steps 2-4).
</ol>
Following this algorithm we would clearly result in the lexicographically first relabeling, the only remaining
problem is to show that assigning new labels in this way we would never violate our rule that for every edge
<strong>v1 ---> v2</strong> the label of <strong>v1</strong> is less or equal than the label of <strong>v2</strong>. Suppose the contrary,
and pick <strong>v</strong> the first vetex for which we violate this rule. Let A be the set of all vertices <strong>u</strong>
for which <strong>u</strong> <<sub>T</sub> <strong>v</strong>. Let B be the set of all vertices <strong>u</strong> for which 
<strong>v</strong> <<sub>T</sub> <strong>u</strong>. Let C be the set of all the other vertices. By our assumption assigning to
<strong>v</strong> <strong>m</strong>-th yet available value we violate our restriction. Note that this is not the case with the
vertices from C, since clearly there are neither incoming, nor outgoing edges connecting <strong>v</strong> with vertices
from C. Suppose our condition failed for an edge <strong>a ---> v</strong> for <strong>a</strong> in A. But this means that <strong>a</strong>
has already an assigned value <strong>L(a)</strong> > <strong>L(v)</strong>. But at the time when <strong>L(a)</strong> was
to be decided it equaled <strong>m<sub>a</sub></strong>-th yet available label. <strong>m<sub>a</sub></strong> was the number of
vertices i <<sub>T</sub> <strong>a</strong>, and clearly all those vertices were counted in when counting <strong>m</strong> (because
of definition of A and obvious transitivity of the relation <<sub>T</sub>). So <strong>m<sub>a</sub></strong> < <strong>m</strong> 
(strictly less because we have to count in at least one additional vertex, namely <strong>a</strong>, when counting <strong>m
</strong>). But all the labels that were available when choosing <strong>L(v)</strong> were also available when choosing 
<strong>L(a)</strong> so this combined with <strong>m<sub>a</sub></strong> < <strong>m</strong> gives us a contradiction and we must have
<strong>L(a) < L(v)</strong>, as desired. We can not have <strong>L(v) > L(b)</strong> for <strong>b</strong> in B and this follows from the 
order in which we process the vertices. This completes the proof.</p>

<p>For an implementation of a somewhat identical approach see <tc-webtag:handle coderId="22658956" context="algorithm"/>'s <a
href="/stat?c=problem_solution&rm=266231&rd=10780&pm=7860&cr=22658956">solution</a>.

<p>The problem is tricky and that is clearly reflected in statistics. A multitude of wrong greedy approaches led
to an eventful challenge phase allowing <tc-webtag:handle coderId="22680151" context="algorithm"/> and 
<tc-webtag:handle coderId="10157606" context="algorithm"/> to write themselves in the most successful challengers in a single
 SRM 
<a
href="/stat?c=successful_challenges">statistics</a>.
</p>

<br /><br />



<div class="authorPhoto">
    <img src="/i/m/Xixas_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="22629218" context="algorithm"/><br />
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
