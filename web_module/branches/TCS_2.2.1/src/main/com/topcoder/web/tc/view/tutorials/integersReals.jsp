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
                <tc-webtag:forumLink forumID="505889" message="Discuss this article" /><br />
                <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
            </div>

<span class="bodyTitle">Representation of Integers and Reals</span>

<p>
<img src="/i/m/misof_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>
<br/>

<P>
Choosing the correct data type for your variables can often be the only difference between a faulty solution and a correct one. Especially when there's some geometry around, precision problems often cause solutions to fail. To make matters even worse, there are many (often incorrect) rumors about the reasons of these problems and ways how to solve them.
<br><br>
To be able to avoid these problems, one has to know a bit about how things work inside the computer. In this article we will take a look at the necessary facts and disprove some false rumors. After reading and understanding it, you should be able to avoid the problems mentioned above.
<br><br>
This article is in <B>no way</B> intended to be a complete reference, nor to be 100% accurate. Several times, presented things will be a bit simplified. As the readers of this article are TopCoder (TC) members, we will concentrate on the x86 architecture used by the machines TC uses to evaluate solutions. For example, we will assume that on our computers a byte consists of 8 bits and that the machines use 32-bit integer registers.
<br><br>
While most of this article is general and can be applied on all programming languages used at TC, the article is slightly biased towards C++ and on some occasions special notes on g++ are included.
<br><br>
We will start by presenting a (somewhat simplified) table of integer data types available in the g++ compiler. You can find this table in any g++ reference. All of the other compilers used at TC have similar data types and similar tables in their references, look one up if you don't know it by heart yet. Below we will explain that all we need to know is the storage size of each of the types, the range of integers it is able to store can be derived easily.
<br><br>

<div align="center"><strong>Table 1:</strong> Integer data types in g++.</div><br>
<A NAME="34"></A>
<table class="formFrame" width="350" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td align="right">name</td>
      <td align="center">size in bits</td>
      <td>representable range</td>
   </tr>
   <tr class="GAtableText">
      <td align="right"><tt>char</tt></td>
      <td align="center">8</td>
      <td><span class="math">-2<sup>7</sup></span>to <span class="math">2<sup>7</sup> - 1</span></td>
   </tr>
   <tr class="GAtableText">
      <td align="right"><tt>unsigned char</tt></td>
      <td align="center">8</td>
      <td>0 to <span class="math">2<sup>8</sup> - 1</span></td>
   </tr>
   <tr class="GAtableText">
      <td align="right"><tt>short</tt></td>
      <td align="center">16</td>
      <td><span class="math">-2<sup>15</sup></span> to <span class="math">2<sup>15</sup> - 1</span></td>
   </tr>
   <tr class="GAtableText">
      <td align="right"><tt>unsigned short</tt></td>
      <td align="center">16</td>
      <td>0 to <span class="math">2<sup>16</sup> - 1</span></td>
   </tr>
   <tr class="GAtableText">
      <td align="right"><tt>int</tt></td>
      <td align="center">32</td>
      <td><span class="math">-2<sup>31</sup></span> to <span class="math">2<sup>31</sup> - 1</span></td>
   </tr>
   <tr class="GAtableText">
      <td align="right"><tt>unsigned int</tt></td>
      <td align="center">32</td>
      <td>0 to <span class="math">2<sup>32</sup> - 1</span></td>
   </tr>
   <tr class="GAtableText">
      <td align="right"><tt>long</tt></td>
      <td align="center">32</td>
      <td><span class="math">-2<sup>31</sup></span> to <span class="math">2<sup>31</sup> - 1</span></td>
   </tr>
   <tr class="GAtableText">
      <td align="right"><tt>unsigned long</tt></td>
      <td align="center">32</td>
      <td>0 to <span class="math">2<sup>32</sup> - 1</span></td>
   </tr>
   <tr class="GAtableText">
      <td align="right"><tt>long long</tt></td>
      <td align="center">64</td>
      <td><span class="math">-2<sup>63</sup></span> to <span class="math">2<sup>63</sup> - 1</span></td>
   </tr>
   <tr class="GAtableText">
      <td align="right"><tt>unsigned long long</tt></td>
      <td align="center">64</td>
      <td>0 to <span class="math">2<sup>64</sup> - 1</span></td>
   </tr>
