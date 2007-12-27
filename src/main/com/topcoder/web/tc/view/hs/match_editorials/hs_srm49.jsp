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
    <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/tc?module=HSRoundOverview&rd=10809&snid=2&er=5">Match Overview</A><br />

<tc-webtag:forumLink forumID="516575" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 49</span><br />Wednesday, December 19, 2007
<br /><br />


<h2>Match summary</h2> 

<p>

The last High School SRM before the second TCHS Tournament attracted 127 registrants,
15 of them newcomers. They faced a set of a tricky Easy, a Medium that had more passing solutions 
than Easy, and a rather simple Hard. After the system tests it turned out that only 81 people
got a positive score, and 24 of them got all three problems correct.
</p>
<p>
<tc-webtag:handle coderId="22663117" context="hs_algorithm"/>
won the match due to 5 successfull challenges, with 
<tc-webtag:handle coderId="22653715" context="hs_algorithm"/>
and 
<tc-webtag:handle coderId="22628118" context="hs_algorithm"/>
rounding out the top three.
</p>

 

<H1>

The Problems

</H1>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8313&amp;rd=10809" name="8313">DepositProfit</a></b>

</font>

<A href="Javascript:openProblemRating(8313)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516575" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      86 / 115 (74.78%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      61 / 86 (70.93%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>marcina007</b> for 246.12 points (3 mins 34 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      204.85 (for 61 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

To solve this problem, one had to simulate the process of counting monthly interest and adding it to the 
total balance. The trick was to do it exactly as described in the statement.
The easiest way to avoid troubles with doubles imprecision was to convert <b>amount</b>
and <b>profit</b> to cents, and to do the further calculations using integer arithmetics.
</p>

<p>
Java solution follows:

<pre>
public class DepositProfit {
    public int depositTerm(int amount, int annualInterest, int profit) {
        amount*=100;
        profit*=100;
        int months,balance=amount;
        for (months=0; balance&lt;amount+profit; months++)
            balance+=(balance*annualInterest)/1200;
        return months;
    }
}
</pre>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8279&amp;rd=10809" name="8279">TransformingArray</a></b>

</font>

<A href="Javascript:openProblemRating(8279)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516575" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      92 / 115 (80.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      65 / 92 (70.65%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>yuhch123</b> for 495.60 points (2 mins 40 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      424.11 (for 65 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

At first glance this problem seems absolutely straightforward: 
perform the transformation <b>N</b> times, and find the smallest element of the final array.
The trick is, under the given constraints such implementation is almost sure to fail.
If we store the value of "the product of all elements of the array except for the current element"
as a variable of integer or long integer type, we'll get an overflow during the first transformation
on big arrays like {10000,9999,...,9951}.
And if we store it as <b>java.math.BigInteger</b> or another implementation of arbitrary large numbers, 
we'll get time limit on tests with 100000 transformations.
</p>
<p>
There exist ways to solve this problem using simulation and a simple note:
<pre>
if numbers <b>p</b>, <b>a[i]</b> and <b>a[j]</b> are positive and <b>a[i]</b>&lt;<b>a[j]</b>, 
then <b>p/a[i]</b>&gt;<b>p/a[j]</b>.
</pre>
If during each transformation we replace each element of the array with a certain number 
divided by the element, we'll get an array with wrong numbers, but the indices of the smallest, 
second smallest, ..., greatest element in this array will be the same as in the correct one.
</p>
<p>
However, the intended solution requires to make one more observation:
after one transformation the minimal element of the initial array becomes the maximal element of the resulting array,
and vice versa, and two transformations, applied in row, don't change the positions of minimal and maximal elements.
Therefore, all we need is to return the index of the smallest element in <b>a</b> for even <b>N</b>, 
and the index of the greatest element in <b>a</b> for odd <b>N</b>.
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8312&amp;rd=10809" name="8312">TowersAttack</a></b>

</font>

<A href="Javascript:openProblemRating(8312)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516575" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      55 / 115 (47.83%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      38 / 55 (69.09%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>LittlePig</b> for 955.64 points (6 mins 10 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      728.22 (for 38 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

First, let's note that a tower <b>t</b><sub>0</sub> is able to damage the enemy if and only if there exists a 
sequence of "intermediate" towers <b>t</b><sub>1</sub>, ..., <b>t</b><sub>n</sub>
such that:
<ul><li>
for i=0, ..., (n-1) the distance between towers <b>t</b><sub>i</sub> and <b>t</b><sub>i+1</sub>
is less than or equal to <b>r</b>.
</li><li>
the distance between tower <b>t</b><sub>n</sub> and the enemy is less than or equal to <b>r</b>.
</li><li>
if the tower can attack the enemy directly, the length of the sequence is 0.
</li></ul>
Each intermediate tower halves the energy transmitted, so after passing through a sequence 
of <b>n</b> towers the energy becomes 2<sup><b>n</b></sup> times smaller.
Thus, to maximize the damage done to the enemy by a tower, 
we need to minimize the number of intermediate towers (if such sequence doesn't exist, 
the damage done by this tower is 0). Since each tower can accumulate unlimited energy,
individual damages can be maximized independently, and 
the maximum damage of all towers is equal to the sum of maximum damages of each tower.
</p>
<p>
To minimize the numbers of intermediate towers, let's represent the input data as an undirected graph,
where each vertice corresponds a tower or the enemy, 
and a pair of vertices is connected with an edge if and only if the distance between corresponding 
towers (or a tower and the enemy) is less than or equal to <b>r</b>.
Then the minimal number of intermediate towers between a tower and the enemy will be equal to
the number of vertices in the shortest path between corresponding vertices.
</p>
<p>
The task of finding the length of the shortest path between vertices in an undirected graph
is a typical one. In this case it is convenient to solve it either with breadth-first search 
(starting with the enemy vertice and finishing when we visited all vertices we could) 
or with Floyd-Warshall shortest path algorithm. See 
<tc-webtag:handle coderId="22631114" context="hs_algorithm"/>
's 
<a href="/tc?module=HSProblemSolution&cr=22631114&rd=10809&pm=8312">
solution</a>
as a sample of first approach, and 
<tc-webtag:handle coderId="22663117" context="hs_algorithm"/>
's 
<a href="/tc?module=HSProblemSolution&cr=22663117&rd=10809&pm=8312">
solution</a>
as a sample of second one.

</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/Nickolas_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15635590" context="algorithm"/><br />    <em>TopCoder Member</em>
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
