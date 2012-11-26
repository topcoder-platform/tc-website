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
        <td width="100%" align="left" class="bodyColumn">
            <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="alg_tut"/>
            <jsp:param name="title" value="&#160;"/>
            </jsp:include>
            <div class="linkBox">
                <A href="/tc?module=Static&d1=tutorials&d2=alg_index">Archive</A><br />
                <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
                <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
                <tc-webtag:forumLink forumID="517411" message="Discuss this article" /><br />
                <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
            </div>


<span class="bigTitle">A New Approach to the Maximum Flow Problem </span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/NilayVaish_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21500759" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p><span class="bodySubtitle">Introduction</span><br />
This article presents a new approach for computing maximum flow in a graph. Previous articles had concentrated on finding maximum flow by finding augmenting paths. <strong>Ford-Fulkerson</strong> and <strong>Edmonds-Karp</strong> algorithms belong to that class. The approach presented in this article is called <strong>push-relabel</strong>, which is a separate class of algorithms. We'll look at an algorithm first described by <strong>Andrew V. Goldberg</strong> and <strong>Robert E. Tarjan</strong>, which is not very hard to code and, for dense graphs, is much faster than the augmenting path algorithms. If you haven't yet done so, I'd advise you to review the articles on <a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs1">graph theory</a> and <a href="/tc?module=Static&d1=tutorials&d2=maxFlow">maximum flow</a> using augmenting paths for a better understanding of the basic concepts on the two topics. </p>

<p><span class="bodySubtitle">The Standard Maximum Flow Problem</span><br />
Let <strong>G</strong> = <strong>(V,E)</strong> be a directed graph with vertex set <strong>V</strong> and edge set <strong>E</strong>. Size of set <strong>V</strong> is <strong>n</strong> and size of set <strong>E</strong> is <strong>m</strong>. <strong>G</strong> has two distinguished vertices, a source <strong>s</strong> and a sink <strong>t</strong>. Each edge <strong>(u,v)</strong><strong> &epsilon; </strong><strong>E</strong> has a capacity <strong>c(u,v)</strong>. For all edges <strong>(u,v)</strong><strong> &notin;</strong><strong>E</strong>, we define <strong>c(u,v) = 0</strong>. A flow f on <strong>G</strong> is a real valued function satisfying the following constraints: </p>

<ol>
  <li><strong> Capacity</strong><strong>:</strong><strong> f(v,w) </strong><strong> &le;</strong><strong> c(v,w) </strong><strong> &or;</strong><strong></strong><strong> (v,w) </strong><strong> &#8714;</strong><strong> V &times; V </strong></li>
  <li><strong> Anti-symmetry</strong><strong>:</strong><strong> f(v,w) = </strong> &ndash; <strong>f(w,v) </strong><strong> &or;</strong><strong> (v,w) </strong><strong> &#8714;</strong><strong> V &times; V </strong></li>
  <li><strong> Flow Conservation</strong><strong>: </strong><strong> &sum;</strong><strong></strong><strong> u </strong><strong> &#8714; </strong><strong> V</strong><strong></strong><strong> f(u,v) = 0 </strong><strong> &or;</strong><strong></strong><strong> v </strong><strong> &#8714;</strong><strong> V - {s,t} </strong></li>
</ol>

<p>The value of a flow f is the net flow into the sink i.e. <strong> | f | = </strong><strong> &sum;</strong><strong></strong><strong> u </strong><strong> &#8714; </strong><strong> V</strong><strong></strong><strong> f(u,t)</strong> . <strong>Figure 1</strong> below shows a flow network with the edges marked with their capacities. Using this network we will illustrate the steps in the algorithm. </p>

<p align="center"><img src="/i/education/maxflow_push/maxflow_push1.gif" /></p>

<p align="center"> Figure 1 : Flow Network with Capacities </p>

