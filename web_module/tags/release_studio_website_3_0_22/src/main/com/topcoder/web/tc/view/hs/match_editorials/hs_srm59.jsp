<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS SRM 59 Problem Set &amp; Analysis</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/tc?module=HSRoundOverview&amp;rd=13528&amp;snid=3&amp;er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="523758" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 59</span><br />Wednesday, October 8, 2008
<br /><br />


<h2>Match summary</h2> 

<p> 
TCHS SRM 59 turned out to be both rather easy and quite unpredictable. The winner was
<tc-webtag:handle coderId="22696982" context="hs_algorithm"/>,
who managed to solve all 3 problems in half an hour. Two former green coders
<tc-webtag:handle coderId="22696883" context="hs_algorithm"/> and
<tc-webtag:handle coderId="22652051" context="hs_algorithm"/> also
showed excellent performance and grabbed second and third place, respectively. 
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10111&amp;rd=13528" name="10111">CorruptMages</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10111)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523758" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
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
      113 / 119 (94.96%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      97 / 113 (85.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Zrinka</strong> for 247.83 points (2 mins 40 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      221.74 (for 97 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This is a rather standard problem which can be solved using the greedy approach: we should give bribes to the
mages with the largest power. Note, that paying the <strong>i</strong>-th mage decreases the number of active spells
by <strong>power[i]</strong>+1 (or less, if the number of active spells is small already).
Now it is clear that the best group of size K is the group containing K most powerful mages. 
So we should find the minimal K for which the total power of K most powerful mages plus K is not less than
the total number of spells.
The easiest way to achieve this is to sort the mages by their powers and start paying them one by one,
starting from the most powerful mage, until their total power is big enough. See
<tc-webtag:handle coderId="22709180" context="hs_algorithm"/>'s 
<a href="/tc?module=HSProblemSolution&amp;cr=22709180&amp;rd=13528&amp;pm=10111">
solution</a> for exact
implementation of this approach.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10104&amp;rd=13528" name="10104">EquilibriumPoints</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10104)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523758" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
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
      56 / 119 (47.06%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      31 / 56 (55.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>gnocuil</strong> for 467.36 points (7 mins 36 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      345.10 (for 31 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
In order to solve the problem, let's first identify N-1 segments on which each of the equilibrium points is located. It's not hard to see that no equilibrium point P is located to the left of all input points, because all input points would force such a point P to the right and no points would force it to the left. By similar reason, no equilibrium point is located to the right of all input points. This means, all equilibrium points are located within the segment [<strong>x</strong>[0], <strong>x</strong>[N-1]], where N is the number of elements in <strong>x</strong>.
</p>
<p>
Note that input points are sorted in ascending order of their coordinates and this is actually a small hint. Consider some two adjacent points <strong>x</strong>[i] and <strong>x</strong>[i+1], 0 &le; i &lt; N-1. Let P be a point between these two points and its coordinate be x<sub>0</sub>. Denote the total value of gravitational forces directed to the left from P as L(x<sub>0</sub>) and the total value of gravitational forces directed to the right from P as R(x<sub>0</sub>). In order for P to be an equilibrium point we should have L(x<sub>0</sub>) = R(x<sub>0</sub>) or, equivalently, L(x<sub>0</sub>) - R(x<sub>0</sub>) = 0.
</p>
<p>
Let's investigate the behaviour of functions L and R. When x<sub>0</sub> is increased, the distances between P and each of the input points located to the left of P are increased and therefore all gravitational forces between P and these points are decreased. Therefore L(x<sub>0</sub>) is a monotonically decreasing function, and similarly R(x<sub>0</sub>) is a monotonically increasing function. When x<sub>0</sub> tends to x<sub>i</sub> from the right, the distance between P and the i-th point tends to +0 and therefore L(x<sub>0</sub>) tends to positive infinity. The same argument shows that R(x<sub>0</sub>) tends to positive infinity when x<sub>0</sub> tends to x<sub>i+1</sub> from the left.
</p>
<p>
If we sum up all these properties, we'll see that L(x<sub>0</sub>) - R(x<sub>0</sub>) is a monotonically decreasing function, which tends to positive infinity when x<sub>0</sub> tends to x<sub>i</sub>+0 and tends to negative infinity when x<sub>0</sub> tends to x<sub>i+1</sub>-0. This means that equation L(x<sub>0</sub>) - R(x<sub>0</sub>) = 0 has exactly one root on the segment [<strong>x</strong>[i], <strong>x</strong>[i+1]], i.e. there's exactly one equilibrium point between each pair of adjacent input points. As usual in cases when we should find the root of a monotonically increasing/decreasing function, binary search can be used to do the job. If you're not familiar with binary search, this <a href="/tc?module=Static&d1=tutorials&d2=binarySearch">tutorial</a> will surely help you to fill in this gap.
</p>
<p>
The most popular error made by contestants was early search termination. Note that you can safely terminate the search either after sufficiently large number of iterations (for example, 100) or when the searched segment length becomes sufficiently small (i.e. less than 1e-9), but not after the value of |L(x<sub>0</sub>) - R(x<sub>0</sub>)| becomes less than 1e-9. For more information regarding this, please check the following <a href="http://forums.topcoder.com/?module=Thread&threadID=625339&start=0">thread</a>.
</p>
<p>
For clean implementation of the described approach, please check the fastest correct <a href="/stat?c=problem_solution&rm=298923&amp;rd=13512&amp;pm=10104&amp;cr=7446789">submission</a> on this problem by <tc-webtag:handle coderId="7446789" context="algorithm"/>.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9868&amp;rd=13528" name="9868">Auxanometer</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9868)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523758" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
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
      41 / 119 (34.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      20 / 41 (48.78%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Kankuro</strong> for 912.51 points (8 mins 58 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      613.08 (for 20 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The natural question one could ask after reading a problem statement is:
&laquo;How many numbers in range [1...10^9] form a non-decreasing sequence of digits?&raquo;
The answer is suprisingly small: there are only 48619 such numbers. The competitors could either believe in this fact
and start coding or calculate this number to be sure. For example, it can be obtained using the following dynamic programming
approach. Let <strong>DP[n][s]</strong> be the number of non-decreasing digit sequences of length <strong>n</strong> with the first digit <strong>s</strong>.
Then <strong>DP[1][1]</strong> = &hellip; = <strong>DP[1][9]</strong> = 1.
<strong>DP[n][s]</strong> can be calculated as the sum of <strong>DP[n-1][k]</strong> for all <strong>k</strong> &ge; <strong>s</strong>. The required number is
the sum of all <strong>DP[n][s]</strong> for 1 &le; <strong>n, s</strong> &le; 9 (the number must contain up to 9 digits and start with any
digit except zero).
</p>
<p>
So, the quantity of &laquo;good&raquo; numbers is small enough and we can generate all of them, for example by the
recursive procedure which takes number <strong>n</strong> with last digit <strong>d</strong> and tries to append it with all digits not
less than <strong>d</strong>. Now we can calculate the answer for the problem during the recursion: check if the current good number
lies on the right scale, calculate the corresponding number on the left scale and check if their concatenation forms a 
non-decreasing digit sequence. See 
<tc-webtag:handle coderId="22696982" context="hs_algorithm"/>'s
<a href="/tc?module=HSProblemSolution&amp;cr=22696982&amp;rd=13528&amp;pm=9868">
solution</a> as a reference to this approach. 
Another way is to generate all &laquo;good&raquo; numbers and put them into set. Now for all &laquo;good&raquo; numbers 
on the left scale we should check if the corresponding number on the right scale also lies in the set and if the last
digit of the left number is not greater than the first digit of the right number. See
<tc-webtag:handle coderId="22652051" context="hs_algorithm"/>'s short and elegant
<a href="/tc?module=HSProblemSolution&amp;cr=22652051&amp;rd=13528&amp;pm=9868">
implementation</a> of this approach.
</p>
<br />


<div class="authorPhoto">
    <img src="/i/m/Alexus_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="22627586" context="algorithm" /><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
