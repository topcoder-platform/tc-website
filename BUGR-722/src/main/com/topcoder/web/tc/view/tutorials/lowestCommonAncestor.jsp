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
                <tc-webtag:forumLink forumID="506217" message="Discuss this article" /><br />
                <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
            </div>

<span class="bodyTitle">Range Minimum Query and Lowest Common Ancestor</span>


<img src="/i/m/danielp_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="22065256" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />

<br/>
&nbsp;<a href="#Introduction">Introduction</a><br />
  &nbsp;<a href="#Notations">Notations</a><br />
  &nbsp;<a href="#Range_Minimum_Query_(RMQ)">Range Minimum Query (RMQ)</a><br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#Trivial_algorithms_for_RMQ">Trivial algorithms for RMQ</a><br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#A O(N), O(sqrt(N)) solution">A &lt;O(N), O(sqrt(N))&gt; solution</a><br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#Sparse_Table_(ST)_algorithm">Sparse Table (ST) algorithm</a><br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#Segment_Trees">Segment Trees</a><br />
&nbsp;<a href="#Lowest Common Ancestor (LCA)">Lowest Common Ancestor (LCA)</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#A O(N), O(sqrt(N)) solution">A &lt;O(N), O(sqrt(N))&gt; solution</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#Another easy solution in O(N logN, O(logN)">Another easy solution in &lt;O(N logN, O(logN)&gt;</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#Reduction from LCA to RMQ">Reduction from LCA to RMQ</a><br />
&nbsp;<a href="#From RMQ to LCA">From RMQ to LCA</a><br />
&nbsp;<a href="#A O(N), O(1) algorithm for the restricted RMQ">An &lt;O(N), O(1)&gt; algorithm for the restricted RMQ</a><br />
&nbsp;<a href="#Conclusion">Conclusion</a> 
<br /><br />
<span class="bodySubtitle"><A name="Introduction"></A>Introduction</span><br>
The problem of finding the Lowest Common Ancestor (LCA) of a 
pair of nodes in a rooted tree has been studied more carefully in the second part of the 20th century and now is fairly basic in algorithmic 
graph theory. This problem is interesting not only for the tricky algorithms 
that can be used to solve it, but for its&nbsp;numerous applications in string processing and computational biology, for example, where 
LCA is used with suffix trees or other tree-like structures. <a href="<tc-webtag:linkTracking link="http://siamdl.aip.org/getabs/servlet/GetabsServlet?prog=normal&id=SMJCAT000013000002000338000001&idtype=cvips&gifs=Yes"/>" target="_blank" refer="lowestCommonAncestor"/>Harel and Tarjan</a> were the first to study this problem more attentively and they showed that after 
linear preprocessing of the input tree LCA, queries can be answered in constant 
time. Their work has since been extended, and this tutorial will present many 
interesting approaches that can be used in other kinds of problems as well.
<br />
<br />
Let's consider a less abstract example of LCA: the tree of life. It's a well-known fact that the current habitants of Earth evolved from other 
species. This evolving structure can be represented as a tree, in which
nodes represent species, and the sons of some node represent the directly 
evolved species. Now species with similar characteristics are divided into 
groups. By finding the LCA of some nodes in this tree we can actually find the common 
parent of two species, and we can determine that the similar characteristics they share 
are inherited from that parent.
<br />
<br />
Range Minimum Query (RMQ) is used on arrays to find the 
position of an element with the minimum value between two specified indices. We 
will see later that the LCA problem can be reduced to a restricted 
version of an RMQ problem, in which consecutive array elements differ by exactly 1.
<br />
<br />
However, RMQs are not only used with LCA. They have an 
important role in string preprocessing, where they are used with suffix arrays (a new data structure that supports string searches almost as fast as suffix 
trees, but uses less memory and less coding effort).
<br />
<br />
In this tutorial we will first talk about RMQ. We will 
present many approaches that solve the problem -- some slower but easier 
to code, and others faster. In the second part we will talk about the strong 
relation between LCA and RMQ. First 
we will review two easy approaches for LCA that don't use RMQ; then show that the 
RMQ and LCA problems are equivalent; and, at the end, we'll look at how the RMQ 
problem can be reduced to its restricted version, as well as show a fast 
algorithm for this particular case.
<br /><br />
<A name="Notations"></A><span class="bodySubtitle">Notations</span><br>
Suppose that an algorithm has 
preprocessing time <b>f(n)</b> and query time <b>g(n)</b>. The notation for the overall 
complexity for the algorithm is <b>&lt;f(n), g(n)&gt;</b>.
<br /><br />
We will note the position of the 
element with the minimum value in some array <b>A </b>between indices<b> i</b> and 
<b>j</b> with <b>RMQ<SUB>A</SUB>(i, j)</b>.
<br /><br />
The furthest node from the root 
that is an ancestor of both <b>u</b> and <b>v </b>in some rooted&nbsp; tree <b>T</b> is
<b>LCA<sub>T</sub>(u, v)</b>.
<br /><br />
<A name="Range_Minimum_Query_(RMQ)"></A><span class="bodySubtitle">Range Minimum Query(RMQ)</span><br>
Given an array <b>A[0, N-1]</b> 
find the position of&nbsp; the element with the minimum value between two given 
indices. 
<br /><br />
<div align="center"><img width="421" height="120" src="i/education/lca/RMQ_001.gif"></div>
<br /><br />
<A name="Trivial_algorithms_for_RMQ"></A><span class="bodySubtitle">Trivial algorithms for RMQ</span><br>
For every pair of indices <b>(i, j) 
</b>store the value of <b>RMQ<SUB>A</SUB>(i, j)</b> in a table <b>M[0, N-1][0, N-1]</b>. Trivial 
computation will lead us to an <b>&lt;O(N<SUP>3</SUP>), O(1)&gt;</b> complexity. 
However, by using an easy dynamic programming approach we can reduce the complexity to 
<b>&lt;O(N<SUP>2</SUP>), O(1)&gt;</b>. The preprocessing function will look 
something like this:

