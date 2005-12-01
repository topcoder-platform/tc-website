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
<tc-webtag:forumLink forumID="505789" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 275</span><br>Wednesday, November 30, 2005
<h2>Match summary</h2>

<p>
SRM 275 went off tonight without a hitch, and offered little in the way of surprises. <b>tomek</b> continued
his quest to regain top position on the coder rankings list from <b>Petr</b> by easily winning Division 1 by
almost 100 points. Rounding out the top 5 in Division 1 with very impressive performances themselves were
<b>marek.cygan</b>, <b>krijgertje</b> (who continues his march toward becoming a target!), <b>pparys</b> and

<b>haha</b>. Division 2 was dominated by a newcomer, <b>stone</b>, whose new rating was very close to landing 
a spot on the Impressive Debuts list. The next 4 finishers were <b>dgott</b>, <b>cypressx</b>, <b>aussieviet</b>
and <b>marcoloco</b>. Only <b>dgott</b> narrowly missed advancing to Division 1, whereas the others will be
moving up for the next SRM.
</p>

 
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3531&amp;rd=8072" name="3531">HingedDoor</a></b>
</font>
<A href="Javascript:openProblemRating(3531)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505789" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      313 / 327 (95.72%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      216 / 313 (69.01%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>jiamianchaoren</b> for 249.75 points (0 mins 53 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      228.26 (for 216 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>A simple simulation was all that was required to solve this problem. You could choose
to run your simulation in two ways: one way was to keep multiplying the current angle by 
1/<b>reduction</b> and count how many such multiplications it took for the angle to fall 
to 5 degrees or lower. Another way was to start with a current angle of 5 degrees exactly
and keep multiplying by <b>reduction</b> until the angle increased to <b>initialAngle</b>

or higher, counting the number of such multiplications, of course. The second way is better
because you can use integer multiplication instead of imprecise double division.
C++ code follows:</p>
<pre>
int numSwings(int initialAngle, int reduction) {
    int angle = 5;
    while (initialAngle &gt; angle) {
        angle *= reduction;
        ret++;
        }
}
</pre>
</p>
<br>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5894&amp;rd=8072" name="5894">Haar1D</a></b>
</font>
<A href="Javascript:openProblemRating(5894)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505789" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      265 / 327 (81.04%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      225 / 265 (84.91%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>raalveco</b> for 493.34 points (3 mins 18 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      343.47 (for 225 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>This problem required coders to implement a simple 1-dimensional Haar wavelet
transform. There isn't too much to do here, just implement the algorithm
as described in the problem statement. Clearly, the algorithm can be implemented 
just as easily iteratively or recursively. In high-level pseudocode, a recursive solution 
can be represented as follows:</p>
<pre>

transform(data, N, L)

   form N/2 pairs from data
   (note that N is not necessarily the same as data.length)
   for i:1 to # pairs
      p = pair i
      sums[i] = p.first + p.second
      diffs[i] = p.first - p.second
   assign the first N/2 elements of data = elements of sums
   assign the next N/2 elements of data = elements of diffs
   if L - 1 &gt; 0
      transform(data, N/2, L - 1)
</pre>
<br>
<p>The Haar wavelet as described here is used in a number of image compression algorithms,
in particular the SPIHT algorithm (actually, the wavelet is missing a normalization
constant...) If you look at the output of the wavelet on constant data, say 32 100s, you will see 
that the output is 3200 followed by 31 0s. This is known as <i>energy compaction</i>. The wavelet 
transforms the data such that the energy of the input is concentrated into a few coefficients 
(which occur near the beginning) of the output. It should be easy to imagine why this wavelet is used 
in image compression.</p>
</p>
<br>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5910&amp;rd=8072" name="5910">GreedyGovernment</a></b>
</font>
<A href="Javascript:openProblemRating(5910)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505789" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      56 / 327 (17.13%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      34 / 56 (60.71%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jcerovec</b> for 734.97 points (18 mins 31 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      486.13 (for 34 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>First, it should be noted that the <i>sectors</i> and <i>roads between sectors</i> in this problem
are a thinly veiled way of saying <i>nodes</i> and <i>edges</i>. With this in mind, it should be
fairly obvious how to construct a graph from the input data. In fact, the input data directly defines
the adjacency matrix for the graph.</p>

<p>This task can then be divided into two subtasks. The first subtask is to count the number of distinct 
paths from sector 0 to sector N-1, subject to the rules in the problem statement. The second subtask is 
to determine which road's toll should be increased by <b>tollHike</b> to obtain the maximum average cost.</p>
<p>Given that the maximum number of sectors in our city was at most 10, the first subtask could be
solved by doing a simple depth-first search (DFS) to generate all the paths in the graph which start
from node 0 and end at node N-1. In pseudocode, the DFS can be structured as follows:</p>
<pre>
N = # of nodes
initialize seen[i] = false for all i // size = N

DFS(currentNode)   // currentNode is 0-based
   
   if currentNode == N-1
      // found new path, add to list of paths
      return
   if seen[currentNode] == true return      // no cycles
   seen[currentNode] = true
   for i:0 to N-1
      if !seen[i] &amp;&amp; toll[currentNode][i] &gt; 0
         DFS(i)
   
   // backtrack
   seen[currentNode] = false
</pre>
<br>
<p>To solve the second subtask, we can proceed in two ways. The bruteforce approach is to simply add <b>tollHike</b>

to each of the roads (there can be at most 90 of them) and evaluate the cost along each of the paths that
you discovered using DFS (Note that this implies that you have cached these paths. An alternative is to not
cache the paths and re-run the DFS, calculating the cost along each path within your DFS routine. If you choose 
this alternative, timeout becomes a concern although it is still possible to write a solution that is fast enough).
Then, the average cost is just the sum of the costs along all paths divided by the total number of paths from
subtask 1.</p>
<p>There is a nicer solution, though. Rather than checking each road, we observe that we can greedily add 
<b>tollHike</b> to the road that appears most often over all the paths from sector 0 to sector N-1. This is guaranteed
to produce the maximum average cost. Note that a road cannot appear in one path more than once, because this
would violate the condition that there are no cycles in the path from sector 0 to N-1. Thus, by choosing the
road which appears most often over all paths, we have effectively added <b>tollHike</b> to the maximum number
of paths that we can. Obviously, when we now divide by the total number of paths to get an average cost, this 
will be maximized, since we cannot increase the cost along any path any further.</p>
</p>
<br>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5896&amp;rd=8072" name="5896">InverseHaar1D</a></b>
</font>
<A href="Javascript:openProblemRating(5896)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505789" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      253 / 265 (95.47%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      248 / 253 (98.02%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>lishengren</b> for 245.68 points (3 mins 46 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      186.30 (for 248 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>This problem is obviously related to the Division 2 Medium. In fact, I used the output of the test
data from that problem to generate the test data for this problem! Here, it is not a simple matter of
implementing an algorithm that has already been given to you, since what is described in the problem 
statement is the forward transform, not the reverse. The first step, then, is to figure out how to 
reverse the transform.</p>

<p>The algorithm is best explained by considering a simple case of a 2 element sequence (and obviously, a level-1
transform). So, consider the transformed sequence {<i>y</i><sub>1</sub>, <i>y</i><sub>2</sub>}, obtained from the
original sequence {<i>x</i><sub>1</sub>, <i>x</i><sub>2</sub>}. From the description of the algorithm,
we know that the first half of the transformed sequence (i.e. <i>y</i><sub>1</sub>) is a result of the summing 
operation on the original sequence, and the second half of the sequence (i.e. <i>y</i><sub>2</sub>) is a 
result of the difference operation on the original sequence. In other words, </p>

<pre>
<i>y</i><sub>1</sub> = <i>x</i><sub>1</sub> + <i>x</i><sub>2</sub>
<i>y</i><sub>2</sub> = <i>x</i><sub>1</sub> - <i>x</i><sub>2</sub>
</pre>
<p>Now, you can easily solve those 2 equations for the 2 unknowns to obtain the original sequence. In general,
you want to be able to find 2 equations in 2 unknowns. This is always possible, because you can take the <i>i'th</i>
sum and the <i>i'th</i> difference, which will both be formed from the same pair in the original sequence. So now, 
one begins with the section of the data obtained from the last level of the transform, and reverses that portion. 
Then, take twice the number of elements and consider this our new transformed sequence, and repeat. Pseudocode for 
a recrusive solution follows:</p>
<pre>
transform2(data, N)

   for i:1 to N/2   // over all pairs
      ret[2*i] = (data[i] + data[i + N/2])/2
      ret[2*i + 1] = (data[i] - data[i + N/2])/2

   data = ret
   if 2*N &le; data.length
      transform2(data, 2*N)

transform(data, L)
   
   len = data.length
   for i:1 to L len/=2      // get the data from the LAST level
   transform2(data, len)   // note we no longer need L!
</pre>
</p>
<br>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5909&amp;rd=8072" name="5909">Horoscope</a></b>
</font>
<A href="Javascript:openProblemRating(5909)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505789" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      219 / 265 (82.64%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      115 / 219 (52.51%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>sjelkjd</b> for 479.21 points (5 mins 58 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      355.53 (for 115 correct submissions)
    </td>
  </tr>

</table></blockquote>
<p>
<p>Intuitively, it would seem that a greedy solution (i.e. always saying a 'G' prediction 
is Right (if you can) and a 'B' prediction is wrong (if you can)) would not solve this problem correctly.
It turns out that intuition, at least in this case, is right. A simple example on which a 
greedy solution returns an incorrect answer is: {GGB}, with <b>R</b>=1 and <b>W</b>=1. Here,
a greedy solution would start off by saying the first day was R, then it is forced to assign the
remaining days as W and R. So, we are left with RWR, which gives us a total of 1 Good day (the 
first one). Clearly, we can do better if we assign the Rights and Wrongs as WRW. This assignment
gives us a total of 2 Good days.</p>
<p>This problem can be solved in a pretty straightforward manner using memoization. In fact, let's go 
straight to the pseudocode:</p>
<pre>
<b>R</b>, <b>W</b> as defined in the problem statement
p = concatentation of elements in <b>predictions</b>

initialize cache[MAX_DAYS][MAX_R][MAX_W] = -1

solve(int curDay, int numRightLeft, int numWrongLeft)

   if (curDay &ge; total # of days) return 0;   // curDay starts at 0
   if cache[curDay][numRightLeft][numWrongLeft] &gt; -1
      return cached value      // this results has already been computed

   int best = -1;
   if numRightLeft &lt; <b>R</b>
      // We haven't assigned <b>R</b> Right days in a row
      // Assign the current day as being Right
      if p[curDay] == 'G' add = 1; else add = 0
      best = MAX(best, add + solve(curDay + 1, numRightLeft - 1, <b>W</b>)
   if numWrongLeft &lt; <b>W</b>

      // We haven't assigned <b>W</b> Wrong days in a row
      // Assign the current day as being Wrong
      if p[curDay] == 'B' add = 1; else add = 0
      best = MAX(best, add + solve(curDay + 1, <b>R</b>, numWrongLeft - 1)

   cache[curDay][numRightLeft][numWrongLeft] = best   


the function is called initially as follows: solve(0, <b>R</b>, <b>W</b>)
</pre>
<br>
<p>The above function basically tries all the ways of assigning Right and Wrong days for all days 
but uses caching of previously computed results to run in time. The terminating condition for the 
recursion is clear: when our current day is larger than the total number of days for which we have 
predictions, we know that we can have no Good days, so we return 0. Otherwise, as long as we can assign 
the current day as being Right, we try that possibility. Note that we add 1 to our expected number of 
Good days if we're assigning a day as being Right and it was predicted as 'G'. Similar logic is applied 
for assigning the current day as being Wrong.</p>
</p>
<br>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3468&amp;rd=8072" name="3468">SantaClaus</a></b>
</font>
<A href="Javascript:openProblemRating(3468)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505789" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      57 / 265 (21.51%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      43 / 57 (75.44%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>benetin</b> for 910.43 points (9 mins 5 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      643.40 (for 43 correct submissions)
    </td>
  </tr>

</table></blockquote>
<p>
By: <tc-webtag:handle coderId="15545604" context="algorithm"/><br>
This problem is a slightly modified maximal weight matching problem. First we build a bipartite graph, 
with <b>n</b> nodes representing people and another <b>n</b> nodes representing presents. The cost of 
giving the i<sup>th</sup> present to the j<sup>th</sup> person can be calculated as (value[j][i] - value[j][j])
 (because the j<sup>th</sup> person gets the i<sup>th</sup> present, but "loses" the j<sup>th</sup> one). Also, for each of the presents we introduce an edge of
cost 0 leading to the person who initially receives this present (so, from present 0 to person 0, from present 1 to person 1 and so on).

</p>
<p>
Now lets look closely how do we improve a group. We take present a<sub>0</sub> and give it to person a<sub>1</sub>, give present a<sub>1</sub> to person a<sub>2</sub>, 
..., present a<sub>k - 1</sub> to person a<sub>k</sub> and present a<sub>k</sub> to person a<sub>0</sub>, closing the cycle. 
We are interested in the smallest improvable group, so, if a group contains several such cycles, we can split it into several smaller groups.
Therefore, having indeces a<sub>0</sub>, a<sub>1</sub>, ..., a<sub>k</sub> chosen, we can construct a cycle in the graph we described above.
Analogously, having a cycle in that graph, we can find a group corresponding to it. 
Adding the costs over all edges used in the cycle, we can check whether the total value in the group will increase after redistributing presents.

</p>
<p>
What we need now is to find the shortest cycle of positive cost in a graph. 
This can be done by a modification of Floyd-Warshall's algorithm. 
We find paths with the highest total value for all pairs of nodes of length 2, 3, and so on. 
As soon as the path (cycle) from a<sub>i</sub> to a<sub>i</sub> has the total value greater than zero for one or more i, 
we calculate and return the maximal cost among these cycles.
See <tc-webtag:handle coderId="144400" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=246881&rd=8072&pm=3468&cr=144400">solution</a>
for a short and clean implementation.
</p>


      <img src="/i/m/NeverMore_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="287130" context="algorithm"/><br />
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
