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
                <tc-webtag:forumLink forumID="506253" message="Discuss this article" /><br />
                <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
            </div>


<span class="bodyTitle">Power up C++ with the Standard Template Library: <br>Part II: Advanced Uses</span>


<img src="/i/m//DmitryKorolev_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21749340" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />

<br />
In this tutorial we will use some macros and typedefs from <a href="/tc?module=Static&d1=tutorials&d2=standardTemplateLibrary">Part I</a> of the tutorial.
<br /><br />
&nbsp;<a href="#creating">Creating Vector from Map</a><br />
&nbsp;<a href="#copying">Copying Data Between Containers</a><br />
&nbsp;<a href="#merging">Merging Lists</a><br />
&nbsp;<a href="#calculating">Calculating Algorithms</a><br />
&nbsp;<a href="#nontrivial">Nontrivial Sorting</a><br />
&nbsp;<a href="#using">Using Your Own Objects in Maps and Sets</a><br />
&nbsp;<a href="#memory">Memory Management in Vectors</a><br />
&nbsp;<a href="#algorithms">Implementing Real Algorithms with STL</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#dfs">Depth-first Search (DFS)</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#other">A word on other container types and their usage</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#queue">Queue</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#bfs">Breadth-first Search (BFS)</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#priority">Priority_Queue</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#dijkstra1">Dijkstra</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#dijkstra2">Dijkstra priority_queue</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#dijkstra3">Dijkstra by set</a><br />
&nbsp;<a href="#summary">What Is Not Included in STL</a><br />
<br />

<a name="creating"></a><span class="bodySubtitle">Creating Vector from Map</span><br />
As you already know, map actually contains pairs of element. So you can write
it in like this: 

<pre class="code"> map&lt;string, int&gt; M; 
 // ... 
 vector&lt; pair&lt;string, int&gt; &gt; V(all(M)); // remember all(c) stands for 
 (c).begin(),(c).end()&nbsp;</pre>

Now vector will contain the same elements as map. Of course, vector will be sorted, as is
map. This feature may be useful if you are not planning to change elements in
map any more but want to use indices of elements in a way that is impossible in
map. <br /><br />

<a name="copying"></a><span class="bodySubtitle">Copying data between containers</span><br />
Let's take a look at the copy(...) algorithm. The
prototype is the following: 

<pre class="code"> copy(from_begin, from_end, to_begin); </pre>

This algorithm copies elements from the first interval to the second one. The second
interval should have enough space available. See the following code:

<pre class="code"> vector&lt;int&gt; v1;
 vector&lt;int&gt; v2; 
 &nbsp;
 // ... 
 &nbsp;
 // Now copy v2 to the end of v1
 v1.resize(v1.size() + v2.size()); 
 // Ensure v1 have enough space 
 copy(all(v2), v1.end() - v2.size()); 
 // Copy v2 elements right after v1 ones 
 &nbsp;</pre>

Another good feature to use in conjunction with copy is inserters. I will not describe it here due to
limited space but look at the code:

<pre class="code"> vector&lt;int&gt; v; 
 // ... 
 set&lt;int&gt; s; 
 // add some elements to set
 copy(all(v), inserter(s)); 
</pre>

The last line means: 

<pre class="code"> tr(v, it) { 
// remember traversing macros from Part I
      s.insert(*it); 
 } 
&nbsp;</pre>

But why use our own macros (which work only in gcc) when
there is a standard function? It&#8217;s a good STL practice to use standard
algorithms like copy, because it will be easy to others to understand your code.
<br /><br />

To insert elemements to vector with push_back
use back_inserter, or front_inserter is available for deque
container. And in some cases it is useful to remember that the
first two arguments for &#8216;copy&#8217; may be not only begin/end, but also rbegin/rend, which copy data in reverse order.
<br /><br />

<a name="merging"></a><span class="bodySubtitle">Merging lists</span><br />
Another common task is to operate with sorted lists of
elements. Imagine you have two lists of elements -- A and B, both ordered. You
want to get a new list from these two. There are four common operations
here: 

