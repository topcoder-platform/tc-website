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
.code
{
   width: 550;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}
.math
{
   font-family: times, times new roman, serif;
   font-weight: normal;
   font-style: italic;
   font-size: 14px;
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
        <td width="180" id="onLeft"><jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="algo_tutorials"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->
        <!-- Center Column Begins -->
        <td width="100%" align="center"><div class="tutorBodyFull">
            <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="alg_tut"/>
            <jsp:param name="title" value="&#160;"/>
            </jsp:include>
            <div class="linkBox"> <A href="/tc?module=Static&d1=tutorials&d2=alg_index">Archive</A><br>
                <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br>
                </span> <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br>
                </span>
                <tc-webtag:forumLink forumID="516430" message="Discuss this article" /><br />
                <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
            </div>
            
            <span class="bigTitle">Maximum Flow: Augmenting Path Algorithms Comparison</span>
            <br /><br />

            <div class="authorPhoto">
                <img src="/i/m/Zealint_big.jpg" alt="Author" />
            </div>

            <div class="authorText"> By&#160;<tc-webtag:handle coderId="22671469" /><br />
                <em>TopCoder Member</em>
            </div>

            <br clear="all">

<p>With this article, we'll revisit the so-called "max-flow" problem, with the goal of making some practical analysis of the most famous augmenting path algorithms. We will discuss several algorithms with different complexity from <span class="math">O(nm<sup>2</sup>)</span> to <span class="math">O(nm</span>log<span class="math">U)</span> and reveal the most efficient one in practice. As we will see,  theoretical complexity is not a good indicator of the actual value of an algorithm.</p>

<p>The article is targeted to the readers who are familiar with the basics of network flow theory. If not, I'll refer them to check out [<a href="#1">1</a>], [<a href="#2">2</a>] or algorithm tutorial [<a href="#5">5</a>]. </p>

<p>In the first section we remind some necessary definitions and statements of the maximum flow theory. Other sections discuss the augmenting path algorithms themselves. The last section shows results of a practical analysis and highlights the best in practice algorithm. Also we give a simple implementation of one of the algorithms.</p>

<p><span class="bodySubtitle">Statement of the Problem</span><br />
Suppose we have a directed network <span class="math">G = (V, E)</span> defined by a set <span class="math">V</span> of nodes (or vertexes) and a set <span class="math">E</span> of arcs (or edges). Each arc <span class="math">(i,j)</span> in <span class="math">E</span> has an associated nonnegative capacity <span class="math">u<sub>ij</sub></span>. Also we distinguish two special nodes in <span class="math">G</span>: a <i>source</i> node <span class="math">s</span> and a <i>sink</i> node <span class="math">t</span>. For each <span class="math">i</span> in <span class="math">V</span> we denote by <span class="math">E(i)</span> all the arcs emanating from node <span class="math">i</span>. Let <span class="math">U</span> = max <span class="math">u<sub>ij</sub></span> by <span class="math">(i,j)</span> in <span class="math">E</span>. Let us also denote the number of vertexes by <span class="math">n</span> and the number of edges by <span class="math">m</span>.</p>

<p>We wish to find the maximum flow from the source node <span class="math">s</span> to the sink node <span class="math">t</span> that satisfies the arc capacities and mass balance constraints at all nodes. Representing the flow on arc  <span class="math">(i,j)</span> in <span class="math">E</span> by <span class="math">x<sub>ij</sub></span> we can obtain the optimization model for the maximum flow problem:</p>

<div align="center"><img src="/i/education/maxFlowRevisited01.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a></div>

<p>Vector <span class="math">(x<sub>ij</sub>)</span> which satisfies all constraints is called <i>a feasible solution</i> or, <i>a flow</i> (it is not necessary maximal). Given a flow <span class="math">x</span> we are able to construct the residual network with respect to this flow according to the following intuitive idea. Suppose that an edge <span class="math">(i,j)</span> in <span class="math">E</span> carries <span class="math">x<sub>ij</sub></span> units of flow. We define the residual capacity of the edge <span class="math">(i,j)</span> as <span class="math">r<sub>ij</sub> = u<sub>ij</sub> - x<sub>ij</sub></span>. This means that we can send an additional <span class="math">r<sub>ij</sub></span> units of flow from vertex <span class="math">i</span> to vertex <span class="math">j</span>. We can also cancel the existing flow <span class="math">x<sub>ij</sub></span> on the arc if we send up <span class="math">x<sub>ij</sub></span> units of flow from <span class="math">j</span> to <span class="math">i</span> over the arc <span class="math">(i,j)</span>. </p>

<p>So, given a feasible flow <span class="math">x</span> we define the residual network with respect to the flow <span class="math">x</span> as follows. Suppose we have a network <span class="math">G = (V, E)</span>. A feasible solution <span class="math">x</span> engenders a new (residual) network, which we define by <span class="math">G<sub>x</sub> = (V, E<sub>x</sub>)</span>, where <span class="math">E<sub>x</sub></span> is a set of residual edges corresponding to the feasible solution <span class="math">x</span>. </p>

<p>What is <span class="math">E<sub>x</sub></span>? We replace each arc <span class="math">(i,j)</span> in <span class="math">E</span> by two arcs <span class="math">(i,j)</span>, <span class="math">(j,i)</span>: the arc <span class="math">(i,j)</span> has (residual) capacity <span class="math">r<sub>ij</sub> = u<sub>ij</sub> - x<sub>ij</sub></span>, and the arc <span class="math">(j,i)</span> has (residual) capacity <span class="math">r<sub>ji</sub>=x<sub>ij</sub></span>. Then we construct the set <span class="math">E<sub>x</sub></span> from the new edges with a positive residual capacity. </p>

<p><span class="bodySubtitle">Augmenting Path Algorithms as a whole</span><br />
In this section we describe one method on which all augmenting path algorithms are being based. This method was developed by Ford and Fulkerson in 1956 [<a href="#3">3</a>]. We start with some important definitions.</p>

<p><i>Augmenting path</i> is a directed path from a source node s to a sink node t in the residual network. The residual capacity of an augmenting path is the minimum residual capacity of any arc in the path. Obviously, we can send additional flow from the source to the sink along an augmenting path.</p>

<p>All augmenting path algorithms are being constructed on the following basic idea known as augmenting path theorem:</p>

<p><i><b>Theorem 1 (Augmenting Path Theorem)</b>. A flow x*  is a maximum flow if and only if the residual network Gx* contains no augmenting path.</i></p>

<p>According to the theorem we obtain a method of finding a maximal flow. The method proceeds by identifying augmenting paths and augmenting flows on these paths until the network contains no such path. All algorithms that we wish to discuss  differ only in the way of finding augmenting paths.</p>

<p>We consider the maximum flow problem subject to the following assumptions.</p>

<p><i><b>Assumption 1.</b> The network is directed.</i></p>

<p><i><b>Assumption 2.</b> All capacities are nonnegative integers.</i></p>

<p>This assumption is not necessary for some algorithms, but the algorithms whose complexity bounds involve <span class="math">U</span> assume the integrality of the data.</p>

<p><i><b>Assumption 3.</b> The problem has a bounded optimal solution.</i></p>

<p>This assumption in particular means that there are no uncapacitated paths from the source to the sink.</p>

<p><i><b>Assumption 4.</b> The network does not contain parallel arcs.</i></p>

<p>This assumption imposes no loss of generality, because one can summarize capacities of all parallel arcs.</p>

<p>As to why these assumptions are correct we leave the proof to the reader.</p>

<p>It is easy to determine that the method described above works correctly. Under assumption 2, on each augmenting step we increase the flow value by at least one unit. We (usually) start with zero flow. The maximum flow value is bounded from above, according to  assumption 3. This reasoning implies the finiteness of the method. </p>

<p>With those preparations behind us, we are ready to begin discussing the algorithms.</p>

<p><span class="bodySubtitle">Shortest Augmenting Path Algorithm,</span> <span class="math">O(n<sup>2</sup>m)</span><br />
In 1972 Edmonds and Karp -- and, in 1970, Dinic -- independently proved that if each augmenting path is shortest one, the algorithm will perform <span class="math">O(nm)</span> augmentation steps. The shortest path (length of each edge is equal to one) can be found with the help of breadth-first search (BFS) algorithm [<a href="#2">2</a>], [<a href="#6">6</a>]. Shortest Augmenting Path Algorithm is well known and widely discussed in many books and articles, including  [<a href="#5">5</a>], which is why we will not describe it in great detail. Let's review the idea using a kind of pseudo-code:</p>

<div align="center"><img src="/i/education/maxFlowRevisited02.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a></div>

<p>In line 5, current flow <span class="math">x</span> is being increased by some positive amount.</p>

<p>The algorithm was said to perform <span class="math">O(nm)</span> steps of finding an augmenting path. Using BFS, which requires <span class="math">O(m)</span> operation in the worst case, one can obtain <span class="math">O(nm<sup>2</sup>)</span> complexity of the algorithm itself. If <span class="math">m ~ n2</span> then one must use BFS procedure <span class="math">O(n<sup>3</sup>)</span> times in worst case. There are some networks on which this numbers of augmentation steps is being achieved. We will show one simple example below.</p>

<p><span class="bodySubtitle">Improved Shortest Augmenting Path Algorithm,</span> <span class="math">O(n<sup>2</sup>m)</span><br />
As mentioned earlier, the natural approach for finding any shortest augmenting path would be to look for paths by performing a breadth-first search in the residual network. It requires <span class="math">O(m)</span> operations in the worst case and imposes <span class="math">O(nm<sup>2</sup>)</span> complexity of the maximum flow algorithm. Ahuja and Orlin improved the shortest augmenting path algorithm in 1987 [<a href="#1">1</a>]. They exploited the fact that the minimum distance from any node <span class="math">i</span> to the sink node <span class="math">t</span> is monotonically nondecreasing over all augmentations and reduced the average time per augmentation to <span class="math">O(n)</span>. The improved version of the augmenting path algorithm, then, runs in <span class="math">O(n<sup>2</sup>m)</span> time. We can now start discussing it according to [<a href="#1">1</a>].</p>

<p><i><b>Definition 1.</b> Distance function d: V_ Z+ with respect to the residual capacities rij is a function from the set of nodes to nonnegative integers. Let's say that distance function is valid if it is satisfies the following conditions:</i></p>
<ul><i>
	<li>d(t)=0;</li>
	<li>d(i) &le; d(j) + 1, for every (i,j) in E with rij&gt;0.</li>
</i></ul>


<p>Informally (and it is easy to prove), valid distance label of node <span class="math">i</span>, represented by <span class="math">d(i)</span>, is a lower bound on the length of the shortest path from <span class="math">i</span> to <span class="math">t</span> in the residual network <span class="math">Gx</span>. We call distance function <i>exact</i> if each <span class="math">i</span> in <span class="math">V d(i)</span> equals the length of the shortest path from <span class="math">i</span> to <span class="math">t</span> in the residual network. It is also easy to prove that if <span class="math">d(s) &ge; n</span> then the residual network contains no path from the source to the sink.</p>

<p>An arc <span class="math">(i,j)</span> in <span class="math">E</span> is called admissible if <span class="math">d(i) = d(j) + 1</span>. We call other arcs <i>inadmissible</i>. If a path from <span class="math">s</span> to <span class="math">t</span> consists of admissible arcs then the path is admissible. Evidently, an admissible path is the shortest path from the source to the sink. As far as every arc in an admissible path satisfies condition <span class="math">r<sub>ij</sub>&gt;0</span>, the path is augmenting.</p>

<p>So, the improved shortest augmenting path algorithm consists of four steps (procedures): <i>main cycle, advance, retreat</i> and <i>augment</i>. The algorithm maintains a <i>partial admissible path</i>, i.e., a path from s to some node <span class="math">i</span>, consisting of admissible arcs. It performs <i>advance</i> or <i>retreat</i> steps from the last node of the partial admissible path (such node is called <i>current node</i>). If there is some admissible arc <span class="math">(i,j)</span> from current node <span class="math">i</span>, then the algorithm performs the <i>advance</i> step and adds the arc to the partial admissible path. Otherwise, it performs the <i>retreat</i> step, which increases distance label of <span class="math">i</span> and backtracks by one arc.</p>

<p>If the partial admissible path reaches the sink, we perform an augmentation. The algorithm stops when <span class="math">d(s) &ge; n</span>.  Let's describe these steps in pseudo-code [<a href="#1">1</a>]. We denoted residual (with respect to flow <span class="math">x</span>) arcs emanating from node <span class="math">i</span> by <span class="math">E<sub>x</sub>(i)</span>. More formally, <span class="math">E<sub>x</sub>(i) = { (i,j) in E(i): r<sub>ij</sub> &gt; 0 }</span>.</p>

<div align="center"><img src="/i/education/maxFlowRevisited03.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a></div>

<p>In line 1 of <i>retreat</i> procedure if <span class="math">E<sub>x</sub>(i)</span> is empty, then suppose <span class="math">d(i)</span> equals <span class="math">n</span>.</p>

<p>Ahuja and Orlin suggest the following data structure for this algorithm [<a href="#1">1</a>]. We maintain the arc list <span class="math">E(i)</span> which 
contains all the arcs emanating from node <span class="math">i</span>. We arrange the arcs in this list in any fixed order. Each node <span class="math">i</span> has a <i>current arc</i>, which is an arc in <span class="math">E(i)</span> and is the next candidate for admissibility testing. 
Initially, the current arc of node <span class="math">i</span> is the first arc in <span class="math">E(i)</span>. In line 5 the algorithm tests whether the 
node's current arc is admissible. If not, it designates the next arc in the list as the current arc. The algorithm repeats this process until either it finds an admissible 
arc or reaches the end of the arc list. In the latter case the algorithm declares that <span class="math">E(i)</span> contains no admissible arc; it again 
designates the first arc in <span class="math">E(i)</span> as the current arc of node <span class="math">i</span> and performs the <i>relabel</i> operation by calling the

<i>retreat</i> procedure (line 10). </p>

<p>Now we outline a proof that the algorithm runs in <span class="math">O(n<sup>2</sup>m)</span> time.</p>

<p><i><b>Lemma 1.</b> The algorithm maintains distance labels at each step. Moreover, each relabel (or, retreat) step strictly increases the distance label of a node.</i></p>

<p><b>Sketch to proof.</b> Perform induction on the number of <i>relabel</i> operation and augmentations.</p>

<p><i><b>Lemma 2.</b> Distance label of each node increases at most n times. Consecutively, relabel operation performs at most n<sup>2</sup> times.</i></p>

<p><b>Proof.</b> This lemma is consequence of lemma 1 and the fact that if <span class="math">d(s) &ge; n</span> then the residual network contains no augmenting path.</p>

<p>Since the improved shortest augmenting path algorithm makes augmentations along the shortest paths (like unimproved one), the total number of augmentations is the same <span class="math">O(nm)</span>. Each <i>retreat</i> step relabels a node, that is why number of <i>retreat</i> steps is <span class="math">O(n<sup>2</sup>)</span> (according to lemma 2). Time to perform <i>retreat/relabel</i> steps is <span class="math">O( n<em> &sum;</em><sub>i in V</sub> |E(i)| ) = O(nm)</span>. Since one augmentation requires <span class="math">O(n)</span> time, total augmentation time is <span class="math">O(n<sup>2</sup>m)</span>. The total time of <i>advance</i> steps is bounded by the augmentation time plus the <i>retreat/relabel</i> time and it is again <span class="math">O(n<sup>2</sup>m)</span>. We obtain the following result:</p>

<p><i><b>Theorem 2.</b> The improved shortest augmenting path algorithm runs in <span class="math">O(n<sup>2</sup>m)</span> time.</i></p>

<p>Ahuja and Orlin [<a href="#1">1</a>] suggest one very useful practical improvement of the algorithm. Since the algorithm performs many useless relabel operations while the maximum flow has been found, it will be better to give an additional criteria of terminating. Let's introduce (n+1)-dimensional additional array, <i>numbs</i>, whose indices vary from 0 to n. The value <i>numbs(k)</i> is the number of nodes whose distance label equals <i>k</i>. The algorithm initializes this array while computing the initial distance labels using BFS. At this point, the positive entries in the array <i>numbs</i> are consecutive (i.e., <i>numbs(0), numbs(1), ..., numbs(l)</i> will be positive up to some index <span class="math">l</span> and the remaining entries will all be zero). </p>

<p>When the algorithm increases a distance label of a node from x to y, it subtracts 1 from <i>numbs(x)</i>, adds 1 to <i>numbs(y)</i> and checks whether <i>numbs(x) = 0</i>. If it does equal 0, the algorithm terminates.</p>

<p>This approach is some kind of heuristic, but it is really good in practice. As to why this approach works we leave the proof to the reader (<i>hint</i>: show that the nodes <span class="math">i</span> with <span class="math">d(i) &gt; x</span> and nodes <span class="math">j</span> with <span class="math">d(j) &lt; x</span> engender a cut and use maximum-flow-minimum-cut theorem).</p>

<p><span class="bodySubtitle">Comparison of Improved and Unimproved versions</span><br />
In this section we identify the worst case for both shortest augmenting path algorithms with the purpose of comparing their running times.</p>

<p>In the worst case both improved and unimproved algorithms will perform <span class="math">O(n<sup>3</sup>)</span> augmentations, if <span class="math">m ~ n2</span>. Norman Zadeh [<a href="#4">4</a>] developed some examples on which this running time is based. Using his ideas we compose a somewhat simpler network on which the algorithms have to perform <span class="math">O(n<sup>3</sup>)</span> augmentations and which is not dependent on a choice of next path.</p>

<div align="center"><img src="/i/education/maxFlowRevisited04.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a><br>
Figure 1. Worst case example for the shortest augmenting path algorithm.</div>



<p>All vertexes except <span class="math">s</span> and <span class="math">t</span> are divided into four subsets: <span class="math">S={s1,...,sk}</span>, <span class="math">T={t1,...,tk}</span>, <span class="math">U={u1,...,u2p}</span> and <span class="math">V={v1,...,v2p}</span>. Both sets <span class="math">S</span> and <span class="math">T</span> contain <span class="math">k</span> nodes while both sets <span class="math">U</span> and <span class="math">V</span> contain <span class="math">2p</span> nodes. <span class="math">k</span> and <span class="math">p</span> are fixed integers. Each bold arc (connecting S and T) has unit capacity. Each dotted arc has an infinite capacity. Other arcs (which are solid and not straight) have capacity <span class="math">k</span>.</p>

<p>First, the shortest augmenting path algorithm has to augment flow <span class="math">k<sup>2</sup></span> time along paths (<span class="math">s, S, T, t</span>) which have length equal to 3. The capacities of these paths are unit. After that the residual network will contain reversal arcs (<span class="math">T, S</span>) and the algorithm will chose another <span class="math">k<sup>2</sup></span> augmenting paths (<i>s, u1, u2, T, S, v2, v1, t</i>) of length 7. Then the algorithm will have to choose paths (<i>s, u1, u2, u3, u4, S, T, v4, v3, v2, v1, t</i>) of length 11 and so on...</p>

<p>Now let's calculate the parameters of our network. The number of vertexes is <span class="math">n = 2k + 4p + 2</span>. The number of edges is <span class="math">m = k<sup>2</sup> + 2pk + 2k + 4p</span>. As it easy to see, the number of augmentations is <span class="math">a = k2 (p+1)</span>. </p>

<p>Consider that <span class="math">p = k - 1</span>. In this case <span class="math">n = 6k - 2</span> and <span class="math">a = k<sup>3</sup></span>. So, one can verify that <span class="math">a ~ n<sup>3</sup> / 216</span>. In [<a href="#4">4</a>] Zadeh presents examples of networks that require <span class="math">n<sup>3</sup> / 27</span> and <span class="math">n<sup>3</sup> / 12</span> augmentations, but these examples are dependent on a choice of the shortest path.</p>

<p>We made 5 worst-case tests with 100, 148, 202, 250 and 298 vertexes and compared the running times of the improved version of the algorithm against the unimproved one. As you can see on figure 2, the improved algorithm is much faster. On the network with 298 nodes it works 23 times faster. Practice analysis shows us that, in general, the improved algorithm works n / 14 times faster. </p>

<div align="center"><img src="/i/education/maxFlowRevisited05.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a><br>
Figure 2. X-axis is the number of nodes. Y-axis is working time in milliseconds. <br>Blue colour indicates the shortest augmenting path algorithm and red does it improved version.</div>

<p>However, our comparison in not definitive, because we used only one kind of networks. We just wanted to justify that the <span class="math">O(n<sup>2</sup>m)</span> algorithm works <span class="math">O(n)</span> times faster than the <span class="math">O(nm<sup>2</sup>)</span> on a dense network. A more revealing comparison is waiting for us at the end of the article.</p>

<p><span class="bodySubtitle">Maximum Capacity Path Algorithm, <i>O(n<sup>2</sup>m</i>log<i>nU)</i> / <i>O(m<sup>2</sup></i> log<i>nU</i> log<i>n)</i> / <i>O(m<sup>2</sup></i> log<i>nU</i> log<i>U)</i></span><br />
In 1972 Edmonds and Karp developed another way to find an augmenting path. At each step they tried to increase the flow with the maximum possible amount. Another name of this algorithm is "gradient modification of the Ford-Fulkerson method." Instead of using BFS to identify a shortest path, this modification uses Dijkstra's algorithm to establish a path with the maximal possible capacity. After augmentation, the algorithm finds another such path in the residual network, augments flow along it, and repeats these steps until the flow is maximal.</p>

<div align="center"><img src="/i/education/maxFlowRevisited06.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a></div>

<p>There's no doubt that the algorithm is correct in case of integral capacity. However, there are tests with non-integral arc's capacities on which the algorithm may fail to terminate.</p>

<p>Let's get the algorithm's running time bound by starting with one lemma. To understand the proof one should remember that the value of any flow is less than or equal to the capacity of any cut in a network, or read this proof in [<a href="#1">1</a>], [<a href="#2">2</a>]. Let's denote capacity of a cut <span class="math">(S,T)</span> by <span class="math">c(S,T)</span>.</p>

<p><i><b>Lemma 3.</b> Let F be the maximum flow's value, then G contains augmenting path with capacity not less than F/m.</i></p>

<p><b>Proof.</b> Suppose <span class="math">G</span> contains no such path. Let's construct a set <span class="math">E'={ (i,j) in E: u<sub>ij</sub> &ge; F/m }</span>. Consider network <span class="math">G' = (V, E')</span> which has no path from <span class="math">s</span> to <span class="math">t</span>. Let <span class="math">S</span> be a set of nodes obtainable from <span class="math">s</span> in <span class="math">G</span> and <span class="math">T = V \ S</span>. Evidently, <span class="math">(S, T)</span> is a cut and <span class="math">c(S, T) &ge; F</span>. But cut <span class="math">(S, T)</span> intersects only those edges <span class="math">(i,j)</span> in <span class="math">E</span> which have <span class="math">u<sub>ij</sub> < F/m</span>. So, it is clear that</p>