<p><span class="bodySubtitle">Intuitive Approach Towards the Algorithm</span><br />
Assume that we have a network of water tanks connected with pipes in which we want to find the maximum flow of water from the source tank to the sink tank. Each of these water tanks are arbitrarily large and will be used for accumulating water. A tank is said to be overflowing if it has water in it. Tanks are at a height from the ground level. The edges can be assumed to be pipes connecting these water tanks. The natural action of water is to flow from a higher level to a lower level. The same holds for this algorithm. The height of the water tank determines the direction in which water will flow. We can push <strong>new flow</strong> from a tank to another tank that is downhill from the first tank, i.e. to tanks that are at a lesser height than the first tank. We need to note one thing here, however:<strong>The flow from a lower tank to a higher tank might be positive.</strong> Present height of a tank only determines the direction of new flow. </p>
<p> We fix the initial height of the source <strong>s</strong> at <strong>n</strong> and that of sink <strong>t</strong> at <strong>0</strong>. All other tanks have initial height <strong>0</strong>, which increases with time. Now send as much as possible flow from the source toward the sink. Each outgoing pipe from the source s is filled to capacity. We will now examine the tanks other than <strong>s</strong> and <strong>t</strong>. The flow from overflowing tanks is pushed downhill. If an overflowing tank is at the same level or below the tanks to which it can push flow, then this tank is raised just enough so that it can push more flow. If the sink t is not reachable from an overflowing tank, we then send this excess water back to the source. This is done by raising the overflowing tank the fixed height <strong>n</strong> of the source. Eventually all the tanks except the source <strong>s</strong> and the sink <strong>t</strong> stop overflowing. At this point the flow from the source to the sink is actually the max-flow. </p>

<p><span class="bodySubtitle">Mathematical Functions</span><br />
In this section we'll examine the mathematical notations required for better understanding of the algorithm. </p>
<ol>
  <li><strong> Preflow</strong> - Intuitively preflow function gives the amount of water flowing through a pipe. It is similar to the flow function. Like flow, it is a function <strong>f: V &times; V &rarr; R</strong>. It also follows the capacity and anti-symmetry constraints. But for the preflow function, the conservation constraint is weakened. 
<p align="center"><strong> &sum;</strong><strong></strong><strong> u </strong><strong> &#8714; </strong><strong> V</strong><strong></strong><strong> f(u,v) </strong><strong> &ge;</strong><strong> 0 </strong><strong> &or;</strong><strong> v </strong><strong> &#8714;</strong><strong> V - {s,t} </strong></p>
That is the total net flow at a vertex other than the source that is non-negative. During the course of the algorithm, we will manipulate this function to achieve the maximum flow. <br />
  </li>

  <li><strong> Excess Flow</strong> - We define the excess flow <strong>e</strong> as <strong>e(u) = f(V,u)</strong>, the net flow into <strong>u</strong>. A vertex <strong>u </strong><strong> &#8714;</strong><strong> V-{s,t}</strong> is overflowing / active if <strong>e(u) &gt; 0</strong>. <br /></li>

  <li><strong> Residual Capacity</strong> - We define residual capacity as function <strong>cf: V &times; V </strong><strong> &rarr;</strong><strong> R</strong> where </li>
<p align="center"><strong> cf(u,v) = c(u,v) &ndash; f(u,v) </strong></p>
If <strong>cf(u,v) &gt; 0</strong>, then <strong>(u,v)</strong> is called a <strong>residual edge</strong>. Readers would have come across this concept in augmenting path algorithms as well.<br /></li>

  <li><strong> Height</strong> - This function is defined as <strong>h: V </strong><strong> &rarr;</strong><strong> N</strong>. It denotes the height of a water tank. It has the following properties - 
  <ul>
    <li><strong> h(s) = n </strong></li>
    <li><strong> h(t) = 0 </strong></li>
    <li><strong> h(u) &le; h(v) + 1 for every residual edge (u,v). </strong></li>
  </ul>
We will prove the last property while discussing the correctness of the algorithm.<br /></li></ol>

<p><span class="bodySubtitle">Basic Operations</span><br />
Following are the three basic functions that constitute the algorithm: </p>

<ol>
  <li><strong> Initialization</strong> &ndash; This is carried out once during the beginning of the algorithm. The height for all the vertices is set to zero except the source for which the height is kept at <strong>n</strong>. The preflow and the excess flow functions for all vertices are set to zero. Then all the edges coming out the source are filled to capacity. <strong>Figure 2</strong> shows the network after initialization. </li>

<p align="center"><img width="362" height="195" src="/i/education/maxflow_push/maxflow_push2.gif" /><br>
  Figure 2 : Network after Initialization </p>
