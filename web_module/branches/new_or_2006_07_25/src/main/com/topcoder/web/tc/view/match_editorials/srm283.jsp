<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
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
<tc-webtag:forumLink forumID="505797" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 283</span><br>Thursday, January 19, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
In Division 1, the problemset turned out to be really hard,
with nobody being able to solve all 3 problems (only misof, ploh and Petr were able to submit all 3 problems).
Coders who solved 1000 point problem had occupied top 5 places.
<b>rem</b> took the first place with only a little bit more than 150 points
margin from <b>marek.cygan</b>, who finished fifth. <b>misof</b>,
<b>Revenger</b> and <b>ACrush</b> took second, third and fourth places,
respectively.

</p>

<p>
In Division 2, less than 30 coders was able to solve more than 1 problem.
First timers <b>DenRaskovalov</b> and <b>shell</b> took first and second
places and got nice 1906 and 1815 rating points, respectively.
<b>Ice-man</b> took third place an was promoted to the top division.
</p>

<p>
Despite <b>Petr</b>'s 19th place, Russia took the lead in the countries' rating
for the first time ever. It's a fine landmark in the Russian history on TopCoder.
</p> 

<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6003&amp;rd=8080" name="6003">DiagonalDisproportion</a></b> 
</font> 
<A href="Javascript:openProblemRating(6003)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505797" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      380 / 412 (92.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      376 / 380 (98.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>cypressx</b> for 249.61 points (1 mins 7 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      219.05 (for 376 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
Diagonal disproportion of a square matrix can be calculated using the following
expression: <img align="center" src="/i/srm/srm283_1.gif" alt="" border="0" />, where a<sub>i,j</sub> is
an element, located in i'th row and j'th column of the given matrix.
Result of the above expression can be easily computed using the following C++ code:
</p>

<pre>
int getDisproportion(vector &lt;string&gt; a) {
  int ret = 0;
  for (int i = 0; i &lt; a.size(); i++) ret += a[i][i] - a[i][a.size() - 1 - i];
  return ret;
}
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5969&amp;rd=8080" name="5969">PowerSupply</a></b> 
</font> 
<A href="Javascript:openProblemRating(5969)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505797" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
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
      90 / 412 (21.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      18 / 90 (20.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>shell</b> for 497.95 points (13 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      329.00 (for 18 correct submissions) 
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
      216 / 299 (72.24%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      115 / 216 (53.24%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomekkulczynski</b> for 280.17 points (7 mins 40 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      192.11 (for 115 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<div style="float: right; text-align: center; padding: 0px 0px 5px 5px;"><img align="center" src="/i/srm/srm283_2.gif" alt="" border="0" /></div>
<p>It's easy to notice, that we can consider only lines, which are D away from
some consumer-point. So, to solve the problem it's enough to brute
force all possible combinations of a consumer-point, and a line orienation,
compute the answer for each such combination and choose the best.
To compute the answer for particular combination we need to calculate
how many consumer-points are located not farther than 2*D from the line,
drawn through the chosen point with the chosen angle. Here we need to consider
only points, located on the same side of the line.
But how to determine a distance between point and a line, where line can
be diagonal? To solve this sub problem we may compute the
distances from each point to each of 4 axes, shown on figure 1. Having this
values computed, we can easily determine a distance between any two points
in rotated coordinate system.
</p>
<p>
Notice that distances from lines L<sub>1</sub> and L<sub>2</sub> may be
squared to receive an integer values. C++ code follows:
</p>

<pre>
int solve(vector &lt;int&gt; a, long long D) {
  int ret = 0;
  sort(a.begin(), a.end());
  for (int i = 0; i &lt; a.size(); i++) {
    for (int j = i + 1; j &lt; a.size(); j++)
      if ((long long)(a[j] - a[i]) * (a[j] - a[i]) &gt; D) break;
    ret = max(ret, j - i);
  }
  return ret;
}
int maxProfit(vector &lt;int&gt; x, vector &lt;int&gt; y, int D) {
  int ret = 0, n = x.size();
  vector &lt;int&gt; a2(n), a4(n);
  long long hvD = (long long) D * D * 4;
  long long diagD = hvD * 2;
  vector &lt;int&gt; a1 = x;
  for (int i = 0; i &lt; n; i++) a2[i] = x[i] + y[i];
  vector &lt;int&gt; a3 = y;
  for (int i = 0; i &lt; n; i++) a4[i] = x[i] - y[i];
  ret = max (ret, solve (a1, hvD));
  ret = max (ret, solve (a2, diagD));
  ret = max (ret, solve (a3, hvD));
  ret = max (ret, solve (a4, diagD));
  return ret;
}

</pre>

<p>
See
<a href="/tc?module=MemberProfile&cr=13366203">
myprasanna</a>'s
<a href="/stat?c=problem_solution&rm=247371&rd=8080&pm=5969&cr=13366203">
code</a> as an example of short and elegant solution. It can be easily modified
to operate with integer numbers.
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5963&amp;rd=8080" name="5963">FactorialGCD</a></b> 
</font> 
<A href="Javascript:openProblemRating(5963)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505797" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      171 / 412 (41.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 171 (7.02%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ice-man</b> for 988.92 points (3 mins 0 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      642.44 (for 12 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 

<p>
Let P<sub>a!</sub> be a multiset of primes in prime-decomposition of a! and
P<sub>b</sub> be the same thing for b. For example, if a=4 (a!=4!=24)
and b=150, then P<sub>a!</sub> = {2,2,2,3} and P<sub>b</sub> = {2,3,5,5}.
What is the GCD(a!,b)? GCD(a!,b) is a product of all elements of
P<sub>GCD(a!,b)</sub>. And P<sub>GCD(a!,b)</sub> is the intersection
of P<sub>a!</sub> and P<sub>b</sub>. But how can we find this intersection
quick enough? Let's factorize number b on primes. Imagine we found that
b n<sub>i</sub> times divides on some prime p<sub>i</sub>. Now we need to
find out how many times number a! divides on p<sub>i</sub>. How to do it?
As we know, a! = 1*2*...*(a-1)*a. Every number, that can be divided on
p<sub>i</sub> can be represented as k*p<sub>i</sub>. a! contains only positive
multipliers, so we may brute force k starting from 1. Let j = k*p<sub>i</sub>.
For each j we need to realize how many times it can be divided on p<sub>i</sub>.
In such manner we can calculate how many times a! divides on p<sub>i</sub>

(let's call this value m<sub>i</sub>). We may stop this calculation as soon
as m<sub>i</sub> becomes greater or equal to n<sub>i</sub>.
This is a clean C++ implementation of the described algorithm:
</p>

<pre>
int factGCD (int a, int b) {
    int ret = 1;
    for (int p = 2; (long long) p * p &lt;= b; p++) if (b % p == 0) {
  int d1 = 0;
        for (; b % p == 0; d1++) b /= p;
  int n = a, d2 = 0;
  /// Another way to calculate how much time p divides (a!)
  while (n > 0) d2 += (n /= p); 
  for (int i = 0; i < min(d1, d2); i++) ret *= p;
    }
    if (b != 1) if (b &lt;= a) ret *= b;
    return ret;
}
</pre>

<p>
Pay attention to 
<a href="/tc?module=MemberProfile&cr=20280511">
Ice-man</a>'s elegant
<a href="/stat?c=problem_solution&rm=247385&rd=8080&pm=5963&cr=20280511">
solution</a>.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5961&amp;rd=8080" name="5961">FactorialTower</a></b> 
</font> 
<A href="Javascript:openProblemRating(5961)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505797" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      34 / 299 (11.37%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      9 / 34 (26.47%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ploh</b> for 359.97 points (27 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      283.47 (for 9 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
Let's simplify the problem: let's compute the following expression:
<i>n!<sup>v</sup> mod m</i>. At the first step we need to find <i>n! mod m</i>.
How can we done it if 0 &le; n &le; 2147483647 and 1 &le; m &le; 40000? Notice, that
if n &ge; m, then <i>n! mod m = 0</i>. And if n &lt; m we can find <i>n! mod m</i>

iteratively in no more than 40000 operations. C++ code follows:
</p>

<pre>
// pay attention to the tricky case 0! mod 1 = 0
int u = 1 % m; 
if (n &gt;= m ) u = 0;
else for (int i = 2; i &lt;= n; i++) u = (u * i) % m;
</pre>

<p>
Thus, we have <i>u = n! mod m</i>. Now we need to find <i>u<sup>v</sup> mod m</i>.
Notice, that value of <i>u<sup>i</sup> mod m</i> will be in range [0, m - 1] for any
non-negative integer i. Imagine we are iterating i starting from 0. We'll
receive following values: <i>u<sup>0</sup> mod m</i>, <i>u<sup>1</sup> mod m</i>,
and so on. According to the pigeonhole principle, one of the values will repeat in no more than (m + 1)
iterations. Consider the following example. Let u = 2, m = 56. The first 7 iterations are shown in the table:

</p>

<table align="center" border="1" cellpadding="5" cellspacing="0">
<tr>
<td width=60>i</td>
<td width=20>0</td>
<td width=20>1</td>
<td width=20>2</td>
<td width=20>3</td>
<td width=20>4</td>
<td width=20>5</td>

<td width=20>6</td>
</tr>
<tr>
<td>u<sup>i</sup> mod m</td>
<td>1</td>
<td>2</td>
<td>4</td>
<td>8</td>

<td>16</td>
<td>32</td>
<td>8</td>
</tr>
</table>

<p>
Here we have a cycle {8,16,32} and a precycle {1,2,4}. How it can help us
to calculate <i>u<sup>v</sup> mod m</i>? Let the length of the cycle be L, and length
of precycle be P. Notice, that if v &le; P, then we can just take the value
from our table for i = v. In the other case, v falls in the cycle, and we are
interested in v mod L only. As soon as <i>v mod L</i> will have been calculated, we
should just take the value from our table for

<i>i = P + ( L + v mod L - P mod L ) mod L</i>. Thus, we reduced the
"<i>n! mod m = ?</i>" problem to the "<i>v mod L = ?</i>" problem.
</p>

<p>
Let's go back to the original problem. Here we want to calculate
<i>(a<sub>0</sub>!^a<sub>1</sub>!^...^a<sub>n-1</sub>!) mod m</i>.
Let <i>a<sub>1</sub>!^...^a<sub>n-1</sub>! = v</i>. So, we have the problem
that had just been discussed. "<i>a<sub>0</sub>! <sup>v</sup> mod m = ?</i>"
problem can be reduced to "<i>v mod L = ?</i>" problem.

<i>v = a<sub>1</sub>!^...^a<sub>n-1</sub>!</i>, so we can solve
"<i>a<sub>1</sub>!^...^a<sub>n-1</sub>! mod L</i>" problem in the same manner.
</p>

<p>
Many coders has troubles determining if
<i>(a<sub>i+1</sub>!^a<sub>i+2</sub>!^...^a<sub>n-1</sub>!)</i>

falls in a precycle or in a cycle when calculating the i'th stage of the tower.
Idea is quite simple. Notice, that P (the precycle's length) certianly
can't be greater than m. So, we can iteratively calculate
<i>(a<sub>i+1</sub>!^a<sub>i+2</sub>!^...^a<sub>n-1</sub>!)</i>,
and as soon as it reachs 40000, we can stop iterating.
So, if <i>(a<sub>i+1</sub>!^a<sub>i+2</sub>!^...^a<sub>n-1</sub>!)</i> &ge; 40000,
we can be sure, that it falls into a cycle, but not precycle.
We can use the following C++ code to precalculate neccessary values:

</p>

<pre>
vector &lt;int&gt; a; // original vector a
int prec[51];

void precalc(void) {
  prec[n] = 1;
  // going through a tower from top to bottom
  for (int i = a.size() - 1; i &gt;= 0; i--) { 
                r = 1;
                // calculating a[i]!
                for (int j = 2; j &lt;= a[i] && r &lt; 40000; j++) r *= j; 
                // raising a[i]! to the a[i+1]! degree
                if (r &gt; 1) { 
                  prec[i] = 1;
      for (int j = 0; j &lt; prec[i+1] && prec[i] &lt; 40000; j++) prec[i] *= r;
    } else prec[i] = r;
  }
}

</pre>

<p>
<a href="/tc?module=MemberProfile&cr=308953">
MikeMirzayanov</a> used somewhat another approach to solve this problem.
He didn't find a cycles iteratively in his
<a href="/stat?c=problem_solution&rm=247371&rd=8080&pm=5961&cr=308953">
solution</a>.
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5966&amp;rd=8080" name="5966">SuspiciousStrings</a></b> 
</font> 
<A href="Javascript:openProblemRating(5966)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505797" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      9 / 299 (3.01%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      5 / 9 (55.56%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>rem</b> for 565.80 points (30 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      522.38 (for 5 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
You was asked to find out how many strings of length n, composed only from
lowercase letters, contains any strings from given set as substrings.
For low n's this problem can be solved by dynamic programming. For each
particular length from 1 to n we need to compute by how many ways we can reach
each particaular state. Only difficulty is to realize what to be a states.
Let we have only one string in the set. Let this string be "topcoder" and n=10.
For length 2 there are 26*26 possible strings, but do we really interested that
one of them is "ab", another is "xy" and so on? Because only substring that
we are interested in is "topcoder", we only need to whatch for substring, which
are a prefixes of "topcoder". So, all 26*26 string of length 2 divides in
3 categories: 1) "to" (prefix of length 2); 2) "t" (prefix of length 1);
3) all other (we can say that it's a prefix of length 0). So, if there is only
one string in the set, state is a length of prefix of this string, which is
equal to the suffix of the current part (first i characters) of the main string.
In case of multiple strings in the set, we need to remember all possible
prefixes of each of this stings. One important thing we need to not forget
is that suffix of some prefix of one string may be equal to some prefix of
another string. Example: set = {"topcoder","cost"}. Suffix "co" of "topco"
(wich is a prefix of first string in the set) is equal to the prefix "co" of
the second string. Each state, which describes a prefix, with a length equal
to the length the string, would lead to to itself. In such way, in the end
of our dynamic programing, answer for the problem would be a sum of values
in all such states. Let impementation of states' manipulation be an exercise
for you.
</p>

<p>
And now let's go back to our problem. Here n can be up to 2^31-1.
So, dynamic programming, described above, doesn't give us enough quickness.
Let's have a look on what happens on each step of our dynamic programming
algorithm. Here on each step (remind, that step is a current length of main
string) we are computing by how many ways we can reach every state. We are
doing it using similar data from the previous step. At first, let's notice,
that this "data" is a vector with length equal to the amount of possible
different states. This length, in the worst case, can be up to 101 (last
sample in problem statement is a such worst case). Let's call this vector
as "states vector". Here we need to notice, that if we mark all elements of
states vector as x's (x<sub>0</sub>,x<sub>1</sub>,x<sub>2</sub> and so on),
then each element of the new states vector will look like weighted sum of
all elements of the previous states vector. So, we can build a matrix, and
then, on each step, we need to just multiply previous states vector on this
matrix to archive a new states vector. I think, that construction of this matrix
is not a serious problem for topcoders, who are familiar with dynamic
programming. Because we are multuplying current states vector on the same
matrix on each step, the resulting states vector for n'th step can be archieved
by multiplication initial vector (all elements of this vector must be zeroes,
except for element, corresponding to the "zero prefix" state, which must be 1)
on the described matrix raised in degree n. Last thing that we need to
realize in order to solve the problem is that we may raise a matrix in degree n
with O(log(n)) complexity. This algorithm is well known, and had been used in
several problems on TopCoder. For example, see discussion of the Div 1 Hard
problem in
<a href="/tc?module=Static&d1=match_editorials&d2=srm274">
this editorial</a>. And don't forget to take every value, you've computed,
modulo 10000.

</p>

<p>
<a href="/tc?module=MemberProfile&cr=2058177">Revenger</a>
used a 
<a href="http://www.nist.gov/dads/HTML/trie.html">
trie</a> to build a matrix. His
<a href="/stat?c=problem_solution&rm=247370&rd=8080&pm=5966&cr=2058177">
solution</a>
is an example of very clear impementation.
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
