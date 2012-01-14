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
.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="518788" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Linear recurrences</span>
<br /><br />
<div class="authorPhoto">
    <img src="/i/m/bmerry_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="251074" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<h3>Introduction</h3>
<p>I started writing this as an article about series and recurrence relations, but linear recurrences kept coming up in all the examples I used, so I decided to focus on them explicitly. A linear recurrence is a sequence of vectors defined by the equation <em>x<sub>i+1</sub></em> = <em>Mx<sub>i</sub></em>, for some constant matrix <em>M</em>.</p>
<p>Why is this such a useful model? Let's look at some problems that can be put into this form:</p>
<dl>
    <dt><strong>Fibonacci sequence</strong></dt>
    <dd>Let <div align="center"><img src="/i/education/feature010408/linear0x.png" alt="linear0x.png" /></div></dd>
    <dd>Then <div align="center"><img src="/i/education/feature010408/linear1x.png" alt="linear1x.png" /></div></dd>
    <dd>This approach works for any sequence whose <em>i</em>th term is defined as a linear combination of the preceding <em>k</em> terms.</dd>

    <dt><strong>Randomised state machines</strong></dt>
    <dd>Imagine a state machine with <em>N</em> states. For each state, there is a probability distribution describing the state in the next time step. If <em>x<sub>i</sub></em> is the probability distribution of states after <em>i</em> time steps, then <em>x<sub>i+1</sub> = Mx<sub>i</sub></em> where <em>M</em> contains all the transition probabilities. This type of model is known as a <em>Markov</em> model and is often used in statistics.</dd>

    <dt><strong>Evaluating series</strong></dt>
    <dd>Like the Fibonacci sequence, many series can be calculated from this form. For example, let <em>a<sub>i</sub></em> = 1+2<em>c</em>+3<em>c<sup>2</sup></em>+<img src="/i/education/feature010408/linear2x.png" alt="&#x22C5;&#x22C5;&#x22C5;" />+<em>ic<sup>i-1</sup></em>, for some constant <em>c</em>, and let <div align="center"><img src="/i/education/feature010408/linear3x.png" alt="linear3x.png" /></div></dd>
    <dd>Then <div align="center"><img src="/i/education/feature010408/linear4x.png" alt="linear4x.png" /></div></dd>

    <dt><strong>Path counts</strong></dt>
    <dd>Given a directed (or undirected) graph, let <em>P<sub>i</sub></em> be a matrix such that element <em>j,k</em> is the number of paths of length <em>i</em> that start at <em>j</em> and end at <em>k</em> (possibly visiting vertices multiple times). Trivially, <em>P<sub>0</sub></em> is the identity and <em>P<sub>1</sub></em> is the adjacency matrix. It is possible to show that <em>P<sub>n</sub></em> = <em>P<sub>1</sub>nP<sub>0</sub></em>.</dd>
</dl>
<br />

<h3>Fast exponentiation</h3>
<p>Let's step back for a moment and review a technique that is probably well-known to many TopCoders: computing <em>a<sup>b</sup></em> quickly when <em>b</em> is large. The brute-force approach takes <em>O</em>(<em>b</em>) time, but using a recursive divide-and-conquer algorithm takes only <em>O</em>(log <em>b</em>) time:</p>
<ul>
    <li>If <em>b</em> = 0, then the answer is 1.</li>
    <li>If <em>b</em> = 2<em>k</em> is even, then <em>a<sup>b</sup></em> = (<em>a<sup>k</sup></em>)<em><sup>2</sup></em>.</li>
    <li>If <em>b</em> is odd, then <em>a<sup>b</sup></em> = <em>a &#x22C5; a<sup>b-1</sup></em>.</li>
</ul>
<p>The same technique works for raising a square matrix to an arbitrary power, simply replacing 1 with <em>I</em>, the identity matrix. A handy trick for C++ competitors in TopCoder is to write a matrix class with an overloaded multiplication operator and a constructor that takes an <strong>int</strong>, and to use GCC's non-standard <strong>__gnu_cxx::power</strong> function (defined in <strong>ext/numeric</strong>). For a brute-force matrix multiplication, this will take <em>O</em>(<em>n<sup>3</sup></em> log <em>b</em>) time for an <em>n &#x00D7; n</em> matrix (asymtotically faster matrix multiplication is possible, but not worth the effect to implement in a TC match).</p>
<p>This is all that is necessary to evaluate a linear recurrence quickly. Simply note that applying the recurrence <em>n</em> times gives <em>x<sub>n</sub></em> = <em>M<sup>n</sup>x<sub>0</sub></em>, evaluate <em>M<sup>n</sup></em> as described, and multiply the result with <em>x<sub>0</sub></em> to get <em>x<sub>n</sub></em>.</p>
<p>A common idiom in TC and other contests is to ask for an answer modulo some number <em>p</em>, since the actual answer is too large to easily represent. This technique works just as well for these situations, because the only operations that are performed are addition and multiplication. For each basic computation, take the result modulo <em>p</em>. You must, however, be more careful than usual about overflow, because even if <em>M</em> contains small entries, the fast exponentiation algorithm may multiply together two matrices with large entries. You should ensure that <em>p<sup>2</sup></em> is not too large for the type you are using.</p>
<br />