<p align="center"><span class="math">c(S,T) < (F/m) _ m = F</span>,</p>

<p>and we got a contradiction with the fact that <span class="math">c(S,T) &ge; F</span>.</p>

<p><i><b>Theorem 3.</b> The maximum capacity path algorithm performs O(m log (nU)) augmentations.</i></p>

<p><b>Sketch to proof.</b> Suppose that the algorithm terminates after <span class="math">k</span> augmentations. Let's denote by <span class="math">f<sub>1</sub></span> the capacity of the first found augmentation path, by <span class="math">f<sub>2</sub></span> the capacity of the second one, and so on. <span class="math">f<sub>k</sub></span> will be the capacity of the latter <span class="math">k</span>-th augmenting path. </p>

<p>Consider, <span class="math">F<sub>i</sub> = f<sub>1</sub> + f<sub>2</sub> +...+ f<sub>i</sub></span>. Let <span class="math">F*</span> be the maximum flow's value. Under lemma 3 one can justify that</p>

<p align="center"><span class="math">f<sub>i</sub> &ge; (F*-F<sub>i-1</sub>) / m</span>.</p>

<p>Now we can estimate the difference between the value of the maximal flow and the flow after <span class="math">i</span> consecutive augmentations:</p>

<p align="center"><span class="math">F* - F<sub>i</sub> = F* - F<sub>i-1</sub> - f<sub>i</sub> &le; F* - F<sub>i-1</sub> - (F* - F<sub>i-1</sub>) / m = (1 - 1 / m) (F* - F<sub>i-1</sub>) &le; ... &le; (1 - 1 / m)<sup>i</sup> _ F*</span></p>
 
