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

<span class="bigTitle">Minimum Cost Flow, Part 2: Algorithms</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/Zealint_big.jpg" alt="Author" />
</div>

<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22671469" context="algorithm"/> <br />
      <em>TopCoder Member</em>
</div>

<br clear="all">
<p>In <a href="/tc?module=Static&d1=tutorials&d2=minimumCostFlow1">Part 1</a>, we looked at the basics of minimum cost flow. In this section, we'll look at three algorithms that can be applied to minimum cost flow problems.</p>

<p><span class="bodySubtitle">Working with Residual Networks</span><br />
Let's consider the  concept of residual networks from the perspective of min-cost flow theory. You should be familiar with this concept thanks to <a href="/tc?module=Static&d1=tutorials&d2=maxFlow" target="_blank">maximum flow</a> theory, so we'll just extend it to minimum cost flow theory.</p>

<p>We start with the following intuitive idea. Let <span class="math">G</span> be a network and <span class="math">x</span> be a feasible solution of the minimum cost flow problem. Suppose that an edge <span class="math">(i,j)</span> in <span class="math">E</span> carries <span class="math">x<sub>ij</sub></span> units of flow. We define the residual capacity of the edge <span class="math">(i,j)</span> as <span class="math">r<sub>ij</sub> = u<sub>ij</sub> - x<sub>ij</sub></span>. This means that we can send an additional <span class="math">r<sub>ij</sub></span> units of flow from vertex <span class="math">i</span> to vertex <span class="math">j</span>. We can also cancel the existing flow <span class="math">x<sub>ij</sub></span> on the arc if we send up <span class="math">x<sub>ij</sub></span> units of flow from <span class="math">j</span> to <span class="math">i</span> over the arc <span class="math">(i,j)</span>. Now note that sending a unit of flow from <span class="math">i</span> to <span class="math">j</span> along the arc <span class="math">(i,j)</span> increases the objective function by <span class="math">c<sub>ij</sub></span>, while sending a unit of flow from <span class="math">j</span> to <span class="math">i</span> on the same arc decreases the flow cost by <span class="math">c<sub>ij</sub></span>.</p>

<div align="center"><img src="/i/education/minimumCostFlow/Figure_2_1.png" alt="Figure 2_1" border="0" style="margin: 10px;" /></a></div>

<blockquote><b>Figure 1</b>. The transportation network from Part 1. (a) A feasible solution. (b) The residual network with respect to the found feasible solution.</blockquote>

<p>Based on these ideas we define the residual network with respect to the given flow <span class="math">x</span> as follows. Suppose we have a transportation network <span class="math">G = (V,E)</span>. A feasible solution <span class="math">x</span> engenders a new (residual) transportation network, which we are used to defining by <span class="math">G<sub>x</sub> = (V,E<sub>x</sub>)</span>, where <span class="math">E<sub>x</sub></span> is a set of residual edges corresponding to the feasible solution <span class="math">x</span>.</p>

<p>What is <span class="math">E<sub>x</sub></span>? We replace each arc <span class="math">(i,j)</span> in <span class="math">E</span> by two arcs <span class="math">(i,j)</span>, <span class="math">(j,i)</span>: the arc <span class="math">(i,j)</span> has cost <span class="math">c<sub>ij</sub></span> and (residual) capacity <span class="math">r<sub>ij</sub> = u<sub>ij</sub> - x<sub>ij</sub></span>, and the arc <span class="math">(j,i)</span> has cost <span class="math">-c<sub>ij</sub></span> and (residual) capacity <span class="math">r<sub>ji</sub>=x<sub>ij</sub></span>. Then we construct the set <span class="math">E<sub>x</sub></span> from the new edges with a positive residual capacity. Look at Figure 1 to make sure that you understand the construction of the residual network.</p>

<p>You can notice immediately that such a definition of the residual network has some technical difficulties. Let's sum them up:</p>

