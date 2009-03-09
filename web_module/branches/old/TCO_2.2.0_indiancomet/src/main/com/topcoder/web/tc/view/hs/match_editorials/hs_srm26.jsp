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
    <A href="/tc?module=HSRoundOverview&rd=10650&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506221" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 26</span><br>Wednesday, January 3, 2007
<br><br>

<h2>Match summary</h2> 
 
What do school boys and girls do during the winter holidays?
That's right, they compete in TopCoder High School SRMs! More than 200 competitors took part in HS SRM 26, with 
<tc-webtag:handle coderId="11972352" context="hs_algorithm"/> winning the match with
a comfortable lead. <tc-webtag:handle coderId="22652634" context="hs_algorithm"/> finished second and <tc-webtag:handle coderId="19931322" context="hs_algorithm"/>
rounded out the top three.

<br />
<br />
 
<H1> 
The Problems 
</H1>
</p> 
 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6745&amp;rd=10650" name="6745">ThirdBuyDiscount</a></b> 
</font> 
<A href="Javascript:openProblemRating(6745)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506221" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      191 / 212 (90.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      164 / 191 (85.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>fpavetic</b> for 248.31 points (2 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      209.83 (for 164 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

It should be easy to see that putting the most expensive items into the discount
positions (positions with indices divisible by 3) is the optimal strategy.
Accordingly, just sort the items by the price, and apply the discount for the <i>n / 3</i>
most expensive ones, with <i>n</i> representing the number of the items.
<br />
<br />
Java code follows:

<pre>
public static double minCost(int[] prices, int discount) {
	double ret, k;
	int n, i, j;
	n = prices.length;
	ret = 0;
	k = 0.01 * (100 - discount);
	Arrays.sort(prices);
	for (i = 0; i < n; i++)
		if (i < n / 3) ret += k * prices[n - 1 - i];
		else ret += prices[n - 1 - i];
	return ret;
}
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7321&amp;rd=10650" name="7321">CompressedString</a></b> 
</font> 
<A href="Javascript:openProblemRating(7321)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506221" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      144 / 212 (67.92%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      78 / 144 (54.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Burunduk3</b> for 491.91 points (3 mins 39 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      369.09 (for 78 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

There is a straightforward recursive solution for this problem.
If the first character of <i>s</i> is a digit and the second is the
opening paranthesis, then find the corresponding closing paranthesis --
the answer is equal to the answer for the substring  enclosed by the 
parantheses, multiplied by the value of the first digit, plus the answer for
the remaining part of <i>s</i> (from the position immediately after the
closing paranthesis until the end of the string). In the other case, the
answer is equal to the answer for the same string without the first character
plus 1.
<br />
<br />
Java code follows:

<pre>
public int getLength(String s) {
	if (s.length() <= 1) return s.length();
	if (s.charAt(1) != '(') return 1 + getLength(s.substring(1));
	int left = 2, n = 2, stack = 1;
	for (int a = left; a < s.length(); a++) {
		if (s.charAt(a) == ')') stack--;
		if (s.charAt(a) == '(') stack++;
		if (stack == 0) {
			n = a;
			break;
		}
	} return (s.charAt(0)-'0')*getLength(s.substring(2,n))+getLength(s.substring(n+1));
}
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6744&amp;rd=10650" name="6744">CoolNumbers</a></b> 
</font> 
<A href="Javascript:openProblemRating(6744)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506221" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      24 / 212 (11.32%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 24 (50.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Zuza</b> for 791.81 points (15 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      523.36 (for 12 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Suppose, we have a function <i>f(x)</i> that returns the number of cool
numbers between 0 and <i>x</i>, inclusive. The answer for the problem
is equal to <i>f(upperBound) - f(lowerBound - 1)</i>. Function <i>f(x)</i>
uses dynamic programming. Let's introduce a function
<i>doit(int step, int last, int len, int match, int done)</i>. This goes through
the binary representation of <i>x</i> from left to right, constructing a number,
and returns the number of the cool numbers that has a constructed prefix.
Here <i>step</i> is the number of the remaining digits,
<i>last</i> is a value of the previous digit,
<i>len</i> is a number of the last consequtive equal digits,
<i>match</i> indicates whether the constructed prefix is equal to the
corresponding prefix of <i>x</i>, and <i>done</i> indicates whether the constructed prefix contains a group of three
consecutive ones or zeroes (i.e. whether the constructing number is already cool).
<br />
<br />
Java code follows:

<pre>
static int memo[][][][][] = new int[33][2][4][2][2];
static int s[] = new int[33];
static int n;

public static int doit(int step, int last, int len, int match, int done) {
	int ret, i;
	if (len > 3) len = 3;
	if (len == 3) done = 1;
	if (step < 0) return done;
	if (memo[step][last][len][match][done] >= 0) return memo[step][last][len][match][done];
	ret = 0;
	for (i = 0; i < 2; i++) if (match == 0 || i <= s[step]) {
		if (i == last) {
			if (match == 1 && i == s[step]) ret += doit(step - 1, i, len + 1, 1, done);
			else ret += doit(step - 1, i, len + 1, 0, done);
		}
		else {
			if (match == 1 && i == s[step]) ret += doit(step - 1, i, 1, 1, done);
			else ret += doit(step - 1, i, 1, 0, done);
		}
	}
	return memo[step][last][len][match][done] = ret;
}

public static int f(int x) {
	int ret, i, j, k, y, z;
	if (x < 0) return 0;
	... // fill the array memo by -1
	for (z = x, n = 0; z != 0; z >>= 1) s[n++] = z & 1; // s now contains a binary representation of x
	ret = doit(n - 2, s[n - 1], 1, 1, 0); // count all cool nubers with the same number of digits (in binary) as s
	for (i = n - 2; i > 0; i--) ret += doit(i - 1, 1, 1, 0, 0); // count all other cool numbers less than x
	return ret;
}
	
public static int count(int lowerBound, int upperBound) {
	return f(upperBound) - f(lowerBound - 1);
}
</pre>
<br />
<br />
 
<div class="authorPhoto">
    <img src="/i/m/gevak_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7340263" context="algorithm"/><br />    <em>TopCoder Member</em>
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
