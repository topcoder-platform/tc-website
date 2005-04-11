<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>

<jsp:include page="../../script.jsp" />
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

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="alg_tutorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">
            
            <h2>Computational Complexity: Section 1</h2>

			<p>
			<img src="/i/m/misof_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
			By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=8357090"><strong>misof</strong></a><br />
			<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
			</p>

<P>
In this article I'll try to introduce you to the area of computation
complexity. The article will be a bit long before we get to the actual
formal definitions because I feel that the rationale behind these
definitions needs to be explained as well - and that understanding the
rationale is even more important than the definitions alone. 

<P>

<span class="bodySubtitle"><A NAME="SECTION00010000000000000000">
Why is it important?</A>
</span>

<P>
<B>Example 1.</B> Suppose you were assigned to write a program to process some records
your company receives from time to time. You implemented two different algorithms 
and tested them on several sets of test data. The processing times you obtained 
are in Table 1. 

<P>
<DIV ALIGN="CENTER">
<table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
<TR><TD class="sidebarTitle" ALIGN="LEFT"># of records</TD>
<TD class="sidebarText" ALIGN="RIGHT">10</TD>
<TD class="sidebarText" ALIGN="RIGHT">20</TD>
<TD class="sidebarText" ALIGN="RIGHT">50</TD>
<TD class="sidebarText" ALIGN="RIGHT">100</TD>
<TD class="sidebarText" ALIGN="RIGHT">1000</TD>
<TD class="sidebarText" ALIGN="RIGHT">5000</TD>
</TR>
<TR><TD class="sidebarTitle" ALIGN="LEFT">algorithm 1</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.00s</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.01s</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.05s</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.47s</TD>
<TD class="sidebarText" ALIGN="RIGHT">23.92s</TD>
<TD class="sidebarText" ALIGN="RIGHT">47min</TD>
</TR>
<TR><TD class="sidebarTitle" ALIGN="LEFT">algorithm 2</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.05s</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.05s</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.06s</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.11s</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.78s</TD>
<TD class="sidebarText" ALIGN="RIGHT">14.22s</TD>
</TR>
</TABLE>
</DIV>
<DIV ALIGN="CENTER"><BR>Table 1. Runtimes of two fictional algorithms.</DIV>

<P>
In praxis, we probably could tell which of the two implementations
is better for us (as we usually can estimate the amount of data we
will have to process). For the company this solution may be fine. But from the
programmer's point of view, it would be much better if he could estimate
the values in Table 1 <B>before</B> writing the actual code - then he
could only implement the better algorithm.

<P>
The same situation occurs during programming contests: The size of
the input data is given in the problem statement. Suppose I found an
algorithm. Questions I have to answer before I start to type should be:
Is my algorithm worth implementing? Will it solve the largest test
cases in time? If I know more algorithms solving the problem, 
which of them shall I implement?

<P>
This leads us to the question: How to compare algorithms?
Before we answer this question in general, let's return to our simple
example. If we extrapolate the data in Table 1, we may assume that 
if the number of processed records is larger than 1000, algorithm
2 will be substantially faster. In other words, if we consider all
possible inputs, algorithm 2 will be better for almost all of them.

<P>
It turns out that this is almost always the case - given two algorithms,
either one of them is almost always better, or they are approximately
the same. Thus, this will be our definition of a better algorithm.
Later, as we define everything formally, this will be the 
general idea behind the definitions.

<P>

<span class="bodySubtitle"><A NAME="SECTION00020000000000000000">
A neat trick</A>
</span>

<P>
If you thing about Example 1 for a while, it shouldn't be
too difficult to see that there is an algorithm with runtimes similar
to those in Table 2:

