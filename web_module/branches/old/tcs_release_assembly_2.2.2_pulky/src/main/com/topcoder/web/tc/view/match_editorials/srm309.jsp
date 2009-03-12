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
<tc-webtag:forumLink forumID="505984" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 309</span><br>Wednesday, June 28, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>This SRM had a very difficult Division 1 problem set, along with an unusually hard medium, resulting on most coders completing only the easy problem correctly. <tc-webtag:handle coderId="19849563" context="algorithm"/>’s outstanding performance of solving all problems secured him the first place by a wide margin, while <tc-webtag:handle coderId="8511003" context="algorithm"/>, <tc-webtag:handle coderId="156592" context="algorithm"/> and <tc-webtag:handle coderId="7555099" context="algorithm"/> took the next three spots thanks to correct submissions on the hard. They were followed by the three coders that successfully solved the medium: <tc-webtag:handle coderId="7462740" context="algorithm"/>, <tc-webtag:handle coderId="10042900" context="algorithm"/> and <tc-webtag:handle coderId="15616795" context="algorithm"/>. Congratulations to all of them for a very nice performance! Credit goes to the only other coder to submit both the medium and the hard, <tc-webtag:handle coderId="7433858" context="algorithm"/>, who unfortunately lived to see his solutions down due to minor bugs.</p>
<p>It wasn’t an easy round in Division 2 either. The Division was won by newcomer <tc-webtag:handle coderId="22074907" context="algorithm"/> thanks to the fastest submission on the hard. The other two coders to complete all three problems correctly were newcomer <tc-webtag:handle coderId="22627322" context="algorithm"/> and <tc-webtag:handle coderId="13320591" context="algorithm"/>. Congratulations!</p>
 
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6243&amp;rd=9989"
name="6243">ContestCoordinator</a></b>
</font>
<A href="Javascript:openProblemRating(6243)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505984"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      383 / 421 (90.97%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      215 / 383 (56.14%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>rajeshrathod</b> for 245.67 points (3 mins 47 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      197.35 (for 215 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem can be solved by iterating over all possible values for k. The first thing to do is sorting the input. Then start with the entire sequence and repeatedly remove one element from each end until the sequence is empty. Of course you should update the result along the way. For a clean implementation of this approach see <tc-webtag:handle coderId="22627322" context="algorithm"/>’s <a href="/stat?c=problem_solution&rm=249102&rd=9989&pm=6243&cr=22627322">solution</a>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6241&amp;rd=9989"
name="6241">ScoreRecomposition</a></b>
</font>
<A href="Javascript:openProblemRating(6241)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505984"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      115 / 421 (27.32%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      74 / 115 (64.35%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>vlad_D</b> for 475.90 points (6 mins 27 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      285.60 (for 74 correct submissions) 
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
      290 / 335 (86.57%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      253 / 290 (87.24%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kia</b> for 241.29 points (5 mins 26 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      178.74 (for 253 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>This problem had a large set of feasible approaches to choose from. What this problem really asked for was finding a permutation of point values that results in <b>score</b> and has the lowest error as it is defined in the statement. The constraints on this problem were low enough so that one could safely solve it by trying all these permutations. This was the approach that most coders took since it led to fast submissions. For a clean implementation of this approach see the fastest <a href="/stat?c=problem_solution&rm=249081&rd=9989&pm=6241&cr=20286298">submission</a> from <tc-webtag:handle coderId="20286298" context="algorithm"/>. Often, this approach based on trying all permutations can be adapted to a dynamic programming one that takes into account each subset of the set consisting of all integers from 1 to N. For an implementation based on this approach see <tc-webtag:handle coderId="19849563" context="algorithm"/>’s <a href="/stat?c=problem_solution&rm=249073&rd=9989&pm=6241&cr=19849563">pointer</a>.</p>
<p>However, there are some more efficient approaches as described below.</p>
<p>First of all, we should notice that there are three cases. Let S be the score obtained if each question is assigned a point value equal to its index. If <b>score</b> is equal to S, then return 0. Otherwise, we will reduce the case score < S to the case score > S. This can be done by noticing that obtaining <b>score</b> from the correct-answered questions is really the same thing as obtaining newScore = N*(N+1)/2 – score from the wrong-answered questions. So by modifying <b>score</b> in this way and replacing the ‘C’s with ‘W’s and vice-versa in the input string yields another instance of the problem where score > S (S will be modified in the same way, newS = N*(N+1)/2 – S).</p>
<p>Now we need to increase the point values of some or all of the correct questions while decreasing the scores of the incorrect ones. Notice that is of no use to assign to a correct question a greater point value than to another correct question with a greater index-just swap the point values and get a new valid assignment. An analogous observation is valid for the incorrect questions.</p>
<p>Now we will get from S to <b>score</b> by repeatedly increasing the current score by one. Initially, set the error D to 0 and S to the current score. We can increase the current score with one point by finding a correct question with a point value with exactly 1 less than the point value of an incorrect question. We swap their point values only if this operation doesn’t increase the current error value D. When no such operation is possible we have no choice but increasing the current value of D and perform the new available operations. Note that from the observation in the last paragraph the order in which you perform operations doesn’t really matter-if an operation becomes available, you can safely perform it. Also note that it is possible to do more than one increase operation for a particular correct question and the current value of D. When we get <b>score</b> we return the current value of D. If D becomes equal to the number of questions, and the current score is still less than <b>score</b> we can conclude that no solution exists.</p>
<p>Another approach is to compute the best possible score for each value of D. This can be done with a <a href="/tc?module=Static&d1=tutorials&d2=greedyAlg">greedy</a> algorithm-assign to every correct question the highest available point value while not forgetting about the incorrect questions. If implemented properly, this takes linear time in the number of questions for each D. The minimum error is the first value of D for which the best possible score is greater or equal to <b>score</b>. One can easily prove that by following the algorithm from the first approach backwards, you can get from the best possible score to <b>score</b>.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6242&amp;rd=9989"
name="6242">SynchronizingGuideposts</a></b>
</font>
<A href="Javascript:openProblemRating(6242)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505984"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      21 / 421 (4.99%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      5 / 21 (23.81%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Gribok</b> for 657.66 points (23 mins 12 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      505.37 (for 5 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>The first thing one should realize is that there are just too many possible locations for the gas station to try them one by one. Instead, we must find a way to remove the locations that can’t possibly result in a better cost.</p>
<p>Let pos[i]=position[i]+distance[i] be the real position of the road that the ith guidepost refers to. Also, let left[i]=pos[i]-limit[i] and right[i]=pos[i]+limit[i] the left and right limits of moving the ith guidepost with a cost of one dollar per kilometer.</p>
<p>Consider building the gas station at some position X. Let’s see what happens when we change the location of the gas station from X to X+1, and let’s assume neither X nor X+1 are equal to some pos[i], left[i] or right[i]. We will split the guideposts in four sets according to X and X+1: <i>A</i> will contain the guideposts that have both pos[i] and right[i] less than X-in other words, the guideposts that must be moved to the right with one dollar per kilometer within their limits and then must be moved further to the right with an additional C dollars per kilometer. Similarly let D be the set containing guideposts that have pos[i] and left[i] greater than X. <i>B</i> will be the set composed of the guideposts for which pos[i] is less than X but right[i] is greater; <i>C</i> will be the set of guideposts for which pos[i] is greater than X but left[i] is less. So the guideposts in sets <i>B</i> and <i>C</i> will be the ones moved within their limits. If we let a, b, c, and d to denote the number of guideposts in each set, notice how the cost is modified when changing locations from X to X+1: difference = newcost – oldcost = (1 + C) * (a - d) + b – c. This is because the cost of moving each guidepost in sets <i>A</i> and <i>B</i> increases by 1 + C dollars for a guidepost in <i>A</i> and with one dollar for guideposts in <i>B</i>. The cost of moving the guideposts in <i>C</i> and <i>D</i> decreases likewise. It is easy to see that changing locations from X to X-1 results in a difference with the opposite sign. Since this doesn't depend on the position X, we can conclude that if it is profitable to move the location of the gas station to the left or to the right (which one of them gives you a negative difference) you can move it all the way until you get to an “important” location-one that is equal to pos[i], left[i] or right[i] for some i. It suffices to compute only the costs of building the gas station at these important locations and choose the cheapest option. One can further improve this algorithm by working around the observation above yielding a linear time solution (after a sort operation though), but this was not necessary during the contest. See <tc-webtag:handle coderId="21229740" context="algorithm"/>’s <a href="/stat?c=problem_solution&rm=249102&rd=9989&pm=6242&cr=21229740">solution</a> for a nice implementation of this algorithm.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6516&amp;rd=9989"
name="6516">KMonotonic</a></b>
</font>
<A href="Javascript:openProblemRating(6516)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505984"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      17 / 335 (5.07%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 17 (23.53%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 489.20 points (14 mins 12 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      284.76 (for 4 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>This problem proved to be very difficult, so a detailed write-up is given below.</p>

<p>This problem probably screamed <a href="/tc?module=Static&d1=tutorials&d2=dynProg">dynamic programming</a> or memoization to most division one coders. The tricky part that tripped a lot of them was to efficiently describe the state space.</p>

<p>We will systematically build up a solution, by improving solutions to easier versions of the problem. Let’s analyze a first approach: let inc[i][j][v] be the minimum number of operations needed to transform the sequence consisting of the first i elements of sequence into a j-monotonic sequence, with the jth subsequence being strictly monotonically increasing and the last element of the sequence being exactly v. Let dec[i][j][v] be defined similarly, with the difference that the jth subsequence has to be monotonically decreasing. We must perform abs(sequence[i] - v) operations to bring the ith element to v. For computing inc[i][j][v] note that we can add it either to the jth subsequence after an element less than v, or we can start a new increasing subsequence consisting of this element only after a subsequence either monotonically increasing or decreasing. This translates into the following recurrence: inc[i][j][v] = max(inc[i-1][j][u] where u is less than v, inc[i-1][j-1][u], dec[i-1][j-1][u]) + abs(sequence[i] - v). We get a similar recurrence for dec[i][j][v]: dec[i][j][v] = max(dec[i-1][j][u] where u greater is than v, inc[i-1][j-1][u], dec[i-1][j-1][u]) + abs(sequence[i] - v)</b></b>.</p>
 
<p>The result is the minimum between inc[i][j][v] and dec[i][j][v] over all possible values of v. The complexity of this approach is O(N<sup>2</sup>*V<sup>2</sup>) where V is the number of possible values for v. However, a look at the constraints suggests this is a lot more than what we can afford.</p>

<p>Fortunately, it is easy to improve on this-define another four arrays: let incDown[i][j][v] be the minimum number of operations needed to transform the subsequence consisting of the first i elements into a j-monotonic sequence with the jth sequence being monotonically increasing and the last element being at most v;  incUp[i][j][v] is defined in a similar manner, but here the last element is greater or equal to v. We can define decDown[i][j][v] and  decUp[i][j][v] similarly. It is easy to modify the recurrences above. For example inc[i][j][v] will be the minimum of incDown[i-1][j][v-1], incDown[i-1][j-1][v], incUp[i-1][j-1][v], decDown[i-1][j-1][v] and decUp[i-1][j-1][v], plus abs(sequence[i] - v). You compute incDown[i][j][v] as the minimum of the numbers inc[i][j][v] and incDown[i][j][v-1]. The others are similar. The complexity is now O(N<sup>2</sup>*V), but this is still not fast enough.</p>

<p>The key observation needed to make this work was that one need not consider all possible values for v: it’s enough to only try those values close to some element from <b>sequence</b>. How close? We will prove in the next paragraph that (N+1)/2 (integer division) is enough, but during the contest a proof was not necessary, and some more intuitive bound like N could have been preferred. Since we reduced to a number of possible values for v that is quadratic in the length of the sequence, N, this algorithm will run well in time. See <tc-webtag:handle coderId="10042900" context="algorithm"/>’s <a href = "/stat?c=problem_solution&rm=249079&rd=9989&pm=6516&cr=10042900">solution</a> for an implementation based on this algorithm.</p>

<p>Let’s now prove what was stated above. One should notice that every monotonic sequence can be decomposed into a number of subsequences consisting of consecutive values-the absolute difference between two consecutive elements in the subsequence is 1, even if all these subsequences are just one element in length. Under these constraints, a useful sub-problem to solve is: <i>given a sequence of integers s<sub>i</sub> (i is 0-based), find the minimum number of operations needed to transform it into a monotonically increasing sequence consisting of consecutive values</i>. Let’s solve this one for an increasing sequence since it is similar to solve for a decreasing one. The new sequence will be in the form p, p+1, ..., p+N-1, where N is the number of elements in s. We must find a value for p that minimizes the total number of operations, nrMin = the sum over i of abs(s[i] - (p+i)). If we let d<sub>i</sub> = s<sub>i</sub> - i be are left with nrMin = sum over i of abs(d[i] - p). The value of p that minimizes nrMin is the median (the middle element) of the array d, and the proof is left as an exercise for the reader. A hint: this is very similar to the proof in the write-up for SynchronizingGuideposts-see what happens when increasing/decreasing p. Since we chose a value for p existent in the d sequence, we mapped some element from s to itself. From here we can conclude that all other elements in the resulted sequence are at most (N+1)/2 units apart.</p>

<p>There is another dynamic programming approach based directly on the sub-problem solved above: let f[i][j] be the minimum number of operations needed to transform the subsequence consisting of the first i elements of sequence into a j-monotonic sequence, g[i][j] be the minimum number of operations needed to transform the subsequence consisting of the elements in the range from i to j into a monotonic sequence, and h[i][j] the minimum cost of transforming the subsequence in the range from i to j into a sequence consisting of consecutive elements, as above. Then f[i][j] = min(f[k][j-1] + g[k+1][i]) and g[i][j] = min(g[i][k] + h[k+1][j]). The reasoning behind this recurrence is this: for f, choose the starting index of what will be the jth monotonic subsequence, compute the minimum number of operations needed for transforming it, then add to the minimum number of operations needed to transform what is left into a (j-1)-monotonic sequence. For g, choose the starting index of what will be the last subsequence of consecutive elements. When computing the values for g care should be taken at keeping the sequences monotonic. See <tc-webtag:handle coderId="7462740" context="algorithm"/>’s <a href="/stat?c=problem_solution&rm=249076&rd=9989&pm=6516&cr=7462740">solution</a> for an implementation similar to this algorithm. Or you could check <tc-webtag:handle coderId="19849563" context="algorithm"/>’s very fast <a href="/stat?c=problem_solution&rm=249073&rd=9989&pm=6516&cr=19849563">submission</a> for a mix of them.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6239&amp;rd=9989"
name="6239">StoneGameStrategist</a></b>
</font>
<A href="Javascript:openProblemRating(6239)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505984"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      13 / 335 (3.88%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 13 (30.77%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Swetko</b> for 782.28 points (15 mins 56 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      681.05 (for 4 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>The implementation of the correct algorithm for this problem was really easy. The tough part was coming up with it.
The first thing to realize is the similarity between the game presented in the problem statement and the classic game of <a href="http://en.wikipedia.org/wiki/Nim">Nim</a>. In fact the only difference is that a move is legal here only if it maintains the property of the piles being ordered in increasing number of stones. To deal with this we must reduce the problem to a new one. The equivalent to each pile will be a new pile with a number of stones equal to the difference of stones between this pile and the one to its left. It is easy to see that a move in this new game is legal in the original game. However, we are now faced with a new complication: by taking stones from a pile not only we decrease the difference of stones between this pile and the previous one, but we also increase the difference between the next pile and this one. This corresponds to taking stones from a pile and adding them to the next one in the new game. At first glance this may seem to actually be less convenient, but we will prove this is not the case.</p>
<p>Let us now see how to deal with this. For an easier understanding, let’s reverse the order of the new difference piles, and index them starting with 1. Stones taken from a pile must now be added to the pile with the next lower index (or out of the game, if taken from the first pile). The key observation is that we can reduce this game to the game of Nim by taking only the odd-numbered piles. To prove this, note that taking stones from an odd-numbered pile and adding them to an even-numbered one is equivalent to a move in the Nim game proposed. Taking stones from an even-numbered pile and adding them to an odd-numbered pile is equivalent to adding stones to a pile in the Nim game above. However, these moves are useless, since the added stones can be removed in the following move, yielding the same game state. To conclude, even though these moves may appear in a winning strategy, there is no need to.</p>
<p>With that being said, we only have to iterate through all possible initial winning moves-do not forget to include the useless “adding moves” since they could be part of a winning strategy, and choose the best one, as it is described in the problem statement. See <tc-webtag:handle coderId="15616795" context="algorithm"/>’s <a href="/stat?c=problem_solution&rm=249080&rd=9989&pm=6239&cr=7555099">solution</a> for a clean implementation of this algorithm.</p><div class="authorPhoto">
    <img src="/i/m/_efer__big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="8593420" context="algorithm"/><br />
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
