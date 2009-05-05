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

<span class="bigTitle">Generating random distributions, Part 2</span>
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
<p>
        In <a href="/tc?module=Static&d1=tutorials&d2=randomNumbers">Part 1</a>, I looked at how to generate a single random number
        or event. This provides an essential toolbox for test case
        generation, but many marathon matches require more complicated
        lists or sets of items, and in Part 2 we'll see how to tackle
        those.
        </p>
        <p>I will be using <a
            href="/longcontest/?module=ViewProblemStatement&amp;compid=7045&amp;rd=10500">Scruffle</a>,
        the first-round
        problem from <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=description">TCCC 2007</a>, as an example where several of the
        techniques may be applied. Since this problem did not provide
        a test case generator, it was a real advantage to
        be able to write your own.
        </p>
        <p><span class="bodySubtitle">Random seeds</span><br />
        Before getting into the details, I should first explain at
        a very high level what a random number generator does. Since
        it is very difficult to generate true randomness, library
        functions are used to generate a stream of numbers that appear
        to be more or less random. The random number generator holds
        some internal state, and each call to <code>rand()</code>
        generates a new random number and updates the state. There is
        a lot of mathematical theory that goes into the design of a
        good random number generator, but for our purposes the key
        point is that the stream of random numbers is entirely
        determined by the initial state, known as the <em>seed</em>.
        </p>
        <p>Any decent random number library should have a means to
        explicitly specify the seed. The default varies; in C++ there
        is a fixed default seed, while in other languages the seed
        is initialised from some external source of variability, such as
        the time of day. If you use random numbers in your submission,
        then explicitly setting a fixed seed will ensure that your
        program will make the same random decisions every time, making
        it possible to compare different variants of the program.
        </p>
        <p>You can make different variants of your program more
        comparable by always consuming a fixed number of random
        numbers in each piece of code, even if this means throwing
        some of them away. If you don't, then a change in an early
        piece of code may desynchronise the random number streams in
        the two versions of the program, thus affecting all random
        numbers chosen later. In Scruffle, for example, some number of
        blocks must be made special (obstacles, double-word or
        triple-word blocks), and the rest each receive a random weight
        from 0 to 9. Based on this principle, I picked a random weight
        for <em>every</em> block, even when I knew it would not be
        used.  When I later discovered that I was generating the wrong
        number of triple-word blocks due to a copy-paste error, I
        could fix the bug and know that everything else about the
        generated test cases would be the same. While this isn't so
        important when generating test cases off-line, if you
        incorporate randomness into a submission then this would
        reduce the amount of noise in your results due to randomness.
        </p>
        <p>I should clarify what I mean by a &ldquo;fixed&rdquo;
        number of random numbers. The algorithm I gave for generating the
        standard normal distribution in part 1 checks if the random
        numbers it generates falls in an acceptable range, and if not,
        it picks some new numbers. However, as long as this function
        is always called at the same point in the random number
        stream, it will generate the same numbers initially, and so it
        will always consume a fixed amount of the random number
        stream. The cases you should try to avoid are those where you
        branch on something that is likely to change between versions
        of your code, particularly a tuning parameter, and you
        generate a different number of random numbers in each branch.
        </p>
        <p><span class="bodySubtitle">Random permutations</span><br />
        Let's suppose that you have a list of objects, and you need
        them shuffled into a random order (like shuffling a deck of
        cards), with all possible orders being equally likely. A
        novice attempt might be to repeatedly swap pairs of
        randomly-chosen elements. However, elements will always be
        slightly more likely to remain in their original positions.
        (<a
            href="/stat?c=problem_statement&amp;pm=7289">RandomSwaps</a>
        from SRM 338 demonstrates this quite nicely). Even
        worse, if the number of swaps is fixed, then 50% of the
        possible permutations have a <em>zero</em> chance of being
        used. This is because the number of pairs that are out of their
        original order changes parity with every swap.
        </p>
        <p>Fortunately, there is a simple and efficient algorithm that
        gives a uniform distribution. Assume there are N elements to
        be arranged in an array. Any one of them could be the first
        element, so pick one at random and swap it to the front. You've
        now changed the relative order of the remaining elements, but
        the original order is irrelevant anyway. Now, we are left with
        N - 1 elements, which we need to permute, and it is not hard
        to see that all (N - 1)! permutations ought to be equally
        likely. So we can apply the same procedure recursively until
        all the elements are permuted.
        </p>

        <p><span class="bodySubtitle">Random subsets</span><br />
        In the Scruffle problem, we need to label a certain number
        of squares as obstacles. The wording of the problem implicitly
        suggests one approach: pick a block at random, and if it has
        already been marked, then try again. This works well enough in
        this case, but there a number of drawbacks:</p>
        <ul>
            <li>The number of random numbers you generate depends on
            both N and K.</li>
            <li>You need some auxiliary data structure to efficiently
            determine whether a selected item has already been
            chosen.</li>
            <li>If the items are generated by some sequential process
            (reading in from a large file, repeatly calling a library
            function, or generated from some formula like the
            Fibonacci sequence), then you need to either store all N
            items in memory or use O(N) auxiliary memory.</li>
            <li>If K is very close to N, then you will need to
            generate O(Nlog N) random numbers on average.</li>
        </ul>
        <p>In this case, there are several practical alternatives,
        with some more applicable to certain situations than
        others.</p>
        <p><strong>Pick items to exclude</strong><br />
        If K is very close to N, then it is cheaper to pick N - K
        items to leave out that K items to put in. However, this does
        not overcome any of the other drawbacks.</p>
        <p><strong>Extend the permutation algorithm</strong><br />
        If the N items are already available in an array, we can take a
        random permutation of them, then take the first K of this
        permutation. In fact, our permutation algorithm generates the
        permutation one element at a time, so we only need to generate
        the first K of them. This gives an O(K) algorithm, although if
        we want to preserve the original order of the items then O(N)
        time and space is required.
        </p>
        <p><strong>Decide for each item</strong><br />
        If K is much smaller than N and we either need to preserve
        the original order of the N items or generate them
        sequentially, we may be able to afford O(N) time but not O(N)
        extra space. In this case we can iterate over the N items in
        turn, deciding for each whether it will be chosen or not. The
        naive approach might be to pick each item with probability K
        over N, but this would only give a total of K items <em>on
            average</em>. A small adjustment makes this idea
        work. Let's suppose there are M items still left to consider
        (including the current one), and we still need to pick L of
        them. Then they're all equally likely, so we pick the current
        item with probability L over M. The idea can fairly easily be
        extended to multiple events, as was the case in the marathon
        match (we needed obstacles, double-word and triple-word
        blocks).</p>
        <p>It is also possible to pick a random set of K items from N
        items when N isn't known in advance. In Scruffle, a word could
        be chosen multiple times from the dictionary, but imagine that
        this was not case. Then this allows us to simply pull a line
        at a time out of a dictionary, without doing a first pass to
        determine the size of the dictionary, or storing the whole
        dictionary in memory. We keep a list of K chosen items, which
        at every stage is a valid random sample of the words we have
        read so far. Let's say we had N-1 words loaded, and we now
        read an Nth one. With probability K/N, pick this word, and use
        it to replace one of the previously selected words chosen at
        random. Proving that every possible subset has equal
        probability is left as an exercise for the reader. Note that
        while the list of chosen items is not ordered, it is also not
        uniformly random. If you want the items in random order, you
        will need to randomly permute them as described above.</p>
        <p><strong>Which is right?</strong><br />
        In most cases, any of these algorithms will work. You can
        then consider things like implementation time, run-time
        performance (e.g., if you have to choose 5 items out of 1000
        many times, you don't want an O(N) algorithm), and which
        algorithm is most likely to generate a fixed number of random
        numbers (for example, K might be a tuning parameter, in which
        case you might prefer to generate N random numbers).</p>

        <p><span class="bodySubtitle">Conclusions</span><br />
        The example tests in a marathon match are seldom a
        representative sample, since very small cases are included to
        help people get started, as well as very large cases to test
        for boundary conditions. There are also seldom enough example
        cases to exercise all the subtleties of the problem, and the
        four-hour wait between full submissions makes it impractical
        for use during development. Being able to write a local test
        case generator is thus vital to success in a marathon
        match.</p>
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