</table>
<a name="tab:intvars"></a>
<br><br>

Notes:

<ul>
<li>The storage size of an <code>int</code> and an <code>unsigned int</code> is platform dependent. E.g., on machines using 64-bit registers, <code>int</code>s in g++ will have 64 bits. The old Borland C compiler used 16-bit <code>int</code>s. It is guaranteed that an <code>int</code> will always have at least 16 bits. Similarly, it is guaranteed that on any system a <code>long</code> will have at least 32 bits.</li>
<li>The type <code>long long</code> is a g++ extension, it is not a part of any C++ standard (yet?). Many other C++ compilers miss this data type or call it differently. E.g., MSVC++ has <tt>__int64</tt> instead.</li>
</ul>
<br>
<HR>
<br><br>

<I><B>Rumor:</B> Signed integers are stored using a sign bit and "digit" bits.</I>
<br><br>
<I><B>Validity:</B> Only partially true.</I>
<br><br>
Most of the current computers, including those used at TC, store the integers in a so-called <EM>two's complement form</EM>. It is true that for non-negative integers the most significant bit is zero and for negative integers it is one. But this is not exactly a sign bit, we can't produce a "negative zero" by flipping it. Negative numbers are stored in a somewhat different way. The negative number -n is stored as a bitwise negation of the non-negative number (n-1).
<br><br>
In Table 2 we present the bit patterns that arise when some small integers are stored in a (signed) <code>char</code> variable. The rightmost bit is the least significant one.
<br><br>

<div align="center"><strong>Table 2:</strong> Two's complement bit patterns for some integers.</div><br>
<A NAME="51"></A>
<table class="formFrame" width="200" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td>value</td>
      <td>two's complement form</td>
   </tr>
   <tr class="GAtableText">
      <td align="right">0</td>
      <td>00000000</td>
   </tr>
   <tr class="GAtableText">
      <td align="right">1</td>
      <td>00000001</td>
   </tr>
   <tr class="GAtableText">
      <td align="right">2</td>
      <td>00000010</td>
   </tr>
   <tr class="GAtableText">
      <td align="right">46</td>
      <td>00101110</td>
   </tr>
   <tr class="GAtableText">
      <td align="right">47</td>
      <td>00101111</td>
   </tr>
   <tr class="GAtableText">
      <td align="right">127</td>
      <td>01111111</td>
   </tr>
   <tr class="GAtableText">
      <td align="right">-1</td>
      <td>11111111</td>
   </tr>
   <tr class="GAtableText">
      <td align="right">-2</td>
      <td>11111110</td>
   </tr>
   <tr class="GAtableText">
      <td align="right">-3</td>
      <td>11111101</td>
   </tr>
   <tr class="GAtableText">
      <td align="right">-47</td>
      <td>11010001</td>
   </tr>
   <tr class="GAtableText">
      <td align="right">-127</td>
      <td>10000001</td>
   </tr>
   <tr class="GAtableText">
      <td align="right">-128</td>
      <td>10000000</td>
   </tr>
</table>
<A NAME="tab:twosc"></A>
<br><br>

Note that due to the way negative numbers are stored the set of representable numbers is not placed symmetrically around zero. The largest representable integer in <span class="math"><I>b</I></span> bits is  <!-- MATH $2^{b-1} - 1$ --><span class="math">2<sup>b-1</sup> - 1</span>, the smallest (i.e., most negative) one is <span class="math">-2<sup>b-1</sup></span>.
<br><br>
A neat way of looking at the two's complement form is that the bits correspond to digits in base 2 with the exception that the largest power of two is negative. E.g., the bit pattern 11010001 corresponds to
<!-- MATH $1\times (-128) + 1\times 64 + 0\times 32 + 1\times 16 + 0\times 8 + 0\times 4 + 0\times 2 + 1\times 1 = -128+81 = -47$ -->
<span class="math">1 <tt>x</tt> (- 128) + 1 <tt>x</tt> 64 + 0 <tt>x</tt> 32 + 1 <tt>x</tt> 16 + 0 <tt>x</tt> 8 + 0 <tt>x</tt> 4 + 0 <tt>x</tt> 2 + 1 <tt>x</tt> 1 = - 128 + 81 = - 47</span>
<br><br>
<br>
<HR>
<br><br>

