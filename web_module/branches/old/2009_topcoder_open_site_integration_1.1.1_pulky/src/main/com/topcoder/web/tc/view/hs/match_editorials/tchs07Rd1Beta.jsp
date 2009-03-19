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
    <A href="/tc?module=HSRoundOverview&rd=10705&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514493" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Round 1 Beta</span><br>Tuesday, March 6, 2007
<br><br>



<h2>Match summary</h2> 

The last region to compete in Round 1 was also the one with most contestants.
One hundred and eleven high school competitors, mostly from Europe, competed to get a positive
score. At the end, all but two got their ticket to Round 2. The only red of this region,
<tc-webtag:handle coderId="11972352" context="hs_algorithm"/>, 
was the favorite of the round, but he lost too many points by resubmitting the hard problem twice. <tc-webtag:handle coderId="14886245" context="hs_algorithm"/> 
got the first place with a 75 point lead over <tc-webtag:handle coderId="11884173" context="hs_algorithm"/>. 
Third place went to <tc-webtag:handle coderId="15803565" context="hs_algorithm"/>, 
who rounded out the all-Polish podium. <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>'s victory 
also brought his high-school rating into the red, where his non-HS algorithm rating has been for some time.<br /><br /> 

 

<H1> 

The Problems 

</H1>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7342&amp;rd=10705" name="7342">BadExam</a></b> 

</font> 

<A href="Javascript:openProblemRating(7342)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514493" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      114 / 114 (100.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      112 / 114 (98.25%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>sluga</b> for 249.42 points (1 mins 22 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      239.97 (for 112 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

To solve this problem, you just need to follow the steps explained in the statement. First, calculate the highest mark mmax. After that, modify each mark with the formula of the statement. Then you just need to calculate the average of the marks, 
summing them all and then dividing by the number of students.
<br />
<br />


<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7515&amp;rd=10705" name="7515">CountingCrowds</a></b> 

</font> 

<A href="Javascript:openProblemRating(7515)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514493" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      91 / 114 (79.82%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      85 / 91 (93.41%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>icanadi</b> for 488.20 points (4 mins 26 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      364.73 (for 85 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

The first thing to consider is what the problem is really asking you. You have to do an interpretation of 
the data, which means you have to decide when each person going through the door is first noticed by the sensor.
 If you want the minimal interpretation, you can assume that each person is under the sensor until the measure of the sensor contradicts their presence, i.e. the sensor measures a height lower than that person. 
<br />
<br />

With this idea, you have to keep track of the heights of the people going through 
the door at each moment. And of course, you will suppose that two persons of the same height 
will never be under the sensor at the same moment. After each measure, you have to update the people that 
are under the sensor. If any person is taller than the new measure, it means that this person has already left. 
<br />
<br />

<tc-webtag:handle coderId="14886245" context="hs_algorithm"/> <a href="/tc?module=HSProblemSolution&cr=14886245&rd=10705&pm=7515">implemented</a> 
such an algorithm. Other solutions use an O(n^2) algorithm -- for an example, see
 <tc-webtag:handle coderId="10256411" context="hs_algorithm"/>’s <a href="/tc?module=HSProblemSolution&cr=10256411&rd=10705&pm=7515">solution</a>.
<br /><br />
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7514&amp;rd=10705" name="7514">FamilyTravel</a></b> 

</font> 

<A href="Javascript:openProblemRating(7514)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514493" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      63 / 114 (55.26%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      39 / 63 (61.90%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>fpavetic</b> for 884.76 points (10 mins 32 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      650.39 (for 39 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

First of all, we need to translate the problem into a graph problem. We are asked for the shortest path from 
node 0 to node 1, such that the length of the edges in the path forms a decreasing sequence.
<br />
<br />

This problem can be solved in a couple of different ways. The most straightforward one was to use 
Dynamic Programming, a technique that is very useful in TopCoder problems. If you have not heard about 
it, take a look at <a href="/tc?module=Static&d1=tutorials&d2=dynProg">this tutorial</a>. We will solve it with a recursive function that will tell us how much 
it costs to get to node 1 from node u given that the last edge on the actual path has a length of len. 
<br />
<br />

We have to be careful not to fall into a cycle of edges of the same length, 
which could lead us to a infinite recursion. Thus, we will have to mark which states (which combinations of node and last length) 
we have visited, so if we visit them again, we can stop the recursion at that level.

<pre>
int shortest(int node, int len) 
{
  if ( memo[node][len] != -1) return memo[node][len];
  if ( vis[node][len] == 1 ) return infinity;
  vis[node][len] = 1;
  int ret = infinity;
  for(int i=0;i&lt;n;i++)if(graph[node][i]!='0' && dis( graph[len][i] ) &lt;= len )
  {
    ret = Math.Min( ret, shortest( i, dis( graph[len][i] ) ) + dis( graph[len][i] );
  }
  return memo[node][len]=ret;
}
 
</pre> 

Such a solution was <a href="/tc?module=HSProblemSolution&cr=12005484&rd=10705&pm=7514">implemented</a> by 
<tc-webtag:handle coderId="12005484" context="hs_algorithm"/>. Other contestants used a kind of breadth-first search algorithm.
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/tywok_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8510917" context="algorithm"/><br />    <em>TopCoder Member</em>
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
