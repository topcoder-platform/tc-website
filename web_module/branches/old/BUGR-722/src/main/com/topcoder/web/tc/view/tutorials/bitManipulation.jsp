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
                <tc-webtag:forumLink forumID="506204" message="Discuss this article" /><br />
                <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
            </div>

<span class="bodyTitle">A bit of fun: fun with bits</span>


<img src="/i/m/bmerry_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251074" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />

<br/>

<span class="bodySubtitle">Introduction</span><br>
        Most of the optimizations that go into TopCoder contests
        are high-level; that is, they affect the algorithm rather than
        the implementation. However, one of the most useful and
        effective low-level optimizations is bit manipulation, or
        using the bits of an integer to represent a set. Not only does
        it produce an order-of-magnitude improvement in both speed and
        size, it can often simplify code at the same time.
<br><br>
I'll start by briefly recapping the basics, before going on to cover more advanced techniques.
<br><br>
<span class="bodySubtitle">The basics</span><br>
        At the heart of bit manipulation are the bit-wise
        operators <tt>&amp;</tt> (and), <tt>|</tt> (or),
        <tt>~</tt> (not) and <tt>^</tt> (xor). The first three
        you should already be familiar with in their boolean forms
        (<tt>&amp;&amp;</tt>, <tt>||</tt> and <tt>!</tt>).
        As a reminder, here are the truth tables:
<br><br>
<table class="formFrame" width="400" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td align="center">A</td>
      <td align="center">B</td>
      <td align="center">!A</td>
      <td align="center">A &amp;&amp; B</td>
      <td align="center">A || B</td>
      <td align="center">A ^ B</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">0</td><td align="center">0</td><td align="center">1</td><td align="center">0</td><td align="center">0</td><td align="center">0</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">0</td><td align="center">1</td><td align="center">1</td><td align="center">0</td><td align="center">1</td><td align="center">1</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">1</td><td align="center">0</td><td align="center">0</td><td align="center">0</td><td align="center">1</td><td align="center">1</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">1</td><td align="center">1</td><td align="center">0</td><td align="center">1</td><td align="center">1</td><td align="center">0</td>
   </tr>
