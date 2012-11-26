<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
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
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10077&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506047" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 25</span><br>Wednesday, December 27, 2006
<br><br>

<h2>Match summary</h2> 

The problems in HS SRM 25 seemed to be rather easy, and <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>
submitted all three problems in 15 minutes. <tc-webtag:handle coderId="15604398" context="hs_algorithm"/>
and <tc-webtag:handle coderId="22375930" context="hs_algorithm"/> both finished coding right after <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>, in 16 minutes, and fell into second and third places after the coding phase. The challenge phase didn't bring any changes to the top three,
so <tc-webtag:handle coderId="11972352" context="hs_algorithm"/> won this SRM by a margin of 3.42 points.
 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7276&amp;rd=10077" name="7276">ManyNumbers</a></b> 

</font> 

<A href="Javascript:openProblemRating(7276)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506047" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      139 / 140 (99.29%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      134 / 139 (96.40%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Zuza</b> for 249.87 points (0 mins 39 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      238.81 (for 134 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

We can do this problem as it is written in the problem statement: count A, count B, and return the absolute value of the difference between them.
All the coders who failed to solve this problem returned the difference itself, not the absolute value. Java code follows:
<pre>
   int a=0,b=0;
   for(int i=0;i&lt;numbers.length;i++) if (numbers[i] % K == 0) a += numbers[i]; else b += numbers[i];
   return Math.abs(a-b);
</pre>
<br /><br /> 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6586&amp;rd=10077" name="6586">LuckyFives</a></b> 

</font> 

<A href="Javascript:openProblemRating(6586)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506047" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      66 / 140 (47.14%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      59 / 66 (89.39%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>tomekkulczynski</b> for 493.56 points (3 mins 15 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      366.22 (for 59 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

First, let's count the probability of rolling <b>N</b> dice and getting exactly <b>K</b> fives.
It's the probability of getting <b>K-1</b> fives on <b>N-1</b> dice and a five on the last die
plus the probability of getting <b>K</b> fives on <b>N-1</b> dices and of not getting a five on the last die.
A boundary condition is that we have 0 fives on 0 dices with the probability of 1.
<br />
<br />
Second, count the probability of getting enough fives as a sum of the probabilities of getting five
from <b>1+dice/5</b> to <b>dice</b> fives if rolling <b>dice</b> dice.
<br /><br />
You can see the implementation of this algorithm in <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>'s 
<a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=11972352&rd=10077&pm=6586">solution</a>
<br /><br />


<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7241&amp;rd=10077" name="7241">Staircase</a></b> 

</font> 

<A href="Javascript:openProblemRating(7241)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506047" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      61 / 140 (43.57%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      48 / 61 (78.69%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Zuza</b> for 949.61 points (6 mins 36 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      652.20 (for 48 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

Let's count the minimal number of moves we need to reach <b>N</b>th step.
To get to Nth step, you either stood on the <b>N-1</b>th step and moved up or
stood on some step lower than <b>N</b>th, made some moves down, and then moved up to <b>N</b>th.
Of course, you should check height differences for all moves to be correct.
Also notice that if you can't get to the Nth step, you also can't get to all the higher steps.
You can see it in this Java code: <br />
<pre>
   C[0] = 0;
   for(i=1;i&lt;stairs.length;i++) {
      C[i] = 1000000;
      if (stairs[i] - stairs[i-1] == 1) C[i] = C[i-1]+1;
      for(j=0;j&lt;i;j++) for(k=0;k&lt;j;k++) if ((stairs[i] &lt;= stairs[k] + P[j-k]) && (C[i] &gt; C[j] + j-k+1)) C[i] = C[j] + j-k+1;
      if (C[i] == 1000000) return -1;
   }
   return C[stairs.length-1];
</pre>
In this solution <b>P[i]</b> is <b>2<sup>i</sup></b>.
<br />
<br />
 
<div class="authorPhoto">
    <img src="/i/m/Vedensky_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="9927526" context="algorithm"/><br />    <em>TopCoder Member</em>
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