<ul>
<li>If <span class="math">G</span> contains both the edges <span class="math">(i,j)</span> and <span class="math">(j,i)</span> (remember assumption 2) the residual network may contain four edges between <span class="math">i</span> and <span class="math">j</span> (two parallel arcs from <span class="math">i</span> to <span class="math">j</span> and two contrary). To avoid this situation we have two options. First, transform the original network to one in which the network contains either edge <span class="math">(i,j)</span> or edge <span class="math">(j,i)</span>, but not both, by splitting the vertexes <span class="math">i</span> and <span class="math">j</span>. Second, represent our network by the adjacency list, which is handling parallel arcs. We could even use two adjacency matrixes if it were more convenient.</li>
<li>Let's imagine now that we have a lot of parallel edges from <span class="math">i</span> to <span class="math">j</span> with different costs. Unfortunately, we can't merge them by summarizing their capacities, as we could do while we were finding the maximum flow. So, we need to keep each of the parallel edges in our data structure separate.</li>
</ul>

<p>The proof of the fact that there is a one-to-one correspondence between the original and residual networks is out the scope of this article, but you could prove all the necessary theorems as it was done within the maximum flow theory, or by reading [<a href="#1">1</a>].</p>

<p><span class="bodySubtitle">Cycle-canceling Algorithm</span><br />
This section describes the negative cycle optimality conditions and, as a consequence, cycle-canceling algorithm. We are starting with this important theorem:</p>

<p><i><b>Theorem 1 (Solution Existence)</b>. Let <span class="math">G</span> be a transportation network. Suppose that <span class="math">G</span> contains no uncapacitated negative cost cycle and there exists a feasible solution of the minimum cost flow problem. Then the optimal solution exists.</i></p>

<p><i>Proof</i>. One can see that the minimum cost flow problem is a special case of the linear programming problem. The latter is well known to have an optimal solution if it has a feasible solution and its objective function is bounded. Evidently, if <span class="math">G</span> doesn't contain an uncapacitated negative cycle then the objective function of the minimum cost flow problem is bounded from below -- therefore, the assertion of the theorem follows forthwith.</p>

<p>We will use the following theorem without proof, because we don't want our article to be overloaded with difficult theory, but you can read the proof in [<a href="#1">1</a>].</p>

<p><i><b>Theorem 2 (Negative Cycle Optimality Conditions)</b>. Let <span class="math">x*</span> be a feasible solution of a minimum cost flow problem. Then <span class="math">x*</span> is an optimal solution if and only if the residual network <span class="math">G<sub>x*</sub></span> contains no negative cost (directed) cycle.</i></p>

<div align="center"><img src="/i/education/minimumCostFlow/Figure_2_2.png" alt="Figure 2_2" border="0" style="margin: 10px;" /></a></div>

<blockquote><b>Figure 2</b>. Cycle-Canceling Algorithm, example of the network from Figure 1. (a) We have a feasible solution of cost 54. (b) A negative cycle 1-2-3-1 is detected in the residual network. Its cost is -1 and capacity is 1. (c) The residual network after augmentation along the cycle. (d) Another negative cost cycle 3-4-5-3 is detected. It has cost -2 and capacity 3. (e) The residual network after augmentation. It doesn't contain negative cycles. (f) Optimal flow cost value is equal to 47.</blockquote>

<p>This theorem gives the cycle-canceling algorithm for solving the minimum cost flow problem. First, we use any maximum flow algorithm [<a href="#3">3</a>] to establish a feasible flow in the network (remember assumption 4). Then the algorithm attempts to improve the objective function by finding negative cost cycles in the residual network and augmenting the flow on these cycles. Let us specify a program in pseudo code like it is done in [<a href="#1">1</a>].</p>

<pre class="code">
Cycle-Canceling

<b>1</b>    Establish a feasible flow <span class="math">x</span> in the network
<b>2</b>    <b>while</b> ( <span class="math">G<sub>x</sub></span> contains a negative cycle ) <b>do</b>
<b>3</b>        identify a negative cycle <span class="math">W</span>
<b>4</b>        <img alt="" src="/i/education/minimumCostFlow/02_001.png" align="top" style="padding: 0px 3px 0px 3px;">
<b>5</b>        augment <img alt="" src="/i/education/minimumCostFlow/02_002.png" align="top" style="padding: 0px 3px 0px 3px;"> units of flow along the cycle <span class="math">W</span>
<b>6</b>        update <span class="math">G<sub>x</sub></span> 
</pre>

