<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="summary"/>
        <jsp:param name="tabLev3" value="room3"/>
        </jsp:include>
        
        <div id="pageBody">
            <h1><span>Vitaliy wins Room 3!</span></h1>
            <p><img src="/i/m/Olexiy_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
            <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518016">Discuss this match</A><br />Thursday, November 1, 2007<br />Introduction by <tc-webtag:handle coderId="303644" context="algorithm"/></p>
            <p style="float:right; width:200px; 350px; margin-left:10px;"><img src="/i/tournament/tccc07/shotR3.jpg"></p>
            <br /><br />
            
            <p><strong>One of our two bloggers, <tc-webtag:handle coderId="2057853" context="algorithm"/>, has provided an excellent <a target="_blank" href="http://www.topcoder.com/wiki/display/tccc07/2007/11/01/Algorithm+SemiFinal+Room+3">synopsis</a> of Room 3.  Be sure to check out the action.</strong></p>


            
<br /><br />
<p>by <tc-webtag:handle coderId="303644" context="algorithm"/></p>

<h2>Police</h2>

<p>
Since police patrol will want to travel between junction, it will be useful for us to know for each junction A which junctions
are reachable from A and which are not. To get that data, compute the transitive closure of a connections graph using Floyd-Warshall algorithm.
</p>
<p>
Now we can start our main task. For each junction A we must either place a station at that junction or place
it at some junction B such that A is reachable from B and B is reachable from A. If there is a junction C which is reachable from 
junction A and A is reachable from C, then B is reachable from C and C is reachable from B as well.
In this case, we can place a station at one of these 3 junctions and it will cover the other 2. 
In general, we can split the whole set of junctions into <a href="http://en.wikipedia.org/wiki/Equivalence_class">equivalence classes</a>,
putting junctions i and j into one class if and only if junction i is reachable from j and j is reachable from i.
Now it can be easily proved that
<ul>
<li>Each class must contain at least 1 junction with a police station. </li>
<li>There is no need to create more than 1 police station in junctions of a class.</li>
</ul>
which means we must create exactly one station per equivalence class. Obviously, we will choose the station with the cheapest cost.
</p>
<p>
The solution becomes really short now: 
<ol>
<li>Create an array of booleans with the i-th element of the 
array being true if the i-th junction is already covered by a station (initially all elements are set to false). </li>
<li>Find the first non-covered junction A. If all vertices are covered - exit the algo.</li>
<li>Find all junctions which are in the same equivalence class with A. Among those find the junctions with the minimal cost,
add that cost to the answer and mark ALL junctions in the class (including vertex A) as used.</li>
<li>Return to point 1.</li>
</ol>
</p>

<br /><br />
<p>by <tc-webtag:handle coderId="303644" context="algorithm"/></p>

<h2>OddGraph</h2>

<p>
Since we have a tree with one very special node (server), 
it is natural to set it as the root of the tree. 
We will say that a node A is a child of node B (respectively, vertex B is the parent of vertex A) if nodes A and B are connected 
by an edge and node A is located further from the root than node B.
"Remove a node from a tree" will mean that we delete the node from the tree,
delete all edges it is incident to and also delete all nodes which become 
disconnected from the root after these operations. In fact, that will mean removing 
the whole branch starting at that node.
Also, the order of a node is the number of other nodes it is directly connected to.
</p>
<p>
Now lets look at some odd graph. 
Its root has several children (worker nodes), with each of them possibly having 
more children. One can notice that after removing any child of the root from the tree
the graph will remain odd. Really, we do not care about the order of the root,
and orders of all remaining worker nodes are unchanged. 
If we'll look at the branch we've removed, the order of all its nodes is also odd (with the
exception to the root).
This means an odd graph can be built recursively from a smaller odd-graph and a 
branch with similar property, 
and now we'll try to find a relationship between graphs of different sizes.
</p>
<p>
Lets call the number of odd graphs with K vertices G(K) and the number of branches of K vertices B(K).
and see an odd graph with N nodes can be built from smaller graphs. 
If N == 1, there is clearly only one way to build such graph. 
If N > 1, there are several options. Either the graph cotnains just one branch with 
(N - 1) nodes, or there are several branches.
In the first case, the number of ways is just B(N - 1).  
In the second case, we can build our graph by adding one of the branches to a smaller odd graph. The number of 
ways to do so is equal to (sum over all branches) B(i) * G(N - i), where i is the number of 
nodes in the chosen branch. 
Of course, this method will count some graphs more than once because we can get the same graph by adding the branches in different orders.
To avoid this problem we must fix the order of removing the branchesand the most natural solution is to order 
branches by the number of nodes they contain (we will remove the smallest branch first, but other ways are possible as well :).
</p>
<p>
You can easily notice that B(N) and G(N) has some common properties, with only a couple of 
exceptions. When computing B(N) we must make sure that the top vertex will have an odd 
number of children, while for G(N) case this is not important.
Therefore we can have method G() as a partial case of method B(), but with an extra parameter. 

