<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder</title>
<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
         <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="node" value="long_editorials"/>
         </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div class="bodyText" style="width: 100%; text-align: left;">

    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Match Editorials"/>
    </jsp:include>

<div style="float: right;" align="right"><A href="/longcontest/?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505967" message="Discuss this match" />
</div>

<span class="bodySubtitle">Intel&#174; Multi-Threading Competition 4</span><br>04.19.2006 - 05.03.2006
<br><br>

<img src="/i/m/Rustyoldman_big2.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="282718" /><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
 Thirty-nine coders tied for first place in the Intel&#174; Software Network
 Multi-Threading Competition Series Marathon Match #4 with perfect
 scores. Each receives $130.00 which is a little more than 1/39th of the total
 $5000.00
 prize pool. Congratulations to all.
Because of the large tie, no one walked away with a BIG cash prize, but to
look on the bright side, if the number of good solutions is a measure of
success, then this was easily the most successful marathon contest yet.
 The winners are listed here first sorted by time of first perfect submission
(<tc-webtag:handle coderId="7584274" />
 submitted the first correct solution), and second sorted by total runtime
(<tc-webtag:handle coderId="20262339" />'s code
 was the fastest averaging only slightly more than half a second per
 test case).

<br><br>
<div align="center">
<table cellpadding="3" cellspacing="0" border="0" class="bodyText"><tr><td>
<table cellpadding="3" cellspacing="0" border="1" class="bodyText">
<tr><td>Coder</td><td>submission<br>number</td><td>submission time</td></tr>



