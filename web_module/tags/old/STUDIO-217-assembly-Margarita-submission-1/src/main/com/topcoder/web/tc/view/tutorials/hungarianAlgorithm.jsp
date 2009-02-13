<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Algorithm Tutorials</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

<style type="text/css">
.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
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
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="alg_tut"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=alg_index">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <tc-webtag:forumLink forumID="522020" message="Discuss this article" /><br />
    <a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Assignment Problem and Hungarian Algorithm</span>
<br /><br />
<div class="authorPhoto">
    <img src="/i/m/x-ray_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22654859" context="algorithm" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<h3>Introduction</h3>
<p>Are you familiar with the following situation? You open the Div I Medium and don't know how to approach it, while a lot of people in your room submitted it in less than 10 minutes. Then, after the contest, you find out in the editorial that this problem can be simply reduced to a classical one. If yes, then this tutorial will surely be useful for you.</p>


<h3>Problem statement</h3>
<p>In this article we'll deal with one optimization problem, which can be informally defined as:</p>
<p><em>Assume that we have <strong>N</strong> workers and <strong>N</strong> jobs that should be done. For each pair (worker, job) we know salary that should be paid to worker for him to perform the job. Our goal is to complete all jobs minimizing total inputs, while assigning each worker to exactly one job and vice versa.</em></p>
<p>Converting this problem to a formal mathematical definition we can form the following equations:<br />
<img src="/i/education/alg_hungarianAlgorithm/image001.png" alt="" /> - cost matrix, where <strong><em>c<sub>ij</sub></em></strong> - cost of worker <strong><em>i</em></strong> to perform job <strong><em>j</em></strong>.<br />
<img src="/i/education/alg_hungarianAlgorithm/image003.png" alt="" /> - resulting binary matrix, where <strong><em>x<sub>ij</sub></em></strong> = 1 if and only if <strong><em>i<sup>th</sup></em></strong> worker is assigned to <strong><em>j<sup>th</sup></em></strong> job.<br />
<img src="/i/education/alg_hungarianAlgorithm/image005.png" alt="" /> - one worker to one job assignment.<br />
<img src="/i/education/alg_hungarianAlgorithm/image007.png" alt="" /> - one job to one worker assignment.<br />
<img src="/i/education/alg_hungarianAlgorithm/image009.png" alt="" /> - total cost function.</p>
<p>We can also rephrase this problem in terms of graph theory. Let's look at the job and workers as if they were a bipartite graph, where each edge between the <strong><em>i<sup>th</sup></em></strong> worker and <strong><em>j<sup>th</sup></em></strong> job has weight of <strong><em>c<sub>ij</sub></em></strong>. Then our task is to find minimum-weight matching in the graph (the matching will consists of <strong>N</strong> edges, because our bipartite graph is complete).</p>
<p>Small example just to make things clearer:</p>
<p align="center"><img src="/i/education/alg_hungarianAlgorithm/image012.jpg" alt="" /></p>


<h3>General description of the algorithm</h3>
<p>This problem is known as the assignment problem. The assignment problem is a special case of the transportation problem, which in turn is a special case of the <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=minimumCostFlow1">min-cost flow</a> problem, so it can be solved using algorithms that solve the more general cases. Also, our problem is a special case of binary integer linear programming problem (which is NP-hard).  But, due to the specifics of the problem, there are more efficient algorithms to solve it. We'll handle the assignment problem with the Hungarian algorithm (or Kuhn-Munkres algorithm). I'll illustrate two different implementations of this algorithm, both graph theoretic, one easy and fast to implement with <strong>O(n<sup>4</sup>)</strong> complexity, and the other one with <strong>O(n<sup>3</sup>)</strong> complexity, but harder to implement.</p>
<p>There are also implementations of Hungarian algorithm that do not use graph theory. Rather, they just operate with cost matrix, making different transformation of it (see [1] for clear explanation). We'll not touch these approaches, because it's less practical for TopCoder needs.</p>


<h3>O(n<sup>4</sup>) algorithm explanation</h3>
<p>As mentioned above, we are dealing with a bipartite graph. The main idea of the method is the following: consider we've found the perfect matching using only edges of weight 0 (hereinafter called "0-weight edges"). Obviously, these edges will be the solution of the assignment problem. If we can't find perfect matching on the current step, then the Hungarian algorithm changes weights of the available edges in such a way that the new 0-weight edges appear and these changes do not influence the optimal solution.</p>
<p>To clarify, let's look at the step-by-step overview:</p>