<p>How many iterations does the algorithm perform? First, note that due to assumption 1 all the data is integral. After line 1 of the program we have an integral feasible solution <span class="math">x</span>. It implies the integrality of <span class="math">G<sub>x</sub></span>. In each iteration of the cycle in line 2 the algorithm finds the minimum residual capacity in the found negative cycle. In the first iteration <img alt="" src="/i/education/minimumCostFlow/02_002.png" align="top" style="padding: 0px 3px 0px 3px;"> will be an integer. Therefore, the modified residual capacities will be integers, too. And in all subsequent iterations the residual capacities will be integers again. This reasoning implies:</p>

<p><i><b>Theorem 3 (Integrality Property)</b>. If all edge capacities and supplies/demands on vertexes are integers, then the minimum cost flow problem always has an integer solution.</i></p>

<p>The cycle-canceling algorithm works in cases when the minimum cost flow problem has an optimal solution and all the data is integral and we don't need any other assumptions.</p>

<p>Now let us denote the maximum capacity of an arc by <span class="math">U</span> and its maximum absolute value of cost by <span class="math">C</span>. Suppose that <span class="math">m</span> denotes the number of edges in <span class="math">G</span> and <span class="math">n</span> denotes the number of vertexes. For a minimum cost flow problem, the absolute value of the objective function is bounded by <span class="math">mCU</span>. Any cycle canceling decreases the objective function by a strictly positive amount. Since we are assuming that all data is integral, the algorithm terminates within <span class="math">O(mCU)</span> iterations. One can use <span class="math">O(nm)</span> algorithm for identifying a negative cycle (for instance, Bellman-Ford's algorithm or label correcting algorithm [<a href="#1">1</a>]), and obtain complexity <span class="math">O(nm<sup>2</sup>CU)</span> of the algorithm.</p>

<p><span class="bodySubtitle">Successive Shortest Path Algorithm</span><br />
The previous algorithm solves the maximum flow problem as a subtask. The successive shortest path algorithm searches for the maximum flow and optimizes the objective function simultaneously. It solves the so-called max-flow-min-cost problem by using the following idea.</p>

<p>Suppose we have a transportation network <span class="math">G</span> and we have to find an optimal flow across it. As it is described in the "Finding a Solution" section we transform the network by adding two vertexes <span class="math">s</span> and <span class="math">t</span> (source and sink) and some edges as follows. For each node <span class="math">i</span> in <span class="math">V</span> with <span class="math">b<sub>i</sub> &gt; 0</span>, we add a source arc <span class="math">(s,i)</span> with capacity <span class="math">b<sub>i</sub></span> and cost <span class="math">0</span>. For each node <span class="math">i</span> in <span class="math">V</span> with <span class="math">b<sub>i</sub> &lt; 0</span>, we add a sink arc <span class="math">(i,t)</span> with capacity <span class="math">-b<sub>i</sub></span> and cost <span class="math">0</span>.</p>

<p>Then, instead of searching for the maximum flow as usual, we send flow from <span class="math">s</span> to <span class="math">t</span> along the shortest path (with respect to arc costs). Next we update the residual network, find another shortest path and augment the flow again, etc. The algorithm terminates when the residual network contains no path from <span class="math">s</span> to <span class="math">t</span> (the flow is maximal). Since the flow is maximal, it corresponds to a feasible solution of the original minimum cost flow problem. Moreover, this solution will be optimal (and we are going to explain why).</p>

<p>The successive shortest path algorithm can be used when <span class="math">G</span> contains no negative cost cycles. Otherwise, we cannot say exactly what "the shortest path" means. Now let us justify the successive shortest path approach. When the current flow has zero value, the transportation network <span class="math">G</span> doesn't contain a negative cost cycle (by hypothesis). Suppose that after some augmenting steps we have flow <span class="math">x</span> and <span class="math">G<sub>x</sub></span> still contains no negative cycles. If <span class="math">x</span> is maximal then it is optimal, according to theorem 2. Otherwise, let us denote the next successfully found shortest path in <span class="math">G<sub>x</sub></span> by <span class="math">P</span>.</p>

<div align="center"><img src="/i/education/minimumCostFlow/Figure_2_3.png" alt="Figure 2_3" border="0" style="margin: 10px;" /></a></div>

<blockquote><b>Figure 3</b>. How could a negative cycle appear in a residual network?</blockquote>

<p>Suppose that after augmenting the current flow <span class="math">x</span> along path <span class="math">P</span> a negative cost cycle <span class="math">W</span> turned up in the residual network. Before augmenting there were no negative cycles. This means that there was an edge <span class="math">(i,j)</span> in <span class="math">P</span> (or subpath <span class="math">(i,&#8230;,j)</span> in <span class="math">P</span>) the reversal of which <span class="math">(j,i)</span> closed cycle <span class="math">W</span> after the augmentation. Evidently, we could choose another path from <span class="math">s</span> to <span class="math">t</span>, which goes from <span class="math">s</span> to <span class="math">i</span> then from <span class="math">i</span> to <span class="math">j</span> along edges of <span class="math">W</span> then from <span class="math">j</span> to <span class="math">t</span>. Moreover, the cost of this path is less than the cost of <span class="math">P</span>. We have a contradiction to the supposition that <span class="math">P</span> is the shortest.</p>

<p>What do we have? After the last step we have a feasible solution and the residual network contains no negative cycle. The latter is the criterion of optimality.</p>

<p>A simple analysis shows that the algorithm performs at most <span class="math">O(nB)</span> augmentations, where <span class="math">B</span> is assigned to an upper bound on the largest supply of any node. Really, each augmentation strictly decreases the residual capacity of a source arc (which is equal to the supply of the corresponding node). Thanks to the integrality property it decreases by at least one unit. By using an <span class="math">O(nm)</span> algorithm for finding a shortest path (there may be negative edges), we achieve an <span class="math">O(n<sup>2</sup>mB)</span> complexity of the successive shortest path algorithm.</p>

<pre class="code">
Successive Shortest Path
<b>1</b>    Transform network <span class="math">G</span> by adding source and sink
<b>2</b>    Initial flow <span class="math">x</span> is zero
<b>3</b>    <b>while</b> ( <span class="math">G<sub>x</sub></span> contains a path from <span class="math">s</span> to <span class="math">t</span> ) <b>do</b>
<b>4</b>        Find any shortest path <span class="math">P</span> from <span class="math">s</span> to <span class="math">t</span>
<b>5</b>        Augment current flow <span class="math">x</span> along <span class="math">P</span>
<b>6</b>        update <span class="math">G<sub>x</sub></span>
</pre>

<p>Let us reveal the meaning of node potentials from assumption 3. As it is said within assumption 3, we are able to make all edge costs nonnegative by using, for instance, Bellman-Ford's algorithm. Since working with residual costs doesn't change shortest paths (by theorem 2, part 1) we can work with the transformed network and use Dijkstra's algorithm to find the successive shortest path more efficiently. However, we need to keep the edge costs nonnegative on each iteration -- for this purpose, we update node potentials and reduce costs right after the shortest path has been found. The reduce cost function could be written in the following manner:</p>

<pre class="code">
Reduce Cost ( <img alt="" src="/i/education/minimumCostFlow/02_003.png" align="top" style="padding: 0px 3px 0px 3px;"> )
<b>1</b>    <b>For each</b> <span class="math">(i,j)</span> in <span class="math">E<sub>x</sub></span> <b>do</b>
<b>2</b>         <img alt="" src="/i/education/minimumCostFlow/02_004.png" align="top" style="padding: 0px 3px 0px 3px;">
<b>3</b>         <img alt="" src="/i/education/minimumCostFlow/02_005.png" align="top" style="padding: 0px 3px 0px 3px;">
</pre>

<p>Having found the successive shortest path we need to update node potentials. For each <span class="math">i</span> in <span class="math">V</span> the potential <img alt="" src="/i/education/minimumCostFlow/02_006.png" align="top" style="padding: 0px 3px 0px 3px;"> is equal to the length of the shortest paths from <span class="math">s</span> to <span class="math">t</span>. After having reduced the cost of each arc, we will see that along the shortest path from <span class="math">s</span> to <span class="math">i</span> arcs will have zero cost while the arcs which lie out of any shortest path to any vertex will have a positive cost. That is why we assign zero cost to any reversal arc <span class="math">(c<sub>rev(i,j)</sub>)</span> in the Reduce Cost Procedure in line 3. The augmentation (along the found path) adds reversal arc <span class="math">(j,i)</span> and due to the fact that (reduced) cost <span class="math">c<sub>ij</sub> = 0</span> we make <span class="math">(c<sub>rev(i,j)</sub>) = 0</span> beforehand.</p>

<p>Why have we denoted cost of reversal arc by <span class="math">(c<sub>rev(i,j)</sub>)</span> instead of <span class="math">c<sub>ji</sub></span>? Because the network may contain both arcs <span class="math">(i,j)</span> and <span class="math">(j,i)</span> (remember assumption 2 and "Working with Residual Networks" section). For other arcs (which lie out of the augmenting path) this forcible assignment does nothing, because its reversal arcs will not appear in the residual network. Now we propose a pseudo-code program:</p>

<pre class="code">
Successive Shortest Path with potentials
<b>1</b>    Transform network <span class="math">G</span> by adding source and sink
<b>2</b>    Initial flow <span class="math">x</span> is zero
<b>3</b>    Use Bellman-Ford's algorithm to establish potentials <img alt="" src="/i/education/minimumCostFlow/02_003.png" align="top" style="padding: 0px 3px 0px 3px;">
<b>4</b>    Reduce Cost ( <img alt="" src="/i/education/minimumCostFlow/02_003.png" align="top" style="padding: 0px 3px 0px 3px;"> )
<b>5</b>    <b>while</b> ( <span class="math">G<sub>x</sub></span> contains a path from <span class="math">s</span> to <span class="math">t</span> ) <b>do</b>
<b>6</b>        Find any shortest path <span class="math">P</span> from <span class="math">s</span> to <span class="math">t</span>
<b>7</b>        Reduce Cost ( <img alt="" src="/i/education/minimumCostFlow/02_003.png" align="top" style="padding: 0px 3px 0px 3px;"> )
<b>8</b>        Augment current flow <span class="math">x</span> along <span class="math">P</span>
<b>9</b>        update <span class="math">G<sub>x</sub></span>
</pre>

<p>Before starting the cycle in line 5 we calculate node potentials <img alt="" src="/i/education/minimumCostFlow/02_003.png" align="top" style="padding: 0px 3px 0px 3px;"> and obtain all costs to be nonnegative. We use the same massif of costs <span class="math">c</span> when reducing. In line 6 we use Dijkstra's algorithm to establish a shortest path with respect to the reduced costs. Then we reduce costs and augment flow along the path. After the augmentation all costs will remain nonnegative and in the next iteration Dijkstra's algorithm will work correctly.</p>

<div align="center"><img src="/i/education/minimumCostFlow/Figure_2_4.png" alt="Figure 2_4" border="0" style="margin: 10px;" /></a></div>

<blockquote><b>Figure 4</b>. The Successive shortest Path Algorithm. (a) Initial task. (b) Node potentials are calculated after line 3 of the program. (c) Reduced costs after line 4. (d) The first augmenting path s-1-2-3-4-t of capacity 2 is found and new node potentials are calculated. (e) The residual network with reduced costs. (f) The second augmenting path s-1-3-4-t of capacity 1 is found. (g) The residual network with reduced costs. (h) The third shortest augmenting path s-1-3-5-t and new node potentials are found. (i) The residual network contains no augmenting paths. (j) The reconstructed transportation network. Optimal flow has cost 12.</blockquote>

<p>We use Bellman-Ford's algorithm only once to avoid negative costs on edges. It takes <span class="math">O(nm)</span> time. Then <span class="math">O(nB)</span> times we use Dijkstra algorithm, which takes either <span class="math">O(n<sup>2</sup>)</span> (simple realization) or <span class="math">O(m</span>log<span class="math">n)</span> (heap realization for sparse network, [<a href="#4">4</a>]) time. Summing up, we receive <span class="math">O(n<sup>3</sup>B)</span> estimate working time for simple realization and <span class="math">O(nmB</span>log<span class="math">n)</span> if using heap. One could even use Fibonacci Heaps to obtain <span class="math">O(n</span>log<span class="math">n+m)</span> complexity of Dijkstra's shortest path algorithm; however I wouldn't recommend doing so because this case works badly in practice.</p>

<p><span class="bodySubtitle">Primal-Dual Algorithm</span><br />
The primal-dual algorithm for the minimum cost flow problem is similar to the successive shortest path algorithm in the sense that it also uses node potentials and shortest path algorithm to calculate them. Instead of augmenting the flow along one shortest path, however, this algorithm increases flow along all the shortest paths at once. For this purpose in each step it uses any maximum flow algorithm to find the maximum flow through the so called <strong>admissible network</strong>, which contains only those arcs in <span class="math">G<sub>x</sub></span> with a zero reduced cost. We represent the admissible residual network with respect to flow <span class="math">x</span> as <img alt="" src="/i/education/minimumCostFlow/02_007.png" align="top" style="padding: 0px 3px 0px 3px;">. Let's explain the idea by using a pseudo-code program.</p>

<pre class="code">
Primal-Dual
<b>1</b>    Transform network <span class="math">G</span> by adding source and sink
<b>2</b>    Initial flow <span class="math">x</span> is zero
<b>3</b>    Use Bellman-Ford's algorithm to establish potentials <img alt="" src="/i/education/minimumCostFlow/02_003.png" align="top" style="padding: 0px 3px 0px 3px;">
<b>4</b>    Reduce Cost ( <img alt="" src="/i/education/minimumCostFlow/02_003.png" align="top" style="padding: 0px 3px 0px 3px;"> )
<b>5</b>    <b>while</b> ( <span class="math">G<sub>x</sub></span> contains a path from <span class="math">s</span> to <span class="math">t</span> ) <b>do</b>
<b>6</b>        Calculate node potential <img alt="" src="/i/education/minimumCostFlow/02_003.png" align="top" style="padding: 0px 3px 0px 3px;"> using Dijkstra's algorithm
<b>7</b>        Reduce Cost ( <img alt="" src="/i/education/minimumCostFlow/02_003.png" align="top" style="padding: 0px 3px 0px 3px;"> )
<b>8</b>        Establish a maximum flow <span class="math">y</span> from <span class="math">s</span> to <span class="math">t</span> in <img alt="" src="/i/education/minimumCostFlow/02_007.png" align="top" style="padding: 0px 3px 0px 3px;">
<b>9</b>        <span class="math">x <img alt="" src="/i/education/minimumCostFlow/02_008.png" align="top" style="padding: 0px 3px 0px 3px;"> x + y</span>
<b>10</b>       update <span class="math">G<sub>x</sub></span>
</pre>

<p>For a better illustration look at Figure 5.</p>

<div align="center"><img src="/i/education/minimumCostFlow/Figure_2_5.png" alt="Figure 2_5" border="0" style="margin: 10px;" /></a></div>
 
<blockquote><b>Figure 5</b>. Primal-Dual algorithm. (a) Example network. (b) Node potentials are calculated. (c) The maximum flow in the admissible network. (d) Residual network and new node potentials. (e) The maximum flow in the admissible network. (f) Residual network with no augmenting paths. (g)  The optimal solution.</blockquote>

<p>As mentioned above, the primal-dual algorithm sends flow along all shortest paths at once; therefore, proof of correctness is similar to the successive shortest path one.</p>

<p>First, the primal-dual algorithm guarantees that the number of iterations doesn't exceed <span class="math">O(nB)</span> as well as the successive shortest path algorithm. Moreover, since we established a maximum flow in <img alt="" src="/i/education/minimumCostFlow/02_007.png" align="top" style="padding: 0px 3px 0px 3px;">, the residual network <span class="math">G<sub>x</sub></span> contains no directed path from vertex <span class="math">s</span> to vertex <span class="math">t</span> consisting entirely of arcs of zero costs. Consequently, the distance between <span class="math">s</span> and <span class="math">t</span> increases by at least one unit. These observations give a bound of <span class="math">min{nB,nC}</span> on the number of iterations which the primal-dual algorithm performs. Keep in mind, though, that the algorithm incurs the additional expense of solving a maximum flow problem at every iteration. However, in practice both the successive shortest path and the primal-dual algorithm work fast enough within the constraint of 50 vertexes and reasonable supply/demand values and costs.</p>

<p>In the <a href="/tc?module=Static&d1=tutorials&d2=minimumCostFlow3">next section</a>, we'll discuss some applications of the minimum cost flow problem.</p>

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
