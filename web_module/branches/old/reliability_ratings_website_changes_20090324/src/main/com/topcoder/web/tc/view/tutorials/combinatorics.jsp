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
        <td width="100%" align="center"><div class="tutorBodyFull">
            <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="alg_tut"/>
            <jsp:param name="title" value="&#160;"/>
            </jsp:include>
            <div class="linkBox"> <A href="/tc?module=Static&d1=tutorials&d2=alg_index">Archive</A><br />
                <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br />
                </span> <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br />
                </span>
                <tc-webtag:forumLink forumID="517191" message="Discuss this article" /><br />
                <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
            </div>
            
            <span class="bigTitle">Basics of combinatorics</span>
            <br /><br />

<div class="authorPhoto"> <img src="/i/m/x-ray_big.jpg" alt="Author" /> </div>
<div class="authorText"> By&#160;<tc-webtag:handle coderId="22654859" context="algorithm"/><br />
 <em>TopCoder Member</em> </div>
<br clear="all">
<p><span class="bodySubtitle">Introduction</span><br />
 Counting the objects that satisfy some criteria is a very common task in both TopCoder problems and in real-life situations. The myriad ways of counting the number of elements in a set is one of the main tasks in combinatorics, and I&rsquo;ll try to describe some basic aspects of it in this tutorial. These methods are used in a range of applications, from discrete math and probability theory to statistics, physics, biology, and more.</p>
<p><span class="bodySubtitle">Combinatorial primitives</span><br />
 Let&rsquo;s begin with a quick overview of the basic rules and objects that we will reference later.</p>
<blockquote><em>The rule of sum</em><br />
 <img src="/i/education/combinatorics/combin01.jpg" /></blockquote>
<blockquote><em>The rule of product</em><br />
 <img src="/i/education/combinatorics/combin02.jpg" /> </blockquote>