<p><strong>Step 0)</strong></p>
<p><strong>A.</strong> For each vertex from left part (workers) find the minimal outgoing edge and subtract its weight from all weights connected with this vertex. This will introduce 0-weight edges (at least one).</p>
<p><strong>B.</strong> Apply the same procedure for the vertices in the right part (jobs).</p>
<p align="center"><img src="/i/education/alg_hungarianAlgorithm/image014.jpg" alt="" /></p>
<p>Actually, this step is not necessary, but it decreases the number of main cycle iterations.</p>

<p><strong>Step 1)</strong></p>
<p><strong>A.</strong> Find the maximum matching using only 0-weight edges (for this purpose you can use max-flow algorithm, augmenting path algorithm, etc.).</p>
<p><strong>B.</strong> If it is perfect, then the problem is solved. Otherwise find the minimum vertex cover <strong><em>V</em></strong> (for the subgraph with 0-weight edges only), the best way to do this is to use <a target="_blank" href="<tc-webtag:linkTracking link='http://en.wikipedia.org/wiki/K%C3%B6nig%27s_theorem_(graph_theory)#proof' refer='hungarianAlgorithm' />">K&ouml;ning's graph theorem</a>.</p>
<p align="center"><img src="/i/education/alg_hungarianAlgorithm/image016.jpg" alt="" /></p>

<p><strong>Step 2)</strong> Let <img src="/i/education/alg_hungarianAlgorithm/image018.gif" alt="" /> and adjust the weights using the following rule:</p>
<p align="center"><img src="/i/education/alg_hungarianAlgorithm/image020.gif" alt="" /><br /><br /><img src="/i/education/alg_hungarianAlgorithm/image022.jpg" alt="" /></p>

<p><strong>Step 3)</strong> Repeat Step 1 until solved.</p>
<p>But there is a nuance here; finding the maximum matching in step 1 on each iteration will cause the algorithm to become <strong>O(n<sup>5</sup>)</strong>. In order to avoid this, on each step we can just modify the matching from the previous step, which only takes <strong>O(n<sup>2</sup>)</strong> operations.</p>
<p>It's easy to see that no more than n2 iterations will occur, because every time at least one edge becomes 0-weight. Therefore, the overall complexity is <strong>O(n<sup>4</sup>)</strong>.</p>


