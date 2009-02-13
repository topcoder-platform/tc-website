<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
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
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <%--
    <A href="/stat?c=round_overview&er=5&rd=10796">Match Overview</A><br />
    --%>
    <tc-webtag:forumLink forumID="516074" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 377</span><br />Saturday, November 17, 2007
<br /><br />



<h1>AlmostPrimeNumbers</h1>
<p>

The key part of this problem is to determine whether an integer number is almost prime or not.
According to the definition, it shouldn't be prime and divisible by numbers less than 11.
So, the Java function looks like this:<br />

<pre class="code">
boolean isAlmostPrime(int n) {
    return !isPrime(n) && n%2 !=0 && n%3 !=0 && n%5 !=0 && n%7 !=0;
}
</pre>

Having this function, we just iterate through all the numbers that are greater than the given one and
return the first almost prime number found. The only thing left to discuss is how long can we search for
the smallest almost prime number that is greater than the given one. This is not very easy question, but
it's good we need not to make a complex analysis. It's obvious that all powers of 11 are almost prime,
and 11^6 = 1771561. So, even this raw estimation shows that our code will not timeout, if we implement the function
<b>isPrime</b> to work  in O(sqrt(n)). If you don't know how to do that, please read
<a href="/tc?module=Static&d1=tutorials&d2=math_for_topcoders">this</a> tutorial.

</p>


<h1>SquaresInsideLattice</h1>
<p>

The key observation in this problem is: for each square inside the lattice its bounding box is a square too.
By bounding box we mean the smallest rectangle with sides parallel to the axes, which contains the given square.
So, each square with sides parallel to the axes uniquely defines some number of lattice squares. And this number
depends only on the size of the square, actually it equals to the length of the square's side. So, all we need is to
iterate through all possible lengths of square's side and count the answer. Here is a Java implementation of this approach:

<pre class="code">
    
long res = 0;
for (long i = 1; i &lt;= Math.min(width,height); ++i)
    res += (width - i + 1) * (height - i + 1) * i;

</pre>

</p>

<h1>GameOnAGraph</h1>
<p>
    
This problem was yet another exercise with the matrices. To see this let's look
what happens with the vertices' marks during the game. Let's denote the marks before
some turn as x1, x2, ..., xn and after that turn as y1, y2, ..., yn. Then we can write the
following equations:
<pre class="code">
y1 = A<sub>1,1</sub>x1 + A<sub>1,2</sub>x2 + ... + A<sub>1,n</sub>xn
y2 = A<sub>2,1</sub>x1 + A<sub>2,2</sub>x2 + ... + A<sub>2,n</sub>xn
.................................
yn = A<sub>n,1</sub>x1 + A<sub>n,2</sub>x2 + ... + A<sub>n,n</sub>xn
</pre>

Here coefficients A<sub>i,j</sub> depend on the graph and whether the turn was white or black.
These linear equations can be written using matrices in a compact form as: Y = A*X.
Where X and Y are columns and A is a square matrix of coefficients. As we can see matrix A doesn't
depend on the initial marks. Let's denote by W and B matrices which correspond to white and black turns respectively and
by X the column of initial marks. Then, after the first turn marks will be W*X, after the second turn B*W*X, then W*B*W*X and so on... 
Since the matrix multiplication is an associative operation we get the following solution (in pseudo code):
<pre class="code">
solve(Graph g, int N, Column X){
    Find Matrix W (depends on g)
    Find Matrix B (depends on g)
    C := ( B*W )^( N/2 )
    if (N is odd) C := W*C
    return C*X
}
</pre>
Among other things you should implement matrix multiplication and exponentiation. The later must be done such that the number of multiplications
is proportional to log(N) to work fast enough.
Please, read <a href="http://en.wikipedia.org/wiki/Exponentiation_by_squaring">this</a> if you are not familiar with the logarithmic exponentiation.
</p>

<h1>AlienLanguage</h2>

<p>
This problem has many solutions. We'll describe some of them. But first, let's figure out what we should find.
Let our word contains V vowels and C consonants. Then we have exactly P^V*Q^C words, not counting stresses.
With stresses each of these words will define 1 + V + C + V*C = (V+1)*(C+1) different words. So, the answer to the problem is (-1 because we don't allow empty words):
</p>
<center>
    <img src="/i/education/srm377_fig01.png" alt="sum(P^i*Q^j*(i+1)*(j+1), i=0..N, j=0..N)"/>
</center>
<p>
    This form is not very convinient, so let's rewrite it like this:
</p>
<center>
    <img src="/i/education/srm377_fig02.png" alt="sum(P^i*Q^j*(i+1)*(j+1), i=0..N, j=0..N)"/>
</center>
<p>
Now we see that we only need to know how to compute the sum <b>S(n)</b> = 1 + 2*x + 3*x^2 + ... + (n+1)*x^n.
This is the crotch where different solutions actually start to differ.
</p>
<h3>Method 1: Recurrence</h3>
<p>
We can notice that for odd n (n = 2*k-1) the following is true:<br />
S( 2*k-1 ) = ( 1 + x^k )*S( k-1 ) + k*x^k*( 1+x+x^2+...+x^(k-1) ),<br/> or if we denote the sum of
geometrical progression 1+x+x^2+...+x^k by <b>G(k)</b>, then<br />
S( 2*k-1 ) = ( 1 + x^k )*S( k-1 ) + k*x^k*G( k-1 ).<br />
This means that we have a recurrence which decreases the power by 2. So, we can compute the result in logarithmic time.
But to do that we must be able to count G(k) which is not very hard because of the similar recurrence:<br />
G(2*k-1) = ( 1 + x^k )*G( k-1 ).
</p>

<h3>Method 2: Matrices</h3>
<p>
It turns out that matrices are applicable in this problem too. Let's see how.<br />
We can write the following equations:<br />
<pre class="code">
S( n+1 ) = x * S( n ) + x * G( n ) + 1
G( n+1 ) =     0      + x * G( n ) + 1
   1     =     0      +     0      + 1
</pre>

Now, it's clear where the matrices came from. Specifically,

<pre class="code">
( S( n+1 ) )   ( x  x  1 ) ( S( n ) )
( G( n+1 ) ) = ( 0  x  1 ) ( G( n ) )
(    1     )   ( 0  0  1 ) (   1    )
</pre>

So, all we need is to find a corresponding power of the given 3x3 matrix. Of cource, it should be fast to pass the system tests. Fortunately,
we already know how to do this from the previous problem.
</p>

<h3>Method 3: Closed form</h3>
<p>
Another way to solve this problem is to find a formula.<br />
We already know that S( n ) = x*S( n-1 ) + G( n ), but on the other hand S( n ) = S( n-1 ) + (n+1)*x^n. Getting rid of S( n-1 ) we
yield that S( n ) = ( (n+1)*x^(n+2) - (n+2)*x^(n+1) + 1 ) / (x-1)^2<br />
Although division is a problem for modular computation, it can be resolved in the following way: we need to count numerator by modulo M*(x-1)^2 instead
of M and after that divide it by (x-1)^2.
</p>



<br /><br />


<div class="authorPhoto">
    <img src="/i/m/it4DOTkp_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20635869" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
