<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles: Generating random numbers with C++ TR1</title>
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
    <a href="/tc?module=Static&amp;d1=features&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <tc-webtag:forumLink forumID="522329" message="Discuss this article" /><br />
    <a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Generating random numbers with C++ TR1</span>
<br /><br />
<div class="authorPhoto">
    <img src="/i/m/bmerry_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="251074" context="algorithm" /><br />
      <em>TopCoder Member</em>
</div>
<br clear="all">


<h3>Introduction</h3>
<p>In previous articles, I have looked at how to generate various
        <a
        href="/tc?module=Static&amp;d1=tutorials&amp;d2=randomNumbers">random
        distributions of one variable</a>, and <a
        href="/tc?module=Static&amp;d1=tutorials&amp;d2=randomNumbers2">random collections of
        variables</a>. Those articles assumed only a random number generator
        that produced random numbers in some fixed range, such as the C
        <code>rand()</code> function. In this article, I'll look at a specific
        random number library, and how it can simplify random number
        generation.</p>

        <h3>What is TR1?</h3>
        <p>The current version of the C++ standard was ratified in 1998. Since
        then, there has been a lot of work towards defining a new version of
        the standard, currently with the working title of C++0x. This revision
        will add assorted new features to the language itself, but in the
        meantime, a subset of the proposals have been put into an interim
        standard, known as TR1. TR1 contains no new language syntax, only new
        additions to the standard libraries. The additions are a mix of
        various useful things, including smart pointers, hash tables, regular
        expressions, and, of course, random number generators.</p>

        <p>Because there are no changes to the language, TR1 can easily be
        bolted on to existing compilers. GCC started implementing TR1 with the
        version 4 series, and the random number generation facilities are
        included from GCC 4.2. Microsoft also provide beta TR1 support as an
        extension pack to Visual Studio 2008, although I haven't tried it so I
        don't know if it includes random number generation.</p>

        <p>I should also mention that I am far from being an expert on TR1,
        and I would encourage the Topcoder community to contribute their
        knowledge and experience in the forums. What I describe below is
        merely my experience in using the implementation in GCC 4.2.</p>

        <h3>Generators, engines and distributions</h3>
        <p>One of the problems with random number generation in C is that
        there is only one random source: the <code>rand</code> function. In a
        marathon match, particularly interactive problems, it is
        often desirable to be able to reliably reproduce the same sequence of
        random numbers, even if some parts of your code change. This way, you
        can separate the effect of the change you made from the effects of
        randomness. However, with a single random source, adding or removing
        some steps might have the side effect of changing the position in the
        sequence of random numbers, which will change the random numbers for
        the rest of the program execution.</p>

        <p>TR1 identifies three abstract concepts related to random number
        generation: engines, generators and distributions. An
        <dfn>engine</dfn> is a pseudo-random number generator
        with reproducable behaviour. Several types of engines are defined,
        including the standard linear congruential generator used by many
        implementations of <code>rand</code>, as well as the popular
        Mersenne Twister. Engines can be seeded, copied and saved to file and
        restored, making it possible to control the interactions between
        different pieces of code on the random source.</p>

        <p>A <dfn>uniform random number generator</dfn> is a more abstract
        concept: it simply has to generate numbers in some range (either
        integer or floating point) with a uniform distribution. Engines are
        required to be uniform random number generators, but other source are
        possible, such as a hardware or operating system random number
        generator that uses external events as a source of cryptographically
        secure randomness.</p>

        <p>Finally, a <dfn>distribution</dfn> is the user-friendly front end
        to the whole infrastructure. It takes randomness from a generator and
        formats it into your distribution of choice - be it a uniform
        distribution with a range you specify, or a normal distribution, or
        something else.</p>

        <p>Let's dive in with an example:</p>
        <pre class="code">#include &lt;tr1/random&gt;
#include &lt;iostream&gt;
#include &lt;cstdlib&gt;

using namespace std;
using namespace std::tr1;

