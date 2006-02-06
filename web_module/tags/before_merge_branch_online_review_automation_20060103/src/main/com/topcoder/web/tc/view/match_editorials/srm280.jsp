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
<tc-webtag:forumLink forumID="505794" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 280</span><br>Wednesday, December 28, 2005
<br><br>

<span class="bigTitle">Match summary</span>
<p> 
Coders in Division 1 faced a tricky medium and a difficult hard that had
only 3 correct 

submissions. The medium provided many challenge opportunities. Most
notably, gevak earned 350 

points which placed him 4th. Petr was the only coder to solve all 3,
beating his nearest 

competitor by nearly 400 points. ploh came second with the help from 4
successful challenges. 

ACRush came third and walked away with an impressive +422 rating change,
claiming he is ready to take a much higher ranking.
</p>
<p>
In Division 2 the battle for top spot centered around solving the hard.
guanyxcn finished 

first by more than 300 points. Second and third belonged to LampJinn and
amarkovits 

respectively. Have a happy New Year and see you all in 2006!
</p> 

<H1> 

The Problems 

</H1>

</p> 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=5988&amp;rd=8077" name="5988">UniqueDigits</a></b> 

</font> 

<A href="Javascript:openProblemRating(5988)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505794" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      328 / 372 (88.17%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      313 / 328 (95.43%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>FangLiu</b> for 248.61 points (2 mins 7 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      203.90 (for 313 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem asked us to find numbers that do not have any repeating
digits. We iterate 

through each number from 1 to n - 1. For each number, we use an array
seen that stores whether 

a digit has occurred in that number. Iterating through each digit, if
seen[currentDigit] is 

true then currentDigit has already occurred and so we do not count this
number. Otherwise, we 

set seen[currentDigit] to true and continue the search. If we
successfully reach the end of 

the search we update the count. Java code follows:
<pre>
public int count(int n)
{
   int count=0;
   for (int i = 1; i < n; i++)
   {
      String num=""+i;
      boolean[] seen=new boolean[10];
      boolean ok=true;
      for (int k = 0; k < num.length(); k++)
      {
         if (seen[num.charAt(k) - '0']) ok=false;
         else seen[num.charAt(k) - '0']=true;
      }
      if (ok) count++;
   }
   return count;
}
</pre>
</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=5977&amp;rd=8077" name="5977">CompletingBrackets</a></b> 

</font> 

<A href="Javascript:openProblemRating(5977)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505794" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      282 / 372 (75.81%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      167 / 282 (59.22%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>palmcron</b> for 494.15 points (3 mins 6 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      387.63 (for 167 correct submissions) 

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

      298 / 302 (98.68%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      257 / 298 (86.24%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>antimatter</b> for 248.75 points (2 mins 1 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      225.67 (for 257 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

First of all, we observe that we only need to add ‘[‘ to the beginning
and ‘]’ to the end. We 

let left and right be the number of brackets that need to be added to the 
beginning and end 

respectively. Iterating through text, if the current character is '['
then we have started a 

new [] pair, so we increment right. However, if the current character is
']' then we have 

either terminated a [] pair (so decrement right) or have met an extra ']' 
in which case we 

increment left. Now that the hard work has been done, we use two for
loops to add the required 

brackets:
<pre>
public String complete(String text)
{
   int left=0, right=0;
   for (int i = 0; i < text.length(); i++)
   {
      if (text.charAt(i)=='[') right++;
      else
         if (right>0) right--;
         else left++;
   }

   for (int i = 0; i < left; i++) text='['+text;
   for (int i = 0; i < right; i++) text+=']';
   return text;
}
</pre>
 

The constraints for this problem were low enough for a more brute-force
approach to work too. 

We can keep adding brackets one by one and terminate as soon as the
series is complete. This 

was used during competition by sql_lall.

</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=5937&amp;rd=8077" name="5937">GroupingNumbers</a></b> 

</font> 

<A href="Javascript:openProblemRating(5937)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505794" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      61 / 372 (16.40%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      18 / 61 (29.51%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>TN_PKU</b> for 926.84 points (8 mins 6 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      531.33 (for 18 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Originally this problem was intended to be harder with the number of
elements up to 50. 

However, this proved to be too difficult and so the number of elements
was reduced to 9. With 

just 9 elements we can solve this problem with brute force. The easiest
way to do this 

(although not very efficient) is to generate all the <a 

href="http://mathworld.wolfram.com/Permutation.html">permutations</a> and choose the ones with 
exactly groups number of <a 

href="http://mathworld.wolfram.com/PermutationCycle.html">cycles</a>. To count the number of 
cycles in a permutation we do the following. Starting with the first
element, iterate through 

the cycle marking each element used. If we see an element for the second
time then we have 

reached the end of the current cycle. We then find the next available
element and repeat the 

same process until all elements have been used. Meanwhile, we keep track
of the lowest and 

highest averages, which are used to update the best difference. Here is
the code:
<pre>
public double minRange(int[] numbers, int groups)
{
   double best=Integer.MAX_VALUE;
   int[] a=new int[numbers.length];
   for (int i = 0; i < a.length; i++) a[i]=i;

   do
   {
      int cycles=0, n=0, cur=0, total=0;
      double min=Integer.MAX_VALUE, max=-1;
      boolean[] used=new boolean[a.length];
      while(true)
      {
         used[cur]=true;
         total+=numbers[cur];
         cur=a[cur];
         n++;
         if (used[cur])  //end of cycle
         {
            min=Math.min(min,total*1.0/n);  
            max=Math.max(max,total*1.0/n);
            cycles++;
            if (cycles > groups) break;
   
            n=0;
            total=0;
            //find start of next cycle
            for (cur = 0; cur < a.length && used[cur]; cur++);
            if (cur==a.length) break;   //all elements used
         }
      }
      if (cycles==groups) best=Math.min(best,max-min);
   }
   while(nextPermutation(a));

   return best;
}

</pre>

My intuition tells me that this problem is also solvable in its original
format, so please 

post your solutions in the forum.
 

</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=5936&amp;rd=8077" name="5936">GridCut</a></b> 

</font> 

<A href="Javascript:openProblemRating(5936)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505794" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      271 / 302 (89.74%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      93 / 271 (34.32%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>tmyklebu</b> for 484.42 points (5 mins 7 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      316.13 (for 93 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This problem was not too hard, but rather tricky. There are two things we 
can do to minimize 

the length of the cut: use edges as much as possible and cut out
rectangles, since they have 

the smallest perimeter for a given area. The final shape will always be
either a rectangle or 

a rectangle with an extra (incomplete) row of cells. We align the base of 
our rectangle with 

one of the edges, say the horizontal. We can then calculate its height
and hence its cut 

length. To find the best solution we iterate through all the possible bases w. 
</p>
<p>
This is not necessary though, because the problem can be solved in constant time 
(assuming we can find the square root of a number in a constant time).
To show the solution, lets consider 2 different cases.
</p>
<div align="center">
<img src="/i/srm/srm280_1.png" alt="" border="0" />
</div>
<p>
<li>First, the rectangle can be cut from a side to the opposite side (see the left rectangle on the figure). 
In this case, the answer is at least W, because we need to make W horisontal cuts.
The minimal number of vertical cuts depends on whether N is divisible by W.
If N is divisible by W, we don't need vertical cuts at all (see the red line, cutting 10 cells).
If N is not divisible by W, we need exactly 1 vertical cut (see the green line, cutting 18 cells).</li>
<li>
Second, the rectangle can be cut from a side to an adjacent side (see the right rectangle on the figure).
In this case, the order of the cuts isn't significant - we can make right or down cuts in any order.
The total number of cuts will be equal to the sum of sides of the enclosing rectangle (3 + 3 for the red line and 4 + 5 for the green).
Lets a and b to represent these sides. We are to optimize the sum (a + b) under a * b >= N constraint (meaning that we can fit N cells into a * b rectangle).
It can be proved that at the optimal cut the difference between a and b will never exceed 1. 
Let s be equal to the square root of N, rounded down. If N is a perfect square, the optimal answer will be a = b = s. 
If N <= s * (s + 1), the answer will be a = s, b = s + 1. If N is greater than s * (s + 1), the answer will be a = b = s + 1.
</li>
To solve the problem, we need to check both cases and return the minimal among them.
</p>
<p>
There were two major causes for failure. Some solutions failed because
they did not try to align the base with the vertical edge. 
Others failed to notice that cutting out n cells is equivalent to cutting out (width*height–n) cells.
It turns out that a very similar problem was used in 2003 TCCC International Round. 
Interestingly, the success rate for that problem was only 6%.
</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=4846&amp;rd=8077" name="4846">DrawPlanar</a></b> 

</font> 

<A href="Javascript:openProblemRating(4846)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505794" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1100 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      16 / 302 (5.30%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      3 / 16 (18.75%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 482.80 points (47 mins 40 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      473.92 (for 3 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


<p>This problem was written by <b>lbackstrom</b>.</p>
<p>
Despite being one of the most difficult problems during the last few months, DrawPlanar didn’t require any complicated algorithm. A brute-force with pruning mixed up with basic geometrical formulas was enough to solve this problem. On the other hand, coders needed to put some effort to make their solutions run in time.
</p>
<p>
The basic algorithm for this problem is relatively simple. 
Taking into account the maximal area can’t be more than 15, we are able to check all possible return values. 
For each such value, we try to fit the graph into each of the rectangles with area equal to the value. 
We return this area if succeeded, or continue to the (value + 1) otherwise. 
To check whether the graph fits in a given rectangle, we iterate through all vertices of the graph, trying to put each of them to every non-occupied cell. 
At every step, we check whether the new vertex will force graph edges to intersect 
(obviously, we need to check only the edges incident with this vertex vs all the edges we put earlier). 
Depending on whether at least some edges intersect, we either continue to the next vertex or try another position for the current one. 
Pseudo-code follows: 
<pre>
  int minArea(String[] graph) {
  .....
(0)    do some preprocessing here
(1)    int area = 0
(2)    Check if the graph can be arranged in a line
(3)    area = 1
(4)    while (true) {
(5)        for (int i = 1; i * i <= area; i++)
(6)            if (area % i == 0 && fits(i, area / i, 0)) 
(7)                return area;
(8)        area++;
    }
}

   boolean fits(int W, int H, int vertex) {
(1)    if (vertex == graph size) return true;
(2)    for (int i = 0; i <= W; i++) 
(3)        for (int j = 0; j <= H; j++) 
(4)           if (!occupied[i][j] && neither edges intersect) 
(5)                return fits(W, H, vertex + 1);
(6)    return false;
}

</pre>
</p>
<p>
Though such rough approach will be timing out on some input graphs, there are a lot of possibilities to optimize it. Some of them are listed below:
<li>A valid graph drawing mirrored around X or Y axis will stay valid. 
Taking this property into account, the algorithm can become 4 times faster by putting the first vertex at the lower-left (or upper-right) quarter of the rectangle 
(modify lines (2) and (3) of fits() method).</li>
<li>If a rectangle is too small to fit the graph, we want to interrupt brute force as early as possible. 
Using vertices with the highest cardinality will cut as many search branches as possible at early stages. 
To implement this, sort vertices of the graph by cardinality before running the search (line (0) of minArea() method).</li>
<li>It can easily be proved that if a graph with 7 or less vertices can not be drawn inside a 1 * 3 rectangle, it can not be drawn inside a 1 * K rectangle for any K. 
Therefore, for each area > 3 you can start checking its divisors from 2 (modify line (5) of minArea() method).</li>
<li>Knowing the biggest possible area for all input cases, we can speed up the process using binary search.</li>
<li>You can precompute intersections for all possible edges.
See <b>KOTEHOK</b>'s <a href="/stat?c=problem_solution&rm=247261&rd=8077&pm=4846&cr=15805598">solution</a> as an example.</li>

Having all these optimization applied, the algorithm will easily run within 0.5 secs for all test cases. 
</p>
<p>
Formulas and algorithms for line intersection can be found in <a href="/tc?module=Static&d1=tutorials&d2=geometry2"> Geometry Concepts Tutorial</a> by <b>lbackstrom</b>.
More info about planar graphs can be found <a href="http://en.wikipedia.org/wiki/Planar_graphs">here</a>.
</p>

 
  <img src="/i/m/dimkadimon_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
  By&#160;<tc-webtag:handle coderId="276230" context="algorithm"/><br />
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
