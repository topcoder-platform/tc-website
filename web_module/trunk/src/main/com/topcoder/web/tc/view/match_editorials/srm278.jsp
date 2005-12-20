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
<tc-webtag:forumLink forumID="505792" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 278</span><br>Monday, December 19, 2005
<br><br>

<span class="bigTitle">Match summary</span>
<p> 
Recent <a href="/tc?module=Static&d1=tutorials&d2=maxFlow">Maximum Flow Tutorial</a>
 was followed by a bipartite matching Division 1 - Level 3 problem. Other two were much easier, so 6 coders were able to hit 1500+ points mark.
In a tough race, 2 challenges helped krijgertje to win the SRM and appear in the top-3 for the 4-th SRM in a row. 
tmyklebu, Petr and happyyellow followed all within 1 challenge, with misof being another 100 points behind.
</p>
<p>
The race was even closer in Division 2. Newcomer kia was only 4 points ahead of fellow first-timer b285714. 
LiuYuChen was another candidate for the Division title, but his unsuccessful challenge wasted two successful ones.
LiuYuChen landed at the third place, only 6 points from the winner. Another newcomer RoBa and fifka were at distant 4-th and 5-th places respectively.
</p>
 

<H1> 
The Problems 
</H1>
</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5899&amp;rd=8075" name="5899">RectangleGroups</a></b> 
</font> 
<A href="Javascript:openProblemRating(5899)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505792" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
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
      277 / 326 (84.97%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      244 / 277 (88.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>answer-42</b> for 295.12 points (3 mins 39 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      219.15 (for 244 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
Given a Hight of rectangles split into groups, find the group with the biggest total area. 
The most difficult part here is to calculate the value for each of the groups.
One must use map structure in a general case, but much simpler approach works. 
Group name is limited to one letter in the problem, therefore an array of 26 elements can store values for all possible group names.
Java code follows:
<pre>
String maximalIndexed(String[] rectangles) {
    int[] memo = new int[26];
    for (int i = 0; i < rectangles.length; i++) {
        String[] data = rectangles[i].split(" ");
        memo[data[0].charAt(0) - 'A'] += Integer.parseInt(data[1]) * Integer.parseInt(data[2]);
    }
    int bestValue = 0;
    for (int i = 1; i < 26; i++) if (memo[i] > memo[bestValue]) bestValue = i;
    return (char)('A' + bestValue) + " " + memo[bestValue];
}

</pre>
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5923&amp;rd=8075" name="5923">BestTriangulation</a></b> 
</font> 
<A href="Javascript:openProblemRating(5923)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505792" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      152 / 325 (46.77%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      134 / 152 (88.16%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Zexee</b> for 479.37 points (5 mins 56 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      336.63 (for 134 correct submissions) 
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
      282 / 296 (95.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      274 / 282 (97.16%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>krijgertje</b> for 247.88 points (2 mins 38 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      210.37 (for 274 correct submissions) 
    </td> 
  </tr> 
</table></blockquote>
<p>
Given a polygon, we reduce it to a triangle cutting vertices one by one in any order. 
You are to return the maximal possible area of the final triangle.
</p>
<p>
The first thing to realize here is that the polygon can be reduced to any triangle built on the polygon's vertices.
Once we see this, the problem becomes an easy brute force excercise. 
We iterate over all possible triples of vertices, storing the maximal area for all triangles. 
The area of a triangle can be calculated using <a href="http://en.wikipedia.org/wiki/Heron%27s_formula">Heron's formula</a>
or the <a href="http://en.wikipedia.org/wiki/Cross_product">cross product</a> of vectors.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5922&amp;rd=8075" name="5922">IntegerSequence</a></b> 
</font> 

<A href="Javascript:openProblemRating(5922)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505792" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      88 / 326 (26.99%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      41 / 88 (46.59%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kia</b> for 962.30 points (5 mins 40 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      657.92 (for 41 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
Given a sequence of numbers, we are to throw out the minimal number of elements to make the sequence satisfy the condition from the problem statement. 
Throwing out the minimal number of elements is equivalent to leaving the maximal number of elements, which 
clearly reminds us of the longest increasing subsequence (LIS) problem.
LIS problem can be solved using Dynamic Programming 
(see 
<a href="/tc?module=Static&d1=tutorials&d2=dynProg">Dynamic Programming Tutorial</a>, 
<b>Books</b> from <a href="/tc?module=Static&d1=match_editorials&d2=srm175">SRM 175</a> as an example of a LIS problem). 
</p>
<p>
In the problem we are asked to find the longest subsequence of the form 
{A<sub>0</sub>, A<sub>1</sub>, ..., M, B<sub>0</sub>, A<sub>1</sub>, ...}, A<sub>0</sub> < A<sub>1</sub> < M > B<sub>0</sub> > B<sub>1</sub>.
We can easily prove that subsequence {A<sub>0</sub>, A<sub>1</sub>, ..., M} is the LIS <i>ending</i> on element M. 
Similarly, {M, B<sub>0</sub>, A<sub>1</sub>, ...} is the longest decrementing subsequence (LDS) <i>starting</i> from element M.
Therefore, we can solve the problem in the following 3 steps:

<li> For each element, find the LIS ending on this element and save it to lis[i].</li>
<li> For each element, find the LDS starting from this element and save it to lds[i].</li>
<li> Find the maximum of (lds[i] + lis[i]) for all i.</li>

The only other thing to mention is that element M will be counted twice (both in increasing and decreasing sequences), therefore we must subtract 1 from the final sequence length.
</p>
<p>
Java code follows:
<pre>
public int maxSubsequence(int[] numbers) {
    int[] lis = new int[numbers.length]; 
    int[] lds = new int[numbers.length];
    for (int i = 0; i < numbers.length; i++) 
        for (int j = 0; j < i; j++) 
            if (numbers[j] < numbers[i]) 
                lis[i] = Math.max(lis[j] + 1, lis[i]); 
    for (int i = numbers.length - 1; i >= 0; i --) 
        for (int j = numbers.length - 1; j > i; j--) 
            if (numbers[j] < numbers[i]) 
                lds[i] = Math.max(lds[j] + 1, lds[i]); 
    int best = 0;
    for (int i = 0; i < numbers.length; i++) best = Math.max(best, lds[i] + lis[i]);
    return numbers.length - best - 1;
}

</pre>
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5924&amp;rd=8075" name="5924">OneMorePoint</a></b> 
</font> 
<A href="Javascript:openProblemRating(5924)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505792" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      450 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      182 / 297 (61.28%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      109 / 182 (59.89%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>happyyellow</b> for 446.00 points (2 mins 41 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      262.21 (for 109 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
This problem can be split in two parts. 
First, we need to check mutual location of a point (x<sub>p</sub>, y<sub>p</sub>) and a rectangle {x<sub>1</sub>, y<sub>1</sub>, x<sub>2</sub>, x<sub>2</sub>}. 
The point is inside the rectangle if and only if (x<sub>1</sub> < x<sub>p</sub> < x<sub>2</sub>) and (y<sub>1</sub> < y<sub>p</sub> < y<sub>2</sub>). 
Similarly, the rectangle is 

<li>above the point if (x<sub>1</sub> < x<sub>p</sub> < x<sub>2</sub>) and (y<sub>1</sub> > y<sub>p</sub>). </li>
<li>below the point if (x<sub>1</sub> < x<sub>p</sub> < x<sub>2</sub>) and (y<sub>2</sub> < y<sub>p</sub>). </li>

<li>to the left of the point if (x<sub>2</sub> < x<sub>p</sub>) and (y<sub>1</sub> < y<sub>p</sub> < y<sub>2</sub>). </li>
<li>to the right of the point if (x<sub>1</sub> > x<sub>p</sub>) and (y<sub>1</sub> < y<sub>p</sub> < y<sub>2</sub>). </li>

Having that implemented, we can proceed with the second part.
</p>
<p>
Lets create two lists of integers - X and Y. To list X we will put all x-coordinates of rectangles (either left or right edges), and to list Y
we will put all y-coordinates of rectangles (either top or bottom). 
After adding all numbers to the lists, sort them in increasing order and remove duplicates.
Now choose any indices i and j. All points (x<sub>p</sub>, y<sub>p</sub>) such that
<li>X[i] < x<sub>p</sub> < X[i + 1]</li>
<li>Y[j] < y<sub>p</sub> < Y[j + 1]</li>

simultaneously either satisfy or do not satisfy the conditions from the problem statement. Therefore, checking any one point from this area is enough to check all points in the area.
This property is the key to the problem. Populate lists X and Y, sort them and check all points of the form ((X[i] + X[i + 1]) / 2, (Y[j] + Y[j + 1]) / 2).
If one of these points satisfies all conditions, return true. If neither of the points satisfies the conditions, return false.
</p>
<p>
An implementation detail is that you can use arrays to check whether the point has a rectangle on each side. 
A fine <a href="/stat?c=problem_solution&rm=247156&rd=8075&pm=5924&cr=8357090">solution</a> by misof uses bitmasks.
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5921&amp;rd=8075" name="5921">UnitsMoving</a></b> 
</font> 
<A href="Javascript:openProblemRating(5921)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505792" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      100 / 297 (33.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      67 / 100 (67.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>happyyellow</b> for 957.67 points (6 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      716.60 (for 67 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
This problem, being geometrical at the first glance, is a mixture of classical Binary search and Maximum Bipartite Matching algorithms.

</p>
<p>
If the optimal answer for all units is T<sub>0</sub>, this means for every time T >= T<sub>0</sub> we can somehow assign destinations to units
and all units will reach correspondent destinations earlier than T. On the other hand, such an assignment does not exist for any T < T<sub>0</sub>. 
This property should clearly convince us to use binary search. Now we'll see <i>how</i> to use it.

</p>
<p>
First of all, we set times T<sub>0</sub> = 0 and T<sub>1</sub> = 1e20 -- left and right boundaries for the binary search. 
On each following step, we take T<sub>2</sub> = (T<sub>0</sub> + T<sub>1</sub>) / 2, and try to assign destinations to units such a way that all units will reach their destinations faster that T<sub>2</sub> seconds.
During each step, a destination can be assigned to a unit if and only if the unit can reach the destination faster than T<sub>2</sub> seconds. 
In other words, having T<sub>2</sub> we can build a bipartite graph with units at the left and destinations at the right. 
The i-th unit will have edges only to the destinations reachable within T<sub>2</sub> seconds.
We solve the maximum bipartite matching problem for this graph. Continue with smaller times if all units can be matched, with the bigger otherwise.
</p>
<p>
See <a href="/tc?module=Static&d1=tutorials&d2=maxFlow2">Section 2</a> of Maximum Flow Tutorial for a detailed description of Maximum Bipartite Matching problem.
</p>
 
  <img src="/i/m/Olexiy_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
  By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
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