<tr><td>kirkifer</td><td>3</td><td>Thu Apr 20 16:23:18 EDT 2006</td></tr>
<tr><td>radeye</td><td>1</td><td>Thu Apr 20 19:07:32 EDT 2006</td></tr>
<tr><td>venco</td><td>2</td><td>Fri Apr 21 00:58:08 EDT 2006</td></tr>
<tr><td>indifferent</td><td>3</td><td>Fri Apr 21 03:39:18 EDT 2006</td></tr>
<tr><td>nowakpl</td><td>2</td><td>Fri Apr 21 06:05:16 EDT 2006</td></tr>
<tr><td>wolve</td><td>1</td><td>Fri Apr 21 17:34:38 EDT 2006</td></tr>
<tr><td>saintila</td><td>1</td><td>Fri Apr 21 18:18:39 EDT 2006</td></tr>
<tr><td>bmerry</td><td>5</td><td>Sat Apr 22 06:45:44 EDT 2006</td></tr>
<tr><td>roma</td><td>2</td><td>Sat Apr 22 17:10:19 EDT 2006</td></tr>
<tr><td>lucab</td><td>5</td><td>Sat Apr 22 20:07:59 EDT 2006</td></tr>
<tr><td>Macsy</td><td>5</td><td>Sun Apr 23 06:46:22 EDT 2006</td></tr>
<tr><td>Maris</td><td>1</td><td>Mon Apr 24 09:21:07 EDT 2006</td></tr>
<tr><td>Occam</td><td>2</td><td>Mon Apr 24 19:36:23 EDT 2006</td></tr>
<tr><td>tqfp</td><td>3</td><td>Mon Apr 24 21:21:27 EDT 2006</td></tr>
<tr><td>pepsiman</td><td>4</td><td>Tue Apr 25 05:11:27 EDT 2006</td></tr>
<tr><td>szd714</td><td>2</td><td>Tue Apr 25 07:42:47 EDT 2006</td></tr>
<tr><td>vdave</td><td>1</td><td>Tue Apr 25 15:38:14 EDT 2006</td></tr>
<tr><td>mongo63</td><td>4</td><td>Tue Apr 25 18:41:04 EDT 2006</td></tr>
<tr><td>singlethread</td><td>4</td><td>Wed Apr 26 01:29:16 EDT 2006</td></tr>
<tr><td>Iquadrat</td><td>10</td><td>Wed Apr 26 03:47:00 EDT 2006</td></tr>
<tr><td>yejun</td><td>9</td><td>Wed Apr 26 21:41:11 EDT 2006</td></tr>
<tr><td>aubergineanode</td><td>6</td><td>Thu Apr 27 08:25:43 EDT 2006</td></tr>
<tr><td>DjinnKahn</td><td>2</td><td>Thu Apr 27 10:57:11 EDT 2006</td></tr>
<tr><td>ozzee</td><td>4</td><td>Fri Apr 28 01:27:51 EDT 2006</td></tr>
<tr><td>aminallam</td><td>15</td><td>Fri Apr 28 12:09:55 EDT 2006</td></tr>
<tr><td>danielb</td><td>2</td><td>Fri Apr 28 12:56:44 EDT 2006</td></tr>
<tr><td>goldendf</td><td>5</td><td>Fri Apr 28 21:40:05 EDT 2006</td></tr>
<tr><td>kyky</td><td>13</td><td>Fri Apr 28 22:35:28 EDT 2006</td></tr>
<tr><td>YZF</td><td>12</td><td>Sat Apr 29 00:50:21 EDT 2006</td></tr>
<tr><td>nasr</td><td>5</td><td>Sat Apr 29 02:05:03 EDT 2006</td></tr>
<tr><td>owenlin</td><td>7</td><td>Sat Apr 29 05:34:54 EDT 2006</td></tr>
<tr><td>Viktor</td><td>8</td><td>Sat Apr 29 07:25:33 EDT 2006</td></tr>
<tr><td>Kawigi</td><td>15</td><td>Sun Apr 30 03:41:40 EDT 2006</td></tr>
<tr><td>Rustyoldman</td><td>7</td><td>Sun Apr 30 05:13:22 EDT 2006</td></tr>
<tr><td>Hephest</td><td>11</td><td>Sun Apr 30 10:33:29 EDT 2006</td></tr>
<tr><td>Codemage</td><td>6</td><td>Mon May 01 10:45:33 EDT 2006</td></tr>
<tr><td>ivanovva</td><td>9</td><td>Mon May 01 12:17:45 EDT 2006</td></tr>
<tr><td>aanbar</td><td>15</td><td>Mon May 01 14:44:20 EDT 2006</td></tr>
<tr><td>battyone</td><td>1</td><td>Wed May 03 02:06:32 EDT 2006</td></tr>
</table>
</td><td>
&nbsp;
</td><td>
<table cellpadding="3" cellspacing="0" border="1" class="bodyText">
<tr><td>Coder</td><td>total time<br>milliseconds</td><td>Language</td></tr>
<tr><td>owenlin</td><td>64691</td><td>C++</td></tr>
<tr><td>szd714</td><td>83889</td><td>C++</td></tr>
<tr><td>indifferent</td><td>91221</td><td>C++</td></tr>
<tr><td>goldendf</td><td>115831</td><td>C++</td></tr>
<tr><td>Occam</td><td>131147</td><td>C++</td></tr>
<tr><td>bmerry</td><td>152180</td><td>C++</td></tr>
<tr><td>kirkifer</td><td>154402</td><td>C++</td></tr>
<tr><td>vdave</td><td>159126</td><td>C++</td></tr>
<tr><td>roma</td><td>168241</td><td>C++</td></tr>
<tr><td>battyone</td><td>169693</td><td>C++</td></tr>
<tr><td>Macsy</td><td>176868</td><td>C++</td></tr>
<tr><td>Iquadrat</td><td>180815</td><td>C++</td></tr>
<tr><td>yejun</td><td>180951</td><td>C++</td></tr>
<tr><td>DjinnKahn</td><td>181904</td><td>C++</td></tr>
<tr><td>mongo63</td><td>212488</td><td>C++</td></tr>
<tr><td>Rustyoldman</td><td>218914</td><td>C++</td></tr>
<tr><td>lucab</td><td>236409</td><td>C++</td></tr>
<tr><td>radeye</td><td>245242</td><td>C++</td></tr>
<tr><td>pepsiman</td><td>250009</td><td>C++</td></tr>
<tr><td>wolve</td><td>255030</td><td>C++</td></tr>
<tr><td>venco</td><td>256554</td><td>C++</td></tr>
<tr><td>Maris</td><td>260384</td><td>C++</td></tr>
<tr><td>Hephest</td><td>262566</td><td>C++</td></tr>
<tr><td>Codemage</td><td>276426</td><td>C++</td></tr>
<tr><td>YZF</td><td>291584</td><td>C++</td></tr>
<tr><td>Viktor</td><td>314207</td><td>C++</td></tr>
<tr><td>kyky</td><td>314893</td><td>C++</td></tr>
<tr><td>tqfp</td><td>324899</td><td>C++</td></tr>
<tr><td>nasr</td><td>328720</td><td>C++</td></tr>
<tr><td>nowakpl</td><td>336539</td><td>C++</td></tr>
<tr><td>saintila</td><td>359473</td><td>C++</td></tr>
<tr><td>ozzee</td><td>365563</td><td>C++</td></tr>
<tr><td>Kawigi</td><td>371203</td><td>C++</td></tr>
<tr><td>aminallam</td><td>382574</td><td>C++</td></tr>
<tr><td>aubergineanode</td><td>411773</td><td>C++</td></tr>
<tr><td>danielb</td><td>436401</td><td>C++</td></tr>
<tr><td>ivanovva</td><td>523018</td><td>C++</td></tr>
<tr><td>singlethread</td><td>617451</td><td>C++</td></tr>
<tr><td>aanbar</td><td>1498432</td><td>C#</td></tr>
</table>
</td><tr></table>
</div>
<br><br>
The runtime number for <tc-webtag:handle coderId="20789611" />'s C# code is misleading,
because an alarm clock thread was used which slept for the entire 15 seconds
on each problem. So this is not indicative of the runtime performance
possible using C# on this problem.
</p>
<p>

 From my perspective as a contestant (and eventual co-winner) in this contest,
 there were two distinct  phases of the competition. I knew from experience
 with similar real world problems that the only reliable way to get exactly
 the right answer was to do O(n<sup>2</sup>) brute force comparisons. All
 faster techniques that I knew about were only approximations or only worked
 with specific distributions of points and/or queries. In the first phase of
 the contest, it seemed obvious that the problem size was too big
 for brute force and it was going to be a battle to see who could make the
 best approximation algorithm. Clearly that was the intent of the problem
 writer. That sounded like a very interesting contest to me. A quickly thrown
 together non-optimized example test of the brute force algorithm in plain
 C++ seemed to confirm brute force was out of the question for the big test
 cases, by about a factor of ten (wow! was I wrong!).

