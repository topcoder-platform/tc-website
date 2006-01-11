<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="../script.jsp" />
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
	font-family: "Century Schoolbook", serif;
}
.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
}
.GAtableText
{
	background-color: #EEEEEE;
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
            <jsp:include page="../includes/global_left.jsp">
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

<div style="float: right;"><tc-webtag:forumLink forumID="505889" message="Discuss this article" /></div>
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
What exactly d o we need to store? The base is fixed, so the three things to store are the sign bit <span class="math"><i>s</i></span>, the normalized number (known as the <em>mantissa</em>) <span class="math"><i>m</i></span> and the exponent <span class="math"><i>e</i></span>.
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

<I><B>Rumor:</B> Floating point variables can store not only numbers but also some strange values.</I>
<br><br>
<I><B>Validity:</B> True.</I>
<br><br>
As stated in the previous answer, the standard reserves both the smallest and the largest possible value of the exponent to store special numbers. (Note that in memory these values of the exponent are stored as "all zeroes" and "all ones", respectively.)
<br><br>
<B>Zero</B><br>
When talking about the sign-mantissa-exponent representation we noted that any <B>non-zero</B> number can be represented in this way. Zero is not directly representable in this way. To represent zero we will use a special value denoted with both the exponent field and the mantissa containing all zeroes. Note that -0 and +0 are distinct values, though they both compare as equal.
<br><br>
It is worth noting that if <tt>memset()</tt> is used to fill an array of floating point variables with zero bytes, the value of the stored numbers will be zero. Also, global variables in C++ are initialized to a zero bit pattern, thus global floating point variables will be initialized to zero.
<br><br>
Also, note that negative zero is sometimes printed as "-0" or "-0.0". In some programming contests (with inexperienced problemsetters) this may cause your otherwise correct solution to fail.
<br><br>
There are quite a few subtle pitfalls concerning the negative zero. For example, the expressions "<tt>0.0 - x</tt>" and "<tt>-x</tt>" are not equivalent - if <span class="math"><i>x</i> = 0.0</span>, the value of the first expression is 0.0, the second one evaluates to <span class="math">-0.0</span>. 
<br><br>
My favorite quote on this topic: <I>Negative zeros can "create the opportunity for an educational experience" when they are printed as they are often printed as "-0" or "-0.0" (the "educational experience" is the time and effort that you spend learning why you're getting these strange values).</I>
<br><br>
<B>Infinities</B><br>
The values +infinity and -infinity correspond to an exponent of all ones and a mantissa of all zeroes. The sign bit distinguishes between negative infinity and positive infinity. Being able to denote infinity as a specific value is useful because it allows operations to continue past overflow situations.
<br><br>
<B>Not a Number</B><br>
The value NaN (Not a Number) is used to represent a value that does not represent a real number. NaNs are represented by a bit pattern with an exponent of all ones and a non-zero mantissa. There are two categories of NaN: QNaN (Quiet NaN) and SNaN (Signaling NaN).
<br><br>
A QNaN is a NaN with the most significant bit of the mantissa set. QNaNs propagate freely through most arithmetic operations. These values pop out of an operation when the result is not mathematically defined. (For example, <tt>3*sqrt(-1.0)</tt> is a QNaN.)
<br><br>
An SNaN is a NaN with the most significant bit of the mantissa clear. It is used to signal an exception when used in operations. SNaNs can be handy to assign to uninitialized variables to trap premature usage.
<br><br>
If a return value is a QNaN, it means that it is impossible to determine the result of the operation, a SNaN means that the operation is invalid.
<br><br>
<B>Subnormal numbers</B><br>
We still didn't use the case when the exponent is all zeroes and the mantissa is non-zero. We will use these values to store numbers very close to zero.
<br><br>
These numbers are called <EM>subnormal</EM>, as they are smaller than the normally representable values. Here we don't assume we have a leading 1 before the binary point. If the sign bit is <span class="math"><i>s</i></span>, the exponent is all zeroes and the mantissa is <span class="math"><i>m</i></span>, the value of the stored number is <!-- MATH $(-1)^s \times 0.m \times 2^{-q}$ --><span class="math">(- 1)<sup>s</sup> <tt>x</tt> 0.<i>m</i> <tt>x</tt> 2<sup>-q</sup></span>, where <span class="math"><i>q</i></span> is 126 for single and 1022 for double precision.
<br><br>
(Note that zero is just a special case of a subnormal number. Still, we wanted to present it separately.)
<br><br>
<B>Summary of all possible values</B><br>
In the following table, <span class="math"><I>b</I></span> is the bias used when storing the exponent, i.e., 127 for single and 1023 for double precision.
<br><br>

<table class="formFrame" width="400" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td align="center"><B>sign</B> <span class="math"><I>s</I></span></td>
      <td align="center"><B>exponent</B> <span class="math"><I>e</I></span></td>
      <td align="center"><B>mantissa</B> <span class="math"><I>m</I></span></td>
      <td align="center"><B>represented number</B></td>
   </tr>
<tr class="GAtableText">
<td align="center">0</td>
<td align="center">00...00</td>
<td align="center">00...00</td>
<td align="center">+0.0</td>
</tr>
<tr class="GAtableText">
<td align="center">0</td>
<td align="center">00...00</td>
<td align="center">00...01 to 11...11</td>
<td align="center"><!-- MATH $0.m \times 2^{-b+1}$ --><span class="math">0.<I>m</I> <tt>x</tt> 2<sup>-b+1</sup></span></td>
</tr>
<tr class="GAtableText">
<td align="center">0</td>
<td align="center">00...01 to 11...10</td>
<td align="center">anything</td>
<td align="center"><!-- MATH $1.m\times 2^{e-b}$ --><span class="math">1.<I>m</I> <tt>x</tt> 2<sup>e-b</sup></span></td>
</tr>
<tr class="GAtableText">
<td align="center">0</td>
<td align="center">11...11</td>
<td align="center">00...00</td>
<td align="center">+Infinity</td>
</tr>
<tr class="GAtableText">
<td align="center">0</td>
<td align="center">11...11</td>
<td align="center">00...01 to 01...11</td>
<td align="center">SNaN</td>
</tr>
<tr class="GAtableText">
<td align="center">0</td>
<td align="center">11...11</td>
<td align="center">10...00 to 11...11</td>
<td align="center">QNaN</td>
</tr>
<tr class="GAtableText">
<td align="center">1</td>
<td align="center">00...00</td>
<td align="center">00...00</td>
<td align="center">-0.0</td>
</tr>
<tr class="GAtableText">
<td align="center">1</td>
<td align="center">00...00</td>
<td align="center">00...01 to 11...11</td>
<td align="center"><!-- MATH $-0.m\times 2^{-b+1}$ --><span class="math">-0.<I>m</I> <tt>x</tt> 2<sup>-b+1</sup></span></td>
</tr>
<tr class="GAtableText">
<td align="center">1</td>
<td align="center">00...01 to 11...10</td>
<td align="center">anything</td>
<td align="center"><!-- MATH $-1.m\times 2^{e-b}$ --><span class="math">-1.<I>m</I> <tt>x</tt> 2<sup>e-b</sup></span></td>
</tr>
<tr class="GAtableText">
<td align="center">1</td>
<td align="center">11...11</td>
<td align="center">00...00</td>
<td align="center">-Infinity</td>
</tr>
<tr class="GAtableText">
<td align="center">1</td>
<td align="center">11...11</td>
<td align="center">00...01 to 01...11</td>
<td align="center">SNaN</td>
</tr>
<tr class="GAtableText">
<td align="center">1</td>
<td align="center">11...11</td>
<td align="center">10...00 to 11.11</td>
<td align="center">QNaN</td>
</tr>
</table>
<br><br>

<b>Operations with all the special numbers</b><br>
All operations with the special numbers presented above are well-defined. This means that your program won't crash just because one of the computed values exceeded the representable range. Still, this is usually an unwanted situation and if it may occur, you should check it in your program and handle the cases when it occurs. 
<br><br>
The operations are defined in the probably most intuitive way. Any operation with a NaN yields a NaN as a result. Some other operations are presented in the table below. (In the table, <span class="math"><I>r</I></span> is a positive representable number, <span class="math">&infin;</span> is Infinity, <span class="math">&divide;</span> is integer division.) A complete list can be found in the standard or in your compiler's documentation. Note that even comparison operators are defined for these values. This topic exceeds the scope of this article, if interested, browse through the references presented at the end of the article.
<br><br>

<table class="formFrame" width="200" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td align="left"><B>operation</B></td>
      <td align="left"><B>result</B></td>
   </tr>
<tr class="GAtableText">
<td align="left"><!-- MATH $0\div\pm\infty$ --><span class="math">0 &divide; &plusmn;&infin;</span></td>
<td align="left">0</td>
</tr>
<tr class="GAtableText">
<td align="left">&plusmn;<I>r</I> &divide; &plusmn;&infin;</span></td>
<td align="left">0</td>
</tr>
<tr class="GAtableText">
<td align="left"><span class="math">(-1)<sup>s</sup>&infin; <TT>x</TT> (-1)<sup>t</sup>&infin;</span></td>
<td align="left"><span class="math">(-1)<sup>st</sup>&infin;</span></td>
</tr>
<tr class="GAtableText">
<td align="left"><span class="math">&infin; + &infin;</span></td>
<td align="left"><span class="math">&infin;</span></td>
</tr>
<tr class="GAtableText">
<td align="left"><span class="math">&plusmn;<I>r</I> &divide; 0</span></td>
<td align="left"><span class="math">&plusmn;&infin;</span></td>
</tr>
<tr class="GAtableText">
<td align="left"><span class="math">0 &divide; 0</span></td>
<td align="left">NaN</td>
</tr>
<tr class="GAtableText">
<td align="left"><span class="math">&infin; - &infin;</span></td>
<td align="left">NaN</td>
</tr>
<tr class="GAtableText">
<td align="left"><span class="math">&plusmn;&infin; &divide; &plusmn;&infin;</span></td>
<td align="left">NaN</td>
</tr>
<tr class="GAtableText">
<td align="left"><span class="math">&plusmn;&infin; <TT>x</TT> 0</span></td>
<td align="left">NaN</td>
</tr>
</table>
<br><br><br>

<HR>
<br><br>

<I CLASS="sans"><B>Rumor:</B> Floating point numbers can be compared by comparing the bit patterns in memory.</I>
<br><br>
<I CLASS="sans"><B>Validity:</B> True.</I>
<br><br>
Note that we have to handle sign comparison separately. If one of the numbers is negative and the other is positive, the result is clear. If both numbers are negative, we may compare them by flipping their signs, comparing and returning the opposite answer. From now on consider non-negative numbers only.
<br><br>
When comparing the two bit patterns, the first few bits form the exponent. The larger the exponent is, the further is the bit pattern in lexicographic order. Similarly, patterns with the same exponent are compared according to their mantissa.
<br><br>
Another way of looking at the same thing: when comparing two non-negative real numbers stored in the form described above, the result of the comparison is always the same as when comparing integers with the same bit pattern. (Note that this makes the comparison pretty fast.)
<br><br><br>

<HR>
<br><br>

<I><B>Rumor:</B> Comparing floating point numbers for equality is usually a bad idea.</I>
<br><br>
<I><B>Validity:</B> True.</I>
<br><br>
Consider the following code: 
<PRE class="code">
for (double r=0.0; r!=1.0; r+=0.1) printf("*");
</PRE>
How many stars is it going to print? Ten? Run it and be surprised. The code just keeps on printing the stars until we break it.
<br><br>
Where's the problem? As we already know, <tt>double</tt>s are not infinitely precise. The problem we encountered here is the following: In binary, the representation of 0.1 is not finite (as it is in base 10). Decimal 0.1 is equivalent to binary 0.0(0011), where the part in the parentheses is repeated forever. When 0.1 is stored in a <tt>double</tt> variable, it gets rounded to the closest representable value. Thus if we add it 10 times the result is not exactly equal to one.
<br><br>
The most common advice is to use some tolerance (usually denoted <!-- MATH $\varepsilon$ --><span class="math">&epsilon;</span>) when comparing two <tt>double</tt>s. E.g., you may sometimes hear the following hint: consider the <tt>double</tt>s <tt>a</tt> and <tt>b</tt> equal, if <tt>fabs(a-b)&lt;1e-7</tt>. Note that while this is an improvement, it is not the best possible way. We will show a better way later on.
<br><br><br>

<HR>
<br><br>

<I CLASS="sans"><B>Rumor:</B> Floating point numbers are not exact, they are rounded.</I>
<br><br>
<I CLASS="sans"><B>Validity:</B> Partially true.</I>
<br><br>
Yes, if a number can't be represented exactly, it has to be rounded. But sometimes an even more important fact is that lots of important numbers (like zero, the powers of two, etc.) can be stored exactly. And it gets even better. Note that the mantissa of <tt>double</tt>s contains more than 32 bits. Thus all the binary digits of an <tt>int</tt> fit into the mantissa and the stored value is exact.
<br><br>
This can still be improved. If we note that <!-- MATH $2^{54} > 10^{16}$ --><span class="math">2<sup>54</sup> &gt; 10<sup>16</sup></span>, it should be clear that any integer with up to 15 decimal digits has at most 54 binary digits, and thus it can be stored in a <tt>double</tt> without rounding. This observation can even be extended to non-integer values: <tt>double</tt> is able to store 15 most significant decimal digits of any number (in the normally representable range).
<br><br>
A similar computation for <tt>single</tt>s shows that they are able to store only 7 most significant decimal digits. This is way too little for almost any practical applications, and what's even more important, it is less than the precision required by TC when a floating point value shall be returned. The moral of this story is pretty clear: <B>Never use <tt>single</tt>s!</B> Seriously. Don't even think about it. There's plenty of available memory nowadays.
<br><br>
As a side note, once rounding errors occur in your computation, they are propagated into further computations. Thus even if the final result shall be an integer, its representation in a floating point variable may not be exact. As an example consider the star-printing cycle above.
<br><br><br>

<HR>
<br><br>

<I><B>Rumor:</B> I've heard that <TT>long double</TT>s will give me more precision.</I>
<br><br>
<I><B>Validity:</B> Platform dependent.</I>
<br><br>
One less common precision type defined in the IEEE-754 standard is <EM>extended double precision</EM>, which requires at least 79 bits of storage space. Some compilers have a data type with this precision, some don't. E.g., in g++ on the x86 architecture we have a data type <tt>long double</tt> that uses 10 bytes (80 bits) of memory. (In MSVC++ the type <tt>long double</tt> is present, but it is mapped to a <tt>double</tt>.)
<br><br>
The 80-bit extended double precision format is used internally by the Intel 80x87 floating-point math co-processor in order to be able to shift operands back and forth without any loss of precision in the IEEE-754 64-bit (and 32-bit) format. When optimization in g++ is set to a non-zero value, g++ may even generate code that uses <tt>long double</tt>s internally instead of <tt>double</tt>s and <tt>single</tt>s. This format is able to store 19 most significant decimal digits.
<br><br>
If even more precision is required, you may either implement your own arithmetic, or use the BigInteger and BigDecimal classes from Java's math library.
<br><br><br>

<HR>
<br><br>

<I CLASS="sans"><B>Rumor:</B> In practice, there's no real difference between using different values of <!-- MATH $\varepsilon$ --><span class="math">&epsilon;</span> when comparing floating point numbers.</I>
<br><br>
<I CLASS="sans"><B>Validity:</B> False.</I>
<br><br>
Often if you visit the Round Tables after a SRM that involved a floating point task you can see people posting messages like "after I changed the precision from <tt>1e-12</tt> to <tt>1e-7</tt> it passed all systests in the practice room"
<br><br>
Examples of such discussions: <A NAME="tex2html11" HREF="http://forums.topcoder.com/?module=Thread&amp;threadID=507829&amp;mc=8#516283">here</A>, 
<A NAME="tex2html12" HREF="http://forums.topcoder.com/?module=Thread&amp;threadID=505749&amp;mc=9#505776">here</A>, 
<A NAME="tex2html13" HREF="http://forums.topcoder.com/?module=Thread&amp;threadID=156193#156192">here</A>,
<A NAME="tex2html14" HREF="http://forums.topcoder.com/?module=Thread&amp;threadID=198375#198374">here</A> and 
<A NAME="tex2html15" HREF="http://forums.topcoder.com/?module=Thread&amp;threadID=440256&amp;mc=26#440376">here</A>. (They are worth reading, it is always less painful to learn on the mistakes of other people made than to learn on your own mistakes.)
<br><br>
We will start our answer by presenting another simple example.

<pre class="code">
for (double r=0.0; r&lt;1e22; r+=1.0) printf(".");
</pre>

How many dots will this program print? This time it's clear, isn't it? The terminating condition doesn't use equality testing. The cycle has to stop after <span class="math">10<sup>22</sup></span> iterations. Or... has it?
<br><br>
Bad luck, this is again an infinite cycle. Why is it so? Because when the value of <span class="math"><I>r</I></span> becomes large, the precision of the variable isn't large enough to store all decimal digits of <span class="math"><I>r</I></span>. The last ones become lost. And when we add 1 to such a large number, the result is simply rounded back to the original number. 
<br><br>
Exercise: Try to estimate the largest value of <span class="math"><I>r</I></span> our cycle will reach. Verify your answer. If your estimate was wrong, find out why.
<br><br>
After making this observation, we will show why the expression <tt>fabs(a-b)&lt;epsilon</tt> (with a fixed value of <tt>epsilon</tt>, usually recommended between <tt>1e-7</tt> and <tt>1e-9</tt>) is not ideal for comparing <tt>double</tt>s. 
<br><br>
Consider the values 123456123456.1234588623046875 and 123456123456.1234741210937500. There's nothing that special about them. These are just two values that can be stored in a <tt>double</tt> without rounding. Their difference is approximately <tt>2e-5</tt>. 
<br><br>
Now take a look at the bit patterns of these two values:
<br><br>
<pre class="code">
 first: 01000010 00111100 10111110 10001110 11110010 01000000 00011111 10011011
second: 01000010 00111100 10111110 10001110 11110010 01000000 00011111 10011100
</pre>
<br><br>
Yes, right. These are two consecutive values that can be stored in a <tt>double</tt>. Almost any rounding error can change one of them onto the other one (or even further). And still, they are quite far apart, thus our original test for "equality" fails.
<br><br>
What we really want is to tolerate small precision errors. As we already saw, <tt>double</tt>s are able to store approximately 15 most significant decimal digits. By accumulating precision errors that arise due to rounding, the last few of these digits may become corrupt. But how exactly shall we implement tolerating such errors? 
<br><br>
We won't use a constant value of <!-- MATH $\varepsilon$ --><span class="math">&epsilon;</span>, but a value relative to the magnitude of the compared numbers. More precisely, if <span class="math"><I>x</I></span> is a <tt>double</tt>, then <tt>x*1e-10</tt> is a number that's 10 degrees of magnitude smaller than <span class="math"><I>x</I></span>. Its most significant digit corresponds to <span class="math"><I>x</I></span>'s eleventh most significant digit. This makes it a perfect <!-- MATH $\varepsilon$ --><span class="math">&epsilon;</span> for our needs.
<br><br>
In other words, a better way to compare <tt>double</tt>s <tt>a</tt> and <tt>b</tt> for "equality" is to check whether <tt>a</tt> lies between <tt>b*(1-1e-10)</tt> and <tt>b*(1+1e-10)</tt>. (Be careful, if <tt>b</tt> is negative, the first of these two numbers is larger!)
<br><br>
See any problems with doing the comparison this way? Try comparing <tt>1e-1072</tt> and <tt>-1e-1072</tt>. Both numbers are almost equal to zero and to each other, but our test fails to handle this properly. This is why we have to use <B>both</B> the first test (known as testing for an absolute error) and the second test (known as testing for a relative error).
<br><br>
This is the way TC uses to check whether your return value is correct. Now you know why.
<br><br>
There are even better comparison functions (see one of the references), but it is important to know that in practice you can often get away with using only the absolute error test. Why? Because the numbers involved in computation come from a limited range. For example, if the largest number you will ever compare is 9947, you know that a <tt>double</tt> will be able to store another 11 digits after the decimal point correctly. Thus if we use <tt>epsilon=1e-8</tt> when doing the absolute error test, we allow the last three significant digits to become corrupt. 
<br><br>
The advantage this approach gives you is clear: checking for an absolute error is much simpler than the advanced tests presented above.
<br><br>
<ul>
<li><A NAME="tex2html16" HREF="http://www.topcoder.com/stat?c=problem_statement&amp;pm=4496&amp;rd=7226">Elections</A> (a Div2 easy with a success rate of only 57.58%)</li>
<li><A NAME="tex2html17" HREF="http://www.topcoder.com/stat?c=problem_statement&amp;pm=1693&amp;rd=4560">Archimedes</A></li>
<li><A NAME="tex2html18" HREF="http://www.topcoder.com/stat?c=problem_statement&amp;pm=3561&amp;rd=6519">SortEstimate</A> (the binary search is quite tricky to get right if you don't understand precision issues)</li>
<li><A NAME="tex2html19" HREF="http://www.topcoder.com/stat?c=problem_statement&amp;pm=4436&amp;rd=6534">PerforatedSheet</A> (beware, huge rounding errors possible)</li>
<li><A NAME="tex2html20" HREF="http://www.topcoder.com/stat?c=problem_statement&amp;pm=4567&amp;rd=6539">WatchTower</A></li>
<li><A NAME="tex2html21" HREF="http://www.topcoder.com/stat?c=problem_statement&amp;pm=4751&amp;rd=8067">PackingShapes</A></li>
</ul>
<br>
<HR>
<br><br>

<I CLASS="sans"><B>Rumor:</B> Computations using floating point variables are as exact as possible.</I>
<br><br>
<I CLASS="sans"><B>Validity:</B> True.</I>
<br><br>
Most of the standards require this. To be even more exact: For any arithmetical operation the returned value has to be that representable value that's closest to the exact result. Moreover, in C++ the default rounding mode says that if two values are tied for being the closest, the one that's more even (i.e., its least significant bit of the mantissa is 0) is returned. (Other standards may have different rules for this tie breaking.)
<br><br>
As a useful example, note that if an integer <span class="math"><I>n</I></span> is a square (i.e., <span class="math"><I>n</I> = <I>k</I><sup>2</sup></span> for some integer <span class="math"><I>k</I></span>), then <tt>sqrt(double(n))</tt> will return the exact value <span class="math"><I>k</I></span>. And as we know that <span class="math"><I>k</I></span> can be stored in a variable of the same type as <span class="math"><I>n</I></span>, the code <tt>int k = int(sqrt(double(n)))</tt> is safe, there will be no rounding errors.
<br><br><br>

<HR>
<br><br>

<I CLASS="sans"><B>Rumor:</B> If I do the same computation twice, the results I get will be equal.</I>
<br><br>
<I CLASS="sans"><B>Validity:</B> Partially true.</I>
<br><br>
Wait, only partially true? Doesn't this contradict the previous answer? Well, it doesn't. 
<br><br>
In C++ this rumor isn't always true. The problem is that according to the standard a C++ compiler can sometimes do the internal calculations using a larger data type. And indeed, g++ sometimes internally uses <tt>long double</tt>s instead of <tt>double</tt>s to achieve larger precision. The value stored is only typecast to <tt>double</tt> when necessary. If the compiler decides that in one instance of your computation <tt>long double</tt>s will be used and in the other just <tt>double</tt>s are used internally, the different roundings will influence the results and thus the final results may differ.
<br><br>
This is one of THE bugs that are almost impossible to find and also one of the most confusing ones. Imagine that you add debug outputs after each step of the computations. What you unintentionally cause is that after each step each of the intermediate results is cast to <tt>double</tt> and output. In other words, you just pushed the compiler to only use <tt>double</tt>s internally and suddenly everything works. Needless to say, after you remove the debug outputs, the program will start to misbehave again.
<br><br>
A workaround is to write your code using <tt>long double</tt>s only. 
<br><br>
Sadly, this only cures one of
the possible problems. The other is that when optimizing your code the compiler is allowed to rearrange the order in which operations are computed. On different occasions, it may rewrite two identical pieces of C++ code into two different sets of instructions. And all the precision problems are back. 
<br><br>
As an example, the expression <span class="math"><I>x</I> + <I>y</I> - <I>z</I></span> may once be evaluated as <span class="math"><I>x</I> + (<I>y</I> - <I>z</I>)</span> and the other time as <span class="math">(<I>x</I> + <I>y</I>) - <I>z</I></span>. Try substituting the values <span class="math"><I>x</I> = 1.0</span> and <!-- MATH $y=z=10^{30}$ --><span class="math"><I>y</I> = <I>z</I> = 10<sup>30</sup></span>.
<br><br>
Thus even if you have two identical pieces of code, you can't be sure that they will produce exactly the same result. If you want this guarantee, wrap the code into a function and call the same function on both occasions.
<br><br><br>

<HR>
<br><br>

<B>Further reading</B>
<br><br>
<ul>
<li><A NAME="tex2html22" HREF="http://www.cygnus-software.com/papers/comparingfloats/comparingfloats.htm">Comparing floating point numbers</A> (a detailed article by Bruce Dawson)</li>
<li><A NAME="tex2html23" HREF="http://en.wikipedia.org/wiki/Floating-point">Floating-point representation</A></li>
<li><A NAME="tex2html24" HREF="http://en.wikipedia.org/wiki/IEEE_floating-point_standard">IEEE Standard 754</A></li>
<li><A HREF="http://home.att.net/~jackklein/c/inttypes.html">Integer Types In C and C++</A> (an article by Jack Klein)</li>
<li><A NAME="tex2html25" HREF="http://www.concentric.net/~Ttwang/tech/javafloat.htm">Java Floating-Point Number Intricacies</A> (an article by Thomas Wang)</li>
<li><A NAME="tex2html26" HREF="http://www.cs.berkeley.edu/~wkahan/ieee754status/IEEE754.PDF">Lecture notes on IEEE-754</A> (by William Kahan)</li>
<li><A NAME="tex2html27" HREF="http://babbage.cs.qc.edu/courses/cs341/IEEE-754references.html">Lots of referrences about IEEE-754</A></li>
<li><A NAME="tex2html28" HREF="http://en.wikipedia.org/wiki/IEEE_754r">Revision of IEEE-754</A> (note the definition of the operators min and max)</li>
<li><A NAME="tex2html29" HREF="http://docs.sun.com/source/806-3568/ncg_goldberg.html">What Every Computer Scientist Should Know About Floating-Point Arithmetic</A> (a pretty long article by David Goldberg)</li>
</ul>

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