<ul><li>'union' the lists, R = A+B</li>
<li>intersect the lists, R = A*B</li>
<li>set difference, R = A*(~B) or R = A-B</li>
<li>set symmetric difference, R = A XOR B</li></ul>

STL provides four algorithms for these tasks: set_union(...), set_intersection(...), set_difference(...) and set_symmetric_difference(...).
They all have the same calling conventions, so let's look at set_intersection. A free-styled prototype would look like
this: 

<pre class="code">end_result = set_intersection(begin1, end1, begin2, end2, begin_result);</pre>

Here [begin1,end1) and [begin2,end2) are the input lists.
The 'begin_result' is the iterator
from where the result will be written. But the size of the result is unknown,
so this function returns the end iterator of output
(which determines how many elements are in the result). See the example for
usage details: 

<pre class="code">
int data1[] = { 1, 2, 5, 6, 8, 9, 10 }; 
int data2[] = { 0, 2, 3, 4, 7, 8, 10 }; 
&nbsp;
vector&lt;int&gt; v1(data1, data1+sizeof(data1)/sizeof(data1[0]));
vector&lt;int&gt; v2(data2, data2+sizeof(data2)/sizeof(data2[0])); 
&nbsp;
vector&lt;int&gt; tmp(max(v1.size(), v2.size()); 
&nbsp;
vector&lt;int&gt; res = vector&lt;int&gt; (tmp.begin(), set_intersection(all(v1), all(v2), tmp.begin());
</pre>

Look at the
last line. We construct a new vector named 'res'. It is constructed via interval
constructor, and the beginning of the interval will be the beginning of tmp. The end of the interval is the result of the set_intersection algorithm. This algorithm will intersect
v1 and v2 and write the result to the output iterator,
starting from 'tmp.begin()'.
Its return value will actually be the end of the interval that forms the
resulting dataset. 
<br /><br />

One comment that might help you
understand it better: If you would like to just get the number of elements in
set intersection, use int cnt
= set_intersection(all(v1), all(v2), tmp.begin()) &#8211; tmp.begin();
<br /><br />

Actually, I would never use a construction like ' vector&lt;int&gt; tmp'. I don't think it's a good idea to allocate memory for
each set_*** algorithm invoking. Instead, I define the
global or static variable of appropriate type and enough size. See below:


<pre class="code">
set&lt;int&gt; s1, s2; 
for(int i = 0; i &lt; 500; i++) { 
        s1.insert(i*(i+1) % 1000); 
        s2.insert(i*i*i % 1000); 
} 
&nbsp;
static int temp[5000]; // greater than we need 
&nbsp;
vector&lt;int&gt; res = vi(temp, set_symmetric_difference(all(s1), all(s2), temp)); 
int cnt = set_symmetric_difference(all(s1), all(s2), temp) &#8211; temp;
&nbsp;
</pre>

Here 'res' will contain the symmetric difference of the input datasets.
<br /><br />
Remember, input datasets need to be sorted to use these algorithms.
So, another important thing to remember
is that, because sets are always ordered, we can use set-s (and even map-s, if
you are not scared by pairs) as
parameters for these algorithms.
<br /><br />
These algorithms work in single pass, in O(N1+N2), when N1 and N2 are sizes of input datasets. 
<br />
<br />

<a name=calculating></a><span class="bodySubtitle">Calculating Algorithms</span><br />
Yet another interesting algorithm is accumulate(...).
If called for a vector of int-s and third parameter
zero, accumulate(...) will return the sum of elements
in vector: 

<pre class="code">
vector&lt;int&gt; v; 
// ... 
int sum = accumulate(all(v), 0); 
</pre>

The result of accumulate() call always has the type of its third
argument. So, if you are not sure that the sum fits in integer, specify the
third parameter's type directly: 

<pre class="code">
vector&lt;int&gt; v; 
// ... 
long long sum = accumulate(all(v), (long long)0); &nbsp;</pre>

Accumulate can even calculate the product of values. The fourth parameter holds the
predicate to use in calculations. So, if you want the product: 

<pre class="code">
vector&lt;int&gt; v; 
// ... 
double product = accumulate(all(v), double(1), multiplies&lt;double&gt;()); 
// don&#8217;t forget to start with 1 !
</pre>

Another interesting algorithm is
inner_product(...). It calculates the scalar product of two intervals.
For example: 

<pre class="code">
vector&lt;int&gt; v1; 
vector&lt;int&gt; v2; 
for(int i = 0; i &lt; 3; i++) { 
      v1.push_back(10-i); 
      v2.push_back(i+1); 
} 
int r = inner_product(all(v1), v2.begin(), 0); 
</pre>

'r' will hold (v1[0]*v2[0] + v1[1]*v2[1] + v1[2]*v2[2]),
or (10*1+9*2+8*3), which is 52. 
<br />
<br />

As for &#8216;accumulate&#8217; the type of return value for inner_product
is defined by the last parameter. The last parameter is the initial value for
the result. So, you may use inner_product for the hyperplane object in multidimensional space: just write inner_product(all(normal), point.begin(), -shift).
<br /><br />

It should be clear to you now that inner_product requires only
increment operation from iterators, so queues and
sets can also be used as parameters. Convolution filter, for calculating the
nontrivial median value, could look like this:

<pre class="code">
set&lt;int&gt; values_ordered_data(all(data));
int n = sz(data); // int n = int(data.size());
vector&lt;int&gt; convolution_kernel(n);
for(int i = 0; i &lt; n; i++) {
     convolution_kernel[i] = (i+1)*(n-i);
}
double result = double(inner_product(all(ordered_data), convolution_kernel.begin(), 0)) / accumulate(all(convolution_kernel), 0);
</pre>

Of course, this code is just an example -- practically speaking, it would be faster to copy values to another
vector and sort it.

<br /><br />

It's also possible to write a construction like this: 

<pre class="code">
vector&lt;int&gt; v; 
// ... 
int r = inner_product(all(v), v.rbegin(), 0); 
&nbsp;</pre>

This will evaluate V[0]*V[N-1] + V[1]+V[N-2] + ... + V[N-1]*V[0] where N is the
number of elements in 'v'. 
<br /><br />

<a name="nontrivial"></a><span class="bodySubtitle">Nontrivial Sorting</span><br />
Actually, sort(...) uses the same technique as all STL: 

<ul><li>all comparison is based on 'operator &lt;' </li></ul>

This means that you only need to override 'operator &lt;'. Sample code follows: 

<pre class="code">
struct fraction { 
      int n, d; // (n/d) 
      // ... 
      bool operator &lt; (const fraction&amp; f) const { 
           if(false) { 
                return (double(n)/d) &lt; (double(f.n)/f.d); 
                // Try to avoid this, you're the TopCoder! 
           } 
           else { 
                return n*f.d &lt; f.n*d; 
           } 
      } 
 }; 
 &nbsp;
 // ... 
 &nbsp;
 vector&lt;fraction&gt; v; 
 &nbsp;
 // ... 
 &nbsp;
 sort(all(v)); &nbsp;
 </pre>

In cases of nontrivial fields, your object should have default and copy constructor (and,
maybe, assignment operator -- but this comment is not for TopCoders).
<br /><br />

Remember the prototype of 'operator &lt;' : return type bool,
const modifier, parameter const reference.
<br /><br />

Another possibility is to create the comparison functor.
Special
comparison predicate may be passed to the sort(...)
algorithm as a third parameter.  Example:
sort points (that are pair&lt;double,double&gt;)
by polar angle. 

<pre class="code">
typedef pair&lt;double, double&gt; dd; 

const double epsilon = 1e-6;
 
struct sort_by_polar_angle { 
       dd center; 
       // Constuctor of any type 
       // Just find and store the center 
       template&lt;typename T&gt; sort_by_polar_angle(T b, T e) { 
            int count = 0;
            center = dd(0,0); 
            while(b != e) { 
                        center.first += b-&gt;first;
                        center.second += b-&gt;second;
                   b++; 
                count++;
            } 
                   double k = count ? (1.0/count) : 0;
            center.first *= k;
                   center.second *= k;
       } 
 // Compare two points, return true if the first one is earlier 
 // than the second one looking by polar angle 
 // Remember, that when writing comparator, you should 
 // override not &#8216;operator &lt;&#8217; but &#8216;operator ()&#8217; 
       bool operator () (const dd&amp; a, const dd&amp; b) const { 
            double p1 = atan2(a.second-center.second, a.first-center.first); 
            double p2 = atan2(b.second-center.second, b.first-center.first); 
            return p1 + epsilon &lt; p2; 
       } 
 }; 
 &nbsp;
 // ... 
 &nbsp;
 vector&lt;dd&gt; points; 
 &nbsp;
 // ... 
&nbsp;
       sort(all(points), sort_by_polar_angle(all(points)));&nbsp;</pre>

This code example is complex enough, but it does demonstrate the abilities of STL. I
should point out that, in this sample, all code will be inlined
during compilation, so it's actually really fast. 
<br /><br />

Also remember that 'operator &lt;' should always return false for equal
objects. It's very important &#8211; for the reason why, see the next section. 
<br /><br /> 

<a name="using"></a><span class="bodySubtitle">Using your own objects in Maps and Sets</span><br />

Elements in set and map are ordered. It's the general rule. So, if you want to enable using of your objects in set or map you should make them comparable. You already know the rule of comparisons in STL:
<br /><br />
| * all comparison is based on 'operator &lt;'
<br /><br />
Again, you should understand it in this way: "I only need to implement operator &lt; for objects to be stored in set/map."
<br /><br />

Imagine you are going to make the 'struct point' (or
'class point'). We want to intersect some line segments and make a set of
intersection points (sound familiar?). Due to finite computer precision, some
points will be the same while their coordinates differ a bit. That's what you
should write: 

<pre class="code">
const double epsilon = 1e-7; 
&nbsp;
&nbsp;
struct point { 
       double x, y; 
  
       // ... 
 &nbsp;
 &nbsp;
       // Declare operator &lt; taking precision into account 
       bool operator &lt; (const point&amp; p) const { 
            if(x &lt; p.x - epsilon) return true; 
            if(x &gt; p.x + epsilon) return false; 
            if(y &lt; p.y - epsilon) return true; 
            if(y &gt; p.y + epsilon) return false; 
            return false; 
       } 
 }; &nbsp;</pre>

Now you can use set&lt;point&gt; or map&lt;point, string&gt;, for example, to look
up whether some point is already present in the list of intersections. An even
more advanced approach: use map&lt;point, vector&lt;int&gt;
&gt; and list the list of indices of segments that intersect at this point. 
<br /><br />

It's an interesting concept that for STL
'equal' does not mean 'the same', but we will not delve into it here. 
<br /><br />

<a name="memory"></a><span class="bodySubtitle">Memory management in Vectors</span><br />

As has been said, vector does not reallocate memory on each push_back(). Indeed, when push_back()
is invoked, vector really allocates more memory than is needed for one
additional element. Most STL implementations of vector double in size when push_back()
is invoked and memory is not allocated. This may not be good in practical
purposes, because your program may eat up twice as much memory as you need.
There are two easy ways to deal with it, and one complex way to solve it. <br />
<br />
The first approach is to use the reserve() member
function of vector. This function orders vector to allocate additional memory.
Vector will not enlarge on push_back() operations until the size specified by reserve() will be
reached. <br />
<br />
Consider the following example. You have a vector of 1,000 elements and its
allocated size is 1024. You are going to add 50 elements to it. If you call push_back()
50 times, the allocated size of vector will be 2048 after this operation. But
if you write 

<pre class="code">v.reserve(1050); </pre>

before
the series of push_back(), vector will have an
allocated size of exactly 1050 elements. <br />
<br />
If you are a rapid user of push_back(), then reserve() is your friend. 
<br /><br />

By the way, it&#8217;s
a good pattern to use v.reserve() followed by copy(&#8230;, back_inserter(v))
for vectors.
<br /><br />

Another situation: after some manipulations with vector you have decided that
no more adding will occur to it. How do you get rid of the potential allocation
of additional memory? The solution follows: 

<pre class="code">
vector&lt;int&gt; v; 
// ... 
vector&lt;int&gt;(all(v)).swap(v); &nbsp;</pre>

This construction means the following: create a temporary vector with the same
content as v, and then swap this temporary vector with 'v'. After the swap the
original oversized v will be disposed. But, most
likely, you won&#8217;t need this during SRMs.<br />
<br />
The proper and complex solution is to develop your own allocator
for the vector, but that's definitely not a topic for a TopCoder
STL tutorial. <br />
<br />

<a name="algorithms"></a><span class="bodySubtitle">Implementing real algorithms with STL</span><br />

Armed with STL, let's go on to the most interesting part of this tutorial: how
to implement real algorithms efficiently. <br />
<br />

<a name="dfs"></a><span class="bodySubtitle">Depth-first search (DFS)</span><br /> 
I will not explain the theory of DFS here &#8211; instead, read 
<a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs2#depth">this section</a> of <tc-webtag:handle coderId="268851" context="algorithm"/>'s 
<a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs2">Introduction to Graphs and Data Structures</a> tutorial &#8211; but I will show you how STL can help. <br />
<br />
At first, imagine we have an undirected graph. The simplest way to store a
graph in STL is to use the lists of vertices adjacent to each vertex. This
leads to the vector&lt; vector&lt;int&gt; &gt; W
structure, where W[i] is a list of vertices adjacent
to i. Let&#8217;s verify our graph is connected via
DFS: 

<pre class="code">
/*
Reminder from Part 1:
typedef vector&lt;int&gt; vi;
typedef vector&lt;vi&gt; vvi;
*/

 int N; // number of vertices 
 vvi W; // graph 
 vi V; // V is a visited flag 
&nbsp;
 void dfs(int i) { 
       if(!V[i]) { 
            V[i] = true; 
            for_each(all(W[i]), dfs); 
       } 
 } 
 &nbsp;
 bool check_graph_connected_dfs() { 
       int start_vertex = 0; 
       V = vi(N, false); 
       dfs(start_vertex); 
       return (find(all(V), 0) == V.end()); 
 } 
</pre>

That&#8217;s all. STL algorithm 'for_each' calls the specified
function, 'dfs', for each element in range. In check_graph_connected() function we first make the Visited array (of correct size
and filled with zeroes). After DFS we have either visited all vertices, or not
&#8211; this is easy to determine by searching for at least one zero in V, by
means of a single call to find(). 
<br /><br />

Notice on for_each: the last argument of this algorithm can be almost
anything that &#8220;can be called like a function&#8221;. It may
be not only global function, but also adapters, standard algorithms, and even
member functions. In the last case, you will
need mem_fun or mem_fun_ref
adapters, but we will not touch on those now.<br />
<br />
One note on this code: I don't recommend the use of vector&lt;bool&gt;. Although in this particular case it&#8217;s quite
safe, you're better off not to use it. Use the predefined &#8216;vi&#8217;
(vector&lt;int&gt;). It&#8217;s quite OK to assign
true and false to int&#8217;s in vi.
Of course, it requires 8*sizeof(int)=8*4=32
times more memory, but it works well in most cases
and is quite fast on TopCoder.
<br />
<br />

<a name="other"></a><span class="bodySubtitle">A word on other container types and their usage</span><br />

Vector is so popular because it's the simplest array container.
In most cases you only require the functionality of an array from vector
&#8211; but, sometimes, you may need a more advanced container. <br />
<br />
It is not good practice to begin investigating the full functionality of some
STL container during the heat of a Single Round Match. If you are not familiar
with the container you are about to use, you'd be better off using vector or
map/set.  For example,
stack can always be implemented via vector, and it&#8217;s much
faster to act this way if you don&#8217;t remember the syntax of stack
container.<br />
<br />
STL provides the following containers: list, stack, queue, deque,
priority_queue. I&#8217;ve found list and deque quite useless in SRMs (except, probably, for very special tasks based
on these containers). But queue and priority_queue
are worth saying a few words about. <br />
<br />

<a name="queue"></a><span class="bodySubtitle">Queue</span><br />
Queue is a data type that has three operations, all in O(1)
amortized: 

add an element to front (to &#8220;head&#8221;)
remove an element from back (from &#8220;tail&#8221;)
get the first unfetched element (&#8220;tail&#8221;)

In other words, queue is the FIFO buffer. <br />
<br />

<a name="bfs"></a><span class="bodySubtitle">Breadth-first search (BFS)</span><br />
Again, if you are not familiar with the BFS algorithm, please refer back to 
<a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs2#breadth">this TopCoder tutorial</a> first.
Queue is very convenient to use in BFS, as shown below: 

<pre class="code">
/*
Graph is considered to be stored as adjacent vertices list.
Also we considered graph undirected.
&nbsp;
vvi is vector&lt; vector&lt;int&gt; &gt;
W[v] is the list of vertices adjacent to v
*/
&nbsp;
 int N; // number of vertices
 vvi W; // lists of adjacent vertices
  &nbsp;
  &nbsp;
 bool check_graph_connected_bfs() { 
      int start_vertex = 0; 
      vi V(N, false); 
      queue&lt;int&gt; Q; 
      Q.push(start_vertex); 
      V[start_vertex] = true; 
      while(!Q.empty()) { 
           int i = Q.front(); 
           // get the tail element from queue
           Q.pop(); 
           tr(W[i], it) { 
                if(!V[*it]) { 
                     V[*it] = true; 
                     Q.push(*it); 
                } 
           } 
      } 
      return (find(all(V), 0) == V.end()); 
 } &nbsp;</pre>

More precisely, queue supports front(), back(), push() (== push_back()), pop (== pop_front()). If you also need push_front() and pop_back(), use deque. Deque provides the listed operations in O(1) amortized.
<br /><br />
There is an interesting application of queue and map when implementing a shortest path
search via BFS in a complex graph. Imagine that we have the graph, vertices of
which are referenced by some complex object, like: 

<pre class="code">pair&lt; pair&lt;int,int&gt;, pair&lt; string, vector&lt; pair&lt;int, int&gt; &gt; &gt; &gt; 

 (this case is quite usual: complex data structure may define the position in 
 some game, Rubik&#8217;s cube situation, etc&#8230;)
 </pre>
Consider
we know that the path we are looking for is quite short, and the
total number of positions is also small. If all edges of this graph have the
same length of 1, we could use BFS to find a way in this graph. A section of
pseudo-code follows: 

<pre class="code">
// Some very hard data structure 
&nbsp;
typedef pair&lt; pair&lt;int,int&gt;, pair&lt; string, vector&lt; pair&lt;int, int&gt; &gt; &gt; &gt; POS; 
&nbsp;
// ... 
&nbsp;
int find_shortest_path_length(POS start, POS finish) { 
   &nbsp;
     map&lt;POS, int&gt; D; 
     // shortest path length to this position 
     queue&lt;POS&gt; Q; 
   &nbsp;
     D[start] = 0; // start from here 
     Q.push(start); 
   &nbsp;
     while(!Q.empty()) { 
          POS current = Q.front(); 
          // Peek the front element 
          Q.pop(); // remove it from queue 
   &nbsp;
          int current_length = D[current];
    
          if(current == finish) { 
               return D[current]; 
               // shortest path is found, return its length 
          } 

          tr(all possible paths from 'current', it) { 
               if(!D.count(*it)) { 
               // same as if(D.find(*it) == D.end), see Part I
                    // This location was not visited yet 
                    D[*it] = current_length + 1; 
               } 
          } 
     } 
	&nbsp;
     // Path was not found 
     return -1; 
} 

// ... 
	 </pre>

If the edges have different lengths, however, BFS will not work. We should use Dijkstra instead. It's possible to implement such a Dijkstra via priority_queue -- see below.
<br />
<br />

<a name="priority"></a><span class="bodySubtitle">Priority_Queue</span><br />
Priority queue is the binary heap. It's the data structure,
that can perform three operations: 

<ul><li>push any element (push)</li>
<li>view top element (top)</li>
<li>pop top element (pop)</li></ul>

For the application of STL's priority_queue see the <a
href="/stat?c=problem_statement&pm=6448&rd=9987">TrainRobber</a> problem from SRM 307. <br /><br />

<span class="bodySubtitle"><A name="dijkstra1"></a>Dijkstra</span><br />
In the last part of this tutorial I&#8217;ll describe how to efficiently implement Dijktra&#8217;s algorithm in sparse graph using STL
containers. Please look through <a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs3#dijkstra">this tutorial</a> for information on Dijkstra&#8217;s
algoritm.
<br /><br />
Consider we have a weighted directed graph that is stored as vector&lt;  vector&lt; pair&lt;int,int&gt; &gt; &gt; G, where
<ul><li>G.size() is the number of vertices in our graph</li>
<li>G[i].size() is the number of vertices directly reachable from vertex with index i</li>
<li>G[i][j].first is the index of j-th vertex reachable from vertex i</li>
<li>G[i][j].second is the length of the edge heading from vertex i to vertex G[i][j].first</li></ul>

We assume this, as defined in the following two code snippets:

<pre class="code">
typedef pair&lt;int,int&gt; ii;
typedef vector&lt;ii&gt; vii;
typedef vector&lt;vii&gt; vvii;</pre>

<span class="bodySubtitle"><A name="dijkstra2"></a>Dijstra via priority_queue</span><br />
Many thanks to <tc-webtag:handle coderId="8357090" context="algorithm"/> for spending the time
to explain to me why the complexity of this algorithm is good despite not removing deprecated entries from the queue.

<pre class="code">      
      vi D(N, 987654321); 
      // distance from start vertex to each vertex

      priority_queue&lt;ii,vector&lt;ii&gt;, greater&lt;ii&gt; &gt; Q; 
      // priority_queue with reverse comparison operator, 
      // so top() will return the least distance
      // initialize the start vertex, suppose it&#8217;s zero
      D[0] = 0;
      Q.push(ii(0,0));

      // iterate while queue is not empty
      while(!Q.empty()) {

            // fetch the nearest element
            ii top = Q.top();
            Q.pop();
                        
            // v is vertex index, d is the distance
            int v = top.second, d = top.first;

            // this check is very important
            // we analyze each vertex only once
            // the other occurrences of it on queue (added earlier) 
            // will have greater distance
            if(d &lt;= D[v]) {
                  // iterate through all outcoming edges from v
                  tr(G[v], it) {
                        int v2 = it-&gt;first, cost = it-&gt;second;
                        if(D[v2] &gt; D[v] + cost) {
                              // update distance if possible
                              D[v2] = D[v] + cost;
                              // add the vertex to queue
                              Q.push(ii(D[v2], v2));

                        }
                  }
            }
      }
</pre>

I will not comment on the algorithm itself in this tutorial, but you should notice the priority_queue object definition. Normally, priority_queue&lt;ii&gt; will work, but the top() member function will return the largest element, not
the smallest. Yes, one of the easy solutions I often use is just to store not distance but (-distance) in
the first element of a pair. But if you want to implement it in the &#8220;proper&#8221;
way, you need to reverse the comparison operation of priority_queue
to reverse one. Comparison function is the third template parameter of priority_queue while the second paramerer
is the storage type for container. So, you should write priority_queue&lt;ii,
vector&lt;ii&gt;, greater&lt;ii&gt; &gt;.
<br />
<br />

<span class="bodySubtitle"><A name="dijkstra3"></a>Dijkstra via set</span><br />
<tc-webtag:handle coderId="10574855" context="algorithm"/> gave me this idea when I asked him about efficient Dijkstra
implementation in C#. While implementing Dijkstra we use the priority_queue to add elements to the &#8220;vertices being analyzed&#8221; queue in O(logN) and fetch in O(log N). 
But there is a container besides priority_queue that can provide us with this functionality -- it&#8217;s &#8216;set&#8217;!
I&#8217;ve experimented a lot and found that the performance of Dijkstra based on priority_queue and set is the same.<br /><br />

So, here&#8217;s the code:

<pre class="code">
      vi D(N, 987654321);

      // start vertex
      set&lt;ii&gt; Q;
      D[0] = 0;
      Q.insert(ii(0,0));
&nbsp;
      while(!Q.empty()) {

           // again, fetch the closest to start element 
           // from &#8220;queue&#8221; organized via set
           ii top = *Q.begin();
           Q.erase(Q.begin());
           int v = top.second, d = top.first;
&nbsp;
           // here we do not need to check whether the distance 
           // is perfect, because new vertices will always
           // add up in proper way in this implementation

           tr(G[v], it) {
                int v2 = it-&gt;first, cost = it-&gt;second;
                if(D[v2] &gt; D[v] + cost) {
                     // this operation can not be done with priority_queue, 
                     // because it does not support DECREASE_KEY
                     if(D[v2] != 987654321) {
                           Q.erase(Q.find(ii(D[v2],v2)));
                     }
                     D[v2] = D[v] + cost;
                     Q.insert(ii(D[v2], v2));
                }
           }
      }
</pre>

One more important
thing: STL&#8217;s priority_queue
does not support the DECREASE_KEY operation. If you will need this
operation, &#8216;set&#8217; may be your best bet.<br />
<br />

I&#8217;ve spent a lot of time to understand why the code that removes elements from queue (with set)
works as fast as the first one.<br /><br />

These two implementations have the same complexity and work in
the same time. Also, I&#8217;ve set up practical experiments and the
performance is exactly the same (the difference is about ~%0.1 of time).
<br /><br />

As for me, I prefer to
implement Dijkstra via &#8216;set&#8217; because with
&#8216;set&#8217; the logic is simpler to understand, and we don&#8217;t need
to remember about &#8216;greater&lt;int&gt;&#8217;
predicate overriding.
<br /><br />

<a name="summary"></a><span class="bodySubtitle">What is not included in STL</span><br />
If you have made it this far in the tutorial, I hope you have seen that STL is
a very powerful tool, especially for TopCoder SRMs. But before you embrace STL wholeheartedly,
keep in mind what is NOT included in it. <br />
<br />
First, STL does not have BigInteger-s. If a task in
an SRM calls for huge calculations, especially multiplication and division, you
have three options: 
<ul><li>use a pre-written template</li>
<li>use Java, if you know it well</li>
<li>say &#8220;Well, it was definitely not my SRM!&#8221;</li></ul>

I would recommend option number one. <br />
<br />
Nearly the same issue arises with the geometry library. STL does not have
geometry support, so you have those same three options again.<br />
<br />
The last thing &#8211; and sometimes a very annoying thing &#8211; is that STL
does not have a built-in string splitting function. This is 
especially annoying, given that this function is included in the default
template for C++ in the ExampleBuilder plugin! But actually
I&#8217;ve found that the use of istringstream(s) in
trivial cases and sscanf(s.c_str(), &#8230;)
in complex cases is sufficient.<br />
<br />
Those caveats aside, though, I hope you have found this tutorial useful, and I
hope you find the STL a useful addition to your use of C++. Best
of luck to you in the Arena! 
<br /><br />
Note from the author: In both parts of this tutorial I recommend the
use of some templates to minimize
the time required to implement something. I
must say that this suggestion should always be up to the coder. Aside from whether templates are a good or bad tactic for SRMs, in everyday
life they can become annoying for other people who are trying to understand your code.
While I did rely on them for some time, ultimately I reached the decision to stop. I encourage you to weigh the pros and cons of templates and  to
consider this decision for yourself.
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