<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 431 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
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
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13522">Match Overview</a><br />
    <tc-webtag:forumLink forumID="525187" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 431</span><br />Saturday, December 23, 2008
<br /><br />
<h2>Match summary</h2> 
<p>
The last SRM in this year gathered together not so many participants - 1088, 488 in Div-I and
600 in Div-II. In Div-I almost everybody solved the easy problem (partially because
of good example cases). However, the other two problems were quite tough. This resulted in small
number of solutions and only 4 coders solved all three problems. <tc-webtag:handle coderId="22723672" context="algorithm"/>
was much faster than anybody else (1st on the Hard and 3rd on the Medium overall)
and got his first SRM victory with more than 300 points gap. <tc-webtag:handle coderId="22686851" context="algorithm"/> and
<tc-webtag:handle coderId="10574855" context="algorithm"/>
took second and third places, respectively, with very close scores. Both of them would have
scored more, but resubmitted their Hards.
</p>
<p>
Unfortunately, due to an ambiguity in the statement of DII-Medium problem, the SRM
was not rated in Div-II.
</p> 
 
<H1> 
The Problems 
</H1>
</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10281&amp;rd=13522" name="10281">MegaCoolNumbersEasy</a></b> 
</font> 
<A href="Javascript:openProblemRating(10281)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525187" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      553 / 600 (92.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      481 / 553 (86.98%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>yash_iiith</b> for 248.65 points (2 mins 5 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      205.22 (for 481 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The problem can be solved by generating all mega cool numbers between 1 and 1000, inclusive, and then counting
how many of them does not exceed <b>N</b>. Generating 1 and 2-digit mega cool numbers is trivial -- all of
them are mega cool, because any sequence of 1 or 2 numbers is an arithmetic progression. The only available 4-digit
number, 1000, is obviously not mega cool, so what's left is to generate 3-digit numbers. To do this, let's
iterate through all triples of digits (a, b, c), 1 &le; a &le; 9, 0 &le; b, c &le; 9. Each time the digits
in this sequence form an arithmetic progression, i.e. b - a = c - b, we can tell that the number 100 * a + 10 * b + c
is mega cool.
</p>
<p>
Java implementation of this approach follows.
</p>
<pre>
import java.util.*;
public class MegaCoolNumbersEasy {
  public int count(int N) {
<font color="gray">    // let's add all mega cool numbers into the list</font>
    List<Integer> megaCool = new ArrayList<Integer>();
	
<font color="gray">    // add all 1 and 2-digit numbers</font>
    for (int i=1; i&lt;100; i++)
      megaCool.add(i);
<font color="gray">    // add all 3-digit numbers</font>
    for (int a=1; a&lt;=9; a++)
      for (int b=0; b&lt;=9; b++)
        for (int c=0; cv=9; c++)
          if (b - a == c - b)
            megaCool.add(100 * a + 10 * b + c);
<font color="gray">    // check how many mega cool numbers does not exceed <b>N</b></font>
    int res = 0;		
    for (int num : megaCool)
      if (num &lt;= N)
        res++;
<font color="gray">    // return result</font>
    return res;
  }
}
</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10261&amp;rd=13522" name="10261">FallingPoints</a></b> 
</font> 
<A href="Javascript:openProblemRating(10261)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525187" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      486 / 600 (81.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      194 / 486 (39.92%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>yash_iiith</b> for 498.91 points (1 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      318.09 (for 194 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Let y[i] be the final y-coordinate for the i-th falling point. We can calculate y's in sequential order.
For the first point, there is no previous point, so it just falls down, i.e. y[0] = 0. Assuming we know
y[i-1], let's calculate y[i]. The i-th point falls along the line x = <b>X</b>[i]. So we need to find
the highest y when the distance between the points (<b>X</b>[i], y) and (<b>X</b>[i-1], y[i-1]) is
equal to <b>R</b>. We can write this in form of mathematical equation and do some simple transformations:
</p>
<pre>
  sqrt((<b>X</b>[i] - <b>X</b>[i-1])^2 + (y - y[i-1])^2) = <b>R</b>
  (<b>X</b>[i] - <b>X</b>[i-1])^2 + (y - y[i-1])^2 = <b>R</b>^2
  (y - y[i-1])^2 = <b>R</b>^2 - (<b>X</b>[i] - <b>X</b>[i-1])^2
</pre>
<p>
The last equation doesn't have solutions if <b>R</b>^2 - (<b>X</b>[i] - <b>X</b>[i-1])^2 &lt; 0 or, equivalently,
|<b>X</b>[i] - <b>X</b>[i-1]| &gt; <b>R</b> (because the left part of the equation is always non-negative and
the right part is negative). In this case i-th point will just fall down, i.e. y[i] = 0. Otherwise, we can
take square root from both sides of the equation:
</p>
<pre>
  y - y[i-1] = +/-sqrt(<b>R</b>^2 - (<b>X</b>[i] - <b>X</b>[i-1])^2)
  y = y[i-1] +/- sqrt(<b>R</b>^2 - (<b>X</b>[i] - <b>X</b>[i-1])^2)
</pre>
<p>
Since we would like to know the highest possible value of y, we can deduce that
y[i] = y[i-1] + sqrt(<b>R</b>^2 - (<b>X</b>[i] - <b>X</b>[i-1])^2).
</p>
<p>Java implementation follows.</p>
<pre>
public class FallingPoints {
  public double[] getHeights(int[] X, int R) {
    double[] y = new double[X.length];
    y[0] = 0;
    for (int i=1; i &lt; X.length; i++)
      if (Math.abs(X[i] - X[i-1]) &gt; R)
        y[i] = 0;
      else
        y[i] = y[i-1] + Math.sqrt(R * R - (X[i] - X[i-1]) * (X[i] - X[i-1]));
    return y;
  }
}
</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10257&amp;rd=13522" name="10257">SumAndProduct</a></b> 
</font> 
<A href="Javascript:openProblemRating(10257)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525187" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      91 / 600 (15.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      16 / 91 (17.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>xianchao</b> for 692.18 points (15 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      440.03 (for 16 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
We need to find the smallest n for which there exist n numbers x<sub>1</sub>, x<sub>2</sub>, ..., x<sub>n</sub> &gt; 0 such
that x<sub>1</sub> + x<sub>2</sub> + ... + x<sub>n</sub> = <b>S</b> and
x<sub>1</sub>x<sub>2</sub>...x<sub>n</sub> = <b>P</b>. To do this, it's enough to be able to answer the following
question: for a given n and <b>S</b> which product values can we obtain using n non-negative integers with
their sum equal to <b>S</b>?
</p>
<p>
First let's get some intuition by answering this question for n=1 and n=2. For n=1 the answer is trivial, the only
one number x<sub>1</sub> = <b>S</b>, so the product can only be equal to <b>S</b>. For n=2 we have two numbers x and y,
x + y = <b>S</b>. The product is xy = x(<b>S</b> - x). Let's find for which values A the product can be equal to A. To do this,
we need to solve the equation x(<b>S</b> - x) = A, which is equivalent to x<sup>2</sup> - <b>S</b>x + A = 0. The discriminant of this
equation is D = <b>S</b><sup>2</sup> - 4A. The equation has a solution if D &gt; 0 &lt;=&gt; A &le; <b>S</b><sup>2</sup>/4.
Assuming A &ge; 0, it's easy to check that this solution x = <b>S</b> +/- sqrt(<b>S</b><sup>2</sup> - 4A) is non-negative.
</p>
<p>
So, we've proved that using 2 numbers, we can obtain any product between 0 and <b>S</b><sup>2</sup>/4. Note that the maximum product
<b>S</b><sup>2</sup>/4 is obtained when both numbers are equal to <b>S</b>/2. We can guess that the maximum product
for n numbers is obtained when all of them are equal to <b>S</b>/n. And this guess is actually right as shows the
following theorem.
</p>
<p>
<i>Theorem.</i> Using n numbers with sum equal to <b>S</b>, we can obtain any product between 0 and (<b>S</b>/n)<sup>n</sup>.
</p>
<p><i>Proof.</i> Let's first show, that the product is maximal when all n numbers are the same.
We already know that for 2 numbers this is true. Let's take n numbers for which the product
is maximal and suppose that they are not the same. We can choose a minimal number m and a maximal number
M among them and replace both of them to (m + M)/2. This will allow to increase the overall product.
It contradicts to our assumption that taken numbers have the maximal product and proves
that the product is maximal when all numbers are the same.</p>
<p>
Since when all number are the same, the product is (<b>S</b>/n)<sup>n</sup>, it's only left to prove that
for any A, 0 &le; A &le; (<b>S</b>/n)<sup>n</sup>, it's possible to obtain the product A.
We can do this constructively. Take a number B = A / (<b>S</b>/n)<sup>n-2</sup>. It's easy to see that
0 &le; B &le; (<b>S</b>/n)<sup>2</sup>. Therefore we can choose two numbers x<sub>1</sub> and x<sub>2</sub>
such that x<sub>1</sub> + x<sub>2</sub> = 2<b>S</b>/n and x<sub>1</sub>x<sub>2</sub> = B. Now it's enough to add numbers
x<sub>3</sub> = x<sub>4</sub> = ... = x<sub>n</sub> = <b>S</b>/n to obtain the required n numbers: x<sub>1</sub> + 
x<sub>2</sub> + ... + x<sub>n</sub> = 2<b>S</b>/n + (n-2)<b>S</b>/n = S and x<sub>1</sub>x<sub>2</sub>...x<sub>n</sub> =
B(<b>S</b>/n)<sup>n-2</sup> = A / (<b>S</b>/n)<sup>n-2</sup> * (<b>S</b>/n)<sup>n-2</sup> = A. <i>End of proof.</i>
</p>
<p>
Using this theorem, we are now able to solve the problem. First, if <b>S</b> = <b>P</b>, just return 1. Otherwise,
subsequently check n = 2, 3, ..., <b>S</b>. As only P &le; (<b>S</b>/n)<sup>n</sup>, return the current value of n.
If we checked all these values of n and didn't find an appropriate one, for all subsequent values <b>S</b>/n &lt; 1
and (<b>S</b>/n)<sup>n</sup> &lt; 1, therefore they will also not satisfy us. In this case solution doesn't exist and
we should return -1.
</p>
<p>
Can we be sure that our solution works fast enough? At the first glance, in the worst case it must check 1,000,000,000
candidates for n, so we can't. However, after a bit more careful analysis, it becomes clear that our solution is very fast.
If <b>S</b> &lt; 100, we will check at most 100 candidates and this is very fast. And if <b>S</b> &gt; 100, the answer always
exists and doesn't exceed 10, so we'll check at most 10 candidates. This is not hard to see: <b>S</b> / 10 &gt; 10 and
(<b>S</b> / 10)<sup>10</sup> &gt; 10<sup>10</sup> &gt; 1,000,000,000 &ge; P.
</p>
<p>
Implementation is very easy. An example of Java implementation follows.
</p>
<pre>
public class SumAndProduct {
  public int smallestSet(int S, int P) {
    if (S == P) return 1;
    int n = 2;
    while (Math.pow(S / (double)n, n) &lt; P) {
      n++;
      if (n &gt; S) return -1;
    }
    return n;
  }
}
</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10258&amp;rd=13522" name="10258">LaserShooting</a></b> 
</font> 
<A href="Javascript:openProblemRating(10258)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525187" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      463 / 488 (94.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      453 / 463 (97.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>blueblimp</b> for 249.21 points (1 mins 36 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200.67 (for 453 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The easiest way to solve this problem is using the fact that expected value of sum of several random variables
is equal to the sum of expected values of each of these variables. Here, it means that we can
calculate the expected number of hits for each of the obstacles (this number is actually
the same as the probability to hit an obstacle) and return the sum of these numbers.
</p>
<p>
To calculate the expected number for a single obstacle, take angles a<sub>1</sub> and a<sub>2</sub> - the angles
of the rays that go exactly through the obstacle's ends (the angle of the ray
that goes through the point (x, y) can be found as arctangent of y / x). Note that laser will hit the obstacle exactly in
cases when the angle a of the shot lies between a<sub>1</sub> and a<sub>2</sub>. So, we need to calculate the
probability that a random point thrown on a segment [-Pi/2, Pi/2] of length Pi will fall within a segment
[min(a<sub>1</sub>, a<sub>2</sub>), max(a<sub>1</sub>, a<sub>2</sub>)] of length
L = max(a<sub>1</sub>, a<sub>2</sub>) - min(a<sub>1</sub>, a<sub>2</sub>). This probability is, of course,
just L / Pi.
</p>
<p>
Java implementation of this approach follows.
</p>
<pre>
public class LaserShooting {
  public double numberOfHits(int[] x, int[] y1, int[] y2) {
    double res = 0;
    for (int i=0; i &lt; x.length; i++) {
      double a1 = Math.atan(y1[i] / (double)x[i]);
      double a2 = Math.atan(y2[i] / (double)x[i]);
      res += Math.abs(a1 - a2) / Math.PI;
    }
    return res;
  }
}
</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10259&amp;rd=13522" name="10259">MegaCoolNumbers</a></b> 
</font> 
<A href="Javascript:openProblemRating(10259)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525187" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      52 / 488 (10.66%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      39 / 52 (75.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>AS1_PML30</b> for 409.92 points (13 mins 58 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      252.67 (for 39 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The problem can be solved using dynamic programming, but first let's simplify the definition of mega cool number a bit.
Note, that if the digits of a N-digit number are split into X progressions and X &lt; N, then they can be split
into X + 1 progression as well. To do this, we can just take any progression that contains at least 2 digits
and split it into 2 parts. Therefore, the only case when a number is of power A, but not of power A-1, is
when A is the <i>smallest</i> possible power of this number. So the number is mega cool of power A
when A is its smallest power and its digits are in non-decreasing order.
</p>
<p>
One important consequence is that there are no mega cool numbers of power more than 9. Since all digits
of a mega cool number are in non-decreasing order, all equal digits stand in consecutive positions.
For each distinct digit, we can create a progression containing all such digits. In such way,
the number of progressions will be at most 9, and therefore the smallest power of such number
can't be more than 9.
</p>
<p>
Given a number, we can determine its smallest power using the following greedy algorithm. Assign the first
digit to the first progression. For each next digit, if it can extend the current progression, then
extend the progression with this digit, otherwise create a new progression containing only this digit.
The correctness of this algorithm is straightforward to prove and it's left to the reader.
</p>
<p>
Let's divide all i-digit mega cool numbers into classes (<i>pow</i>, <i>diff</i>, <i>last</i>), where
<i>pow</i> is the smallest power
of the number, <i>diff</i> is the difference of the last progression in this number (assuming that progressions are
generated using the greedy algorithm from the previous paragraph; special value <i>diff</i> = 9 can be used
to indicate that the last progression consists only from one digit, so we don't yet know its difference) and
<i>last</i> is the last digit of the number.
</p>
<p>
Our goal is to calculate the amount of numbers from each class subsequently for i = 1, 2, ..., <b>N</b>. For i = 1 we
have 1 number for each of the classes (1, 9, d), 1 &le; d &le; 9, and 0 numbers for all the other classes.
Suppose we know all the information for some i = i<sub>0</sub>. To calculate the information for i = i<sub>0</sub> + 1,
we need to iterate through all classes. For each class we need to check which numbers can be generated by adding 1 digit
to each number from this class. There are 2 rules that can be used:
</p>
<ul>
<li>For each number from class (<i>pow</i>, 9, <i>last</i>) we can add any next digit <i>d</i>, <i>last</i> &le; <i>d</i> &le;
9, extend the current progression by this digit and obtain a number from class (<i>pow</i>, <i>d</i> - <i>last</i>, <i>d</i>).</li>
<li>For each number from class (<i>pow</i>, <i>diff</i>, <i>last</i>), 0 &le; <i>diff</i> &lt; 9, we can add
any next digit <i>d</i>, <i>last</i> &le; <i>d</i> &le; 9. If <i>d</i> - <i>last</i> = <i>diff</i>, we can
extend the current progression and will
obtain a number from class (<i>pow</i>, <i>diff</i>, <i>d</i>), otherwise we must start a new progression and
the number will be from class (<i>pow</i> + 1, 9, <i>d</i>).</li>
</ul>
<p>
Using these rules, we can subsequently calculate the information for i = 2, 3, ..., <b>N</b>. The answer is the total amount
of numbers in classes (<b>A</b>, <i>diff</i>, <i>last</i>) for i = <b>N</b>.
</p>
<p>Let's estimate the number of operations used by such solution, to see whether it's fast enough or not. For each i we
have 9 * 10 * 9 = 810 states (1 &le; <i>pow</i>, <i>last</i> &le; 9, 0 &le; <i>diff</i> &le; 9). As 1 &le; i &le; <b>N</b>,
the total number of states is at most 810,000. Processing each state requires checking at most 10 variants
for the next digit, therefore the total number of operations is about 8,100,000, what is small enough to easily fit
within 2 seconds.</p>
<p>Java implementation of this approach follows.</p>
<pre>
public class MegaCoolNumbers {
  final int MOD = 1000000007;
  public int count(int N, int A) {
<font color="grey">    // there are no mega cool number of power more than 9</font>
    if (A &gt; 9) return 0;
<font color="grey">    // F[i][pow][diff][last] is the number of i-digit mega
    // cool numbers from class (pow, diff, last)</font>
    int[][][][] F = new int[N+1][10][10][10];
<font color="grey">    // initialize F for i=1</font>
    for (int d=1; d &le;= 9; d++)
      F[1][1][9][d] = 1;
<font color="grey">    // calculate F for i=2, 3, ..., <b>N</b></font>
    for (int i=1; i &lt; N; i++)
      for (int pow=1; pow &lt;= 9; pow++)
        for (int last=1; last &lt;= 9; last++) {
          for (int d=last; d &lt;= 9; d++) {
            F[i+1][pow][d-last][d] += F[i][pow][9][last];
            F[i+1][pow][d-last][d] %= MOD;
          }
          for (int diff=0; diff &lt;= 8; diff++)
            for (int d=last; d &lt;= 9; d++)
              if (d - last == diff) {
                F[i+1][pow][diff][d] += F[i][pow][diff][last];
                F[i+1][pow][diff][d] %= MOD;
              } else if (pow &lt; 9) {
                F[i+1][pow+1][9][d] += F[i][pow][diff][last];
                F[i+1][pow+1][9][d] %= MOD;
              }
        }
<font color="grey">    // calculate result and return it</font>
    int res = 0;
    for (int last=1; last &lt;= 9; last++)
      for (int diff=0; diff &lt;= 9; diff++)
        res = (res + F[N][A][diff][last]) % MOD;
    return res;
  }
}
</pre>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10171&amp;rd=13522" name="10171">PerfectRectangles</a></b> 
</font> 
<A href="Javascript:openProblemRating(10171)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525187" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      30 / 488 (6.15%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      11 / 30 (36.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>qizichao</b> for 702.02 points (20 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      497.64 (for 11 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
In order to solve this problem, it's helpful to be able for a given rectangle, consisting only of white cells, to
determine whether it is perfect or not in time O(1). This can be done as follows. Let map<sub>i,j</sub>
be the cell in row i, column j, where each white cell is
encoded as 0 and each black cell - as 1. A rectangle with its corners in cells (r<sub>1</sub>, c<sub>1</sub>) and
(r<sub>2</sub>, c<sub>2</sub>), r<sub>1</sub> &le; r<sub>2</sub>, c<sub>1</sub> &le; c<sub>2</sub>,
is perfect if it can't be extended in any of four possible directions. In other words, the part of row r<sub>1</sub>-1
directly over the rectangle must contain at least one black cell, and the same must hold for each of the following 3 parts:
the part of row r<sub>2</sub>+1 directly under the rectangle, the part of column c<sub>1</sub>-1 directly to the left
from the rectangle and the part of column c<sub>2</sub>+1 directly to the right from the rectangle. This can be written
as mathematical inequalities: map<sub>r1-1,c1</sub> + map<sub>r1-1,c1+1</sub> + ... + map<sub>r1-1,c2</sub> &gt; 0,
map<sub>r2+1,c1</sub> + map<sub>r2+1,c1+1</sub> + ... + map<sub>r2+1,c2</sub> &gt; 0, map<sub>r1,c1-1</sub> + map<sub>r1+1,c1-1</sub> + ... +
map<sub>r2,c1-1</sub> &gt; 0 and map<sub>r1,c2+1</sub> + map<sub>r1+1,c2+1</sub> + ... +
map<sub>r2,c2+1</sub> &gt; 0.
</p>
<p>
So, in order to be able to check for perfectness in O(1), we need to be able to calculate the sums of values in arbitrary
number of consecutive cells in the same row or column in 2-dimensional matrix. This is quite a classic problem and
it can be solved using cumulative sums. If sumRow<sub>i,j</sub> = map<sub>i,0</sub> + map<sub>i,1</sub> + ...
+ map<sub>i,j</sub>, then sum map<sub>i,j1</sub> + map<sub>i,j1+1</sub> + ... + map<sub>i,j2</sub> can be calculated
as sumRow<sub>i,j2</sub> - sumRow<sub>i,j1-1</sub>. Similarly, if sumCol<sub>i,j</sub> = map<sub>0,j</sub> + 
map<sub>1,j</sub> + ... + map<sub>i,j</sub>, then sum map<sub>i1,j</sub> + map<sub>i1+1,j</sub> + ... + map<sub>i2,j</sub>
can be calculated as sumCol<sub>i2,j</sub> - sumCol<sub>i1-1,j</sub>. Therefore, we can precalculate tables
sumRow and sumCol in time O(N<sup>2</sup>) and then be able to check perfectness in O(1) for a single rectangle.
</p>
<p>
Now, let's describe an O(N<sup>3</sup>) to this problem. It is not fast enough and will time out for given constraints,
however it can be optimized for running time O(N<sup>2</sup>) and we'll show how to do this. Let's iterate through all
pairs of rows (r<sub>1</sub>, r<sub>2</sub>), r<sub>1</sub> &le; r<sub>2</sub>, and calculate the number of
perfect rectangles where the topmost row is r<sub>1</sub> and the bottommost row is r<sub>2</sub>. For a
fixed pair (r<sub>1</sub>, r<sub>2</sub>) we can calculate an array of
booleans <i>isWhite</i>, where isWhite[c] = true if and only if the part of column c between rows
r<sub>1</sub> and r<sub>2</sub>, inclusive,
contains only white cells. This array can be calculated in O(N) using cumulative sums in sumCol. Now, rectangle
between columns c<sub>1</sub> and c<sub>2</sub>, c<sub>1</sub> &le; c<sub>2</sub>, can potentially be perfect only
if isWhite[c] = true for all c, c<sub>1</sub> &le; c &le; c<sub>2</sub> (otherwise it contains at least one black cell),
isWhite[c<sub>1</sub>-1] = false (otherwise it can be extended to the left) and isWhite[c<sub>2</sub>+1] = false
(otherwise it can be extended to the right). Therefore, we need to find all maximal (by inclusion) consecutive
sequences of true values in array isWhite and check for each of them whether it corresponds to a perfect rectangle or not.
There can be at most N/2 such sequences and each of them can be checked in time O(1) using the method described above.
The overall complexity of the obtained solution is O(N<sup>3</sup>), because we need to check O(N<sup>2</sup>)
pairs (r<sub>1</sub>, r<sub>2</sub>).
</p>
<p>
To get an O(N<sup>2</sup>) solution, let's try to process all pairs of rows (r<sub>1</sub>, r<sub>2</sub>), where
r<sub>2</sub> is fixed, in linear time O(N). We will process all values of r<sub>1</sub> in increasing order.
Consider isWhite arrays for two consecutive r<sub>1</sub> values. The difference between them is that some
false values in an array for a lower r<sub>1</sub> can turn to true in an array for a higher r<sub>1</sub> (the reverse
change from true to false is never possible). This change from false to true happens just once for each column.
Let's define the height h(c) of column c as the number of white cells in this column starting from
cell (r<sub>2</sub>, c) and going up (i.e. cell (r<sub>2</sub>-h(c)+1, c) is still white, but
cell (r<sub>2</sub>-h(c), c) is black). It's not hard to see that isWhite[c] changes from false to true when
we consider r<sub>1</sub> = r<sub>2</sub> - h(c) + 1.
</p>
<p>
These changes in isWhite from false to true are very important. Suppose we have isWhite array for some value of
r<sub>1</sub> and consider some maximal (by inclusion) sequence of true values in it. If none of these values
has just recently changed from false to true (i.e. if none of them was false for the previous value of r<sub>1</sub>),
then rectangle corresponding to this sequence can be extended to the top and therefore it is certainly
not perfect. So, for a given value of r<sub>1</sub> we need to check not all maximal consecutive sequences of true
values in isWhite, but only those sequences that contain at least one cell that has just recently changed from false to true.
</p>
<p>
The algorithm for processing a fixed value of r<sub>2</sub> can now be written as follows:
<ol>
<li>For each value of r<sub>1</sub> create a list of cells where isWhite changes from false to true. To do this,
for each value of c, add it into the list for r<sub>1</sub> = r<sub>2</sub> - h(c) + 1.</li>
<li>Process r1 from top to bottom. For each value of r1 check all cells from the list builded at the previous step.
For each such cell find the maximal consecutive sequence of true values in array isWhite containing this cell
and check whether it corresponds to a perfect rectangle or not.</li>
</ol>
</p>
<p>
The only weak place in this algorithm is the part where we need to find the maximal consecutive sequence of true values
containing some particular cell. If we are able to do such operation in O(1), the whole algorithm will run
in O(N<sup>2</sup>). In other words, we need to implement isWhite array as a data stucture that initially contains
only false values and is able to perform the following operation in O(1): change value at a given position
from false to true and return the maximal consecutive sequence of true values containing the given position.
We can implement such data structure as an array of integers p satisfying to the following properties:
if the value at position c is false, then p[c] = -1; for each maximal consecutive sequence of true
values between positions l and r, inclusive, p[l] must be equal to r and p[r] must be equal to r; all
other p values can be arbitrary. Having such an array p, the required operation can be implemented
in O(1) using the following pseudocode:
</p>
<pre>
function changeValueAt(integer pos)
  if p[pos-1] = -1
    then l := pos
    else l:= p[pos-1];
  if p[pos+1] = -1
    then r := pos
    else r := p[pos+1];
  p[l] := r; p[r] := l;
  return the sequence between positions l and r, inclusive
end function
</pre>
<p>The idea for this code is simple. We find the maximal consecutive sequences of true values to the right and to the left
from the given position and merge this sequences into one large sequence. The code also correctly
handles cases when there is no sequence to the left and/or to the right from the given positions.</p>
<p>Now we are ready to give complete Java implementation of this approach.</p>
<pre>
import java.util.*;
public class PerfectRectangles {
  int[][] sumRow, sumCol;
<font color="grey">  // method for checking whether a given rectangle is perfect</font>
  boolean isPerfect(int lx, int ly, int rx, int ry) {
    return sumRow[lx-1][ry] != sumRow[lx-1][ly-1] &&
           sumRow[rx+1][ry] != sumRow[rx+1][ly-1] &&
           sumCol[ly-1][rx] != sumCol[ly-1][lx-1] &&
           sumCol[ry+1][rx] != sumCol[ry+1][lx-1];
  }
  public int numberOfRectangles(int N, int M, int X0, int A, int B, int Y0, int C, int D) {
<font color="grey">    // generate an initial table</font>
    boolean[][] map = new boolean[N+2][N+2];
    int x0 = X0 % N, y0 = Y0 % N;
    A%=N; B%=N; C%=N; D%=N;
    for (int i=0; i&lt;M; i++) {
      map[x0+1][y0+1] = true;
      x0 = (x0 * A + B) % N;
      y0 = (y0 * C + D) % N;
    }
<font color="grey">    // append black rows/columns from all 4 sides
    // (for simplicity of subsequent implementation)</font>
    for (int i=0; i&lt;=N+1; i++)
      for (int j=0; j&lt;=N+1; j++)
        if (i==0 || j==0 || i==N+1 || j==N+1) map[i][j] = true;
<font color="grey">    // calculate arrays sumRow and sumCol</font>
    sumRow = new int[N+2][N+2];
    sumCol = new int[N+2][N+2];
    for (int i=0; i&lt;=N+1; i++) {
      sumRow[i][0] = (map[i][0] ? 1 : 0);
      for (int j=1; j&lt;=N+1; j++)
        sumRow[i][j] = sumRow[i][j-1] + (map[i][j] ? 1 : 0);
    }
    for (int j=0; j&lt;=N+1; j++) {
      sumCol[j][0] = (map[0][j] ? 1 : 0);
      for (int i=1; i&lt;=N+1; i++)
        sumCol[j][i] = sumCol[j][i-1] + (map[i][j] ? 1 : 0);
    }
    int[] h = new int[N+2]; <font color="grey">// heights of all columns</font>
    int[] p = new int[N+2]; <font color="grey">// data structure for isWhite array</font>
<font color="grey">    // the lists of moments when false changes to true in isRow
    // cnt is the number of moment for a given row
    // pos[r] contains the list of moment columns for the row r</font>
    int[] cnt = new int[N+2];
    int[][] pos = new int[N+2][N+2];
    int res = 0;
<font color="grey">    // iterate throw all values of r2</font>
    for (int i=0; i&lt;=N+1; i++) {
<font color="grey">      // update heights</font>
      for (int j=0; j&lt;=N+1; j++)
        if (!map[i][j]) h[j]++; else h[j]=0;
<font color="grey">      // step 1 of the algorithm for a given r2</font>
      Arrays.fill(cnt, 0);
      for (int j=0; j&lt;=N+1; j++)
        pos[h[j]][cnt[h[j]]++] = j;
<font color="grey">      // step 2 of the algorithm for a given r2</font>
      Arrays.fill(p, -1);
      int L=-1, R=-1;
      for (int hh=N+1; hh&gt;0; hh--)
        for (int x=0; x &lt; cnt[hh]; x++) {
          int pp = pos[hh][x];
          L = (p[pp-1]==-1?pp:p[pp-1]);
          R = (p[pp+1]==-1?pp:p[pp+1]);
          p[L] = R; p[R] = L;
          if (isPerfect(i - hh + 1, L, i, R)) res++;
        }
    }
    return res;
  }
}
</pre>

<div class="authorPhoto">
    <img src="/i/m/ivan_metelsky_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10481120" context="algorithm"/><br />
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
