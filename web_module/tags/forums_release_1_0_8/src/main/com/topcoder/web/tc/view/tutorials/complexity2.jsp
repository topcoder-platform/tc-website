<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>

<jsp:include page="../script.jsp" />
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

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="alg_tutorials"/>
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

<div style="float: right;"><tc-webtag:forumLink forumID="505848" message="Discuss this article" /></div>
<span class="bodyTitle">Computational Complexity: Section 2</span>

<p>
<img src="/i/m/misof_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

<A href="/tc?module=Static&d1=tutorials&d2=complexity1">...read Section 1</A>
<br/><br/>
<P>
In this part of the article we will focus on estimating the time complexity for recursive programs.
In essence, this will lead to finding the order of growth for solutions of recurrence equations.
Don't worry if you don't understand what exactly is a recurrence solution, we will explain it
in the right place at the right time. But first we will consider a simpler case - programs
without recursion.

<P>

<span class="bodySubtitle"><A NAME="SECTION00010000000000000000">
Nested loops</A>
</span>

<P>
First of all let's consider simple programs that contain no function calls. The rule of thumb to
find an upper bound on the time complexity of such a program is:

<UL>
<LI>estimate the maximum number of times each loop can be executed,
</LI>
<LI><B>add</B> these bounds for cycles following each other.
</LI>
<LI><B>multiply</B> these bounds for nested cycles/parts of code,
</LI>
</UL>

<P>

<B>Example 1.</B> Estimating the time complexity of a random piece of code.

<P>
<PRE>
int result=0;                           //  1
for (int i=0; i&lt;N; i++)                 //  2
  for (int j=i; j&lt;N; j++) {             //  3
    for (int k=0; k&lt;M; k++) {           //  4
      int x=0;                          //  5
      while (x&lt;N) { result++; x+=3; }   //  6
    }                                   //  7
    for (int k=0; k&lt;2*M; k++)           //  8
      if (k%7 == 4) result++;           //  9
  }                                     // 10
</PRE>
The time complexity of the while-cycle in line 6 is clearly <SPAN CLASS="MATH"><I>O</I>(<I>N</I>)</SPAN> - it
is executed no more than <SPAN CLASS="MATH"><I>N</I>/3&nbsp; + 1</SPAN> times.

<P>
Now consider the for-cycle in
lines 4-7. The variable k is clearly incremented <SPAN CLASS="MATH"><I>O</I>(<I>M</I>)</SPAN> times. Each time the whole while-cycle in line 6 is executed. Thus the total time complexity of the lines 4-7 can be bounded by <SPAN CLASS="MATH"><I>O</I>(<I>MN</I>)</SPAN>.

<P>
The time complexity of the for-cycle in lines 8-9 is <SPAN CLASS="MATH"><I>O</I>(<I>M</I>)</SPAN>. Thus the execution time of lines 4-9 is <!-- MATH
 $O(MN + M) = O(MN)$
 -->
<SPAN CLASS="MATH"><I>O</I>(<I>MN</I> + <I>M</I>) = <I>O</I>(<I>MN</I>)</SPAN>.

<P>
This inner part is executed <SPAN CLASS="MATH"><I>O</I>(<I>N</I><SUP>2</SUP>)</SPAN> times - once for each possible combination of <SPAN CLASS="MATH"><I>i</I></SPAN> and <SPAN CLASS="MATH"><I>j</I></SPAN>.
(Note that there are only <SPAN CLASS="MATH"><I>N</I>(<I>N</I> + 1)/2</SPAN> possible values for <SPAN CLASS="MATH">[<I>i</I>, <I>j</I>]</SPAN>. Still, <SPAN CLASS="MATH"><I>O</I>(<I>N</I><SUP>2</SUP>)</SPAN> is a correct upper
bound.)

<P>
From the facts above follows that the total time complexity of the algorithm
in Example 1 is <!-- MATH
 $O(N^2 . MN) = O(MN^3)$
 -->
<SPAN CLASS="MATH"><I>O</I>(<I>N</I><SUP>2</SUP>.<I>MN</I>) = <I>O</I>(<I>MN</I><SUP>3</SUP>)</SPAN>.

<P>
From now on we will assume that the reader is able to estimate the time
complexity of simple parts of code using the method demonstrated above. We will
now consider programs using recursion (i.e. a function occasionally calling
itself with different parameters) and try to analyze the impact of these
recursive calls on their time complexity.

<P>

<span class="bodySubtitle"><A NAME="SECTION00020000000000000000">
Using recursion to generate combinatorial objects</A>
</span>

<P>
One common use of recursion is to implement a <EM>backtracking</EM> algorithm to generate all possible
solutions of a problem. The general idea is to generate the solution incrementally and to step back
and try another way once all solutions for the current branch have been exhausted.

<P>
This approach is not absolutely universal, there may be problems where it is impossible to generate
the solution incrementally. However, very often the set of all possible solutions of a problem
corresponds to the set of all combinatorial objects of some kind. Most often it is the set of
all permutations (of a given size), but other objects (combinations, partitions, etc.) can be seen
from time to time.

<P>
As a side note, it is always possible to generate all strings of zeroes and ones, check each of
them (i.e. check whether it corresponds to a valid solution) and keep the best found so far. If we
can find an upper bound on the size of the best solution, this approach is finite. However,
this approach is everything but fast. Don't use it if there is <B>any</B> other way.