<pre class="code">
  <b>void</b> process1(<b>int</b> M[MAXN][MAXN], <b>int</b> A[MAXN], <b>int</b> N)
  {
&nbsp;&nbsp;    <b>int</b> i, j;
  &nbsp;&nbsp;&nbsp; <b>for</b> (i =0; i &lt; N; i++)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; M[i][i] = i;
  &nbsp;&nbsp;&nbsp; <b>for</b> (i = 0; i &lt; N; i++)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>for </b>(j = i + 1; j &lt; N; j++)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>if</b> (A[M[i][j - 1]] &lt; A[j])
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   M[i][j] = M[i][j - 1];
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>else</b>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; M[i][j] = j;
  }</pre>

This trivial algorithm is quite slow and uses <b>O(N<SUP>2</SUP>)</b> memory, so it won't work for large cases.
<br /><br />
<a name="A O(N), O(sqrt(N)) solution"></a><span class="bodySubtitle">An &lt;O(N), O(sqrt(N))&gt; solution</span><br>
An interesting idea is to split the vector in <b>sqrt(N)</b> pieces. We will keep in a vector <b>M[0, sqrt(N)-1]</b> the position 
for the minimum value for each section. <b>M</b> can be easily preprocessed in <b>O(N)</b>. Here is an example:
<br /><br />
<div align="center"><img width="442" height="176" src="i/education/lca/RMQ_002.gif"></div>

Now let's see how can we compute <b>RMQ<SUB>A</SUB>(i, j)</b>. The idea is to get the overall minimum from the <b>sqrt(N)</b> 
sections that lie inside the interval, and from the end and the beginning of the 
first and the last sections that intersect the bounds of the interval. To get 
<b>RMQ<SUB>A</SUB>(2,7)</b> in the above example we should compare <b>A[2]</b>, 
<b>A[M[1]]</b>, <b>A[6]</b> 
and <b>A[7]</b> and get the position of the minimum value. It's easy to see that this 
algorithm doesn't make more than <b>3 * sqrt(N)</b> operations per query.
<br />
<br />
The main advantages of this approach are that is to quick to code (a plus for TopCoder-style competitions) and that you can adapt it to the 
dynamic version of the problem (where you can change the elements of the array 
between queries).
<br />
<br />
<A name="Sparse_Table_(ST)_algorithm"></A><span class="bodySubtitle">Sparse Table (ST) algorithm</span><br>
A better approach is to preprocess <b>RMQ</b> for sub arrays of length <b>2<SUP>k</SUP> </b>using dynamic programming. We will 
keep an array <b>M[0, N-1][0, logN]</b> where <b>M[i][j]</b> is the index of the minimum value 
in the sub array starting at <b>i</b> having length <b>2<SUP>j</SUP></b>. Here is an example:
<br />
<br />
<div align="center"><img width="421" height="209" src="i/education/lca/RMQ_003.gif"></div>
<br /><br />
For computing <b>M[i][j]</b> we must search for the minimum value in the first and second half of the interval. It's obvious 
that the small pieces have <b>2<SUP>j - 1</SUP></b> length, so the recurrence 
is:
<br /><br />
<div align="center"><img border="0" src="i/education/lca/RMQ_007.gif" width="510" height="55"></div>
<br /><br />
The preprocessing function will look something like this:

<pre class="code">

  <b>void</b> process2(<b>int</b> M[MAXN][LOGMAXN], <b>int</b> A[MAXN], <b>int</b> N)
  {
      <b>int</b> i, j;
  &nbsp;
  <font color="#0000FF">//initialize <b>M</b> for the intervals with length <b>1</b></font>
      <b>for</b> (i = 0; i &lt; N; i++)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; M[i][0] = i;
<font color="#0000FF">  //compute values from smaller to bigger intervals</font>
  &nbsp;&nbsp;&nbsp; <b>for </b>(j = 1; 1 &lt;&lt; j &lt;= N; j++)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>for </b>(i = 0; i + (1 &lt;&lt; j) - 1 &lt; N; i++)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     <b>if</b> (A[M[i][j - 1]] &lt; A[M[i + (1 &lt;&lt; (j - 1))][j - 1]])
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;         M[i][j] = M[i][j - 1];
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>else</b>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   M[i][j] = M[i + (1 &lt;&lt; (j - 1))][j - 1];
  }  
</pre>

