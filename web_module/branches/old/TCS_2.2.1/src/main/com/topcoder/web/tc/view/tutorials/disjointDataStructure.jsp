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
    <tc-webtag:forumLink forumID="517506" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Disjoint-set Data Structures</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/vlad_D_big5.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="13298470" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">


<p><span class="bodySubtitle">Introduction</span><br />
Many times the efficiency of an algorithm depends on the data structures used in the algorithm. A wise choice in the structure you use in solving a problem can reduce the time of execution, the time to implement the algorithm and the amount of memory used. During SRM competitions we are limited to a time limit of 2 seconds and 64 MB of memory, so the right data structure can help you remain in competition. While some <a href="/tc?module=Static&d1=tutorials&d2=dataStructures">Data Structures</a> have been covered before, in this article we'll focus on data structures for disjoint sets. </p>
<p><span class="bodySubtitle">The problem</span><br />
Let&rsquo;s consider the following problem: In a room are N persons, and we will define two persons are friends if they are directly or indirectly friends. If A is a friend with B, and B is a friend with C, then A is a friend of C too. A group of friends is a group of persons where any two persons in the group are friends. Given the list of persons that are directly friends find the number of groups of friends and the number of persons in each group. For example N = 5 and the list of friends is: 1-2, 5-4, and 5-1. Here is the figure of the graph that represents the groups of friends. 1 and 2 are friends, then 5 and 4 are friends, and then 5 and 1 are friends, but 1 is friend with 2; therefore 5 and 2 are friends, etc. </p>
<div align="center"><img src="/i/education/disjointDataStructure/disjoint1.jpg"></div>
<p>In the end there are 2 groups of friends: one group is {1, 2, 4, 5}, the other is {3}.</p>

<p><span class="bodySubtitle">The solution</span><br />
This problem can be solved using <a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs2#breadth">BFS</a>, but let&rsquo;s see how to solve this kind of problem using data structures for disjoint sets. First of all: a disjoint-set data structure is a structure that maintains a collection S1, S2, S3, &hellip;, Sn of dynamic disjoint sets. Two sets are disjoint if their intersection is null. For example set {1, 2, 3} and set {1, 5, 6} aren&rsquo;t disjoint because they have in common {1}, but the sets {1, 2, 3} and {5, 6} are disjoint because their intersection is null. In a data structure of disjoint sets every set contains a <strong>representative</strong>, which is one member of the set. </p>
<p>Let&rsquo;s see how things will work with sets for the example of the problem. The groups will be represented by sets, and the representative of each group is the person with the biggest index. At the beginning there are 5 groups (sets): {1}, {2}, {3}, {4}, {5}. Nobody is anybody&rsquo;s friend and everyone is the representative of his or her own group. </p>
<p>The next step is that 1 and 2 become friends, this means the group containing 1 and the group with 2 will become one group. This will give us these groups: {1, 2} , {3}, {4}, {5}, and the representative of the first group will become 2. Next, 5 and 4 become friends. The groups will be {1,2}, {3}, {4, 5}. And in the last step 5 and 1 become friends and the groups will be {1, 2, 4, 5}, {3}. The representative of the first group will be 5 and the representative for second group will be 3. (We will see why we need representatives later). At the end we have 2 sets, the first set with 4 elements and the second with one, and this is the answer for the problem example: 2 groups, 1 group of 4 and one group of one. </p>
<p>Perhaps now you are wondering how you can check if 2 persons are in the same group. This is where the use of the representative elements comes in. Let&rsquo;s say we want to check if 3 and 2 are in the same group, we will know this if the representative of the set that contains 3 is the same as the representative of the set that contains 2. One representative is 5 and the other one is 3; therefore 3 and 2 aren&rsquo;t in same groups of friends. </p>

<p><span class="bodySubtitle">Some operations</span><br />
Let&rsquo;s define the following operations: </p>
<ul><li>CREATE-SET(x) &ndash; creates a new set with one element {x}.</li>
<li>MERGE-SETS(x, y) &ndash; merge into one set the set that contains element x and the set that contains element y (x and y are in different sets). The original sets will be destroyed.</li>
<li>FIND-SET(x) &ndash; returns the representative or a pointer to the representative of the set that contains element x.</li></ul>

<p><span class="bodySubtitle">The solution using these operations</span><br />
Let&rsquo;s see the solution for our problem using these operations:</p>
<pre>Read N;
for (each person x from 1 to N) CREATE-SET(x)
for (each pair of friends (x y) ) if (FIND-SET(x) != FIND-SET(y)) MERGE-SETS(x, y)</pre>
<p>Now if we want to see if 2 persons (x, y) are in same group we check if FIND-SET(x) == FIND-SET(y).</p>
<p>We will analyze the running time of the disjoint-set data structure in terms of N and M, where N is the number of times that CREATE-SET(x) is called and M is the total number of times that CREATE-SET(x), MERGE-SETS(x, y) and FIND-SET(x) are called. Since the sets are disjoint, each time MERGE-SETS(x, y) is called one set will be created and two will be destroyed, giving us one less set. If there are n sets after n-1 calls of MERGE-SETS(x,y) there will remain only one set. That&rsquo;s why the number of MERGE-SETS(x,y) calls is less than or equal to the number of CREATE-SET(x) operations. </p>