<P>

<B>Example 2.</B> A trivial algorithm to generate all permutations of numbers 0 to <SPAN CLASS="MATH"><I>N</I> - 1</SPAN>.

<P>
<PRE>
vector&lt;int&gt; permutation(N);
vector&lt;int&gt; used(N,0);

void try(int which, int what) {
  // try taking the number "what" as the "which"-th element
  permutation[which] = what;
  used[what] = 1;

  if (which == N-1)
    outputPermutation();
  else
    // try all possibilities for the next element
    for (int next=0; next&lt;N; next++)
      if (!used[next])
        try(which+1, next);

  used[what] = 0;
}

int main() {
  // try all possibilities for the first element
  for (int first=0; first&lt;N; first++)
    try(0,first);
}
</PRE>

<P>
In this case a trivial <B>lower</B> bound on the time complexity is the number
of possible solutions. Backtracking algorithms are usually used to solve hard
problems - i.e. such that we don't know whether a significantly more efficient
solution exists. Usually the solution space is quite large and uniform
and the algorithm can be implemented so that its time complexity is close to
the theoretical lower bound. To get an upper bound it should be enough to check
how much additional (i.e. unnecessary) work the algorithm does.

<P>
The number of possible solutions, and thus the
time complexity of such algorithms, is usually exponential - or worse.

<P>

<span class="bodySubtitle"><A NAME="SECTION00030000000000000000">
Divide&amp;conquer using recursion</A>
</span>

<P>
From the previous example we could get the feeling that recursion is evil
and leads to horribly slow programs. The contrary is true.
Recursion can be a very powerful tool in the design of effective algorithms.
The usual way to create an effective recursive algorithm is to apply the <EM>
divide&amp;conquer paradigm</EM> - try to split the problem into several parts, solve
each part separately and in the end combine the results to obtain the result
for the original problem. Needless to say, the "solve each part separately" is
usually implemented using recursion - and thus applying the same method again
and again, until the problem is sufficiently small to be solved by brute force.

<P>

<B>Example 3.</B> The sorting algorithm MergeSort described in pseudocode.

<P>
<PRE>
MergeSort(sequence S) {
  if (size of S &lt;= 1) return S;
  split S into S_1 and S_2 of roughly the same size;
  MergeSort(S_1);
  MergeSort(S_2);
  combine sorted S_1 and sorted S_2 to obtain sorted S;
  return sorted S;
}
</PRE>

<P>
Clearly <SPAN CLASS="MATH"><I>O</I>(<I>N</I>)</SPAN> time is enough to split a sequence with <SPAN CLASS="MATH"><I>N</I></SPAN> elements into two
parts. (Depending on the implementation this may be even possible in constant
time.) Combining the shorter sorted sequences can be done in <SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(<I>N</I>)</SPAN>: Start
with an empty <SPAN CLASS="MATH"><I>S</I></SPAN>. At each moment the smallest element not yet in <SPAN CLASS="MATH"><I>S</I></SPAN> is either
at the beginning of <SPAN CLASS="MATH"><I>S</I><SUB>1</SUB></SPAN> or at the beginning of <SPAN CLASS="MATH"><I>S</I><SUB>2</SUB></SPAN>. Move this element to the end of <SPAN CLASS="MATH"><I>S</I></SPAN> and continue.

<P>
Thus the total time to MergeSort a sequence with <SPAN CLASS="MATH"><I>N</I></SPAN> elements is <SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(<I>N</I>)</SPAN> plus the time needed to make the two recursive calls.

<P>
Let <SPAN CLASS="MATH"><I>f</I> (<I>N</I>)</SPAN> be the time complexity of MergeSort as defined in the previous part of our article. The discussion above leads us to the following equation:

<P>
<DIV ALIGN="CENTER" CLASS="mathdisplay">
<IMG SRC="/i/education/complexity2/new19.png">
</DIV>

<P>
where <SPAN CLASS="MATH"><I>p</I></SPAN> is a linear function representing the amount of work spent on splitting the
sequence and merging the results.

<P>
Basically, this is just a <I CLASS="slanted">recurrence equation</I>. If you don't know this term, please don't
be afraid. The word "recurrence" stems from the latin phrase for "to run back". Thus the
name just says that the next values of <SPAN CLASS="MATH"><I>f</I></SPAN> are defined using the previous (i.e. smaller) values
of <SPAN CLASS="MATH"><I>f</I></SPAN>.

<P>
Well, to be really formal, for the equation
to be complete we should specify some initial values - in this case, <SPAN CLASS="MATH"><I>f</I> (1)</SPAN>. This (and knowing
the implementation-specific function <SPAN CLASS="MATH"><I>p</I></SPAN>) would enable us to compute the exact values of
<SPAN CLASS="MATH"><I>f</I></SPAN>.

<P>
But as you hopefully understand by now, this is not necessarily our goal. While it is
theoretically possible to compute a closed-form formula for <SPAN CLASS="MATH"><I>f</I> (<I>N</I>)</SPAN>, this formula would
most probably be really ugly... and we don't really need it. We only want to find
a <SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$"></SPAN>-bound (and sometimes only an <SPAN CLASS="MATH"><I>O</I></SPAN>-bound) on the growth of <SPAN CLASS="MATH"><I>f</I></SPAN>. Luckily, this
can often be done quite easily, if you know some tricks of the trade.