<p>&nbsp; </p>
<p align="center"><img src="/i/education/maxflow_push/maxflow_push3.gif" /></p>

<p align="center"> Figure 3 : Code for Initialization </p>
<p>&nbsp; </p>

  <li><strong> push(u,v)</strong> - This operation pushes flow from an overflowing tank to a tank to which it has a pipe that can take in more flow and the second tank is at a lower height than the first one. In other words, if vertex <strong>u</strong> has a positive excess flow, <strong>cf(u,v) &gt; 0</strong> and <strong>h(u) &gt; h(v)</strong>, then flow can be pushed onto the residual edge <strong>(u,v)</strong>. The amount of the flow pushed is given by <strong>min(e(u),cf(u,v))</strong>.<br /><br />
<strong> Figure 4</strong> shows a vertex <strong>B</strong> that has an excess flow of <strong>10</strong>. It makes two pushes. In the first push, <strong>7</strong> units of flow are pushed to <strong>C</strong>. In the second push, <strong>3</strong> units of flow are pushed to <strong> E. Figure 5 </strong> illustrates the final result. </p>
<p align="center"><img width="403" height="216" src="/i/education/maxflow_push/maxflow_push4.gif" /></p>
<p align="center"> Figure 4 : Network before pushing flow from B </p>
<p>&nbsp; </p>
<p align="center"><img src="/i/education/maxflow_push/maxflow_push5.gif" /></p>
<p align="center"> Figure 5 : Network pushing flow from B </p>
<p>&nbsp; </p>
<p align="center"><img src="/i/education/maxflow_push/maxflow_push6.gif" /></p>
<p align="center"> Figure 6 : Code for Push sub-routine </p></li>
  <li><strong> relabel(u)</strong> - This operation raises the height of an overflowing tank that has no other tanks downhill from it. It applies if <strong>u</strong> is overflowing and <strong>h(u) &le; h(v)</strong> &or; residual edges <strong>(u,v)</strong> i.e. on all the residual edges from <strong>u</strong>, flow cannot be pushed. The height of the vertex <strong>u</strong> is increased by <strong>1</strong> more than the minimum height of its neighbor to which <strong>u</strong> has a residual edge.

    <p align="center"><strong><img src="/i/education/maxflow_push/maxflow_push7.gif" /></strong></p>
<p align="center"> Figure 7 : Network after relabeling D </p>
<p>In <strong>Figure 4</strong>, pick up vertex <strong>D</strong> for applying the push operation. We find that it has no vertex that is downhill to it and the edge from <strong>D</strong> to that vertex has excess capacity. So we relabel <strong>D</strong> as shown in <strong>Figure 5.</strong></p>
<p align="center"><img src="/i/education/maxflow_push/maxflow_push8.gif" /></p>
<p align="center">Figure 8 : Code for Relabel sub-routine</p>
</li></ol>

<p><span class="bodySubtitle">Generic Algorithm</span><br />
The generic algorithm is as follows:<br />
<p align="center"><img src="/i/education/maxflow_push/image096.gif" /></p>

<p>The value <strong>e(t)</strong> will represent the maximum flow. We now try to see why this algorithm would work. This would need two observations that hold at all times during and after the execution of the algorithm.</p>
<ol>
  <li><strong> A residual edge from u to v implies h(u) &le; h(v) + 1</strong> -We had earlier introduced this as a property of the height function. Now we make use of induction for proving this property. </li>

    <ul>
  <li> Initially residual edges are from vertices of height 0 to the source that is at height <strong>n</strong>. </li>
  <li> Consider a vertex <strong>u</strong> getting relabeled and <strong>v</strong> is the vertex of minimum height to which <strong>u</strong> has a residual edge. After relabeling, the property holds for the residual edge <strong>(u,v)</strong>. For any other residual edge <strong>(u,w)</strong>, <strong>h(v)</strong><strong> &le;</strong><strong>h(w)</strong>. So after relabeling the property will hold for residual edge <strong>(u,w)</strong>. For a residual edge, <strong>(w,u)</strong>, since <strong>u</strong>&rsquo;s height only goes up, therefore the property will continue to hold trivially. </li>
  <li> Consider a push operation from <strong>u</strong> to <strong>v</strong>. After the operation, edge (v,u) will be present in the residual graph. Now <strong>h(u) &gt; h(v)</strong> &and; <strong>h(u) &le; h(v) + 1</strong></li>
    </ul>
