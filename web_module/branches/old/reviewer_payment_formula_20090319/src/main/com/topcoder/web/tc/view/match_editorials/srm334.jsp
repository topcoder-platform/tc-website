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
    <A href="/stat?c=round_overview&er=5&rd=10658">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506224" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 334</span><br>Saturday, January 13, 2007
<br><br>

<h2>Match summary</h2> 

In Division 1, the problems were much easier than those in SRM 333. We didn't have 
to wait long for the first submissions, with many coders scoring around 240 points on 
the easy problem. The remaining two problems also didn't stop the top competitors 
for long. After the first 20 minutes of the coding phase <tc-webtag:handle coderId="251074" context="algorithm"/> took the lead, thanks to the fastest submission of the hard followed by <tc-webtag:handle coderId="144400" context="algorithm"/> the fastest solution of 
the medium problem. After only 5 minutes, however, the situation began to change. 
<tc-webtag:handle coderId="144400" context="algorithm"/> climbed to first place with all three submissions after 27 minutes of the match 
had gone by. However he ended up in second place at the end of coding, with <tc-webtag:handle coderId="9906197" context="algorithm"/> taking over his spot in first place. 
<br />
<br />
The hard problem was a little below average, in terms of difficulty, and the idea for it was pretty 
standard. Because of that, more than 100 coders 
were able to submit all three problems by the end of the coding phase. 
<br />
<br />

During the challenge phase <tc-webtag:handle coderId="144400" context="algorithm"/> gained 125 point with three successful challenges on 
the easy problem and overcame <tc-webtag:handle coderId="9906197" context="algorithm"/>, who took  second place. 
<tc-webtag:handle coderId="7390467" context="algorithm"/> finished third, thanks to 
 four challenges on the easy problem. 
<br />
<br />
In Division 2, only a dozen coders were able to solve more than two problems. First 
place was taken by Argentinian newcomer <tc-webtag:handle coderId="22664457" context="algorithm"/>. <tc-webtag:handle coderId="22664457" context="algorithm"/> solved all three problems and 
successfully challenged two other coders' solutions. After this SRM <tc-webtag:handle coderId="22664457" context="algorithm"/> moved to 
Division 1 with 1900 rating points. <tc-webtag:handle coderId="21011020" context="algorithm"/> came in second in Division 2, followed by <tc-webtag:handle coderId="15898218" context="algorithm"/> in third.
<br />
<br />
 