<h3>O(n<sup>3</sup>) algorithm explanation</h3>
<p><em>Warning! In this section we will deal with the maximum-weighted matching problem. It's obviously easy to transform minimum problem to the maximum one, just by setting:<br />
<img src="/i/education/alg_hungarianAlgorithm/image024.gif" alt="" /><br />or<br /><img src="/i/education/alg_hungarianAlgorithm/image026.gif" alt="" /></em>.</p>
<p>Before discussing the algorithm, let's take a look at some of the theoretical ideas. Let's start off by considering we have a complete bipartite graph <strong><em>G=(V,E)</em></strong> where <img src="/i/education/alg_hungarianAlgorithm/image028.gif" alt="" /> and <img src="/i/education/alg_hungarianAlgorithm/image030.gif" alt="" />, <strong><em>w(x,y)</em></strong> - weight of edge <strong><em>(x,y)</em></strong>.</p>
<p><em>Vertex and set neighborhood</em></p>
<p>Let <img src="/i/education/alg_hungarianAlgorithm/image032.gif" alt="" />. Then <img src="/i/education/alg_hungarianAlgorithm/image034.gif" alt="" /> is <strong><em>v</em>'s</strong> neighborhood, or all vertices that share an edge with <strong>v</strong>.</p>
<p>Let <img src="/i/education/alg_hungarianAlgorithm/image036.gif" alt="" />. Then <img src="/i/education/alg_hungarianAlgorithm/image038.gif" alt="" /> is <strong><em>S</em>'s</strong> neighborhood, or all vertices that share an edge with a vertex in <strong>S</strong>.</p>
<p><em>Vertex labeling</em></p>
<p>This is simply a function <img src="/i/education/alg_hungarianAlgorithm/image040.gif" alt="" /> (for each vertex we assign some number called a label). Let's call this labeling feasible if it satisfies the following condition: <img src="/i/education/alg_hungarianAlgorithm/image042.gif" alt="" />. In other words, the sum of the labels of the vertices on both sides of a given edge are greater than or equal to the weight of that edge.</p>
<p><em>Equality subgraph</em></p>
<p>Let <strong><em>G<sub>l</sub>=(V,E<sub>l</sub>)</em></strong> be a spanning subgraph of <strong>G</strong> (in other words, it includes all vertices from <strong>G</strong>). If <strong>G</strong> only those edges <strong>(x,y)</strong> which satisfy the following condition: <img src="/i/education/alg_hungarianAlgorithm/image044.gif" alt="" />, then it is an equality subgraph. In other words, it only includes those edges from the bipartite matching which allow the vertices to be perfectly feasible.</p>
<p>Now we're ready for the theorem which provides the connection between equality subgraphs and maximum-weighted matching:</p>
<p><em>If <strong>M*</strong> is a perfect matching in the equality subgraph <strong>G<sub>l</sub></strong>, then <strong>M*</strong> is a maximum-weighted matching in <strong>G</strong>.</em></p>
<p>The proof is rather straightforward, but if you want you can do it for practice. Let's continue with a few final definitions:</p>
<p><em>Alternating path and alternating tree</em></p>
<p>Consider we have a matching <strong><em>M</em> (<img src="/i/education/alg_hungarianAlgorithm/image046.gif" alt="" />)</strong>.</p>
<p>Vertex <img src="/i/education/alg_hungarianAlgorithm/image032.gif" alt="" /> is called matched if <img src="/i/education/alg_hungarianAlgorithm/image051.gif" alt="" />, otherwise it is called <em>exposed (free, unmatched)</em>.
<p>(In the diagram below, <strong>W<sub>1</sub></strong>, <strong>W<sub>2</sub></strong>, <strong>W<sub>3</sub></strong>, <strong>J<sub>1</sub></strong>, <strong>J<sub>3</sub></strong>, <strong>J<sub>4</sub></strong> are matched, <strong>W<sub>4</sub></strong>, <strong>J<sub>2</sub></strong> are exposed)</p>
<p align="center"><img src="/i/education/alg_hungarianAlgorithm/image048.jpg" alt="" /></p>
<p>Path <strong><em>P</em></strong> is called alternating if its edges alternate between <strong>M</strong> and <strong>E\M</strong>. (For example, (<strong>W<sub>4</sub></strong>, <strong>J<sub>4</sub></strong>, <strong>W<sub>3</sub></strong>, <strong>J<sub>3</sub></strong>, <strong>W<sub>2</sub></strong>, <strong>J<sub>2</sub></strong>) and (<strong>W<sub>4</sub></strong>, <strong>J<sub>1</sub></strong>, <strong>W<sub>1</sub></strong>) are alternating paths)</p>
<p>If the first and last vertices in alternating path are exposed, it is called <em>augmenting</em> (because we can increment the size of the matching by inverting edges along this path, therefore matching unmatched edges and vice versa). ((<strong>W<sub>4</sub></strong>, <strong>J<sub>4</sub></strong>, <strong>W<sub>3</sub></strong>, <strong>J<sub>3</sub></strong>, <strong>W<sub>2</sub></strong>, <strong>J<sub>2</sub></strong>) - augmenting alternating path)</p>
<p>A tree which has a root in some exposed vertex, and a property that every path starting in the root is alternating, is called an <em>alternating tree</em>. (Example on the picture above, with root in <strong>W<sub>4</sub></strong>)</p>
<p>That's all for the theory, now let's look at the algorithm:</p>
<p>First let's have a look on the scheme of the Hungarian algorithm:</p>
<p><strong>Step 0.</strong> Find some initial feasible vertex labeling and some initial matching.</p>
<p><strong>Step 1.</strong> If <strong>M</strong> is perfect, then it's optimal, so problem is solved. Otherwise, some exposed <img src="/i/education/alg_hungarianAlgorithm/image053.gif" alt="" /> exists; set <img src="/i/education/alg_hungarianAlgorithm/image055.gif" alt="" />. (<strong>x</strong> - is a root of the alternating tree we're going to build). Go to step 2.</p>
<p><strong>Step 2.</strong> If <img src="/i/education/alg_hungarianAlgorithm/image057.gif" alt="" /> go to step 3, else <img src="/i/education/alg_hungarianAlgorithm/image059.gif" alt="" />. Find</p>
<table align="center" class="stat" style="width: 450px;" cellpadding="0" cellspacing="0">
    <tr class="light">
        <td><img src="/i/education/alg_hungarianAlgorithm/image061.gif" alt="" /></td>
        <td><strong>(1)</strong></td>
    </tr>
