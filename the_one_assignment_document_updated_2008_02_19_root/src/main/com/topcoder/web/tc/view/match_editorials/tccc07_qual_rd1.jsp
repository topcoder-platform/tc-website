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
    <A href="/stat?c=round_overview&er=5&rd=10888">Match Overview</A><br />
    <tc-webtag:forumLink forumID="517132" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Collegiate Challenge<br />Qualification Round 1</span><br />Saturday, August 18, 2007
<br /><br />



<h2>Match summary</h2> 

<p>
In Qualification Round 1 of the 2007 TCCC, 1023 competitors were presented
with a well-balanced problemset. All the problems were quite solvable; by the end
of the coding phase almost everybody submitted the easy, more than half of competitors
managed to submit the medium, and there were as many as 204 submits on the hard.
During the challenge phase there were 118 successful challenges, mostly on the
medium problem.
</p>

<p>
After the system tests were over, <tc-webtag:handle coderId="13366203" context="algorithm"/>
placed first with fast solutions on all three problems and 2 successful challenges.
Newcomer <tc-webtag:handle coderId="22691723" context="algorithm"/> was about 90 points
behind and took second place, with 
<tc-webtag:handle coderId="156216" context="algorithm"/> in third. The cutoff to advance was 247.28
points, so a fast solution on the easy was enough to move forward.
</p>