<blockquote>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> &rarr;</strong><strong> h(u) = h(v) + 1 </strong><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> &rarr;</strong><strong> h(v) = h(u) &minus; 1 </strong><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> &rarr;</strong><strong> h(v) _ h(u) + 1 </strong></blockquote>
</li>
  <li><strong> There is no path for source to sink in the residual graph</strong> - Let there be a simple path <strong>{v<sub>0</sub> , v<sub>1</sub> , . . . , v<sub>k&minus;1</sub>, v<sub>k</sub> }</strong> from <strong>v<sub>0</sub> = s</strong> to <strong>v<sub>k</sub> = t</strong>. Then, as per the above observation, 
    <blockquote>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> h(v</strong><strong> i</strong><strong> ) &le; h(v</strong><strong> i+1</strong><strong> ) + 1 </strong><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> &rarr;</strong><strong> h(s) &le; h(t) + k </strong><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> &rarr;</strong><strong> n &le; k </strong><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> &rarr;</strong><strong> n &lt; k + 1 </strong></blockquote>

<p> This violates the simple path condition as the path has <strong>k+1</strong> vertices. Hence there is no path from source to sink. </p>
</li></ol>

<p> When the algorithm ends, no vertex is overflowing except the source and the sink. There is also no path from source to sink. This is the same situation in which an augmenting path algorithm ends. Hence, we have maximum flow at the end of the algorithm. </p>

<p><span class="bodySubtitle">Analysis </span><br />
The analysis requires proving certain properties relating to the algorithm. </p>
<p align="center"><img width="347" height="168" src="/i/education/maxflow_push/maxflow_push8a.gif" /></p>
<ol>
  <li><strong> s is reachable from all the overflowing vertices in the residual graph</strong> - Consider <strong>u</strong> as an overflowing and <strong>S</strong> as the set of all the vertices that are reachable from <strong>u</strong> in the residual graph. Suppose <strong>s </strong><strong> &notin;</strong><strong> 2S</strong> . Then for every vertex pair <strong>(v,w)</strong> such that <strong>v </strong><strong> &#8714;</strong><strong> S</strong> and <strong>w </strong><strong> &#8714;</strong><strong> V-S</strong> , <strong>f(w,v) &le; 0</strong>. Because if <strong>f(w,v) &gt; 0</strong>, then <strong>cf(v,w) &gt; 0</strong> which implies <strong>w</strong> is reachable from <strong>u</strong>. Thus, since <strong>e(v) &le; 0</strong>, for all <strong>v</strong><strong> &#8714;</strong><strong> S, e(v) = 0</strong>. In particular, <strong>e(u) = 0</strong>, which is a contradiction. <br>
  </li>
  <li><strong> The height of a vertex never decreases</strong> - The height of a vertex changes only during the <strong>relabeling</strong> operation. Suppose we relabel vertex <strong>u</strong>. Then for all vertices <strong>v</strong> such that <strong>(u,v)</strong> is a residual edge, we have <strong>h(v) &le; h(u)</strong>, which clearly means <strong>h(v)+1&gt;h(u)</strong>. So the height of a vertex never decreases. <br>
  </li>
  <li><strong> The height of a vertex can be at maximum 2n-1</strong> - This holds for <strong>s</strong> and <strong>t</strong> since their heights never change. Consider a vertex <strong>u</strong> such that <strong>e(u) &gt; 0</strong>. Then there exists a simple path from <strong>u</strong> to <strong>s</strong> in the residual graph. Let this path be <strong>u = v<sub>0,</sub> v<sub>1</sub> , . . . , v<sub>k&minus;1</sub>, v<sub>k</sub> = s</strong>. Then <strong>k</strong> can be at most <strong>n-1</strong>. Now, as per the definition of <strong>h</strong>, <strong>h(v<sub>i</sub>) &le; h(v<sub>i+1</sub>) + 1</strong>. This would yield <strong>h(u) &le; h(s) + n &ndash; 1 = 2n &ndash; 1</strong>. </li>
