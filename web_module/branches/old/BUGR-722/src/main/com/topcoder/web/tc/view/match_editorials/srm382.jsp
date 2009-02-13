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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10805">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516079" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 382</span><br />Tuesday, December 11, 2007
<br /><br />



<h2>Match summary</h2>

 

<p>Division 1 was presented with slightly unusual problem set, with technical 250, tricky 500 and relatively easy 1000 problems. After challenge phase, <tc-webtag:handle coderId="10574855" context="algorithm"/> was taking lead with impressively quick submissions on all problems and +175 points on challenge. But system tests have find flaw in his medium, which allowed <tc-webtag:handle coderId="8355516" context="algorithm"/> to win his 10th SRM and became target again. He was third after 75 minutes of match, but intensive challenge phase (7 successful and 6 unsuccessful challenges, +200) gave him top position. Second was <tc-webtag:handle coderId="14970299" context="algorithm"/>, and <tc-webtag:handle coderId="15485129" context="algorithm"/> took third place. This SRM is also remarkable because of a new record – after it there are 12 active targets in TC rating, more than ever.</p>

<p>
Division 2 problem set was uniformly harder than usual. Only 49 coders correctly solved 500, and only 3 solved 1000 problem. Newcomers <tc-webtag:handle coderId="10428287" context="algorithm"/> and <tc-webtag:handle coderId="22657949" context="algorithm"/> solved all problems and took first and second places. <tc-webtag:handle coderId="20213936" context="algorithm"/> took third with relatively quick submissions on first two problems. 1000 problem was also solved by newcomer <tc-webtag:handle coderId="22699766" context="algorithm"/>, but with incorrect 250 and 500 problems it brought him only fifth place.
</p>

 

<H1>

The Problems

</H1>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8454&amp;rd=10805" name="8454">ContiguousSubsequences</a></b>

</font>