<P>
As a consequence, we won't be interested in the exact form of <SPAN CLASS="MATH"><I>p</I></SPAN>, all we need to know
is that <!-- MATH
 $p(N)=\Theta(N)$
 -->
<SPAN CLASS="MATH"><I>p</I>(<I>N</I>) = <IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(<I>N</I>)</SPAN>. Also, we don't need to specify the initial values for the
equation. We simply assume that all problem instances with small <SPAN CLASS="MATH"><I>N</I></SPAN> can be solved in
constant time.

<P>
The rationale behind the last simplification: While changing the initial values does change the
solution to the recurrence equation, it usually doesn't change its asymptotic order of
growth. (If your intuition fails you here, try playing with the equation above.
For example fix <SPAN CLASS="MATH"><I>p</I></SPAN> and try to compute <SPAN CLASS="MATH"><I>f</I> (8)</SPAN>, <SPAN CLASS="MATH"><I>f</I> (16)</SPAN> and <SPAN CLASS="MATH"><I>f</I> (32)</SPAN> for different values of <SPAN CLASS="MATH"><I>f</I> (1)</SPAN>.)

<P>
If this would be a formal textbook, at this point we would probably have to develop some theory
that would allow us to deal with the floor and ceiling functions in our equations.
Instead we will simply neglect them from now on. (E.g. we can assume that each division
will be integer division, rounded down.)

<P>
A reader skilled in math is encouraged to prove that if <SPAN CLASS="MATH"><I>p</I></SPAN> is a polynomial (with
non-negative values on N) and <!-- MATH
 $q(n)=p(n+1)$
 -->
<SPAN CLASS="MATH"><I>q</I>(<I>n</I>) = <I>p</I>(<I>n</I> + 1)</SPAN> then <!-- MATH
 $q(n)=\Theta(p(n))$
 -->
<SPAN CLASS="MATH"><I>q</I>(<I>n</I>) = <IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(<I>p</I>(<I>n</I>))</SPAN>. Using this observation
we may formally prove that (assuming the <SPAN CLASS="MATH"><I>f</I></SPAN> we seek is polynomially-bounded) the right side of
each such equation remains asymptotically the same if we replace each ceiling function
by a floor function.

<P>
The observations we made allow us to rewrite our example equation in a more simple way:

<DIV ALIGN="CENTER" CLASS="mathdisplay">
<A NAME="dva"></A>
<TABLE WIDTH="100%" ALIGN="CENTER">
<TR VALIGN="MIDDLE"><TD ALIGN="CENTER" NOWRAP>
  <IMG SRC="/i/education/complexity2/new31.png">
</TD>
<TD CLASS="eqno" WIDTH=10 ALIGN="RIGHT">
(<SPAN CLASS="arabic">1</SPAN>)</TD></TR>
</TABLE>
</DIV><P></P>

<P>
Note that this is not an equation in the classical sense. As in the examples in the first part
of this article, the equals sign now reads "is asymptotically equal to".
Usually there are lots of different functions that satisfy such an equation.
But usually all of them will have the same order of growth - and this is exactly what we want to determine.
Or, more generally, we want to find the smallest upper bound on the growth of <B>all possible</B>
functions that satisfy the given equation.

<P>
In the last sections of this article we will discuss various methods of solving these "equations".
But before we can do that, we need to know a bit more about logarithms.

<P>

<span class="bodySubtitle"><A NAME="SECTION00040000000000000000">
Notes on logarithms</A>
</span>

<P>
By now, you may have already asked one of the following questions: If the author writes that some complexity
is e.g. <!-- MATH
 $O(N\log N)$
 -->
<SPAN CLASS="MATH"><I>O</I>(<I>N</I> log&nbsp;<I>N</I>)</SPAN>, what is the base of the logarithm? In some cases, wouldn't <!-- MATH
 $O(N\log_2 N)$
 -->
<SPAN CLASS="MATH"><I>O</I>(<I>N</I> log<SUB>2</SUB><I>N</I>)</SPAN> be
a better bound?

<P>
The answer: The base of the logarithm does not matter, all logarithmic functions (with base <SPAN CLASS="MATH">&gt; 1</SPAN>)
are asymptotically equal. This is due to the well-known equation:

<DIV ALIGN="CENTER" CLASS="mathdisplay">
<A NAME="dva"></A>
<TABLE WIDTH="100%" ALIGN="CENTER">
<TR VALIGN="MIDDLE"><TD ALIGN="CENTER" NOWRAP>
  <IMG SRC="/i/education/complexity2/new35.png">
</TD>
<TD CLASS="eqno" WIDTH=10 ALIGN="RIGHT">
(<SPAN CLASS="arabic">2</SPAN>)</TD></TR>
</TABLE>
</DIV><P></P>

<P>
Note that given two bases <SPAN CLASS="MATH"><I>a</I></SPAN>, <SPAN CLASS="MATH"><I>b</I></SPAN>, the number <!-- MATH
 $1/\log_b a$
 -->
