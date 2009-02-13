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
<style type="text/css">
    .code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 12px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
    }

</style>
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
<tc-webtag:forumLink forumID="506107" message="Discuss this match" /></div>
<span class="bodySubtitle">2006 TopCoder Collegiate Challenge <br> Online Round 1-A</span><br>September 21, 2006
<br><br>

<h2>Match summary</h2> 

 

<p>
<tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="19849563" context="algorithm"/>
turned the first round of the TCCC into a close race. 
<tc-webtag:handle coderId="19849563" context="algorithm"/> won the coding phase with 1180 points, against <tc-webtag:handle coderId="10574855" context="algorithm"/>'s 1150, and won the challenge phase with 100 points against  <tc-webtag:handle coderId="10574855" context="algorithm"/>'s 75, securing the top spot and passing the 3000+ rating mark. 
He is only the 19th coder in TopCoder history to reach this milestone.</p>
 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6726&amp;rd=10097" name="6726">StringSquares</a></b> 

</font> 

<A href="Javascript:openProblemRating(6726)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506107" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      431 / 465 (92.69%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      393 / 431 (91.18%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>qiangfu</b> for 249.33 points (1 mins 28 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      206.25 (for 393 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
The solution to this problem is pretty straightforward. Iterate through all possible strings of even length, check if they are <i>square</i>,
 and add all <i>square</i> strings to a set. Having checked all the strings, return the size of the set you have. C++ code follows:
<pre>
        int count(string s) 
            { 
            set<string> ans;
            for (int len = 1; len <= s.length()/2; len++) 
                for (int i = 0; i + 2*len <= s.length(); i++) {
                if (s.substr(i, len) == s.substr(i + len, len))
                    ans.insert(s.substr(i, len));
                }
            return ans.size();
            } 
</pre>
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6640&amp;rd=10097" name="6640">PickupBed</a></b> 

</font> 

<A href="Javascript:openProblemRating(6640)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506107" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      129 / 465 (27.74%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      85 / 129 (65.89%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>smell</b> for 437.71 points (11 mins 2 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      257.09 (for 85 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

Since the total number of pipes is very small (at most eight), we can check all the possible orderings of the pipes in the truck.
We are to find the minimal length of the truck for every ordering, and return the minimal value of this length among all orderings.
To find this, we will fix the position of the first pipe, and place the next pipes one by one as close to the left as possible (but to the right of all already placed pipes).
<br><br>
Let (h<sub>1</sub>, ...,h<sub>n</sub>) be the heights of the pipes in the ordering.
To specify the positions of the pipes in the truck, we will store the position of the pipe as the position of its center.
<br><br>
<div align="center">
<img src="/i/srm/tccc06_r1A_v2.jpg" alt="Pipes" />
</div>
<br><br>
As you can see from the picture, if the height of a pipe is H (blue octagon), the length of OA is H/2. 
If the length of the side of the octagon is S, then the length of KL is S/sqrt(2).
The height of the octagon is equal to 2*KL + LB = (2*S/(sqrt(2))) + S = S*(sqrt(2) + 1), therefore S = H/(1 + sqrt(2)).
The length of AB is the half of the side, therefore equal AB = H/(2*(1 + sqrt(2)).
The distance between the centers of the octagons is AE = AB + BD + DE.
The lengths of AB and DE are known (AB = H/(2*(1 + sqrt(2)), DE = L/(2*(1 + sqrt(2)), where H and L are heights of the octagons),
and to find the length of BD we can use the following transformations:
<pre>
|BD| = sqrt(2) * |BC| = sqrt(2) * (|BP| + |PC|) = sqrt(2) * (|LB| + |PN| / sqrt(2)) = sqrt(2) * (S + S/sqrt(2)) = S*sqrt(2) + S = H.
</pre>
So, the length of BD is equal to the sum of lengths of BP and PC. BP is just the side of the octagon -- equal to S = H/(1 + sqrt(2)). The triangle PCN is an isosceles right-angled triangle (angle PCN is equal to 90 degrees), 
therefore the length of PC is equal to |PC| = |PN| / sqrt(2), and PN itself is the side of the octagon. 
Transforming the expression a bit more, we see that the length of BD is equal to the height of the smaller octagon.
This also can be proved, looking at triangles BCD and BCM (where M is the vertex of the octagon, which is H units above B). 
These triangles are both isosceles, both right-angled, and they share a common leg -- therefore they are equal, and the lengths of their hypotenuses are equal too. Therefore, the total distance between the centers of the pipes can be computed as 
<pre>
D = (H + H/(2*sqrt(2)) + L/(2*sqrt(2))), 
</pre>
where H and L are heights of the octagons, and H < L.
<br><br>
The pipes can not always be positioned as they are drawn on the picture. 
This placement is valid only if the point N can be placed "under" the skew edge of the bigger octagon.
This is possible, if the height of the point N is less than the height of the skew edge, or, in other words, if ((S + S/sqrt(2)) < L / sqrt(2)). 
Otherwise, the pipes cannot be placed that close, and the distance between their centers is just the sum of semi-heights of the pipes (H+L)/2.
<br><br>
Knowing the minimal distance between two pipes, we can start calculating the positions for the centers of all pipes one by one.
Set the position for the first pipe to 0. For each next pipe i, iterate through previous (i - 1) pipes and compute the leftmost position
of the center of the i-th pipe which doesn't collide with any of the first pipes. 
When you have gone through all the pipes, the only thing left is to compute the length of the truck needed. To do this, iterate through all pipes once 
again and compute the leftmost and the rightmost points of all pipes. The distance between these points will be the necessary length. The following method computes the minimal length of the truck needed to place all pipes from data without changing their order:
</p>
<pre>
    double compute(int[] data) {
        double[] center = new double[N];
        for (int i = 1; i < N; i++) {
            // the side of the i-th octagon
            double s = data[i] / (1. + sq2); 
            for (int j = 0; j < i; j++) {
                // the side of the j-th octagon
                double a = data[j] / (1. + sq2); 
                // distance when octagons are placed side-to-side
                double dist = (data[i] + data[j]) / 2.; 
                // its possible to place the i-th octagon "under" the j-th one
                if (s + s/sq2 < a) 
            dist = Math.min(a/2. + s/2. + data[i], dist);
                // its possible to place the j-th octagon "under" the i-th one
                if (a + a/sq2 < s) 
            dist = Math.min(a/2. + s/2. + data[j], dist);
                // update the minimal position of the center of the i-th octagon
                center[i] = Math.max(center[i], center[j] + dist); 
            }
        }
        double left = 0;
        for (int i = 0; i < N; i++) 
        left = Math.min(left, center[i] - data[i]/2.);
        double right = 0;
        for (int i = 0; i < N; i++) 
        right = Math.max(right, center[i] + data[i]/2.);

        return right - left;
    }
</pre>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6051&amp;rd=10097" name="6051">VectorCostSequence</a></b> 

</font> 

<A href="Javascript:openProblemRating(6051)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506107" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      48 / 465 (10.32%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      13 / 48 (27.08%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 627.43 points (25 mins 18 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      523.61 (for 13 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Let's call an addition that causes the capacity of the vector to increase a <i>jump</i>. 
The size of the <i>jump</i> will be the capacity of the vector before the jump.
If the optimal solution contains several <i>jumps</i>, we can always reorder the sequence of moves to sort 
<i>jumps</i> in our solution. In other words, if the optimal solution contains several jumps of different size, we can always reorder 
the moves in the solution to make the jumps of smaller sizes before the bigger ones (keeping the same total number of moves and the total cost of the solution).
</p>
<p>
The optimal solution, then, can always have the following structure:
<pre>
...
Several additions - each of cost 1
<i>jump</i> of cost 2<sup>K</sup> - the capacity is doubled to 2<sup>K + 1</sup>.
[optional] - the following part can be not present or can be repeated more than once.
removal - the capacity is reduced to 2<sup>K</sup>.
<i>jump</i> of cost 2<sup>K</sup> - the capacity is doubled to 2<sup>K + 1</sup>.
[/optional] - end of the optional part.
Several additions - each of cost 1.
<i>jump</i> of cost 2<sup>K + 1</sup> - the capacity is doubled to 2<sup>K + 2</sup>.
[optional] - the following part can be not present or can be repeated more than once.
removal - the capacity is reduced to 2<sup>K + 1</sup>.
<i>jump</i> of cost 2<sup>K + 1</sup> - the capacity is doubled to 2<sup>K + 2</sup>.
[/optional] - end of the optional part.
and so on...
</pre>
As you can see, if we ever made the vector to be of the size of N, we must perform N additions and all jumps of sizes 2^k < N, giving us some cost C.
  If C is greater than <b>d</b>, then N is too big and we can not produce the cost needed.
  Otherwise, we need to produce the additional cost of (<b>d</b> - C) using optional operations in our algorithm.
  Since repeating an optional pair of operations results in the cost of (2<sup>i</sup> + 2) in 2 steps, 
  finding the optimal cost for d (with the maximal size of the vector equal to N) requires finding the optimal
  split of number (<b>d</b> - C) into the sum of numbers of the form (2<sup>i</sup> + 2), with each 2<sup>i</sup> < N.
  <br><br>
  This problem can be solved using a greedy algorithm -- taking the biggest number of the form (2<sup>i</sup> + 2) that is less than 
    the necessary cost. The fact that greedy produces the optimal answer can be proved by contradiction, since not taking the biggest number 
    results in more required operations.<br>
  <br>
To find the optimal solution to the problem, we are trying all possible values for N, computing the answer for each such value and returning the best of them. Since, for each N, we need at least perform N additions, the answer can not be less than N. Therefore, we check only those values of N that are smaller than the best answer we've found so far.
Java implementation of this algorithm follows:
<pre>
    public int getSmallest(int d) {
        int best = d;
        for (int i = 2; i < best; i++) {
            int sum = d - i;
            int t = 1;
            while (t < i) {
                sum -= t;
                t *= 2;
            }
            if (sum < 0) break;
            best = Math.min(best, i + f(sum, t / 2));
        }
        return best;
    }
    int f(int left, int a) {
        int cnt = 0;
        while (a > 0) {
            int p = left / (a + 2);
            left -= p * (a + 2);
            cnt += p * 2;
            a /= 2;
        }
        return cnt + left;
    }
</pre>
</p>


<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
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
