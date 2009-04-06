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
<tc-webtag:forumLink forumID="505986" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 311</span><br>Wednesday, July 12, 2006
<br><br>

<span class="bigTitle">Match summary</span>
 

<p> 
In Division 1, competitiors discovered the Easy and Medium problems to be easier than expected. Several coders solved them both in about
10-15 minutes. On the contrary, the Hard problem clearly justified its 1000 points. Only 23 of 64 submits were successful.
Two Moscow guys, <tc-webtag:handle coderId="14970299" context="algorithm"/> (who placed second) and
<tc-webtag:handle coderId="10574855" context="algorithm"/> (who came in third), were overtaken by
<tc-webtag:handle coderId="8357090" context="algorithm"/> like the Russian football team was bested by team Slovakia on the road to the FIFA World Cup 2006.
<br>
<br>
In Division 2, newcomer
<tc-webtag:handle coderId="22505836" context="algorithm"/> took 1904 rating points as a reward for a shining debut.
Second and third went to <tc-webtag:handle coderId="20111993" context="algorithm"/> and
<tc-webtag:handle coderId="15992135" context="algorithm"/>, respectively.
</p> 

 

<H1> 

The Problems 

</H1>


<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6558&amp;rd=9991" name="6558">EscapeFromRectangle</a></b> 

</font> 