<h3>Closed-form formulae</h3>
<p>This algorithm is fast enough for almost all practical applications, but there are situations in which it is useful to have a formula for the <em>i</em>th term of a sequence. At this point, the mathematics gets a little heavy, and if your eyes start to glaze over, you should skip ahead to the example. A powerful tool in analysing matrix computations is the Jordan canonical form. Every square matrix <em>M</em> with real or complex entries can be written in the form <em>M</em> = <em>P-<sup>1</sup>JP</em>, where J has a special form. It has special types of block matrices along the diagonal and zeros everywhere else:</p>
<div align="center"><img src="/i/education/feature010408/linear5x.png" alt="linear5x.png" /></div>
<p>Each block matrix <em>J<sub>i</sub></em> has a constant value down the diagonal, 1's immediately below the diagonal, and zeros everywhere else. The values on the main diagonal of <em>J</em> are the eigenvalues of <em>M</em>. For almost all matrices <em>M</em> (technically, a set whose inverse has measure zero), each block matrix <em>J<sub>i</sub></em> will be 1 &#x00D7; 1, and <em>J</em> will simply be a diagonal matrix. Raising a diagonal matrix to the power of <em>n</em> is trivial (just raise each element to <em>n</em>), and this makes it straightforward to compute <em>C<sup>n</sup></em> = <em>P<sup>-1</sup>J<sup>n</sup>P</em>.</p>
<p>For some matrices, there are 1's below the diagonal in <em>J</em>. This makes it more difficult to compute <em>J<sup>n</sup></em>, but it can still be done with a closed formula, and so a formula for <em>C<sup>n</sup></em> still exists. The terms of the formula for <em>C<sup>n</sup>x<sub>0</sub></em> all have the form <em>n<sup>k</sup>&#x03BB;<sup>n</sup></em>, where <em>k</em> is some constant and <em>&#x03BB;</em> is one of the eigenvalues. Furthermore, if <em>&#x03BB;</em> has multiplicity <em>m</em>, then <em>k</em> cannot exceed <em>m</em> - 1. Although the coefficients can be found by direct calculation, it is easier to solve for them by examining the initial terms in the sequence.</p>
<p>Let's do a practical example: the Fibonacci sequence. We saw above that the corresponding matrix is</p>
<div align="center"><img src="/i/education/feature010408/linear6x.png" alt="linear6x.png" /></div>
<p>which has a characteristic equation of <em>t<sup >2</sup></em> - <em>t</em> - 1 = 0. A useful result for Fibonacci-like sequences is that the characteristic equation for a recurrence <em>a<sub>i</sub></em> = <em>c<sub>1</sub>a<sub>i-1</sub></em> + <img src="/i/education/feature010408/linear7x.png" alt="linear7x.png" /> + <em>c<sub>k</sub>a<sub>i-k</sub></em> is <em>t<sup>k</sup></em> = <em>c<sub>1</sub>t<sup>k-1</sup></em> + <img src="/i/education/feature010408/linear8x.png" alt="linear8x.png" /> + <em>c<sub>k</sub></em>. In this case, the roots are <em>&#x03C6;</em> and 1 - <em>&#x03C6;</em> (<em>&#x03C6;</em> = <img src="/i/education/feature010408/linear9x.png" alt="1+&#x221A;5-2" /> being the Golden Ratio). There are no repeated eigenvalues, so the general form of the solution is <em>F<sub>n</sub></em> = <em>p&#x03C6;<sup>n</sup></em> + <em>q</em>(1 - <em>&#x03C6;</em>)<em><sup>n</sup></em>. We also know that <em>F<sub>1</sub></em> = <em>F<sub>2</sub></em> = 1, and solving for <em>p</em> and <em>q</em> simultaneously gives <em>p</em> = <img src="/i/education/feature010408/linear10x.png" alt="&#x221A;1-5" /> and <em>q</em> = -<img src="/i/education/feature010408/linear11x.png" alt="&#x221A;1-5" />.</p>
<p>As another example, let's look at the arithmetic-geometric progression listed in the introduction. In this case, the matrix <em>M</em> is upper triangular and so the eigenvalues are on the diagonal: 1, <em>c</em> and <em>c</em>. For now, let's assume <img src="/i/education/feature010408/linear12x.png" alt="c &#x2044;= 1" />, so 1 has multiplicity 1 and <em>c</em> has multiplicity 2. The general form is thus <em>pnc<sup>n</sup></em> + <em>qc<sup>n</sup></em> + <em>r</em>. The first three terms are <em>a<sub>1</sub></em> = 1<em>,a<sub>2</sub></em> = 1 + 2<em>c,a<sub>3</sub></em> = 1 + 2<em>c</em> + 3<em>c<sup>2</sup></em>. Provided that <img src="/i/education/feature010408/linear13x.png" alt="c &#x2044;= 0" />, solving for <em>p</em>, <em>q</em> and <em>r</em> simultaneously gives <em>p</em> = <img src="/i/education/feature010408/linear14x.png" alt="-1-c-1" />, <em>q</em> = -<img src="/i/education/feature010408/linear15x.png" alt="--1--(c-1)2" /> and <em>r</em> = <img src="/i/education/feature010408/linear16x.png" alt="--1--(c-1)2" />.</p>
<p>In programming contests, the closed-form formula is not always useful for calculation purposes. For example, the formula for the Fibonacci sequence contains <img src="/i/education/feature010408/linear17x.png" alt="&#x221A; -- 5" /> in several places, which means that any calculation using floating-point values will develop inaccuracies. Raising an inaccurate number to a large power will also magnify any errors, in much the same way that compound interest magnifies your money. Even if it is possible to avoid irrational numbers, divisions complicate any algorithm that attempts to do all calculations modulo <em>p</em>.</p>
<p>The closed-form formulae are, however, useful for algorithm analysis. For example, a recursive function <em>f</em>(<em>i</em>) that calls both <em>f</em>(<em>i</em> - 1) and <em>f</em>(<em>i</em> - 2) will have running time proportional to the Fibonacci sequence, and it will be useful to know how fast this sequence grows. Thanks to the closed formula, we know that it is <em>O</em>(<em>&#x03C6;<sup>n</sup></em>) (the eigenvalue(s) with largest magnitude will always dominate the expression). For a conservative estimate, it is not even necessary to compute the coefficients of the general form, although in some cases the apparently dominant term will have a coefficient of 0 and thus disappear.</p>
<br />

<h3>Sample problems</h3>
<p>Division 1 of SRM 377 is the match that inspired me to write this article. Unfortunately, it was unrated (for technical reasons) and so the problems are not in the problem archive, but you can find them in the practise room.</p>
<dl>
    <dt><strong>SquaresInsideLattice</strong></dt>
    <dd>The required number is the sum of a series. The sum is small enough to evaluate in a loop, but for practice, try to find the closed formula. Hint: for a polynomial <em>P</em>, the series <em>P</em>(0) + <em>P</em>(1) + <img src="/i/education/feature010408/linear18x.png" alt="&#x22C5;&#x22C5;&#x22C5;" /> + <em>P</em>(<em>n</em>) is always a polynomial of one degree higher, for which you need only find the coefficients.</dd>
    
    <dt><strong>GameOnAGraph</strong></dt>
    <dd>The white moves can be represented by a matrix <em>W</em> and the black moves by another matrix <em>B</em>. If the number of moves is even, then the matrix describing the entire game is (<em>BW</em>)<em><sup>n&#x2215;2</sup></em>.</dd>
    
    <dt><strong>AlienLanguage</strong></dt>
    <dd>If the empty string was legal, the number of  words would be the product of the number of vowel-only words and the number of consonant-only  words. Prove that each of these is an arithmetic-geometric progression and evaluate it.</dd>
</dl>

<p>Other problems that you can look at:</p>
<dl>
    <dt><strong><a href="/stat?c=problem_statement&amp;pm=7262">FibonacciSequence</a></strong></dt>
    <dd>A very simple problem based on the Fibonacci sequence. You won't need any of these techniques, but you can use it as practise.</dd>
    
    <dt><strong><a href="/stat?c=problem_statement&amp;pm=6386">TourCounting</a></strong></dt>
    <dd>This is the path counting problem mentioned in the introduction.</dd>
    
    <dt><strong><a href="/stat?c=problem_statement&amp;pm=6877">TurtleGraphics</a></strong></dt>
    <dd>Each of the basic operations can be encoded in a 4 &#x00D7; 4 matrix, where the top-left 3 &#x00D7; 3 part is a rotation matrix and the top-right 3 &#x00D7; 1 part is a translation.</dd>
</dl>
<br />

<h3>Conclusions</h3>
<p>Whenever you are required to evaluate a sequence <em>x<sub>n</sub></em> for some very large value of <em>n</em>(too large for an <em>O</em>(<em>n</em>) algorithm), it may be worth trying to express the problem as a linear recurrence, even if it is apparently non-linear. Some ingenuity may be required, for example, to &#xFB01;nd a vector containing <img src="/i/education/feature010408/linear19x.png" alt="&#x2211;n   ixi-1  i=1   " /> which can be updated linearly. Once this has been done, however, the rest is a mechanical process.</p>



<p>&nbsp;</p>
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