<P>
<DIV ALIGN="CENTER">
<table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
<TR><TD class="sidebarTitle" ALIGN="LEFT"># of records</TD>
<TD class="sidebarText" ALIGN="RIGHT">10</TD>
<TD class="sidebarText" ALIGN="RIGHT">20</TD>
<TD class="sidebarText" ALIGN="RIGHT">50</TD>
<TD class="sidebarText" ALIGN="RIGHT">100</TD>
<TD class="sidebarText" ALIGN="RIGHT">1000</TD>
<TD class="sidebarText" ALIGN="RIGHT">5000</TD>
</TR>
<TR><TD class="sidebarTitle" ALIGN="LEFT">algorithm 3</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.00s</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.01s</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.05s</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.11s</TD>
<TD class="sidebarText" ALIGN="RIGHT">0.78s</TD>
<TD class="sidebarText" ALIGN="RIGHT">14.22s</TD>
</TR>
</TABLE>
</DIV>
<DIV ALIGN="CENTER"><BR>Table 2. Runtimes of a new fictional algorithm.</DIV>

<P>
The idea behind this algorithm: Check the number of records. If it is small 
enough, run algorithm 1, otherwise run algorithm 2. 

<P>
Similar ideas are often used in praxis. As an example consider most of
the sort() functions provided by various libraries. Often this function
is an implementation of QuickSort with various improvements, such as:

<UL>
<LI>if the number of elements is too small, run InsertSort instead
  (as InsertSort is faster for small inputs)
</LI>
<LI>if the pivot choices lead to poor results, fall back to MergeSort
</LI>
</UL>

<P>

<span class="bodySubtitle"><A NAME="SECTION00030000000000000000">
What is efficiency?</A>
</span>

<P>
<B>Example 2.</B> Suppose you have a concrete implementation of some algorithm.
(The example code presented below is actually an implementation of
MinSort - a slow but simple sorting algorithm.)

<P>
<PRE>
for (int i=0; i&lt;N; i++)
  for (int j=i+1; j&lt;N; j++) 
    if (A[i] &gt; A[j]) 
      swap( A[i], A[j] );
</PRE>

<P>
If we are given an input to this algorithm (in our case, the array A
and its size N), we can exactly compute the number of steps our 
algorithm does on this input. We could even count the processor
instructions if we wanted to. However, there are too many possible
inputs for this approach to be practical. 

<P>
And we still need to answer one important question: What is it exactly 
we are interested in? Most usually it is the behavior of our program
in the <B>worst possible case</B> - we need to look at the input 
data and to determine an upper bound on how long will it take
if we run the program. 

<P>
But then, what is the worst possible case? Surely we can always make the program
run longer simply by giving it a larger input. Some of the more important
questions are: What is the worst input with 700 elements? 
<B>How fast</B> does the maximum runtime grow when we increase the input 
size?

<P>

<span class="bodySubtitle"><A NAME="SECTION00040000000000000000">
Formal notes on the input size</A>
</span>

<P>
What exactly is this "input size" we started to talk about? 
In the formal definitions this is the size of the input written in some 
fixed finite alphabet (with at least 2 "letters"). For our needs, we may consider 
this alphabet to be
the numbers 0..255. Then the "input size" turns out to be exactly 
the size of the input file in bytes. 

<P>
Usually a part of the input is a number (or several numbers) such that
the size of the input is proportional to the number.

<P>
E.g. in Example 2 we are given an int N and an array containing N ints.
The size of the input file will be roughly 5N (depending on the OS and
architecture, but always linear in N).

<P>
In such cases, we may choose that this number will represent the size of 
the input. Thus when talking about problems on arrays/strings, the input size
is the length of the array/string, when talking about graph problems, the
input size depends both on the number of vertices (N) and the number of
edges (M), etc.

<P>
We will adopt this approach and use N as the input size in the following
parts of the article.

<P>
There is one tricky special case you sometimes need to be aware of. To write 
a (possibly large) number we need only logarithmic space. (E.g. to write
123456, we need only roughly <!-- MATH
 $\log_{10}(123456)$
 -->
<SPAN CLASS="MATH">log<SUB>10</SUB>(123456)</SPAN> digits.)
This is why the naive primality test does not run in polynomial time - 
its runtime is polynomial in the <B>size</B> of the number, but not
in its <B>number of digits</B>!
If you didn't understand the part about polynomial time, don't worry, 
we'll get there later. 

<P>

<span class="bodySubtitle"><A NAME="SECTION00050000000000000000">
How to measure efficiency?</A>
</span>

