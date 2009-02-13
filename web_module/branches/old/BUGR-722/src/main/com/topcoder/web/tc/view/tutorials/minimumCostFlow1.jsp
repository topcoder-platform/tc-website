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

<span class="bigTitle">Minimum Cost Flow, Part 1: Key Concepts</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/Zealint_big.jpg" alt="Author" />
</div>

<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22671469" context="algorithm"/> <br />
      <em>TopCoder Member</em>
</div>

<br clear="all">
<p>This article covers the so-called "min-cost flow" problem, which has many applications for both TopCoder competitors and professional programmers. The article is targeted to readers who are not familiar with the subject, with a focus more on providing a general understanding of the ideas involved rather than heavy theory or technical details; for a more in-depth look at this topic, check out the references at the end of this article, in particular [<a href="#1">1</a>]. In addition, readers of this article should be familiar with the basic concepts of graph theory -- including shortest paths [<a href="#4">4</a>], paths with negative cost arcs, negative cycles [<a href="#1">1</a>] -- and maximum flow theory's basic algorithms [<a href="#3">3</a>].</p>

<p>The article is divided into three parts. In Part 1, we'll look at the problem itself. The next part will describe three basic algorithms, and Part 3 some applications to the problem will be covered in Part 3.</p>

<p><span class="bodySubtitle">Statement of the Problem</span><br />
What is the minimum cost flow problem? Let's begin with some important terminology.</p>

<p>Let <img alt="" src="/i/education/minimumCostFlow/01_001.png" align="top" style="padding: 0px 3px 0px 3px;"> be a directed network defined by a set <span class="math">V</span> of vertexes (nodes) and set <span class="math">E</span> of edges (arcs). For each edge <img alt="" src="/i/education/minimumCostFlow/01_002.png" align="top" style="padding: 0px 3px 0px 3px;"> we associate a <b>capacity</b> <span class="math">u<sub>ij</sub></span> that denotes the maximum amount that can flow on the edge. Each edge <img alt="" src="/i/education/minimumCostFlow/01_003.png" align="top" style="padding: 0px 3px 0px 3px;"> also has an associated <b>cost</b> <span class="math">c<sub>ij</sub></span> that denotes the cost per unit flow on that edge.</p>

<p>We associate with each vertex <img alt="" src="/i/education/minimumCostFlow/01_004.png" align="top" style="padding: 0px 3px 0px 3px;"> a number <span class="math">b<sub>i</sub></span>. This value represents supply/demand of the vertex.  If <span class="math">b<sub>i</sub></span> &gt; 0, node <span class="math">i</span> is a <b>supply node</b>; if <span class="math">b<sub>i</sub></span> &lt; 0, node <span class="math">i</span> is a <b>demand node</b> (its demand is equal to <span class="math">-b<sub>i</sub></span>). We call vertex <span class="math">i</span> a <b>transshipment</b> if <span class="math">b<sub>i</sub></span> is zero.</p>

<p>For simplification, let's call <span class="math">G</span> a <b>transportation network</b> and write <img alt="" src="/i/education/minimumCostFlow/01_005.png" align="top" style="padding: 0px 3px 0px 3px;"> in case we want to show all the network parameters explicitly.</p>

<div align="center"><img src="/i/education/minimumCostFlow/Figure_1_1.png" alt="Figure 1_1" border="0" style="margin-top: 10px 10px 0px 10px;" /></a></div>

<blockquote><b>Figure 1</b>. An example of the transportation network. In this we have 2 supply vertexes (with supply values 5 and 2), 3 demand vertexes (with demand values 1, 4 and 2), and 1 transshipment node. Each edge has two numbers, capacity and cost, divided by comma.</blockquote>

<p>Representing the flow on arc <img alt="" src="/i/education/minimumCostFlow/01_002.png" align="top" style="padding: 0px 3px 0px 3px;"> by <span class="math">x<sub>ij</sub></span>, we can obtain the optimization model for the minimum cost flow problem:</p>