</table>
<br><br>
        The bit-wise versions of the operations are the same,
        except that instead of interpreting their arguments as true or
        false, they operate on each bit of the arguments. Thus, if A
        is 1010 and B is 1100, then
        <ul>
            <li>A &amp; B = 1000</li>
            <li>A | B = 1110</li>
            <li>A ^ B = 0110</li>
            <li>~A = 11110101 (the number of 1's depends on the type
            of A).</li>
	</ul>

	The other two operators we will need are the shift operators
	<tt>a &lt;&lt; b</tt> and a <tt>&gt;&gt; b</tt>. The former
	shifts all the bits in <tt>a</tt> to the left by <tt>b</tt>
	positions; the latter does the same but shifts right. For non-negative
	values (which are the only ones we're interested in), the newly
	exposed bits are filled with zeros. You can think of left-shifting by
	<tt>b</tt> as multiplication by 2<sup><tt>b</tt></sup> and
	right-shifting as integer division by 2<sup><tt>b</tt></sup>. The
	most common use for shifting is to access a particular bit, for
	example, <tt>1 &lt;&lt; x</tt> is a binary number with bit
	<tt>x</tt> set and the others clear (bits are almost always
	counted from the right-most/least-significant bit, which is numbered
	0).
<br><br>
        In general, we will use an integer to represent a set on a
        domain of up to 32 values (or 64, using a 64-bit integer),
        with a 1 bit representing a member that is present and a 0 bit
        one that is absent. Then the following operations are quite
        straightforward, where <tt>ALL_BITS</tt> is a number with
        1's for all bits corresponding to the elements of the
        domain:
        <dl>
            <dt>Set union</dt>
            <dd><tt>A | B</tt></dd>
            <dt>Set intersection</dt>
            <dd><tt>A &amp; B</tt></dd>
            <dt>Set subtraction</dt>
            <dd><tt>A &amp; ~B</tt></dd>
            <dt>Set negation</dt>
            <dd><tt>ALL_BITS ^ A</tt></dd>
            <dt>Set bit</dt>
            <dd><tt>A |= 1 &lt;&lt; bit</tt></dd>
            <dt>Clear bit</dt>
            <dd><tt>A &amp;= ~(1 &lt;&lt; bit)</tt></dd>
            <dt>Test bit</dt>
            <dd><tt>(A &amp; 1 &lt;&lt; bit) != 0</tt></dd>
	</dl>

        <span class="bodySubtitle">Extracting every last bit</span><br>
        In this section I'll consider the problems of finding the
        highest and lowest 1 bit in a number.  These are basic
        operations for splitting a set into its elements.
<br><br>
        Finding the lowest set bit turns out to be surprisingly
        easy, with the right combination of bitwise and arithmetic
        operators. Suppose we wish to find the lowest set bit of
        <tt>x</tt> (which is known to be non-zero). If we subtract
        1 from <tt>x</tt> then this bit is cleared, but all the
        other one bits in <tt>x</tt> remain set. Thus, <tt>x
            &amp; ~(x - 1)</tt> consists of only the lowest set bit
        of <tt>x</tt>. However, this only tells us the bit value,
        not the index of the bit.
<br><br>
        If we want the index of the highest or lowest bit, the
        obvious approach is simply to loop through the bits (upwards
        or downwards) until we find one that is set. At first glance
        this sounds slow, since it does not take advantage of the
        bit-packing at all. However, if all 2<sup>N</sup> subsets of
        the N-element domain are equally likely, then the loop will
        take only two iterations on average, and this is actually the
        fastest method.
<br><br>
        The 386 introduced CPU instructions for bit scanning: BSF
        (bit scan forward) and BSR (bit scan reverse). GCC exposes
        these instructions through the built-in functions
        <tt>__builtin_ctz</tt> (count trailing zeros) and
        <tt>__builtin_clz</tt> (count leading zeros). These are
        the most convenient way to find bit indices for C++
        programmers in TopCoder. Be warned though: the return value is
        <em>undefined</em> for an argument of zero.
<br><br>
        Finally, there is a portable method that performs well in
        cases where the looping solution would require many
        iterations. Use each byte of the 4- or 8-byte integer to
        index a precomputed 256-entry table that stores the index of
        the highest (lowest) set bit in that byte. The highest
        (lowest) bit of the integer is then the maximum (minimum) of
        the table entries. This method is only mentioned for
        completeness, and the performance gain is unlikely to justify
        its use in a TopCoder match.
<br><br>
        <span class="bodySubtitle">Counting out the bits</span><br>
        One can easily check if a number is a power of 2:
        clear the lowest 1 bit (see above) and check if the result
        is 0. However, sometimes it is necessary to know how many bits
        are set, and this is more difficult.
<br><br>
        GCC has a function called <tt>__builtin_popcount</tt>
        which does precisely this. However, unlike
        <tt>__builtin_ctz</tt>, it does not translate into a
        hardware instruction (at least on x86). Instead, it uses a
        table-based method similar to the one described above for bit
        searches. It is nevertheless quite efficient and also
        extremely convenient.
<br><br>
        Users of other languages do not have this option (although
        they could re-implement it). If a number is expected to have
        very few 1 bits, an alternative is to repeatedly extract the
        lowest 1 bit and clear it.
<br><br>
        <span class="bodySubtitle">All the subsets</span><br>
        A big advantage of bit manipulation is that it is trivial
        to iterate over all the subsets of an N-element set: every
        N-bit value represents some subset. Even better, if A is a
        subset of B then the number representing A is less than that
        representing B, which is convenient for some dynamic
        programming solutions.
<br><br>
        It is also possible to iterate over all the subsets of a
        particular subset (represented by a bit pattern), provided
        that you don't mind visiting them in reverse order (if this is
        problematic, put them in a list as they're generated, then
        walk the list backwards). The trick is similar to that for
        finding the lowest bit in a number. If we subtract 1 from a
        subset, then the lowest set element is cleared, and every
        lower element is set. However, we only want to set those lower
        elements that are in the superset. So the iteration step is
        just <tt>i = (i - 1) &amp; superset</tt>.