<SPAN CLASS="MATH">1/log<SUB>b</SUB><I>a</I></SPAN> is just a constant, and thus
the function <SPAN CLASS="MATH">log<SUB>a</SUB><I>N</I></SPAN> is just a constant multiple of <SPAN CLASS="MATH">log<SUB>b</SUB><I>N</I></SPAN>.

<P>
To obtain more clean and readable expressions, we always use the notation <SPAN CLASS="MATH">log&nbsp;<I>N</I></SPAN> inside big-Oh
expressions, even if logarithms with a different base were used in the computation of the bound.

<P>
By the way, sadly the meaning of <SPAN CLASS="MATH">log&nbsp;<I>N</I></SPAN> differs from country to country. To avoid ambiguity
where it may occur: I use <SPAN CLASS="MATH">log&nbsp;<I>N</I></SPAN> to denote the decadic (i.e. base-10) logarithm, <SPAN CLASS="MATH">ln&nbsp;<I>N</I></SPAN>
for the natural (i.e. base-<SPAN CLASS="MATH"><I>e</I></SPAN>) logarithm, <SPAN CLASS="MATH">lg&nbsp;<I>N</I></SPAN> for the binary logarithm and <SPAN CLASS="MATH">log<SUB>b</SUB><I>N</I></SPAN>
for the general case.

<P>

<P><P>
<BR>

<P>
Now we will show some useful tricks involving logarithms, we will need them later.
Suppose <SPAN CLASS="MATH"><I>a</I></SPAN>, <SPAN CLASS="MATH"><I>b</I></SPAN> are given constants such that <SPAN CLASS="MATH"><I>a</I>, <I>b</I> &gt; 1</SPAN>.

<P>
From (2) we get:

<P>
<DIV ALIGN="CENTER" CLASS="mathdisplay">
<IMG SRC="/i/education/complexity2/new46.png">
</DIV>

<P>
Using this knowledge, we can simplify the term
<SPAN CLASS="MATH"><IMG SRC="/i/education/complexity2/new47.png"></SPAN> as follows:

<DIV ALIGN="CENTER" CLASS="mathdisplay">
<A NAME="dva"></A>
<TABLE WIDTH="100%" ALIGN="CENTER">
<TR VALIGN="MIDDLE"><TD ALIGN="CENTER" NOWRAP>
  <IMG SRC="/i/education/complexity2/new48.png">
</TD>
<TD CLASS="eqno" WIDTH=10 ALIGN="RIGHT">
(<SPAN CLASS="arabic">3</SPAN>)</TD></TR>
</TABLE>
</DIV><P></P>

<P>

<span class="bodySubtitle"><A NAME="SECTION00050000000000000000">
The substitution method</A>
</span>

<P>
This method can be summarized in one sentence: Guess an asymptotic upper bound on <SPAN CLASS="MATH"><I>f</I></SPAN> and
(try to) prove it by induction.

<P>
As an example, we will prove that if <SPAN CLASS="MATH"><I>f</I></SPAN> satisfies the equation (1)
then
<!-- MATH
 $f(N) = O(N\log N)$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <I>O</I>(<I>N</I> log&nbsp;<I>N</I>)</SPAN>.

<P>
From (1) we know that

<P>
<DIV ALIGN="CENTER" CLASS="mathdisplay">
<IMG SRC="/i/education/complexity2/new52.png">
</DIV>

<P>
for some <SPAN CLASS="MATH"><I>c</I></SPAN>. Now we will prove that if we take a large enough (but constant) <SPAN CLASS="MATH"><I>d</I></SPAN>
then for almost all <SPAN CLASS="MATH"><I>N</I></SPAN> we have <!-- MATH
 $f(N) \leq dN\lg N$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) <IMG
 WIDTH="15" HEIGHT="29" ALIGN="MIDDLE" BORDER="0"
 SRC="/i/education/complexity2/img15.png"
 ALT="$ \leq$"> <I>dN</I> lg&nbsp;<I>N</I></SPAN>.
We will start by proving the induction step.

<P>
Assume that <!-- MATH
 $f(N/2) \leq d(N/2)\lg(N/2)$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>/2) <IMG
 WIDTH="15" HEIGHT="29" ALIGN="MIDDLE" BORDER="0"
 SRC="/i/education/complexity2/img15.png"
 ALT="$ \leq$"> <I>d</I> (<I>N</I>/2)lg(<I>N</I>/2)</SPAN>. Then

<P>
<DIV ALIGN="CENTER" CLASS="mathdisplay">
<IMG SRC="/i/education/complexity2/new57.png">
</DIV>

<P>
In other words, the induction step will hold as long as <SPAN CLASS="MATH"><I>d</I> &gt; <I>c</I></SPAN>. We are always
able to choose such <SPAN CLASS="MATH"><I>d</I></SPAN>.

<P>
We are only left with proving the inequality for some initial value <SPAN CLASS="MATH"><I>N</I></SPAN>. This gets
quite ugly when done formally. The general idea is that if the <SPAN CLASS="MATH"><I>d</I></SPAN> we found so far
is not large enough, we can always increase it to cover the initial cases.

<P>
Note that for our example equation we won't be able to prove it for <SPAN CLASS="MATH"><I>N</I> = 1</SPAN>, because
<SPAN CLASS="MATH">lg&nbsp;1 = 0</SPAN>. However, by taking <!-- MATH
 $d > 2(f(1)+f(2)+f(3)+c)$
 -->