<p>
Congratulations to all 550 coders who managed to advance to Online Round 1, and good luck
to all other coders in the next Qualification Rounds!
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8118&amp;rd=10888" name="8118">MovieRating</a></b> </font> <A href="Javascript:openProblemRating(8118)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517132" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br /> Used as: Division One - Level One: <blockquote><table cellspacing="2">
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
      991 / 1011 (98.02%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      981 / 991 (98.99%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>einstein41389</b> for 249.68 points (1 mins 1 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      231.94 (for 981 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The solution for this problem is very straightforward. As the rating calculation algorithm
is completely described in the problem statement, we just need to implement it. The correct
Java code follows:
</p>

<pre>
public double calculate(int[] marks, int lowCount, int highCount) {
    // sort all individual ratings in non-decreasing order
    Arrays.sort(marks);

    // find the sum of all remaining individual ratings
    int sum = 0;
    for (int i=lowCount; i+highCount&lt;marks.length; i++)
        sum += marks[i];

    // divide the sum on the amount of ratings to obtain the average
    return sum / (double)(marks.length-lowCount-highCount);
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8101&amp;rd=10888" name="8101">OptimalGroupMovement</a></b>
</font>
<A href="Javascript:openProblemRating(8101)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517132" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br /> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      622 / 1011 (61.52%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      465 / 622 (74.76%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>WangDong</b> for 481.63 points (5 mins 35 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      305.07 (for 465 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The first observation needed to solve the problem is that it's always better to move groups
separately than it is to first  merge some groups into a larger one then move them all together.
This fact immediately follows from the inequality (X + Y)<sup>2</sup> &ge; X<sup>2</sup> +
Y<sup>2</sup>.
</p>

<p>
The second observation is that if we fix the final state of the board, then it's always
possible to move the groups to their final positions in such a way that two groups are never
merged together into a large group unless they both will reach their final positions immediately
after the move. To achieve this, we can first move those groups, which are to the left of their final
positions, in right-to-left order, and then move the groups that are to the right of
their final positions in left-to-right order.
</p>

<p>
These two observations give us the solution. We iterate through every possible final state of
the board. For every state, we calculate how many moves need to be made for every group in
order to achieve this state and what the total cost of all those moves is. The answer is the
minimum total cost of moves among all possible final states.
</p>

<p>Commented Java code follows:</p>

<pre>
public int minimumCost(String board) {
    int N = board.length(), grCnt = 0, tot = 0;

    // find all groups on the board
    int[] grSt = new int[N], grFn = new int[N];
    for (int i=0; i < N; i++)
        if (board.charAt(i) == 'X' && (i == 0 || board.charAt(i-1) == '.')) {
            grSt[grCnt] = i;
            grFn[grCnt] = i;
            while (grFn[grCnt] + 1 < N && board.charAt(grFn[grCnt]+1) == 'X')
                grFn[grCnt]++;
            tot += grFn[grCnt] - grSt[grCnt] + 1;
            grCnt++;
        }

    int best = 1000000000;

    // iterate through all possible start positions of the final group
    // and find the minimum among total costs of moves needed to reach
    // each final state of the board
    for (int st=0; st + tot <= N; st++) {
        int cost = 0, cur = st;
        for (int i=0; i < grCnt; i++) {
            int grSize = grFn[i] - grSt[i] + 1;
            cost += Math.abs(cur - grSt[i]) * grSize * grSize;
            cur += grFn[i] - grSt[i] + 1;
        }
        best = Math.min(best, cost);
    }

    return best;
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8146&amp;rd=10888" name="8146">ConstructionFromMatches</a></b>
</font>
<A href="Javascript:openProblemRating(8146)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517132" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br /> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      204 / 1011 (20.18%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      157 / 204 (76.96%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>isd</b> for 878.49 points (10 mins 52 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      612.10 (for 157 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem can be solved using dynamic programming. Let F(i, j, k) be the minimum cost
of 2xi rectangle, which:</p>
<ul>
<li>consists of i leftmost columns of the required rectangle;</li>
<li>has rightmost match in the top row of thickness j;</li>
<li>has rightmost match in the bottom row of thickness k.</li>
</ul>
<p>Let's find the recurrence for F(i, j, k). We consider all matches in the i-th column
of the rectangle and denote their lengths by letters a, b, c, d, e, as shown in the
picture below:
<pre>
                 c
 --- ---  ...   ---
|   |   |      |   |
|   |   | ... a|   |j
|   |   |      | d |
 --- ---  ...   ---
|   |   |      |   |
|   |   | ... b|   |k
|   |   |      | e |
 --- ---  ...   ---
</pre>

<p>
Let's iterate through the possible values of a, b and c. Using equalities a + c + d + j = top[i-1] and
b + d + e + k = bottom[i-1], we can find the values d and e, namely d = top[i-1] - a - c - j
and e = bottom[i-1] - b - d - k. If d or e doesn't correspond to correct match thickness,
then the current triple a, b, c won't give as any solutions and we need to continue with
the next triple. Otherwise, we can find the minimum cost of
2xi rectangles for the current triple a, b, c. Obviously, the minimum cost of its first
i-1 columns is F(i-1, a, b) and the cost of additional matches in i-th column
is cost[c-1] + cost[d-1] + cost[e-1] + cost[j-1] + cost[k-1]. Altogether, the cost of all 2xi
rectangle is F(i-1, a, b) + cost[c-1] + cost[d-1] + cost[e-1] + cost[j-1] + cost[k-1] and
the minimum of this expression over all triples a, b, c will give us the value of F(i, j, k).
</p>

<p>
Now, as we have the recurrence for F(i, j, k), we can start from F(0, j, k) = cost[j-1] + cost[k-1]
and consequently find all values of F. Minimum of F(N, j, k) over all match thicknesses j and k
will give us the answer for the problem (here N is the number of columns in the
required rectangle).
</p>

<p>
Java implementation of the described algorithm follows:
</p>

<pre>
public class ConstructionFromMatches {
    public int minimumCost(int[] cost, int[] top, int[] bottom) {
        int N = top.length, M = cost.length;
        int[][][] F = new int[N+1][M+1][M+1];

        // initialization
        for (int j=1; j <= M; j++)
            for (int k=1; k <= M; k++)
                F[0][j][k] = cost[j-1] + cost[k-1];

        // general recurrence
        for (int i=1; i <= N; i++)
            for (int j=1; j <= M; j++)
                for (int k=1; k <= M; k++) {
                    F[i][j][k] = 1000000000;
                    for (int a=1; a <= M; a++)
                        for (int b=1; b <= M; b++)
                            for (int c=1; c <= M; c++) {
                                int d = top[i-1] - a - c - j;
                                int e = bottom[i-1] - b - d - k;
                                if (d < 1 || d > M) continue;
                                if (e < 1 || e > M) continue;
                                F[i][j][k] = Math.min(F[i][j][k],
                                    F[i-1][a][b] + cost[c-1] + cost[d-1] +
                                    cost[e-1] + cost[j-1] + cost[k-1]);
                            }
                }

        // answer calculation
        int res = 1000000000;
        for (int j=1; j <= M; j++)
            for (int k=1; k <= M; k++)
                res = Math.min(res, F[N][j][k]);

        return (res == 1000000000 ? -1 : res);
    }
}
</pre>

<p>
Note that this algorithm has complexity O(M<sup>5</sup> * N), where M is the amount
of different match thicknesses and N is the number of columns in the resulted rectangle.
There is also an improvement of this solution, which lowers complexity to O(M<sup>4</sup> * N).
We leave the pleasure of finding this improvement to the readers.
</p>
<br /><br />



<div class="authorPhoto">
    <img src="/i/m/ivan_metelsky_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10481120" context="algorithm"/><br />
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
