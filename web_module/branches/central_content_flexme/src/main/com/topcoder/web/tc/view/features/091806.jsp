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
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.code
{
   width: 580;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}
span.conj { text-decoration: overline; }
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
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div style="float: right; text-align:right;">
<tc-webtag:forumLink forumID="506116" message="Discuss this article" />
<div id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A></div>
<div id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A></div>
</div>
<span class="bigTitle">Computational geometry with complex numbers</span>

      <p>
      <img src="/i/m/bmerry_mug.gif" alt="" border="0" align="left" class="myStatsPhoto"/>
      By&#160;<tc-webtag:handle coderId="251074" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

<span class="bodySubtitle">Introduction</span><br>
Computational geometry problems appear frequently in
Topcoder contests and a series of <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=geometry1">articles</a>
has already been written on the subject. However, competitors
who have tried to implement these algorithms (particularly in
C++) will no doubt have been frustrated by the lack of a
built-in point class that provides all the suitable operator
overloading, dot and cross products and so on. In fact, there
<em>is</em> a class that does most of what one wants, but it
is not an obvious choice: the complex number class. In this
article I will show how many primitive geometric operations
can be quickly translated into the language of complex
numbers, and hence into succinct yet readable code.
<br><br>
I am going to assume a familiarity with the basics of
computational geometry, as discussed in the article linked
above. I will provide a very quick introduction to complex
numbers, but the interested reader is advised to read more
online or in a mathematics textbook.
<br><br>
<span class="bodySubtitle">Review of complex numbers</span><br>
Even if you're not familiar with complex numbers, you have
probably heard that it has something to do with <em>i</em>,
the square root of &minus;1 &mdash; an apparently impossible
concept. The solution is to treat <em>i</em> as if it were a
variable, like <em>x</em>, except that wherever you have
<em>i</em><sup>2</sup> you can replace it with &minus;1. Not all the
properties of real numbers carry over (in particular, there is
no way to order the complex numbers that behaves nicely with
respect to the arithmetic operations), but arithmetic
properties like commutativity work just the same.
<br><br>
Because powers of <em>i</em> cancel out, all complex
numbers can in fact be written in the form <em>a + bi</em>,
where <em>a</em> and <em>b</em> are real numbers. Complex
numbers can be visualised by plotting them in a plane (called
the Argand plane) by using <em>a</em> as the x coordinate
(also known as the <dfn>real</dfn> part) and <em>b</em> as the
y coordinate (also known as the <dfn>imaginary</dfn> part), as
shown below.
<br><br>
<div align="center"><img src="/i/education/091806_01.gif" alt="The Argand plane" border="0" /></div>
<br><br>
Arithmetic operations follow the usual rules, with
<em>i</em><sup>2</sup> replaced by &minus;1 as described above.
Hence
<blockquote>
	(<em>a</em> + <em>bi</em>) + (<em>c</em> + <em>di</em>) =
	(<em>a</em> + <em>c</em>) + (<em>b</em> + <em>d</em>)<em>i</em><br/>
	(<em>a</em> + <em>bi</em>)(<em>c</em> + <em>di</em>) =
	<em>ac</em> + <em>bci</em> + <em>adi</em> + <em>bdi</em><sup>2</sup>
	= (<em>ac</em> &minus; <em>bd</em>) + (<em>ad</em> +
			<em>bc</em>)<em>i</em>
</blockquote>

<strong>Polar form</strong><br>
An alternative and very important representation for complex
numbers is the <dfn>polar</dfn> or <dfn>modulus-argument</dfn>
form. In the Argand plane, this corresponds to a description
using the length and direction of the vector connecting 0 to
the complex number. For various technical reasons, this is
written as
<blockquote>
	<em>r</em>e<sup><em>i</em>&theta;</sup> = <em>r</em>(cos
	&theta; + <em>i</em>sin &theta;),
</blockquote>
as shown in the figure below.
In this form, <em>r</em> is called the <dfn>modulus</dfn> (or
absolute value) and &theta; is called the argument, and is
always in radians. The modulus of <em>z</em> is written
|<em>z</em>|.
<br><br>
<div align="center"><img src="/i/education/091806_02.gif" border="0" alt="Modulus-argument form"/></div>
<br><br>
The polar form leads to Euler's famous equation
e<sup>i&pi;</sup> + 1 = 0.
<br><br>
<strong>Complex conjugate</strong><br>
If <em>z = a + bi</em>, then the <dfn>conjugate</dfn> of
<em>z</em> is <em><span class="conj">z</span> = a &minus; bi</em>.
It has the useful properties that
<ul>
<li><em>z</em> + <em><span class="conj">z</span></em> = 2<em>a</em></li>
<li><em>z</em> &minus; <em><span class="conj">z</span></em> = 2<em>bi</em></li>
<li><em>z<span class="conj">z</span></em> = <em>a</em><sup>2</sup> +
<em>b</em><sup>2</sup> = |<em>z</em>|<sup>2</sup></li>
</ul>