<br><br>
        <span class="bodySubtitle">Even a bit wrong scores zero</span><br>
        There are a few mistakes that are very easy to make when
        performing bit manipulations. Watch out for them in your code.
        <ol>
            <li>When executing shift instructions for <tt>a
                &lt;&lt; b</tt>, the x86 architecture uses only
            the bottom 5 bits of <tt>b</tt> (6 for 64-bit
            integers). This means that shifting left (or right) by
            32 does nothing, rather than clearing all the bits. This
            behaviour is also specified by the Java and C# language
            standards; C99 says that shifting by at least the size of
            the value gives an undefined result. Historical trivia:
            the 8086 used the full shift register, and the change in
            behaviour was often used to detect newer processors.</li>

            <li>The <tt>&amp;</tt> and <tt>|</tt> operators
            have lower precedence than comparison operators. That
            means that <tt>x &amp; 3 == 1</tt> is interpreted as
            <tt>x &amp; (3 == 1)</tt>, which is probably not what
            you want.</li>
            <li>If you want to write completely portable C/C++ code,
            be sure to use unsigned types, particularly if you plan to
            use the top-most bit. C99 says that shift operations on
            negative values are undefined. Java only has signed types:
            <tt>&gt;&gt;</tt> will sign-extend values (which is
            probably <em>not</em> what you want), but the
            Java-specific operator <tt>&gt;&gt;&gt;</tt> will
            shift in zeros.</li>
        </ol>

        <span class="bodySubtitle">Cute tricks</span><br>
        There are a few other tricks that can be done with bit
        manipulation. They're good for amazing your friends, but
        generally not worth the effect to use in practice.
        <dl>
            <dt>Reversing the bits in an integer</dt>
            <dd>
            
<pre class="code">
x = ((x &amp; 0xaaaaaaaa) &gt;&gt; 1) | ((x &amp; 0x55555555) &lt;&lt; 1);
x = ((x &amp; 0xcccccccc) &gt;&gt; 2) | ((x &amp; 0x33333333) &lt;&lt; 2);
x = ((x &amp; 0xf0f0f0f0) &gt;&gt; 4) | ((x &amp; 0x0f0f0f0f) &lt;&lt; 4);
x = ((x &amp; 0xff00ff00) &gt;&gt; 8) | ((x &amp; 0x00ff00ff) &lt;&lt; 8);
x = ((x &amp; 0xffff0000) &gt;&gt; 16) | ((x &amp; 0x0000ffff) &lt;&lt; 16);
</pre>
            As an exercise, see if you can adapt this to count the
            number of bits in a word.</dd>
            <dt>Iterate through all k-element subsets of {0, 1,
            &hellip; N-1}</dt>
            <dd>
<pre class="code">
int s = (1 &lt;&lt; k) - 1;
while (!(s &amp; 1 &lt;&lt; N))
{
    // do stuff with s
    int lo = s &amp; ~(s - 1);       // lowest one bit
    int lz = (s + lo) &amp; ~s;      // lowest zero bit above lo
    s |= lz;                     // add lz to the set
    s &amp;= ~(lz - 1);              // reset bits below lz
    s |= (lz / lo / 2) - 1;      // put back right number of bits at end
}
</pre>
            In C, the last line can be written as <tt>s |= (lz
                &gt;&gt; ffs(lo)) - 1</tt> to avoid the division.
            </dd>
            <dt>Evaluate <tt>x ? y : -y</tt>, where <tt>x</tt>
            is 0 or 1</dt>
            <dd>
