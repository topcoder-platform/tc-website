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


<span class="bodyTitle">Power up C++ with the Standard Template Library: Part I</span>


<img src="/i/m//DmitryKorolev_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21749340" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />

<br />
&nbsp;<a href="#containers">Containers</a><br />
&nbsp;<a href="#before">Before we begin</a><br />
&nbsp;<a href="#vector">Vector</a><br />
&nbsp;<a href="#pairs">Pairs</a><br />
&nbsp;<a href="#iterators">Iterators</a><br />
&nbsp;<a href="#compiling">Compiling STL Programs</a><br />
&nbsp;<a href="#manipulation">Data manipulation in Vector</a><br />
&nbsp;<a href="#string">String</a><br />
&nbsp;<a href="#set">Set</a><br />
&nbsp;<a href="#map">Map</a><br />
&nbsp;<a href="#notice">Notice on Map and Set</a><br />
&nbsp;<a href="#algorithms">More on algorithms</a><br />
&nbsp;<a href="#stringstreams">String Streams</a><br />
&nbsp;<a href="#summary">Summary</a><br /><br />


Perhaps you are already using C++ as your main programming language to solve TopCoder problems. This means that you have already used STL in a simple way, because arrays and strings are passed to your function as STL objects. You may have noticed, though, that many coders manage to write their code much more quickly and concisely than you.
<br /><br />
Or perhaps you are not a C++ programmer, but want to become one because of the great functionality of this language and its libraries (and, maybe, because of the very short solutions you've read in TopCoder practice rooms and competitions).
<br /><br />
Regardless of where you're coming from, this article can help. In it, we will review some of the powerful features of the Standard Template Library (STL) &ndash; a great tool that, sometimes, can save you a lot of time in an algorithm competition.
<br /><br />
The simplest way to get familiar with STL is to begin from its containers.
<br /><br />

<span class="bodySubtitle"><A name="containers"></A>Containers</span><br />

Any time you need to operate with many elements you require some kind of container. In native C (not C++) there was only one type of container: the array. 
<br /><br />
The problem is not that arrays are limited (though, for example, it&rsquo;s impossible to determine the size of array at runtime). Instead, the main problem is that many problems require a container with greater functionality.
<br /><br />
For example, we may need one or more of the following operations:
<ul><li>Add some string to a container.</li>
<li>Remove a string from a container.</li>
<li>Determine whether a string is present in the container.</li>
<li>Return a number of distinct elements in a container.</li>
<li>Iterate through a container and get a list of added strings in some order.</li></ul>

Of course, one can implement this functionality in an ordinal array. But the trivial implementation would be very inefficient. You can create the tree- of hash- structure to solve it in a faster way, but think a bit: does the implementation of such a container depend on elements we are going to store? Do we have to re-implement the module to make it functional, for example, for points on a plane but not strings? 
<br /><br />
If not, we can develop the interface for such a container once, and then use everywhere for data of any type. That, in short, is the idea of STL containers.
<br /><br />

<span class="bodySubtitle"><A name="before"></A>Before we begin</span><br />
When the program is using STL, it should #include the appropriate standard headers. For most containers the title of standard header matches the name of the container, and no extension is required. For example, if you are going to use stack, just add the following line at the beginning of your program:

<pre class="code">#include &lt;stack&gt;</pre>

Container types (and algorithms, functors and all STL as well) are defined not in global namespace, but in special namespace called &ldquo;std.&quot; Add the following line after your includes and before the code begin: 

<pre class="code">using namespace std;</pre>

Another important thing to remember is that the type of a container is the template parameter. Template parameters are specified with the &lsquo;&lt;&rsquo;/&rsquo;&gt;&rsquo; &quot;brackets&quot; in code. For example:

<pre class="code">vector&lt;int&gt; N;</pre>

When making nested constructions, make sure that the &quot;brackets&quot; are not directly following one another &ndash; leave a blank between them.

<pre class="code">vector&lt; vector&lt;int&gt; &gt; CorrectDefinition; 
vector&lt;vector&lt;int&gt;&gt; WrongDefinition; // Wrong: compiler may be confused by 'operator &gt;&gt;'</pre>

<span class="bodySubtitle"><A name="vector"></A>Vector</span><br />

The simplest STL container is vector. Vector is just an array with extended functionality. By the way, vector is the only container that is backward-compatible to native C code &ndash; this means that vector actually IS the array, but with some additional features.

<pre class="code"> vector&lt;int&gt; v(10); 
 for(int i = 0; i &lt; 10; i++) { 
      v[i] = (i+1)*(i+1); 
 } 
 for(int i = 9; i &gt; 0; i--) { 
      v[i] -= v[i-1]; 
 } </pre>

Actually, when you type

<pre class="code"> vector&lt;int&gt; v; </pre>

the empty vector is created. Be careful with constructions like this: 

<pre class="code"> vector&lt;int&gt; v[10]; </pre>

Here we declare 'v' as an array of 10 vector&lt;int&gt;&rsquo;s, which are initially empty. In most cases, this is not that we want. Use parentheses instead of brackets here.
The most frequently used feature of vector is that it can report its size.

<pre class="code"> int elements_count = v.size();  </pre>

Two remarks: first, size() is unsigned, which may sometimes cause problems. Accordingly, I usually define macros, something like sz(C) that returns size of C as ordinal signed int. Second, it&rsquo;s not a good practice to compare v.size() to zero if you want to know whether the container is empty. You're better off using empty() function:

<pre class="code"> bool is_nonempty_notgood = (v.size() &gt;= 0); // Try to avoid this
 bool is_nonempty_ok = !v.empty(); </pre>

This is because not all the containers can report their size in O(1), and you definitely should not require counting all elements in a double-linked list just to ensure that it contains at least one.
<br /><br />
Another very popular function to use in vector is push_back. Push_back adds an element to the end of vector, increasing its size by one. Consider the following example:

<pre class="code"> vector&lt;int&gt; v; 
 for(int i = 1; i &lt; 1000000; i *= 2) { 
      v.push_back(i); 
 } 
 int elements_count = v.size(); </pre>

Don&rsquo;t worry about memory allocation -- vector will not allocate just one element each time. Instead, vector allocates more memory then it actually needs when adding new elements with push_back. The only thing you should worry about is memory usage, but at TopCoder this may not matter. (More on vector&rsquo;s memory policy later.)
<br /><br />
When you need to resize vector, use the resize() function:

<pre class="code"> vector&lt;int&gt; v(20); 
 for(int i = 0; i &lt; 20; i++) { 
      v[i] = i+1; 
 } 
 v.resize(25); 
 for(int i = 20; i &lt; 25; i++) { 
      v[i] = i*2; 
 } </pre>

The resize() function makes vector contain the required number of elements. If you require less elements than vector already contain, the last ones will be deleted. If you ask vector to grow, it will enlarge its size and fill the newly created elements with zeroes.
<br /><br />
Note that if you use push_back() after resize(), it will add elements AFTER the newly allocated size, but not INTO it. In the example above the size of the resulting vector is 25, while if we use push_back() in a second loop, it would be 30.

<pre class="code"> vector&lt;int&gt; v(20); 
 for(int i = 0; i &lt; 20; i++) { 
      v[i] = i+1; 
 } 
 v.resize(25); 
 for(int i = 20; i &lt; 25; i++) { 
      v.push_back(i*2); // Writes to elements with indices [25..30), not [20..25) ! <
 } </pre>

To clear a vector use clear() member function. This function makes vector to contain 0 elements. It does not make elements zeroes -- watch out -- it completely erases the container.
<br /><br />
There are many ways to initialize vector. You may create vector from another vector:

<pre class="code"> vector&lt;int&gt; v1; 
 // ... 
 vector&lt;int&gt; v2 = v1; 
 vector&lt;int&gt; v3(v1); </pre>

The initialization of v2 and v3 in the example above are exactly the same.
<br /><br />
If you want to create a vector of specific size, use the following constructor:

<pre class="code"> vector&lt;int&gt; Data(1000); </pre>

In the example above, the data will contain 1,000 zeroes after creation. Remember to use parentheses, not brackets. If you want vector to be initialized with something else, write it in such manner:

<pre class="code"> vector&lt;string&gt; names(20, &ldquo;Unknown&rdquo;); </pre>

Remember that you can create vectors of any type.
<br /><br />
Multidimensional arrays are very important. The simplest way to create the two-dimensional array via vector is to create a vector of vectors.

<pre class="code"> vector&lt; vector&lt;int&gt; &gt; Matrix; </pre>

It should be clear to you now how to create the two-dimensional vector of given size:

<pre class="code"> int N, N; 
 // ... 
 vector&lt; vector&lt;int&gt; &gt; Matrix(N, vector&lt;int&gt;(M, -1)); </pre>

Here we create a matrix of size N*M and fill it with -1.
<br /><br />
The simplest way to add data to vector is to use push_back(). But what if we want to add data somewhere other than the end? There is the insert() member function for this purpose. And there is also the erase() member function to erase elements, as well. But first we need to say a few words about iterators.
<br /><br />
You should remember one more very important thing: When vector is passed as a parameter to some function, a copy of vector is actually created. It may take a lot of time and memory to create new vectors when they are not really needed. Actually, it&rsquo;s hard to find a task where the copying of vector is REALLY needed when passing it as a parameter. So, you should never write:

<pre class="code"> void some_function(vector&lt;int&gt; v) { // Never do it unless you&rsquo;re sure what you do! 
      // ... 
 } </pre>

Instead, use the following construction:

<pre class="code"> void some_function(const vector&lt;int&gt;&amp; v) { // OK 
      // ... 
 } </pre>

If you are going to change the contents of vector in the function, just omit the &lsquo;const&rsquo; modifier.

<pre class="code"> int modify_vector(vector&lt;int&gt;&amp; v) { // Correct 
      V[0]++; 
 } </pre>


<span class="bodySubtitle"><A name="pairs"></A>Pairs</span><br />
Before we come to iterators, let me say a few words about pairs. Pairs are widely used in STL. Simple problems, like TopCoder SRM 250 and easy 500-point problems, usually require some simple data structure that fits well with pair. STL std::pair is just a pair of elements. The simplest form would be the following:
 
<pre class="code"> template&lt;typename T1, typename T2&gt; struct pair { 
      T1 first; 
      T2 second; 
 }; </pre>

In general pair&lt;int,int&gt; is a pair of integer values. At a more complex level, pair&lt;string, pair&lt;int, int&gt; &gt; is a pair of string and two integers. In the second case, the usage may be like this:

<pre class="code"> pair&lt;string, pair&lt;int,int&gt; &gt; P; 
 string s = P.first; // extract string 
 int x = P.second.first; // extract first int 
 int y = P.second.second; // extract second int </pre>

The great advantage of pairs is that they have built-in operations to compare themselves. Pairs are compared first-to-second element. If the first elements are not equal, the result will be based on the comparison of the first elements only; the second elements will be compared only if the first ones are equal. The array (or vector) of pairs can easily be sorted by STL internal functions.
<br /><br />
For example, if you want to sort the array of integer points so that they form a polygon, it&rsquo;s a good idea to put them to the vector&lt; pair&lt;double, pair&lt;int,int&gt; &gt;, where each element of vector is { polar angle, { x, y } }. One call to the STL sorting function will give you the desired order of points.
<br /><br />
Pairs are also widely used in associative containers, which we will speak about later in this article.
<br /><br />

<span class="bodySubtitle"><A name="iterators"></A>Iterators</span><br />
What are iterators? In STL iterators are the most general way to access data in containers. Consider the simple problem: Reverse the array A of N int&rsquo;s. Let&rsquo;s begin from a C-like solution:

<pre class="code"> void reverse_array_simple(int *A, int N) { 
      int first = 0, last = N-1; // First and last indices of elements to be swapped 
      While(first &lt; last) { // Loop while there is something to swap 
           swap(A[first], A[last]); // swap(a,b) is the standard STL function 
           first++; // Move first index forward 
           last--; // Move last index back 
      } 
 } </pre>

This code should be clear to you. It&rsquo;s pretty easy to rewrite it in terms of pointers:

<pre class="code"> void reverse_array(int *A, int N) { 
      int *first = A, *last = A+N-1; 
      while(first &lt; last) { 
           Swap(*first, *last); 
           first++; 
           last--; 
      } 
 } </pre>

Look at this code, at its main loop. It uses only four distinct operations on pointers 'first' and 'last':
<ul>
<li>compare pointers (first &lt; last),</li>
<li>get value by pointer (*first, *last),</li>
<li>increment pointer, and</li>
<li>decrement pointer</li>
</ul>

Now imagine that you are facing the second problem: Reverse the contents of a double-linked list, or a part of it. The first code, which uses indexing, will definitely not work. At least, it will not work in time, because it&rsquo;s impossible to get element by index in a double-linked list in O(1), only in O(N), so the whole algorithm will work in O(N^2). Errr...
<br /><br />
But look: the second code can work for ANY pointer-like object. The only restriction is that that object can perform the operations described above: take value (unary *), comparison (&lt;), and increment/decrement (++/--). Objects with these properties that are associated with containers are called iterators. Any STL container may be traversed by means of an iterator. Although not often needed for vector, it&rsquo;s very important for other container types.
<br /><br />
So, what do we have? An object with syntax very much like a pointer. The following operations are defined for iterators:
<ul>
<li>get value of an iterator, int x = *it;</li>
<li>increment and decrement iterators it1++, it2--;</li>
<li>compare iterators by '!=' and by '&lt;'</li>
<li>add an immediate to iterator it += 20; &lt;=&gt; shift 20 elements forward</li>
<li>get the distance between iterators, int n = it2-it1;</li>
</ul>

But instead of pointers, iterators provide much greater functionality. Not only can they operate on any container, they may also perform, for example, range checking and profiling of container usage.
<br /><br />
And the main advantage of iterators, of course, is that they greatly increase the reuse of code: your own algorithms, based on iterators, will work on a wide range of containers, and your own containers, which provide iterators, may be passed to a wide range of standard functions.
<br /><br />
Not all types of iterators provide all the potential functionality. In fact, there are so-called &quot;normal iterators&quot; and &quot;random access iterators&quot;. Simply put, normal iterators may be compared with &lsquo;==&rsquo; and &lsquo;!=&rsquo;, and they may also be incremented and decremented. They may not be subtracted and we can not add a value to the normal iterator. Basically, it&rsquo;s impossible to implement the described operations in O(1) for all container types. In spite of this, the function that reverses array should look like this:

<pre class="code"> template&lt;typename T&gt; void reverse_array(T *first, T *last) { 
      if(first != last) { 
           while(true) { 
                swap(*first, *last); 
                first++; 
                if(first == last) { 
                     break; 
                } 
                last--; 
                if(first == last) { 
                     break; 
                } 
           } 
      } 
 } </pre>

The main difference between this code and the previous one is that we don&rsquo;t use the &quot;&lt;&quot; comparison on iterators, just the &quot;==&quot; one. Again, don&rsquo;t panic if you are surprised by the function prototype: template is just a way to declare a function, which works on any appropriate parameter types. This function should work perfectly on pointers to any object types and with all normal iterators.
<br /><br />
Let's return to the STL. STL algorithms always use two iterators, called &quot;begin&quot; and &quot;end.&quot; The end iterator is pointing not to the last object, however, but to the first invalid object, or the object directly following the last one. It&rsquo;s often very convenient.
<br /><br />
Each STL container has member functions begin() and end() that return the begin and end iterators for that container.
<br /><br />
Based on these principles, c.begin() == c.end() if and only if c is empty, and c.end() &ndash; c.begin() will always be equal to c.size(). (The last sentence is valid in cases when iterators can be subtracted, i.e. begin() and end() return random access iterators, which is not true for all kinds of containers. See the prior example of the double-linked list.)
<br /><br />
The STL-compliant reverse function should be written as follows:

<pre class="code"> template&lt;typename T&gt; void reverse_array_stl_compliant(T *begin, T *end) { 
      // We should at first decrement 'end' 
      // But only for non-empty range 
      if(begin != end) 
      { 
           end--; 
           if(begin != end) { 
                while(true) { 
                     swap(*begin, *end); 
                     begin++; 
                     If(begin == end) { 
                          break; 
                     } 
                     end--; 
                     if(begin == end) { 
                          break; 
                     } 
                } 
           } 
      } 
 } </pre>

Note that this function does the same thing as the standard function std::reverse(T begin, T end) that can be found in algorithms module (#include &lt;algorithm&gt;).
<br /><br />
In addition, any object with enough functionality can be passed as an iterator to STL algorithms and functions. That is where the power of templates comes in! See the following examples:

<pre class="code"> vector&lt;int&gt; v; 
 // ... 
 vector&lt;int&gt; v2(v); 
 vector&lt;int&gt; v3(v.begin(), v.end()); // v3 equals to v2 

 int data[] = { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31 }; 
 vector&lt;int&gt; primes(data, data+(sizeof(data) / sizeof(data[0]))); </pre>

The last line performs a construction of vector from an ordinal C array. The term 'data' without index is treated as a pointer to the beginning of the array. The term 'data + N' points to N-th element, so, when N if the size of array, 'data + N' points to first element not in array, so 'data + length of data' can be treated as end iterator for array 'data'. The expression 'sizeof(data)/sizeof(data[0])' returns the size of the array data, but only in a few cases, so don&rsquo;t use it anywhere except in such constructions. (C programmers will agree with me!)
<br /><br />
Furthermore, we can even use the following constructions:

<pre class="code"> vector&lt;int&gt; v; 
 // ... 
 vector&lt;int&gt; v2(v.begin(), v.begin() + (v.size()/2)); </pre>

It creates the vector v2 that is equal to the first half of vector v.
<br /><br />
Here is an example of reverse() function:

<pre class="code"> int data[10] = { 1, 3, 5, 7, 9, 11, 13, 15, 17, 19 }; 
 reverse(data+2, data+6); // the range { 5, 7, 9, 11 } is now { 11, 9, 7, 5 }; </pre>

Each container also has the rbegin()/rend() functions, which return reverse iterators. Reverse iterators are used to traverse the container in backward order. Thus:

<pre class="code"> vector&lt;int&gt; v; 
 vector&lt;int&gt; v2(v.rbegin()+(v.size()/2), v.rend()); </pre>

will create v2 with first half of v, ordered back-to-front.
<br /><br />
To create an iterator object, we must specify its type. The type of iterator can be constructed by a type of container by appending &ldquo;::iterator&rdquo;, &ldquo;::const_iterator&rdquo;, &ldquo;::reverse_iterator&rdquo; or &ldquo;::const_reverse_iterator&rdquo; to it. Thus, vector can be traversed in the following way:

<pre class="code"> vector&lt;int&gt; v; 

 // ... 

 // Traverse all container, from begin() to end() 
 for(vector&lt;int&gt;::iterator it = v.begin(); it != v.end(); it++) { 
      *it++; // Increment the value iterator is pointing to 
 } </pre>

I recommend you use '!=' instead of '&lt;', and 'empty()' instead of 'size() != 0' -- for some container types, it&rsquo;s just very inefficient to determine which of the iterators precedes another. 
<br /><br />
Now you know of STL algorithm reverse(). Many STL algorithms are declared in the same way: they get a pair of iterators &ndash; the beginning and end of a range &ndash; and return an iterator.
<br /><br />
The find() algorithm looks for appropriate elements in an interval. If the element is found, the iterator pointing to the first occurrence of the element is returned. Otherwise, the return value equals the end of interval. See the code:

<pre class="code"> vector&lt;int&gt; v; 
 for(int i = 1; i &lt; 100; i++) { 
      v.push_back(i*i); 
 } 

 if(find(v.begin(), v.end(), 49) != v.end()) { 
      // ... 
 } </pre>

To get the index of element found, one should subtract the beginning iterator from the result of find():

<pre class="code"> int i = (find(v.begin(), v.end(), 49) - v.begin(); 
 if(i &lt; v.size()) { 
      // ... 
 } </pre>

Remember to #include &lt;algorithm&gt; in your source when using STL algorithms.
<br /><br />
The min_element and max_element algorithms return an iterator to the respective element. To get the value of min/max element, like in find(), use *min_element(...) or *max_element(...), to get index in array subtract the begin iterator of a container or range:

<pre class="code"> int data[5] = { 1, 5, 2, 4, 3 }; 
 vector&lt;int&gt; X(data, data+5); 
 int v1 = *max_element(X.begin(), X.end()); // Returns value of max element in vector 
 int i1 = min_element(X.begin(), X.end()) &ndash; X.begin; // Returns index of min element in vector 

 int v2 = *max_element(data, data+5); // Returns value of max element in array 
 int i3 = min_element(data, data+5) &ndash; data; // Returns index of min element in array </pre>

Now you may see that the useful macros would be:

<pre class="code"> #define all(c) c.begin(), c.end() </pre>

Don&rsquo;t put the whole right-hand side of these macros into parentheses -- that would be wrong!
<br /><br />
Another good algorithm is sort(). It's very easy to use. Consider the following examples:

<pre class="code"> vector&lt;int&gt; X; 

 // ... 

 sort(X.begin(), X.end()); // Sort array in ascending order 
 sort(all(X)); // Sort array in ascending order, use our #define 
 sort(X.rbegin(), X.rend()); // Sort array in descending order using with reverse iterators </pre>


<span class="bodySubtitle"><A name="compiling"></A>Compiling STL Programs</span><br />
One thing worth pointing out here is STL error messages. As the STL is distributed in sources, and it becomes necessary for compilers to build efficient executables, one of STL's habits is unreadable error messages.
<br /><br />
For example, if you pass a vector&lt;int&gt; as a const reference parameter (as you should do) to some function:

<pre class="code"> void f(const vector&lt;int&gt;&amp; v) { 
      for( 
           vector&lt;int&gt;::iterator it = v.begin(); // hm... where&rsquo;s the error?.. 
           // ... 
      // ... 
 } </pre>

The error here is that you are trying to create the non-const iterator from a const object with the begin() member function (though identifying that error can be harder than actually correcting it). The right code looks like this:

<pre class="code"> void f(const vector&lt;int&gt;&amp; v) { 
      int r = 0; 
      // Traverse the vector using const_iterator 
      for(vector&lt;int&gt;::const_iterator it = v.begin(); it != v.end(); it++) { 
           r += (*it)*(*it); 
      } 
      return r; 
 } </pre>

In spite of this, let me tell about very important feature of GNU C++ called 'typeof'. This operator is replaced to the type of an expression during the compilation. Consider the following example:

<pre class="code"> typeof(a+b) x = (a+b); </pre>

This will create the variable x of type matching the type of (a+b) expression. Beware that typeof(v.size()) is unsigned for any STL container type. But the most important application of typeof for TopCoder is traversing a container. Consider the following macros:

<pre class="code"> #define tr(container, it) \ 
      for(typeof(container.begin()) it = container.begin(); it != container.end(); it++) </pre>

By using these macros we can traverse every kind of container, not only vector. This will produce const_iterator for const object and normal iterator for non-const object, and you will never get an error here.

<pre class="code"> void f(const vector&lt;int&gt;&amp; v) { 
      int r = 0; 
      tr(v, it) { 
           r += (*it)*(*it); 
      } 
      return r; 
 } </pre>

Note: I did not put additional parentheses on the #define line in order to improve its readability. See this article below for more correct #define statements that you can experiment with in practice rooms.
<br /><br />
Traversing macros is not really necessary for vectors, but it&rsquo;s very convenient for more complex data types, where indexing is not supported and iterators are the only way to access data. We will speak about this later in this article.
<br /><br />

<span class="bodySubtitle"><A name="manipulation"></A>Data manipulation in vector</span><br />
One can insert an element to vector by using the insert() function:

<pre class="code"> vector&lt;int&gt; v; 
 // ... 
 v.insert(1, 42); // Insert value 42 after the first </pre>

All elements from second (index 1) to the last will be shifted right one element to leave a place for a new element. If you are planning to add many elements, it's not good to do many shifts &ndash; you're better off calling insert() one time. So, insert() has an interval form:

<pre class="code"> vector&lt;int&gt; v; 
 vector&lt;int&gt; v2; 

 // .. 

 // Shift all elements from second to last to the appropriate number of elements. 
 // Then copy the contents of v2 into v. 
 v.insert(1, all(v2)); </pre>

Vector also has a member function erase, which has two forms. Guess what they are:

<pre class="code"> erase(iterator); 
 erase(begin iterator, end iterator); </pre>

At first case, single element of vector is deleted. At second case, the interval, specified by two iterators, is erased from vector.
<br /><br />
The insert/erase technique is common, but not identical for all STL containers.
<br /><br />

<span class="bodySubtitle"><A name="string"></A>String</span><br />
There is a special container to manipulate with strings. The string container has a few differences from vector&lt;char&gt;. Most of the differences come down to string manipulation functions and memory management policy. 
<br /><br />
String has a substring function without iterators, just indices:

<pre class="code"> string s = &quot;hello&quot;; 
 string 
      s1 = s.substr(0, 3), // &quot;hel&quot; 
      s2 = s.substr(1, 3), // &quot;ell&quot; 
      s3 = s.substr(0, s.length()-1), &quot;hell&quot; 
      s4 = s.substr(1); // &quot;ello&quot; </pre>

Beware of (s.length()-1) on empty string because s.length() is unsigned and unsigned(0) &ndash; 1 is definitely not what you are expecting!
<br /><br />

<span class="bodySubtitle"><A name="set"></A>Set</span><br>
It&rsquo;s always hard to decide which kind of container to describe first &ndash; set or map. My opinion is that, if the reader has a basic knowledge of algorithms, beginning from 'set' should be easier to understand.
<br /><br />
Consider we need a container with the following features:
<ul>
<li>add an element, but do not allow duples [duplicates?]</li>
<li>remove elements</li>
<li>get count of elements (distinct elements)</li>
<li>check whether elements are present in set</li>
</ul>

This is quite a frequently used task. STL provides the special container for it &ndash; set. Set can add, remove and check the presence of particular element in O(log N), where N is the count of objects in the set. While adding elements to set, the duples [duplicates?] are discarded. A count of the elements in the set, N, is returned in O(1). We will speak of the algorithmic implementation of set and map later -- for now, let&rsquo;s investigate its interface:

<pre class="code"> set&lt;int&gt; s; 

 for(int i = 1; i &lt;= 100; i++) { 
      s.insert(i); // Insert 100 elements, [1..100] 
 } 

 s.insert(42); // does nothing, 42 already exists in set 

 for(int i = 2; i &lt;= 100; i += 2) { 
      s.erase(i); // Erase even values 
 } 

 int n = int(s.size()); // n will be 50 </pre>

The push_back() member may not be used with set. It make sense: since the order of elements in set does not matter, push_back() is not applicable here.
<br />
<br />
Since set is not a linear container, it&rsquo;s impossible to take the element in set by index. Therefore, the only way to traverse the elements of set is to use iterators.

<pre class="code"> // Calculate the sum of elements in set 
 set&lt;int&gt; S; 
 // ... 
 int r = 0; 
 for(set&lt;int&gt;::const_iterator it = S.begin(); it != S.end(); it++) { 
      r += *it; 
 } </pre>

It's more elegant to use traversing macros here. Why? Imagine you have a set&lt; pair&lt;string, pair&lt; int, vector&lt;int&gt; &gt; &gt;. How to traverse it? Write down the iterator type name? Oh, no. Use our traverse macros instead.

<pre class="code"> set&lt; pair&lt;string, pair&lt; int, vector&lt;int&gt; &gt; &gt; SS; 
 int total = 0; 
 tr(SS, it) { 
      total += it-&gt;second.first; 
 } </pre>

Notice the 'it-&gt;second.first' syntax. Since 'it' is an iterator, we need to take an object from 'it' before operating. So, the correct syntax would be '(*it).second.first'. However, it&rsquo;s easier to write 'something-&gt;' than '(*something)'. The full explanation will be quite long &ndash;just remember that, for iterators, both syntaxes are allowed.
<br /><br />
To determine whether some element is present in set use 'find()' member function. Don&rsquo;t be confused, though: there are several 'find()' &rsquo;s in STL. There is a global algorithm 'find()', which takes two iterators, element, and works for O(N). It is possible to use it for searching for element in set, but why use an O(N) algorithm while there exists an O(log N) one? While searching in set and map (and also in multiset/multimap, hash_map/hash_set, etc.) do not use global find &ndash; instead, use member function 'set::find()'. As 'ordinal' find, set::find will return an iterator, either to the element found, or to 'end()'. So, the element presence check looks like this:

<pre class="code"> set&lt;int&gt; s; 
 // ... 
 if(s.find(42) != s.end()) { 
      // 42 presents in set 
 } 
 else { 
      // 42 not presents in set 
 } </pre>

Another algorithm that works for O(log N) while called as member function is count. Some people think that

<pre class="code"> if(s.count(42) != 0) { 
      // &hellip; 
 } </pre>

or even

<pre class="code"> if(s.count(42)) { 
      // &hellip; 
 } </pre>

is easier to write. Personally, I don&rsquo;t think so. Using count() in set/map is nonsense: the element either presents or not. As for me, I prefer to use the following two macros:

<pre class="code"> #define present(container, element) (container.find(element) != container.end()) 
 #define cpresent(container, element) (find(all(container),element) != container.end()) </pre>

(Remember that all(c) stands for &ldquo;c.begin(), c.end()&rdquo;)
<br /><br />
Here, 'present()' returns whether the element presents in the container with member function 'find()' (i.e. set/map, etc.) while 'cpresent' is for vector.
<br /><br />
To erase an element from set use the erase() function.

<pre class="code"> set&lt;int&gt; s; 
 // &hellip; 
 s.insert(54); 
 s.erase(29); </pre>

The erase() function also has the interval form:

<pre class="code"> set&lt;int&gt; s; 
 // .. 

 set&lt;int&gt;::iterator it1, it2; 
 it1 = s.find(10); 
 it2 = s.find(100); 
 // Will work if it1 and it2 are valid iterators, i.e. values 10 and 100 present in set. 
 s.erase(it1, it2); // Note that 10 will be deleted, but 100 will remain in the container </pre>

Set has an interval constructor:

<pre class="code"> int data[5] = { 5, 1, 4, 2, 3 }; 
 set&lt;int&gt; S(data, data+5); </pre>

It gives us a simple way to get rid of duplicates in vector, and sort it:

<pre class="code"> vector&lt;int&gt; v; 
 // &hellip; 
 set&lt;int&gt; s(all(v)); 
 vector&lt;int&gt; v2(all(s)); </pre>

Here 'v2' will contain the same elements as 'v' but sorted in ascending order and with duplicates removed.
<br /><br />
Any comparable elements can be stored in set. This will be described later.
<br /><br />

<span class="bodySubtitle"><A name="map"></A>Map</span><br />

There are two explanation of map. The simple explanation is the following:

<pre class="code"> map&lt;string, int&gt; M; 
 M[&quot;Top&quot;] = 1; 
 M[&quot;Coder&quot;] = 2; 
 M[&quot;SRM&quot;] = 10; 

 int x = M[&quot;Top&quot;] + M[&quot;Coder&quot;]; 

 if(M.find(&quot;SRM&quot;) != M.end()) { 
      M.erase(M.find(&quot;SRM&quot;)); // or even M.erase(&quot;SRM&quot;) 
 } </pre>

Very simple, isn&rsquo;t it?
<br /><br />
Actually map is very much like set, except it contains not just values but pairs &lt;key, value&gt;. Map ensures that at most one pair with specific key exists. Another quite pleasant thing is that map has operator [] defined.
<br /><br />
Traversing map is easy with our 'tr()' macros. Notice that iterator will be an std::pair of key and value. So, to get the value use it-&gt;second. The example follows:

<pre class="code"> map&lt;string, int&gt; M; 
 // &hellip; 
 int r = 0; 
 tr(M, it) { 
      r += it-&gt;second; 
 } </pre>

Don&rsquo;t change the key of map element by iterator, because it may break the integrity of map internal data structure (see below).
<br /><br />
There is one important difference between map::find() and map::operator []. While map::find() will never change the contents of map, operator [] will create an element if it does not exist. In some cases this could be very convenient, but it's definitly a bad idea to use operator [] many times in a loop, when you do not want to add new elements. That&rsquo;s why operator [] may not be used if map is passed as a const reference parameter to some function:

<pre class="code"> void f(const map&lt;string, int&gt;&amp; M) { 
      if(M[&quot;the meaning&quot;] == 42) { // Error! Cannot use [] on const map objects! 
      } 
      if(M.find(&quot;the meaning&quot;) != M.end() &amp;&amp; M.find(&quot;the meaning&quot;)-&gt;second == 42) { // Correct 
           cout &lt;&lt; &quot;Don't Panic!&quot; &lt;&lt; endl; 
      } 
 } </pre>

<span class="bodySubtitle"><A name="notice"></A>Notice on Map and Set</span><br />
Internally map and set are almost always stored as red-black trees. We do not need to worry about the internal structure, the thing to remember is that the elements of map and set are always sorted in ascending order while traversing these containers. And that&rsquo;s why it&rsquo;s strongly not recommended to change the key value while traversing map or set: If you make the modification that breaks the order, it will lead to improper functionality of container's algorithms, at least.
<br /><br />
But the fact that the elements of map and set are always ordered can be practically used while solving TopCoder problems.
<br /><br />
Another important thing is that operators ++ and -- are defined on iterators in map and set. Thus, if the value 42 presents in set, and it's not the first and the last one, than the following code will work:

<pre class="code"> set&lt;int&gt; S; 
 // ... 
 set&lt;int&gt;::iterator it = S.find(42); 
 set&lt;int&gt;::iterator it1 = it, it2 = it; 
 it1--; 
 it2++; 
 int a = *it1, b = *it2; </pre>

Here 'a' will contain the first neighbor of 42 to the left and 'b' the first one to the right.
<br /><br />

<span class="bodySubtitle"><A name="algorithms"></A>More on algorithms</span><br />
It&rsquo;s time to speak about algorithms a bit more deeply. Most algorithms are declared in the #include &lt;algorithm&gt; standard header. At first, STL provides three very simple algorithms: min(a,b), max(a,b), swap(a,b). Here min(a,b) and max(a,b) returns the minimum and maximum of two elements, while swap(a,b) swaps two elements.
<br /><br />
Algorithm sort() is also widely used. The call to sort(begin, end) sorts an interval in ascending order. Notice that sort() requires random access iterators, so it will not work on all containers. However, you probably won't ever call sort() on set, which is already ordered.
<br /><br />
You&rsquo;ve already heard of algorithm find(). The call to find(begin, end, element) returns the iterator where &lsquo;element&rsquo; first occurs, or end if the element is not found. Instead of find(...), count(begin, end, element) returns the number of occurrences of an element in a container or a part of a container. Remember that set and map have the member functions find() and count(), which works in O(log N), while std::find() and std::count() take O(N).
<br /><br />
Other useful algorithms are next_permutation() and prev_permutation(). Let&rsquo;s speak about next_permutation. The call to next_permutation(begin, end) makes the interval [begin, end) hold the next permutation of the same elements, or returns false if the current permutation is the last one. Accordingly, next_permutation makes many tasks quite easy. If you want to check all permutations, just write:

<pre class="code"> vector&lt;int&gt; v; 

 for(int i = 0; i &lt; 10; i++) { 
      v.push_back(i); 
 } 

 do { 
      Solve(..., v); 
 } while(next_permutation(all(v)); </pre>

Don&rsquo;t forget to ensure that the elements in a container are sorted before your first call to next_permutation(...). Their initial state should form the very first permutation; otherwise, some permutations will not be checked.
<br /><br />

<span class="bodySubtitle"><A name="stringstreams"></A>String Streams</span><br />
You often need to do some string processing/input/output. C++ provides two interesting objects for it: 'istringstream' and 'ostringstream'. They are both declared in #include &lt;sstream&gt;.
<br /><br />
Object istringstream allows you to read from a string like you do from a standard input. It's better to view source:

<pre class="code"> void f(const string&amp; s) { 

      // Construct an object to parse strings 
      istringstream is(s); 
 
      // Vector to store data 
      vector&lt;int&gt; v; 

      // Read integer while possible and add it to the vector 
      int tmp; 
      while(is &gt;&gt; tmp) { 
           v.push_back(tmp); 
      } 
 } </pre>

The ostringstream object is used to do formatting output. Here is the code:

<pre class="code"> string f(const vector&lt;int&gt;&amp; v) { 

      // Constucvt an object to do formatted output 
      ostringstream os; 

      // Copy all elements from vector&lt;int&gt; to string stream as text 
      tr(v, it) { 
           os &lt;&lt; ' ' &lt;&lt; *it; 
      } 

      // Get string from string stream 
      string s = os.str(); 

      // Remove first space character 
      if(!s.empty()) { // Beware of empty string here 
           s = s.substr(1); 
      } 

      return s; 
 } </pre>


<span class="bodySubtitle"><A name="summary"></A>Summary</span><br />
To go on with STL, I would like to summarize the list of templates to be used. This will simplify the reading of code samples and, I hope, improve your TopCoder skills. The short list of templates and macros follows:

<pre class="code"> typedef vector&lt;int&gt; vi; 
 typedef vector&lt;vi&gt; vvi; 
 typedef pair&lt;int,int&gt; ii; 
 #define sz(a) int((a).size()) 
 #define pb push_back 
 #defile all(c) (c).begin(),(c).end() 
 #define tr(c,i) for(typeof((c).begin() i = (c).begin(); i != (c).end(); i++) 
 #define present(c,x) ((c).find(x) != (c).end()) 
 #define cpresent(c,x) (find(all(c),x) != (c).end()) </pre>

The container vector&lt;int&gt; is here because it's really very popular. Actually, I found it convenient to have short aliases to many containers (especially for vector&lt;string&gt;, vector&lt;ii&gt;, vector&lt; pair&lt;double, ii&gt; &gt;). But this list only includes the macros that are required to understand the following text.
<br /><br />
Another note to keep in mind: When a token from the left-hand side of #define appears in the right-hand side, it should be placed in braces to avoid many nontrivial problems.
<br /><br />
<strong>Coming soon:</strong> <a href="/tc?module=Static&d1=tutorials&d2=standardTemplateLibrary2">Part II: C++ STL Advanced Uses</a>
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