<div align="center"><img alt="" src="/i/education/minimumCostFlow/01_006.png" align="top" style="padding: 10px;"></div>
<p>subject to</p>
<div align="center"><img alt="" src="/i/education/minimumCostFlow/01_007.png" align="top" style="padding: 10px;"></div>

<p>The first constraint states that the total outflow of a node minus the total inflow of the node must be equal to mass balance (supply/demand value) of this node. This is known as the <b>mass balance constraints</b>. Next, the <b>flow bound constraints</b> model physical capacities or restrictions imposed on the flow's range. As you can see, this optimization model describes a typical relationship between warehouses and shops, for example, in a case where we have only one kind of product. We need to satisfy the demand of each shop by transferring goods from the subset of warehouses, while minimizing the expenses on transportation.</p>

<p>This problem could be solved using simplex-method, but in this article we concentrate on some other ideas related to network flow theory. Before we move on to the three basic algorithms used to solve the minimum cost flow problem, let's review the necessary theoretical base.</p>

<p><span class="bodySubtitle">Finding a solution</span><br />
When does the minimum cost flow problem have a feasible (though not necessarily optimal) solution? How do we determine whether it is possible to translate the goods or not?</p>

<p>If <img alt="" src="/i/education/minimumCostFlow/01_008.png" align="top" style="padding: 0px 3px 0px 3px;"> then the problem has no solution, because either the supply or the demand dominates in the network and the mass balance constraints come into play.</p>

<p>We can easily avoid this situation, however, if we add a special node <span class="math">r</span> with the supply/demand value <img alt="" src="/i/education/minimumCostFlow/01_009.png" align="top" style="padding: 0px 3px 0px 3px;">. Now we have two options: If <img alt="" src="/i/education/minimumCostFlow/01_010.png" align="top" style="padding: 0px 3px 0px 3px;"> (supply dominates) then for each node <img alt="" src="/i/education/minimumCostFlow/01_004.png" align="top" style="padding: 0px 3px 0px 3px;"> with <span class="math">b<sub>i</sub></span> &gt; 0 we add an arc <img alt="" src="/i/education/minimumCostFlow/01_011.png" align="top" style="padding: 0px 3px 0px 3px;"> with infinite capacity and zero cost; otherwise (demand dominates), for each node <img alt="" src="/i/education/minimumCostFlow/01_004.png" align="top" style="padding: 0px 3px 0px 3px;"> with  <span class="math">b<sub>i</sub></span> &lt; 0, we add an arc <img alt="" src="/i/education/minimumCostFlow/01_012.png" align="top" style="padding: 0px 3px 0px 3px;"> with the same properties. Now we have a new network with <img alt="" src="/i/education/minimumCostFlow/01_013.png" align="top" style="padding: 0px 3px 0px 3px;"> -- and it is easy to prove that this network has the same optimal value as the objective function.</p>

<p>Consider the vertex r as a rubbish or scrap dump. If the shops demand is less than what the warehouse supplies, then we have to eject the useless goods as rubbish. Otherwise, we take the missing goods from the dump. This would be considered shady in real life, of course, but for our purposes it is very convenient. Keep in mind that, in this case, we cannot say what exactly the "solution" of the corrected (with scrap) problem is. And it is up to the reader how to classify the emergency uses of the "dump." For example, we can suggest that goods remain in the warehouses or some of the shop's demands remain unsatisfied.</p>

<p>Even if we have <img alt="" src="/i/education/minimumCostFlow/01_014.png" align="top" style="padding: 0px 3px 0px 3px;"> we are not sure that the edge's capacities allow us to transfer enough flow from supply vertexes to demand ones. To determine if the network has a feasible flow, we want to find any transfer way what will satisfy all the problem's constraints. Of course, this feasible solution is not necessarily optimal, but if it is absent we cannot solve the problem.</p>

