<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 407 Problem Set &amp; Analysis</title>

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
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=12179">Match Overview</a><br />
    <tc-webtag:forumLink forumID="521832" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 407</span><br />Thursday, June 26, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
This round match attracted 1374 coders, 584 Div1 and 790 Div2. In Div1 most of the coders successfully submitted easy and medium in first 30 minutes and spent
all the remaining time for solving the hard. <tc-webtag:handle coderId="22653044" context="algorithm"/> 
got the first place with the fastest submission for the hard. He was VERY closely followed by 
<tc-webtag:handle coderId="22629546" context="algorithm"/>  who made 7 successful challenges 
on the easy. The third place went to <tc-webtag:handle coderId="19849563" context="algorithm"/> .

<br /><br />
Div2 competition ended up with <tc-webtag:handle coderId="22717246" context="algorithm"/>, 
<tc-webtag:handle coderId="22512513" context="algorithm"/> and 
<tc-webtag:handle coderId="21346612" context="algorithm"/> on the top three places. 
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9793&amp;rd=12179" name="9793">SpiralWalking</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9793)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521832" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      383 / 790 (48.48%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      328 / 383 (85.64%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>tripshock</strong> for 219.46 points (10 mins 54 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      133.31 (for 328 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The solution was just an implementation of the algorithm described in the statement: walk forward until you
hit the boundary of the level or already visited cell (in such case turn right). Summarize prices for all the cells 
except those where you made turns. 
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9824&amp;rd=12179" name="9824">CorporationSalary</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9824)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521832" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      339 / 790 (42.91%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      159 / 339 (46.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>tt_dkhoa</strong> for 469.50 points (7 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      342.58 (for 159 correct submissions) 
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
      578 / 584 (98.97%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      438 / 578 (75.78%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>ACRush</strong> for 247.62 points (2 mins 47 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      216.76 (for 438 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The only question which appeared was: in which order do we have to count salaries of the employees 
to be sure that we already know the salary for all direct subordinates of the current employee? 
The constraints told that given relations graph would have no cycles. It's known that each directed 
graph having no cycles can be sorted <a target="_blank" href="http://en.wikipedia.org/wiki/Topological_sort">topologically</a>. 
So the solution becomes really simple: sort the given graph topologically (using depth-first search) 
and then simply count the salary for each employee and sum these values.<br /><br />Due to small limitations for 
the number of employees there was other approach which became quite popular in division 2: on each step 
find the employee for whom the salaries of all his direct subordinates are known and count his salary, 
repeat this until all the salaries are known. 

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9794&amp;rd=12179" name="9794">CheapestRoute</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9794)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521832" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      38 / 790 (4.81%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 38 (10.53%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>iburmistrov</strong> for 569.18 points (30 mins 0 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      472.72 (for 4 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
As cost of teleport usage depends on number of teleports used before, number of a current 
cell isn't enough to define current position. So we will use a pair (<strong>a</strong>,<strong>b</strong>), 
where <strong>a</strong> is a cell number and <strong>b</strong> is a number of teleports already used, 
to define our position in the corridor. The weight of a move can be defined by a pair 
(<strong>a</strong>,<strong>b</strong>), where <strong>a</strong> is a cost of this move and <strong>b</strong> is time needed 
for this move. As we are looking for the cheapest route with as small number of moves as 
possible for such cost, the comparison for two moves will be defined as: (<strong>a</strong>,<strong>b</strong>)
&lt; (<strong>c</strong>,<strong>d</strong>) &lt;=&gt; (<strong>a</strong>&lt;<strong>c</strong>) or ( (<strong>a</strong>=<strong>c</strong>) and 
(<strong>b</strong>&lt;<strong>d</strong>) ). Now we can introduce the graph with vertices numbered as (<strong>a</strong>,<strong>b</strong>) 
(meaning of <strong>a</strong> and <strong>b</strong> is described above), representing our position in the corridor, 
and edges with weights given using pairs (also introduced above), representing walking and 
using teleports. Our goal is to find a path from vertex (<strong>0</strong>, <strong>0</strong>) to vertex (<strong>n-1</strong>, <strong>i</strong>) 
(where <strong>i</strong> can take any value) with the minimum weight. This problem can be solved using any 
shortest-path algorithm. You can see the implementation of this idea 
<a href="/stat?c=problem_solution&amp;rm=297808&amp;rd=12179&amp;pm=9794&amp;cr=22512513">here</a>.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9791&amp;rd=12179" name="9791">PointsGame</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9791)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521832" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      422 / 584 (72.26%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      299 / 422 (70.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>ACRush</strong> for 483.51 points (5 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      318.73 (for 299 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
From the fact that the number of points is not greater than 12 and that each point can be in 3 states 
(not colored, colored by first player, colored by second player) we can see that the number of game 
positions won't be greater than 3<sup>12</sup> = 531,441 so we can compute the best score which can 
be achieved for each position. For the position where all points are already colored we can easily compute 
its score. Let's look at the position where it's first (second) player's turn: if we color one of the 
uncolored points then we will receive the score equal to the score of new position, so using 
the fact that both players play optimally, we check all possibilities for the next cell to be colored 
and select the one which will give us maximum (minimum) points. You can see the 
recursive implementation of this idea <a href="/stat?c=problem_solution&amp;rm=297774&amp;rd=12179&amp;pm=9791&amp;cr=19849563">here</a>.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9790&amp;rd=12179" name="9790">TransformMatrix</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9790)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521832" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      60 / 584 (10.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      12 / 60 (20.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>jbernadas</strong> for 703.04 points (20 mins 21 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      491.99 (for 12 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First you have to notice that you will never swap two cells if they have same digits in them. 
So each swap is moving '1' from one cell to another. If <strong>A</strong>[<strong>i</strong>][<strong>j</strong>] = 
<strong>B</strong>[<strong>i</strong>][<strong>j</strong>] then '1' will be put into this cell <strong>c<sub>ij</sub>/2</strong> times and will be removed 
from this cell <strong>c<sub>ij</sub>/2</strong> times. If <strong>A</strong>[<strong>i</strong>][<strong>j</strong>]='0' and <strong>B</strong>[<strong>i</strong>][<strong>j</strong>]='1' 
then '1' will be put into this cell <strong>(c<sub>ij</sub>-1)/2+1</strong> times and removed <strong>(c<sub>ij</sub>-1)/2</strong> times. 
If <strong>A</strong>[<strong>i</strong>][<strong>j</strong>]='1' and <strong>B</strong>[<strong>i</strong>][<strong>j</strong>]='0' then '1' will be put into this cell 
<strong>(c<sub>ij</sub>-1)/2</strong> times and removed <strong>(c<sub>ij</sub>-1)/2+1</strong> times. Using this fact we can break the limitation 
for cell usage into two parts: the limitation for times '1' can be put into this cell and the limitation for times 
'1' can be removed from this cell. 
<br /><br />Now let's build a network. For <strong>i</strong>-th cell we will add 3 vertexes: <strong>v<sub>i1</sub></strong>, <strong>v<sub>i2</sub></strong>,
<strong>v<sub>i3</sub></strong>. All ones, represented by flow, coming to cell <strong>i</strong> will come to vertex <strong>v<sub>i1</sub></strong>, 
and all ones leaving cell <strong>i</strong> will go through vertex <strong>v<sub>i3</sub></strong>. If <strong>i</strong>-th cell contains '1' at the 
beginning, we add the edge from <strong>source</strong> to <strong>v<sub>i2</sub></strong> with unit capacity and zero cost. 
If <strong>i</strong>-th cell has to contain '1' after the transformation we add the edge from <strong>v<sub>i2</sub></strong> to <strong>sink</strong> 
with unit capacity and zero cost. We also add edge from <strong>v<sub>i1</sub></strong> to <strong>v<sub>i2</sub></strong> with capacity equal 
to the limit for times '1' can be put into cell <strong>i</strong> and zero cost and the edge from <strong>v<sub>i2</sub></strong> to 
<strong>v<sub>i3</sub></strong> with capacity equal to the limit for times '1' can be removed from cell <strong>i</strong> and zero cost. 
If cells <strong>i</strong> and <strong>j</strong> are adjacent we will also add edge from <strong>v<sub>i3</sub></strong> to <strong>v<sub>j1</sub></strong> of 
infinite capacity and unit cost. Now let's find the 
<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=minimumCostFlow2">minimum cost flow</a> in our network. 
If the value of flow is less than number of ones, then matrix <strong>A</strong> can't be transformed into <strong>B</strong>, otherwise the 
cost of the found flow is the answer. You can see the implementation of this idea
<a href="/stat?c=problem_solution&amp;rm=297785&amp;rd=12179&amp;pm=9790&amp;cr=22653044">here</a>.
<br /><br />Many coders solved the problem presenting each cell using not 3, but 2 vertexes. They removed vertices 
<strong>v<sub>i3</sub></strong> (removing the limitation for times '1' can be removed from cell <strong>i</strong>). This can be done because '1' 
can't be removed from cell more times than it was put there, so the limitation for times '1' can be put in the cell is 
enough. You can see the implementation of this idea
<a href="/stat?c=problem_solution&amp;rm=297774&amp;rd=12179&amp;pm=9790&amp;cr=19849563">here</a>.
</p>


<br /><br />


<div class="authorPhoto">
    <img src="/i/m/Gluk_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8433628" context="algorithm"/><br />
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
