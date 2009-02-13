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
            
<span class="bodyTitle">Representation of Integers and Reals, Part 2</span>

<p>
<img src="/i/m/misof_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>
<br/>

<A href="/tc?module=Static&d1=tutorials&d2=integersReals">...read Section 1</A>
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
The operations are defined in the probably most intuitive way. Any operation with a NaN yields a NaN as a result. Some other operations are presented in the table below. (In the table, <span class="math"><I>r</I></span> is a positive representable number, <span class="math">&infin;</span> is Infinity, <span class="math">&divide;</span> is normal floating point division.) A complete list can be found in the standard or in your compiler's documentation. Note that even comparison operators are defined for these values. This topic exceeds the scope of this article, if interested, browse through the references presented at the end of the article.
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