<p>We have to find such an integer <span class="math">i</span>, which gives <span class="math">(1 - 1 / m)<sup>i</sup> _ F* &lt; 1</span>. One can check that </p>

<p align="center"><span class="math">i </span> log<span class="math"><sub> m / (m+1)</sub> F*  = O(m _ </span>log <span class="math">F*) = O(m _ </span>log<span class="math">(nU))</span></p>

<p>And the latter inequality proves the theorem.</p>

<p>To find a path with the maximal capacity we use Dijkstra's algorithm, which incurs additional expense at every iteration. Since a simple realization of Dijkstras's algorithm [<a href="#2">2</a>] incurs <span class="math">O(n<sup>2</sup>)</span> complexity, the total running time of the maximum capacity path algorithm is <span class="math">O(n<sup>2</sup>m</span>log<span class="math">(nU))</span>. </p>

<p>Using a heap implementation of Dijkstra's algorithm for sparse network [<a href="#7">7</a>] with running time <span class="math">O(m</span>log<span class="math">n)</span>, one can obtain an <span class="math">O(m<sup>2</sup></span> log</span><span class="math">n</span> log<span class="math">(nU))</span> algorithm for finding the maximum flow. It seems to be better that the improved Edmonds-Karp algorithm. However, this estimate is very deceptive.</p>