<p>Let us introduce a source node <span class="math">s</span> and a sink node <span class="math">t</span>. For each node <img alt="" src="/i/education/minimumCostFlow/01_004.png" align="top" style="padding: 0px 3px 0px 3px;"> with <span class="math">b<sub>i</sub></span> &gt; 0, we add a source arc <img alt="" src="/i/education/minimumCostFlow/01_015.png" align="top" style="padding: 0px 3px 0px 3px;"> to <span class="math">G</span> with capacity <span class="math">b<sub>i</sub></span> and cost 0. For each node <img alt="" src="/i/education/minimumCostFlow/01_004.png" align="top" style="padding: 0px 3px 0px 3px;"> with <span class="math">b<sub>i</sub></span> &lt; 0, we add a sink arc <img alt="" src="/i/education/minimumCostFlow/01_016.png" align="top" style="padding: 0px 3px 0px 3px;"> to <span class="math">G</span> with capacity <span class="math">-b<sub>i</sub></span> and cost 0.</p>

<div align="center"><img src="/i/education/minimumCostFlow/Figure_1_2.png" alt="Figure 1_2" border="0" style="margin-top: 10px 10px 0px 10px;" /></a></div>

<blockquote><b>Figure 2</b>. Maximum flow in the transformed network. For simplicity we are ignoring the costs.</blockquote>

<p>The new network is called a <b>transformed network</b>. Next, we solve a maximum flow problem from <span class="math">s</span> to <span class="math">t</span> (ignoring costs, see fig.2). If the maximum flow saturates all the source and sink arcs, then the problem has a feasible solution; otherwise, it is infeasible. As for why this approach works, we'll leave its proof to the reader.</p>

<p>Having found a maximum flow, we can now remove source, sink, and all adjacent arcs and obtain a feasible flow in <span class="math">G</span>. How do we detect whether the flow is optimal or not? Does this flow minimize costs of the objective function <span class="math">z</span>? We usually verify "optimality conditions" for the answer to these questions, but let us put them on hold for a moment and discuss some assumptions.</p>

<p>Now, suppose that we have a network that has a feasible solution. Does it have an optimal solution? If our network contains the negative cost cycle of infinite capacity then the objective function will be unbounded. However, in some tasks, we are able to assign finite capacity to each uncapacitated edge escaping such a situation.</p>

<p>So, from the theoretical point of view, for any minimum cost flow problem we have to check some conditions: The supply/demand balance, the existence of a feasible solution, and the last situation with uncapacitated negative cycles. These are necessary conditions for resolving the problem. But from the practical point of view, we can check the conditions while the solution is being found.</p>

<p><span class="bodySubtitle">Assumptions</span><br />
In understanding the basics of network flow theory it helps to make some assumptions, although sometimes they can lead to a loss of generality. Of course, we could solve the problems without these assumptions, but the solutions would rapidly become too complex. Fortunately, these assumptions are not as restrictive as they might seem.</p>

<p><i><b>Assumption 1</b>. All data (<span class="math">u<sub>ij</sub></span>, <span class="math">c<sub>ij</sub></span>, <span class="math">b<sub>i</sub></span>) are integral.</i><br>
As we have to deal with a computer, which works with rational numbers, this assumption is not restrictive in practice. We can convert rational numbers to integers by multiplying by a suitable large number.</p>

<p><i><b>Assumption 2</b>. The network is directed.</i><br>
If the network were undirected we would transform it into a directed one. Unfortunately, this transformation requires the edge's cost to be nonnegative. Let's validate this assumption.</p>

<p>To transform an undirected case to a directed one, we replace each undirected edge connecting vertexes <span class="math">i</span> and <span class="math">j</span> by two directed edges <img alt="" src="/i/education/minimumCostFlow/01_017.png" align="top" style="padding: 0px 3px 0px 3px;"> and <img alt="" src="/i/education/minimumCostFlow/01_018.png" align="top" style="padding: 0px 3px 0px 3px;">, both with the capacity and cost of the replaced arc. To establish the correctness of this transformation, first we note that for undirected arc <img alt="" src="/i/education/minimumCostFlow/01_002.png" align="top" style="padding: 0px 3px 0px 3px;"> we have constraint <img alt="" src="/i/education/minimumCostFlow/01_019.png" align="top" style="padding: 0px 3px 0px 3px;"> and the term <img alt="" src="/i/education/minimumCostFlow/01_020.png" align="top" style="padding: 0px 3px 0px 3px;"> in the objective function. Given that <img alt="" src="/i/education/minimumCostFlow/01_021.png" align="top" style="padding: 0px 3px 0px 3px;"> we see that in some optimal solution either <span class="math">x<sub>ij</sub></span> or <span class="math">x<sub>ji</sub></span> will be zero. We call such a solution non-overlapping. Now it is easy to make sure (and we leave it to the reader) that every non-overlapping flow in the original network has an associated flow in the transformed network with the same cost, and vise versa.</p>

