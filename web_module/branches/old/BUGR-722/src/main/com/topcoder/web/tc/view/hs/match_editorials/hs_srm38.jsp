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
    <A href="/tc?module=HSRoundOverview&rd=10779&snid=2&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="516564" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 38</span><br>Tuesday, September 4, 2007
<br><br>

<h2>Match summary</h2> 

<p> The match started quickly, and after only a few minutes there were coders who had 
  the easy problem and the medium problem done. The problems were pretty easy for 
  most of the coders, but the 1000 problem was fair. <tc-webtag:handle coderId="20812309" 
  context="hs_algorithm"/> won the match with the fastest time on the 
  medium and hard problems (<tc-webtag:handle coderId="22627975" context="hs_algorithm"/> 
  had the fastest time on the easy problem). One more successful challenge would've 
  brought <tc-webtag:handle coderId="22663117" context="hs_algorithm"/> 
  into first position, but he ended up in second. Third place went to <tc-webtag:handle 
  coderId="22653715" context="hs_algorithm"/>.</p>
<H1> 

The Problems 

</H1>

</p> 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8094&amp;rd=10779" name="8094" onClick="return (false);">JoshString</a></b> 

</font> 

<A href="Javascript:openProblemRating(8094)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516564" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      47 / 48 (97.92%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      31 / 47 (65.96%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Quelloquialism</b> for 248.99 points (1 mins 48 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      231.18 (for 31 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p> This was a pretty easy task. The solution was to find the required sum and 
  then check if it's a prime number or not. For every letter you had to add (letter 
  - 'a' + 1). Here is the code:</p>
<pre>
 int value = 0;
  for (int i = 0; i < s.length(); ++i) value += s.charAt(i)-'a'+1;
  if (checkPrime(value)==1) return "YES";
  return "NO";
</pre>
<p>Where checkPrime is the function that checks if a number is prime or not. To 
  check if a number is prime, it was up to the coder. Here is a code for it:</p>
<pre> int checkPrime(int value) {
  if (value == 2) return 1;
  if (value%2 == 0) return 0;
  for (int i = 3; i*i &lt;= value; ++i) if (value%i == 0) return 0;
  return 1;
  };</pre>
<p>A few people failed or got challenged because they returned 2 as being a non-prime 
  number. </p>
<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8070&amp;rd=10779" name="8070" onClick="return (false);">JoshSum</a></b> 

</font> 

<A href="Javascript:openProblemRating(8070)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516564" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      40 / 48 (83.33%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      36 / 40 (90.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ahyangyi</b> for 498.97 points (1 mins 17 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      429.16 (for 36 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p> This was a pretty easy task for almost every one. If you were used to Fibonacci 
  series you could code it quickly and get a good score on it, as <tc-webtag:handle 
  coderId="20812309" context="hs_algorithm"/> did. The 
  solution was straightforward: find the n-th term of Fibonacci series modulo 10. Here 
  is the code:</p>
<pre>int a1 = 0, a2 = 1;
  int ret = 0;
  for (int i = 1; i &lt;= n; ++i) {
  int aux = 0;
  ret+=a2;
  aux = a2; a2 = (a2 + a1)%10; a1 = aux; 
  }
  return ret;</pre>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8136&amp;rd=10779" name="8136" onClick="return (false);">GrandpaField</a></b> 

</font> 

<A href="Javascript:openProblemRating(8136)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516564" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      17 / 48 (35.42%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      9 / 17 (52.94%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ahyangyi</b> for 805.36 points (14 mins 43 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      565.47 (for 9 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>The solution intended has the complexity O(N^2 * F^2). The brute force approach wouldn't 
  pass the system test. The section chosen had to contain at most 2 types of 
  fruit. If you choose 2 type of fruits, let's say f1 and f2, then the problem 
  changes to: What is the biggest square section that contain only fruits of type 
  f1 and f2? The brute force for this would  TLE, so a good solution was one based 
  on Dynamic Programming.</p>
<p> Let's define DP[i][j][f1][f2] = the biggest square with 
    down-right corner at (i, j) that contain only fruits of type f1 and f2. The 
    recurrence was easy. If at (i, j) the fruit is not of type f1 nor f2 then DP[i][j][f1][f2] 
    = 0, else DP[i][j][f1][f2] = 1 + min(DP[i-1][j][f1][f2], DP[i][j-1][f1][f2], 
    DP[i-1][j-1][f1][f2]). If you don't understand why this is true, I suggest that you take a piece of paper and see it on an example. During the match <tc-webtag:handle 
  coderId="22663117" context="hs_algorithm"/> took another 
    approach and solved it with a binary search; you can take a look at his solution 
    too. Here is the code for the intended solution:</p>
<pre>int best = 0; //here will be the solution
  //choose 2 fruits
  for (int f1 = 1; f1 &lt; 7; ++f1)
  for (int f2 = f1 + 1; f2 &lt;= 7; ++f2) {
  //solve for f1 and f2
  int bestLocal = 0;
  int[][] dp = new int[N+2][N+2];
  for (i = 0; i &lt;= N; ++i) dp[i][0] = dp[0][i] = 0;
  
  for (i = 1; i &lt;= N; ++i) 
  for (j = 1; j &lt;= N; ++j) if (field[i][j] == f1 || field[i][j] == f2) {
  dp[i][j] = 1 + min(dp[i-1][j], min(dp[i][j-1], dp[i-1][j-1]));
  if (dp[i][j] &gt; bestLocal) {bestLocal = dp[i][j]; }
  
  }
  
  if (bestLocal &gt; best) best = bestLocal; 
  }
  return best*best;
  } </pre>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/vlad_D_big5.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="13298470" context="algorithm"/><br />    <em>TopCoder Member</em>
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