<p>There is another variant to find the maximum capacity path. One can use binary search to establish such a path. Let's start by finding the maximum capacity path on piece <span class="math">[0,U]</span>. If there is some path with capacity <span class="math">U/2</span>, then we continue finding the path on piece <span class="math">[U/2, U]</span>; otherwise, we try to find the path on <span class="math">[0,U/2-1]</span>. This approach incurs additional <span class="math">O(m</span>log<span class="math">U)</span> expense and gives <span class="math">O(m<sup>2</sup></span>log<span class="math">(nU)</span>log<span class="math">U)</span> time bound to the maximum flow algorithm. However, it works really poorly in practice.</p>

<p><span class="bodySubtitle">Capacity Scaling Algorithm, <i>O(m<sup>2</sup></i>log<i>U</i>)</span><br />
In 1985 Gabow described the so-called "bit-scaling" algorithm. The similar capacity scaling algorithm described in this section is due to Ahuja and Orlin [<a href="#1">1</a>].</p>

<p>Informally, the main idea of the algorithm is to augment the flow along paths with sufficient large capacities, instead of augmenting along maximal capacities. More formally, let's introduce a parameter <i>Delta</i>. First, Delta is quite a large number that, for instance, equals <span class="math">U</span>. The algorithm tries to find an augmenting path with capacity not less that Delta, then augments flow along this path and repeats this procedure while any such Delta-path exists in the residual network. </p>