<I><B>Rumor:</B> Unsigned integers are just stored as binary digits of the number.</I>
<br><br>
<I><B>Validity:</B> True.</I>
<br><br>
In general, the bit pattern consists of base 2 digits of the represented number. E.g., the bit pattern 11010001 corresponds to
<!-- MATH $1\times 128 + 1\times 64 + 0\times 32 + 1\times 16 + 0\times 8 + 0\times 4 + 0\times 2 + 1\times 1 = 209$ -->
<span class="math">1 <tt>x</tt> 128 + 1 <tt>x</tt> 64 + 0 <tt>x</tt> 32 + 1 <tt>x</tt> 16 + 0 <tt>x</tt> 8 + 0 <tt>x</tt> 4 + 0 <tt>x</tt> 2 + 1 <tt>x</tt> 1 = 209</span>.
<br><br>
Thus, in a <span class="math"><i>b</i></span>-bit unsigned integer variable, the smallest representable number is zero and the largest is <span class="math">2<sup>b</sup> - 1</span> (corresponding to an all-ones pattern).
<br><br>
Note that if the leftmost (most significant) bit is zero, the pattern corresponds to the same value regardless of whether the variable is signed or unsigned. If we have a <span class="math"><i>b</i></span>-bit pattern with the leftmost bit set to one, and the represented unsigned integer is <span class="math"><i>x</i></span>, the same pattern in a signed variable represents the value <span class="math"><i>x</i> - 2<sup>b</sup></span>. 
<br><br>
In our previous examples, the pattern 11010001 can represent either 209 (in an unsigned variable) or -47 (in a signed variable).
<br><br>
<br>
<HR>
<br><br>

<I><B>Rumor:</B> In C++, the code "<tt>int A[1000]; memset(A,x,sizeof(A));</tt>" stores 1000 copies of x into A.</I>
<br><br>
<I><B>Validity:</B> False.</I>
<br><br>
The <tt>memset()</tt> function fills a part of the memory with <tt>char</tt>s, not <tt>int</tt>s. Thus for most values of x you would get unexpected results.
<br><br>
However, this does work (and is often used) for two special values of x: 0 and -1. The first case is straightforward. By filling the entire array with zeroes, all the bits in each of the <tt>int</tt>s will be zero, thus representing the number 0. Actually, the second case is the same story: -1 stored in a
<tt>char</tt> is 1111111, thus we fill the entire array with ones, getting an array containing -1s.
<br><br>
(Note that most processors have a special set of instructions to fill a part of memory with a given value. Thus the <tt>memset()</tt> operation is usually much faster than filling the array in a cycle.)
<br><br>
When you know what you are doing, <tt>memset()</tt> can be used to fill the array A with sufficiently large/small values, you just have to supply a suitable bit pattern as the second argument. E.g., use <span class="math"><i>x</i> = 63</span> to get really large values (<!-- MATH $1,061,109,567$ --><span class="math">1, 061, 109, 567</span>) in A.
<br><br><br>

<HR>
<br><br>

