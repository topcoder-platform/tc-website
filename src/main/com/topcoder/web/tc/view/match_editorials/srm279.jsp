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
<tc-webtag:forumLink forumID="505793" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 279</span><br>Wednesday, December 21, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
The competition gathered 851 participants stimulated with perspective 
not only to earn additional rating points, but also cash prizes. 
Division 1 200 was very easy giving a chance to warm up before two 
others, which were much more difficult. The medium problem was above 
the average by difficulty, but the idea was pretty standard. The correct 
solution for the hard in addition was hard to guess, which explains the 
low success rate with only 12 correct submissions. 
</p>
<p>
The winner is <b>Petr</b> with 1620.59, which is almost 300 points more 
than <b>ACRush</b> who get the second place with 1322.83. The third and 
the fourth are <b>bmerry</b> and <b>misof</b> correspondingly.

</p>
<p>
Division 2 winner is <b>King_Bette</b> followed by two newcomers 
<b>chenll</b> and <b>zwdant</b>.
</p>
<p>
Unfortunately because of a small technical problem this SRM does not 
influence the participant rating, but the prize money will be delivered 
to the winners as promised.
</p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5950&amp;rd=8076" name="5950">DancingSentence</a></b>
</font>
<A href="Javascript:openProblemRating(5950)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505793" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
    361 / 418 (86.36%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Success Rate</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    309 / 361 (85.60%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>High Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    <b>veskok</b> for 298.03 points (2 mins 18 secs)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Average Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    253.23 (for 309 correct submissions)
  </td>
  </tr>
</table></blockquote>

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Value</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    200
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Submission Rate</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    381 / 382 (99.74%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Success Rate</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    370 / 381 (97.11%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>High Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    <b>krijgertje</b> for 199.59 points (1 mins 17 secs)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Average Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    191.74 (for 370 correct submissions)
  </td>
  </tr>
</table></blockquote>
<p>

The solution to this problem is pretty straightforward. 
You just need to remember the case of the previous letter while iterating 
through the string. The spaces should be preserved as is. 
If the previous letter was lowercase, you need to uppercase 
the current one if necessary. And vice versa, if the previous letter 
was uppercase, you need to lowercase current one. 
Here is the top Java solution written by <b>Googly</b>:

<pre>
 public String makeDancing(String sentence) {
   String ret = "";
   boolean upper = true;
   for (int i=0; i&lt;sentence.length(); i++) {
     char c = sentence.charAt(i);
     if (c == ' ') {
       ret += " ";
     } else {
       if (upper) {
         ret += Character.toUpperCase(c);
       } else {
         ret += Character.toLowerCase(c);
       }
       upper = !upper;
     }
   }
   return ret;
 }
</pre>

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4649&amp;rd=8076" name="4649">TheTournament</a></b>
</font>
<A href="Javascript:openProblemRating(4649)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505793" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
    296 / 418 (70.81%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Success Rate</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    189 / 296 (63.85%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>High Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    <b>chenll</b> for 486.22 points (4 mins 48 secs)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Average Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    309.49 (for 189 correct submissions)
  </td>
  </tr>
</table></blockquote>
<p>
The solution for this task is also straightforward. 
You need to calculate the total number of matches for each player 
and the number of matches each player won. 
The map container can be rather helpful for those calculations, though low constraint allow brute force solution run in time.
</p>
<p>Here is a quite short solution written by <b>Olexiy</b>:</p>
<pre>
 public String findLeader(String[] data) {
   int bestPlayed = 1; // Games played by the best team found so far
   int bestWon = -1; // Games won by the best team so far
   String bestTeam = "";
   for (int game = 0; game &lt; data.length; game++) {
      String team = data[game].split(" +")[0]; // Check the team which won the game-th game
      int won = 0;
      int played = 0;
      for (int i = 0; i &lt; data.length; i++) {
        String[] s = data[i].split(" +");
        if (s[0].equals(team)) {
          played++; 
          won++;
        }
        if (s[2].equals(team)) played++;
      }
      if (won * bestPlayed &gt; bestWon * played || 
      (won * bestPlayed == bestWon * played && team.compareTo(bestTeam) &lt; 0)) {
        bestTeam = team;
        bestPlayed = played;
     bestWon = won;
      }
   }
   return bestTeam;
 }

</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4841&amp;rd=8076" name="4841">CoinPiles</a></b>
</font>
<A href="Javascript:openProblemRating(4841)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505793" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
    70 / 418 (16.75%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Success Rate</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    31 / 70 (44.29%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>High Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    <b>King_Bette</b> for 905.81 points (13 mins 46 secs)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Average Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    610.48 (for 31 correct submissions)
  </td>
  </tr>
</table></blockquote>
<p>

It is clear that the answer will be much less then 50. 
So we can look through all possible answers and for each candidate 
check if it is possible to arrange coins in that number of piles. 
Now we need to check the case with N piles. To check this case we 
do the following: sort the coin sizes, choose the N largest unique sizes and 
make them the top coins in each pile. Now we are going to place all remaining coins. 
We will do it in the following way: we will take the 
coins in the non-decreasing order and put 0 coins 
to the first pile (which already has the smallest top coin), 
1 coin to the second pile, 2 to the third, etc. 
All remaining coins to the last pile. 
While putting the coins all the rules should be checked, 
and if at least one is violated, the number of piles being checked should be 
considered invalid. On the other hand, if we can put all coins into piles, we continue with the next value of N.

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4838&amp;rd=8076" name="4838">DivisiblePermutations</a></b>
</font>
<A href="Javascript:openProblemRating(4838)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505793" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Value</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    575
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Submission Rate</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    144 / 382 (37.70%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Success Rate</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    105 / 144 (72.92%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>High Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    <b>kalinov</b> for 551.03 points (5 mins 58 secs)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Average Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    385.83 (for 105 correct submissions)
  </td>
  </tr>
</table></blockquote>
<p>
This task can be solved using the dynamic programming. 
At first let's introduce the term "mask". 
Under mask we understand any subset of digits from the original 
number (the order of digits in subset is not particular). 
It can be presented as the number of times each digit occurs in the subset. 
So for number "122132" the mask can be presented as 
{2, 3, 1, 0, ..., 0}. It's easy to show that the total number of 
different masks for the specified number <b>N</b> is not more than 5832.
</p>
<p>
Let's define A[t, m] as the number of  permutations of mask t which are 
equal to the m modulo <b>M</b>.  The answer is A[T, 0], where T is the 
mask for the given <b>N</b>. This value can be calculated lazily as it 
is shown in the flowing pseudo-code:
</p>
<pre>
 A[t, m] = 0;
 for (i = 1..9)
   if (i in mask t)
     for (m2 = 0..<b>M</b>-1)
       if (m2 * 10 + i = m (mod <b>M</b>))
         A[t, m] += A[t - i (mask t without one of the i digits), m2];
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5874&amp;rd=8076" name="5874">SwapSorter</a></b>
</font>
<A href="Javascript:openProblemRating(5874)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505793" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
    98 / 382 (25.65%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Success Rate</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    12 / 98 (12.24%)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>High Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    <b>ACRush</b> for 649.74 points (23 mins 44 secs)
  </td>
  </tr>
  <tr>
  <td class="bodyText" style="background: #eee;">
    <b>Average Score</b>
  </td>
  <td class="bodyText" style="background: #eee;">
    472.07 (for 12 correct submissions)
  </td>
  </tr>
</table></blockquote>
<p>
Let's build the oriented multi-graph where vertices are all unique 
numbers from the given array. For each element of the original A[i] 
which is not equal to the corresponding element of the sorted array 
B[i] let's add the edge (A[i], B[i]) to the graph. Obviously, each 
connected component of the resulting graph is <a href="http://mathworld.wolfram.com/EulerianGraph.html">Eulerian</a>.
</p>
<p>
Allowed swap of two elements in terms of graph is the replacement of 
two consequent edges (v1, v2) and (v2, v3) with one edge (v1, v3) and 
selfloop (v2, v2). All selfloops do not have any interest for us and 
should be removed.  For example, for A = {3, 1, 2} graph will have 
following edges: (3, 1), (1,2), (2, 3). Swapping of 3 and 1 will lead 
to replacement of edges (3, 1) and (1, 2) with the edge (3, 2).
</p>
<p>
Let's consider connected components with two vertices. Each swap in 
such component removes two edges (two selfloops appears instead and 
should be immediately removed). If the total number of edges in the 
component was E, we will make E/2 swaps.
</p>
<p>
Let's consider connected components with more than two vertices. As we 
already discussed it is possible to build <a href="http://mathworld.wolfram.com/EulerianCircuit.html">Eulerian Circuit</a> inside each component. 
If component contains 3 vertices and 3 edges, it is clear that 2 replacements 
can be done. Otherwise, in this Eulerian circuit is possible to find at least one 
triple of consequent distinct vertices v1, v2, v3 so, that after replacing of 
edges (v1, v2) and (v2, v3) with the edge (v1, v2) the component will still has 
at least three vertices and will remain to be Eulerian. Therefore, if such component 
has E edges, the maximum number of swaps can be done is E-1.

</p>
 
  <img src="/i/m/Andrew_Lazarev_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
  By&#160;<tc-webtag:handle coderId="7485898" context="algorithm"/><br />
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