</ol>
<p> Now we are in a position to count the number of operations that are carried out during the execution of the code.</p
>
<ul>
  <li><strong> Relabeling operations</strong> - The height for each vertex other than <strong>s</strong> and <strong>t</strong> can change from <strong>0</strong> to <strong>2n-1</strong>. It can only increase, so there can be utmost <strong>2n-1</strong> relabelings for each vertex. In total there can be a maximum of <strong>(2n-1)(n-2)</strong> relabelings. Each relabeling requires at most <strong>degree(vertex)</strong> operations. Summing this up over all the vertices and over all the relabelings, the total time spent in relabeling operations is <strong>O(nm)</strong>. <br>
  </li>
  <li><strong> Saturated Pushes</strong> - A saturating push from <strong>u</strong> to <strong>v</strong>, results in <strong>f(u,v) = c(u,v)</strong>. In order to push flow from <strong>u</strong> to <strong>v</strong> again, flow must be pushed from <strong>v</strong> to <strong>u</strong> first. Since <strong>h(u) = h(v) + 1</strong>, so <strong>v</strong>&rsquo;s height must increase by at least <strong>2</strong>. Similarly <strong>h(u)</strong> should increase by at least<strong> 2</strong> for the next push. Combining this with the earlier result on the maximum height of a<strong></strong>vertex, the total number of saturating pushes is at most <strong>2n-1</strong> per edge. So that total over<strong></strong>all the edges is at most <strong>(2n-1)m &lt; 2nm</strong>.<strong><br>
  </strong></li>
  <li><strong> Non-saturated Pushes</strong> - Let <strong>&phi;</strong> = <strong> &sum; </strong><strong> u </strong><strong> &#8714;</strong><strong> V, u is active</strong><strong></strong><strong> h(u)</strong>. Each non-saturating push from a vertex <strong>u</strong> to any other vertex <strong>v</strong> causes <strong>&phi;</strong> to decrease by at least <strong>1</strong> since <strong>h(u) &gt; h(v)</strong>. Each saturating push can increase <strong>&phi;</strong> by at most <strong>2n-1</strong> since it could be that <strong>v</strong> was not active before. The total increase in <strong>&phi;</strong> due to saturating pushes is at most <strong>(2n-1)(2nm)</strong>. The total increase in <strong>&phi;</strong> due to relabeling operation is at most <strong>(2n-1)(n-2)</strong>. Therefore, the total number of non-saturating pushes is at most <strong>(2n-1)(2nm) + (2n-1)(n-2)</strong><strong>&le; 4n</strong><strong><sup>2</sup>m</strong>. </li>
</ul>

<p> Thus the generic algorithm takes <strong>O(n</strong><strong><sup>2</sup></strong><strong>m)</strong> operations in total. Since each push operation requires <strong>O(1)</strong> time, hence the running time of the algorithm will also be <strong>O(n</strong><strong><sup>2</sup>m) </strong> if the condition given in the while loop can be tested in <strong>O(1)</strong> time. The next section provides an implementation for doing the same. In fact, by ordering the operations in a particular manner, a more rigorous analysis proves that a better time bound can be achieved. </p>

<p><span class="bodySubtitle">First-in First-out Algorithm </span><br />
We will make use of a first-in, first-out strategy for selecting vertices on which push/relabel operation will be performed. This is done by creating a queue of vertices that are overflowing. Initially all the overflowing vertices are put into the queue in any order. We will run the algorithm till the queue becomes empty. </p>

<p> In every iteration the vertex at the front of the queue is chosen for carrying out the operations. Let this vertex be <strong>u</strong>. Consider all the edges of <strong>u</strong>, both those that are incident on <strong>u</strong> and those that are incident on other vertices from <strong>u</strong>. These are edges along which <strong>u</strong> can potentially push more flow. Go through these edges one by one, pushing flow along edges that have excess capacity. This is done until either <strong>u</strong> becomes inactive or all the edges have been explored. If during the iteration any new vertex starts to overflow, then add that vertex to the end of the queue. If at the end of the iteration <strong>u</strong> is still overflowing, then it means <strong>u</strong> needs a relabeling. Relabel <strong>u</strong> and start the next iteration with <strong>u</strong> at the front of the queue. If any time during the process or at end of it <strong>u</strong> becomes inactive, remove <strong>u</strong> from the queue. This process of pushing excess flow from a vertex until it becomes inactive is called <strong>discharging a vertex</strong>. </p>
<p align="center"><img src="/i/education/maxflow_push/maxflow_push9.jpg" /></p>
<p align="center"> Figure 9 : Code for First-In First-Out Algorithm </p>