<P>
We already mentioned that given an input we are able to count the
number of steps an algorithm makes simply by simulating it. 
Suppose we do this for all inputs of size at most <SPAN CLASS="MATH"><I>N</I></SPAN> and 
find the worst of these inputs (i.e. the one that causes
the algorithm to do the most steps). Let <SPAN CLASS="MATH"><I>f</I> (<I>N</I>)</SPAN> be this number
of steps. 
We will call this function the time complexity, or shortly the runtime
of our algorithm.

<P>
In other words, if we have any input of size <SPAN CLASS="MATH"><I>N</I></SPAN>, solving it will
require at most <SPAN CLASS="MATH"><I>f</I> (<I>N</I>)</SPAN> steps. 

<P>
Let's return to the algorithm from Example 2. What is the worst
case of size <SPAN CLASS="MATH"><I>N</I></SPAN>? In other words, what array with <SPAN CLASS="MATH"><I>N</I></SPAN> elements
will cause the algorithm to make the most steps? If we take a 
look at the algorithm, we can easily see that:

<UL>
<LI>the first step is executed exactly <SPAN CLASS="MATH"><I>N</I></SPAN> times
</LI>
<LI>the second and third step are executed exactly <SPAN CLASS="MATH"><I>N</I>(<I>N</I> - 1)/2</SPAN> times
</LI>
<LI>the fourth step is executed at most <SPAN CLASS="MATH"><I>N</I>(<I>N</I> - 1)/2</SPAN> times
</LI>
</UL>
Clearly, if the elements in A are in descending order at the beginning, the fourth
step will always be executed. Thus in this case the algorithm 
makes <!-- MATH
 $3N(N-1)/2 + N = 1.5N^2 - 0.5N$
 -->
<SPAN CLASS="MATH">3<I>N</I>(<I>N</I> - 1)/2 + <I>N</I> = 1.5<I>N</I><SUP>2</SUP> - 0.5<I>N</I></SPAN> steps.
Therefore our algorithm has <!-- MATH
 $f(N) = 1.5N^2 - 0.5N$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = 1.5<I>N</I><SUP>2</SUP> - 0.5<I>N</I></SPAN>.

<P>
As you can see, determining the exact function <SPAN CLASS="MATH"><I>f</I></SPAN> for more complicated
programs is painful. Moreover, it isn't even necessary. In our case, clearly
the <SPAN CLASS="MATH">-0.5<I>N</I></SPAN> term can be neglected. It will usually be much smaller than
the <SPAN CLASS="MATH">1.5<I>N</I><SUP>2</SUP></SPAN> term and it won't affect the runtime significantly.
The result "<SPAN CLASS="MATH"><I>f</I> (<I>N</I>)</SPAN> is roughly equal to <SPAN CLASS="MATH">1.5<I>N</I><SUP>2</SUP></SPAN>" gives
us all the information we need. As we will show now, if we want
to compare this algorithm with some other algorithm solving the
same problem, even the constant 1.5 is not that important.

<P>
Consider two algorithms, one with the runtime <SPAN CLASS="MATH"><I>N</I><SUP>2</SUP></SPAN>, the other with the
runtime <SPAN CLASS="MATH">0.001<I>N</I><SUP>3</SUP></SPAN>. One can easily see that for <SPAN CLASS="MATH"><I>N</I></SPAN> greater than <SPAN CLASS="MATH">1&#160;000</SPAN> the first
algorithm is faster - and soon this difference becomes apparent. While
the first algorithm is able to solve inputs with <SPAN CLASS="MATH"><I>N</I> = 20&#160;000</SPAN> in a matter 
of seconds, the second one will already need several minutes on current
machines. 

<P>
Clearly this will occur always when one of the runtime functions grows
<B>asymptotically faster</B> than the other (i.e. when <SPAN CLASS="MATH"><I>N</I></SPAN> grows beyond
all bounds the limit of their quotient is zero or infinity).
Regardless of the constant factors, an algorithm
with runtime proportional to <SPAN CLASS="MATH"><I>N</I><SUP>2</SUP></SPAN> will always be better than an algorithm
with runtime proportional to <SPAN CLASS="MATH"><I>N</I><SUP>3</SUP></SPAN> <B>on almost all inputs</B>.
And this observation is exactly what we base our
formal definition on. 

