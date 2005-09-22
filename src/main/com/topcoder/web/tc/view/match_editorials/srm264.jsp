<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statisics</title>

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
<tc-webtag:forumLink forumID="505767" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 264</span><br>Tuesday, September 22, 2005
<br><br>

<span class="bigTitle">Match summary</span>
<p>
In Division 1, only Petr (1st) and andrewzta (2nd) managed to solve all three problems. evgeni was the third of the three to solve the 1000 pointer; his 500 was taken down in the challenge phase, though this did not cost him 3rd place. Special recognition to Hardcoder in 4th, who submitted only the 250 point problem, but racked up 11 successful challenges without any unsuccessful.
<br><br>
Gluk made a very strong Division 2 showing, finishing all three problems in just over 30 minutes, and passing his nearest competitor .Invader by over 150 points. First-timers wlodzislaw and Gassa came in 3rd and 4th and will be taking on Division 1 next match.
</p>
<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4782&amp;rd=7998"
name="4782">GradingSystem</a></b>
</font>
<A href="Javascript:openProblemRating(4782)"><img hspace="10"
border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      217 / 326 (66.56%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      171 / 217 (78.80%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kudlatyPL</b> for 241.01 points (5 mins 31 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      162.20 (for 171 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Since we are looking for the sum of the differences, and since every student will receive at least as high a grade in the first scheme as in the second, we may sum the grades in the first scheme and subtract those in the second.

The students' scores are given in ascending order, with higher desired grades breaking ties between identical scores and coming first. So to find grades given that the desired grade is a lower bound on the actual grade for students of a certain score or higher (the first scheme), we may iterate from the beginning to end, storing the highest seen desired grade:
<pre>int sum = 0;
int highest = 0;
for (int i = 0; i < scores.length; i++) {
    if (grades[i]>highest) highest = grades[i];
    sum += highest;
}</pre>
To use the second grading scheme, we do the same thing except
backwards: iterate from the end to the beginning, storing the lowest seen desired grade.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4816&amp;rd=7998"
name="4816">DivisibilityRules</a></b>
</font>
<A href="Javascript:openProblemRating(4816)"><img hspace="10"
border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      102 / 326 (31.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      31 / 102 (30.39%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ravi_kiran</b> for 456.46 points (8 mins 56 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      306.77 (for 31 correct submissions)
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
      258 / 286 (90.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      126 / 258 (48.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>sql_lall</b> for 243.77 points (4 mins 33 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      192.49 (for 126 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Each multiplier in a divisibility rule is dependent only on the last multiplier, the base, and the divisor, simply:
<pre>m[0] = 1
m[i] = (m[i-1] * base) % divisor</pre>
A good way to detect cycles in this case is to set up an array of used digits and mark each digit as you use it. Be careful about your stopping criteria. The most common error in this problem was to store only (1,3) for the rule (1,3,1,3,1,3...). This is a problem because then (1,3,3,3,3...) will be stored as (1,3) also, and result in an incorrect match.
<pre>m[0] = 1;
for (int i = 1; i < 1000; i++) {
    m[i] = (m[0]*base)%divisor;
    if (used[i]!=0) return m;
    used[i] = 1;
}</pre>
Once you've calculated the divisibility rule for the given base and divisor, you can move on to calculate the rule for every other digit in that base and compare them. It turns out that to compare rules, you need only calculate the first 50 or so multipliers, and in fact could calculate and compare rules simultaneously to shortcircuit, though those optimizations were not necessary.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4442&amp;rd=7998"
name="4442">SetMetric</a></b>
</font>
<A href="Javascript:openProblemRating(4442)"><img hspace="10"
border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      20 / 88 (22.73%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>agray</b> for 949.59 points (6 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      676.45 (for 20 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
A greedy approach will not work for this problem, and 20 elements is too many to try all possible permutations. The key here is to recognize that if target[i] < target[j] and candidate[k] < candidate[m], you should never need to match target[j] with candidate[k] and target[i] with candidate[m]. In other words, both sets may be sorted first and then matched in order, with certain elements in candidate skipped. Consider both lists sorted, and try swapping any two elements; you'll should see that this is at least a locally optimal arrangement. A recursive solution is most straightforward. At each stage, either match the next element of candidate with the next element of target, or skip the next element of candidate, whichever yields the best solution. Once all of target and all of candidate is used, you're done.
<pre>int recur(int[] target, int[] candidate, int targetPos, int
candidatePos) {
    if (targetPos==target.length) return 0;
    if (candidatePos-targetPos==candidate.length) return 9999999;
    int diff = candidate[candidatePos]-target[targetPos];
    if (diff<0) diff = -diff;
    int withoutUsingBlank =
recur(target,candidate,candidatePos+1,targetPos)+diff;
    int usingBlank = best(target,candidate,candidatePos+1,targetPos+1);
    if (withoutUsingBlank<usingBlank) return without;
    else return usingBlank;
}</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4608&amp;rd=7998"
name="4608">GradingGridIns</a></b>
</font>
<A href="Javascript:openProblemRating(4608)"><img hspace="10"
border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      114 / 286 (39.86%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      46 / 114 (40.35%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>John Dethridge</b> for 360.65 points (19 mins 17 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      238.05 (for 46 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
There were two main parts to this problem: parsing and checking for nearly correct answers. The parsing was straightforward, if somewhat long, as long as you made sure to catch certain not-so-obvious cases such as "1  2" (malformed) and "123." (not malformed). To avoid double imprecision problems, either use epsilons or keep all values in fraction form. Convert ".123" to a numerator, 123, and a denominator, 1000, for example.

The second part was most easily solved by trying all possible inputs (there are only 13 allowed characters and only 13<sup>4</sup> allowed strings).
You should already have a way to tell if an answer is malformed and to extract its value if not, so it is a simple matter to generate every possible four character string, check to see if it is malformed, and if not extract its value. Sorting all of the values, we have a tool to determine whether some answer is the closest to one of the range bounds. Again, epsilons or fractions are very necessary to keep imprecision in check.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4445&amp;rd=7998"
name="4445">PolygonDecomposition</a></b>
</font>
<A href="Javascript:openProblemRating(4445)"><img hspace="10"
border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      8 / 286 (2.80%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      3 / 8 (37.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 733.23 points (18 mins 37 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      645.12 (for 3 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
There were two methods used to solve this problem, only one of which runs in time. It should be fairly clear from the outset that this is a dynamic programming (or recursion with memoization) problem. The question is how to subdivide a problem into smaller ones. We will use a table of results for polygons of size N split into K different
polygons: f(N,K). First of all, if K==1, there is always 1 way; if K is less than 1, there are 0 ways; if K is more than N-2, there are 0 ways; and if N is less than 3, there are 0 ways. Now for the recursive
case:

Consider a polygon of size N to be cut into K pieces. Choose one vertex. Either there will be a cut through that vertex or there will not be. Suppose there is not. Then either that vertex will be part of a triangle or it will not. If it will be part of a triangle, then there are f(N-1,K-1) ways to cut the remainder. If it won't, then we can envision that vertex 'collapsed' into a line joining the two adjacent vertices, and there are f(N-1,K) ways to cut the remainder.
Now suppose the vertex will be cut. Then starting at one of the adjacent vertices and indexing (starting with 0) the other vertices in order around the polygon, for each way of cutting the polygon, there is some vertex with the smallest index i that is on the other end of a cut through our chosen vertex. After cutting, the polygon made of the larger vertices can be cut in f(N-i,m) ways with m the number of polygons it will be cut into. The polygon made of the smaller vertices needs to be constrained to make sure that the chosen vertex is never cut through. We've seen how to do that in the first case; since this new polygon will have i+1 vertices, it can be cut in
f(i+1,K-m-1)+f(i+1,K-m) ways.

In short, then, to compute f(N,K), we do the following:
<pre>f(N,K) += f(N-1,K-1);
f(N,K) += f(N-1,K);
for (int i = 1; i < N-1; i++) {
    for (int m = 1; m < K; m++) {
        f(N,K) += f(N-i,m)*(f(i+1,K-m-1) + f(i+1,K-m));
    }
}</pre>

Everything must be taken modulo 1000000000, of course.
</p>

<p>
<%--<img src="/i/m/LunaticFringe_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />--%>
By&#160;<tc-webtag:handle coderId="10083726" context="algorithm"/><br />
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
