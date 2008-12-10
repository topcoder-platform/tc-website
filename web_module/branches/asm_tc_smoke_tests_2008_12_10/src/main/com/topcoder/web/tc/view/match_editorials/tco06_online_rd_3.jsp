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
<tc-webtag:forumLink forumID="505937" message="Discuss this match" /></div>
<span class="bodySubtitle">2006 TopCoder Open <br> Online Round 3 </span><br>March 15, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
Top 200 coders faced three pretty different problems this time. 
The easy was a classical read-and-code contest, the hard required some work with probabilities, while
the medium problem was a real trap for most of the coders.
<b>tomek</b> shined as a killing challenger this night, getting 775 points during the challenge phase.
1837 points is the highest total score ever for a TopCoder tournament round, while 3516 rating points established the new all time highest rating.
</p>
<p>
rem and haha finished at second and third, both about 500 points behind tomek. 
TopCoder legends Johd Dethridge and Petr rounded the top five. 
gevak's 20 successful challenges are definitely worth mentioning, since it is the new TopCoder record 
(tomek also broke the previous record with 19).
Congratulations and good luck in Round 4 to all 100 advancers!
</p>
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6127&amp;rd=9922" name="6127">LastStone</a></b>
</font>
<A href="Javascript:openProblemRating(6127)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<br>
Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      200
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      192 / 194 (98.97%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      171 / 192 (89.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 199.45 points (1 mins 29 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      182.33 (for 171 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem was a variation of the classical take-last-match problem. 
<i>Position</i> in this game is a number of stones left. 
First of all, each <i>position</i> has a determined outcome. 
That is, one of the players can win the game even if his opponent plays optimally (for example, 1 is always a winning position because the first player wins the game on his first move).
If the first player wins a <i>position</i>, we say the <i>position</i> is <i>winning</i>, otherwise its losing. 
We are to return the number of winning positions between <b>m</b> and <b>n</b>, inclusive.
</p>
<p>
A position is winning in one of the following two cases. 
First, the position is winning if the number of stones left is in <b>turns</b> - in this case the first player wins on his first move.
Second, the position is winning if the first player can make the position to be losing after his first move. 
Since any move leads to a smaller number of stones in the box, any position depends only on positions with a smaller number of stones.
Therefore, the problem can be solved by a simple DP. 
For each number between 1 and <b>n</b>, we remember whether this position is winning. 
See tomek's <a href="/stat?c=problem_solution&rm=247879&rd=9922&pm=6127&cr=144400">solution</a> for a clean implementation.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6029&amp;rd=9922" name="6029">FamilyTree</a></b>
</font>
<A href="Javascript:openProblemRating(6029)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
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
      178 / 194 (91.75%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      16 / 178 (8.99%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>AdrianKuegel</b> for 350.25 points (20 mins 31 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      237.77 (for 16 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Credit for writing this beautiful problem goes to <a href="/tc?module=MemberProfile&cr=159544">dgoodman</a>.
</p>
<p>
The problem splits into two independent parts. 
The first (easy) part was to determine whether parent-child dependencies form a cycle. 
In this case a person becomes his own descendant. 
To check this, create a graph with a vertice for each person and a directed edge for each parent-child pair.
Find the transitive closure (Floyd-Warshall is fast enough) and check for every vertice whether it is accessible from itself.
</p>
<p>
It was the second part what resulted in an ocean of challenges. 
One needs to check whether its possible to assign genders to people such that for each person his parent won't have the same gender.
To do this, lets build another graph. 
This graph will have a vertice for each person, and two persons will be connected by an edge if and only if they have a common child (in addition, we may already have some info about person's genders).
One can correctly assign genders if and only if the graph can be painted with 2 colors such that neither edge will connect vertices of the same color.
This is a classical graph coloring problem, and DFS is the easiest way to solve it.
</p>
<p>
Having these two parts implemented, the other part is trivial. 
Process input strings one by one, adding edges to graphs and checking both graphs for consistency.
As soon as you find any contradiction, return the index of the last processed string. 
If you were able to process all inputs without any contradiction, return -1. Check <a href="/stat?c=problem_solution&rm=247880&rd=9922&pm=6029&cr=8394868">rem's</a>
solution for a short and clean implementation.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6076&amp;rd=9922" name="6076">TakeBus</a></b>
</font>
<A href="Javascript:openProblemRating(6076)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
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
      66 / 194 (34.02%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      35 / 66 (53.03%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>sjelkjd</b> for 815.45 points (14 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      620.59 (for 35 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
No surprise, the idea for this problem came to me while I was waiting at a bus stop. 
The main idea behind this problem was the following. 
If you decide to skip a bus, then you'll need to consider only buses which go faster (spend less time) than the one you skipped.
To deduce this fact during the contest, the following logics might be helpful.
</p>
<p>
Lets start from the simplest case with 2 buses. 
Let the input contain only two buses, with trip times equal to t<sub>A</sub> and t<sub>B</sub> (t<sub>A</sub> < t<sub>B</sub>).
If bus A comes not later than bus B, you get it without any doubt. 
If the bus B comes before the bus A, you need to compare two different estimations - expected times for you to get home if you'll take the bus or you skip it.
In the first case, its just t<sub>B</sub>. Let T<sub>1</sub> be the estimation for the second case. 
T<sub>1</sub> is the sum of t<sub>A</sub> and E<sub>1</sub> - expected time to wait until the next bus A.
Imagine now you've decided to skip the bus (this happens only if T<sub>1</sub> < t<sub>B</sub>). 
Then, if later the second bus will come to the stop again, 
you again will need to compare two estimations - t<sub>B</sub> and T<sub>2</sub> = t<sub>A</sub> + E<sub>2</sub>.
But E<sub>2</sub> is strictly less than E<sub>1</sub>, since we waited some time and the expected time to wait for the bus A decreased.
Therefore, T<sub>2</sub> is strictly less than T<sub>1</sub>, which is less than t<sub>B</sub>. 
This means you are expected to get home faster if you'll wait for bus A.
</p>
<p>
After the case with 2 buses, the similar approach can be used for a general case. 
Again, the estimated time to get home using the current (slow) bus is the same at any moment of time, 
but the estimated time in case we'll wait for a faster one decreases with time.
Now we are ready to code a DP-solution. The state for our solution is a pair of integers.
The first integer in the state represents the time elapsed since we came to the stop,
 and the second stands for the <i>fastest</i> bus we skipped 
(of course, we'll need to sort buses by their trip times at the very first line of our solution). 
See tomek's <a href="/stat?c=problem_solution&rm=247879&rd=9922&pm=6076&cr=144400">solution</a>
for a clean DP algorithm.
</p>
Another approach was to go backwards from the end, computing the estimations from the last to the first. 
This allows you to compute the estimation for the i-th moment knowing the estimation for the (i+1)-th one.
See bladerunner's <a href="/stat?c=problem_solution&rm=247879&rd=9922&pm=6076&cr=311170">solution</a> for a reference.



<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="/public_right.jsp">
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