</p><p>

 The first few days went by. I saw that more and more people became tied for
 first place. Speculation in the forums (by people not tied for first) was that
 these solutions were optimal. It seemed unlikely that ten or more people would
 pick exactly the same approximate algorithm, run it with exactly the same
 parameters and produce exactly the same approximate results which just
 happened to be the best from all submissions. The only other choice I could
 consider was that all those first place submissions were indeed returning
 exactly the right answers, which meant that they had to be using brute
 force. So phase two started for me. I threw away the approximation code and
 started tuning the brute force code until it was fast enough. All these
 low-level shenanigans were somewhat distasteful to me compared to the battle
 of the sneaky high-level approximation algorithms, but I was highly motivated
 because I realized that this was probably my only real chance to finish in
 first place in one of these contests. I did have some experience doing
 this kind of high-performance tuning and knew that it was pretty satisfying to
 see your code run ten or one hundred times faster after a bunch of
 pointy hat tweekage.

</p>
<h3>The Curse of Dimensionality</h3>
<p>

 The multi-dimensional nearest neighbor problem in high dimensional spaces is a
 well known and difficult problem. There is an obvious linear time per query
 brute-force algorithm which works in any number of dimensions,  but there is
 no known solution that is faster and always gives the right answer for
 arbitrary distributions of points and queries when the
 dimensionality is high. The  problem of searching in high-dimensional spaces
 is plagued with what is known  as "the curse of dimensionality."
 Multi-dimensional techniques that work well in  low-dimensional spaces, such
 as two or three dimensions, fail spectacularly  (as if by magic curse) as the number
 of dimensions rises. At which dimensionality this occurs varies slightly
 depending on the application, but most consider eight or ten dimensions to be
 well out of the reach of fast search algorithms. Researchers I know working
 on this problem in the context  of massive astronomy databases consider four
 dimensions to be the limit of  fast searches, with five-dimensional and higher
 searches they just use brute force.

