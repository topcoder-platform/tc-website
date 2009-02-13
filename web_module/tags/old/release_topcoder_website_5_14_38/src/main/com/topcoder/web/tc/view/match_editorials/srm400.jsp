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
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&amp;er=5&amp;rd=12172">Match Overview</A><br />
    <tc-webtag:forumLink forumID="521020" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 400</span><br />Thursday, May 1, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
1400 coders participated in the memorable 400-th SRM which was a rather turbulent one.
</p>
<p>
In division one, problems are not hard at first glance,
but solving them correctly is anything but easy.
This property of the set leads to the high submission rate and the low success rate.
<tc-webtag:handle coderId="10574855" context="algorithm"/> won the match as the only coder who solved all problems correctly.
Before the challenge phase, he was in 90th place.
Nevertheless, after the system test, he reached first place.
He hit a new record high of the rating 3857 as a result of this match.
<tc-webtag:handle coderId="19849563" context="algorithm"/> and <tc-webtag:handle coderId="20036294" context="algorithm"/> took second and third place respectively by solving Easy and Medium fast and
getting many points in the challenge phase.
I also congratulate
<tc-webtag:handle coderId="22652597" context="algorithm"/> as another coder who solved Hard correctly other than <tc-webtag:handle coderId="10574855" context="algorithm"/>.
</p>
<p>
In division two, Easy in an easy problem ineed but Medium and Hard were rather hard;
the low submission rate and the low success rate.
<tc-webtag:handle coderId="22672953" context="algorithm"/> was the only coder who solved all problems and took first place.
<tc-webtag:handle coderId="22674650" context="algorithm"/> and <tc-webtag:handle coderId="22658883" context="algorithm"/> follow by solving Easy and Hard correctly.
</p>

