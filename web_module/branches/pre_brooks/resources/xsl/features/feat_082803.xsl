<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <head>

        <xsl:call-template name="Preload"/>      

        <title>TopCoder | Features</title>

        <xsl:call-template name="CSS"/>      

        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

      </head>

      <body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

        <xsl:call-template name="Top"/>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">

            <xsl:call-template name="global_left"/>

        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="100%">
        
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">features</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="21" border="0"/></td></tr>                        
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%">         
                        <p><font size="4"><strong>A Crash Course in the C++ Standard Template Library</strong></font><br />
                        Thursday, August 28, 2003</p>

                        <p>By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=269554"><strong>Yarin</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
                        <p>
<b>Introduction</b><br />
This course tries to quickly teach how to use the Standard Template Library for the most common tasks without having to rely on other sources. It tells very little how things work, but instead gives several code snippets from which it should be possible to figure out how to use some parts of the STL. Since it's a crash course, a lot of things are left out and some things are simplified so much they're almost lies...
</p>

<p>
The STL is a collection of containers and simple algorithms. A container is something that holds several elements of the same type. The containers described in this course are <span class="code">vector</span>, <span class="code">set</span> and <span class="code">map</span>, but the STL have several more containers. The STL header files required in this course are <span class="code">vector</span>, <span class="code">set</span>, <span class="code">map</span> and <span class="code">algorithm</span>. I also use <span class="code">iostream</span> and <span class="code">string</span> (the latter is not part of the STL, even though it in many ways have the same functionality). All classes are declared in the namespace std, so having the following lines at the beginning of your code is a good idea:
</p>

<pre>
#include &lt;iostream&gt;
#include &lt;string&gt;
#include &lt;vector&gt;
#include &lt;set&gt;
#include &lt;map&gt;
#include &lt;algorithm&gt;

using namespace std;
</pre>

<h2>vector</h2>

<p>
A vector corresponds to a 1-dimensional array in C. A vector is declared like this:
</p>

<pre>
vector&lt;int&gt; a;       // Declare a vector of integers
vector&lt;MyStruct&gt; b;  // Declare a vector of MyStruct
</pre>

<p>
The vectors declared above both initially contain zero elements. This is no problem, since vectors (like all the STL containers) can grow dynamically by inserting elements.
</p>

<p>
It's also possible to initialize a vector with elements and also give those a specific value:
</p>

<pre>
vector&lt;int&gt; c(50,1); // Declare a vector of integers with 50 elements, all set to 1
</pre>

<p>
For structs and classes, the initial value should be a constructor. If the initial value is omitted, the default constructor will be used (in case of simple types like int, double etc, the initial value is 0).
</p>

<p>
Elements in a vector are accessed the same way as elements in an array, using the [] operator. Elements can also be accessed using <span class="code">at</span>:
</p>

<pre>
cout &lt;&lt; c[5] &lt;&lt; endl;
cout &lt;&lt; c.at(5) &lt;&lt; endl;
</pre>

<p>
The difference between the two is that <span class="code">at</span> will raise an exception if you try to access an element outside the vector while the [] operator won't.
</p>

<p>
Extending the size of a vector by appending an element to the end is done with the <span class="code">push_back</span> method:
</p>

<pre>
vector&lt;int&gt; a(10,1);
a.push_back(2);      // Element 0 to 9 in a is now 1, and element 10 is 2.
</pre>

<p>
It's not possible to insert elements anywhere else in a vector. Other ways to resize a vector includes the <span class="code">resize</span> method:
</p>

<pre>
vector&lt;int&gt; a(10,1);
a.resize(15);        // Element 0 to 9 in a is now 1, and element 10 to 14 is 0.
</pre>

<p>
If <span class="code">resize</span> increases the number of elements, the default constructor is assigned to the new elements. Decreasing the size of a vector removes elements from the end of the vector.
</p>

<p>
Other useful methods in the vector class are: (T is the type of each element)
</p>

<pre>
size_t size();       // Returns the number of elements in the vector
void pop_back();     // Removes the last element
T back();            // Returns the value of the last element
void clear();        // Essentially the same thing as resize(0)
</pre>

<h2>Sorting</h2>

