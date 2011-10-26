<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS SRM 61 Problem Set &amp; Analysis</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
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
    <a href="/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/tc?module=HSRoundOverview&rd=13533&snid=3&er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="524922" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 64</span><br />December 11, 2008
<br /><br />
<h2>Match summary</h2> 

<p> 
The last TCHS SRM of the year came with a relatively simple problemset, with 46 coders solving all three problems correcty. Solving speed and challenges became critical to get a good position in this match with <tc-webtag:handle coderId="11972352" context="hs_algorithm"/> getting the first place thaks to achieving the fastest solutions for all three problems and two succesful challenges. Almost 100 points behind, <tc-webtag:handle coderId="22733480" context="hs_algorithm"/> in second place and <tc-webtag:handle coderId="22744264" context="hs_algorithm"/> in the third place. 
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10198&amp;rd=13533" name="10198">PaternityScandal</a></b> 
</font> 
<A href="Javascript:openProblemRating(10198)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524922" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      133 / 146 (91.10%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      110 / 133 (82.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Zuza</b> for 246.70 points (3 mins 17 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      194.53 (for 110 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p><p>
All a family needs to be considered valid is to have two adults with compatible personalities. If we consider M males, F females and C children, there are at most M*F different possible couples. This number is small enough, so we can just iterate through all possible couples. For each couple, compute the maximum number of children they could have, by counting those children that are compatible with both adults in the couple.</p>
<p>A pseudocode implementation follows:</p>
<pre>
    M=maleGeneticTest.size
    F=femaleGeneticTest.size
    K=femaleGeneticTest[0].size

    result=0
    for i=0 to M-1 :
        for j=0 to F-1:
            //process couple (i,j)
            //Are their personalities compatible?
            if(personalityTest[i][j]==&apos;Y&apos;): 
                 c=0
                 for t=0 to K-1:
                     //Is child t compatible with them?
                     if (maleGeneticTest[i][t]==&apos;Y&apos;)
                        and (femaleGeneticTest[j][t]==&apos;Y&apos;) :
                          c++
                 result = max(result, c+2) //Don&apos;t forget about the parents
    return(result)
</pre>
<p>Exercises<p>
<ol>
<li>What if the problem required you to calculate the maximum number of valid families?</li>
<li>If there are at most 16 adults, calculate the maximum number of subjects that can be assigned to a family.</li>
<li>Assume there are  at most 15 children, and there is a new table childrenGeneticTest which establishes genetic compatibility between the children. For two children to belong to the same family they must be genetically compatible. Calculate the largest family.</li>
<li>Is the last variation solvable efficiently when there are at most 50 children?</li> 
</ol>
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10199&amp;rd=13533" name="10199">ThirtyRocks</a></b> 
</font> 
<A href="Javascript:openProblemRating(10199)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524922" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      121 / 146 (82.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      90 / 121 (74.38%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Zuza</b> for 497.01 points (2 mins 12 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      405.45 (for 90 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
<p>Let us ignore the lexicographical tie breaker, we can determine whether it is possible to place the rocks correctly by checking two conditions:</p>
<ul><li>The total minimum amount of rocks required by the boxes is not greater than 30.</li>
<li>The total maximum amount of rocks allowed by the boxes is not lesser than 30.</li>
</ul>
<p>Knowing that a solution is possible, it is not complicated to generate any solution, by first adding the required rocks to each and then increasing the number of rocks in each box until the maximum is reached or until there are no rocks left to use.</p>
<p>In order to generate the lexicographically first solution, we must first understand that the lexicographically first solution requires you to place the smallest possible amount of rocks in the first box, once this amount is determined, continue to determining the smallest possible amount for the second box, repeat this process until the last box, where we place all the rocks that are left.</p>
<p>In order to pick the smallest possible value for a position of the array, we first need to find a way to test if one value is valid. We can start by determining a strategy for the first element, if we used X rocks in the first element, we woud have 30-X rocks left that we must place in the remaining boxes. Is it possible to place 30-X rocks in the remaining boxes? We can remember the beginning of the analysis, it  is possible to place the  30-X  rocks in the remaining boxes if the sum of the minimum for all the rocks is not greater than 30-X and the sum of the maximum is not less than 30-X.</p>

<p>We are now able to implement the algorithm:</p>
<pre>
    n = boxMinimum.size
    smin = Sum all elements of boxMinimum
    smax = Sum all elements of boxMaximum
    if (smin&gt;30) or (smax&lt;30):
        return {}

    rocks = 30
    for  i=0 to n-2 :
       // Calculate the sums to the left
       // of box i:
       smin -= boxMinimum[i]
       smax -= boxMaximum[i]
       
       for j= boxMinimum[i] to boxMaximum[i]:
           //Is it possible to place rocks-j rocks in the remaining boxes?
           if (rocks-j>=smin) and (rocks-j<=smax) :
                //Place j rocks in box i:
                result[i] = j
                rocks = rocks - j //remaining rocks.

    result[n-1] = rocks
</pre>

<p>Exercises<p>
<ol>
<li>If it is impossible to follow the restrictions, return the assignment that minimizes the number of restrictions that are not followed.</li>
<li>There are at most 15 boxes, but now the result must be sorted, you should still pick the rock assignment that generates the lexicographically first answer.</li>
</ol>

</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10197&amp;rd=13533" name="10197">CommanderIdol</a></b> 
</font> 
<A href="Javascript:openProblemRating(10197)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524922" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      95 / 146 (65.07%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      68 / 95 (71.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Zuza</b> for 988.81 points (3 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      791.80 (for 68 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
<p>Since the main objetive is to complete the mission as soon as possible, let&apos;s calculate this time. Each soldier must take the prototype to one of the forts, we need to calculate the  minimum time a soldier travelling from fort 0 to each of the other forts would need in order to reach the destination. This can be done with any shortest path algorithm that allows weights in the edges. Consider the forts as edges and the travel time required to get to each fort to another fort as the weight of an ege between both forts. In case any fort is unrechable from fort 0, return -1.
</p>
<p>Once the minimum times for each soldier are calculated, we can calculate the mission duration, which, according to the problem statement, is accomplished once every soldier has reached its destination. The minimum mission duration would be the maximum of the minimum times between fort 0 and the rest of the forts.</p> 
<p>With the minimum mission duration, we can decide how many extra hours of sleep we can give to each soldier. if the mission duration was 7 hours, and the distance between fort 0 and fort 4 was of 7 hours, we would not be able to let him sleep any extra hour without delaying the mission completion. Likewise, if the minimum distance required just 5 hours, it would be possible to allow the soldier to sleep other 2 hours. As long as we don&apos;t delay the mission termination, we can consider each soldier separately, the result is equal to the sum of (Mission duration - Distance between fort 0 and fort i) for all forts.
</p>
<p>What is left to do is to implement a weighted shortest path algorithm so we can find the distances between fort 0 and the other forts, many algorithms could do it: <a href='http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm'>Dijkstra</a>, <a href='http://en.wikipedia.org/wiki/Bellman_Ford'>Bellman-Ford</a> or <a href='http://en.wikipedia.org/wiki/Floyd_Warshall'>Floyd-Warshall</a> can be used. For this problem,  Floyd-Warshall is a good choice due to the input format, the requirement to find the shortest distances to different forts and the simplicity to code. An implementation using Floyd-Warshall follows:
</p>
<pre>
    //Prepare distances matrix:
    D[][] = {}
    n = roads.size
    for i = 0 to n-1 :
        for j = 0 to n-1:
            if (roads[i][j]==&apos;-&apos;):
                D[i][j] = INF
            else
                D[i][j] = roads[i][j]-&apos;0&apos;
        D[i][i]=0

    //Floyd-Warshall:
    for k = 0 to n-1:
        for i = 0 to n-1:
            for j = 0 to n-1
                 D[i][j] = min(D[i][k]+D[k][j], D[i][j])

    //Get the maximum distance from fort 0:
    max=0
    for i = 0 to n-1:
        max=Max(max, D[0][i])

    if(max>=INF):  //detect unreachable forts
        return -1

    //Sum the extra sleep hours
    result=0
    for i = 0 to n-1:
        result= result + max - D[0][i]

    return (result)
</pre>
<p>Exercises:</p>
<ol><li>Solve the problem using a standard Breadth Firts Search.</li>
<li>There are n soldiers in fort 0, and at most 16 forts in the battlefield. You earn K popularity points for every soldier you don&apos;t assign a mission to. A soldier is allowed to carry multiple prototypes,  deliver them to multiple forts and may also return to a fort if necessary. </li>
</ol>
</p>



<div class="authorPhoto">
    <img src="/i/m/vexorian_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="22652965" context="algorithm" /><br />    <em>TopCoder Member</em>
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