<I><B>Rumor:</B> Bitwise operations can be useful.</I>
<br><br>
<I CLASS="sans"><B>Validity:</B> True.</I>
<br><br>
First, they are fast. Second, many useful tricks can be done using just a few 
bitwise operations. 
<br><br>
As an easy example, x is a power of 2 if and only if <tt>(x &amp; (x-1) == 0)</tt>. (Why? Think how does the bit pattern of a power of 2 look like.) Note that <tt>x=x &amp; (x-1)</tt> clears the least significant set bit. By repeatedly doing this operation (until we get zero) we can easily count the number of ones in the binary representation of x.
<br><br>
If you are interested in many more such tricks, download the <A NAME="tex2html3" HREF="http://www.hackersdelight.org/basics.pdf">free second chapter</A> of the book Hacker's Delight and read <A NAME="tex2html4" HREF="http://aggregate.org/MAGIC/">The Aggregate Magic Algorithms</A>. 
<br><br>
One important trick: <tt>unsigned int</tt>s can be used to encode subsets of <!-- MATH $\{0,1,\dots,31\}$ --><span class="math">{0, 1,..., 31}</span> in a straightforward way - the <span class="math"><i>i</i></span>-th bit of a variable will be one if and only if the represented set contains the number <span class="math"><i>i</i></span>. For example, the number 18 (binary 10010 = <span class="math">2<sup>4</sup> +2<sup>1</sup></span>) represents the set <span class="math">{1, 4}</span>.
<br><br>
When manipulating the sets, bitwise "and" corresponds to their intersection, bitwise "or" gives their union.
<br><br>
In C++, we may explicitly set the <span class="math"><i>i</i></span>-th bit of <span class="math"><i>x</i></span> using the command <tt>x |= (1&lt;&lt;i)</tt>, clear it using <tt>x &amp;= ~(1&lt;&lt;i)</tt> and check whether it is set using <tt>((x &amp; (1&lt;&lt;i)) != 0)</tt>. Note that <tt>bitset</tt> and <tt>vector&lt;bool&gt;</tt> offer a similar functionality with arbitrarily large sets.
<br><br>
This trick can be used when your program has to compute the answer for all subsets of a given set of things. This concept is quite often used in SRM problems. We won't go into more details here, the best way of getting it right is looking at an actual implementation (try looking at the best solutions for the problems below) and then trying to solve a few such problems on your own.
<br>

<ul>
<li><A NAME="tex2html5" HREF="http://www.topcoder.com/stat?c=problem_statement&amp;pm=2322&amp;rd=5003">BorelSets</A> (a simple exercise in set manipulation, generate sets until no new sets appear)</li>
<li><A NAME="tex2html6" HREF="http://www.topcoder.com/stat?c=problem_statement&amp;pm=4616&amp;rd=7224">TableSeating</A></li>
<li><A NAME="tex2html7" HREF="http://www.topcoder.com/stat?c=problem_statement&amp;pm=4696&amp;rd=8036">CompanyMessages</A></li>
<li><A NAME="tex2html8" HREF="http://www.topcoder.com/stat?c=problem_statement&amp;pm=3480&amp;rd=6528">ChessMatch</A> (for each subset of your players find the best assignment)</li>
<li><A NAME="tex2html9" HREF="http://www.topcoder.com/stat?c=problem_statement&amp;pm=3064&amp;rd=5869">RevolvingDoors</A> (encode your position and the states of all the doors into one integer)</li>
</ul>
<br>
<HR>
<br><br>
<I><B>Rumor:</B> Real numbers are represented using a floating point representation.</I>
<br><br>
<I CLASS="sans"><B>Validity:</B> True.</I>
<br><br>
The most common way to represent "real" numbers in computers is the <EM>floating point</EM> representation defined by the IEEE Standard 754. We will give a brief overview of this representation. 
<br><br>
Basically, the words "floating point" mean that the position of the decimal (or more exactly, binary) point is not fixed. This will allow us to store a large range of numbers than fixed point formats allow.
<br><br>
The numbers will be represented in scientific notation, using a normalized number and an exponent. For example, in base 10 the number 123.456 could be represented as <!-- MATH $1.23456 \times 10^2$ --><span class="math">1.23456 <tt>x</tt> 10<sup>2</sup></span>. As a shorthand, we sometimes use the letter E to denote the phrase "times 10 to the power of". E.g., the previous expression can be rewritten as <tt>1.23456e2</tt>.
<br><br>
Of course, in computers we use binary numbers, thus the number 5.125 (binary 101.001) will be represented as <!-- MATH $1.01001\times 2^2$ --><span class="math">1.01001 <tt>x</tt> 2<sup>2</sup></span>, and the number -0.125 (binary -0.001) will be represented as <!-- MATH $-1\times 2^{-3}$ --><span class="math">-1 <tt>x</tt> 2<sup>-3</sup></span>.
<br><br>
Note that any (non-zero) real number <span class="math"><i>x</i></span> can be written in the form <!-- MATH $(-1)^s \times m \times 2^e$ --><span class="math">(- 1)<sup>s</sup> <tt>x</tt> <i>m</i> <tt>x</tt> 2<sup>e</sup></span>, where <!-- MATH $s\in\{0,1\}$ --><span class="math"><i>s</i> &isin; {0, 1}</span> represents the sign, <!-- MATH $m\in [1,2)$ --><span class="math"><i>m</i> &isin; [1, 2)</span> is the normalized number and <span class="math"><i>e</i></span> is the (integer) exponent. This is the general form we are going to use to store real numbers.
<br><br>
What exactly do we need to store? The base is fixed, so the three things to store are the sign bit <span class="math"><i>s</i></span>, the normalized number (known as the <em>mantissa</em>) <span class="math"><i>m</i></span> and the exponent <span class="math"><i>e</i></span>.
<br><br>
The IEEE Standard 754 defines four types of precision when storing floating point numbers. The two most commonly used are <EM>single</EM> and <EM>double precision</EM>. In most programming languages these are also the names of corresponding data types. You may encounter other data types (such as <EM>float</EM>) that are platform dependent and usually map to one of these types. If not sure, stick to these two types. 
<br><br>
Single precision floating point numbers use 32 bits (4 bytes) of storage, double precision numbers use 64 bits (8 bytes). These bits are used as shown in Table 3:
<br><br>