In the polar form, taking a conjugate negates the angle.
<br><br>
<span class="bodySubtitle">Geometric interpretation</span><br>
Quite conveniently, the complex numbers form a vector space
over the real numbers. Put plainly, this means that addition,
subtraction, negation and scalar multiplication (i.e.,
multiplication by a real number) all act on complex numbers in
exactly the same way they act on vectors. The action of
conjugation is also easy to fathom: it reflect the number in
the real axis.
<br><br>
Complex multiplication is less obvious, and does not
correspond to any vector operation. However, the obscure
exponential in the polar form provides a hint: the modulii are
multiplied, but the arguments are added.
<br><br>
<div align="center"><img src="/i/education/091806_03.gif" border="0" /></div>
<br><br>
<span class="bodySubtitle">Putting it all to use</span><br>
<strong>C++ complex number template</strong><br>
C++ has a complex number template, which implements all the
operations described above, plus a few more. It takes a
template parameter, which is the underlying type for the real
and imaginary parts. While it is really intended to be used
with floating point types, it also works if given an integral
type. You can also provide a custom type (such as an exact
fraction class), provided you implement all the usual
operators.
<br><br>
The class has methods <code>real()</code> and
<code>imag()</code> to retrieve the real and imaginary parts.
These return references, i.e., they can be used to update the
complex number. Operations on complex numbers are implemented
as functions that take complex numbers as arguments, rather
than methods of the class.
<br><br>
In the code samples that follow, I'll assume the following
definition:
<pre class="code">
#include &lt;complex&gt;
using namespace std;
typedef complex&lt;double&gt; point;
</pre>

<strong>Dot and cross products</strong><br>
A construction that will be used frequently in
computational geometry is <em><span
class="conj">z</span>w</em>. In the polar form, this
multiplies the lengths, but takes the differences of the
angles rather than the sum. Thus, it is a handy way to access
the angle between two vectors without messing about with
trigonometric functions. What about the Cartesian form?

<blockquote>
<em>z</em> = <em>a</em> + <em>bi</em><br />
<em>w</em> = <em>c</em> + <em>di</em><br />
<em><span class="conj">z</span>w</em> = (<em>ac</em> + <em>bd</em>) + (<em>ad</em> &minus; <em>bc</em>)<em>i</em>
</blockquote>

Behold! The real part is the dot product, and the complex
part is the cross product. This is perhaps not surprising,
given that these products are related to the sine and cosine
of the relative angle. These are two critical tools in any
computational geometry library, available in one tidy package:

<pre class="code">
double dot(const point &amp;a, const point &amp;b) { return real(conj(a) * b); }
double cross(const point &amp;a, const point &amp;b) { return imag(conj(a) * b); }
</pre>

<strong>Length</strong><br>
There are two ways to retrieve the length:
<code>abs</code>, which gives the length, and
<code>norm</code>, which gives the squared length. A catch in
the GCC implementation is that if one uses a floating-point
type as the underlying type, <code>norm</code> may suffer from
rounding error even if the argument has integral parts (this
is because it does clever things to avoid underflow when given
very small complex numbers). A workaround that works for now
(but may not in future) is to use <code>dot(z, z)</code>.
<br><br>

<strong>Rotations</strong><br>
We have already seen that multiplication is a combination of
adding angles and multiplying lengths. If we use a unit-length
complex number for one argument, then no change in length
occurs and we have a pure rotation about the origin. For
example, multiplying by <em>i</em> is equivalent to rotating
90&deg; anti-clockwise. Rotation about another centre can be
done by translation.

<pre class="code">
point rotate_by(const point &amp;p, const point &amp;about, double radians) 
{ 
    return (p - about) * exp(point(0, radians)) + about; 
}
</pre>

<strong>Reflections</strong><br>
The conjugation operator is ideal for reflection in a line.
Suppose we wish to reflect <em>z</em> about a line from the
origin to <em>w</em>. First we will to rotate this line to the
real axis. Multiplying by <em>w</em> would have the opposite
effect, so we can achieve this by dividing by <em>w</em>. We
then conjugate and multiply by <em>w</em> to reverse the
effect. This will work even if <em>w</em> is not of unit
length, because the scaling involved in the division and the
multiplication will cancel out. Again, we can reflect in an
arbitrary line by translation.

<pre class="code">
point reflect(const point &amp;p, const point &amp;about1, const point &amp;about2)
{
    point z = p - about1;
    point w = about2 - about1;
    return conj(z / w) * w + about1;
}
</pre>

<strong>Intersections</strong><br>
Complex numbers don't bring anything new to computing
intersections, but the code becomes quite compact:

<pre class="code">
// returns intersection of infinite lines ab and pq (undefined if they are parallel)
point intersect(const point &amp;a, const point &amp;b, const point &amp;p, const point &amp;q)
{
    double d1 = cross(p - a, b - a);
    double d2 = cross(q - a, b - a);
    return (d1 * q - d2 * p) / (d1 - d2);
}
</pre>
<span class="bodySubtitle">Caveats</span><br>
Using complex numbers will not necessarily produce the fastest
code, since there are a lot of operators that are not used
(e.g., the dot and cross product each use only one part of a
complex product), although hopefully the compiler will
eliminate some of this.
<br><br>
There is no quick and convenient way to convert between
<code>complex&lt;int&gt;</code> and
<code>complex&lt;double&gt;</code>. It is best to pick one and
use it throughout. Keep in mind, though, that in some cases
with a floating-point base type, the library may try to do
clever things that will introduce floating point error, such
as the issues with <code>norm</code> mentioned above.
<br><br>
<span class="bodySubtitle">Conclusions</span><br>
In a few cases, particularly when dealing with rotations or
reflections, complex numbers make operations fundamentally
simpler. However, their main use in competitive programming is
in C++, where they can be used as a 2D point class with a wide
collection of operators and functions already available. This
makes programming both faster and less error-prone. The
resulting programs are also arguably more readable that those
that do not use any operator overloading, instead doing
everything twice (once for each coordinate).
        <br><br>
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