<pre class="code">(-x ^ y) + x</pre>
            This works on a twos-complement architecture (which is
            almost any machine you find today), where negation is done
            by inverting all the bits then adding 1. Note that on
            i686 and above, the original expression can be evaluated
            just as efficiently (i.e., without branches) due to the
            <tt>CMOVE</tt> (conditional move) instruction.
            </dd>
        </dl>
<br><br>
<span class="bodySubtitle">Sample problems</span><br>
        <strong><a href="http://www.topcoder.com/stat?c=problem_statement&amp;pm=6725&amp;rd=10100">TCCC 2006, Round 1B Medium</a></strong><br>
        For each city, keep a bit-set of the neighbouring cities.
        Once the part-building factories have been chosen
        (recursively), ANDing together these bit-sets will give a
        bit-set which describes the possible locations of the
        part-assembly factories. If this bit-set has k bits, then
        there are <sup>k</sup>C<sub>m</sub> ways to allocate the
        part-assembly factories.
<br><br>        
        <strong><a href="http://www.topcoder.com/stat?c=problem_statement&amp;pm=6095&amp;rd=9917">TCO 2006, Round 1 Easy</a></strong><br>
        The small number of nodes strongly suggests that this is
        done by considering all possible subsets. For every possible
        subset we consider two possibilities: either the
        smallest-numbered node does not communicate at all, in which
        case we refer back to the subset that excludes it, or it
        communicates with some node, in which case we refer back to
        the subset that excludes both of these nodes. The resulting
        code is extremely short:
<pre class="code">
static int dp[1 &lt;&lt; 18];

int SeparateConnections::howMany(vector &lt;string&gt; mat)
{
    int N = mat.size();
    int N2 = 1 &lt;&lt; N;
    dp[0] = 0;
    for (int i = 1; i &lt; N2; i++)
    {
        int bot = i &amp; ~(i - 1);
        int use = __builtin_ctz(bot);
        dp[i] = dp[i ^ bot];
        for (int j = use + 1; j &lt; N; j++)
            if ((i &amp; (1 &lt;&lt; j)) &amp;&amp; mat[use][j] == 'Y')
                dp[i] = max(dp[i], dp[i ^ bot ^ (1 &lt;&lt; j)] + 2);
    }
    return dp[N2 - 1];
}
</pre>
        <strong><a href="http://www.topcoder.com/stat?c=problem_statement&amp;pm=6475&amp;rd=9988">SRM 308, Division 1 Medium</a></strong><br>
        The board contains 36 squares and the draughts are
        indistinguishable, so the possible positions can be encoded
        into 64-bit integers. The first step is to enumerate all the
        legal moves. Any legal move can be encoded using three
        bit-fields: a <dfn>before</dfn> state, an <dfn>after</dfn>
        state and a <dfn>mask</dfn>, which defines which parts of the
        before state are significant. The move can be made from the
        current state if <tt>(current &amp; mask) == before</tt>;
        if it is made, the new state is <tt>(current &amp; ~mask) |
            after</tt>.
<br><br>
        <strong><a href="http://www.topcoder.com/stat?c=problem_statement&amp;pm=6400&amp;rd=10000">SRM 320, Division 1 Hard</a></strong><br>
        The constraints tell us that there are at most 8 columns
        (if there are more, we can swap rows and columns), so it is
        feasible to consider every possible way to lay out a row. Once
        we have this information, we can solve the remainder of the
        problem (refer to the <a href="http://www.topcoder.com/tc?module=Static&amp;d1=match_editorials&amp;d2=srm320">match
            editorial</a> for details). We thus need a list of all
        n-bit integers which do not have two adjacent 1 bits, and we
        also need to know how many 1 bits there are in each such row.
        Here is my code for this:

<pre class="code">
for (int i = 0; i &lt; (1 &lt;&lt; n); i++)
{
    if (i &amp; (i &lt;&lt; 1)) continue;
    pg.push_back(i);
    pgb.push_back(__builtin_popcount(i));
}
</pre>

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