<P>

<span class="bodySubtitle"><A NAME="SECTION00060000000000000000">
Finally, formal definitions</A>
</span>

<P>
Let <SPAN CLASS="MATH"><I>f</I></SPAN>, <SPAN CLASS="MATH"><I>g</I></SPAN> be positive non-decreasing functions defined on positive integers.
(Note that all runtime functions satisfy these conditions.)
We say that <SPAN CLASS="MATH"><I>f</I> (<I>N</I>)</SPAN> is <SPAN CLASS="MATH"><I>O</I>(<I>g</I>(<I>N</I>))</SPAN> <I CLASS="slanted">(read: <SPAN CLASS="MATH"><I>f</I></SPAN> is big-oh of <SPAN CLASS="MATH"><I>g</I></SPAN>)</I>
if for some <SPAN CLASS="MATH"><I>c</I></SPAN> and <SPAN CLASS="MATH"><I>N</I><SUB>0</SUB></SPAN> the following condition holds:
<!-- MATH
 \begin{displaymath}
\forall N > N_0;~ f(N) < c.g(N)
\end{displaymath}
 -->
<P></P>
<DIV ALIGN="CENTER" CLASS="mathdisplay">
<IMG
 WIDTH="12" HEIGHT="30" ALIGN="MIDDLE" BORDER="0"
 SRC="/i/education/complexity1.png"
 ALT="$\displaystyle \forall$"><I>N</I> &gt; <I>N</I><SUB>0</SUB>;&#160;<I>f</I> (<I>N</I>) &lt; <I>c</I>.<I>g</I>(<I>N</I>)
</DIV><P></P>

<P>
In human words, <SPAN CLASS="MATH"><I>f</I> (<I>N</I>)</SPAN> is <SPAN CLASS="MATH"><I>O</I>(<I>g</I>(<I>N</I>))</SPAN>, if for some <SPAN CLASS="MATH"><I>c</I></SPAN> almost the entire graph 
of the function <SPAN CLASS="MATH"><I>f</I></SPAN> is below the graph of the function <SPAN CLASS="MATH"><I>c</I>.<I>g</I></SPAN>. 
Note that this means that <SPAN CLASS="MATH"><I>f</I></SPAN> grows at most as fast as <SPAN CLASS="MATH"><I>c</I>.<I>g</I></SPAN> does. 

<P>
Instead of "<SPAN CLASS="MATH"><I>f</I> (<I>N</I>)</SPAN> is <SPAN CLASS="MATH"><I>O</I>(<I>g</I>(<I>N</I>))</SPAN>" we usually write <!-- MATH
 $f(N) = O(g(N))$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <I>O</I>(<I>g</I>(<I>N</I>))</SPAN>. 
Note that this "equation" is <B>not symmetric</B> - 
the notion "<!-- MATH
 $O(g(N)) = f(N)$
 -->
<SPAN CLASS="MATH"><I>O</I>(<I>g</I>(<I>N</I>)) = <I>f</I> (<I>N</I>)</SPAN>" has no sense and 
"<!-- MATH
 $g(N) = O(f(N))$
 -->
<SPAN CLASS="MATH"><I>g</I>(<I>N</I>) = <I>O</I>(<I>f</I> (<I>N</I>))</SPAN>" doesn't have to be true (as we will see later). 
(If you are not comfortable with this notation, imagine <SPAN CLASS="MATH"><I>O</I>(<I>g</I>(<I>N</I>))</SPAN>
to be a set of functions and imagine that there is a <SPAN CLASS="MATH"><IMG
 WIDTH="14" HEIGHT="29" ALIGN="MIDDLE" BORDER="0"
 SRC="/i/education/complexity2.png"
 ALT="$ \in$"></SPAN> instead
of <SPAN CLASS="MATH">=</SPAN>.)

<P>
What we defined above is known as the big-oh notation and is conveniently
used to specify upper bounds on function growth.