<p><span class="bodySubtitle">Implementation with linked lists</span><br />
One way to implement disjoint set data structures is to represent each set by a linked list. Each element (object) will be in a linked list and will contain a pointer to the next element in the set and another pointer to the representative of the set. Here is a figure of how the example of the problem will look like after all operations are made. The blue arrows are the pointers to the representatives and the black arrows are the pointers to the next element in the sets. Representing sets with linked lists we will obtain a complexity of O(1) for CREATE-SET(x) and FIND-SET(x). CREATE-SET(x) will just create a new linked list whose only element (object) is x, the operation FIND-SET(x) just returns the pointer to the representative of the set that contains element (object) x.</p>
<div align="center"><img src="/i/education/disjointDataStructure/disjoint2.jpg"></div>
<p>Now let&rsquo;s see how to implement the MERGE-SETS(x, y) operations. The easy way is to append x&rsquo;s list onto the end of y&rsquo;s list. The representative of the new set is the representative of the original set that contained y. We must update the pointer to the representative for each element (object) originally on x&rsquo;s list, which takes linear time in terms of the length of x&rsquo;s list. It&rsquo;s easy to prove that, in the worst case, the complexity of the algorithm will be O(M^2) where M is the number of operations MERGE-SETS(x, y). With this implementation the complexity will average O(N) per operation where N represents the number of elements in all sets. </p>

<p><span class="bodySubtitle">The &ldquo;weighted union heuristic&rdquo;</span><br />
Let&rsquo;s see how a heuristic will make the algorithm more efficient. The heuristic is called &ldquo;a weighted-union heuristic.&quot; In this case, let&rsquo;s say that the representative of a set contains information about how many objects (elements) are in that set as well. The optimization is to always append the smaller list onto the longer and, in case of ties, append arbitrarily. This will bring the complexity of the algorithm to O(M + NlogN) where M is the number of operations (FIND-SET, MERGE-SETS, CREATE-SETS) and N is the number of operations CREATE-SETS. I will not prove why the complexity is this, but if you are interested you can find the proof in the resources mentioned at the end of the article. </p>
<p>So far we reach an algorithm to solve the problem in O(M + NlogN) where N is the number of persons and M is the number of friendships and a memory of O(N). Still the BFS will solve the problem in O(M + N) and memory of O(N + M). We can see that we have optimized the memory but not the execution time. </p>

<p><span class="bodySubtitle">Next step: root trees</span><br />
The next step is to see what we can do for a faster implementation of disjoint set data structures. Let&rsquo;s represent sets by rooted trees, with each node containing one element and each tree representing one set. Each element will point only to its parent and the root of each tree is the representative of that set and its own parent. Let&rsquo;s see, in steps, how the trees will look for the example from the problem above.</p>
<p><strong>Step 1:</strong> nobody is anybody friend</p>
<div align="center"><img src="/i/education/disjointDataStructure/disjoint3.jpg"></div>
<p>We have 5 trees and each tree has a single element, which is the root and the representative of that tree.</p>
<p><strong>Step 2:</strong> 1 and 2 are friends, MERGE-SETS(1, 2):</p>
<div align="center"><img src="/i/education/disjointDataStructure/disjoint4.jpg"></div>
<p>The operation made is MERGE-SETS(1, 2). We have 4 trees one tree contain 2 elements and have the root 1. The other trees have a single element.</p>
<p><strong>Step 3:</strong> 5 and 4 are friends, MERGE-SETS(5, 4)</p>
<div align="center"><img src="/i/education/disjointDataStructure/disjoint5a.jpg"></div>
<p>The operation made is MERGE-SETS(5, 4). Now we have 3 trees, 2 trees with 2 elements and one tree with one element.</p>
<p><strong>Step 4:</strong> 5 and 1 are friends, MERGE-SETS(5, 1) </p>
<div align="center"><img src="/i/education/disjointDataStructure/disjoint5b.jpg"></div>
<p>The operation made is MERGE-SETS(5, 1). Now we have 2 trees, one tree has 4 elements and the other one has only one element.</p>
<p>As we see so far the algorithm using rooted trees is no faster than the algorithm using linked lists. </p>

