<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.math
{
   font-family: times, times new roman, serif;
   font-weight: normal;
   font-style: italic;
   font-size: 15px;
}
.code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   font-size: 13px;
   font-weight: normal;
   line-height: 14px;
}
</style>
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
            <jsp:param name="node" value="algo_tutorials"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">

<jsp:include page="../page_title.jsp" >
   <jsp:param name="image" value="alg_tut"/>
   <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=tutorials&d2=alg_index">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="515317" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>

<span class="bigTitle">Minimum Cost Flow, Part 3: Applications</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/Zealint_big.jpg" alt="Author" />
</div>

<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22671469" context="algorithm"/> <br />
      <em>TopCoder Member</em>
</div>

<br clear="all">
<p>The <a href="/tc?module=Static&d1=tutorials&d2=minimumCostFlow2">last part</a> of the article introduces some well known applications of the minimum cost flow problem. Some of the applications are described according to [<a href="#1">1</a>].</p>

<p><span class="bodySubtitle">The Assignment Problem</span><br />
There are a number of <i>agents</i> and a number of <i>tasks</i>. Any agent can be assigned to perform any task, incurring some cost that may vary depending on the agent-task assignment. We have to get all tasks performed by assigning exactly one agent to each task in such a way that the total cost of the assignment is minimal with respect to all such assignments.</p>

<p>In other words, consider we have a square matrix with <span class="math">n</span> rows and <span class="math">n</span> columns. Each cell of the matrix contains a number. Let's denote by <span class="math">c<sub>ij</sub></span> the number which lays on the intersection of <span class="math">i</span>-th row and <span class="math">j</span>-th column of the matrix. The task is to choose a subset of the numbers from the matrix in such a way that each row and each column has exactly one number chosen and sum of the chosen numbers is as minimal as possible. For example, assume we had a matrix like this:</p>

<div align="center"><img src="/i/education/minimumCostFlow/03_001.png" alt="Figure 03_001" border="0" style="margin: 10px;" /></a></div>

<p>In this case, we would chose numbers 3, 4, and 3 with sum 10. In other words, we have to find an integral solution of the following linear programming problem:<br>

<div align="center"><img src="/i/education/minimumCostFlow/03_002.png" alt="Figure 03_002" border="0" style="margin: 10px;" /></a></div>
subject to
<div align="center"><img src="/i/education/minimumCostFlow/03_003.png" alt="Figure 03_003" border="0" style="margin: 10px;" /></a></div></p>