<A href="Javascript:openProblemRating(8454)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516079" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      431 / 537 (80.26%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      267 / 431 (61.95%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>itsmemyself</b> for 249.19 points (1 mins 37 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      161.88 (for 267 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>Because of small constraints, the problem was pretty straightforward. To solve it you should process all contiguous subsequences of length K and more, calculate their average values and lengths and select the best one, as pointed out in the statement. The only thing we need to care about is precision. We can use epsilon, when comparing floating-point numbers, or even calculate average values as common fractions to avoid floating-point arithmetic at all. The following code demonstrates such approach.
</p>
<pre>
public int[] findMaxAverage(int[] a, int K){
    int bestp = -1, bestq = 1;
    int ret[] = new int[2];
    int acc[] = new int[a.length+1];
    for(int i = 0; i &lt; a.length; ++i)
        acc[i+1] = acc[i] + a[i];
    for(int i = 0; i &lt; a.length; ++i){
        for(int j = i; j &lt; a.length; ++j){
            if(j - i + 1 &lt; K) continue;
            if(bestq * (acc[j+1] - acc[i]) &gt; bestp*(j-i+1)){
                bestp = acc[j+1] - acc[i];
                bestq = j-i+1;
                ret[0] = i;
                ret[1] = j;
            }
            else if(bestq * (acc[j+1] - acc[i]) == bestp*(j-i+1)){
                if(j-i &gt; ret[1]-ret[0]){
                    ret[0] = i;
                    ret[1] = j;
                }
            }
        }
    }
    return ret;
}
</pre>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8319&amp;rd=10805" name="8319">CollectingRiders</a></b>

</font>

<A href="Javascript:openProblemRating(8319)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516079" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      86 / 537 (16.01%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      49 / 86 (56.98%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>araste</b> for 374.44 points (17 mins 44 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      250.14 (for 49 correct submissions)

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

      358 / 438 (81.74%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      258 / 358 (72.07%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Triple_M</b> for 234.37 points (7 mins 26 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      161.07 (for 258 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

First, we can notice, that distance in K-rider moves between two cells can be easily expressed in terms of knight (1-rider) moves: distance(K, from, to) = ceil(distance(1, from, to)/K). This leads to the following solution: first, calculate distance in knight moves between every pair of cells; second, search over all possible "collection points", calculate total time for each of them and select the optimal point to collect all riders. We can implement BFS, Floyd-Warshall or even flood-fill for the first part of solution, due to small constraints. You can see some clear solutions demonstrating different approaches <a href="/stat?c=problem_solution&rm=267630&rd=10805&pm=8319&cr=20243958">here</a> and <a href="/stat?c=problem_solution&rm=267630&rd=10805&pm=8319&cr=10574855">here</a>.

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8470&amp;rd=10805" name="8470">CharmingTicketsEasy</a></b>

</font>

<A href="Javascript:openProblemRating(8470)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516079" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      15 / 537 (2.79%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      3 / 15 (20.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>mhwu</b> for 573.25 points (29 mins 38 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      562.83 (for 3 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>This problem is the easy version of Division 1 Hard, so it also can be solved in optimal O(K<sup>2</sup>) way. Here we describe non-optimal, but possible O(K<sup>3</sup>) solution, which will pass because of small constraints.
Let's denote S1 and S2 sets of numbers containing only good digits and satisfying first or second conditions, correspondingly. By inclusion-exclusion
principle, the answer is |S1|+|S2|-|S1 &#8745; S2|. We find out these values, using the following DP: calculate N(k,i,j) -the amount of k-digit numbers composed only from good digits, with sum of digits equal to i, and difference between digits in odd and even positions equal to j. Thus, we can find |S1| (and |S2|) as sum[N(K,i,j1)*N(K,i,j2) over all i,j1,j2], and |S1 &#8745; S2| as sum[N(K,i,j)*N(K,i,-j) over all i,j]. It seems that nobody from Division 2 have correctly implemented this approach during the competition.</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8238&amp;rd=10805" name="8238">PointsOnACircle</a></b>

</font>

<A href="Javascript:openProblemRating(8238)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516079" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      270 / 438 (61.64%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      65 / 270 (24.07%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Eryx</b> for 471.31 points (7 mins 5 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      301.70 (for 65 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
First thing we can notice is small number of points and integer values of angles. So we can try all possible rotation angles (no more than 360), and solve corresponding subproblem for each. Imagine that rotation is fixed. Some point will overlap other points after rotation. Imagine graph, whose vertices are points on original circle, and arcs goes from first point to second one if and only if the first point overlaps the second after rotation. Our task is to color two different subsets of vertices in red and blue in such way that each blue vertex will have outgoing edge to some red point, each red vertex will have incoming edge from some blue point, and the total size of subsets is maximized. This task seems to be hard in general case, but it's easy to notice that in our problem graph will contain only non-intersecting chains and/or cycles. So, the answer is sum of 2*floor(V(C)/2), where V(C) is the number of vertices in connected component C of corresponding (here undirected) graph, over all connected components. There are different ways to calculate this, see <tc-webtag:handle coderId="8355516" context="algorithm"/> <a href="/stat?c=problem_solution&rm=267636&rd=10805&pm=8238&cr=14970299">solution</a> for an example of fastimplementation.
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8316&amp;rd=10805" name="8316">CharmingTickets</a></b>

</font>

<A href="Javascript:openProblemRating(8316)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516079" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      44 / 438 (10.05%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      32 / 44 (72.73%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Egor</b> for 837.58 points (13 mins 2 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      590.41 (for 32 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

As it was mentioned in CharmingTicketsEasy analysis, our task can be solved by finding |S1| and |S1 &#8745; S2|. First of all, we can find |S1| by the following standard DP: calculate numbers N(k,i) - amount of k-digit numbers composed only from good digits, with sum of digits equal to i. Then |S1| can be found as sum[N(K,i)*N(K,i) over all i]. Denote this function from K as Lucky(K), it will come into play further.
</p>

<p>
Let's find |S1 &#8745; S2|. Write out necessary and sufficient condition on digits for number from S1 &#8745; S2:
</p>
<pre>
x[1] + x[2] + ... + x[k] - x[k+1] - x[k+2] - ... - x[2*k] = 0  (1)
x[1] - x[2] + ... - x[k] + x[k+1] - x[k+2] + ... - x[2*k] = 0  (2)
x[i] is good digit for all i
</pre>
This system is equivalent to 

<pre>
x[1] + x[3] + ... + x[k-1] - x[k+2] - ... - x[2*k]   = 0  (1*)
x[2] + x[4] + ... + x[k]   - x[k+1] - ... - x[2*k-1] = 0  (2*)
x[i] is good digit for all i
</pre>

Here (1*) is the sum of (1) and (2), divided by 2, and (2*) is the difference of (1) and (2), also divided by 2.

<p>
First equation will have 2*ceil(K/2) variables, second – 2*floor(K/2) variables, and each variable is present in only one equation. Solutions of (1*) and (2*) are independent. Thus the number of solutions of this system equals to (number of solutions of (1*))*(number of solutions of (2*)). It's easy to see, that both equations are like the first condition from the statement, so it will be Lucky(ceil(K/2))*Lucky(floor(K/2)). The final answer will be 2*Lucky(K) – Lucky(ceil(K/2))*Lucky(floor(K/2)) (of course, all calculations are made modulo 999983). See <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=267630&rd=10805&pm=8316&cr=10574855">solution</a> demonstrating this approach.
</p>




<br /><br />


<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="14908325" context="algorithm"/><br />
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