<p>The algorithm either establishes a maximum flow or reduces Delta by a factor of 2 and continues finding paths and augmenting flow with the new Delta. The phase of the algorithm that augments flow along paths with capacities at least Delta is called <i>Delta-scaling phase</i> or, <i>Delta-phase</i>. Delta is an integral value and, evidently, algorithm performs <span class="math">O(logU)</span> Delta-phases. When Delta is equal to 1 there is no difference between the capacity scaling algorithm and the Edmonds-Karp algorithm, which is why the algorithm works correctly.</p>

<div align="center"><img src="/i/education/maxFlowRevisited07.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a></div>

<p>We can obtain a path with the capacity of at least Delta fairly easily - in <span class="math">O(m)</span> time (by using BFS). At the first phase we can set Delta to equal either <span class="math">U</span> or the largest power of 2 that doesn't exceed U. </p>

<p>The proof of the following lemma is left to the reader.</p>

<p><i><b>Lemma 4.</b> At every Delta-phase the algorithm performs O(m) augmentations in worst case.</i></p>

<p><b>Sketch to proof.</b> Use the induction by Delta to justify that the minimum cut at each Delta-scaling phase less that <span class="math">2m Delta</span>.</p>

<p>Applying lemma 4 yields the following result:</p>

<p><i><b>Theorem 4.</b> Running time of the capacity scaling algorithm is O(m<sup>2</sup>logU).</i></p>