int main()
{
    variate_generator&lt;mt19937, normal_distribution&lt;&gt; &gt; r(mt19937(time(NULL)), normal_distribution&lt;&gt;(0.5, 2.0));

    for (int i = 0; i &lt; 5; i++)
        cout &lt;&lt; r() &lt;&lt; endl;
    return 0;
}</pre>
        <p>Now, what does it all mean? Let's take it one bit at a time.
        Firstly, the header file is <code>tr1/random</code>, and the classes
        are all defined in the <code>std::tr1</code> namespace. The
        <code>variate_generator</code> template is a handy wrapper class that
        combines an engine and a distribution into a single function object.</p>

        <p>TR1 provides a number of predefined engine templates, which take
        various parameters controlling the pseudo-random generation. However,
        it's difficult to remember the magic numbers that make good random
        number generation, so it also provides typedefs for various common
        instances. One of these is <code>mt19937</code>, which is the standard
        Mersenne Twister (the 19937 in the name refers to the period, which is
        2<sup>19937</sup> - 1).</p>

        <p>The probability distribution here is the normal distribution. This
        is also a template (depending on which floating-point type you would
        like to generate), but it defaults to <code>double</code> and so we do
        not need to supply any template parameters. The constructor parameters
        are the mean and standard deviation.</p>

        <p>Finally, we put it all to work, outputting five random numbers with
        a normal distribution.</p>

        <h3>Multiple distributions</h3>
        <p>This is fine if we only ever need to generate random numbers from
        one distribution, but what if we need more? You could just
        copy-and-paste the declaration and then change it. However, you'll
        probably notice that unless a second passes between the constructors
        being called, the engines will be generated with the same seed, and
        hence will produce the same random numbers. A second attempt may be to
        construct just one engine, and pass that to the constructors for each
        <code>variate_generator</code>. Unfortunately, that is no better,
        since each <code>variate_generator</code> takes a copy of the engine,
        so they will again be generating the same random numbers. The TR1
        specification indicates that the first template parameter can be a
        reference or pointer to an engine type, which presumably would solve
        the problem, but GCC 4.2 appears not to support this.</p>

        <p>What else can one do in the meantime? Several options spring to
        mind:</p>
        <dl>
            <dt>Use one engine to seed others</dt>
            <dd><p>Most high-quality random number engines have a lot of internal
            state (<code>mt19937</code> stores 624 integers), so creating and
            seeding one can be expensive. This also means that seeding with
            only a single number is less than ideal. TR1 allows a function
            object to be used as a seed, which the engine will call as many
            times as necessary. Here is an example of creating two normal
            distributions:</p>
            <pre class="code">mt19937 seeder(time(NULL));
variate_generator&lt;mt19937, normal_distribution&lt;&gt; &gt; r1(mt19937(seeder), normal_distribution&lt;&gt;(0.5, 2.0));
variate_generator&lt;mt19937, normal_distribution&lt;&gt; &gt; r2(mt19937(seeder), normal_distribution&lt;&gt;(0.5, 2.0));</pre>
            <p>However, I'm not entirely certain that this will not cause some
            correlation between shifted versions of the two sequences.</p>
            </dd>

            <dt>Don't use <code>variate_generator</code></dt>
            <dd><p>
            A distribution can be used as a function object, taking an
            engine as a parameter. Unfortunately, GCC's implementation seems
            to require certain types of generator (integral or real-valued)
            depending for some distributions. In particular,
            <code>normal_distribution</code> doesn't work with an integral
            generator. The good news is that a real-valued generator seems to
            work for all the distributions I've tried (I haven't tried them
            all, however). One can either use one of the real-valued engines
            provided by TR1, or convert an integral engine into a real-valued
            generator using <code>variate_generator</code>:</p>
            <pre>variate_generator&lt;mt19937, uniform_real&lt;&gt; &gt; urng(mt19937(time(NULL)), uniform_real&lt;&gt;());</pre>
            </dd>
        </dl>

        <h3>Conclusions</h3>
        <p>TR1 solves several major short-comings of the aging C random number
        generator: it gives explicit control over the state of engines,
        defines portable engines that yield reproducable behaviour between
        compilers, and provides a number of discrete and continuous
        non-uniform distributions. However, there are still some quirks and
        inconveniences, at least under GCC. It appears that
        the random number interface in C++0x is still in development, and
        presumably the GCC developers are striving to improve their
        implementation, so we may soon see a day when random number generation
        will be both simple and powerful.</p>



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