<p>For example, if we have three towns -- A, B and C -- and there are 3 roads from A to B and 5 roads from B to C, then we can get from A to C through B in 3*5=15 different ways.</p>
<p>These rules can be used for a finite collections of sets.</p>
<p><i>Permutation without repetition</i></p>
<p>When we choose <i>k</i> objects from <i>n</i>-element set in such a way that the order matters and each object can be chosen only once:</p>
<div align="center"><img src="/i/education/combinatorics/combin03.jpg" /></div>
<p>For example, suppose we are planning the next 3 contests and we have a set of 10 easy problems to choose from. We will only use one easy problem in each contest, so we can choose our problems in <img align="absmiddle" src="/i/education/combinatorics/combin04.jpg" /> different ways.</p>
<p><i>Permutation (variation) with repetition</i></p>
<p>The number of possible choices of <i>k</i> objects from a set of <i>n</i> objects when order is important and one object can be chosen more than once:</p>
<div align="center"><em>n<sup>k</sup></em></span></div>
<p>For example, if we have 10 different prizes that need to be divided among 5 people, we can do so in 5<sup>10</sup> ways.</p>
<p>Permutation with repetition</p>
<p>The number of different permutations of <i>n</i> objects, where there are <i>n<sub>1</sub></i> indistinguishable objects of type 1, <i>n<sub>2</sub></i> indistinguishable objects of type 2,..., and <i>n<sub>k</sub></i> indistinguishable objects of type <em>k</em> (n<sub>1</sub>+n<sub>2</sub>+&hellip;+n<sub>k</sub>=n), is:</p>
<div align="center"><img src="/i/education/combinatorics/combin05.jpg" /></div>
<p>For example, if we have 97 coders and want to assign them to 5 rooms (rooms 1-4 have 20 coders in each, while the 5th room has 17), then there are <img align="absmiddle" src="/i/education/combinatorics/combin06.jpg" /> possible ways to do it.</p>
<p><i>Combinations without repetition</i></p>
<p>In combinations we choose a set of elements (rather than an arrangement, as in permutations) so the order doesn&rsquo;t matter. The number of different k-element subsets (when each element can be chosen only once) of n-element set is:</p>
<div align="center"><img src="/i/education/combinatorics/combin07.jpg" /></div>
<p>For example, if we have 7 different colored balls, we can choose any 3 of them in <img src="/i/education/combinatorics/combin08.jpg" /> different ways.</p>
<p><i>Combination with repetition</i></p>
<p>Let's say we choose k elements from an n-element set, the order doesn&rsquo;t matter and each element can be chosen more than once. In that case, the number of different combinations is:</p>
<div align="center"><img src="/i/education/combinatorics/combin09.jpg" /></div>
<p>For example, let's say we have 11 identical balls and 3 different pockets, and we need to calculate the number of different divisions of these balls to the pockets. 
There would be <img src="/i/education/combinatorics/combin10.jpg" /> different combinations.</p>
<p>It is useful to know that <img src="/i/education/combinatorics/combin11.jpg" /> is also the number of integer solutions to this equation:</p>
<div align="center"><img src="/i/education/combinatorics/combin12.jpg" /></div>
<p>Why? It's easy to prove. Consider a vector (1, 1, &hellip;, 1) consisting of (<tt>n+k-1</tt>) ones, in which we want to substitute <tt>n-1</tt> ones for zeroes in such way that we'll get <tt>n</tt> groups of ones (some of which may be empty) and the number of ones in the i<sup>th</sup> group will be the value of x<sub>i</sub>:</p>
<div align="center"><img src="/i/education/combinatorics/combin13.jpg" /></div>
<p>The sum of <tt>x<sub>i</sub></tt> will be <tt>k</tt>, because <tt>k</tt> ones are left after substitution.</p>
<p><span class="bodySubtitle">The Basics</span></p>
<p><i>Binary vectors</i></p>
<p>Some problems, and contest problems are no exception, can be reformulated in terms of binary vectors. Accordingly, some knowledge of the basic combinatorial properties of binary vectors is rather important. Let&rsquo;s have a look at some simple things associated with them:</p>
<p>1. Number of binary vectors of length n: 2<sup>n</sup>.</p>
<p>2. Number of binary vectors of length n and with k &lsquo;1&rsquo; is <br />
<img src="/i/education/combinatorics/combin14.jpg" />.</p>
<p>We just choose k positions for our &lsquo;1&rsquo;s.</p>
<p>3. The number of ordered pairs (a, b) of binary vectors, such that the distance between them (k) can be calculated as follows: <img src="/i/education/combinatorics/combin15.jpg" />. <br />
The distance between a and b is the number of components that differs in a and b -- for example, the distance between (0, 0, 1, 0) and (1, 0, 1, 1) is 2).</p>
<p>Let a = (a<sub>1</sub>, a<sub>2</sub>, &hellip;a<sub>n</sub>), b = (b<sub>1</sub>, b<sub>2</sub>, &hellip;b<sub>n</sub>) and distance between them is k. Next, let&rsquo;s look at the sequence of pairs (a<sub>1</sub>, b<sub>1</sub>), (a<sub>2</sub>, b<sub>2</sub>), &hellip; (a<sub>n</sub>, b<sub>n</sub>). 
There are exactly k indices i in which a<sub>i</sub> &ne; b<sub>i</sub><sub></sub>. They can be (0,1) or (1,0), so there are 2 variants, and n-k can be either (0,0) or (1,1), for another 2 variants. To calculate the answer we can choose k indices in which vectors differs in 
<img src="/i/education/combinatorics/combin14.jpg" /> ways, then we choose components that differs in 2<sup>k</sup> ways and components that are equal in 2<sup>n-k</sup> ways (all of which use the permutation with repetition formula), and in the end we just multiply all these numbers and get 
<img src="/i/education/combinatorics/combin16.jpg" />.</p>
<p><span class="bodySubtitle">Delving deeper</span><br />
Now let&rsquo;s take a look at a very interesting and useful formula called the inclusion-exclusion principle (also known as the sieve principle):</p>
<div align="center"><img src="/i/education/combinatorics/combin17.jpg" /></div>
<p>This formula is a generalization of:</p>
<div align="center"><img src="/i/education/combinatorics/combin18.jpg" /></div>
<p>There are many different problems that can be solved using the sieve principle, so let&rsquo;s focus our attention on one of them. This problem is best known as &ldquo;Derangements&rdquo;. A derangement of the finite set X is a <a
href="http://en.wikipedia.org/wiki/Bijective">bijection</a> from X into X that doesn&rsquo;t have fixed points. A small example: For set X = {1, 2, 3} bijection {(1,1), (2,3), (3,2)} is not derangement, because of (1,1), but bijection {(1,2), (2,3), (3,1)} is derangement. So let&rsquo;s turn back to the problem, the goal of which is to find the number of derangements of n-element set.</p>
<p>We have X = {1, 2, 3,&hellip;, n}. Let:</p>
<ul><li>A be the set of all bijections from X into X, <font face="Times New Roman, Times, serif">|<em>A</em>|=<em>n!</em></font>,</li> 
<li>A<sub>0</sub> be the set of all derangements of X,</li>
<li>A<sub>i</sub> ( <em><font face="Times New Roman, Times, serif">i &isin; X </font></em>) be the set of bijections from X into X that have (i,i),</li>
<li>A<sub>I</sub> (<em>I &sube; X</em>) be the set of bijections from X into X that have (i,i) &forall;<em>i</em>&sube;<em>I</em>,
 so <img src="/i/education/combinatorics/combin20.jpg" /> and <font face="Times New Roman, Times, serif">|<em>A<sub>I</sub></em>|=(<em>n</em>-|<em>A<sub>I</sub></em>|)!</font>.</li></ul>