This parameter will mark whether we care about the number of extra children we need to add 
to the root of the tree (there will be three possible values - we need either an even number of children, or odd, or any number will go).
</p>
<p>
Now the algorithm seems to be ready, with the exception to the last (but not 
the least detail). 
Some odd graphs have several branches of the same size, so the problem of double-counting graph is not yet eliminated.
We are going to solve it in the following way. 
If we want to construct a graph with N nodes using branches of size m, we 
will try all i such that (m * i) <= N. For each i, the answer is B(N - m * i with all branches having at least (i + 1) node) * K(m, i), 
where K(m, i) is the total number of ways we can construct i branches of size m
(for example, if there are 2 ways of constructing a branch of size 3 and we want to construct 2 such branches, 
K(3, 2) will be equal to 3 - we can construct either 2 branches of type A, or 2 branches of type B, or two branches of different types).
Since every branch of m nodes can be constructed in B(m) different ways,
the value of K(m, i) is equal to <a href="http://en.wikipedia.org/wiki/Binomial_coefficient">C<sup>i</sup><sub>B(m)</sub></a>.
</p>
<p>
Finally, we can write the pseudo-code for this method:
<pre>
int B(int nodes, int branchSize, int needMoreNodes) { 
// needMoreNodes equal to 0 means the root already has even number of connections, while
// 1 stands for an odd number and 2 means the root is server node
    if (nodes == 0)
// we already built the tree, so we need to check whether the root has a proper number of connections
        return (needMoreNodes == 0) ? 0 : 1; 
        int ans = 0; // (To make your program run fast enough don't forget to <a href="/tc?module=Static&d1=tutorials&d2=dynProg">memoize</a> the results).
        for (int i = 0; i * branchSize <= vertices; i++) {
        int needMore = (needMoreNodes == 2) ? 2 : (needMoreNodes + i) % 2;
        ans += CNK(B(branchSize, 1, 1), i) * // Hope you know how to compute this
             B(nodes - i * branchSize, branchSize + 1, needMore);
    }
    return ans;
}
</pre>
</p>
<p>You may want to check <a href="http://en.wikipedia.org/wiki/Memoization">this link</a> to read more about memoization.</p>

<br /><br />
<p>by <tc-webtag:handle coderId="10481120" context="algorithm"/></p>

<h2>BinaryPowerBishop</h2>

<p>
In order to solve this problem, let's write a recursive function, which takes three parameters x, y, p and tries to construct all possible paths
of the bishop from (0, 0) to (x, y) using some powers of 2 between 0 and p, inclusive. Here "path" is treated just as set of moves, i.e. we ignore
the order of moves. The following variants are possible:
</p>

<p>
<ol>
<li><i>x=0 and y=0</i>. Let's prove that the only path in this case is an empty one. Suppose there exists a non-empty path and the maximum
power of 2, used in this path, is k. Note, that the maximum absolute sum value, we can achieve, using the powers of 2 between 0 and k-1, is
2<sup>k</sup>-1. Therefore, as only we made move (+/-2<sup>k</sup>, +/-2<sup>k</sup>) from (0, 0), there is no way to return back
using smaller powers of 2.</li>
<li><i>x=0 or y=0 (but not both).</i> Similar arguments show that there are no paths in this case.</li>
<li><i>x&ne;0 and y&ne;0.</i> Here we have two variants - we can use or not use the move with 2<sup>p</sup>. If we don't use it,
all corresponding paths can be obtained by recursive call with parameters x, y, p-1. If we use it, we must make
this move into the same quadrant, where the point (x, y) is located, because once we made move with 2<sup>p</sup> into some
quadrant, there is no way to move to another quadrant using smaller powers of 2. So we have 4 possibilities:
<ul>
<li><i>x&gt;0 and y&gt;0.</i> We make move (2<sup>p</sup>, 2<sup>p</sup>) and recursive call with parameters x-2<sup>p</sup>, y-2<sup>p</sup>, p-1
to obtain all the variants of remaining moves.</li>
<li><i>x&gt;0 and y&lt;0.</i> We make move (2<sup>p</sup>, -2<sup>p</sup>) and recursive call with parameters x-2<sup>p</sup>, y+2<sup>p</sup>, p-1.</li>
<li><i>x&lt;0 and y&gt;0.</i> We make move (-2<sup>p</sup>, 2<sup>p</sup>) and recursive call with parameters x+2<sup>p</sup>, y-2<sup>p</sup>, p-1.</li>
<li><i>x&lt;0 and y&lt;0.</i> We make move (-2<sup>p</sup>, -2<sup>p</sup>) and recursive call with parameters x+2<sup>p</sup>, y+2<sup>p</sup>, p-1.</li>
</ul>
</ol>
</p>

<p>
Note, that there's no sense to consider powers of 2, starting from 28 and more, in the path of bishop. For example, if we make a move (2<sup>28</sup>,
2<sup>28</sup>), then we must also make a move (-2<sup>27</sup>, -2<sup>27</sup>) (otherwise both coordinates will be strictly more than 2<sup>27</sup>),
and the same effect can be reached with only one move (2<sup>27</sup>, 2<sup>27</sup>). Therefore, we can find all possible set of moves from (0, 0)
to (<b>finishX</b>, <b>finishY</b>) by recursive call with parameters <b>finishX</b>, <b>finishY</b>, 27.
</p>

<p>
Now, when we have all the possible set of moves, we need to transform them into answer. First, we leave only the sets with minimum possible number of
moves. Then, we transform each set into lexicographically smallest path by choosing the appropriate order of moves. This order is chosen in the following
way. The first move is chosen among all moves in such way, that the first point of the path (after (0, 0)) is lexicographically minimal. The second
move is chosen among all available moves (i.e. all moves except the first move) in such way, that the second point of the path is lexicographically minimal,
and so on. To find the answer, we return the lexicographically minimal among all constructed paths.
</p>

<p>
Now, there is only one problem left - in the current implementation of the recursive function there can be at most 2<sup>28</sup>-1 recursive calls,
so such solution can time out. To fix this, we leave the function immediately if |x| &gt; 2<sup>p+1</sup> or |y| &gt; 2<sup>p+1</sup>, as the maximum
sum, we can reach using powers of 2 between 0 and p, is 2<sup>p+1</sup>-1. This pruning reduces the number of calls significantly. Using careful
case analysis, one can show that there never be more than 1,600,000 recursive calls.
</p>


            
            

        </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>