<p>
A vector can of course be sorted: (also works on arrays)
</p>

<pre>
sort(&amp;a[0],&amp;a[N]);   // N = no elements in the vector (i.e. a.size())
</pre>

<p>
This will sort all elements in a in the default order. For built-in types, the default order is ascending. For structs and classes, you can define the default order by defining how the less-than operator should work:
</p>

<pre>
bool operator&lt;(const MyStruct &amp;a, const MyStruct &amp;b)
{
  // Return true if A&lt;B, false if A&gt;=B
}
</pre>

<p>
The two parameters to sort specify the range in the vector to be sorted, by pointing to the first element and the element after the last one. So <span class="code">sort(&amp;a[0],&amp;a[N])</span> sorts elements 0,1,...,N-1. This way of specifying a range is used throughout all the STL, and is very practical.
</p>

<p>
Since it's most common you want to perform an operation on the whole vector, the start and endpoint have special names: <span class="code">begin()</span> and <span class="code">end()</span>. So instead of <span class="code">sort(&amp;a[0],&amp;a[N])</span> one can do <span class="code">sort(a.begin(),a.end())</span>. Actually, <span class="code">&amp;a[0]</span> and <span class="code">a.begin()</span> are not in general interchangeable as the former is a pointer and the latter an iterator (more about this later).
</p>

<h2>pair</h2>

<p>
A tiny class that is part of the STL is pair, which basically just contains (as the name implies) two data members - <span class="code">first</span> and <span class="code">second</span>. However, it's practical to use, especially when sorting a vector of pairs. The members are, respectively, used as the first and second sort key, which means that both data types used must have a less-than operator defined. For instance, if you want to sort coordinates first according to their x value and then their y value, then we can use the pair class like this:
</p>

<pre>
int N,x,y;
vector&lt; pair&lt;int,int&gt; &gt; a; // It's essential that there is a space between &gt; and &gt;!
cin &gt;&gt; N;
for(int i=0;i&lt;N;++i) {
  cin &gt;&gt; x &gt;&gt; y;
  a.push_back(make_pair(x,y)); // make_pair creates a pair&lt;int,int&gt; object
}
sort(a.begin(),a.end()); // Sorts first according to the x-coordinate, then the y-coordinate
</pre>

<p>
Note the use of <span class="code">make_pair</span> (also part of the STL). Without it, we would have to type something like <span class="code">a.push_back(pair&lt;int,int&gt;(x,y))</span>
</p>

<h2>set</h2>

<p>
One of the most fundamental ways to store information is to have a set of objects. Defining a set of integers is done with
</p>

<pre>
set&lt;int&gt; a;
</pre>

<p>
To add, remove and check for single elements in a set:
</p>

<pre>
a.insert(7);         // Insert integer 7 in the set
a.erase(5);          // Remove integer 5 (if it exist) from the set
if (a.find(7)!=a.end())
  ; // Integer 7 exists in the set
else
  ; // Integer 7 does not exist
cout &lt;&lt; a.size() &lt;&lt; endl; // Print the number of elements in the set a
</pre>

<p>
Other common set operations includes finding the union, intersection and difference between two sets.
</p>

<pre>
set&lt;int&gt; a,b,un,in,di;
..
..
set_union(a.begin(),a.end(),b.begin(),b.end(),insert_iterator&lt;set&lt;int&gt; &gt;(un,un.begin()));
set_intersection(a.begin(),a.end(),b.begin(),b.end(),insert_iterator&lt;set&lt;int&gt; &gt;(in,in.begin()));
set_difference(a.begin(),a.end(),b.begin(),b.end(),insert_iterator&lt;set&lt;int&gt; &gt;(di,di.begin()));
</pre>

<p>
It's necessary to use the <span class="code">insert_iterator</span> thingy which insert all elements in the union (or intersection or difference) of the two sets <span class="code">a</span> and <span class="code">b</span> into set <span class="code">c</span>. If <span class="code">c</span> is not empty, you might want to clear the set first using the <span class="code">clear()</span> method.
</p>

<p>
To allow for fast operations, the internal representation of a set is a balanced binary tree. This means that the type of the values must be sortable, i.e. having a less-than operator defined (see above). Thus all elements in a set are always sorted, which can be quite practical.
</p>