<P>
E.g. consider the function <!-- MATH
 $f(N) = 3N(N-1)/2 + N = 1.5N^2 - 0.5N$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = 3<I>N</I>(<I>N</I> - 1)/2 + <I>N</I> = 1.5<I>N</I><SUP>2</SUP> - 0.5<I>N</I></SPAN> from
Example 2. We may say that <!-- MATH
 $f(N)=O(N^2)$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <I>O</I>(<I>N</I><SUP>2</SUP>)</SPAN> (one possibility for the constants
is <SPAN CLASS="MATH"><I>c</I> = 2</SPAN> and <SPAN CLASS="MATH"><I>N</I><SUB>0</SUB> = 0</SPAN>). This means that <SPAN CLASS="MATH"><I>f</I></SPAN> doesn't grow (asymptotically) 
faster than <SPAN CLASS="MATH"><I>N</I><SUP>2</SUP></SPAN>.

<P>
Note that even the exact runtime function <SPAN CLASS="MATH"><I>f</I></SPAN> doesn't give an exact 
answer to the question "How long will the program run on my machine?" 
But the important observation in the example case is that the runtime function is
quadratic. If we double the input size, the runtime will increase
approximately to four times the current runtime, no matter how fast our
computer is. 

<P>
The <!-- MATH
 $f(N)=O(N^2)$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <I>O</I>(<I>N</I><SUP>2</SUP>)</SPAN> upper bound gives us almost the same - it guarantees that
the growth of the runtime function is at most quadratic. 

<P>
Thus, we will use the <SPAN CLASS="MATH"><I>O</I></SPAN>-notation to describe the time (and sometimes also 
memory) complexity of algorithms. For the algorithm from Example 2 we would say 
"The time complexity of this algorithm is <SPAN CLASS="MATH"><I>O</I>(<I>N</I><SUP>2</SUP>)</SPAN>"
or shortly
"This algorithm is <SPAN CLASS="MATH"><I>O</I>(<I>N</I><SUP>2</SUP>)</SPAN>".

<P>

<P><P>
<BR>

<P>
In a similar way we defined <SPAN CLASS="MATH"><I>O</I></SPAN> we may define <SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity3.png"
 ALT="$ \Omega$"></SPAN> and <SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$"></SPAN>. 

<P>
We say that <SPAN CLASS="MATH"><I>f</I> (<I>N</I>)</SPAN> is <!-- MATH
 $\Omega(g(N))$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity3.png"
 ALT="$ \Omega$">(<I>g</I>(<I>N</I>))</SPAN> if <!-- MATH
 $g(N) = O(f(N))$
 -->
<SPAN CLASS="MATH"><I>g</I>(<I>N</I>) = <I>O</I>(<I>f</I> (<I>N</I>))</SPAN>, in other words if <SPAN CLASS="MATH"><I>f</I></SPAN> grows at least as fast as <SPAN CLASS="MATH"><I>g</I></SPAN>. 

<P>
We say that <!-- MATH
 $f(N)=\Theta(g(N))$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>g</I>(<I>N</I>))</SPAN> if <!-- MATH
 $f(N)=O(g(N))$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <I>O</I>(<I>g</I>(<I>N</I>))</SPAN> and <!-- MATH
 $g(N)=O(f(N))$
 -->
<SPAN CLASS="MATH"><I>g</I>(<I>N</I>) = <I>O</I>(<I>f</I> (<I>N</I>))</SPAN>, 
in other words if both functions have approximately the same rate of growth.

<P>
As it should be obvious, <SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity3.png"
 ALT="$ \Omega$"></SPAN> is used to specify lower bounds and 
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$"></SPAN> is used to give a tight asymptotic bound on a function.
There are other similar bounds, but these are the ones you'll encounter
most of the time.

<P>

<span class="bodySubtitle"><A NAME="SECTION00070000000000000000">
Some examples of using the notation</A>
</span>

<P>

<UL>
<LI><!-- MATH
 $1.5N^2 - 0.5 N = O(N^2)$
 -->
<SPAN CLASS="MATH">1.5<I>N</I><SUP>2</SUP> -0.5<I>N</I> = <I>O</I>(<I>N</I><SUP>2</SUP>)</SPAN>.
</LI>
<LI><!-- MATH
 $47N \log N = O(N^2)$
 -->