</table>
<p>and replace existing labeling with the next one:</p>
<table align="center" class="stat" style="width: 450px;" cellpadding="0" cellspacing="0">
    <tr class="dark">
        <td><img src="/i/education/alg_hungarianAlgorithm/image063.gif" alt="" /></td>
        <td><strong>(2)</strong></td>
    </tr>
</table>
<p>Now replace <img src="/i/education/alg_hungarianAlgorithm/image065.gif" alt="" /> with <img src="/i/education/alg_hungarianAlgorithm/image067.gif" alt="" /></p>
<p><strong>Step 3.</strong> Find some vertex <img src="/i/education/alg_hungarianAlgorithm/image069.gif" alt="" />. If <strong><em>y</em></strong> is exposed then an alternating path from <strong><em>x</em></strong> (root of the tree) to <strong><em>y</em></strong> exists, augment matching along this path and go to step 1. If <strong><em>y</em></strong> is matched in <strong>M</strong> with some vertex <strong><em>z</em></strong> add <strong><em>(z,y)</em></strong> to the alternating tree and set <img src="/i/education/alg_hungarianAlgorithm/image071.gif" alt="" />, go to step 2.</p>
<p>And now let's illustrate these steps by considering an example and writing some code.</p>
<p>As an example we'll use the previous one, but first let's transform it to the maximum-weighted matching problem, using the second method from the two described above. (See Picture 1)</p>
<p align="center"><img src="/i/education/alg_hungarianAlgorithm/image073.jpg" alt="" /><br />Picture 1</p>
<p>Here are the global variables that will be used in the code:</p>
<pre>
<span style="color:blue">#define N 55</span>             <span style="color:green">//max number of vertices in one part</span>
<span style="color:blue">#define INF 100000000</span>    <span style="color:green">//just infinity</span>

<span style="color:blue">int cost[N][N];</span>          <span style="color:green">//cost matrix</span>
<span style="color:blue">int n, max_match;</span>        <span style="color:green">//n workers and n jobs</span>
<span style="color:blue">int lx[N], ly[N];</span>        <span style="color:green">//labels of X and Y parts</span>
<span style="color:blue">int xy[N];</span>               <span style="color:green">//xy[x] - vertex that is matched with x,</span>
<span style="color:blue">int yx[N];</span>               <span style="color:green">//yx[y] - vertex that is matched with y</span>
<span style="color:blue">bool S[N], T[N];</span>         <span style="color:green">//sets S and T in algorithm</span>
<span style="color:blue">int slack[N];</span>            <span style="color:green">//as in the algorithm description</span>
<span style="color:blue">int slackx[N];</span>           <span style="color:green">//slackx[y] such a vertex, that</span>
                         <span style="color:green">// l(slackx[y]) + l(y) - w(slackx[y],y) = slack[y]</span>