</p><p>

What makes it so hard? To quote the <em>Hitchhikers Guide</em>, "Space is
big. You just won't believe how vastly, hugely, mind-bogglingly big it is..."
High dimensional space is even bigger. You can fit a huge number of points into
small chunk of space without any of the points being very close to each other
and without many of the points being very far from each other either.
For example,
if a small three-dimensional refrigerator can hold 50 cans of
three-dimensional soda, a small fifty-dimensional refrigerator can easily hold
20000000000000000000000000000 cans of fifty-dimensional soda with plenty of
space left over for ice cream and
each can of soda is within easy reach. Life sounds sweet in fifty dimensions,
but remember it takes a really really really long time to clean that
refrigerator.
</p><p>

Fast multi-dimensional search methods usually work something like this:<br>
<br>
1) Divide up the data points into disjoint (or partly overlapping)
spatial regions (somehow, e.g. octree, BSP tree, hashtable, etc.)
as a preprocessing step.<br>
2) Determine which region contains the query point. If that region contains
any data points, compare each data point.<br>
3) Examine "nearby" regions which might contain closer data points, compare
all data points in those regions. Continue examining "nearby" regions until you
can prove that no unexamined region could possibly contain a point closer
than the best point found so far.<br>
<br>
If in step 1 you only generate spatial regions containing at least one
data point then you can stop after step 2 with an approximate answer.
This sort of approximate algorithm is quite fast, but the approximation
may not be very good. In fact it may not be any better than just trying
a handful of data points at random. Actually, this problem is so hard that
just trying a handful of
data points at random is a pretty good technique!
</p><p>
Assuming you need the best answer possible, you have to do step 3.
The problem is that most of the spatial regions
are so close together that
you will probably have to examine almost all the regions for almost every
query point. You usually end up examining almost all of the data points.
It is almost always faster to just to start out doing a brute force scan of all
the data points instead of paying for all the spatial subdivision overhead.

</p><p>
The intention in this contest was to size the problems larger than what
could be solved exactly by brute force methods with the given time constraints,
so that various approximate
methods would battle it out for who could get the best answer.
Unfortunately the
efficiency of brute force techniques was somewhat underestimated, as
coders got even the largest 50,000 by 50,000 50-dimensional case to run
well within
the 15 second time limit on the powerful eight-core Intel machine using
variations of simple brute force.</p>
<h3>How much force do we need?</h3>
<p>
The basic brute force algorithm is:
<pre>
for each query point, b[i]
  {
  best_d = infinity ;
  for each possible neighbor point, a[j]
     {
     d = 0 ;
     for each dimension, k
        d += (a[j][k]-b[i][k])*(a[j][k]-b[i][k])
     if  d < best_d
        {
        best_d = d ;
        answer[i] = j ;
        }
     }
  }