<div align="center"><strong>Table 3:</strong> Organization of memory in <tt>single</tt>s and <tt>double</tt>s.</div><br>
<A NAME="184"></A>
<table class="formFrame" width="300" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td>&nbsp;</td>
      <td align="center">sign</td>
      <td align="center">exponent</td>
      <td align="center">mantissa</td>
   </tr>
   <tr class="GAtableText">
      <td><b>single precision</b></td>
      <td align="center">1</td>
      <td align="center">8</td>
      <td align="center">23</td>
   </tr>
   <tr class="GAtableText">
      <td><b>double precision</b></td>
      <td align="center">1</td>
      <td align="center">11</td>
      <td align="center">52</td>
   </tr>
</table>
<A NAME="tab:real"></A>
<br><br>
(The bits are given in order. I.e., the sign bit is the most significant bit, 8 or 11 exponent bits and then 23 or 52 mantissa bits follow.)
<br><br>
<B>The sign bit</B><br>
The sign bit is as simple as it gets. 0 denotes a positive number; 1 denotes a negative number. Inverting this bit changes the sign of the number.
<br><br>
<B>The exponent</B><br>
The exponent field needs to represent both positive and negative exponents. To be able to do this, a <EM>bias</EM> is added to the actual exponent <span class="math"><i>e</i></span>. This bias is 127 for single precision and 1023 for double precision. The result is stored as an unsigned integer. (E.g., if <span class="math"><i>e</i> = - 13</span> and we use single precision, the actual value stored in memory will be <!-- MATH $-13+127 = 114$ --><span class="math">-13 + 127 = 114</span>.)
<br><br>
This would imply that the range of available exponents is -127 to 128 for single and -1023 to 1024 for double precision. This is almost true. For reasons discussed later, both boundaries are reserved for special numbers. The actual range is then -126 to 127, and -1022 to 1023, respectively.
<br><br>
<B>The mantissa</B><br>
The mantissa represents the precision bits of the number. If we write the number in binary, these will be the first few digits, regardless of the position of the binary point. (Note that the position of the binary point is specified by the exponent.)
<br><br>
The fact that we use base 2 allows us to do a simple optimization:  We know that for any (non-zero) number the first digit is surely 1. Thus we don't have to store this digit. As a result, a <span class="math"><i>b</i></span>-bit mantissa can actually store the <span class="math"><i>b</i> + 1</span> most significant bits of a number.
<br><br><br>

<HR>
<br><br>

<A href="/tc?module=Static&d1=tutorials&d2=integersReals2">...continue to Section 2</A>
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