Once we have these values preprocessed, let's show how we can use them to calculate <b>RMQ<SUB>A</SUB>(i, j)</b>. 
The idea is to select two blocks that entirely cover the interval <b>[i..j]</b> 
and&nbsp; find the minimum between them. Let <b>k = [log(j - i + 1)]</b>. For computing
<b>RMQ<SUB>A</SUB>(i, j)</b> we can use the following formula:
<br /><br />
<div align="center"><IMG src="i/education/lca/RMQ_005.gif" width="488" height="59" border="0"></div>
<br /><br />
So, the overall complexity of the 
algorithm is <b>&lt;O(N logN), O(1)&gt;</b>.
<br /><br />
<A name="Segment_Trees"></A><span class="bodySubtitle">Segment trees</span><br>
For solving the RMQ problem we 
can also use segment trees. A segment tree is a heap-like data structure that can be 
used for making update/query operations upon array intervals in 
logarithmical time. We define the segment tree for the interval <b>[i, j]</b> in the 
following recursive manner:
<ul>
<li>the first node will hold the information for the interval <b>[i, j]</b></li>
<li>if i&lt;j the left and right son will hold the information for the intervals <b>[i, (i+j)/2]</b> and <b>[(i+j)/2+1, j] </b> </li>
</ul>
Notice that the height of a segment tree for an interval with <b>N</b> elements is <b>[logN] + 1</b>. Here is 
how a segment tree for the interval <b>[0, 9]</b> would look like:
<br /><br />
<div align="center"><img width="506" height="296" src="i/education/lca/RMQ_004.gif"></div>
<br /><br />
The segment tree has the 
same structure as a heap, so if we have a node numbered <b>x </b>that is not a 
leaf the left son of<b> x</b> is 
<b>2*x</b> and the right son <b>2*x+1</b>.
<br /><br />
For solving the RMQ problem using 
segment trees we should use an array <b>M[1, 2 * 2<SUP>[logN] + 1</SUP>]</b> where
<b>M[i]</b> 
holds the minimum value position in the interval assigned to node <b>i</b>. At 
the beginning 
all elements in <b>M</b> should be <b>-1</b>. The tree should be initialized with the 
following function (<b>b </b>and <b>e </b>are the bounds of the current interval):
<br />
<br />
<pre class="code">
  <b>void</b> initialize(<b>int</b>node, <b>int </b>b, <b>int </b>e, <b>int </b>M[MAXIND], <b>int</b> A[MAXN], <b>int </b>N)
  {
      <b>if </b>(b == e)
          M[node] = b;
  &nbsp;&nbsp;  <strong>else</strong>
  &nbsp;&nbsp;&nbsp;&nbsp; {
  <font color="#0000FF">//compute the values in the left and right subtrees</font>
  &nbsp;&nbsp;&nbsp;     initialize(2 * node, b, (b + e) / 2, M, A, N);
  &nbsp;&nbsp;&nbsp;     initialize(2 * node + 1, (b + e) / 2 + 1, e, M, A, N);
  <font color="#0000FF">//search for the minimum value in the first and 
  //second half of the interval</font>
  &nbsp;&nbsp;&nbsp;     <b>if </b>(A[M[2 * node]] &lt;= A[M[2 * node + 1]])
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     M[node] = M[2 * node];
  &nbsp;&nbsp;&nbsp;&nbsp;<strong>    else</strong>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     M[node] = M[2 * node + 1]; 
  &nbsp;&nbsp;&nbsp; }
  } 
</pre>

The function above reflects the way 
the tree is constructed. When calculating the minimum position for some interval 
we should look at the values of the sons. You should call the function with <b>node 
= 1</b>, <b>b = 0</b> and <b>e&nbsp; = N-1</b>.
<br /><br />
We can now start making queries. If we want to find the position of the minimum value in some interval <b>[i, j]</b> we 
should use the next easy function:

<pre class="code">
  <b>int</b> query(<b>int</b> node, <b>int </b>b, <b>int </b>e, <b>int</b> M[MAXIND], <b>int</b> A[MAXN], <b>int</b> i, <b>int </b>j)
  {<b>
      int </b>p1, p2;</font></p>
  &nbsp;
  <font color="#0000FF">//if the current interval doesn't intersect 
  //the query interval return <b>-1</b></font>
  &nbsp;&nbsp;&nbsp; <b>if </b>(i &gt; e || j &lt; b)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>return </b>-1;
  &nbsp;
  <font color="#0000FF">//if the current interval is included in 
  //the query interval return <b>M[node]</b></font>
  &nbsp;&nbsp;&nbsp; <b>if</b> (b &gt;= i &amp;&amp; e &lt;= j)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>return </b>M[node];
  &nbsp;
  <font color="#0000FF">//compute the minimum position in the 
  //left and right part of the interval</font>
  &nbsp;&nbsp;&nbsp; p1 = query(2 * node, b, (b + e) / 2, M, A, i, j);
  &nbsp;&nbsp;&nbsp; p2 = query(2 * node + 1, (b + e) / 2 + 1, e, M, A, i, j);
  &nbsp;
  <font color="#0000FF">//return the position where the overall 
  //minimum is</font>
  &nbsp;&nbsp;&nbsp; <b>if </b>(p1 == -1)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>return </b>M[node] = p2;
  &nbsp;&nbsp;  <b>if </b>(p2 == -1)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>return </b>M[node] = p1;
  &nbsp;&nbsp;&nbsp; <b>if</b> (A[p1] &lt;= A[p2])
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>return </b>M[node] = p1;
  &nbsp;&nbsp;&nbsp; <b>return</b> M[node] = p2;</font></p>
  }
</pre>