</pre>

 This is clearly
 O(|a||b|d) where d is the number of dimensions.
 The squared distance,
 sd<sub>ij</sub>=sum<sub>k</sub>(a[j][k]-b[i][k])<sup>2</sup>, most
 straightforwardly requires
 three operations per dimension, a subtraction, a square (multiplication) and
 an addition. This gives 50,000 x 50,000 x 50 x 3 operations or
 375,000,000,000
 operations for the largest test case. With 8&nbsp;cores and 15&nbsp;seconds
 this comes out to 3.125&nbsp;billion
 operations per second per core. This doesn't count additional instructions
 necessary for array indexing, looping, etc. but it gives us an idea that we
 are around the right order of magnitude for 3&nbsp;gigaHertz processors, at least
 as far as peak operation rate goes. (Assuming that on the average we can
 execute
 more than one
 operation per clock cycle really helps too.)
</p><p>

 The next issue is memory
 bandwidth. Memory bandwidth is almost always more of a bottleneck than
 raw operation rate.
 The a[i][k] and b[i][k] values are numbers with six digits of precision,
 0.000000 to 0.999999 (or 1.000000 I'm not sure). Although these look like
 floating point numbers in the problem specification, there was no overwhelming
 reason not use integers for all aspects of this problem. At full precision these
 numbers could
 be stored as 32-bit floats, 64-bit doubles, or 32-bit integers.
 Let's assume we use 32&nbsp;bits (or 4&nbsp;bytes) per dimension.
 The array, a, contains 50,000 x 50 x 4 = 10,000,000 bytes, which is too large
 to fit in any level of cache at one time.
 In the above code, each a[j][k] is accessed sequentially, used once, and
 forgotten. This happens 50,000 times, once for each b[i]. The b[i] values are
 usually in cache when needed so we will only count the a[i] memory bandwidth.
 This is 500&nbsp;gigabytes in 15&nbsp;seconds or 33&nbsp;gigabytes per
 second memory bandwidth. A PC2-5300 memory module (which is petty hot stuff)
 can transfer
 64&nbsp;bits at 667&nbsp;megaHertz for 5&nbsp;gigabytes per second.
 Assuming you have a dual channel memory architecture, that is
 10&nbsp;gigabytes per second. So it seems there is a bit of a problem here
with the most basic brute force organization, but tuning should solve the
problem.
</p>
<h4>Optimizations to the simple brute force code</h4>
<p>
All winning contestants optimized their code to some degree to meet
the runtime limits. Not all of the techniques listed below were used
all of the coders. That was not necessary. The combination of using
32-bit floats, striping, loop unrolling, instruction interleaving and
sixteen worker threads
was sufficient for <tc-webtag:handle coderId="20789611" />'s C# submission to succeed.
Almost everyone else used MMX or SSE instructions with eight threads.
The heavy use of SSE instructions probably saturated the arithmetic units
and cache of each processor core, leaving almost no possible performance
improvement for using hyperthreading. Having each thread process a
block of b[i]s is probably the best design. With that design there
is no synchronization
required while the threads are running as all shared memory is read-only
or write-only and only one thread writes it.
<p>
<h4>Striping</h4>
The first thing to do to address the memory bandwidth problem is called
striping. The golden rule in high performance cache architectures is:
<em>If you take the time to load some value from memory to cache, use it
several times (ten or more) while you have it in cache. Otherwise you spend
almost all your time waiting for cache misses
and very little time executing instructions.</em> Instead of going through all
the a[j] points sequentially for each b[i], divide the a[j] points
up into small blocks so that each block fits in cache (each block is
called a stripe). Then for each b[i]
compare only the points in the current block of a[j]s. Each a[j] will now
only be loaded from memory to cache once per thread. Each b[i] will be loaded from
memory to cache once per block of a[j]s, thus we have reduced the memory
bandwidth by a factor equal to the size of the a[j] blocks. A factor of 100
reduction in bandwidth is quite reasonable to expect for this problem.
Apparently every successful coder used this technique.
</p>
</p><h4>Fast loop exit</h4><p>
In the inner distance calculating loop, you have an estimate of the best
distance so far for this b[i]. If the distance you are currently calculating exceeds that
estimate before calculating all of the dimensions, then you can immediately
reject that a[j] point without finishing the distance calculation. This may or
may not be faster in the average case. It introduces additional comparisons
and jumps into the loop which may slow things down more than they speed
things up.
</p><h4>Loop unrolling</h4><p>
The inner loop of everyone's code was calculating the squared distance
between two points. Almost everyone unrolled this loop so that a higher
percentage of the instructions were doing actual useful calculations
instead of checking the loop termination. Compilers are pretty good at
putting in this particular optimization, so you normally wouldn't think
about it too much, but this contest is run with
most of the optimizations switched off.
</p><h4>Instruction interleaving</h4><p>
As mentioned above, the C++ compiler is run with most of the optimizations turned off, so
you can pretty much specify the order of the instructions that you want.
The straightforward way of writing the inner loop (unrolled by 4)
is something like:
<pre>
d += (a[j][k]-b[i][k])     * (a[j][k]-b[i][k])
d += (a[j][k+1]-b[i][k+1]) * (a[j][k+1]-b[i][k+1])
d += (a[j][k+2]-b[i][k+2]) * (a[j][k+2]-b[i][k+2])
d += (a[j][k+3]-b[i][k+3]) * (a[j][k+3]-b[i][k+3])
</pre>
The sequence of instructions (assuming the compiler recognizes
the common sub-expression) is probably something like:<br>
subtract<br>
wait for result to be available<br>
multiply<br>
wait for result to be available<br>
add<br>
subtract<br>
wait for result to be available<br>
multiply<br>
wait for result to be available<br>
add<br>
...<br>
<br>
Whereas if you sequence the instructions in an interleaved manner like this:
<pre>
t0 = a[j][k]-b[j][k]
t1 = a[j][k+1]-b[j][k+1]
t2 = a[j][k+2]-b[j][k+2]
t3 = a[j][k+3]-b[j][k+3]
t0 *= t0
t1 *= t1
t2 *= t2
t3 *= t3
t0 += t1
t2 += t3
d += t0+t2
</pre>
Then delays where instructions wait for the results of previous instructions
are greatly reduced. This technique can also be used with the SSE instructions.
</p><h4>Specialized machine instructions</h4><p>
We have three billion operations per second per core to perform. Instructions
with a high ratio of operations to clock cycles are quite helpful in meeting
this goal. Some useful instructions from the extended x86 architecture that
were used here included.<br><br>
multiply 4 32-bit floats by 4 32-bit floats giving 4 32-bit floats <br>
subtract 4 32-bit floats from 4 32-bit floats giving 4 32-bit floats <br>
add 4 32-bit floats to 4 32-bit floats giving 4 32-bit floats <br>
multiply 8 16-bit ints by 8 16-bit ints giving an intermediate 8 32-bit integers which are then pairwise added giving 4 32-bit ints <br>
subtract 8 16-bit ints by 8 16-bit ints giving 8 16-bit ints <br>
add 4 32-bit ints by 4 32-bit ints giving 4 32-bit ints <br>
<br>
Most coders used some of these specialized instructions to do all
the inner loop calculations. This was not strictly necessary to finish
in first place if you used enough of the other optimizations.
Use of these instructions alone was not sufficient to produce a
winning entry, as memory bandwidth still had to be reduced.
</p><h4>Memory alignment</h4><p>
The fancy MMX and SSE instructions work best on blocks of data that
are aligned to the natural sizes of the blocks, 16 bytes in the case
of the 128-bit SSE instructions. One can avoid having unaligned to
aligned memory transfers in the inner loop by carefully allocating
the global a[j] and b[i] arrays so all the blocks of each element
are already properly aligned. This can double the cache to processor
bandwidth.
</p><h4>Approximate distances using scaled inputs</h4>
Memory bandwidth can also be further reduced by scaling the coordinates
to fit in 16-bit integers. This reduces the memory bandwidth by a factor
of two, but introduces some loss of precision into the main calculation.
Some coders scaled the coordinates to various even smaller ranges such as
from 0-6500 and 0-9000 so that the maximum possible distance squared
(50*maxcoord<sup>2</sup>) would fit in a 32-bit integer (some used signed,
some unsigned). The 32-bit result was not accurate enough to always give
the right answer, but it was accurate enough to identify that 99.96%
of the points were too far away and could not possibly the closest. The
remaining 0.04% of the points could then be checked with higher precision
methods since there were so few of them. 16-bit input producing 32-bit
output was particularly attractive because there is an SSE instruction
that does 8 16-bit x 16-bit multiplies and then does 4 32-bit adds of
the results
giving 4 32-bit numbers as a result, all in one instruction. That is
almost the whole contest right there in that one instruction!
Most coders used 32-bit floats, only a few used 16-bit integers or
32-bit integers as their primary data structure. I think using 32-bit
floats was several bits short of always being able to get the
exact distance squared, but this apparently was not a problem
with any of the test cases.
</p><h4>Algebraic simplification</h4><p>
Most of the optimizations discussed so far do not reduce the number of
operations necessary the optimizations just allow the same operations
to execute faster (except fast loop exit can reduce the number of operations and
approximate distance calculation actually increases the number of operations
necessary). There is an algebraic transformation we can use that actually
reduces the number operations necessary in the inner loop by a factor of
2/3.</p>
<p>
The basic formulation of the distance calculation seems to indicate that
three operations per dimension are required, a subtraction,
then a multiplication, then an addition.<br>
d[i][j] = &Sigma;<sub>k</sub>(a[j][k]-b[i][k])<sup>2</sup><br>
but we can rewrite this as:<br>
d[i][j] = &Sigma;<sub>k</sub>(a[j][k]<sup>2</sup>-2a[j][k]b[i][k]+b[i][k]<sup>2</sup>)<br>
d[i][j] = &Sigma;<sub>k</sub>a[j][k]<sup>2</sup> - 2&Sigma;<sub>k</sub>a[j][k]b[i][k] + &Sigma;<sub>k</sub>b[i][k]<sup>2</sup><br>
Now we observe that we are trying to find the j that minimizes d[i][j] for
each i. We do not actually care what d[i][j] is, we just want the j that
minimizes it. And we notice that for a particular b[i] the last term,
&Sigma;<sub>k</sub>b[i][k]<sup>2</sup>,
 is a constant. Because it is a constant it does not affect which j
minimizes the expression, so it can be ignored. We then have:<br>
d'[i][j] = &Sigma;<sub>k</sub>a[j][k]<sup>2</sup> - 2&Sigma;<sub>k</sub>a[j][k]b[i][k] <br>
Now we can observe that the first term,
&Sigma;<sub>k</sub>a[j][k]<sup>2</sup>, does not depend on i. Therefore it
can be pre-calculated for each a[j] outside the main loop and stored. We then
have:<br>
<br>
d'[i][j] = pre[j] - 2&Sigma;<sub>k</sub>a[j][k]b[i][k] <br>
<br>
Now there is only one &Sigma;<sub>k</sub> left and it clearly can be
evaluated with only two operations per dimension, one multiply and one add.
Multiplying by 2 and subtracting from the pre-computed value happens outside
the main loop and is therefore insignificant.</p>
<tc-webtag:handle coderId="7504863" /> used this full algebraic simplification in an approximate
calculation using 16-bit integer input with the fancy 16->32 bit multiply/add SSE
instruction doing most of the work. This was my favorite of all the submissions.
<br><br>
   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<jsp:include page="../foot.jsp"/>
</body>
</html>