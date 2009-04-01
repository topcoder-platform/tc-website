<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<style type="text/css">
    .code
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

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

            <h2>GCC Hacks: Abusing C++ Extensions for Fun and Profit</h2>

      <p>
      <img src="/i/m/bmerry_mug.gif" alt="" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="251074" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

<a name="introduction"></a>
<span class="bodySubtitle">Introduction</span><br/>
GCC provides a number of extensions to the C++ language and standard library. Some are de-facto standards supported by several compilers, others are C99 features that GCC offers in C++, still others are purely GNU extensions. Several of these extensions can be put to use in a TopCoder round. Some will make your program faster; others will save you typing.
<br><br>
When considering using an extension, keep in mind that when I say that extension will make your program faster because it generates some special assembly instruction or reduces some overhead, I mean that your program will be very slightly faster. If your program is exceeding a time limit, it is quite likely that you have a bad algorithm and that it is orders of magnitude too slow; these extensions cannot help you here. However, in some cases you will know (or hope) that your program is only just too slow (maybe because slightly smaller test cases run in time), and you wish to squeeze out a little more performance.
<br><br>
<span class="bodySubtitle"><tt>long long</tt></span><br/>
This extension is probably seen in the arena more than any other. The <tt>long long</tt> type has been part of GCC for a long time, and it has even been incorporated into C99. It is a 64-bit signed integral type (at least on x86, and I would guess most if not all other architectures); the companion <tt>unsigned long long</tt> type provides 64-bit unsigned integers. Since the x86 architecture does not have 64-bit registers, the resulting code is quite a bit slower than 32-bit arithmetic. Nevertheless, it is convenient when 32-bit integers just aren't big enough, or even when you're not sure if they're big enough and you want some breathing space. Usually when I'm worried about integer overflow, I convert everything I can to <tt>long long</tt>; if you have the right algorithm, the loss of performance will seldom push you over the time limit.
<br><br>
<span class="bodySubtitle">Variable-sized automatic arrays</span><br/>
Arrays allocated on the stack may be given a size that depends on run-time data, such as the values of variables or parameters. This is useful for allocating arrays to hold information when you don't know how big the array must grow.
<br><br>
There are some downsides to using this functionality. In particular, gdb does not seem to handle it very well, and tends to show an array with 2 values when you try to print it. You can get around this by asking for the value of <tt>arr[0]@N</tt> where <tt>N</tt> is the number of elements you wish to see. There is also the danger of stack overflow if you try to allocate too many elements (although this also applies to fixed-sized arrays, it does not constrain STL classes which internally allocate their data on the heap). In TopCoder matches there is usually some small upper bound on the size of input data, and so it is often possible to create a constant-sized array of sufficient size for all cases.
<br><br>

<span class="bodySubtitle">Inline functions</span><br/>
GCC has supported inline functions for years in both C and C++. They have been incorporated into C99, but have not yet been formally included in C++. An inline function in one that is inserted in-place at each call site, thus eliminating a function call overhead. Since each copy consumes extra instructions (and thus memory bandwidth and instruction cache), this is only worthwhile for very short functions (typically a line or two) which are called often. An additional benefit to using inline functions is that the inlined code can be optimised separately for each context in which it is used (doing constant folding, for example).
<br><br>
Inline functions are often recommended as a safer alternative to macros, since the usual function call semantics (such as type checking and single evaluation of the arguments) applies to inline functions. Since they are inserted in place, they are just as fast as macros.
<br><br>
To request that the compiler inlines a regular (non-member) function, precede the function return type with the keyword <tt>inline</tt>, for example

<pre class="code">
inline int sqr(int x) { return x * x; }
</pre>

Inlining member functions is quite easy: any member function whose body is defined in-place (i.e. inside the class) will be automatically inlined. If you prefer to keep the function body separate, apply the <tt>inline</tt> keyword to the declaration, but not to the definition.
<br><br>
You're not guaranteed that the function will be inlined; this is merely a request to the compiler. Recursive functions obviously cannot be inlined; GCC also refuses to inline functions that use variable-sized arrays (see above). Also note that any call through a function pointer will not be inlined; this means that trying to inline a comparison function to be passed to <tt>sort</tt> is futile. If, however, you define a function object with an inlined <tt>operator()</tt> and pass an instance to <tt>sort</tt>, then the sort template will be specialised for that function class and the inlining will work.
<br><br>
<span class="bodySubtitle">Comparisons</span><br/>
Although the header <tt>&lt;algorithm&gt;</tt> provides <tt>min</tt> and <tt>max</tt> functions, these have some limitations. They have only one template parameter, which specifies the type for both arguments; this sometimes leads to errors when the given arguments are of different types. GCC provides the highly non-standard operators <tt>&lt;?</tt> (min) and <tt>&gt;?</tt> (max), which will coerce the arguments to a suitable type.
<br><br>
These operators are most commonly seen in their assignment forms <tt>&lt;?=</tt> and <tt>&gt;?=</tt>. For example, the following loop computes the minimum value of a function over a range:
<pre class="code">
int m = INT_MAX;
for (int i = 0; i &lt; N; i++)
    m &lt;?= func(i);