<SPAN CLASS="MATH">47<I>N</I> log&#160;<I>N</I> = <I>O</I>(<I>N</I><SUP>2</SUP>)</SPAN>.
</LI>
<LI><!-- MATH
 $N \log N + 1\,000\,047N = \Theta(N\log N)$
 -->
<SPAN CLASS="MATH"><I>N</I> log&#160;<I>N</I> + 1&#160;000&#160;047<I>N</I> = <IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I> log&#160;<I>N</I>)</SPAN>.
</LI>
<LI>All polynomials of order <SPAN CLASS="MATH"><I>k</I></SPAN> are <SPAN CLASS="MATH"><I>O</I>(<I>N</I><SUP>k</SUP>)</SPAN>.
</LI>
<LI>The time complexity of the algorithm in Example 2 is <!-- MATH
 $\Theta(N^2)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I><SUP>2</SUP>)</SPAN>.
</LI>
<LI>If an algorithm is <SPAN CLASS="MATH"><I>O</I>(<I>N</I><SUP>2</SUP>)</SPAN>, it is also <SPAN CLASS="MATH"><I>O</I>(<I>N</I><SUP>5</SUP>)</SPAN>.
</LI>
<LI>Each comparision-based sorting algorithm is <!-- MATH
 $\Omega(N\log N)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity3.png"
 ALT="$ \Omega$">(<I>N</I> log&#160;<I>N</I>)</SPAN>.
</LI>
<LI>MergeSort run on an array with <SPAN CLASS="MATH"><I>N</I></SPAN> elements does roughly <SPAN CLASS="MATH"><I>N</I> log&#160;<I>N</I></SPAN> comparisions.
Thus the time complexity of MergeSort is <!-- MATH
 $\Theta(N\log N)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I> log&#160;<I>N</I>)</SPAN>.
If we trust the previous statement, this means that MergeSort is an
asymptotically optimal general sorting algorithm.
</LI>
<LI>The algorithm in Example 2 uses <SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I>)</SPAN> bytes of memory.
</LI>
<LI>The function giving my number of teeth in time is <SPAN CLASS="MATH"><I>O</I>(1)</SPAN>.
</LI>
<LI>A naive backtracking algorithm trying to solve chess is <SPAN CLASS="MATH"><I>O</I>(1)</SPAN> as the tre
of positions it will examine is finite. (But of course in this case the constant hidden behind
the <SPAN CLASS="MATH"><I>O</I>(1)</SPAN> is unbelievably large.)
</LI>
<LI>The statement "Time complexity of this algorithm is at least <SPAN CLASS="MATH"><I>O</I>(<I>N</I><SUP>2</SUP>)</SPAN>" is meaningless.
(It says: "Time complexity of this algorithm is at least at most roughly quadratic."
The speaker probably wanted to say: "Time complexity of this algorithm is <!-- MATH
 $\Omega(N^2)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity3.png"
 ALT="$ \Omega$">(<I>N</I><SUP>2</SUP>)</SPAN>.")
</LI>
</UL>

<P>
When speaking about the time/memory complexity of an algorithm, instead of using the
formal <!-- MATH
 $\Theta(f(n))$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>f</I> (<I>n</I>))</SPAN>-notation we may simply state the class of functions <SPAN CLASS="MATH"><I>f</I></SPAN> belongs to.
E.g. if <!-- MATH
 $f(N)=\Theta(N)$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I>)</SPAN>, we call the algorithm <EM>linear</EM>. More examples:

<P>

<UL>
<LI><!-- MATH
 $f(N) = \Theta(\log N)$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(log&#160;<I>N</I>)</SPAN>: logarithmic
</LI>
<LI><!-- MATH
 $f(N) = \Theta(N^2)$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I><SUP>2</SUP>)</SPAN>: quadratic
</LI>
<LI><!-- MATH
 $f(N) = \Theta(N^3)$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I><SUP>3</SUP>)</SPAN>: cubic