<span style="color:blue">int prev[N];</span>             <span style="color:green">//array for memorizing alternating paths</span>
</pre>
<p><em>Step 0:</em></p>
<p>It's easy to see that next initial labeling will be feasible: </p>
<p align="center"><img src="/i/education/alg_hungarianAlgorithm/image077.gif" alt="" /></p>
<p>And as an initial matching we'll use an empty one. So we'll get equality subgraph as on Picture 2. The code for initializing is quite easy, but I'll paste it for completeness:</p>
<p align="center"><img src="/i/education/alg_hungarianAlgorithm/image075.jpg" alt="" /></p>
<pre>
<span style="color:blue">void</span> init_labels()
{
    memset(lx, 0, <span style="color:blue">sizeof</span>(lx));
    memset(ly, 0, <span style="color:blue">sizeof</span>(ly));
    <span style="color:blue">for</span> (<span style="color:blue">int</span> x = 0; x &lt; n; x++)
        <span style="color:blue">for</span> (<span style="color:blue">int</span> y = 0; y &lt; n; y++)
            lx[x] = max(lx[x], cost[x][y]);
}
</pre>
<p>The next three steps will be implemented in one function, which will correspond to a single iteration of the algorithm. When the algorithm halts, we will have a perfect matching, that's why we'll have n iterations of the algorithm and therefore <strong>(n+1)</strong> calls of the function.</p>
<p><em>Step 1</em></p>
<p>According to this step we need to check whether the matching is already perfect, if the answer is positive we just stop algorithm, otherwise we need to clear <strong><em>S</em></strong>, <strong><em>T</em></strong> and alternating tree and then find some exposed vertex from the <strong><em>X</em></strong> part. Also, in this step we are initializing a <em>slack</em> array, I'll describe it on the next step.</p>
<pre>
<span style="color:blue">void</span> augment()                         <span style="color:green">//main function of the algorithm</span>
{
    <span style="color:blue">if</span> (max_match == n) <span style="color:blue">return;</span>        <span style="color:green">//check wether matching is already perfect</span>
    <span style="color:blue">int</span> x, y, root;                    <span style="color:green">//just counters and root vertex</span>
    <span style="color:blue">int</span> q[N], wr = 0, rd = 0;          <span style="color:green">//q - queue for bfs, wr,rd - write and read</span>
                                       <span style="color:green">//pos in queue</span>
    memset(S, <span style="color:blue">false</span>, <span style="color:blue">sizeof</span>(S));       <span style="color:green">//init set S</span>
    memset(T, <span style="color:blue">false</span>, <span style="color:blue">sizeof</span>(T));       <span style="color:green">//init set T</span>
    memset(prev, -1, <span style="color:blue">sizeof</span>(prev));    <span style="color:green">//init set prev - for the alternating tree</span>
    <span style="color:blue">for</span> (x = 0; x &lt; n; x++)            <span style="color:green">//finding root of the tree</span>
        <span style="color:blue">if</span> (xy[x] == -1)
        {
            q[wr++] = root = x;
            prev[x] = -2;
            S[x] = <span style="color:blue">true</span>;
            <span style="color:blue">break</span>;
        }

    <span style="color:blue">for</span> (y = 0; y &lt; n; y++)            <span style="color:green">//initializing slack array</span>
    {
        slack[y] = lx[root] + ly[y] - cost[root][y];
        slackx[y] = root;
    }
</pre>
<p><em>Step 2</em></p>
<p>On this step, the alternating tree is completely built for the current labeling, but the augmenting path hasn't been found yet, so we need to improve the labeling. It will add new edges to the equality subgraph, giving an opportunity to expand the alternating tree. This is the main idea of the method; <em>we are improving the labeling until we find an augmenting path in the equality graph corresponding to the current labeling</em>. Let's turn back to step 2. There we just change labels using formulas <strong>(1)</strong> and <strong>(2)</strong>, but using them in an obvious manner will cause the algorithm to have <strong>O(n<sup>4</sup>)</strong> time. So, in order to avoid this we use a <em>slack</em> array initialized in <strong>O(n)</strong> time because we only augment the array created in step 1:<br />
<img src="/i/education/alg_hungarianAlgorithm/image079.gif" alt="" /><br />Then we just need O(n) to calculate a delta &#916; (see (1)):<br /><img src="/i/education/alg_hungarianAlgorithm/image081.gif" alt="" /></p>
<p><em>Updating slack:</em><br />
<strong>1)</strong> On <strong>step 3</strong>, when vertex <strong><em>x</em></strong> moves from <strong><em>X\S</em></strong> to <strong><em>S</em></strong>, this takes <strong>O(n)</strong>.<br />
<strong>2)</strong> On <strong>step 2</strong>, when updating labeling, it's also takes <strong>O(n)</strong>, because:<br /><img src="/i/education/alg_hungarianAlgorithm/image081.gif" alt="" /><br />So we get <strong>O(n)</strong> instead of <strong>O(n<sup>2</sup>)</strong> as in the straightforward approach.<br />Here's code for the label updating function:</p>
<pre>
<span style="color:blue">void</span> update_labels()
{
    <span style="color:blue">int</span> x, y, delta = INF;             <span style="color:green">//init delta as infinity</span>
    <span style="color:blue">for</span> (y = 0; y &lt; n; y++)            <span style="color:green">//calculate delta using slack</span>
        <span style="color:blue">if</span> (!T[y])
            delta = min(delta, slack[y]);
    <span style="color:blue">for</span> (x = 0; x &lt; n; x++)            <span style="color:green">//update X labels</span>
        <span style="color:blue">if</span> (S[x]) lx[x] -= delta;
    <span style="color:blue">for</span> (y = 0; y &lt; n; y++)            <span style="color:green">//update Y labels</span>
        <span style="color:blue">if</span> (T[y]) ly[y] += delta;
    <span style="color:blue">for</span> (y = 0; y &lt; n; y++)            <span style="color:green">//update slack array</span>
        <span style="color:blue">if</span> (!T[y])
            slack[y] -= delta;
}
</pre>
<p><em>Step 3</em></p>
<p>In step 3, first we build an alternating tree starting from some exposed vertex, chosen at the beginning of each iteration. We will do this using breadth-first search algorithm. If on some step we meet an exposed vertex from the <strong><em>Y</em></strong> part, then finally we can augment our path, finishing up with a call to the main function of the algorithm. So the code will be the following:</p>
<p><strong>1)</strong> Here's the function that adds new edges to the alternating tree:</p>
<pre>
<span style="color:blue">void</span> add_to_tree(<span style="color:blue">int</span> x, <span style="color:blue">int</span> prevx) 
<span style="color:green">//x - current vertex,prevx - vertex from X before x in the alternating path,
//so we add edges (prevx, xy[x]), (xy[x], x)</span>
{
    S[x] = <span style="color:blue">true</span>;                    <span style="color:green">//add x to S</span>
    prev[x] = prevx;                <span style="color:green">//we need this when augmenting</span>
    <span style="color:blue">for</span> (<span style="color:blue">int</span> y = 0; y &lt; n; y++)    <span style="color:green">//update slacks, because we add new vertex to S</span>
        <span style="color:blue">if</span> (lx[x] + ly[y] - cost[x][y] &lt; slack[y])
        {
            slack[y] = lx[x] + ly[y] - cost[x][y];
            slackx[y] = x;
        }
}
</pre>
<p><strong>3)</strong> And now, the end of the <strong><em>augment()</em></strong> function:</p>
<pre>
<span style="color:green">//second part of augment() function</span>
    <span style="color:blue">while</span> (<span style="color:blue">true</span>)                                                        <span style="color:green">//main cycle</span>
    {
        <span style="color:blue">while</span> (rd &lt; wr)                                                 <span style="color:green">//building tree with bfs cycle</span>
        {
            x = q[rd++];                                                <span style="color:green">//current vertex from X part</span>
            <span style="color:blue">for</span> (y = 0; y &lt; n; y++)                                     <span style="color:green">//iterate through all edges in equality graph</span>
                <span style="color:blue">if</span> (cost[x][y] == lx[x] + ly[y] &amp;&amp;  !T[y])
                {
                    <span style="color:blue">if</span> (yx[y] == -1) <span style="color:blue">break</span>;                             <span style="color:green">//an exposed vertex in Y found, so
                                                                        //augmenting path exists!</span>
                    T[y] = <span style="color:blue">true</span>;                                        <span style="color:green">//else just add y to T,</span>
                    q[wr++] = yx[y];                                    <span style="color:green">//add vertex yx[y], which is matched
                                                                        //with y, to the queue</span>
                    add_to_tree(yx[y], x);                              <span style="color:green">//add edges (x,y) and (y,yx[y]) to the tree</span>
                }
            <span style="color:blue">if</span> (y &lt; n) <span style="color:blue">break</span>;                                           <span style="color:green">//augmenting path found!</span>
        }
        <span style="color:blue">if</span> (y &lt; n) <span style="color:blue">break</span>;                                               <span style="color:green">//augmenting path found!</span>

        update_labels();                                                <span style="color:green">//augmenting path not found, so improve labeling</span>
        wr = rd = 0;                
        <span style="color:blue">for</span> (y = 0; y &lt; n; y++)        
        <span style="color:green">//in this cycle we add edges that were added to the equality graph as a
        //result of improving the labeling, we add edge (slackx[y], y) to the tree if
        //and only if !T[y] &amp;&amp;  slack[y] == 0, also with this edge we add another one
        //(y, yx[y]) or augment the matching, if y was exposed</span>
            <span style="color:blue">if</span> (!T[y] &amp;&amp;  slack[y] == 0)
            {
                <span style="color:blue">if</span> (yx[y] == -1)                                        <span style="color:green">//exposed vertex in Y found - augmenting path exists!</span>
                {
                    x = slackx[y];
                    <span style="color:blue">break</span>;
                }
                <span style="color:blue">else</span>
                {
                    T[y] = <span style="color:blue">true</span>;                                        <span style="color:green">//else just add y to T,</span>
                    <span style="color:blue">if</span> (!S[yx[y]])    
                    {
                        q[wr++] = yx[y];                                <span style="color:green">//add vertex yx[y], which is matched with
                                                                        //y, to the queue</span>
                        add_to_tree(yx[y], slackx[y]);                  <span style="color:green">//and add edges (x,y) and (y,
                                                                        //yx[y]) to the tree</span>
                    }
                }
            }
        <span style="color:blue">if</span> (y &lt; n) <span style="color:blue">break</span>;                                               <span style="color:green">//augmenting path found!</span>
    }

    <span style="color:blue">if</span> (y &lt; n)                                                          <span style="color:green">//we found augmenting path!</span>
    {
        max_match++;                                                    <span style="color:green">//increment matching
        //in this cycle we inverse edges along augmenting path</span>
        <span style="color:blue">for</span> (<span style="color:blue">int</span> cx = x, cy = y, ty; cx != -2; cx = prev[cx], cy = ty)
        {
            ty = xy[cx];
            yx[cy] = cx;
            xy[cx] = cy;
        }
        augment();                                                      <span style="color:green">//recall function, go to step 1 of the algorithm</span>
    }
}<span style="color:green">//end of augment() function</span>
</pre>
<p>The only thing in code that hasn't been explained yet is the procedure that goes after labels are updated. Say we've updated labels and now we need to complete our alternating tree; to do this and to keep algorithm in <strong>O(n<sup>3</sup>)</strong> time (it's only possible if we use each edge no more than one time per iteration) we need to know what edges should be added without iterating through all of them, and the answer for this question is to use BFS to add edges only from those vertices in <strong>Y</strong>, that are not in <strong>T</strong> and for which <strong>slack[y] = 0</strong> (it's easy to prove that in such way we'll add all edges and keep algorithm to be <strong>O(n<sup>3</sup>)</strong>).  See picture below for explanation:</p>
<p align="center"><img src="/i/education/alg_hungarianAlgorithm/image085.jpg" alt="" /></p>
<p>At last, here's the function that implements Hungarian algorithm:</p>
<pre>
<span style="color:blue">int</span> hungarian()
{
    <span style="color:blue">int</span> ret = 0;                      <span style="color:green">//weight of the optimal matching</span>
    max_match = 0;                    <span style="color:green">//number of vertices in current matching</span>
    memset(xy, -1, <span style="color:blue">sizeof</span>(xy));    
    memset(yx, -1, <span style="color:blue">sizeof</span>(yx));
    init_labels();                    <span style="color:green">//step 0</span>
    augment();                        <span style="color:green">//steps 1-3</span>
    <span style="color:blue">for</span> (<span style="color:blue">int</span> x = 0; x &lt; n; x++)       <span style="color:green">//forming answer there</span>
        ret += cost[x][xy[x]];
    <span style="color:blue">return</span> ret;
}
</pre>
<p>To see all this in practice let's complete the example started on step 0.</p>
<table align="center" class="stat" style="width: 100%;" cellpadding="0" cellspacing="0">
    <%-- Row 1 --%>
    <tr class="light">
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image087.jpg" alt="" /></td>
        <td align="center">Build<br />alternating tree</td>
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image089.jpg" alt="" /></td>
        <td align="center">Augmenting<br />path found</td>
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image091.jpg" alt="" /></td>
        <td align="center">Build<br />alternating tree</td>
    </tr>
    <tr class="light">
        <td align="center" style="font-size:20px;">&rarr;</td>
        <td align="center" style="font-size:20px;">&rarr;</td>
        <td align="center" style="font-size:20px;">&rarr;</td>
    </tr>
    <%-- Row 2 --%>
    <tr class="dark">
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image093.jpg" alt="" /></td>
        <td align="center">Update labels<br />(&#916;=1)</td>
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image095.jpg" alt="" /></td>
        <td align="center">Build<br />alternating tree</td>
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image097.jpg" alt="" /></td>
        <td align="center">Update labels<br />(&#916;=1)</td>
    </tr>
    <tr class="dark">
        <td align="center" style="font-size:20px;">&rarr;</td>
        <td align="center" style="font-size:20px;">&rarr;</td>
        <td align="center" style="font-size:20px;">&rarr;</td>
    </tr>
    <%-- Row 3 --%>
    <tr class="light">
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image099.jpg" alt="" /></td>
        <td align="center">Build<br />alternating tree</td>
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image101.jpg" alt="" /></td>
        <td align="center">Augmenting<br />path found</td>
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image103.jpg" alt="" /></td>
        <td align="center">Build<br />alternating tree</td>
    </tr>
    <tr class="light">
        <td align="center" style="font-size:20px;">&rarr;</td>
        <td align="center" style="font-size:20px;">&rarr;</td>
        <td align="center" style="font-size:20px;">&rarr;</td>
    </tr>
    <%-- Row 4 --%>
    <tr class="dark">
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image105.jpg" alt="" /></td>
        <td align="center">Update labels<br />(&#916;=2)</td>
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image107.jpg" alt="" /></td>
        <td align="center">Build<br />alternating tree</td>
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image109.jpg" alt="" /></td>
        <td align="center">Update labels<br />(&#916;=1)</td>
    </tr>
    <tr class="dark">
        <td align="center" style="font-size:20px;">&rarr;</td>
        <td align="center" style="font-size:20px;">&rarr;</td>
        <td align="center" style="font-size:20px;">&rarr;</td>
    </tr>
    <%-- Row 5 --%>
    <tr class="light">
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image111.jpg" alt="" /></td>
        <td align="center">Build<br />alternating tree</td>
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image113.jpg" alt="" /></td>
        <td align="center">Augmenting<br />path found</td>
        <td rowspan="2" align="center"><img src="/i/education/alg_hungarianAlgorithm/image115.jpg" alt="" /></td>
        <td rowspan="2" align="center">Optimal matching found</td>
    </tr>
    <tr class="light">
        <td align="center" style="font-size:20px;">&rarr;</td>
        <td align="center" style="font-size:20px;">&rarr;</td>
    </tr>
</table>
<p>Finally, let's talk about the complexity of this algorithm. On each iteration we increment matching so we have <strong>n</strong> iterations. On each iterations each edge of the graph is used no more than one time when finding augmenting path, so we've got <strong>O(n<sup>2</sup>)</strong> operations. Concerning labeling we update <em>slack</em> array each time when we insert vertex from <strong><em>X</em></strong> into <strong><em>S</em></strong>, so this happens no more than n times per iteration, updating <em>slack</em> takes <strong>O(n)</strong> operations, so again we've got <strong>O(n<sup>2</sup>)</strong>. Updating labels happens no more than n time per iterations (because we add at least one vertex from <strong><em>Y</em></strong> to <strong><em>T</em></strong> per iteration), it takes <strong>O(n)</strong> operations - again <strong>O(n<sup>2</sup>)</strong>. So total complexity of this implementation is <strong>O(n<sup>3</sup>)</strong>.</p>


<h3>Some practice</h3>
<p>For practice let's consider the medium <a href="/stat?c=problem_statement&amp;pm=7726&amp;rd=10787">problem</a> from SRM 371 (div. 1). It's obvious we need to find the maximum-weighted matching in graph, where the <strong><em>X</em></strong> part is our players, the <strong><em>Y</em></strong> part is the opposing club players, and the weight of each edge is:<br />
<img src="/i/education/alg_hungarianAlgorithm/image117.gif" alt="" /></p>
<p>Though this problem has a much simpler solution, this one is obvious and fast coding can bring more points.</p>
<p>Try this <a href="/stat?c=problem_statement&amp;pm=8143&amp;rd=10789">one</a> for more practice. I hope this article has increased the wealth of your knowledge in classical algorithms… Good luck and have fun!</p>


<h3>References</h3>
<ol>
    <li>Mike Dawes "<a target="_blank" href="<tc-webtag:linkTracking link='http://www.math.uwo.ca/~mdawes/courses/344/kuhn-munkres.pdf' refer='hungarianAlgorithm' />">The Optimal Assignment Problem</a>"</li>
    <li>Mordecaj J. Golin "<a target="_blank" href="<tc-webtag:linkTracking link='http://www.cse.ust.hk/~golin/COMP572/Notes/Matching.pdf' refer='hungarianAlgorithm' />">Bipartite Matching and the Hungarian Method</a>"</li>
    <li>Samir Khuller "<a target="_blank" href="<tc-webtag:linkTracking link='https://drum.umd.edu/dspace/bitstream/1903/592/4/CS-TR-3113.pdf' refer='hungarianAlgorithm' />">Design and Analysis of Algorithms: Course Notes</a>"</li>
    <li>Lawler E.L. "<a target="_blank" href="<tc-webtag:linkTracking link='http://books.google.com/books?id=m4MvtFenVjEC&hl=uk' refer='hungarianAlgorithm' />">Combinatorial Optimization: Networks and Matroids</a>"</li>
</ol>





<p>&nbsp;</p>
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