<p>In formula we have sums <img src="/i/education/combinatorics/combin21.jpg" />, in our case we&rsquo;ll have 
<img src="/i/education/combinatorics/combin22.jpg" />, so let&rsquo;s calculate them:</p>
<div align="center"><img src="/i/education/combinatorics/combin23.jpg" /></div>
<p>(because there are exactly <img src="/i/education/combinatorics/combin24.jpg" /> i-element subsets of X).</p>
<p>Now we just put that result into the sieve principle&rsquo;s formula:</p>
<div align="center"><img src="/i/education/combinatorics/combin25.jpg" /></div>
<p>And now the last step, from <img src="/i/education/combinatorics/combin26.jpg" /> we&rsquo;ll have the answer:</p>
<div align="center"><img src="/i/education/combinatorics/combin27.jpg" /></div>
<p>And the last remark:</p>
<div align="center"><img src="/i/education/combinatorics/combin28.jpg" /></div>
<p>This problem may not look very practical for use in TopCoder problems, but the thinking behind it is rather important, and these ideas can be widely applied.</p>
<p>Another interesting method in combinatorics -- and one of my favorites, because of its elegance -- is called method of paths (or trajectories). 
The main idea is to find a geometrical interpretation for the problem in which we should calculate the number of paths of a special type. More precisely, if we have two points A, B on a plane with integer coordinates, then we will operate only with the shortest paths between A and B that pass only through the lines of the integer grid and that can be done only in horizontal or vertical movements with length equal to 1. For example:</p>
<div align="center"><img src="/i/education/combinatorics/combin28a.gif">&nbsp;&nbsp;&nbsp;&nbsp;<img src="/i/education/combinatorics/combin28b.gif">&nbsp;&nbsp;&nbsp;&nbsp;<img border=0 src="/i/education/combinatorics/combin28c.gif"></div>
<p>All paths between A and B have the same length equal to n+m (where n is the difference between x-coordinates and m is the difference between y-coordinates). We can easily calculate the number of all the paths between A and B as follows:</p>
<div align="center"><img src="/i/education/combinatorics/combin29.jpg" /> or <img src="/i/education/combinatorics/combin30.jpg" />.</div>
<p>Let&rsquo;s solve a famous problem using this method. The goal is to find the number of Dyck words with a length of 2n. What is a Dyck word? It's a string consisting only of n X&rsquo;s and n Y&rsquo;s, and matching this criteria: each prefix of this string has more X&rsquo;s than Y&rsquo;s. For example, &ldquo;XXYY&rdquo; and &ldquo;XYXY&rdquo; are Dyck words, but &ldquo;XYYX&rdquo; and &ldquo;YYXX&rdquo; are not.</span></p>
<div align="center"><img src="/i/education/combinatorics/combin29a.gif">&nbsp;&nbsp;&nbsp;&nbsp;<img src="/i/education/combinatorics/combin29b.gif"></div>
<p>Let&rsquo;s start the calculation process. We are going to build a geometrical analog of this problem, so let&rsquo;s consider paths that go from point A(0, 0) to point B(n, n) and do not cross segment AB, but can touch it (see examples for n=4).</p>
<p>It is obvious that these two problems are equivalent; we can just build a bijection in such a way: step right - &lsquo;X&rsquo;, step up - &lsquo;Y&rsquo;.</p>
<p>Here's the main idea of the solution: Find the number of paths from A to B that cross segment AB, and call them &ldquo;incorrect&rdquo;. If path is &ldquo;incorrect&rdquo; it has points on the segment CD, where C = (0, 1), D = (n-1, n). Let E be the point nearest to A that belongs to CD (and to the path). Let&rsquo;s symmetrize AE, part of our &ldquo;incorrect&rdquo; path with respect to the line CD. After this operation we&rsquo;ll get a path from F = (-1, 1) to B.</p>
<div align="center"><img src="/i/education/combinatorics/combin29c.gif">&nbsp;&nbsp;&nbsp;&nbsp;<img src="/i/education/combinatorics/combin29d.gif"></div>
<p>It should be easy to see that, for each path from F to B, we can build only one &ldquo;incorrect&rdquo; path from A to B, so we&rsquo;ve got a bijection. Thus, the number of &ldquo;incorrect&rdquo; paths from A to B is <img src="/i/education/combinatorics/combin31.jpg" />. Now we can easily get the answer, by subtracting the number of &ldquo;incorrect&rdquo; paths from all paths:</p>
<div align="center"><img src="/i/education/combinatorics/combin32.jpg" /></div>
<p>This number is also known as n&rsquo;s Catalan number: C<sub>n</sub> is the number of Dyck words with length 2n. These numbers also appear in many other problems, for example, C<sub>n</sub> counts the number of correct arrangements of n pairs of parentheses in the expression, and C<sub>n</sub> is also the number of the possible triangulations of a polygon with (n+2) vertices, and so on.</p>
<p><span class="bodySubtitle">Using recurrence relations</span><br />
Recurrence relations probably deserves their own separate article, but I should mention that they play a great role in combinatorics. Particularly with regard to TopCoder, most calculation problems seem to require coders to use some recurrence relation and find the solution for the values of parameters.</p>
<p>If you'd like to learn more, check out these tutorials: 
<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=recursionPt1">An Introduction to Recursion</a>, 
<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=recursionPt2">Recursion, Part 2</a>, and  
<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=dynProg">Dynamic Programming: From novice to advanced</a>. Done reading? Let&rsquo;s take a look at some examples.</p>
<p><i><a
href="/stat?c=problem_statement&amp;pm=7261&amp;rd=10011">ChristmasTree</a> 
(SRM 331 Division Two &ndash; Level Three):</i></p>
<p>We&rsquo;ll use DP to solve this -- it may not be the best way to tackle this problem, but it&rsquo;s the easiest to understand. 
Let <b>cnt[lev][r][g][b]</b> be the number of possible ways to decorate the first <b>lev</b> levels of tree using <b>r</b> red, <b>g</b> green and <b>b</b> blue baubles.
 To make a recurrent step calculating <b>cnt[lev][r][g][b]</b> we consider 3 variants:</p>