<h3>Conversions</h3>

<p>
One can initialize a set from a vector:
</p>

<pre>
set&lt;int&gt; b(a.begin(),a.end()); // a is a vector&lt;int&gt;
</pre>

<p>
Going the other way is also possible:
</p>

<pre>
vector&lt;int&gt; c(b.begin(),b.end()); // b is a set&lt;int&gt;
</pre>

<p>
Doing these two operations after each other effectively sorts a vector of integers and removes all duplicate elements!
</p>

<h2>map</h2>

<p>
It's often desirable to have a 1-1 relation between two data types. One member in the relation is the key element, the lookup value. The other is the data value, retrieved by doing a lookup. For example, we might want to map names of cities (stored as strings) to serial number (integers):
</p>

<pre>
map&lt;string,int&gt; a;
</pre>

<p>
Now, map can in some ways be used exactly as a vector:
</p>

<pre>
a["New York"]=7;
a["Los Angeles"]=8;
a["Boston"]=10;
a["Los Angeles"]=3;
cout &lt;&lt; a["Los Angeles"] &lt;&lt; endl;     // Prints 3
cout &lt;&lt; a["San Francisco"] &lt;&lt; endl;   // Prints 0
</pre>

<p>
If no value is given to a key, it receives the default constructor (0 for simple types).
</p>

<p>
The map class can be thought of as a set of pairs (where first is the key value and second the data value) with the [] operator declared in a handy way, except that only the key value needs a less-than operator defined.
</p>

<p>
It might be worth noting that by defining a <span class="code">map&lt;int,int&gt;</span> one basically has an infinite large array of integers!
</p>

<h2>Looping over elements</h2>

<p>
Looping over all elements in a vector can be done by looping over all indexes, but that's not possible in a set or a map. Instead one can use one of the following two methods:
</p>

<h3>Using iterators</h3>

<p>
This basically means that instead of looping an index from 0 to N-1, we loop an iterator (think of it as a "smart pointer") from the first to the last element. For instance, to print out all elements in a set or a map:
</p>

<pre>
set&lt;int&gt; a;
map&lt;string,string&gt; b;
..
..
for(set&lt;int&gt;::iterator i=a.begin();i!=a.end();++i)
  cout &lt;&lt; *i &lt;&lt; endl;
for(map&lt;string,string&gt;::iterator i=b.begin();i!=b.end();++i)
  cout &lt;&lt; i-&gt;first &lt;&lt; " =&gt; " &lt;&lt; i-&gt;second &lt;&lt; endl;
</pre>

<p>
Note that it's necessary to use <span class="code">i!=a.end()</span> and not <span class="code">i&lt;a.end()</span> as the elements don't necessary have to be stored in order in the memory.
</p>

<p>
We can here see that <span class="code">i</span> is not a pointer but an iterator: if <span class="code">i</span> was a pointer, <span class="code">++i</span> would cause <span class="code">i</span> to point to the next element in the memory, while with an iterator it will point to the next element in the container (which does not necessarily lie immediately after the previous element in the memory).
</p>

<h3>Using for_each</h3>

<p>
Instead of explicitly creating the for-loop, one can use a function from the algorithm library:
</p>

<pre>
void doit(const int &amp;t) { cout &lt;&lt; t &lt;&lt; endl; }
..
..
set&lt;int&gt; a; // Can be a vector or map as well
for_each(a.begin(),a.end(),doit); 
</pre>

<p>
That is, for all elements in the range [<span class="code">a.begin()</span>,<span class="code">a.end()</span>), call the function <span class="code">doit</span>. The parameter in <span class="code">doit</span> must be a const reference of the data type in the container.
</p>

<h2>More about the STL</h2>

<p>
A complete reference to the STL as well as a more technical introduction to it can be found at <a href="http://www.sgi.com/tech/stl/" target="_blank">http://www.sgi.com/tech/stl/</a>.
</p>
                        <p><br/></p>

                        <p>Would you like to <a href="/?&amp;t=features&amp;c=feat_topics" class="bodyGeneric">write a feature?</a></p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>                                                                 
            </table>
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

            <xsl:call-template name="public_right_col"/>       

        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