<SPAN CLASS="MATH"><I>d</I> &gt; 2(<I>f</I> (1) + <I>f</I> (2) + <I>f</I> (3) + <I>c</I>)</SPAN> we can easily prove the inequality
for <SPAN CLASS="MATH"><I>N</I> = 2</SPAN> and <SPAN CLASS="MATH"><I>N</I> = 3</SPAN>, which is more than enough.

<P>
Please note what exactly did we prove. Our result is that if <SPAN CLASS="MATH"><I>f</I></SPAN> satisfies the
equation (1)
then for almost all <SPAN CLASS="MATH"><I>N</I></SPAN> we have <!-- MATH
 $f(N) \leq dN\lg N$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) <IMG
 WIDTH="15" HEIGHT="29" ALIGN="MIDDLE" BORDER="0"
 SRC="/i/education/complexity2/img15.png"
 ALT="$ \leq$"> <I>dN</I> lg&nbsp;<I>N</I></SPAN>, where <SPAN CLASS="MATH"><I>d</I></SPAN> is some fixed constant.
Conclusion: from (1)
 it follows that <!-- MATH
 $f(N)=O(N\lg N)$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <I>O</I>(<I>N</I> lg&nbsp;<I>N</I>)</SPAN>.

<P>

<span class="bodySubtitle"><A NAME="SECTION00060000000000000000">
The recursion tree</A>
</span>

<P>
To a beginner, the previous method won't be very useful. To use it successfully we need
to make a good guess - and to make a good guess we need some insight. The question
is, how to gain this insight? Let's take a closer look at what's happening, when we
try to evaluate the recurrence (or equivalently, when we run the corresponding recursive program).

<P>
We may describe the execution of a recursive program on a given input by a rooted tree.
Each node will correspond to some instance of the problem the program solves.
Consider an arbitrary vertex in our tree. If solving its instance requires recursive calls, this
vertex will have children corresponding to the smaller subproblems we solve recursively.
The root node of the tree is the input of the program, leaves represent small problems that
are solved by brute force.

<P>
Now suppose we label each vertex by the amount of work spent solving the corresponding problem
(excluding the recursive calls). Clearly the runtime is exactly the sum of all labels.

<P>
As always, we only want an asymptotic bound. To achieve this, we may "round" the labels to
make the summation easier. Again, we will demonstrate this method on examples.

<P>

<B>Example 4.</B> The recursion tree for MergeSort on 5 elements.

<P>
<DIV ALIGN="CENTER">
<IMG SRC="/i/education/complexity2/tree1.png">
</DIV>

<P>
The recursion tree for the corresponding recurrence equation. This time,
the number inside each vertex represents the number of steps the algorithm makes there.

<P>
<DIV ALIGN="CENTER">
<IMG SRC="/i/education/complexity2/tree2.png">
</DIV>

<P>
Note that in a similar way we may sketch the general form of the recursion tree for any
recurrence. Consider our old friend, the equation (1).
 Here we know that there is
a number <SPAN CLASS="MATH"><I>c</I></SPAN> such that the number of operations in each node can be bound by (<SPAN CLASS="MATH"><I>c</I></SPAN> times the
current value of <SPAN CLASS="MATH"><I>N</I></SPAN>). Thus the tree in the example below is indeed the worst possible
case.

<P>

<B>Example 5.</B> A worst-case tree for the general case of the recurrence equation (1).

<P>
<DIV ALIGN="CENTER">
<IMG SRC="/i/education/complexity2/tree3.png">
</DIV>

<P>
Now, the classical trick from combinatorics is to sum the elements in an order different from
the order in which they were created. In this case, consider an arbitrary level of the tree (i.e. a set
of vertices with the same depth). It is not hard to see that the total work on each of the
levels is <SPAN CLASS="MATH"><I>cN</I></SPAN>.

<P>
Now comes the second question: What is the number of levels? Clearly, the leaves correspond
to the trivial cases of the algorithm. Note that the size of the problem is halved in each step.
Clearly after <SPAN CLASS="MATH">lg&nbsp;<I>N</I></SPAN> steps we are left with a trivial problem of size 1, thus the number of
levels is <!-- MATH
 $\Theta(\log N)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(log&nbsp;<I>N</I>)</SPAN>.

<P>
Combining both observations we get the final result: The total amount of work done here is
<!-- MATH
 $\Theta(cN \times \log N) = \Theta(N\log N)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(<I>cN</I> <TT>x</TT> log&nbsp;<I>N</I>) = <IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(<I>N</I> log&nbsp;<I>N</I>)</SPAN>.

<P>
A side note. If the reader doesn't trust the simplifications we made when using this method,
he is invited to treat this method as a "way of making a good guess" and then to prove the result
using the substitution method. However, with a little effort the application of this method could
also be upgraded to a full formal proof.

<P>

<span class="bodySubtitle"><A NAME="SECTION00070000000000000000">
More recursion trees</A>
</span>

<P>
By now you should be asking: Was it really only a coincidence that the total amount of work on
each of the levels in Example 5 was the same?

<P>
The answer: No and yes. No, there's a simple reason why this happened, we'll discover it later.
Yes, because this is not always the case - as we'll see in the following two examples.