</pre>

<span class="bodySubtitle"><tt>typeof</tt> operator</span><br/>
Many TopCoders pre-define little macros for various types of loops, to reduce the number of keys they have to hit during a contest. One of the problems in defining such macros is that the types involved are not always known. The non-standard <tt>typeof</tt> keyword can help here. It &ldquo;returns&rdquo; the type of its argument: a <tt>typeof</tt> expression can be used anywhere you'd normally write the name of a type, such as in a declaration. Suppose you wanted to write a macro that took two iterators and emitted a <tt>for</tt> loop that iterated between them. You could write this as follows:

<pre class="code">
#define for_range(i, first, last) for (typeof(first) i = (first); i != (last); ++i)
</pre>

where the <tt>typeof</tt> operator determines the appropriate type for the loop variable.
<br><br>
<span class="bodySubtitle">Compound literals</span><br/>
I often define a small struct that will hold two or three items, such as the end-points and weight of an edge in a graph. For two-item structs there is already the utility <tt>pair</tt> template, but it has unfriendly field names (<tt>first</tt> and <tt>second</tt> compared to, say, <tt>target</tt> and <tt>cost</tt>), and it doesn't generalise well to more than two elements (although you can create a <tt>pair&lt;pair&lt;R, S&gt;, T&gt;</tt> if you really insist).
<br><br>
One advantage of <tt>pair</tt> that you lose when you do this is the <tt>make_pair</tt> function that creates <tt>pair</tt>s on the fly. You could of course define such a function for your class, or give it a constructor, but this can take vital coding time. GCC provides another alternative, which comes from C99: the compound literal. A compound literal is a mix between a cast and an initialiser. To understand what I mean, consider a struct defined as

<pre class="code">
struct edge
{
    int target;
    int cost;
};
</pre>

An example of a compound literal is <tt>(edge) { t, c }</tt> where <tt>t</tt> and <tt>c</tt> are expressions. The values in the braces are used to initialise the values of the struct, in the order in which they are declared. This is useful for instantiating structs on-the-fly to pass to STL methods.
<br><br>
<span class="bodySubtitle">Bit-manipulation</span><br/>
Although C++ provides the <tt>bitset</tt> template to efficiently manipulate sets of bits, there are some things that can be done within an integral type that cannot be done so easily with a <tt>bitset</tt>. For example, the lowest bit of an integer <tt>x</tt> can be cleared by <tt>x &amp;= x - 1</tt>. The x86 instruction set provides some special instructions for doing some types of bit manipulation, and GCC provides pseudo-functions that generate these instructions:

<dl>
<dt><tt>__builtin_ctz(unsigned int x)</tt></dt>
<dd>Counts the number of trailing zero bits. This is one less than the POSIX function <tt>ffs</tt> (which GCC also implements using the special x86 instruction).</dd>
<dt><tt>__builtin_clz(unsigned int x)</tt></dt>
<dd>Counts the number of leading zero bits. Note that GCC docs state that both of these functions are <strong>undefined</strong> if <tt>x</tt> is 0. Experimenting on my Athlon 64 with GCC 3.4 gives values of 0 and 31 respectively with <tt>-O2</tt>, but nonsense values when compiled without optimisation. Don't rely on any particular value.</dd>
<dt><tt>__builtin_popcount(unsigned int x)</tt></dt>
<dd>Counts the total number of one bits in <tt>x</tt>. Note that x86 does not have an instruction to do this, so you end up calling a real function; however, this is still more convenient than having to write the function yourself.</dd>
</dl>

These functions also have variants with <tt>ll</tt> appended to the function name, that takes <tt>unsigned long long</tt> rather than <tt>unsigned int</tt>.
<br><br>

<span class="bodySubtitle">Conclusions</span><br/>
With the exception of <tt>long long</tt>, these extensions will not make your program immensely easier to write. They could, however, save the vital few seconds that make the difference between winning or losing. Even if you don't intend you use the extensions, it is worthwhile to know how they work so that you can understand code during the challenge phase.

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