<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8753&amp;rd=12172" name="8753">GrabbingTaxi</a></b> 
</font> 
<A href="Javascript:openProblemRating(8753)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521020" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      686 / 789 (86.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      582 / 686 (84.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>jackson.liao31</b> for 249.76 points (0 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      204.99 (for 582 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem is a simple one. Let n be the number of taxi stands.
There are (n + 1) ways to go to the goal;
you may walk to the goal directly or walk to the i-th taxi stand and go to the goal by taxi from
the stand (1 &le; i &le; n).
Your task is to find one which requires the minimum length of time by
a simple iteration.
You can see the fastest
<a href="/stat?c=problem_solution&cr=22695552&rd=12172&pm=8753">solution</a>
by <tc-webtag:handle coderId="22695552" context="algorithm"/> for reference.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8763&amp;rd=12172" name="8763">StrongPrimePower</a></b> 
</font> 
<A href="Javascript:openProblemRating(8763)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521020" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      284 / 789 (35.99%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      41 / 284 (14.44%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>YUMEN</b> for 443.92 points (10 mins 22 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      290.09 (for 41 correct submissions) 
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
      554 / 606 (91.42%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      268 / 554 (48.38%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Burunduk3</b> for 245.81 points (3 mins 43 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      186.31 (for 268 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Because <b>n</b> can be as large as 10<sup>18</sup>, 
iterating over all primes less than or equal to <b>n</b><sup>1/2</sup> is not a practical solution.
The key insight is that the exponent q is less than or equal to 59 because
2<sup>60</sup> &gt; 10<sup>18</sup>.
Thus examining all possible q (2 &le; q &le; 59) and testing if there is a prime p
such that p<sup>q</sup> = <b>n</b> for that q seems a good idea.
</p>
<p>
Now we consider the problem of how to find an integer p such that p<sup>q</sup> = <b>n</b>
if exists for given q and <b>n</b>. You can see p = <b>n</b><sup>1/q</sup> by simple mathematics.
You can calculate
<b>n</b><sup>1/q</sup> as a floating point number 
by a standard library in each language (pow() in <cmath> in C++,
java.lang.Math.pow() in Java, System.Math.Pow() in .NET).
However, we have to know if such calculated <b>n</b><sup>1/q</sup> is an integer or not.
This is not a simple task
because the calculation of floating point numbers as above contains a numerical error.
One way is to round the calculated floating point number to an integer,
raise it to the q-th power, and 
check if it equals to <b>n</b>. Once you round the floating point number
to an integer, following operations
should be done by integer arithmetic.
Please do not use typecasting to round a floating point number to an integer;
it uses rounding down.
Instead use standard library functions which use rounding a floating point number
to the nearest integer.
If you do not want to deal with floating point numbers, you can find
an integer p such that p<sup>q</sup> = <b>n</b> by binary search.
</p>
<p>
The rest part of the problem is testing if p is a prime or not.
Because such calculated p satisfies p &le; <b>n</b><sup>1/2</sup> &le; 10<sup>9</sup>,
you can do it by the following simple function.
<pre>
boolean isPrime(int x){
    for(int i = 2; i * i &lt;= x; i++) if(x % i == 0) return false;
    return true;
}
</pre>
</p>
<p>
Now the total solution can be written as follows in Java.
<pre>
public int[] baseAndExponent(String sn){
    long n = Long.parseLong(sn);
    for(int q = 2; q &lt;= 59; q++){
        double dp = Math.pow(n, 1.0 / q);
        int p = (int)Math.round(dp);
        if(!isPrime(p)) continue;
        long x = 1;
        for(int i = 0; i &lt; q; i++) x *= p;
        if(x == n) return new int[]{p, q};
    }
    return new int[]{};
}
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8778&amp;rd=12172" name="8778">LightedPanels</a></b> 
</font> 
<A href="Javascript:openProblemRating(8778)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521020" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      42 / 789 (5.32%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 42 (14.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>magicdlf</b> for 601.51 points (27 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      509.06 (for 6 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First we can observe that it makes no sense to touch the same panel twice
because it does not change the state of panels at all.
This means we only have to consider the case each panel is touched at most once.
Next we can observe that the order in which panels are touched is not related to the end state.
Because of this, we may impose a particular oder in which panels are touched.
Here we assume panels are touched in order of increasing row and inside a row left to right.
</p>
<p>
Let's first consider a restricted version of the problem, where we can touch only panels
with row &ge; 1 and column &ge; 1 (rows and columns are 0-origin).
In this version of the problem, the only way to flip the panel (0, 0) is to
touch the panel (1, 1).
Thus we can determine if the panel (1, 1) should be touched or not only by the state of
the panel (0, 0).
After this, the only way to flip the panel (0, 1) is to touch the panel (1, 2).
Thus we can determine if the panel (1, 2) should be touched or not only by the current state of
the panel (0, 1).
In a similar way, we can determine each panel should be touched or not.
Now we can know how to solve this restricted version of the problem.
If all panels are lighted, the number of panels you touched is the answer.
If there is a panel which are not lighted, it is impossible to light up all panels -
the answer is -1.
</p>
<p>
Let us return to the original version of the problem.
Each panel in row 0 and in column 0 can be either touched or not, and we can brute force all possibilities.
The number of patterns is less than or equal to 2<sup>8+8-1</sup> = 2<sup>15</sup> = 32768.
For each fixed pattern our problem reduces to the problem in the previous paragraph.
You can see the fastest
<a href="/stat?c=problem_solution&cr=22658883&rd=12172&pm=8778">solution</a>
by <tc-webtag:handle coderId="22658883" context="algorithm"/> for reference.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8765&amp;rd=12172" name="8765">ReversalChain</a></b> 
</font> 
<A href="Javascript:openProblemRating(8765)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521020" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      433 / 606 (71.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      88 / 433 (20.32%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 474.53 points (6 mins 39 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      309.87 (for 88 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The success ratio of this problem is low. This is because many coders solved this problem
by a wrong greedy algorithm.
</p>
<p>
The intended solution of this problem is dynamic programming.
To explain the solution, we will create a 4-D array called dp.
Let us denote the substring of the string str which begins at b and extends to the character at
e - 1 by str(b, e).
dp[x][a][b][r] stores the minimum length of the reversal chain to transform
the substring of <b>init</b>(a, a + x) with r reversals (r is zero or one)
to the substring of <b>goal</b>(b, b + x).
If there is no such reversal chain, it stores the special value which indicates the fact.
We will call this special value inf.
The size of dp is 50 * 50 * 50 * 2 = 250000.
</p>
<p>
The basic idea of the reccurence
is to match a character in <b>init</b> and a character in <b>goal</b>
(maybe after a reversal)
and then solve the problem with the remaining strings.
The recurrence relation can be written as follows (ignoring boundary conditions).
We suppose inf is a special value which is larger than any other integers.
<pre>
dp[x][a][b][0] =
    min{
        init[a]     == goal[b]     ? dp[x-1][a+1][b+1][0]     : inf,
        init[a+x-1] == goal[b+x-1] ? dp[x-1][a][b][0]         : inf,
        init[a]     == goal[b+x-1] ? dp[x-1][a+1][b][1] + 1   : inf,
        init[a+x-1] == goal[b]     ? dp[x-1][a][b+1][1] + 1   : inf
    }

dp[x][a][b][1]
    min{
        init[a]     == goal[b]     ? dp[x-1][a+1][b+1][0] + 1 : inf,
        init[a+x-1] == goal[b+x-1] ? dp[x-1][a][b][0] + 1     : inf,
        init[a]     == goal[b+x-1] ? dp[x-1][a+1][b][1]       : inf,
        init[a+x-1] == goal[b]     ? dp[x-1][a][b+1][1]       : inf
    }
</pre>
</p>
<p>
You can see the very fast
<a href="/stat?c=problem_solution&cr=19849563&rd=12172&pm=8765">solution</a>
by <tc-webtag:handle coderId="19849563" context="algorithm"/> for reference. He uses a string as a key to access the table for dynamic programming and
this makes his code simple.
His solution is really neat.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8764&amp;rd=12172" name="8764">CollectingBonuses</a></b> 
</font> 
<A href="Javascript:openProblemRating(8764)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521020" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      150 / 606 (24.75%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 150 (1.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 396.51 points (37 mins 58 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      380.76 (for 2 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem is a really tough one but I think this problem is so educative.
To solve this problem, not only the knowledge of mathematics but also
the technique of handling numerical errors in floating point arithmetic is required.
</p>
<p>
First we construct the mathematical formula of the answer.
Let T(x) be the expected number of bottles you must buy to collect x different codes.
We suppose we have collected x different types of codes already.
If we buy a bottle, the probability of its code is a new one is
(n - x) / n.
This leads to the equation
T(x + 1) - T(x) = 1 + (x / n)(T(x + 1) - T(x)), which follows
T(x + 1) = T(x) + n / (n - x).
From this reccurence relation, we get the representation 
T(k) = n / n + n / (n - 1) + ... + n / (n - k + 1).
Now the problem is how to calculate this value efficiently (the brute force method will time out).
There is a good news for you.
The answer may contain a relative error of 1E-9, so
the good approximation is enough.
</p>
<p>
Here is a keyword "harmonic number".
Harmonic number is defined as H(n) = 1 + 1 / 2 + 1 / 3 + ... + 1 / n.
T(k) can be represented as n * (H(n) - H(n - k)) using harmonic number.
If you know the keyword "harmonic number", you can put it into the search engine and
get the approximation formula. I introduce here a
<a target="_blank" href="http://mathworld.wolfram.com/HarmonicNumber.html">reference</a>
from MathWorld.
You will know that H(n) can be approximated as gamma + ln (n + 1 / 2)
(see (15) in the reference), where gamma is an Euler-Mascheroni constant which is about
0.5772156649015313.
Because the error of this approximation is about 1/24n<sup>2</sup>, 
it is precise enough for large n.
Now we can calculate H(n) both efficiently and precisely as follows.
If n is smaller than a constant, like 10000000, we calculate H(n) by brute force.
Otherwise we calculate H(n) by the approximation formula.
If you don't know the word "harmonic number", you can make the similar approximation formula
if you know the idea of approximating the sum of a sequence by the integration of
a corresponding function.
</p>
<p>
The answer of the problem is T(k) = n * (H(n) - H(n - k)) and you have the precise value
of H(n) and H(n - k). The remaining task is only a subtraction. You may think this problem
is solved.
However, the subtraction contains a trouble. Though H(n) and H(n - k) is precise, 
H(n) - H(n - k) may not be precise.
The subtraction of two nearly equal floating point numbers increases relative error.
This phenomenon is called loss of significance.
</p>
<p>
How can we avoid this problem?
We suppose both n and k are large enough, becuase if we can solve such cases, handling other cases
is not hard.
Becuase H(n) and H(n - k) are approximated as gamma + ln (n + 1 / 2) and gamma + ln(n - k + 1 / 2)
respectively, H(n) - H(n - k) can be represented as ln(n + 1 / 2) - ln(n - k + 1 / 2) = 
ln((2 n + 1) / (2 n - 2 k + 1)).
Now there is no subtraction and the trouble seems to be removed. However, there is another trouble.
The relative error of log(x) as implemented in the standard
library is large where x is near to 1.
To avoid this trouble, the function log1p(x) is prepared in the standard library of C and Java
(see "math.h" for C and java.lang.Math for Java).
This function calculate ln(1 + x) precisely even if x is near to 0.
What should C# coder and VB coder do?
In fact, implementing log1p() is a not hard task. If x is large enough, call log(1 + x).
Otherwise, use the Taylor expantion of logarithm function around 1.
<tc-webtag:handle coderId="10574855" context="algorithm"/> did it in his C# 
<a href="/stat?c=problem_solution&cr=10574855&rd=12172&pm=8764">
solution</a>.
</p>
<p>
After all, the solution can be written as follows in Java.
<pre>
static final long M = 10000000;
public static double expectedBuy(String sn, String sk){
    long n = Long.parseLong(sn);
    long k = Long.parseLong(sk);
    long m = n - k + 1;
    double res = 0.0;
    while(m &lt;= M){
        res += 1.0 / m;
        if(m == n) return n * res;
        m++;
    }
    // 1 / m + ... + 1 / n = H(n) - H(m - 1)
    res += Math.log1p((double)(2 * n - 2 * m + 2)/ (double)(2 * m - 1));
    return n * res;
}
</pre>
</p>
<p>
You can learn three things from this problem.
Harmonic number can be approximated using logarithm function.
Subtraction of two close floating point numbers causes loss of significance.
The standard library function log(x) is not precise where x is near to 1.
</p>
<p>
I would like to add one more thing.
You can trust the precision of the answer for the system test;
it is calculated very precisely using BigDecimal.
</p>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/ymatsu_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20034421" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