<P>

<B>Example 6.</B> Let's try to apply our new "recursion tree" method to solve the following
recurrence equation:

<P>
<DIV ALIGN="CENTER" CLASS="mathdisplay">
<IMG SRC="/i/education/complexity2/new72.png">
</DIV>

<P>
The recursion tree will look as follows:

<P>
<DIV ALIGN="CENTER">
<IMG SRC="/i/education/complexity2/tree5.png">
</DIV>

<P>
Let's try computing the total work for each of the first few levels.
Our results:

<P>
<DIV ALIGN="CENTER">
<table width="350" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
<TR><TD class="sidebarTitle" ALIGN="RIGHT">level</TD>
<TD class="sidebarText" ALIGN="CENTER" width="25%">1</TD>
<TD class="sidebarText" ALIGN="CENTER" width="25%">2</TD>
<TD class="sidebarText" ALIGN="CENTER" width="25%">3</TD>
<TD class="sidebarText" ALIGN="LEFT" width="25%">...</TD>
</TR>
<TR><TD class="sidebarTitle" ALIGN="RIGHT">work</TD>
<TD class="sidebarText" ALIGN="CENTER"><SPAN CLASS="MATH"><I>cN</I><SUP>3</SUP></SPAN></TD>
<TD class="sidebarText" ALIGN="CENTER"><!-- MATH
 ${3\over 8} cN^3$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="13" HEIGHT="35" ALIGN="MIDDLE" BORDER="0"
 SRC="/i/education/complexity2/img16.png"
 ALT="$ {3\over 8}$"><I>cN</I><SUP>3</SUP></SPAN></TD>
<TD class="sidebarText" ALIGN="CENTER"><!-- MATH
 ${3^2 \over 8^2} cN^3$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="19" HEIGHT="41" ALIGN="MIDDLE" BORDER="0"
 SRC="/i/education/complexity2/img17.png"
 ALT="$ {3^2 \over 8^2}$"><I>cN</I><SUP>3</SUP></SPAN></TD>
<TD class="sidebarText" ALIGN="LEFT">...</TD>
</TR>
</TABLE>
</DIV>

<P>
Clearly as we go deeper in the tree, the total amount of work on the current level decreases.
The question is, how fast does it decrease? As we move one level lower, there will be
three times that many subproblems. However, their size gets divided by 2, and thus the time
to process each of them decreases to one eighth of the original time. Thus the amount
of work is decreased by the factor <SPAN CLASS="MATH">3/8</SPAN>.

<P>
But this means that the entries in the table above form a geometric progression.
For a while assume that this progression is infinite. Then its sum would be

<P>
<DIV ALIGN="CENTER" CLASS="mathdisplay">
<IMG SRC="/i/education/complexity2/new77.png">
</DIV>

<P>
Thus the total amount of work in our tree is <!-- MATH
 $\Omega(N^3)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img20.png"
 ALT="$ \Omega$">(<I>N</I><SUP>3</SUP>)</SPAN> (summing the infinite sequence
gives us an upper bound).
But already the first element of our progression is <!-- MATH
 $\Theta(N^3)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(<I>N</I><SUP>3</SUP>)</SPAN>.
It follows that the total amount of work in our tree is <!-- MATH
 $\Theta(N^3)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(<I>N</I><SUP>3</SUP>)</SPAN>
and we are done.

<P>
The important generalization of this example: If the amounts of work at subsequent levels
of the recursion tree form a <B>decreasing geometric progression</B>, the total amount of work
is asymptotically the same as the amount of work done in the root node.

<P>
From this result we can deduce an interesting fact about the (hypothetical) algorithm behind
this recurrence equation: The recursive calls didn't take much time in this case, the most
time consuming part was preparing the recursive calls and/or processing the results.
(I.e. this is the part that should be improved if we need a faster algorithm.)

<P>

<B>Example 7.</B> Now let's try to apply our new "recursion tree" method to solve the following
recurrence equation:

<P>
<DIV ALIGN="CENTER" CLASS="mathdisplay">
<IMG SRC="/i/education/complexity2/new80.png">
</DIV>

<P>
The recursion tree will look as follows:

<P>
<DIV ALIGN="CENTER">
<IMG SRC="/i/education/complexity2/tree4.png">
</DIV>

<P>
Again, let's try computing the total work for each of the first few levels.
We get:

<P>
<DIV ALIGN="CENTER">
<table width="350" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
<TR><TD class="sidebarTitle" ALIGN="RIGHT">level</TD>
<TD class="sidebarText" ALIGN="CENTER" width="25%">1</TD>
<TD class="sidebarText" ALIGN="CENTER" width="25%">2</TD>
<TD class="sidebarText" ALIGN="CENTER" width="25%">3</TD>
<TD class="sidebarText" ALIGN="LEFT" width="25%">...</TD>
</TR>
<TR><TD class="sidebarTitle" ALIGN="RIGHT">work</TD>
<TD class="sidebarText" ALIGN="CENTER"><SPAN CLASS="MATH"><I>cN</I></SPAN></TD>
<TD class="sidebarText" ALIGN="CENTER"><!-- MATH
 ${5\over 3} cN$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="13" HEIGHT="35" ALIGN="MIDDLE" BORDER="0"
 SRC="/i/education/complexity2/img21.png"
 ALT="$ {5\over 3}$"><I>cN</I></SPAN></TD>