<A href="Javascript:openProblemRating(6558)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505986" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      406 / 426 (95.31%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      393 / 406 (96.80%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>mahbub</b> for 249.52 points (1 mins 15 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      230.84 (for 393 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
As we know from the school geometry, the shortest route between two points is a
straight line. So, we need to try to go straight to each of the four rectangle's
boundaries and choose the best.<br><br>
Java code follows:
<pre>
public int shortest(int x, int y, int w, int h) {
   return Math.min(x, Math.min(y, Math.min(w - x, h - y)));
}
</pre>
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6533&amp;rd=9991" name="6533">MatchNumbersEasy</a></b> 

</font> 

<A href="Javascript:openProblemRating(6533)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505986" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      168 / 426 (39.44%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      46 / 168 (27.38%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>nonethis</b> for 397.94 points (15 mins 13 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      260.91 (for 46 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
In contrast to the Div1Hard, this problem could be solved using dynamic
programming. So, I'll describe this approach here. Greedy approach is described
in the Div1Hard section.<br><br>

DP function returns the maximal number which can be created from <b>n</b>
matches for the given <b>n</b>. It iterates over all digits that can be created
using at most <b>n</b> matches, trying to lay out the next digit, remove the used matches and
recursively calling itself to determine the maximal number that can be created
using the rest of the matches. Then it chooses the best solution. To avoid
troubles that can be caused by a zero digit, one may implement the named function
in such a way that it creates the number from right to left, i.e. from the
least significant digit to the most significant digit. Alternatively Java
coders may use the BigInteger class.
<br>
<br>
<tc-webtag:handle coderId="251317" context="algorithm"/>'s solution in Java follows:
<pre>
public class MatchNumbersEasy {
   BigInteger[] cache = new BigInteger[500];
   BigInteger solve(int[] m, int n) {
   if (cache[n] != null) return cache[n];
   BigInteger best = BigInteger.ZERO, ten = BigInteger.valueOf(10);
   for (int a = 0; a < m.length; a++) if (m[a] <= n)
      best = best.max(ten.multiply(solve(m, n - m[a])).add(BigInteger.valueOf(a)));
   return cache[n] = best;
}
</pre>
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6431&amp;rd=9991" name="6431">MatrixTransforming</a></b> 

</font> 

<A href="Javascript:openProblemRating(6431)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505986" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      56 / 426 (13.15%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      30 / 56 (53.57%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>N.M.Hieu</b> for 927.90 points (8 mins 2 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      709.35 (for 30 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 

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

      260 / 337 (77.15%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      213 / 260 (81.92%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>tmyklebu</b> for 298.12 points (2 mins 15 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      254.73 (for 213 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Let's go through the cells of the matrix <b>a</b> in the row major order,
i.e. from the top to the bottom and from the left to the right.
First cell that we will meet is the cell in the top-left corner.
The only way to change its value is to flip the 3 x 3 consecutive submatrix,
located in the top-left corner (its center is
located one cell to the right and one cell down from the named cell).
So, if the corner cell's value is equal to the value of the corresponding cell of
matrix <b>b</b>, we can't flip the named submatrix -- in the other case, we
must flip it. Next cell that we will meet is managed by two flipable
submatrices (if the given matrices have at least four columns, of course)
one of which is already used (meaning that we have already
decided wheter to flip it or not). So, we have only one variant again.
Acting according to the described algorithm we will make the invariant
consequence of flips. Once all necessary flips were made, we only need to
check whether the resulting matrix is equal to the matrix <b>b</b>.
Needless to say, flipping the same submatrix more than once is a not a good idea.<br>
<br>

Java code follows:
<pre>
static int[][] g;
static void push(int r, int c) {
   int i, j;
   for (i = r - 1; i < r + 2; i++) for (j = c - 1; j < c + 2; j++) g[i][j] ^= 1;
}
public int minPushes(String[] a, String[] b) {
   int ret, n, m, i, j;
   n = a.length;
   m = a[0].length();
   ret = 0;
   g = new int[n][m];
   for (i = 0; i < n; i++) for (j = 0; j < m; j++) g[i][j] = a[i].charAt(j) - '0'; 
   for (i = 0; i < n - 2; i++) for (j = 0; j < m - 2; j++)
      if (g[i][j] != b[i].charAt(j) - '0') {
         push(i + 1, j + 1);
         ret++;
      }
   for (i = 0; i < n; i++) for (j = 0; j < m; j++)
      if (g[i][j] != b[i].charAt(j) - '0') return -1;
   return ret;
}
</pre>
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6430&amp;rd=9991" name="6430">SumThemAll</a></b> 

</font> 

<A href="Javascript:openProblemRating(6430)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505986" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 

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

      209 / 337 (62.02%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      176 / 209 (84.21%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>misof</b> for 586.29 points (4 mins 21 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      374.31 (for 176 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This one can be solved using different methods. I'll describe the DP approach.
Suppose we have a function <b>long f(int x)</b>, which returns the sum of all
the digits of all the numbers between <b>0</b> and <b>x - 1</b>, inclusive.
Then the answer for the problem is <b>f(upperBound + 1) - f(lowerBound)</b>.
In order to implement the named funtion we need to fill the array <b>long dp[10][11]</b>.
<b>dp[i][j]</b> contains the sum of all the digits of all the numbers, which
have <b>j</b> significant digits and their first (most significant) digit is <b>i</b>.
Let me describe how the function <b>long f(int x)</b> works. It goes through the number <b>x</b>
from its most significant digit to its least sigificant digit.
Suppose <b>x = 527</b>. First treatened digit is digit '5'. <b>dp[3][4]</b>
must be added to the return value (which is intially equal to zero).
Then we go to the digit '2'. Now we only consider the numbers from 500 to 526, inclusive
(527 is not included according to the function's declaration).
So we need to add to the return value the sum of all the digits from 0 to 26, inclusive,
plus 5 (the first digit) multiplied by the amount of numbers between 0 and 26, inclusive.
Interval [0, 27) is treatened in the same manner. We accumulate the previously treatened
digits and add their sum (multiplied by the amount of numbers in the remaining interval)
to the return.<br>
<br>

Java code follows:
<pre>
public class SumThemAll {
   
   static long dp[][] = new long[10][11];

   long f(int x) {
      String s;
      long ret, z;
      int i, j, k, y;

      // Variable z serves to store the amount of numbers,
      // which contains a particular number of digits.
      // Variable y serves to store the sum
      // of all currently treatened digits of x

      s = Integer.valueOf(x).toString();
      z = 1;
      for (j = 1; j < s.length(); j++) z *= 10;
      ret = 0;
      y = 0;
      for (j = 0; j < s.length(); j++) {
         k = s.charAt(j) - '0';
         for (i = 0; i < k; i++) ret += dp[i][s.length() - j] + y * z;
         y += k;     // Add just treatend digit to y
         z /= 10;
      }
      return ret;
   }
   
   public long getSum(int lowerBound, int upperBound) {
      long k;
      int i, j;
      for (i = 0; i < 10; i++) dp[i][0] = 0;
      k = 1;
      for (j = 1; j < 11; j++) {
         dp[0][j] = 0;
         for (i = 0; i < 10; i++) dp[0][j] += dp[i][j - 1];  
         // dp[0][j] contains the sum of all the numbers,
         // which have less than j digits
         // (like they can be precedeed with extra leading zero(s))
         for (i = 0; i < 10; i++) dp[i][j] = dp[0][j] + k * i;
         k *= 10;
      }
      return f(upperBound + 1) - f(lowerBound);
   }
</pre>
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6591&amp;rd=9991" name="6591">MatchNumbersHard</a></b> 

</font> 

<A href="Javascript:openProblemRating(6591)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505986" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      64 / 337 (18.99%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      23 / 64 (35.94%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>misof</b> for 734.19 points (18 mins 33 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      507.77 (for 23 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
If Div2Medium can be solved using DP, this one requires a greedy approach.
First of all, let's take care of two corner cases. First of them is the
case when no digit can be created at all and the second is when the only
digit that can be created is zero. After these cases have been properly treated,
the general part begins to work.<br>
<br>

First we need to find the digit, which requires the minimal amount of matches.
In the case of a tie, choose the maximal digit. Imagine that we created
as much such digits as possible. Let <b>num</b> = this digit, <b>len = n / num</b>
and <b>rem = n % num</b>. So, we have this digit into <b>num</b>, amount of such
digits, that can be created into <b>len</b> and the amount of the remaining matches
into <b>rem</b>. Now we possibly have to treat the corner case <b>num = 0</b>.
In this case it can be necessary to remove several zeros to create some non-zero
digit. <br>
<br>
This subproblem can be solved in the following way: find the minimal
amount of matches necessary to create any non-zero digit, calculate how many zeros
should be removed in order to create the "cheapest" non-zero digit, then find the
maximal digit that can be created using the amount of matches that we will have
after this removal and lie out this digit as the most significant digit of the
resulting number. <br>
<br>
After treating this zero-case, the main algorithm begins to work.
Going through the resulting number from left to right, it tries to change the next
digit to the most allowed digit, i.e. the digit that can be created using the current
<b>rem</b> plus the amount of matches needed to create the digit which it currently
treats. If at some step we can't "upgrade" the digit or <b>len</b> becomes equal to zero,
it points that the job is done.
</p>
</p><div class="authorPhoto">
    <img src="/i/m/gevak_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="7340263" context="algorithm"/><br />
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