</LI>
<LI><!-- MATH
 $f(N) = O(N^k)$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <I>O</I>(<I>N</I><SUP>k</SUP>)</SPAN> for some <SPAN CLASS="MATH"><I>k</I></SPAN>: polynomial
</LI>
<LI><!-- MATH
 $f(N) = \Omega(2^N)$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity3.png"
 ALT="$ \Omega$">(2<SUP>N</SUP>)</SPAN>: exponential
</LI>
</UL>

<P>
For graph problems, the complexity <!-- MATH
 $\Theta(N+M)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I> + <I>M</I>)</SPAN> is known as "linear in the graph size".

<P>

<span class="bodySubtitle"><A NAME="SECTION00080000000000000000">
Determining execution time from an asymptotic bound</A>
</span>

<P>
For most algorithms you may encounter in praxis, the constant hidden behind the <SPAN CLASS="MATH"><I>O</I></SPAN>
(or <SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$"></SPAN>) is usually relatively small. If an algorithm is <!-- MATH
 $\Theta(N^2)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I><SUP>2</SUP>)</SPAN>, you 
may expect that the exact time complexity is something like <SPAN CLASS="MATH">10<I>N</I><SUP>2</SUP></SPAN>, not <SPAN CLASS="MATH">10<SUP>7</SUP><I>N</I><SUP>2</SUP></SPAN>. 

<P>
The same observation in other words: if the constant is large, it is usually somehow related to some
constant in the problem statement. In this case it is good practice to give this constant
a name and to include it in the asymptotic notation. 

<P>
An example: The problem is to count occurences of each letter in a string of <SPAN CLASS="MATH"><I>N</I></SPAN> letters. A naive algorithm
passes through the whole string once for each possible letter. The size of alphabet is fixed (e.g.
at most 255 in C), thus the algorithm is linear in <SPAN CLASS="MATH"><I>N</I></SPAN>. Still, it is better to write that its 
time complexity is <!-- MATH
 $\Theta(|S|.N)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(| <I>S</I>|.<I>N</I>)</SPAN>, where <SPAN CLASS="MATH"><I>S</I></SPAN> is the alphabet used. 
(Note that there is a better algorithm solving this problem in <!-- MATH
 $\Theta(|S|+N)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(| <I>S</I>| + <I>N</I>)</SPAN>.)

<P>
In a TopCoder contest, an algorithm doing <!-- MATH
 $1\,000\,000\,000$
 -->
<SPAN CLASS="MATH">1&#160;000&#160;000&#160;000</SPAN> multiplications runs barely in time. 
This fact together with the above observation and some experience with TopCoder problems
can help us fill the following table:

<P>
<DIV ALIGN="CENTER">
<table width="300" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
<TR><TD class="sidebarTitle" ALIGN="CENTER">complexity</TD>
<TD class="sidebarTitle" ALIGN="CENTER">maximum <SPAN CLASS="MATH"><I>N</I></SPAN></TD>
</TR>
<TR><TD class="sidebarText" ALIGN="CENTER"><SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I>)</SPAN></TD>
<TD class="sidebarText" ALIGN="CENTER"><!-- MATH
 $100\,000\,000$
 -->
<SPAN CLASS="MATH">100&#160;000&#160;000</SPAN></TD>
</TR>
<TR><TD class="sidebarText" ALIGN="CENTER"><!-- MATH
 $\Theta(N\log N)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I> log&#160;<I>N</I>)</SPAN></TD>
<TD class="sidebarText" ALIGN="CENTER"><!-- MATH
 $40\,000\,000$
 -->
<SPAN CLASS="MATH">40&#160;000&#160;000</SPAN></TD>
</TR>
<TR><TD class="sidebarText" ALIGN="CENTER"><!-- MATH
 $\Theta(N^2)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I><SUP>2</SUP>)</SPAN></TD>
<TD class="sidebarText" ALIGN="CENTER"><SPAN CLASS="MATH">10&#160;000</SPAN></TD>
</TR>
<TR><TD class="sidebarText" ALIGN="CENTER"><!-- MATH
 $\Theta(N^3)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I><SUP>3</SUP>)</SPAN></TD>