<TD class="sidebarText" ALIGN="CENTER"><!-- MATH
 ${5^2 \over 3^2} cN$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="19" HEIGHT="41" ALIGN="MIDDLE" BORDER="0"
 SRC="/i/education/complexity2/img22.png"
 ALT="$ {5^2 \over 3^2}$"><I>cN</I></SPAN></TD>
<TD class="sidebarText" ALIGN="LEFT">...</TD>
</TR>
</TABLE>
</DIV>

<P>
This time we have the opposite situation: As we go deeper in the tree, the total amount of
work on the current level increases. As we move one level lower, there will be
five times that many subproblems, each of them one third of the previous size,
the processing time is linear in problem size.
Thus the amount of work increased by the factor <SPAN CLASS="MATH">5/3</SPAN>.

<P>
Again, we want to compute the total amount of work. This time it won't be that easy,
because the most work is done on the lowest level of the tree. We need to know its depth.

<P>
The lowest level corresponds to problems of size 1. The size of a problem on level <SPAN CLASS="MATH"><I>k</I></SPAN> is
<SPAN CLASS="MATH"><I>N</I>/3<SUP>k</SUP></SPAN>. Solving the equation <SPAN CLASS="MATH">1 = <I>N</I>/3<SUP>k</SUP></SPAN> we get <!-- MATH
 $k=\log_3 N$
 -->
<SPAN CLASS="MATH"><I>k</I> = log<SUB>3</SUB><I>N</I></SPAN>.
Note that this time we explicitly state the base of the logarithm, as this time it will be
important.

<P>
Our recursion tree has <SPAN CLASS="MATH">log<SUB>3</SUB><I>N</I></SPAN> levels. Each of the levels has five times more vertices
than the previous one, thus the last level has
<SPAN CLASS="MATH"><IMG SRC="/i/education/complexity2/new89.png"></SPAN> levels. The total work
done on this level is then
<SPAN CLASS="MATH"><IMG SRC="/i/education/complexity2/new90.png"></SPAN>.

<P>
Note that using the trick (3) we may rewrite this as
<SPAN CLASS="MATH"><IMG SRC="/i/education/complexity2/new91.png"></SPAN>.

<P>
Now we want to sum the work done on all levels of the tree. Again, this is a geometric
progression. But instead of explicitly computing the sum, we now <B>reverse</B> it.
Now we have a <B>decreasing</B> geometric progression...and we are already in
the same situation as in the previous example.
Using the same reasoning we can show that the sum is asymptotically equal to the largest
element.

<P>
It follows that the total amount of work in our tree is
<SPAN CLASS="MATH"><IMG SRC="/i/education/complexity2/new92.png"></SPAN>
and we are done.

<P>
Note that the base-3 logarithm ends in the exponent, that's why the base is important. If the base was
different, also the result would be asymptotically different.

<P>

<span class="bodySubtitle"><A NAME="SECTION00080000000000000000">
The Master Theorem</A>
</span>

<P>
We already started to see a pattern here. Given a recurrence equation, take the corresponding
recurrence tree and compute the amounts of work done on each level of the tree. You will
get a geometric sequence. If it decreases, the total work is proportional to work done in
the root node. If it increases, the total work is proportional to the number of leaves.
If it remains the same, the total work is (the work done on one level) times (the number of levels).

<P>
Actually, there are a few ugly cases, but almost often one of these three cases occurs.
Moreover, it is possible to prove the statements from the previous paragraph formally.
The formal version of this theorem is known under the name Master Theorem.

<P>
For reference, we give the full formal statement of this theorem. (Note that knowing the
formal proof is not necessary to <B>apply</B> this theorem on a given recurrence equation.)

<P>
Let <SPAN CLASS="MATH"><I>a</I> <IMG
 WIDTH="15" HEIGHT="29" ALIGN="MIDDLE" BORDER="0"
 SRC="/i/education/complexity2/img24.png"
 ALT="$ \geq$"> 1</SPAN> and <SPAN CLASS="MATH"><I>b</I> &gt; 1</SPAN> be integer constants. Let <SPAN CLASS="MATH"><I>p</I></SPAN> be a non-negative non-decreasing function.
Let <SPAN CLASS="MATH"><I>f</I></SPAN> be any solution of the recurrence equation

<P>
<DIV ALIGN="CENTER" CLASS="mathdisplay">
<IMG SRC="/i/education/complexity2/new95.png">
</DIV>

<P>
Then:

<P>

<OL>
<LI>
If <SPAN CLASS="MATH"><IMG SRC="/i/education/complexity2/new96.png"></SPAN> for some
<SPAN CLASS="MATH"><IMG
 WIDTH="10" HEIGHT="13" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img26.png"
 ALT="$ \varepsilon$"> &gt; 0</SPAN> then
 <SPAN CLASS="MATH"><IMG SRC="/i/education/complexity2/new98.png"></SPAN>

<LI>
If <SPAN CLASS="MATH"><IMG SRC="/i/education/complexity2/new99.png"></SPAN>,
 then <!-- MATH
 $f(N) = \Theta( p(N) \log N )$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(<I>p</I>(<I>N</I>)log&nbsp;<I>N</I>)</SPAN>.

