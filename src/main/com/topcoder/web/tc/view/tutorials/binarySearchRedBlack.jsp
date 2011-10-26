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
.codeBox
{
   width: 600;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
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
                <tc-webtag:forumLink forumID="514787" message="Discuss this article" /><br />
                <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
            </div>
            
            <span class="bigTitle">An Introduction to Binary Search and Red-Black Trees</span>
            <br /><br />

            <div class="authorPhoto">
                <img src="/i/m/cpphamza_big2.jpg" alt="Author" />
            </div>

            <div class="authorText"> By&#160;<tc-webtag:handle coderId="19841837" context="algorithm"/><br />
                <em>TopCoder Member</em>
            </div>

            <br clear="all">

            
            <p>As a programmer, you'll frequently come across tasks that deal with a number of objects -- numbers, strings, people, and so forth -- and that require you to store and process those objects. If you need to maintain a list of objects that are sorted and unique, and if you need to be able to quickly insert and retrieve objects to and from this list, the ideal data structure will be a tree set (or a tree map, if you consider each object a key and associate another object called a value to it). </p>

<p>Many programming languages provide built-in support for tree-based sets and maps -- for instance, Java's <a href="http://java.sun.com/j2se/1.4.2/docs/api/java/util/TreeSet.html">TreeSet</a>/<a href="http://java.sun.com/j2se/1.4.2/docs/api/java/util/TreeMap.html">TreeMap</a> classes and the C++ Standard Template Library's set and map classes -- but because of their common use, it's easy to misunderstand what actually happens behind the scenes, and how the underlying data structures actually work. That&rsquo;s what this article is all about. </p>

<p>We'll start off by looking at some of the general terms and concepts used in dealing with trees We'll then focus on binary search trees (BST), a special type of tree that keeps elements sorted (but doesn&rsquo;t guarantee efficient insertion and retrieval). Finally we'll look at red-black trees, a variation of binary search trees that overcome BST's limitations through a logarithmic bound on insertion and retrieval. </p>

<p><span class="bodySubtitle">Trees terminology</span></p>
 
<p>A tree is a data structure that represents data in a hierarchical manner. It associates every object to a node in the tree and maintains the parent/child relationships between those nodes. Each tree must have exactly one node, called the <strong>root</strong>, from which all nodes of the tree extend (and which has no parent of its own). The other end of the tree &ndash; the last level down -- contains the leaf nodes of the tree. </p>

<div align="center"><img src="/i/education/rbtrees1.jpg" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>

<p>The number of lines you pass through when you travel from the root until you reach a particular node is the <strong>depth</strong> of that node in the tree (node G in the figure above has a depth of 2). The <strong>height</strong> of the tree is the maximum depth of any node in the tree (the tree in Figure 1 has a height of 3). The number of children emanating from a given node is referred to as its<strong> degree</strong> -- for example, node A above has a degree of 3 and node H has a degree of 1. </p>

<p><span class="bodySubtitle">Binary Search Tree (BST)</span></p>

<p>A binary search tree is a tree with one additional constraint -- it keeps the elements in the tree in a particular order. Formally each node in the BST has two children (if any are missing we consider it a <strong>nil node</strong>), a left child and a right child. Nodes are rooted in place based on their values, with the smallest on the left and largest on the right. </p>

<div align="center"><img src="/i/education/rbtrees2.jpg" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>

<p><span class="bodySubtitle">Traversing BST</span></p>

<p>A common requirement when using sets and maps is to go through the elements in order. With binary search trees, traversing from left to right is known as <strong> inorder</strong><strong>tree traversal</strong>. In a tree where each node has a value and two pointers to the left and right children, inorder tree traversal can be thought of as: </p>

<pre>    Procedure Inorder_traversal(Node n) 
        if(n == nil) 
            return; 
        Inorder_traversal(n.left_subtree); 
        Print(n.value); 
        Inorder_traversal(n.right_subtree); 
    &hellip; 
    Inorder_traversal(root); </pre>

<p><span class="bodySubtitle">Operations on BST (insertion, deletion and retrieval) </span></p>

<p><strong>BST insertion:</strong><br />
When adding a new node to a binary search tree, note that the new node will always be a leaf in the tree. To insert a new node, all we will do is navigate the BST starting from the root. If the new node value is smaller than the current node value, we go left &ndash; if it is larger, we go right. When we reach a leaf node, the last step is to attach the new node as a child to this leaf node in a way that preserves the BST constraint. </p>

<p>For example, consider we want to add a new node with value 4 to the BST in Figure 1. Here are the steps we will go through: </p>
<ul>
  <li>Let the current node = root = 5. </li>
  <li>As the new node is smaller than the current node (4 &lt; 5), we will go left and set current node to 2. </li>
  <li>As the new node is greater than current node (4 &gt; 2), we will go right and set the current node to 3. </li>
  <li>We've reached a leaf, so the last step is to attach the new node to the right of the current node. Here is how the new BST looks: </li>
</ul>

<div align="center"><img src="/i/education/rbtrees3.jpg" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>

<p><strong>BST Deletion:</strong><br />
Deleting a node from BST is a little more subtle. Formally there are three cases for deleting node n from a BST: </p>
<ul>
  <li>If n has no children, we only have to remove n from the tree. </li>
  <li>If n has a single child, we remove n and connect its parent to its child. </li>
  <li>If n has two children, we need to : </li>
  <ul>
    <li>Find the smallest node that is larger than n, call it m. </li>
    <li>Remove m from the tree (if you have reached this case then m will always have no left child, though I'll leave the proof to the reader), so we apply one or the other of the above cases to do this. </li>
    <li>Replace the value of n with m. </li>
  </ul>
</ul>

<p>Figure 4 shows these three cases in action. </p>

<div align="center"><img src="/i/education/rbtrees4.jpg" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>

<p><strong>BST Retrieval:</strong><br />
Retrieving an element from binary search trees requires simple navigation, starting from the root and going left, if the current node is larger than the node we are looking for, or going right otherwise. </p>

<p>Any of these primitive operations on BST run in O(h) time, where h is the tree height, so the smaller the tree height the better running time operations will achieve. The problem with BST is that, depending on the order of inserting elements in the tree, the tree shape can vary. In the worst cases (such as inserting elements in order) the tree will look like a linked list in which each node has only a right child. This yields O(n) for primitive operations on the BST, with n the number of nodes in the tree. </p>

<p>To solve this problem many variations of binary search trees exist. Of these variations, red-black trees provide a well-balanced BST that guarantees a logarithmic bound on primitive operations. </p>

<p><span class="bodySubtitle">Red-black Trees</span></p>

<p>Red-black trees are an evolution of binary search trees that aim to keep the tree balanced without affecting the complexity of the primitive operations. This is done by coloring each node in the tree with either red or black and preserving a set of properties that guarantee that the deepest path in the tree is not longer than twice the shortest one. </p>

<p>A red-black tree is a binary search tree with the following properties: </p>
<ol>
  <li>Every node is colored with either red or black. </li>
  <li>All leaf (nil) nodes are colored with black; if a node&rsquo;s child is missing then we will assume that it has a nil child in that place and this nil child is always colored black. </li>
  <li>Both children of a red node must be black nodes. </li>
  <li>Every path from a node n to a descendent leaf has the same number of black nodes (not counting node n). We call this number the <strong>black height</strong> of n, which is denoted by bh(n). </li>
</ol>

<p>Figure 5 shows an example of a red-black tree. </p>

<div align="center"><img src="/i/education/rbtrees5.jpg" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>

<p>Using these properties, we can show in two steps that a red-black tree which contains n nodes has a height of O(log n), thus all primitive operations on the tree will be of O(log n) since their order is a function of tree height. </p>

<ol><li>First, notice that for a red-black tree with height h, bh(root) is at least h/2 by property 3 above (as each red node strictly requires black children).</li>
<li>The next step is to use the following lemma:
<ul><li>Lemma: A subtree rooted at node v has at least 2^bh(v) &ndash; 1 internal nodes</li>
<li>Proof by induction: The basis is when h(v) = 0, which means that v is a leaf node and therefore bh(v) = 0 and the subtree rooted at node v has 2^bh(v)-1 = 2^0-1 = 1-1 = 0 nodes.</li>
<li>Inductive hypothesis: if node v1 with height x has 2^bh(v1)-1 internal nodes then node v2 with height x+1 has 2^bh(v2)-1</li></ul></li></ol>

<p>For any non-leaf node v (height &gt; 0) we can see that the black height of any of its two children is at least equal to bh(v)-1 -- if the child is black, that is, otherwise it is equal to bh(v) . By applying the hypothesis above we conclude that each child has at least 2^[bh(v)-1]-1 internal nodes, accordingly node v has at least<br />
  2^[bh(v)-1]-1 + 2^[bh(v)-1]-1 + 1 = 2^bh(v)-1<br />
  internal nodes, which ends the proof. </p>

<p>By applying the lemma to the root node (with bh of at least h/2, as shown above) we get<br />
  n &gt;= 2^(h/2) &ndash; 1<br />
  where n is the number of internal nodes of a red-black tree (the subtree rooted at the root). Playing with the equation a little bit we get h &lt;= 2 log (n+1), which guarantees the logarithmic bound of red-black trees. </p>

<p><span class="bodySubtitle">Rotations</span></p>

<p>How does inserting or deleting nodes affect a red-black tree? To ensure that its color scheme and properties don't get thrown off, red-black trees employ a key operation known as <strong>rotation</strong>. Rotation is a binary operation, between a parent node and one of its children, that swaps nodes and modifys their pointers while preserving the inorder traversal of the tree (so that elements are still sorted). </p>

<p>There are two types of rotations: left rotation and right rotation. Left rotation swaps the parent node with its right child, while right rotation swaps the parent node with its left child. Here are the steps involved in for left rotation (for right rotations just change &quot;left&quot; to &quot;right&quot; below): </p>
<ul>
  <li>Assume node x is the parent and node y is a non-leaf right child. </li>
  <li>Let y be the parent and x be its left child. </li>
  <li>Let y&rsquo;s left child be x&rsquo;s right child. </li>
</ul>

<div align="center"><img src="/i/education/rbtrees6.jpg" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>

<p><span class="bodySubtitle">Operations on red-black tree (insertion, deletion and retrieval) </span></p>

<p>Red-black tree operations are a modified version of BST operations, with the modifications aiming to preserve the properties of red-black trees while keeping the operations complexity a function of tree height. </p>

<p><strong>Red-black tree insertion:</strong><br />
Inserting a node in a red-black tree is a two step process:
<ol>
  <li>A BST insertion, which takes O(log n) as shown before. </li>
  <li>Fixing any violations to red-black tree properties that may occur after applying step 1. This step is O(log n) also, as we start by fixing the newly inserted node, continuing up along the path to the root node and fixing nodes along that path. Fixing a node is done in constant time and involves re-coloring some nodes and doing rotations. </li>
</ol>

<p>Accordingly the total running time of the insertion process is O(log n). Figure 7 shows the red-black tree in figure 5 before and after insertion of a node with value 4. You can see how the swap operations modified the tree structure to keep it balanced. </p>

<div align="center"><img src="/i/education/rbtrees7.jpg" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>

<p><strong>Red-black tree deletion: </strong><br />
The same concept behind red-black tree insertions applies here. Removing a node from a red-black tree makes use of the BST deletion procedure and then restores the red-black tree properties in O(log n). The total running time for the deletion process takes O(log n) time, then, which meets the complexity requirements for the primitive operations. </p>

<p><strong>Red-black tree retrieval: </strong><br />
Retrieving a node from a red-black tree doesn&rsquo;t require more than the use of the BST procedure, which takes O(log n) time. </p>

<p><span class="bodySubtitle">Conclusion</span></p>
<p>Although you may never need to implement your own set or map classes, thanks to their common built-in support, understanding how these data structures work should help you better assess the performance of your applications and give you more insight into what structure is right for a given task. For more practice with these concepts, check out these problems from the TopCoder archive that involve trees: </p>
<ul>
<li><a href="/stat?c=problem_statement&pm=5898&rd=8083">MonomorphicTyper</a> (SRM 286) </li>
<li><a href="/stat?c=problem_statement&pm=6066&rd=10060">PendingTasks</a> (TCHS SRM 8) </li>
<li><a href="/stat?c=problem_statement&pm=1748&rd=4580">RedBlack</a> (SRM 155) </li>
<li><a href="/stat?c=problem_statement&pm=1874&rd=4645">DirectoryTree</a> (SRM 168) </li>
<li><a href="/stat?c=problem_statement&pm=4700&rd=7995">EncodingTrees</a> (SRM 261) </li>
<li><a href="/stat?c=problem_statement&pm=4440&rd=7999">AntiChess</a> (SRM 266) </li>
<li><a href="/stat?c=problem_statement&pm=6713&rd=9999">IncompleteBST</a> (SRM 319) </li>
</ul>

<p><span class="bodySubtitle">References</span></p>
<ul>
  <li>&quot;Data Structures via C++: Objects by Evolution,&quot; by A. Michael Berman</li>
  <li>&quot;Fundamentals in Data Structures in C++, Second Edition,&quot; by Ellis Horowitz, Sartaj Sahni&nbsp;and&nbsp;Dinesh P. Mehta&nbsp; </li>
  <li>&quot;Introduction to Algorithms, Second Edition,&quot; by Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest and Clifford Stein. </li>
</ul>
<p></p>

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
