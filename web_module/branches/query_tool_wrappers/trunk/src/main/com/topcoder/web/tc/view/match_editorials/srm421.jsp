<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 421 Problem Set &amp; Analysis</title>

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
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13512">Match Overview</a><br />
    <tc-webtag:forumLink forumID="523759" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 421</span><br />Wednesday, October 8, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
In SRM 421 coders from Div1 saw quite a tough problem set. In the easy problem they had to implement binary search algorithm and the only one trick was accurate search termination. The medium problem could be solved with a greedy algorithm, which was not easy to see and to prove. The hard problem proposed to find not so obvious algorithm, based on dynamic programming on tree, which additionally was quite hard to implement because of many different cases. Only 3 coders managed to solve the hard problem and this allowed them to take positions in Top-3. The fastest overall among them was <tc-webtag:handle coderId="20812309" context="algorithm"/> who gains its second match win and our congratulations. Second and third places were took by <tc-webtag:handle coderId="8433628" context="algorithm"/> and <tc-webtag:handle coderId="22653358" context="algorithm"/>.
</p>
<p>
In Div2 coders were proposed a moderate difficulty problem set. As a result, 30 coders solved the hard problem and 12 of them solved all problems. The match win was taken by <tc-webtag:handle coderId="22723679" context="algorithm"/>. Coders <tc-webtag:handle coderId="22722755" context="algorithm"/> and <tc-webtag:handle coderId="14979209" context="algorithm"/> took the rest of the podium.
</p>
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10105&amp;rd=13512" name="10105">GymTraining</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10105)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523759" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
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
      761 / 856 (88.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      643 / 761 (84.49%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>FaroukMohamed</strong> for 247.51 points (2 mins 51 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      191.02 (for 643 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
As with many Div-II Easy problems, this one turns out to be a plain simulation. If you can't train during the current minute, the only thing you can do is to rest. Otherwise you have a choice - to train or to rest. However after a bit of thinking it becomes obvious that there's no real choice, because it's always better to train. Earlier training allows you to complete the required number of training minutes faster, and you don't lose anything by doing training instead of rest, because it's always possible to shift a rest minute later and gain at least the same (or even larger) decrease of your heart pulse rate.
</p>
<p>
The only question left is when -1 should be returned. Note that if you can train during one minute, then you can train during arbitrary large number of minutes (nothing prevents you from doing rest until your pulse falls back to the minimum and continue your training after this). So -1 should be returned only if you can't initially (when your pulse is minimal) do training, i.e. if <strong>minPulse</strong> + <strong>trainChange</strong> &gt; <strong>maxPulse</strong>.
</p>
<p>
Please check the reference solution for an example of Java implementation:
</p>
<pre>
public class GymTraining {
  public int trainingTime(int need, int min, int max, int train, int rest) {
    if (min + train &gt; max) return -1;
    int cur = min;
    int time = 0;
    while (need &gt; 0) {
      time++;
      if (cur + train &lt;= max) {
        cur += train;
        need--;
      } else cur = Math.max(min, cur - rest);
    }
    return time;
  }
}
</pre>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10104&amp;rd=13512" name="10104">EquilibriumPoints</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10104)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523759" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
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
      240 / 856 (28.04%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      91 / 240 (37.92%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Maximus4</strong> for 451.10 points (9 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      286.39 (for 91 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

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
      582 / 632 (92.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      431 / 582 (74.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>JongMan</strong> for 246.27 points (3 mins 30 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      193.80 (for 431 correct submissions) 
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
For clean implementation of the described approach, please check the fastest correct <a href="/stat?c=problem_solution&amp;rm=298923&amp;rd=13512&amp;pm=10104&amp;cr=7446789">submission</a> on this problem by <tc-webtag:handle coderId="7446789" context="algorithm"/>.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9871&amp;rd=13512" name="9871">FloorIndicator</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9871)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523759" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
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
      81 / 856 (9.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      30 / 81 (37.04%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>tujf</strong> for 713.02 points (19 mins 46 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      539.01 (for 30 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem was a good coding exercise and required both strong implementation skill and the ability to divide the problem
into a few smaller and easier ones. First of all, we should learn to check if a field <strong>F</strong> of the indicator
can represent digit <strong>D</strong>. After thinking for a while, we can work out the following criterion: &laquo;field <strong>F</strong>
can represent digit <strong>D</strong> if, and only if there is no lit lamp in <strong>F</strong> which corresponds to unlit lamp in <strong>D</strong>.&raquo;
The bruteforce solution of the problem is to check all floor numbers from 0 to 10^<strong>N</strong>-1.
However, it is too slow for the given constraints.
Suppose now we want to calculate the average of <strong>K</strong> <strong>N</strong>-digit numbers <strong>a1</strong>&hellip;<strong>aK</strong>
where <strong>ai</strong> = <strong>di1</strong>*10^(<strong>N</strong>-1) + <strong>di2</strong>*10^(<strong>N</strong>-2) + &hellip; + <strong>diN</strong>. (Here <strong>dij</strong> is <strong>j</strong>-th
digit of <strong>ai</strong>). Now the required average is:
</p>
<p>
(<strong>a1</strong>+&hellip;+<strong>aK</strong>)/<strong>K</strong> = (<strong>d11</strong>+&hellip;+<strong>dK1</strong>)/<strong>K</strong> * 10^(<strong>N</strong>-1) + &hellip; + 
(<strong>d12</strong>+&hellip;+<strong>dK2</strong>)/<strong>K</strong> * 10^(<strong>N</strong>-2) + &hellip; + (<strong>d1N</strong>+&hellip;+<strong>dKN</strong>)/<strong>K</strong>.
</p>
<p>
Note that we can construct the answer using the average digit represented by each of the indicator fields. This can
be done by checking the criterion mentioned above only 10*<strong>N</strong> times. Obviously, the floor indicator can represent no
floor number if and only if there is a field <strong>F</strong> which can represent no digits. In this case we should return -1. See
<tc-webtag:handle coderId="22723679" context="algorithm"/>'s
<a href="/stat?c=problem_solution&amp;cr=22723679&amp;rd=13512&amp;pm=9871"> short and clear
solution</a> for exact implementation.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10074&amp;rd=13512" name="10074">CakesEqualization</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10074)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523759" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      201 / 632 (31.80%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      85 / 201 (42.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>LayCurse</strong> for 474.10 points (6 mins 42 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      314.13 (for 85 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
In this writeup we'll first consider a solution, which is quite simple to come with and to prove, but is a bit slow, and then will describe how this solution can be optimized and transformed into the fast greedy solution.
</p>
<p>
Obviously, if we have cake pieces and make some cuts, then each piece will be cut into some number of subpieces.
</p>
<p><em>Lemma 1.</em> If we are going to cut a cake piece of mass M into X subpieces, then it is always optimal to make all subpieces equal, i.e. of mass M/X.<p>
<em>Proof.</em> Suppose we make these subpieces different. It means there is at least one subpiece of mass &lt; M/X, and at least one subpiece of mass &gt; M/X. Therefore the minimum subpiece weight m is &lt; M/X and the maximum subpiece weight M is &gt; M/X. Now, if we replace these subpieces by X equal subpieces of mass M/X, then m will increase (if one of these subpieces had minimal weight) or remain the same, but certainly won't decrease (m won't be larger than M/X and none of subpieces with weights less than M/X decreased its weight). Similarly, M will decrease or remain the same. So, after this change the difference M - m will decrease or remain the same, and it can't hurt to make all subpieces equal. <em>End of proof.</em></p>
<p>
The proven lemma shows that in order to solve the problem for each of initial cake pieces we need to determine the number of subpieces X it will be cut into. As cutting into X subpieces requires X-1 cuts, the sum of all Xs must be not greater than <strong>maxCuts</strong> + N (where N is the number of input pieces).
</p>
<p>
Now, given a number M, let's try to answer the following questions. Does it possible to construct a solution, where the maximum subpiece weight is exactly M? In case of positive answer, which minimum difference between maximum and minimum subpiece weight it's possible to achieve?
</p>
<p>
The answers appear to be quite easy. The i-th piece must be cut into such number of subpieces X<sub>i</sub>, that <strong>weight</strong>[i] / X<sub>i</sub> &le; M, which is equivalent to X<sub>i</sub> &ge; <strong>weight</strong>[i] / M. In order to minimize the number of necessary cuts and at the same time to maximize the minimum subpiece weight we should make X<sub>i</sub> as small as possible, i.e. X<sub>i</sub> = ceil(<strong>weight</strong>[i] / M), where ceil(x) is the smallest integer &ge; x. After all X<sub>i</sub> are calculated, if their sum is more than <strong>maxCuts</strong> + N or if none of <strong>weight</strong>[i] / X<sub>i</sub> equals to M, then the answer for the first question is negative. And if the answer is positive, the optimal difference is M - min{<strong>weight</strong>[i] / X<sub>i</sub>}.
</p>
<p>
If we apply the described procedure to all possible values of M and choose the best among the constructed solutions, then the problem will be solved. Of course it makes sense to try only numbers <strong>weight</strong>[i] / j, 0 &le; i &lt; N, 1 &le; j &le; <strong>maxCuts</strong>+1 as possible candidates for M. The complexity of such solution is O(N<sup>2</sup> * <strong>maxCuts</strong>), which is about 2.5*10<sup>8</sup> operations, but when properly implemented, it passes system tests. For an example of such implementation, you can check <tc-webtag:handle coderId="8433628" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=298939&amp;rd=13512&amp;pm=10074&amp;cr=8433628">solution</a>. Note that he calculates ceil(<strong>weight</strong>[i] / M) using integer division to avoid potential precision problems.
</p>
<p>
Of course, O(N<sup>2</sup> * <strong>maxCuts</strong>) is quite a large complexity for such constraints, so it would be nice to find something faster. Consider the following greedy algorithm:
</p>
<pre>
Set res := +infinity
Set all X<sub>i</sub> := 1
Test(X)
For cut:= 1 to <strong>maxCuts</strong>
    Choose i such that <strong>weight</strong>[i] / X<sub>i</sub> is maximal
    Set X<sub>i</sub> := X<sub>i</sub> + 1
    Test(X)
End For
Return res

Procedure Test(X)
    Set M := max(<strong>weight</strong>[i] / X<sub>i</sub>)
    Set m := min(<strong>weight</strong>[i] / X<sub>i</sub>)
    Set res := min(res, M - m)
End Procedure
</pre>
<p>
In other words, our algorithm stores the number of subpieces for each cake piece (initially 1). For each cut, it chooses the piece which currently has the maximum subpiece weight and increases the number of subpieces for this piece by 1. Among all constructed solutions, the best one is chosen and returned.
</p>
<p>
It appears that this greedy algorithm always gives the optimal solution. In order to prove this, let's make a small assumption (*): all values <strong>weight</strong>[i] / j, 0 &le; i &lt; N, 1 &le; i &le; <strong>maxCuts</strong> +1, are distinct. This assumption doesn't really change anything -- if some of this values are the same, we can always change numbers <strong>weight</strong>[i] by arbitrary small numbers (the answer for the problem will also change by arbitrary small number) to make them all distinct.
</p>
<p>
Recall the previous solution, where given a number M, we constructed a solution where the maximum subpiece weight was M and the difference between the maximum and the minimum subpiece weights was minimal. Let's call such solution an <em>optimal solution for the given maximum subpiece weight M</em>.
</p>
<p>
<em>Lemma 2</em>. When the procedure <em>Test</em> is called, X<sub>i</sub> describe the optimal solution for the given maximum subpiece weight M = max{<strong>weight</strong>[i] / X<sub>i</sub>}.</p>
<p><em>Proof.</em> By the definition of M, <strong>weight</strong>[i] / X<sub>i</sub> &le; M, for all i. So we only need to prove that X<sub>i</sub> is the minimum integer such that <strong>weight</strong>[i] / X<sub>i</sub> &le; M. Suppose it's not so and for some i0, <strong>weight</strong>[i0] / (X<sub>i0</sub> - 1) &le; M. Let i1 be the index such that M = <strong>weight</strong>[i1] / X<sub>i1</sub>. Obviously, <strong>weight</strong>[i0] / (X<sub>i0</sub> - 1) &gt; <strong>weight</strong>[i0] / X<sub>i0</sub>, what means i0 &ne; i1. By assumption (*), <strong>weight</strong>[i0] / (X<sub>i0</sub> - 1) &lt; M. From the other side, when X<sub>i0</sub> was changed from X<sub>i0</sub> - 1 to X<sub>i0</sub>, <strong>weight</strong>[i0] / (X<sub>i0</sub> - 1) was the maximum subpiece weight. As this maximum only decreases during runtime of our algorithm, <strong>weight</strong>[i0] / (X<sub>i0</sub> - 1) &gt; M. Contradiction. <em>End of proof.</em></p>
</p>
<p>
<em>Lemma 3</em>. If A and B are the optimal solutions for the given maximum subpiece weights M1 and M2, where M1 &lt; M2, then A requires more cuts than B.</p>
<em>Proof</em>. In solution A, X<sub>i</sub>(A) = ceil(<strong>weight[i]</strong> / M1), and in solution B, X<sub>i</sub>(B) = ceil(<strong>weight[i]</strong> / M2), so X<sub>i</sub>(A) &ge; X<sub>i</sub>(B). At least for one i, X<sub>i</sub>(A) &gt; X<sub>i</sub>(B), as otherwise A and B would be the same solution. Therefore sum(X<sub>i</sub>(A)) &gt; sum(X<sub>i</sub>(B)). <em>End of proof.</em>
<p><em>Corollary 1</em>. For each number of cuts, there exists only one optimal solution for the given maximum weight, which requires this number of cuts.</p>
<p><em>Corollary 2</em>. Our greedy algorithm lists all possible optimal solutions for the given maximum weight, which require at most <strong>maxCuts</strong> cuts, and therefore is correct.</p>
<p>
For an example of implementation of this greedy algorithm take a look at the fastest <a href="/stat?c=problem_solution&amp;rm=298935&amp;rd=13512&amp;pm=10074&amp;cr=22675302">submission</a> on this problem by <tc-webtag:handle coderId="22675302" context="algorithm"/>. Note that his implementation has a complexity of O(N * <strong>maxCuts</strong>) and it's more than enough to pass systests. However, you can use a priority queue to obtain even better complexity of O(<strong>maxCuts</strong> * log N). Check <tc-webtag:handle coderId="21659750" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=298937&amp;rd=13512&amp;pm=10074&amp;cr=21659750">solution</a> for a reference.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10107&amp;rd=13512" name="10107">TeamManagement</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10107)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523759" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      10 / 632 (1.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      3 / 10 (30.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Gluk</strong> for 546.82 points (32 mins 8 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      521.98 (for 3 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The problem can be reformulated in terms of graph theory. We are given a tree, where vertices correspond to players and two vertices are connected by an edge if corresponding players are friends.
A subset S of <strong>K</strong> vertices is possible if for each vertex V from S there exists a loyal vertex V' (possibly V itself) such that path from V to V' contains only vertices from S.
</p>
<p>
In order to solve the problem let's first calculate the total number of possible sets. To do this we fix some vertex as a root and transform the unrooted tree into the rooted one. Note that we have quite a useful constraint -- each player has at most 3 friends. If we choose leaf vertex (i.e. vertex of degree 1) as a root, then each vertex in our rooted tree will have at most two sons.
</p>
<p>
Now we want to calculate the following function on our tree: F(V, cnt, typ), where V is a vertex, cnt is a number 0 to <strong>K</strong>, inclusive, and typ is an integer 0, 1 or 2. This function means the number of possible sets in the subtree rooted at vertex V and containing exactly cnt vertices. In addition, the definition of "possible" slightly changes based on the value of typ:
<ol>
<li><em>typ = 0:</em> usual definition;</li>
<li><em>typ = 1:</em> in addition to usual definition we assume that V is already connected to some loyal vertex out of the considered subtree, so vertices of a possible set can be connected not only to loyal vertices, but also to vertex V;</li>
<li><em>typ = 2:</em></li> in addition to usual definition we assume that in a possible set there must be a path from some loyal vertex to vertex V containing only vertices from the set.</li>
</ol>
</p>
<p>
Let's find the relations which allow to calculate the values of F. First, assume that V is a leaf vertex, i.e. has no sons. Then cnt must be no more than 1, otherwise F = 0. When cnt &le; 1, possible F values are described by the following constants:
</p>
<pre>
V is loyal:               V is not loyal:

        typ                      typ
cnt     0   1   2         cnt    0   1   2
------------------        ------------------
  0  |  1   1   0          0  |  1   1   0
  1  |  1   1   1          1  |  0   1   0
</pre>
<p>
Now let's take a non-leaf vertex V. It can have 1 or 2 sons. Let's assume it has 2 sons V1 and V2 (the case of 1 son is treated similarly and is more simple). There can be two possibilities:
<ol>
<li><em>We don't include V into the constructed possible set.</em> This can only be a possibility if typ=0 or typ=1. In case typ=2 we must include V. If we don't include V then both subtrees rooted at V1 and V2 become independent and we should construct possible sets in them independently. If subtree rooted at V1 will contain a set of i vertices, then subtree rooted at V2 will contain a set of cnt-i vertices. The number of possibilities to construct these sets is F(V1, i, 0) * F(V2, cnt-i, 0). To obtain the total number of possible sets we need to sum this up for all i between 0 and cnt, inclusive.
<li><em>We include V into the set.</em> Here we again have two possibilities:
<ul>
<li><em>a. typ = 1 or vertex V is loyal.</em> Here for both subtrees at V1 and V2 we can assume that their roots are already connected to some loyal vertex (either to V if V is loyal or to some outer vertex if typ=1). So the number of possibilities is the sum of F(V1, i, 1) * F(V2, cnt-i-1, 1) over all i's.</li>
<li><em>b. typ &ne; 1 and vertex V is not loyal.</em> As we included a non-loyal vertex V into the set, we must make it connected to a loyal vertex from the set. Thus, in one of subtrees at V1 and V2 root must be connected to a loyal vertex (typ = 2) and in the other subtree we can assume that root is already connected to a loyal vertex in the opposite subtree (typ = 1). So the first sketch for the number of possibilities is the sum of F(V1, i, 2) * F(V2, cnt-i-1, 1) + F(V1, i, 1) * F(V2, cnt-i-1, 2) for all i's. But, in fact, we've calculated the cases when in both subtrees root is connected to a loyal vertex inside this subtree (typ = 2) twice and they need to be subtracted once. I.e. the correct number of possibilities is the sum of F(V1, i, 2) * F(V2, cnt-i-1, 1) + F(V1, i, 1) * F(V2, cnt-i-1, 2) - F(V1, i, 2) * F(V2, cnt-i-1, 2) for all i's.
</ul>
</ol>
</p>
<p>
Ok, we managed to calculate the total number of possible sets in the given tree -- it's just T = F(R, <strong>K</strong>, 0) where R is the root of all tree. Now to solve our problem we can use the following trick. Assume that it's forbidden to include some vertices into a possible set. Under this constraints we still can calculate the total number of possible sets using almost the same DP approach (just some cases become impossible for some vertices). For each i let's calculate T<sub>i</sub> -- the number of possible sets when it's forbidden to take the vertex i. Note that T - T<sub>i</sub> gives the number of possible sets which contain the vertex i and therefore the probability that the vertex i is included into a random possible set is (T - T<sub>i</sub>) / T.
</p>
<p>
Possible Java implementation of this approach is provided below:
</p>
<pre>
import java.util.*;

public class TeamManagement {
  int N, K;
  boolean[][] adj;
  boolean[] isLoyal;
  boolean[] canTake;
  long[][][] cnt;

  void solve(int v, int p) {
    // find all subtrees and solve the problem for them
    int sub = 0;
    for (int i=0; i &lt; N; i++)
      if (i != p &amp;&amp; adj[v][i]) sub++;
    int[] num = new int[sub];
    int pos = 0;
    for (int i=0; i &lt; N; i++)
      if (i != p &amp;&amp; adj[v][i]) {
        num[pos++] = i;
        solve(i, v);
      }

    // leaf vertex    
    if (sub == 0) {
      if (isLoyal[v]) {
        cnt[v][0][0] = 1; cnt[v][1][0] = (canTake[v]?1:0);
        cnt[v][0][1] = 1; cnt[v][1][1] = (canTake[v]?1:0);
        cnt[v][0][2] = 0; cnt[v][1][2] = (canTake[v]?1:0);
      } else {
        cnt[v][0][0] = 1; cnt[v][1][0] = 0;
        cnt[v][0][1] = 1; cnt[v][1][1] = (canTake[v]?1:0);
        cnt[v][0][2] = 0; cnt[v][1][2] = 0;
      }
      return;
    }
        
    // don't take V
    for (int i=0; i&lt;=K; i++)
      if (sub == 1) {
        cnt[v][i][0] += cnt[num[0]][i][0];
        cnt[v][i][1] += cnt[num[0]][i][0];
      } else {
        for (int j=0; j&lt;=i; j++) {
          long add = cnt[num[0]][j][0] * cnt[num[1]][i-j][0];
          cnt[v][i][0] += add;
          cnt[v][i][1] += add;
        }
      }
        
    // take V
    if (!canTake[v]) return;
    for (int i=1; i&lt;=K; i++)
      for (int typ=0; typ&lt;3; typ++)
        if (typ == 1 || isLoyal[v]) {
          // case a
          if (sub == 1)
            cnt[v][i][typ] += cnt[num[0]][i-1][1];
          else
            for (int j=0; j&lt;=i-1; j++)
              cnt[v][i][typ] += cnt[num[0]][j][1] * cnt[num[1]][i-j-1][1];
        } else {
          // case b
          if (sub == 1)
            cnt[v][i][typ] += cnt[num[0]][i-1][2];
          else
            for (int j=0; j&lt;=i-1; j++)
              cnt[v][i][typ] += cnt[num[0]][j][1] * cnt[num[1]][i-j-1][2] +
                                cnt[num[0]][j][2] * cnt[num[1]][i-j-1][1] -
                                cnt[num[0]][j][2] * cnt[num[1]][i-j-1][2];
        }
  }

  public double[] getDistribution(int N, int K, String[] fr, String loy) {
    // parse input tree
    this.N = N; this.K = K;
    isLoyal = new boolean[N];
    for (int i=0; i &lt; N; i++)
      isLoyal[i] = loy.charAt(i) == 'Y';
    adj = new boolean[N][N];
    int[] deg = new int[N];
    for (int i=0; i &lt; fr.length; i++) {
      int A = Integer.parseInt(fr[i].split(" ")[0]);
      int B = Integer.parseInt(fr[i].split(" ")[1]);
      adj[A][B] = adj[B][A] = true;
      deg[A]++; deg[B]++;
    }
    // choose correct root
    int R = 0;
    while (deg[R] &gt; 1) R++;
    // calculate T
    cnt = new long[N][K+1][3];
    canTake = new boolean[N];
    Arrays.fill(canTake, true);
    solve(R, -1);
    long cAll = cnt[R][K][0];
    double[] res = new double[N];
    for (int i=0; i &lt; N; i++) {
      // calculate T<sub>i</sub>
      for (int j=0; j&lt;N; j++)
        for (int k=0; k&lt;=K; k++)
          Arrays.fill(cnt[j][k], 0);
      canTake[i] = false;
      solve(R, -1);
      res[i] = 1.0 - cnt[R][K][0] * 1.0 / cAll;
      canTake[i] = true;
    }
    return res;
  }
}
</pre>
<br />


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