You should call this function with <b>node = 1</b>, <b>b = 0</b> and <b>e = N - 1</b>, because the interval assigned to the first node is <b>[0, N-1]</b>.
<br /><br />
It's easy to see that any query is 
done in <b>O(log N)</b>. Notice that we stop when we reach completely in/out intervals, 
so our path in the tree should split only one time.
<br /><br />
Using segment trees we get an <b>&lt;O(N), O(logN)&gt;</b> algorithm. Segment trees are very powerful, not only 
because they can be used for RMQ. They are a very flexible data structure, can 
solve even the dynamic version of RMQ problem, and have numerous 
applications in range searching problems.
<br /><br />


<a name="Lowest Common Ancestor (LCA)"></a><span class="bodySubtitle">Lowest Common Ancestor (LCA)</span><br />
Given a rooted tree <b>T</b> and 
two nodes <b>u</b> and <b>v,</b> find the furthest node from the root that is an ancestor for 
both<b> u</b> and <b>v</b>. Here is an example (the root of the tree will be 
node 1 for all 
examples in this editorial):
<br />
<br />
<div align="center"><img width="227" height="480" src="i/education/lca/LCA_001.gif"></div>
<br /><br />
<a name="A O(N), O(sqrt(N)) solution"></a><span class="bodySubtitle">An &lt;O(N), O(sqrt(N))&gt; solution</span><br />
Dividing our input into equal-sized parts proves to be an interesting way to solve the RMQ problem. This method 
can be adapted for the LCA problem as well. The idea is to split the tree in <b>sqrt(H)</b> 
parts, were <b>H</b> is the height of the tree. Thus, the first section will contain 
the levels numbered from <b>0 to sqrt(H) - 1</b>, the second will contain the levels 
numbered from <b>sqrt(H) to 2 * sqrt(H) - 1</b>, and so on. Here is how the tree in the 
example should be divided:
<br />
<br />

<div align="center"><img width="392" height="466" src="i/education/lca/LCA_002.gif"></div>
<br /><br />
Now, for each node, we should know the ancestor that is situated on the last level of the upper next section. We will 
preprocess this values in an array <b>P[1, MAXN]</b>. Here is how <b>P</b> should look like 
for the tree in the example (for simplity, for every node <b>i</b> in the first section let <b>P[i] = 1</b>):
<br />
<br />
<div align="center"><img width="510" height="59" src="i/education/lca/LCA_003.gif"></div>
<br /><br />
Notice that for the nodes situated on the levels that are the  first ones in some sections, <b>P[i] 
= T[i]</b>. We can preprocess<b> P</b> using a depth first search (<b>T[i]</b> is the father of node
<b>i </b>in the tree, <b>nr</b> is <b>[sqrt(H)]</b> and <b>L[i] </b>is the level of the node
<b>i</b>):

<pre class="code">
  <b>void</b> dfs(<b>int</b> node, <b>int</b> T[MAXN], <b>int</b> N, <b>int</b> P[MAXN], <b>int</b> L[MAXN], <b>int</b> nr)</font>  {
      <b>int</b> k;
  &nbsp;
  <font color="#0000FF">//if node is situated in the first 
  //section then <b>P[node] = 1</b></font>
  <font color="#0000FF">//if node is situated at the beginning
  //of some section then <b>P[node] = T[node]</b></font>
  <font color="#0000FF">//if none of those two cases occurs, then 
  //<b>P[node] = P[T[node]]</b></font>
      <b>if</b> (L[node] &lt; nr)
          P[node] = 1;
      <b>else</b>
  <b>        if</b>(!(L[node] % nr))
              P[node] = T[node];
  <b>        else</b>
              P[node] = P[T[node]];
  &nbsp;
     <b>for</b> each son k of node
         dfs(k, T, N, P, L, nr);
  }
</pre>

Now, we can easily make queries. For finding <b>LCA(x, y)</b> we we will first find in what section it 
lays, and then trivially compute it. Here is the code:

<pre class="code">
  int LCA(<b>int</b> T[MAXN], <b>int</b> P[MAXN], <b>int </b>L[MAXN], <strong>int</strong> x, <strong>int</strong> y)
  {
  <font color="#0000FF">//as long as the node in the next section of 
  //x and y is not one common ancestor</font>
  <font color="#0000FF">//we get the node situated on the smaller 
  //lever closer</font>
  &nbsp;&nbsp;&nbsp;<strong> while</strong> (P[x] != P[y])
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <strong>if</strong> (L[x] &gt; L[y])
             x = P[x];
<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   else</strong>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	       y = P[y];
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  <font color="#0000FF">//now they are in the same section, so we trivially compute the LCA</font>
      <strong>while </strong>(x != y)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>  if </b>(L[x] &gt; L[y])
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   x = T[x];
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>  else</strong>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   y = T[y];
&nbsp;&nbsp;&nbsp;   <strong>return </strong>x;
  }
</pre>

This function 
makes at most<b> 2 * sqrt(H)</b> operations. Using this approach we get an <b>&lt;O(N), 
O(sqrt(H))&gt;</b> algorithm, where <b>H</b> is the height of the tree. In the worst case 
<b>H 
= N</b>, so the overall complexity is <b>&lt;O(N), O(sqrt(N))&gt;</b>. The main advantage of 
this algorithm is quick coding (an average Division 1 coder shouldn't need more 
than 15 minutes to code it).
<br />
<br />