<p><i><b>Assumption 3</b>. All costs associated with edges are nonnegative.</i><br>
This assumption imposes a loss of generality. We will show below that if a network with negative costs had no negative cycle it would be possible to transform it into one with nonnegative costs. However, one of the algorithms (namely cycle-canceling algorithm) which we are going to discuss is able to work without this assumption.</p>

<p>For each vertex <img alt="" src="/i/education/minimumCostFlow/01_004.png" align="top" style="padding: 0px 3px 0px 3px;"> let's denote by <img alt="" src="/i/education/minimumCostFlow/01_022.png" align="top" style="padding: 0px 3px 0px 3px;"> a number associated with the vertex and call it the <b>potential</b> of node <span class="math">i</span>. Next define the <b>reduced cost</b>  <img alt="" src="/i/education/minimumCostFlow/01_023.png" align="top" style="padding: 0px 3px 0px 3px;"> of an edge <img alt="" src="/i/education/minimumCostFlow/01_002.png" align="top" style="padding: 0px 3px 0px 3px;"> as</p>

<div align="center"><img alt="" src="/i/education/minimumCostFlow/01_024.png" align="top" style="padding: 10px;"></div>

<p>How does our objective value change? Let's denote reduced value by <img alt="" src="/i/education/minimumCostFlow/01_025.png" align="top" style="padding: 0px 3px 0px 3px;">. Evidently, if <img alt="" src="/i/education/minimumCostFlow/01_026.png" align="top" style="padding: 0px 3px 0px 3px;">, then</p>

<div align="center"><img alt="" src="/i/education/minimumCostFlow/01_027.png" align="top" style="padding: 10px;"></div>

<p>For other values of <img alt="" src="/i/education/minimumCostFlow/01_028.png" align="top" style="padding: 0px 3px 0px 3px;"> we obtain following result:</p>

<div align="center"><img alt="" src="/i/education/minimumCostFlow/01_029.png" align="top" style="padding: 10px;"></div>

<p>For a fixed <img alt="" src="/i/education/minimumCostFlow/01_028.png" align="top" style="padding: 0px 3px 0px 3px;">, the difference <img alt="" src="/i/education/minimumCostFlow/01_030.png" align="top" style="padding: 0px 3px 0px 3px;"> is constant. Therefore, a flow that minimizes <img alt="" src="/i/education/minimumCostFlow/01_031.png" align="top" style="padding: 0px 3px 0px 3px;"> also minimizes <span class="math">z(x)</span> and vice versa. We have proved:</p>

<p><i><b>Theorem 1</b>. For any node potential <img alt="" src="/i/education/minimumCostFlow/01_028.png" align="top" style="padding: 0px 3px 0px 3px;"> the minimum cost flow problems with edge costs <span class="math">c<sub>ij</sub></span> or <img alt="" src="/i/education/minimumCostFlow/01_023.png" align="top" style="padding: 0px 3px 0px 3px;"> have the same optimal solutions. Moreover,</i></p>

<div align="center"><img alt="" src="/i/education/minimumCostFlow/01_032.png" align="top" style="padding: 10px;"></div>

<p>The following result contains very useful properties of reduced costs.</p>

<p><i><b>Theorem 2</b>.  Let <span class="math">G</span> be a transportation network. Suppose <span class="math">P</span> is a directed path from <img alt="" src="/i/education/minimumCostFlow/01_033.png" align="top" style="padding: 0px 3px 0px 3px;"> to <img alt="" src="/i/education/minimumCostFlow/01_034.png" align="top" style="padding: 0px 3px 0px 3px;">. Then for any node potential <img alt="" src="/i/education/minimumCostFlow/01_028.png" align="top" style="padding: 0px 3px 0px 3px;"></i></p>