<p><span class="bodySubtitle">Analysis of First-In First-Out Algorithm </span><br />
To analyze the strategy presented above, the concept of a <strong>pass over a queue</strong> needs to be defined. <strong>Pass 1</strong> consists of discharging the vertices added to the queue during initialization. <strong>Pass i + 1</strong> consists of discharging vertices added during the <strong>Pass i</strong>. </p>

<ul>
  <li><strong> The number of passes over the queue is at most 4n<sup>2</sup></strong> - Let <strong>&phi; </strong>= <strong>max {h(u) </strong>|<strong>u is active|}</strong>. If no heights changes during a given pass, each vertex has its excess moved to vertices that are lower in height. Hence <strong>&phi;</strong> decreases during the pass. If <strong>&phi; </strong>does not change, then there is at least one vertex whose height increases by at least 1. If <strong>&phi;</strong> increases during a pass, then some vertex&rsquo;s height must have increased by as much as the increase <strong>&phi;</strong>. Using the proof about the maximum height of the vertex, the maximum number of passes in which <strong>&phi;</strong> increases or remains same is <strong>2n</strong><strong><sup>2</sup></strong>. The total number of passes in which <strong>&phi;</strong> decreases is also utmost <strong>2n</strong><strong><sup>2</sup></strong>.Thus the total number of passes is utmost <strong>4n</strong><strong><sup>2</sup></strong>. </li>
  <li><strong> The number of non-saturating pushes is at most 4n</strong><strong><sup>3</sup></strong> - There can be only one non-saturating push per vertex in a single pass. So the total number of non-saturating pushes is at most <strong>4n</strong><strong><sup>3</sup></strong>. </li>
</ul>
<p> On combining all the assertions, the total time required for running the first-in first-out algorithm is <strong>O(nm + n</strong><strong><sup>3</sup></strong><strong>)</strong> which is <strong>O(n<sup>3</sup>)</strong>. </p>

<p><span class="bodySubtitle">Related Problems </span><br />
In general any problem that has a solution using max-flow can be solved using <strong>&ldquo;push-relabel&rdquo;</strong> approach. <a href="http://www.spoj.pl/problems/TAXI">Taxi</a> and <a href="http://www.spoj.pl/problems/QUEST4">Quest4</a> are good problems for practice. More problems can be found in the article on max flow using augmenting paths. In problems where the time limits are very strict, push-relabel is more likely to succeed as compared to augmenting path approach. Moreover, the code size is not very significant. The code provided is of <strong>61 lines</strong> (16 + 36 + 9), and I believe it can be shortened. </p>

<p>In places where only the maximum flow value is required and the actual flow need not be reported, the algorithm can be changed slightly to work faster. The vertices that have heights <strong>&ge;</strong><strong>n</strong> may not be added to the queue. This is because these vertices can never push more flow towards the sink. This may improve the running time by a factor of 2. Note that this will not change the asymptotic order of the algorithm. This change can also be applied in places where the min-cut is required. Let <strong>(S,T)</strong> be the min-cut. Then, <strong>T</strong> contains the vertices that reachable from <strong>t</strong> in the residual graph. </p>

<p><span class="bodySubtitle">References</span></p>
<ol>
  <li> Andrew V. Goldberg and Robert E. Tarjan, A new approach to the maximum-flow problem. </li>
  <li> Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest. Introduction to Algorithms. </li>
  <li><tc-webtag:handle coderId="8593420" context="algorithm"/>. <a href="/tc?module=Static&d1=tutorials&d2=maxFlow">Algorithm Tutorial: MaximumFlow</a></li>
  <li><tc-webtag:handle coderId="268851" context="algorithm"/>. <a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs1">Algorithm Tutorial: Introduction to graphs and their data structures</a></li>
</ol>
<br />
<p><em>The author would like to acknowledge the assistance of <tc-webtag:handle coderId="20814283" context="algorithm"/>, who helped review and improve this article prior to publication.</em></p>
<br /><br />

        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
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