<a name="Another easy solution in O(N logN, O(logN)"></a><span class="bodySubtitle">Another easy solution in &lt;O(N logN, O(logN)&gt;</span><br />

If we need a faster solution for this problem we could use dynamic programming. First, let's compute a table 
P[1,N][1,logN] where P[i][j] is the 2<sup>j</sup>-th ancestor of i. For computing this value we may use the following recursion:
<br />
<br />

<div align="center"><img border="0" width="273" height="48" src="i/education/lca/LCA_005.gif"></div>
<br /><br />
The preprocessing function should look like this:

<pre class="code">

  <b>void</b> process3(<b>int</b> N, <b>int</b> T[MAXN], <b>int</b> P[MAXN][LOGMAXN])
  {
  &nbsp;&nbsp;&nbsp; <b>int</b> i, j;
  &nbsp;
  <font color="#0000FF">//we initialize every element in P with -1</font>
  &nbsp;&nbsp;&nbsp; <b>for</b> (i = 0; i &lt; N; i++)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>for</b> (j = 0; 1 &lt;&lt; j &lt; N; j++)
  &nbsp;&nbsp;&nbsp;&nbsp;        P[i][j] = -1;
  &nbsp;
  <font color="#0000FF">//the first ancestor of every node i is T[i]</font>
  &nbsp;&nbsp;&nbsp; <b>for</b> (i = 0; i &lt; N; i++)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; P[i][0] = T[i];
  &nbsp;
  <font color="#0000FF">//bottom up dynamic programing</font>
      <b>for</b> (j = 1; 1 &lt;&lt; j &lt; N; j++)
  &nbsp;&nbsp;&nbsp;    <b>for </b>(i = 0; i &lt; N; i++)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>if </b>(P[i][j - 1] != -1)
                 P[i][j] = P[P[i][j - 1]][j - 1];
  }
  </pre>

This takes <b>O(N logN)</b> time and space. Now let's see how we can make queries. Let <b>L[i] </b>
be the level of node<b> i</b> in the tree. We must observe that if <b>p</b> and
<b>q</b> are on the same level in the tree we can compute <b>LCA(p, q)</b> using 
a meta-binary search. So, for every power <b>j</b> of <b>2 (</b>between <b>
log(L[p]) </b>and <b>0, </b>in descending order), if <b>P[p][j] != P[q][j] </b>
then we know that <b>LCA(p, q) </b>is on a higher level and we will continue 
searching for <b>LCA(p = P[p][j], q = P[q][j])</b>. At the end, both <b>p </b>
and <b>q</b> will have the same father, so return <b>T[p]</b>. Let's see what 
happens if <b>L[p] != L[q]</b>. Assume, without loss of generality, that <b>L[p] 
&lt; L[q]</b>. We can use the same meta-binary search&nbsp; for finding the 
ancestor of <b>p</b> situated on the same level with <b>q</b>, and then we can 
compute the <b>LCA </b>&nbsp;as described below. Here is how the query function 
should look:

<pre class="code">

  <b>int</b> query(<b>int</b> N, <b>int</b> P[MAXN][LOGMAXN], <b>int</b> T[MAXN], 
  <b>int</b> L[MAXN], <b>int</b> p, <b>int</b> q)
  {
  &nbsp;&nbsp;&nbsp; <b>int</b> tmp, log, i;
  &nbsp;
  <font color="#0000FF">//if p is situated on a higher level than q then we swap them</font>
      <b>if</b> (L[p] &lt; L[q])
          tmp = p, p = q, q = tmp;
  
  <font color="#0000FF">//we compute the value of [log(L[p)]</font>
  &nbsp;&nbsp;&nbsp;&nbsp;<b>for</b> (log = 1; 1 &lt;&lt; log &lt;= L[p]; log++);
  &nbsp;&nbsp;&nbsp; log--;
  &nbsp;
  <font color="#0000FF">//we find the ancestor of node p situated on the same level
  //with q using the values in P</font>
  &nbsp;&nbsp;&nbsp; <b>for</b> (i = log; i &gt;= 0; i--)
  &nbsp;&nbsp;&nbsp;&nbsp;    <b>if</b> (L[p] - (1 &lt;&lt; i) &gt;= L[q])
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <b>p</b> = P[p][i];
  &nbsp;
  &nbsp;&nbsp;&nbsp; <b>if</b> (p == q)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return p;
  &nbsp;
  <font color="#0000FF">//we compute LCA(p, q) using the values in P</font>
      <b>for</b> (i = log; i &gt;= 0; i--)
  &nbsp;&nbsp;&nbsp;&nbsp;    <b>if</b> (P[p][i] != -1 &amp;&amp; P[p][i] != P[q][i])
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     p = P[p][i], q = P[q][i];
  &nbsp;
  &nbsp;&nbsp;&nbsp; <b>return</b> T[p];
  }
</pre>

Now, we can see that this function makes at most <b>2 * log(H)</b> operations, where <b>H</b> is the height of the 
tree. In the worst case <b>H = N</b>, so the overall complexity of this 
algorithm is <b>&lt;O(N logN), O(logN)&gt;</b>. This solution is easy to code too, and 
it's faster than the previous one.
<br /><br />
<a name="Reduction from LCA to RMQ"></a><span class="bodySubtitle">Reduction from LCA to RMQ</span><br />
Now, let's show how we can use RMQ for computing LCA queries. Actually, we will reduce the LCA problem to RMQ in 
linear time, so every algorithm that solves the RMQ problem will solve the LCA 
problem too. Let's show how this reduction can be done using an example:
<br /><br />
<div align="center"><img width="322" height="501" src="i/education/lca/LCA_006.gif"></div>
<br /><br />
<div align="center"><A href="i/education/lca/LCA_007.gif" target="_blank"><img width="510" height="93" src="i/education/lca/LCA_007.gif"></A><br>
click to enlarge image</div>
<br /><br />
Notice that <b>LCA<sub>T</sub>(u, v)</b> is the closest node from the root encountered between the visits of <b>u</b> and <b>v</b> during 
a depth first search of <b>T</b>. So, we can consider all nodes between any two indices 
of <b>u</b> and <b>v </b>in the Euler Tour of the tree and then find the node situated on the 
smallest level between them. For this, we must build three arrays:
<ul>
<li><b>E[1, 2*N-1]</b> - the nodes visited in an Euler Tour of <b>T</b>; <b>E[i]</b> is the label of
<b>i-th</b> visited node in the tour</li>
<li><b>L[1, 2*N-1]</b> - the levels of the nodes visited in the Euler Tour; <b>L[i] 
</b>is the level of node <b>E[i]</b></li>
<li><b>H[1, N] - H[i] </b>is the index of the first occurrence of node <b>i</b> in <b>E</b> (any 
occurrence would be good, so it's not bad if we consider the first one)</li></ul>

Assume that <b>H[u] &lt; H[v]</b> (otherwise you must swap <b>u</b> and <b>v</b>). It's easy to see that the nodes between the first 
occurrence of <b>u</b> and the first occurrence of <b>v</b> are <b>E[H[u]...H[v]]</b>. Now, we must 
find the node situated on the smallest level. For this, we can use <b>RMQ</b>. So, 
<b>LCA<sub>T</sub>(u, v) = E[RMQ<sub>L</sub>(H[u], H[v])]</b> (remember that RMQ returns the index). Here 
is how <b>E</b>, <b>L</b> and <b>H</b> should look  for the example:
<br />
<br />
<div align="center"><A href="i/education/lca/LCA_008.gif" target="_blank"><img width="510" height="246" src="i/education/lca/LCA_008.gif"></A><br>
click to enlarge image</div>
<br /><br />
Notice that consecutive elements in L differ by exactly 1.
<br /><br />
<a name="From RMQ to LCA"></a><span class="bodySubtitle">From RMQ to LCA</span><br />
We have shown that the LCA problem can be reduced to RMQ in linear time. Here we will show how we 
can reduce the RMQ problem to LCA. This means that we actually can reduce the 
general RMQ to the restricted version of the problem (where consecutive elements 
in the array differ by exactly 1). For this we should use cartesian trees.
<br /><br />

A Cartesian Tree of an array <b>A[0, N - 1]</b> is a binary tree <b>C(A)&nbsp;</b> whose root is a minimum element of <b>A</b>, labeled with the 
position<b> i</b> of this minimum. The left child of the root is the Cartesian Tree of 
<b>A[0, i - 1]</b> if <b>i &gt; 0</b>, otherwise there's no child. The right child is defined similary for 
<b>A[i + 1, N 
- 1]</b>. Note that the Cartesian Tree is not necessarily unique if<b> A</b> contains equal 
elements. In this tutorial the first appearance of the minimum value will be 
used, thus the Cartesian Tree will be unique.&nbsp; It's easy to see now that <b>RMQ<sub>A</sub>(i, j) = LCA<sub>C</sub>(i, 
j)</b>.
<br />
<br />
Here is an example:
<br /><br />
<div align="center"><img width="421" height="134" src="i/education/lca/LCA_009.gif"></div>
<br /><br />
<div align="center"><img width="298" height="562" src="i/education/lca/LCA_010.gif"></div>
<br /><br />
Now we only have to compute <b>C(A)</b> in 
linear time. This can be done using a stack. At the beginning the stack is empty. We 
will then insert the elements of <b>A</b> in the stack. At the <b>i-th</b> step 
<b>A[i] </b>will be 
added next to the last element in the stack that has a smaller or equal 
value to <b>A[i]</b>, and all the greater elements will be removed. The element that was in 
the stack on the position of <b>A[i] </b>before the insertion was done will become the 
left son of <b>i</b>, and <b>A[i] </b>will become the right son of the smaller element behind 
him. At every step the first element in the stack is the root of the cartesian 
tree. It's easier to build the tree if the stack will hold the indexes of the 
elements, and not their value.
<br />
<br />
Here is how the stack will look at each step for the example above:
<br />
<br />

<div align="center">
  <table border="1" cellspacing="0" cellpadding="0" width="400" bordercolor="#999999" height="580">
    <tr>
      <td nowrap valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #CCCCCC" width="25" height="35">
      Step
	  </td>
      <td nowrap valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #CCCCCC" width="49" height="35">
      Stack
	  </td>
      <td nowrap valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #CCCCCC" width="228" height="35">
      Modifications made in the tree</td>
    </tr>
    <tr>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="25" height="35">
      0</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="49" height="35">
      0</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="228" height="35">
      0 is the 
      only node in the tree.</td>
    </tr>
    <tr>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="25" height="28">
      1</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="49" height="28">
      0 1</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="228" height="28">
      1 is added 
      at the end of the stack. Now, 1 is the right son of 0.</td>
    </tr>
    <tr style="height: 1.0pt">
      <td valign="top" style="height: 65; border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="25">
      2</td>
      <td valign="top" style="height: 65; border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="49">
      0 2</td>
      <td valign="top" style="height: 65; border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="228">
      2 is added next to 0, and 1 is removed (A[2] &lt; A[1]). Now, 2 is the right son of 0 
      and the left son of 2 is 1.</td>
    </tr>
    <tr>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="25" height="80">
      3</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="49" height="80">
      3</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="228" height="80">
      A[3] is the smallest element in the vector so far, so all elements in the stack 
      will be removed and 3 will become the root of the tree. The left child of 
      3 is 0.</td>
    </tr>
    <tr>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="25" height="50">
      4</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="49" height="50">
      3 4</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="228" height="50">
      4 is 
      added next to 3, and the right son of 3 is 4.</td>
    </tr>
    <tr>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="25" height="50">
      5</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="49" height="50">
      3 4 5</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="228" height="50">
      5 is 
      added next to 4, and the right son of 4 is 5.</td>
    </tr>
    <tr>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="25" height="50">
      6</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="49" height="50">
      3 4 5 6</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="228" height="50">
      6 is added next to 5, and the right son of 5 is 6.</td>
    </tr>
    <tr>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="25" height="50">
      7</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="49" height="50">
      3 4 5 6 7</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="228" height="50">
      7 is added next to 6, and the right son of 6 is 7.</td>
    </tr>
    <tr>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="25" height="65">
      8</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="49" height="65">
      3 8</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="228" height="65">
      8 is 
      added next to 3, and all greater elements are removed. 8 is now the right 
      child of 3 and the left child of 8 is 4.</td>
    </tr>
    <tr>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="25" height="50">
      9</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="49" height="50">
      3 8 9</td>
      <td valign="top" style="border: 1.0pt solid #999999; padding-left: 11.25pt; padding-right: 11.25pt; padding-top: 7.5pt; padding-bottom: 7.5pt; background: #EEEEEE" width="228" height="50">
      9 is added next to 8, and the right son of 8 is 9.</td>
    </tr>
  </table>
</div>
<br />

Note that every element in <b>A</b> is only added once and removed at most once, so the complexity of this algorithm is <b>O(N)</b>. 
Here is how the tree-processing function will look:

<pre class="code">
  <b>void </b>computeTree(<b>int</b> A[MAXN], <b>int</b> N, <b>int</b> T[MAXN])</font></p>  {
  &nbsp;&nbsp;&nbsp; <b>int</b> st[MAXN], i, k, top = -1;
  &nbsp;
  <font color="#0000FF">//we start with an empty stack</font>
  <font color="#0000FF">//at step <b>i</b> we insert <b>A[i]</b> in the stack</font>
  &nbsp;&nbsp;&nbsp; <b>for</b> (i = 0; i &lt; N; i++)
  &nbsp;&nbsp;&nbsp; {
  <font color="#0000FF">//compute the position of the first element that is 
  //equal or smaller than <b>A[i]</b></font>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; k = top;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>while</b> (k &gt;= 0 &amp;&amp; A[st[k]] &gt; A[i])
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; k--;
  <font color="#0000FF">//we modify the tree as explained above</font>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>if</b> (k != -1)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T[i] = st[k];
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>if</b> (k &lt; top)
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T[st[k + 1]] = i;
  <font color="#0000FF">//we insert <b>A[i]</b> in the stack and remove 
  //any bigger elements</font>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; st[++k] = i;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; top = k;
  &nbsp;&nbsp;&nbsp; }
  <font color="#0000FF">//the first element in the stack is the root of 
  //the tree, so it has no father</font>
  &nbsp;&nbsp;&nbsp; T[st[0]] = -1;
  }
  &nbsp;
</pre>

<a name="A O(N), O(1) algorithm for the restricted RMQ"></a><span class="bodySubtitle">An&lt;O(N), O(1)&gt; algorithm for the restricted RMQ</span><br>
Now we know that the general RMQ 
problem can be reduced to the restricted version using LCA. Here, consecutive 
elements in the array differ by exactly 1. We can use this and give a fast <b>&lt;O(N), 
O(1)&gt; </b>algorithm. From now we will solve the RMQ problem for an array <b>
A[0, N - 1]</b> where&nbsp; <b>|A[i] - A[i + 1]| = 1</b>,
<b>i = [1, N - 1]</b>. We transform <b>A</b> in a binary array with <b>N-1</b> 
elements, where <b>A[i] = A[i] - A[i + 1]</b>. It's obvious that elements in <b>
A </b>can be just <b>+1</b> or <b>-1</b>. Notice that the old value of <b>A[i]
</b>is now the sum of <b>A[1]</b>, <b>A[2]</b> .. <b>A[i]</b> plus the old<b> 
A[0]</b>. However, we won't need the old values from now on.
<br /><br />
To solve this restricted version of 
the problem we need to partition <b>A</b> into blocks of size <b>l = [(log N) / 2]</b>. Let
<b>A'[i]</b> be the minimum value for the<b> i-th</b> block in <b>A </b>and <b>B[i]</b> be the position of 
this minimum value in <b>A</b>. Both <b>A</b> and <b>B</b> are <b>N/l</b> long. Now, we preprocess 
<b>A'</b> using 
the ST algorithm described in Section1. This will take <b>O(N/l * log(N/l)) = O(N)</b> 
time and space. After this preprocessing we can make queries that span over 
several blocks in <b>O(1)</b>. It remains now to show how the in-block queries can be 
made. Note that the length of a block is <b>l = [(log N) / 2]</b>, which is quite small. 
Also, note that <b>A</b> is a binary array. The total number of binary arrays 
of size <b>l</b> is <b>2<sup>l</sup>=sqrt(N)</b>. So, for each binary block of size 
<b>l</b> we need 
to lock up in a table <b>P</b> the value for RMQ between every pair of indices. This 
can be trivially computed in <b>O(sqrt(N)*l<sup>2</sup>)=O(N</b>) time and space. To 
index table<b> P</b>, preprocess the type of each block in<b> A</b> and store it in array 
<b>T[1, 
N/l]</b>. The block type is a binary number obtained by replacing -1 with 0 and +1 
with 1.
<br />
<br />
Now, to answer <b>RMQ<sub>A</sub>(i, j) 
</b>we have two cases:
<ul>
<li><b>i </b>and <b>j</b> are in the same block, so we use the value computed in <b>P</b> and 
<b>T</b></li>
<li><b>i</b> and<b> j</b> are in different blocks,&nbsp; so we compute three values: the minimum 
from <b>i</b> to the end of <b>i's </b>block using <b>P</b> and <b>T</b>, the minimum of all blocks between
<b>i's</b> and j<b>'s </b>block using precomputed queries&nbsp; on<b> A'</b> and the minimum from the begining of 
<b>j's</b> block to <b>j</b>, again using<b> T</b> and <b>P</b>; finally return the position 
where the overall minimum is using the three values you just computed.</li></ul>

<a name="Conclusion"></a><span class="bodySubtitle">Conclusion</span><br>
RMQ and LCA are strongly related problems that can be reduced one to another. Many algorithms can be used to 
solve them, and they can be adapted to other kind of problems as well.
<br />
<br />
Here are some training problems for segment trees, LCA and RMQ:
<br /><br />

SRM 310 -&gt; <a href="http://www.topcoder.com/stat?c=problem_statement&pm=6551&rd=9990">Floating Median</a><br />
<a href="<tc-webtag:linkTracking link="http://acm.pku.edu.cn/JudgeOnline/problem?id=1986"/>" refer="lowestCommonAncestor"/>http://acm.pku.edu.cn/JudgeOnline/problem?id=1986</a><br />
<a href="<tc-webtag:linkTracking link="http://acm.pku.edu.cn/JudgeOnline/problem?id=2374"/>" refer="lowestCommonAncestor"/>http://acm.pku.edu.cn/JudgeOnline/problem?id=2374</a><br />
<a href="<tc-webtag:linkTracking link="http://acmicpc-live-archive.uva.es/nuevoportal/data/problem.php?p=2045"/>" refer="lowestCommonAncestor"/>http://acmicpc-live-archive.uva.es/nuevoportal/data/problem.php?p=2045</a><br />
<a href="<tc-webtag:linkTracking link="http://acm.pku.edu.cn/JudgeOnline/problem?id=2763"/>" refer="lowestCommonAncestor"/>http://acm.pku.edu.cn/JudgeOnline/problem?id=2763</a><br />
<a href="<tc-webtag:linkTracking link="http://www.spoj.pl/problems/QTREE2/"/>" refer="lowestCommonAncestor"/>http://www.spoj.pl/problems/QTREE2/</a><br />
<a href="<tc-webtag:linkTracking link="http://acm.uva.es/p/v109/10938.html"/>" refer="lowestCommonAncestor"/>http://acm.uva.es/p/v109/10938.html</a><br />
<a href="<tc-webtag:linkTracking link="http://acm.sgu.ru/problem.php?contest=0&problem=155"/>" refer="lowestCommonAncestor"/>http://acm.sgu.ru/problem.php?contest=0&amp;problem=155</a><br />
<br /><br />
 
<span class="bodySubtitle">References</span><br>
- "<A href="<tc-webtag:linkTracking link="http://www.bio.ifi.lmu.de/~fischer/fischer06theoretical.pdf"/>" refer="lowestCommonAncestor"/>Theoretical and Practical Improvements on the RMQ-Problem, with Applications to LCA and LCE</A>" [PDF] by Johannes Fischer and Volker Heunn<br />
- "<A href="<tc-webtag:linkTracking link="http://www.math.tau.ac.il/~haimk/seminar04/LCA-seminar-modified.ppt"/>" refer="lowestCommonAncestor"/>The LCA Problem Revisited</A>" [PPT] by Michael A.Bender and Martin Farach-Colton - a very good presentation, ideal for quick learning of some LCA and RMQ aproaches<br />
- "<A href="<tc-webtag:linkTracking link="http://www.cis.njit.edu/~czumaj/PUBLICATIONS/Czumaj-Kowaluk-Lingas-TCS-Summer-2005-r1-Aug-21-2006.pdf"/>" refer="lowestCommonAncestor"/>Faster algorithms for finding lowest common ancestors in directed acyclic graphs</A>" [PDF] by Artur Czumaj, Miroslav Kowaluk and Andrzej Lingas

<br /><br />
<p>&nbsp</p>
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