<div align="center"><img alt="" src="/i/education/minimumCostFlow/01_035.png" align="top" style="padding: 10px;"></div>

<p><i>Suppose <span class="math">W</span> is a directed cycle. Then for any node potential <img alt="" src="/i/education/minimumCostFlow/01_028.png" align="top" style="padding: 0px 3px 0px 3px;"></i></p>

<div align="center"><img alt="" src="/i/education/minimumCostFlow/01_036.png" align="top" style="padding: 10px;"></div>

<p>This theorem implies the following reasoning. Let's introduce a vertex <span class="math">s</span> and for each node <img alt="" src="/i/education/minimumCostFlow/01_004.png" align="top" style="padding: 0px 3px 0px 3px;">, we add an arc <img alt="" src="/i/education/minimumCostFlow/01_015.png" align="top" style="padding: 0px 3px 0px 3px;"> to <span class="math">G</span> with some positive capacity and zero cost.  Suppose that for each <img alt="" src="/i/education/minimumCostFlow/01_004.png" align="top" style="padding: 0px 3px 0px 3px;"> number <img alt="" src="/i/education/minimumCostFlow/01_022.png" align="top" style="padding: 0px 3px 0px 3px;"> denotes length of the shortest path from <span class="math">s</span> to <span class="math">i</span> with respect to cost function <span class="math">c</span>. (Reminder: there is no negative length cycle). If so, one can justify (or read it in [<a href="#2">2</a>]) that for each <img alt="" src="/i/education/minimumCostFlow/01_002.png" align="top" style="padding: 0px 3px 0px 3px;"> the shortest path optimality condition is satisfied:</p>

<div align="center"><img alt="" src="/i/education/minimumCostFlow/01_037.png" align="top" style="padding: 10px;"></div>

<p>Since, <img alt="" src="/i/education/minimumCostFlow/01_038.png" align="top" style="padding: 0px 3px 0px 3px;"> and <img alt="" src="/i/education/minimumCostFlow/01_039.png" align="top" style="padding: 0px 3px 0px 3px;"> yields <img alt="" src="/i/education/minimumCostFlow/01_040.png" align="top" style="padding: 0px 3px 0px 3px;">. Moreover, applying theorem 2, we can note that if <span class="math">G</span> contains negative cycle, it will be negative for any node potential <img alt="" src="/i/education/minimumCostFlow/01_028.png" align="top" style="padding: 0px 3px 0px 3px;"> in reduced network. So, if the transportation network has no negative cycle, we will be able to reduce costs and make them positive by finding the shortest paths from the introduced vertex <span class="math">s</span>, otherwise, our assumption doesn't work. If the reader asks how to find the shortest path in graph with negative costs, I'll refer you back to the basics of the graph theory. One can use Bellman-Ford (label-correcting) algorithm to achieve this goal [<a href="#1">1</a>, <a href="#2">2</a>].</p>

<p>Remember this reduced cost technique, since it appears in many applications and other algorithms (for example, Johnson's algorithm for all pair shortest path in sparse networks uses it [<a href="#2">2</a>]).</p>

<p><i><b>Assumption 4</b>. The supply/demand at the vertexes satisfy the condition <img alt="" src="/i/education/minimumCostFlow/01_041.png" align="top" style="padding: 0px 3px 0px 3px;"> and the minimum cost flow problem has a feasible solution.</i></p>

<p>This assumption is a consequence of the "Finding a Solution" section of this article. If the network doesn't satisfy the first part of this assumption, we can either say that the problem has no solution or make corresponding transformation according to the steps outlined in that section. If the second part of the assumption isn't met then the solution doesn't exist.</p>

<p>By making these assumptions we do transform our original transportation network. However, many problems are often given in such a way which satisfies all the assumptions.</p>

<p>Now that all the preparations are behind us, we can start to discuss the algorithms in <a href="/tc?module=Static&d1=tutorials&d2=minimumCostFlow2">Part 2</a>.</p>

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