<p>Keep in mind that there is no difference between using breadth-first search and depth-first search when finding an augmenting path. However, in practice, there is a big difference, and we will see it.</p>

<p><span class="bodySubtitle">Improved Capacity Scaling Algorithm, <span class="math">O(nm</span>log<span class="math">U)</span></span><br />

In the previous section we described an <span class="math">O(m<sup>2</sup>logU)</span> algorithm for finding the maximum flow. We are going to improve the running time of this algorithm to <span class="math">O(nm</span>log<span class="math">U)</span> [<a href="#1">1</a>]. </p>

<p>Now let's look at each Delta-phase independently. Recall from the preceding section that a Delta-scaling phase contains <span class="math">O(m)</span> augmentations. Now we use the similar technique at each Delta-phase that we used when describing the improved variant of the shortest augmenting path algorithm. At every phase we have to find the "maximum" flow by using only paths with capacities equal to at least Delta. The complexity analysis of the improved shortest augmenting path algorithm implies that if the algorithm is guaranteed to perform <span class="math">O(m)</span> augmentations, it would run in <span class="math">O(nm)</span> time because the time for augmentations reduces from <span class="math">O(n<sup>2</sup>m)</span> to <span class="math">O(nm)</span> and all other operations, as before, require <span class="math">O(nm)</span> time. These reasoning instantly yield a bound of <span class="math">O(nm</span>log<span class="math">U)</span> on the running time of the improved capacity scaling algorithm. </p>

<p>Unfortunately, this improvement hardly decreases the running time of the algorithm in practice.</p>

<p><span class="bodySubtitle">Practical Analysis and Comparison</span><br />
Now let's have some fun. In this section we compare all described algorithms from practical point of view. With this purpose I have made some test cases with the help of [<a href="#8">8</a>] and divided them into three groups by density. The first group of tests is made of networks with <span class="math">m  &le;  n1.4</span> - some kind of sparse networks. The second one consists of middle density tests with <span class="math">n1.6 &le;  m  &le;  n1.7</span>. And the last group represents some kinds of almost full graphs (including full acyclic networks) with <span class="math">m &ge;  n1.85</span>. </p>