<p><span class="bodySubtitle">Two heuristics</span><br />
Next we will see how, by using two heuristics, we will achieve the asymptotically fastest disjoint set data structure known so far, which is almost linear in terms of the number of operations made. These two heuristics are called &ldquo;<strong>union by rank</strong>&rdquo; and &ldquo;<strong>path compression.</strong>&rdquo; The idea in the first heuristic &ldquo;<strong>union by rank</strong>&rdquo; is to make the root of the tree with fewer nodes point to the root of the tree with more nodes. For each node, we maintain a <strong>rank </strong>that approximates the logarithm of the sub-tree size and is also an upper bound on the height of the node. When MERGE-SETS(x, y) is called, the root with smaller rank is made to point to the root with larger rank. The idea in the second heuristic &ldquo;<strong>path compression,</strong>&rdquo; which is used for operation FIND-SET(x), is to make each node on the find path point directly to the root. This will not change any ranks.</p>
<p>To implement a disjoint set forest with these heuristics, we must keep track of ranks. With each node x, we keep the integer value <em>rank[x], </em>which is bigger than or equal to the number of edges in the longest path between node x and a sub-leaf. When CREATE-SET(x) is called the initial rank[x] will be 0. When a MERGE-SETS(x, y) operation is made then the root of higher rank will become the parent of the root of lower rank &ndash; or, in case of tie, we arbitrarily choose one of the roots as the parent and increment its rank.</p>
<p>Let&rsquo;s see how the algorithm will look. </p>
<pre>Let P[x] = the parent of node x.
CREATE-SET(x) 
 P[x] = x
 rank[x] = 0
MERGE-SETS(x, y)
 PX = FIND-SET(X)
 PY =FIND-SET(Y)
 If (rank[PX] &gt; rank[PY]) P[PY] = PX
 Else P[PX] = PY
 If (rank[PX] == rank[PY]) rank[PY] = rank[PY] + 1</pre>
<p>And the last operation looks like:</p>
<pre>FIND-SET(x) 
 If (x != P[x]) p[x] = FIND-SET(P[X])
 Return P[X]</pre>
<p>Now let&rsquo;s see how the heuristics helped the running time. If we use only the first heuristic &ldquo;<strong>union by rank</strong>&rdquo; then we will get the same running time we achieved with the weighted union heuristic when we used lists for representation. When we use both &ldquo;<strong>union by rank</strong>&rdquo; and &ldquo;<strong>path compression,</strong>&rdquo; the worst running time is O( m


&alpha;(m,n)), where 


&alpha;(m,n) is the very slowly growing inverse of Ackermann&rsquo;s function. In application 


&alpha;(m,n) &lt;= 4 that&rsquo;s why we can say that the running time is linear in terms of m, in practical situations. (For more details on Ackermann&rsquo;s function or complexity see the references below.)</p>

<p><span class="bodySubtitle">Back to the problem</span><br />
The problem from the beginning of the article is solvable in O(N + M) and O(N) for memory using disjoint-set data structure. The difference for time execution is not big if the problem is solved with BFS, but we don&rsquo;t need to keep in memory the vertices of the graph. Let&rsquo;s see if the problem was like: In a room are N persons and you had to handle Q queries. A query is of the form &ldquo;x y 1,&rdquo; meaning that x is friends with y, or &ldquo;x y 2&rdquo; meaning that we are asked to output if x and y are in same group of friends at that moment in time. In this case the solution with disjoint-set data structure is the fastest, giving a complexity of O(N + Q). </p>

<p><span class="bodySubtitle">Practice</span><br />
Disjoint-set data structures are a helpful tool for use in different algorithms, or even for solving problems in an SRM. They are efficient and use small amount of memory. They are useful in applications like &ldquo;Computing the shorelines of a terrain,&rdquo; &ldquo;Classifying a set of atoms into molecules or fragments,&rdquo; &ldquo;Connected component labeling in image analysis,&rdquo; and others.</p>
<p>To practice what you've learned, try to solve <a href="/stat?c=problem_statement&pm=2998">GrafixMask</a> &ndash; the Division 1 500 from SRM211. The idea is to keep track of all the blocks and consider each grid point as a node. Next, take all the nodes that aren&rsquo;t blocked and let (x, y) be the coordinate of the left, right, down or up node, and if (x, y) is not blocked then you do the operation MERGE-SETS(node, node2). You should also try to determine how disjoint-set data structures can be used in the solution of <a href="/stat?c=problem_statement&pm=7921">RoadReconstruction</a> from SRM 356. Disjoint-set data structures can also be used in <a href="/stat?c=problem_statement&pm=2932">TopographicalImage </a>from SRM 210 and <a href="/stat?c=problem_statement&amp;pm=1110">PathFinding</a>, from SRM 156.</p>
<p>I hope you find this data structure to be useful. Good luck in the Arena!</p>
<p>References:</p>
<ul><li>Thomas H. Cormen, <em>Introduction to Algorithms</em></li>
<li><a href="http://en.wikipedia.org/wiki/Disjoint-set_data_structure">en.wikipedia.org/wiki/Disjoint-set_data_structure</a></li>
<li><a href="http://en.wikipedia.org/wiki/Ackermann_function">en.wikipedia.org/wiki/Ackermann_function</a></li></ul>
<p>&nbsp; </p>

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