<TD class="sidebarText" ALIGN="CENTER"><SPAN CLASS="MATH">500</SPAN></TD>
</TR>
<TR><TD class="sidebarText" ALIGN="CENTER"><!-- MATH
 $\Theta(N^4)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I><SUP>4</SUP>)</SPAN></TD>
<TD class="sidebarText" ALIGN="CENTER"><SPAN CLASS="MATH">90</SPAN></TD>
</TR>
<TR><TD class="sidebarText" ALIGN="CENTER"><!-- MATH
 $\Theta(2^N)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(2<SUP>N</SUP>)</SPAN></TD>
<TD class="sidebarText" ALIGN="CENTER"><SPAN CLASS="MATH">20</SPAN></TD>
</TR>
<TR><TD class="sidebarText" ALIGN="CENTER"><!-- MATH
 $\Theta(N!)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$">(<I>N</I>!)</SPAN></TD>
<TD class="sidebarText" ALIGN="CENTER"><SPAN CLASS="MATH">11</SPAN></TD>
</TR>
</TABLE>
</DIV>
<DIV ALIGN="CENTER"><BR>Table 3. Approximate maximum problem size solvable in 8 seconds.</DIV>

<P>

<span class="bodySubtitle"><A NAME="SECTION00090000000000000000">
A note on algorithm analysis</A>
</span>

<P>
Usually if we present an algorithm, the best way to present its time complexity
is to give a <SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity4.png"
 ALT="$ \Theta$"></SPAN>-bound. However, it is common practice to only give an <SPAN CLASS="MATH"><I>O</I></SPAN>-bound
- the other bound is usually trivial, <SPAN CLASS="MATH"><I>O</I></SPAN> is much easier to type and better known.
Still, don't forget that <SPAN CLASS="MATH"><I>O</I></SPAN> represents only an upper bound. Usually we try to find
an <SPAN CLASS="MATH"><I>O</I></SPAN>-bound that's as good as possible.

<P>
<B>Example 3.</B>
Given is a sorted
array <SPAN CLASS="MATH"><I>A</I></SPAN>. Determine whether it contains two elements with the difference <SPAN CLASS="MATH"><I>D</I></SPAN>.
Consider the following code solving this problem:

<P>
<PRE>
int j=0;
for (int i=0; i&lt;N; i++) {
  while ( (j&lt;N-1) &amp;&amp; (A[i]-A[j] &gt; D) ) 
    j++; 
  if (A[i]-A[j] == D) return 1;
}
</PRE>

<P>
It is easy to give an <SPAN CLASS="MATH"><I>O</I>(<I>N</I><SUP>2</SUP>)</SPAN> bound for the time complexity of this algorithm - the
inner while-cycle is called <SPAN CLASS="MATH"><I>N</I></SPAN> times, each time we increase <SPAN CLASS="MATH"><I>j</I></SPAN> at most <SPAN CLASS="MATH"><I>N</I></SPAN> times.
But a more careful analysis shows that in fact we can give an <SPAN CLASS="MATH"><I>O</I>(<I>N</I>)</SPAN> bound on the 
time complexity of this algorithm - it is sufficient to realize that during the
<B>whole execution</B> of the algorithm the command "<TT>j++;</TT>" is executed no more than <SPAN CLASS="MATH"><I>N</I></SPAN> times.

<P>
If we said "this algorithm is <SPAN CLASS="MATH"><I>O</I>(<I>N</I><SUP>2</SUP>)</SPAN>", we would have been right. 
But by saying "this algorithm is <SPAN CLASS="MATH"><I>O</I>(<I>N</I>)</SPAN>" we give more information
about the algorithm.

<P>

<span class="bodySubtitle"><A NAME="SECTION000100000000000000000">
Conclusion</A>
</span>

<P>
We have shown how to write bounds on the time complexity of algorithms.
We have also demonstrated why this way of characterizing algorithms is natural
and (usually more-or-less) sufficient. 

<P>
The next logical step is to show how to estimate the time complexity of a given
algorithm. As we have already seen in Example 3, sometimes this can be messy.
It gets really messy when recursion is involved.
We will address these issues in the second part of this article.

            

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