<blockquote><i>cnt[lev][r][g][b]=</i></blockquote>
<p>1) we fill the last level with one color (red, green or blue), so just:</p>
<p>&nbsp;= cnt [lev-1][r-lev][g][b]+ cnt[lev-1][r][g-lev][b]+ cnt[lev-1][r][g][b-lev]+  ;</p>
<p>2) if (lev%2 == 0) we fill the last level with two colors (red+green, green+blue or red+blue), then we calculate the number of possible decorations using the <i>Permutation with repetition</i> formula. We&rsquo;ll get 
<img src="/i/education/combinatorics/combin33.jpg" align="absmiddle"> possible variants for each two colors, so just</p>
<p><img
src="/i/education/combinatorics/combin33.jpg" align="absmiddle"> <font face="Times New Roman, Times, serif">(cnt[lev-1][r-lev/2][g-lev/2][b]+...+cnt[lev-1][r][g-lev/2][b-lev/2])+</font>;</p>
<p>3) if (lev%3 == 0) we fill the last level with three colors and, again using the <i>Permutation with repetition</i> formula, we&rsquo;ll get 
<img src="/i/education/combinatorics/combin35.jpg" /> possible variants, so we&rsquo;ll get:</p>
<div align="center"><img src="/i/education/combinatorics/combin36.jpg" /></div>
<p>(all cnt[l][i][j][k] with negative indices are 0).</p>
<p><i><a
href="/stat?c=problem_statement&amp;pm=7601&amp;rd=10673">DiceGames</a> 
(SRM 349 Division One &ndash; Level Two):</i></p>
<p>First we should do some preparation for the main part of the solution, by sorting <b>sides</b> array in increasing order and calculating only the formations where the numbers on the dice go in non-decreasing order. 
This preparation saves us from calculating the same formations several times (see <a
href="/tc?module=Static&amp;d1=match_editorials&amp;d2=srm349">SRM 349 - Problem Set &amp; Analysis</a> for additional explanation).
Now we will only need to build the recurrence relation, since the implementation is rather straightforward. 
Let <b>ret[i][j]</b> be the number of different formations of the first <i>i</i> dice, with the last dice equal to <i>j</i>
 (so <img src="/i/education/combinatorics/combin37.jpg" />, where n is the number of elements in <b>sides</b>). Now we can simply write the recurrence relation:</p>