<p>I have simple implementations of all algorithms described before. I realized these algorithms without any kind of tricks and with no preference towards any of them. All implementations use adjacency list for representing a network.</p>

<p>Let's start with the first group of tests. These are 564 sparse networks with number of vertexes limited by 2000 (otherwise, all algorithms work too fast). All working times are given in milliseconds.</p>

<div align="center"><img src="/i/education/maxFlowRevisited08.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a><br><br>
Figure 3. Comparison on sparse networks. 564 test cases. <i>m &le; n1.4</i>.</div>

<p>As you can see, it was a big mistake to try Dijkstra's without heap implementation of the maximum capacity path algorithm on sparse networks (and it's not surprising); however, its heap implementation works rather faster than expected. Both the capacity scaling algorithms (with using DFS and BFS) work in approximately the same time, while the improved implementation is almost 2 times faster. Surprisingly,  the improved shortest path algorithm turned out to be the fastest on sparse networks.</p>

<p>Now let's look at the second group of test cases. It is made of 184 tests with middle density. All networks are limited to 400 nodes.</p>

<div align="center"><img src="/i/education/maxFlowRevisited09.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a><br><br>
Figure 4. Comparison on middle density networks. 184 test cases. <i>n1.6 &le; m &le; n1.7</i>.</div>

<p>On the middle density networks the binary search implementation of the maximum capacity path algorithm leaves much to be desired, but the heap implementation still works faster than the simple (without heap) one. The BFS realization of the capacity scaling algorithm is faster than the DFS one. The improved scaling algorithm and the improved shortest augmenting path algorithm are both very good in this case.</p>

<p>It is very interesting to see how these algorithms run on dense networks. Let's take a look -- the third group is made up of 200 dense networks limited by 400 vertexes.</p>

<div align="center"><img src="/i/education/maxFlowRevisited10.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a><br><br>
Figure 5. Comparison on dense networks. 200 test cases. <i>m &ge; n1.85</i>.</div>

<p>Now we see the difference between the BFS and DFS versions of the capacity scaling algorithm. It is interesting that the improved realization works in approximately the same time as the unimproved one. Unexpectedly, the Dijkstra's with heap implementation of the maximum capacity path algorithm turned out to be faster than one without heap. </p>

<p>Without any doubt, the improved implementation of Edmonds-Karp algorithm wins the game. Second place is taken by the improved scaling capacity algorithm. And the scaling capacity with BFS got bronze. </p>

<p>As to maximum capacity path, it is better to use one variant with heap; on sparse networks it gives very good results. Other algorithms are really only good for theoretical interest. </p>

<p>As you can see, the <span class="math">O(nm</span>log<span class="math">U)</span> algorithm isn't so fast. It is even slower than the <span class="math">O(n<sup>2</sup>m)</span> algorithm. The <span class="math">O(nm<sup>2</sup>)</span> algorithm (it is the most popular) has worse time bounds, but it works much faster than most of the other algorithms with better time bounds. </p>

<p>My recommendation: Always use the scaling capacity path algorithm with BFS, because it is very easy to implement. The improved shortest augmenting path algorithm is rather easy, too, but you need to be very careful to write the program correctly. During the contest it is very easy to miss a bug.</p>

<p>I would like to finish the article with the full implementation of the improved shortest augmenting path algorithm. To maintain a network I use the adjacency matrix with purpose to providing best understanding of the algorithm. It is not the same realization what was used during our practical analysis. With the "help" of the matrix it works a little slower than one that uses adjacency list. However, it works faster on dense networks, and it is up to the reader which data structure is best for them.</p>

<pre class="code">
#include &lt;stdio.h>

#define N 2007  // Number of nodes
#define oo 1000000000 // Infinity

// Nodes, Arcs, the source node and the sink node
int n, m, source, sink;

// Matrixes for maintaining
// Graph and Flow
int G[N][N], F[N][N];

int pi[N];  // predecessor list
int CurrentNode[N]; // Current edge for each node

int queue[N];  // Queue for reverse BFS

int d[N];  // Distance function
int numbs[N];  // numbs[k] is the number of nodes i with d[i]==k

// Reverse breadth-first search
// to establish distance function d
int rev_BFS()  {
  int i, j, head(0), tail(0);

  // Initially, all d[i]=n
  for(i = 1; i &lt;= n; i++)  
    numbs[ d[i] = n ] ++;

  // Start from the sink
  numbs[n]--;
  d[sink] = 0;
  numbs[0]++;	

  queue[ ++tail ] = sink;

  // While queue is not empty
  while( head != tail )  {		
    i = queue[++head];  // Get the next node
		
    // Check all adjacent nodes
    for(j = 1; j &lt;= n; j++)  {			
			
      // If it was reached before or there is no edge
      // then continue
      if(d[j] &lt; n || G[j][i] == 0)  continue;

      // j is reached first time
      // put it into queue
      queue[ ++tail ] = j;

      // Update distance function
      numbs[n]--;
      d[j] = d[i] + 1;
      numbs[d[j]]++;
			
    }
  }

  return 0;
}