<p>If binary variable <span class="math">x<sub>ij</sub> = 1</span> we will choose the number from cell <span class="math">(i,j)</span> of the given matrix. Constraints guarantee that each row and each column of the matrix will have only one number chosen. Evidently, the problem has a feasible solution (one can choose all diagonal numbers). To find the optimal solution of the problem we construct the bipartite transportation network as it is drawn in Figure 1. Each edge <span class="math">(i,j')</span> of the graph has unit capacity and cost <span class="math">c<sub>ij</sub></span>. All supplies and demands are equal to 1 and -1 respectively. Implicitly, minimum cost flow solution corresponds to the optimal assignment and vise versa. Thanks to <i>left-to-right</i> directed edges the network contains no negative cycles and one is able to solve it with complexity of <span class="math">O(n<sup>3</sup>)</span>. Why? <i>Hint: use the successive shortest path algorithm.</i></p>

<div align="center"><img src="/i/education/minimumCostFlow/Figure_3_1.png" alt="Figure_3_1" border="0" style="margin: 10px;" /></a></div>

<blockquote><b>Figure 1</b>. Full weighted bipartite network for the assignment problem. Each edge has capacity 1 and cost according to the number in the given matrix.</blockquote>

<p>The assignment problem can also be represented as weight matching in a weighted bipartite graph. The problem allows some extensions:</p>

<ul>
	<li>Suppose that there is a different number of supply and demand nodes. The objective might be to find a maximum matching with a minimum weight.</li>
	<li>Suppose that we have to choose not one but <span class="math">k</span> numbers in each row and each column. We could easily solve this task if we considered supplies and demands to be equal to <span class="math">k</span> and <span class="math">-k</span> (instead of 1 and -1) respectively.</li>
</ul>

<p>However, we should point out that, due to the specialty of the assignment problem, there are more effective algorithms to solve it. For instance, the Hungarian algorithm has complexity of <span class="math">O(n<sup>3</sup>)</span>, but it works much more quickly in practice.</p>

<p><span class="bodySubtitle">Discrete Location Problems</span><br />
Suppose we have <span class="math">n</span> building sites and we have to build <span class="math">n</span> new facilities on these sites. The new facilities interact with <span class="math">m</span> existing facilities. The objective is to assign each new facility <span class="math">i</span> to the available building site <span class="math">j</span> in such a way that minimizes the total transportation cost between the new and existing facilities. One example is the location of hospitals, fire stations etc. in the city; in this case we can treat population concentrations as the existing facilities.</p>

<p>Let's denote by <span class="math">d<sub>kj</sub></span> the distance between existing facility <span class="math">k</span> and site <span class="math">j</span>; and the total transportation cost per unit distance between the new facility <span class="math">i</span> and the existing one <span class="math">k</span> by <span class="math">w<sub>ik</sub></span>. Let's denote the assignment by binary variable <span class="math">x<sub>ij</sub></span>. Given an assignment <span class="math">x</span> we can get a corresponding transportation cost between the new facility <span class="math">i</span> and the existing facility <span class="math">k</span>:<br>

<div align="center"><img src="/i/education/minimumCostFlow/03_004.png" alt="Figure 03_004" border="0" style="margin: 10px;" /></a></div>
Thus the total transportation cost is given by<br><br>
<div align="center"><img src="/i/education/minimumCostFlow/03_005.png" alt="Figure 03_005" border="0" style="margin: 10px;" /></a></div></p>

Note, that <img alt="" src="/i/education/minimumCostFlow/03_006.png" align="top" style="padding: 0px 3px 0px 3px;"> is the cost of locating the new facility <span class="math">i</span> at site <span class="math">j</span>. Appending necessary conditions, we obtain another instance of the assignment problem.

<p><span class="bodySubtitle">The Transportation Problem</span><br />
A minimum cost flow problem is well known to be a <i>transportation problem in the statement of network</i>. But there is a special case of transportation problem which is called <i>the transportation problem in statement of matrix</i>. We can obtain the optimization model for this case as follows.<br>

<div align="center"><img src="/i/education/minimumCostFlow/03_007.png" alt="Figure 03_007" border="0" style="margin: 10px;" /></a></div>
subject to<br>
<div align="center"><img src="/i/education/minimumCostFlow/03_008.png" alt="Figure 03_008" border="0" style="margin: 10px;" /></a></div></p>

<p>For example, suppose that we have a set of <span class="math">m</span> warehouses and a set of <span class="math">n</span> shops. Each warehouse <span class="math">i</span> has nonnegative supply value <span class="math">b<sub>i</sub></span> while each shop <span class="math">j</span> has nonnegative demand value <span class="math">d<sub>j</sub></span>. We are able to transfer goods from a warehouse <span class="math">i</span> directly to a shop <span class="math">j</span> by the cost <span class="math">c<sub>ij</sub></span> per unit of flow.</p>

<div align="center"><img src="/i/education/minimumCostFlow/Figure_3_2.png" alt="Figure_3_2" border="0" style="margin: 10px;" /></a></div>

<blockquote><b>Figure 2</b>. Formulating the transportation problem as a minimum cost flow problem. Each edge connecting a vertex <span class="math">i</span> and a vertex <span class="math">j'</span> has capacity <span class="math">u<sub>ij</sub></span> and cost <span class="math">c<sub>ij</sub></span>.</blockquote>

There is an upper bound to the amount of flow between each warehouse <span class="math">i</span> and each shop <span class="math">j</span> denoted by <span class="math">u<sub>ij</sub></span>. Minimizing total transportation cost is the object. Representing the flow from a warehouse <span class="math">i</span> to a shop <span class="math">j</span> by <span class="math">x<sub>ij</sub></span> we obtain the model above.

Evidently, the assignment problem is a special case of the transportation problem in the statement of matrix, which in turn is a special case of the minimum cost flow problem.

<p><span class="bodySubtitle">Optimal Loading of a Hopping Airplane</span><br />
We took this application from [<a href="#1">1</a>]. A small commuter airline uses a plane with the capacity to carry at most <span class="math">p</span> passengers on a "hopping flight." The hopping flight visits the cities 1, 2, &#8230;, <span class="math">n</span>, in a fixed sequence. The plane can pick up passengers at any node and drop them off at any other node.</p>

<p>Let <span class="math">b<sub>ij</sub></span> denote the number of passengers available at node <span class="math">i</span> who want to go to node <span class="math">j</span>, and let <span class="math">f<sub>ij</sub></span> denote the fare per passenger from node <span class="math">i</span> to node <span class="math">j</span>.</p>

<p>The airline would like to determine the number of passengers that the plane should carry between the various origins and destinations in order to maximize the total fare per trip while never exceeding the plane capacity.</p>

<div align="center"><img src="/i/education/minimumCostFlow/Figure_3_3.png" alt="Figure_3_3" border="0" style="margin: 10px;" /></a></div>

<blockquote><b>Figure 3</b>. Formulating the hopping plane flight problem as a minimum cost flow problem.</blockquote>

<p>Figure 3 shows a minimum cost flow formulation of this hopping plane flight problem. The network contains data for only those arcs with nonzero costs and with finite capacities: Any arc without an associated cost has a zero cost; any arc without an associated capacity has an infinite capacity.</p>

<p>Consider, for example, node 1. Three types of passengers are available at node 1, those whose destination is node 2, node 3, or node 4. We represent these three types of passengers by the nodes 1-2, 1-3, and 1-4 with supplies <span class="math">b<sub>12</sub></span>, <span class="math">b<sub>13</sub></span>, and <span class="math">b<sub>14</sub></span>. A passenger available at any such node, say 1-3, either boards the plane at its origin node by flowing though the arc <span class="math">(1-3,1)</span> and thus incurring a cost of <span class="math">-f13</span> units, or never boards the plane which we represent by the flow through the arc <span class="math">(1-3,3)</span>.</p>

<p>We invite the reader to establish one-to-one correspondence between feasible passenger routings and feasible flows in the minimum cost flow formulation of the problem.</p>

<p><span class="bodySubtitle">Dynamic Lot Sizing</span><br />
Here's another application that was first outlined in [<a href="#1">1</a>]. In the dynamic lot-size problem, we wish to meet prescribed demand <span class="math">d<sub>j</sub></span> for each of <span class="math">K</span> periods <span class="math">j =</span> 1, 2, &#8230;, <span class="math">K</span> by either producing an amount <span class="math">a<sub>j</sub></span> in period <span class="math">j</span> and/or by drawing upon the inventory <span class="math">I<sub>j-1</sub></span> carried from the previous period. Figure 4 shows the network for modeling this problem.</p>

<p>The network has <span class="math">K+1</span> vertexes: The <span class="math">j</span>-th vertex, for <span class="math">j =</span> 1, 2, &#8230;, <span class="math">K</span>, represents the <span class="math">j</span>-th planning period; node <span class="math">0</span> represents the "source" of all production. The flow on the "production arc" <span class="math">(0,j)</span> prescribes the production level <span class="math">a<sub>j</sub></span> in period <span class="math">j</span>, and the flow on "inventory carrying arc" <span class="math">(j,j+1)</span> prescribes the inventory level <span class="math">I<sub>j</sub></span> to be carried from period <span class="math">j</span> to period <span class="math">j+1</span>.</p>

<div align="center"><img src="/i/education/minimumCostFlow/Figure_3_4.png" alt="Figure_3_4" border="0" style="margin: 10px;" /></a></div>

<blockquote><b>Figure 4</b>. Network flow model of the dynamic lot-size problem.</blockquote>

<p>The mass balance equation for each period <span class="math">j</span> models the basic accounting equation: Incoming inventory plus production in that period must equal the period's demand plus the final inventory at the end of the period. The mass balance equation for vertex <span class="math">0</span> indicates that during the planning periods 1, 2, &#8230;, <span class="math">K</span>, we must produce all of the demand (we are assuming zero beginning and zero final inventory over the planning horizon).</p>

<p>If we impose capacities on the production and inventory in each period and suppose that the costs are linear, the problem becomes a minimum cost flow model.</p>

<p><span class="bodySubtitle">References</span><br />
[<a name="1">1</a>]&#160;&#160;Ravindra K. Ahuja, Thomas L. Magnanti, and James B. Orlin. <i>Network Flows: Theory, Algorithms, and Applications</i>.<br>
[<a name="2">2</a>]&#160;&#160;Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest. <i>Introduction to Algorithms</i>.<br>
[<a name="3">3</a>]&#160;&#160;<tc-webtag:handle coderId="8593420" context="algorithm"/>. Algorithm Tutorial: <a href="/tc?module=Static&d1=tutorials&d2=maxFlow" target="_blank">Maximum Flow</a>.<br>
[<a name="4">4</a>]&#160;&#160;<tc-webtag:handle coderId="268851" context="algorithm"/>. Algorithm Tutorial: <a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs3" target="_blank">Introduction to graphs and their data structures: Section 3</a>.<br>
</p>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
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