<LI>
If <SPAN CLASS="MATH"><IMG SRC="/i/education/complexity2/new101.png"></SPAN> for some
<SPAN CLASS="MATH"><IMG
 WIDTH="10" HEIGHT="13" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img26.png"
 ALT="$ \varepsilon$"> &gt; 0</SPAN>,
and if <!-- MATH
 $a p(N/b) \leq c p(N)$
 -->
<SPAN CLASS="MATH"><I>ap</I>(<I>N</I>/<I>b</I>) <IMG
 WIDTH="15" HEIGHT="29" ALIGN="MIDDLE" BORDER="0"
 SRC="/i/education/complexity2/img15.png"
 ALT="$ \leq$"> <I>cp</I>(<I>N</I>)</SPAN> for some <SPAN CLASS="MATH"><I>c</I> &lt; 1</SPAN> and for almost all <SPAN CLASS="MATH"><I>N</I></SPAN>,
then <!-- MATH
 $f(N) = \Theta( p(N) )$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = <IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(<I>p</I>(<I>N</I>))</SPAN>.
</LI>
</OL>

<P>
Case 1 corresponds to our Example 7. Most of the time is spent making the recursive calls and it's
the number of these calls that counts.

<P>
Case 2 corresponds to our Example 5. The time spent making the calls is roughly equal to the time
to prepare the calls and process the results. On all levels of the recursion tree we do roughly
the same amount of work, the depth of the tree is always logarithmic.

<P>
Case 3 corresponds to our Example 6. Most of the time is spent on
preparing the recursive calls and processing the results. Usually the result will be
asymptotically equal to the time spent in the root node.

<P>
Note the word "usually" and the extra condition in Case 3. For this result to hold
we need <SPAN CLASS="MATH"><I>p</I></SPAN> to be somehow "regular" - in the sense that for each node in the recursion tree
the time spent in the node must be greater than the time spent in its chidren (excluding
further recursive calls). This is nothing to worry about too much, most probably all
functions <SPAN CLASS="MATH"><I>p</I></SPAN> you will encounter in practice will satisfy this condition (if they satisfy
the first condition of Case 3).

<P>

<B>Example 8.</B> Let <SPAN CLASS="MATH"><I>f</I> (<I>N</I>)</SPAN> be the time Strassen's fast matrix multiplication algorithm
needs to multiply two <SPAN CLASS="MATH"><I>N</I> <TT>x</TT> <I>N</I></SPAN> square matrices. This is a recursive algorithm, that
makes 7 recursive calls, each time multiplying two <!-- MATH
 $(N/2)\times (N/2)$
 -->
<SPAN CLASS="MATH">(<I>N</I>/2) <TT>x</TT> (<I>N</I>/2)</SPAN> square matrices,
and then computes the answer in <!-- MATH
 $\Theta(N^2)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(<I>N</I><SUP>2</SUP>)</SPAN> time.

<P>
This leads us to the following recurrence equation:

<P>
<DIV ALIGN="CENTER" CLASS="mathdisplay">
<IMG SRC="/i/education/complexity2/new108.png">
</DIV>

<P>
Using the Master Theorem, we see that Case 1 applies. Thus the time complexity of Strassen's
algorithm is <!-- MATH
 $\Theta(N^{\log_2 7}) \approx \Theta(N^{2.807})$
 -->
<SPAN CLASS="MATH"><IMG SRC="/i/education/complexity2/new109.png"></SPAN>. Note that by implementing
the definition of matrix multiplication we get only a <!-- MATH
 $\Theta(N^3)$
 -->
<SPAN CLASS="MATH"><IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(<I>N</I><SUP>3</SUP>)</SPAN> algorithm.

<P>

<B>Example 9.</B> Occasionally we may encounter the situation when the problems in
the recursive calls are not of the same size. An example may be the "median-of-five" algorithm
to find the <SPAN CLASS="MATH"><I>k</I></SPAN>-th element of an array. It can be shown that its time complexity satisfies
the recurrence equation


<P>
<DIV ALIGN="CENTER" CLASS="mathdisplay">
<IMG SRC="/i/education/complexity2/new110.png">
</DIV>

<P>
How to solve it? Can the recursion tree be applied also in such asymmetric cases?
Is there a more general version of Master Theorem that handles also these cases?
And what should I do with the recurrence <!-- MATH
 $f(N) = 4f(N/4) + \Theta(N\log N)$
 -->
<SPAN CLASS="MATH"><I>f</I> (<I>N</I>) = 4<I>f</I> (<I>N</I>/4) + <IMG
 WIDTH="15" HEIGHT="14" ALIGN="BOTTOM" BORDER="0"
 SRC="/i/education/complexity2/img1.png"
 ALT="$ \Theta$">(<I>N</I> log&nbsp;<I>N</I>)</SPAN>, where the
Master Theorem doesn't apply?

<P>
We won't answer these questions here. This article doesn't claim to be the one and
only reference to computational complexity. If you are already asking these questions,
you understand the basics you need for programming contests - and if you
are interested in knowing more, there are good books around that can help you.

<P>
Thanks for reading this far. If you have any questions, comments, bug reports or
any other feedback, please use the Round tables. I'll do my best to answer.
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