// Augmenting the flow using predecessor list pi[]
int Augment()  {
  int i, j, tmp, width(oo);
	
  // Find the capacity of the path
  for(i = sink, j = pi[i]; i != source; i = j, j = pi[j])  {
    tmp = G[j][i];
    if(tmp &lt; width)  width = tmp;
  }
	
  // Augmentation itself
  for(i = sink, j = pi[i]; i != source; i = j, j = pi[j])  {		
    G[j][i] -= width;  F[j][i] += width;
    G[i][j] += width;  F[i][j] -= width;		
  }

  return width;
}

// Relabel and backtrack
int Retreat(int &amp;i)  {
  int tmp;
  int j, mind(n-1);

  // Check all adjacent edges
  // to find nearest
  for(j=1; j &lt;= n; j++)		
    // If there is an arc
    // and j is "nearer"
    if(G[i][j] &gt; 0 &amp;&amp; d[j] &lt; mind)  
      mind = d[j];

  tmp = d[i];  // Save previous distance

  // Relabel procedure itself	
  numbs[d[i]]--;	
  d[i] = 1 + mind;
  numbs[d[i]]++;

  // Backtrack, if possible (i is not a local variable! )
  if( i != source )  i = pi[i];
  
  // If numbs[ tmp ] is zero, algorithm will stop
  return numbs[ tmp ];
}

// Main procedure
int find_max_flow()  {
  int flow(0), i, j;
		
  rev_BFS();  // Establish exact distance function
	
  // For each node current arc is the first arc
  for(i=1; i&lt;=n; i++)  CurrentNode[i] = 1;
	
  // Begin searching from the source
  i = source;

  // The main cycle (while the source is not "far" from the sink)
  for( ; d[source] &lt; n ; )  {

    // Start searching an admissible arc from the current arc
    for(j = CurrentNode[i]; j &lt;= n; j++)
      // If the arc exists in the residual network
      // and if it is an admissible
      if( G[i][j] &gt; 0 && d[i] == d[j] + 1 )
        // Then finish searhing
        break;

    // If the admissible arc is found
    if( j &lt;= n )  {			
      CurrentNode[i] = j;  // Mark the arc as "current"
      pi[j] = i;  //  j is reachable from i			
      i = j;  // Go forward

      // If we found an augmenting path
      if( i == sink )  {
        flow += Augment();  // Augment the flow
        i = source;  // Begin from the source again
      }
    }
    // If no an admissible arc found
    else  {
      CurrentNode[i] = 1;  // Current arc is the first arc again

      // If numbs[ d[i] ] == 0  then the flow is the maximal
      if( Retreat(i) == 0 )
        break;	

    }

  } // End of the main cycle

  // We return flow value
  return flow;
}


// The main function
// Graph is represented in input as triples &lt;from, to, capacity&gt;

// No comments here
int main()  {
  int i, p, q, r;

  scanf("%d %d %d %d", &n, &m, &source, &sink);
  
  for(i = 0; i &lt; m; i++)  {
    scanf("%d %d %d", &p, &q, &r);
    G[p][q] += r;
  }	

  printf("%d", find_max_flow());
	
  return 0;
}
</pre>

<p><span class="bodySubtitle">References</span><br />
[<a name="1">1</a>]&#160;&#160;Ravindra K. Ahuja, Thomas L. Magnanti, and James B. Orlin. <i>Network Flows: Theory, Algorithms, and Applications.</i><br />
[<a name="2">2</a>]&#160;&#160;Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest. <i>Introduction to Algorithms.</i><br />
[<a name="3">3</a>]&#160;&#160;Ford, L. R., and D. R. Fulkerson. <i>Maximal flow through a network.</i><br />
[<a name="4">4</a>]&#160;&#160;Norman Zadeh. <i>Theoretical Efficiency of the Edmonds-Karp Algorithm for Computing Maximal Flows.</i><br />
[<a name="5">5</a>]&#160;&#160;  _efer_. <i>Algorithm Tutorial</i>: <a href="/tc?module=Static&d1=tutorials&d2=maxFlow">MaximumFlow</a>.<br />
[<a name="6">6</a>]&#160;&#160;  gladius. <i>Algorithm Tutorial</i>: <a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs1">Introduction to graphs and their data structures: Section 1</a>.<br />
[<a name="7">7</a>]&#160;&#160;  gladius. <i>Algorithm Tutorial</i>: <a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs3">Introduction to graphs and their data structures: Section 3</a>.<br />
[<a name="8">8</a>]&#160;&#160; <a target="_blank" href="<tc-webtag:linkTracking link='http://elib.zib.de/pub/mp-testdata/generators/index.html' refer='maxFlowRevisited' />">http://elib.zib.de/pub/mp-testdata/generators/index.html</a> -- A number of generators for network flow problems.</p>

            <p>&nbsp; </p>
            <br>
            <br>
        </td>
        <!-- Center Column Ends -->
        <!-- Right Column Begins -->
        <td width="170" id="onRight"><jsp:include page="../public_right.jsp">
            <jsp:param name="level1" value="defaults"/>
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