<h1> The Problems </h1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7358&amp;rd=10658" name="0.1_7358" target="_blank">SupermarketDiscount</a></b> 
</font> 
<A href="Javascript:openProblemRating(7358)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=506224" target="_blank"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"></a>
<br> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td style="background:#eee"> 
      <b>Value</b> 
    </td> 
    <td style="background:#eee"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Submission Rate</b> 
    </td> 
    <td style="background:#eee"> 
      588 / 638 (92.16%) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Success Rate</b> 
    </td> 
    <td style="background:#eee"> 
      397 / 588 (67.52%) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>High Score</b> 
    </td> 
    <td style="background:#eee"> 
      <b>danielf</b> for 246.71 points (3 mins 17 secs) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Average Score</b> 
    </td> 
    <td style="background:#eee"> 
      196.62 (for 397 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Generally, in real life, it's hard to optimize purchases in order to get the maximal discount. 
Fortunately, we have a very simple sales rule and only three 
girls who do not want to split up goods across multiple transactions. In our case the girls 
have only three possibilities: pay separately, pay together or combine purchases 
for two of three girls. There are three ways to select two of three girls, so we have five 
possibilities in total. Here is the sample Java solution.

<pre>
    int discounted(int x) {
        return x >= 50 ? x-10 : x;
    }

    int minAmount(int[] goods) {
        int ans = Integer.MAX_VALUE;
        ans = Math.min(ans, discounted(goods[0]) + discounted(goods[1]) + discounted(goods[2]));
        ans = Math.min(ans, discounted(goods[0]+ goods[1]) + discounted(goods[2]));
        ans = Math.min(ans, discounted(goods[0]+ goods[2]) + discounted(goods[1]));
        ans = Math.min(ans, discounted(goods[2]+ goods[1]) + discounted(goods[0]));
        ans = Math.min(ans, discounted(goods[0]+ goods[1] + goods[2]));
        return ans;
    }
</pre>

<br /><br />

 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7245&amp;rd=10658" name="0.1_7245" target="_blank">KnightTour</a></b> 
</font> 
<A href="Javascript:openProblemRating(7245)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=506224" target="_blank"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"></a>
<br> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td style="background:#eee"> 
      <b>Value</b> 
    </td> 
    <td style="background:#eee"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Submission Rate</b> 
    </td> 
    <td style="background:#eee"> 
      481 / 638 (75.39%) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Success Rate</b> 
    </td> 
    <td style="background:#eee"> 
      406 / 481 (84.41%) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>High Score</b> 
    </td> 
    <td style="background:#eee"> 
      <b>n1b</b> for 478.57 points (6 mins 3 secs) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Average Score</b> 
    </td> 
    <td style="background:#eee"> 
      330.02 (for 406 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 


The solution for this problem is pretty straightforward. We just need 
to emulate the knight's trip through the given path and check whether it is 
really a valid re-entrant knight's tour or not. Here is 
<tc-webtag:handle coderId="21571500" context="algorithm"/>'s Java code, 
which  nicely shows this idea:

<pre>
public class KnightTour { 
  boolean vis[][]; 
   
  boolean valid(String a, String b) { 
    int la = a.charAt(0) - 'A'; 
    int na = a.charAt(1) - '1'; 
    int lb = b.charAt(0) - 'A'; 
    int nb = b.charAt(1) - '1'; 
    if (vis[la][na]) return false; 
    vis[la][na] = true; 
    int dl = Math.abs(la - lb); 
    int dn = Math.abs(na - nb); 
    return (dl == 1 && dn == 2) || (dl == 2 && dn == 1); 
  } 

  public String checkTour(String[] a) { 
    vis = new boolean[6][6]; 
    boolean ok = true; 
    for (int i = 0; i < a.length; i++) { 
      ok &= valid(a[i], a[(i+1) % a.length]); 
      System.out.println("Round " + i + ": " + ok); 
    } 
    return ok ? "Valid" : "Invalid"; 
  } 
}
</pre>

<br /><br />

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7244&amp;rd=10658" name="0.1_7244" target="_blank">ExtendedHappyNumbers</a></b> 
</font> 
<A href="Javascript:openProblemRating(7244)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=506224" target="_blank"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"></a>
<br> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td style="background:#eee"> 
      <b>Value</b> 
    </td> 
    <td style="background:#eee"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Submission Rate</b> 
    </td> 
    <td style="background:#eee"> 
      76 / 638 (11.91%) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Success Rate</b> 
    </td> 
    <td style="background:#eee"> 
      12 / 76 (15.79%) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>High Score</b> 
    </td> 
    <td style="background:#eee"> 
      <b>jaro3000</b> for 624.00 points (25 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Average Score</b> 
    </td> 
    <td style="background:#eee"> 
      468.15 (for 12 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td style="background:#eee"> 
      <b>Value</b> 
    </td> 
    <td style="background:#eee"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Submission Rate</b> 
    </td> 
    <td style="background:#eee"> 
      175 / 487 (35.93%) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Success Rate</b> 
    </td> 
    <td style="background:#eee"> 
      138 / 175 (78.86%) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>High Score</b> 
    </td> 
    <td style="background:#eee"> 
      <b>Petr</b> for 455.15 points (9 mins 6 secs) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Average Score</b> 
    </td> 
    <td style="background:#eee"> 
      290.60 (for 138 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

First of all, let's find the upper limit for a number that can be reached in the sequence N, 
S<sub>K</sub>(N), S<sub>K</sub>(S<sub>K</sub>(N)) and so on, where N is not greater than 1 million 
and K is not greater than 6. It is easy to see that this upper limit is less than 4*10<sup>6</sup> 
because S<sub>6</sub> for any number below 4*10<sup>6</sup> is not greater than 3<sup>6</sup> + 6*9<sup>6</sup>
 = 3189375. 
 </p>
 <p>Now, let's begin to solve the problem. The naive solution is to take each number N from <b>A</b> 
to <b>B</b>, inclusive, and build the sequence N, S<sub>K</sub>(N), S<sub>K</sub>(S<sub>K</sub>(N)) 
and so on, until some number in this sequence appears twice. After that there will be no
 new values in the sequence because its elements begin to repeat. We can find the minimal element in 
 this (already built) sequence's prefix, and it will be the answer for the N.
<br />
<br />

Unfortunately, this naive solution works too slowly. Its performance can 
be improved a lot, however. During the computation of the answer for 
the number N we can simultaneously compute and store answers for S<sub>K</sub>(N), 
S<sub>K</sub>(S<sub>K</sub>(N)) and so on. After that, if we need a number with a previously computed answer, we can just return this value without any hesitation.
<br />
<br />

You can use <tc-webtag:handle coderId="10574855" context="algorithm"/>'s C# <a href="http://www.topcoder.com/stat?c=problem_solution&cr=10574855&rd=10658&pm=7244">code</a> as a reference. 
<br /><br />
 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7249&amp;rd=10658" name="0.1_7249" target="_blank">EncodedSum</a></b> 
</font> 
<A href="Javascript:openProblemRating(7249)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=506224" target="_blank"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"></a>
<br> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td style="background:#eee"> 
      <b>Value</b> 
    </td> 
    <td style="background:#eee"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Submission Rate</b> 
    </td> 
    <td style="background:#eee"> 
      399 / 487 (81.93%) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Success Rate</b> 
    </td> 
    <td style="background:#eee"> 
      233 / 399 (58.40%) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>High Score</b> 
    </td> 
    <td style="background:#eee"> 
      <b>JongMan</b> for 244.24 points (4 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Average Score</b> 
    </td> 
    <td style="background:#eee"> 
      171.70 (for 233 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 


This is a fairly easy problem for Division One, and doesn't require much effort to solve and code. 
Nevertheless, many coders wrote a naive solution and were beaten in the challenge phase. 
<br />
<br />

The naive solution is as follows: Try all possible assignments between letters and digits 
and take the one that leads to the best result. For the fixed assignment we can calculate the total 
sum by iterating along all given summands. Clearly, this solution is not fast enough, but even 
small improvements allow it to fit to the time limit.
<br />
<br />

Let's interpret each integer, which needs to be summed as follows (where n is the length of current integer): 

<pre>
Letter<sub>0</sub> * 10<sup>n-1</sup> + Letter<sub>1</sub> * 10<sup>n-2</sup> + ... + Letter<sub>n-1</sub> * 10<sup>0</sup>, 
</pre>

After that we can combine the items around each letter 
from 'A' to 'J'. Now, if we know the assignment between letters and digits, we can calculate the 
total sum by 10 operations. This is much faster than without pre-calculation. 

This optimization was good enough to pass system tests -- see <tc-webtag:handle coderId="7446789" context="algorithm"/>'s <a href="http://www.topcoder.com/stat?c=problem_solution&cr=7446789&rd=10658&pm=7249">solution</a> as an example.
<br /><br /> 
You can move forward, however, and create A solution without iterations of all possible 
assignments at all. The main idea is that, after the optimization described above, you 
can easily state your preferences about the values of the letters. The only thing you should worry 
about is a zero digit that cannot be assigned to some of the letters.

<br />
<br />

 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7246&amp;rd=10658" name="0.1_7246" target="_blank">Terrorists</a></b> 
</font> 
<A href="Javascript:openProblemRating(7246)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=506224" target="_blank"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"></a>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td style="background:#eee"> 
      <b>Value</b> 
    </td> 
    <td style="background:#eee"> 
      900 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Submission Rate</b> 
    </td> 
    <td style="background:#eee"> 
      149 / 487 (30.60%) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Success Rate</b> 
    </td> 
    <td style="background:#eee"> 
      102 / 149 (68.46%) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>High Score</b> 
    </td> 
    <td style="background:#eee"> 
      <b>Abednego</b> for 891.70 points (2 mins 44 secs) 
    </td> 
  </tr> 
  <tr> 
    <td style="background:#eee"> 
      <b>Average Score</b> 
    </td> 
    <td style="background:#eee"> 
      673.86 (for 102 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

In this problem you are required to find a sum of the edges of a <a href="http://en.wikipedia.org/wiki/Cut_%28graph_theory%29">minimal cut</a> 
in the given graph. According to the <a href="http://en.wikipedia.org/wiki/Max-flow_min-cut_theorem">max-flow min-cut theorem</a> a sum of the edges of a <a href=" http://en.wikipedia.org/wiki/Cut_%28graph_theory%29">minimal cut</a> 
that separates two vertexes v1 and v2 equals to the <a href="http://en.wikipedia.org/wiki/Maximum_flow_problem">maximum flow</a> 
in the given graph with v1 and v2 as a source and a sink respectively. For any cut in the graph the town 0 will be separated from some other town. 
So, to solve the problem we can fix the town 0 as a source and try all other towns as a sink. 
The minimal of the obtained result will be the answer for the original problem.
<br /><br />

You can view <tc-webtag:handle coderId="20286298" context="algorithm"/>'s solution with this idea <a href="http://www.topcoder.com/stat?c=problem_solution&rm=263224&rd=10658&pm=7246&cr=20286298">here</a>.
<br /><br />
 

<div class="authorPhoto">
    <img src="/i/m/Andrew_Lazarev_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7485898" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