<div align="center"><img src="/i/education/combinatorics/combin38.jpg" /></div>
<p>The answer will be <img src="/i/education/combinatorics/combin39.jpg" />.</p>
<p><span class="bodySubtitle">Conclusion</span><br />
As this article was written for novices in combinatorics, it focused mainly on the basic aspects and methods of counting. To learn more, I recommend you check out the reference works listed below, and keep practicing &ndash; both in TopCoder SRMs and pure mathematical problems. Good luck!</p>
<p><b>References:</b></p>
<ol><li>Hall M. &ldquo;<a href="http://www.amazon.com/Combinatorial-Theory-2nd-Marshall-Hall/dp/0471315184">Combinatorial theory</a>&rdquo;</li>
<li>Cameron P.J. &ldquo;<a href="http://books.google.com/books?id=jKY7Ta9LdLgC&dq=&sa=X&oi=print&ct=book-ref-page-link">Combinatorics: Topics, Techniques, Algorithms</a>&rdquo;</li>
<li><a href="http://en.wikipedia.org/wiki/Main_Page">en.wikipedia.org</a> :-)</li></ol>

            <p>&nbsp; </p>
            <br />
            <br />
        </td>
        <!-- Center Column Ends -->
        <!-- Right Column Begins -->
        <td width="170" id="onRight"><jsp:include page="../public_right.jsp">
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
