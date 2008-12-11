<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Marathon Match Tutorials</title>
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
   width: 500;
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
            <jsp:param name="node" value="mm_tutorials"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="mm_tut"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=tutorials&d2=mm_index">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="517127" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>

<span class="bigTitle">Generating random distributions</span>
<br />
<br />

<div class="authorPhoto">
    <img src="/i/m/bmerry_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="251074" context="marathon"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">
<p>One of the features that I have found interesting about the Marathon
        Match format is that the data is hidden, yet you have a pretty good
        idea of what it is going to look like. This is because all the cases
        are randomly generated, and the problem always contains a detailed
        specification of the generation method. While there
        is sometimes a visualization tool that can generate test cases
        for you, other times you'll have to do it  yourself. In this tutorial,
        we'll look at a few probability distributions and how to
        generate values based on them.</p>

        <p>I'll be discussing the issues in terms of C/C++ (my
        language of choice). Accordingly, some of the initial, low-level stuff
        won't be applicable to other languages that have more
        user-friendly random number libraries. However, the later
        information will be applicable to all.</p>

        <p><span class="bodySubtitle">Uniform scalar and discrete distributions</span><br />
        Let's start with something simple: generating a single
        variable.  The basic building block is the uniform discrete
        distribution, meaning that each of N possibilities is equally
        likely. The approach that is often used when you want an
        arbitrary number and aren't worried about things being exactly
        uniform is <code>rand() % N</code>, but there are a few problems
        with this. Firstly, some random number generators are badly
        designed, with the low-order bits repeating quite quickly. To
        be safe, I'd recommend that you use something like:</p>

        <pre>(int) (N * (rand() / (RAND_MAX + 1.0)))</pre>

        <p>This will  first obtain a real number in the range [0, 1), then scale and truncate it. Another problem is that unless N
        is a factor of <code>RAND_MAX + 1</code>, either method will
        generate a small amount of bias, particularly if N is quite
        large. Think about trying to make a choice among 5 options
        using a 6-sided die: there is no way to map the 6 die rolls to
        the 5 options in an unbiased way. The solution is the
        metaphorical equivalent of rolling the die again if a 6 comes
        up: we identify a useful range of random outputs (a multiple
        of N), and if anything else comes up, we discard it. The
        simplest solution is to reject any <code>rand()</code> that
        is at least <code>RAND_MAX - RAND_MAX % N</code>. This uses as
        much of the range as possible, and since this is always at
        least half of it, the average number of calls to
        <code>rand()</code> is at most 2 and usually far less.</p>

        <p>If your favourite language doesn't provide you with a way
        to generate a random real number in the range [0, 1), you can
        generate one as <code>rand() / (RAND_MAX + 1.0)</code>. This
        is not perfect, because it will only generate one of typically
        2<sup>31</sup> values, but for most purposes that is good
        enough.</p>

        <p>If I'm writing any kind of data generator, I start by
        writing utility functions to implement these algorithms, so
        that I don't need to worry about the details when I'm doing
        the interesting parts.</p>

        <p><span class="bodySubtitle">Non-uniform discrete distributions</span><br />
        Let's say that you have a loaded die, with specified
        probabilities for each outcome. This can be simulated by
        mapping each outcome to a suitable range of the [0, 1)
        interval, then generating a uniform random number. For
        example, suppose a die has probabilities of 0.1, 0.2, 0.1,
        0.3, 0.15 and 0.15 of coming up 1, 2, 3, 4, 5 or 6. We can map
        these events to the ranges [0, 0.1), [0.1, 0.3), [0.3, 0.4),
        [0.4, 0.7), [0.7, 0.85) and [0.85, 1.0). We then generate a
        random number in [0, 1) with a uniform (unbiased)
        distribution, and check which range it lies in. If there are
        many possible events, a binary search can accelerate this
        lookup.</p>

        <p>In some cases, the probabilities will change at run-time. A
        real-world instance of this is in streaming data compression,
        where the probability of seeing a piece of text is updated
        depending on the number of times it has already been seen. A
        <a
            href="/tc?module=Static&amp;d1=tutorials&amp;d2=binaryIndexedTrees">binary
            indexed tree</a> is ideal for this type of problem.
        </p>

        <p><span class="bodySubtitle">Non-uniform continuous distributions</span><br />
        The idea of the previous section can be generalized to
        continuous distributions. As an example, let's suppose that
        some number lies in the range [0, 1), but the probability of
        it being <strong>x</strong> is directly proportional to <strong>x</strong> (so
        values close to 1 are more likely). First, let's find out
        exactly what the probability density function is: it's going
        to have the form p(<strong>x</strong>) = <strong>ax</strong>, but we need to
        choose <strong>a</strong> so that the integral is 1. Doing a little
        calculus shows that <strong>a</strong> = 2. Next, we want the cumulative
        density function, which is the indefinite integral of the
        probability density function, in this case c(<strong>x</strong>) =
        <strong>x</strong><sup>2</sup>. To generate a random number with a given
        distribution, the procedure is to start with a uniform random
        number in the range [0, 1), then pass it through the
        <em>inverse</em> of the cumulative distribution function. In
        this case, we just take sqrt(<strong>r</strong>), where <strong>r</strong> is a
        uniform random number in [0, 1).</p>

        <p>This works when the cumulative density function is both
        known and reasonably easy to invert (although binary search
        can always be used for the inversion). Unfortunately, the most
        important distribution, the Gaussian or normal
        distribution, does not have a formula for its cumulative
        density function. Curiously, it is easier to generate
        <em>two</em> normally distributed random numbers. The
        following algorithm will do this. I won't provide a proof, but
        if you want to try to prove it yourself, think about
        integrating the bivariate Gaussian distribution in polar
        form.</p>

        <ol>
            <li>Pick two random numbers <strong>x</strong> and <strong>y</strong>
            uniformly from the interval [-1, 1].</li>
            <li>Let <strong>r</strong><sup>2</sup> = <strong>x</strong><sup>2</sup> +
            <strong>y</strong><sup>2</sup>.</li>
            <li>If <strong>r</strong><sup>2</sup> &gt; 1, go back to step
            1.</li>
            <li>Let <strong>u</strong> = sqrt(-2 log(<strong>r</strong><sup>2</sup>) /
            <strong>r</strong><sup>2</sup>)<strong>x</strong>.</li>
            <li>Let <strong>v</strong> = sqrt(-2 log(<strong>r</strong><sup>2</sup>) /
            <strong>r</strong><sup>2</sup>)<strong>y</strong>.</li>
            <li><strong>u</strong> and <strong>v</strong> both have the standard normal
            distribution.</li>
        </ol>

        <p>Although you get two random numbers out, I usually discard
        one rather than try to keep it around for the next time I need
        a random number. The numbers also have the <em>standard</em>
        distribution, which has a mean of 0 and a standard deviation
        of 1. If you need a different mean and/or standard deviation,
        it is sufficient to scale and bias the number obtained.</p>

    <p><span class="bodySubtitle">Coming soon</span><br />
      So far we've seen how to generate random
      distributions with a single variable. In part 2, we'll look at
      generating random collections of elements, such as
      permutations, combinations and subsets.</p>
<p>&nbsp;</p>

<br /><br />
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
