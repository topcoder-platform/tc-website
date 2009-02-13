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
<tc-webtag:forumLink forumID="505951" message="Discuss this match" />
</div>

<span class="bodySubtitle">Intel&#174; Multi-Threading Competition 3</span><br>03.22.2006 - 04.06.2006
<br><br>

<img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="159052" /><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
The most recent competition in the Intel&#174; Software Network Multi-Threading Competition Series had a rather different flavor from previous
events.  In this contest, the each test case had one correct answer and the
goal was to find that answer as quickly as possible.  Furthermore, each test
case consisted of exactly 16 searches, an obvious candidate for threading.
As in previous contests, the ending proved to be extremely exciting (or
nerve wracking depending on your perspective) and the top few places were
extremely close.  The contest also provided a particularly rich learning
experience for many as not only did threads give a huge improvement, but MMX
and SSE instructions provided significant speedups, and a number of
competitors went so far as to inline assembly code in their programs'
hotspots.
<br><br>
In the end though, the low-level hacking was not enough to catch a superior
algorithm with good threading, and Saintila's solution based on signal
processing ideas and a job queue threading model proved a bit too fast for
simpler approaches made lightning fast through tremendous optimizations.
<br><br>
<span class="bigTitle">String matching as signal processing</span><br>
By&#160;<tc-webtag:handle coderId="15500323" /><br>
<strong>First place winner</strong>
<br><br>
Sometimes in programming competitions, the problem presented may seem 
a bit contrived, and you may feel the required algorithms are of little 
practical use outside the world of pure computer science. But often 
this is only a flawed first impression, and once you start working on 
the problem, you recognize the various related real-world applications.
<br><br>
In this particular case, however, I almost immediately saw that I could 
approach this as a very practical signal processing problem. While the 
actual details are probably quite different, a nice example of a similar 
application would be the 
<a target="_blank" href="/?t=sponsor&c=link&link=http://gps.losangeles.af.mil/jpo/gpsoverview.htm">
Global Positioning System</a> (GPS). The GPS satellites transmit a 
known pseudo-random sequence (<b>S</b>). When this signal reaches the 
GPS receiver, the sequence (<b>u</b>) has been both corrupted by noise 
and delayed by some amount of time. The receiver tries to match the 
received <b>u</b> with the known <b>S</b> to determine the transit 
time of the signal (and consequently the distance between the satellite 
and the GPS user).
<br><br>
With this background, I started thinking about my solution. I know 
there are relatively efficient algorithms for solving cross-correlation 
problems using FFT. I opened my DSP textbook &#8211; and closed it after a 
couple of minutes. I wanted an algorithm I would be able to understand 
myself.
<br><br>
Like most other competitors, I also realized that instead of the 
brute-force method that sums the distance of all 100&nbsp;k characters 
of <b>u</b>, it would be sufficient to use a significantly smaller part 
of the substring. Regardless of this observation, I still wanted to make 
my solution look beyond single characters and try to see the &quot;big picture&quot;.
<br><br>
I decided to transform the long strings of characters into much shorter 
sequences of values that could be then matched against each other. With 
some luck I might be able to find a match using only 2&nbsp;k x 100 = 
200&nbsp;k operations instead of the 2&nbsp;M x 100&nbsp;k = 200&nbsp;G 
operations required by an algorithm that operates on single characters.
<br><br>
<div align="center"><img src="/i/longcontest/match_editorials/intel_mtcs_3/letters9.gif" alt="" /></div>
<br><br>
I processed a block of characters into a single value simply by adding 
their values together. Because the problem statement defines the 
alphabet as circular, it is probably not a good idea to use simple 
integer values for letters. Instead, I translated the alphabet into 
complex values:
<br><br>
<div align="center"><img src="/i/longcontest/match_editorials/intel_mtcs_3/expi.gif" alt=""/>(0 &lt;= x &lt; letters)</div>
<br><br>
Now that I had relatively short sequences of complex values, I used 
<a target="_blank" href="/?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/Cross-correlation">
cross-correlation</a> to quickly find good candidates for a match. While 
this method puts us in the ballpark, we still have to hit the ball. So 
the final part of my algorithm falls back to the character-level search 
to pinpoint the exact index within the range suggested by the high-level 
search.
<br><br>
An efficient character-level search has to know how many characters we 
need to process before deciding (with some certainty) that we don&#8217;t have 
a match, and should move on to processing the next index. The 
statistical analysis needed for this was probably perfected by some of 
my fellow competitors. Fortunately, this part of my solution did not 
have to be that good, because most of the time my algorithm had a pretty 
good idea where to start looking!
<br><br>
Still, both in my local testing and in the 60 official test cases, 
there were a couple of difficult cases that made my high-level search 
fail, and the character-level search had to work very hard to find the 
match. Looking at how close the top-5 scores were, I guess I have to 
consider myself lucky. One more of those difficult cases would have 
been enough to drop me to 4th or 5th place.
<br><br>
It is worth noting that in previous competitions you could do very well 
(win, in fact) without using multi-threading at all. Not this time. When 
the problem statement asks you to perform the same operation to 16 
different inputs on a multi-processor machine, that's a pretty strong 
suggestion to start learning multi-threaded programming even if you 
have not done it before.
<br><br>
The obvious approach then is to start 16 threads, assign one substring 
to each thread and simply wait for them to finish their work. Doing 
this is very easy - it works just fine - and in most cases you get a 
big performance boost compared to a single-threaded program.
<br><br>
But when looking for optimal performance, there is a problem. The 16 
substrings vary in length and probably more importantly have 
different levels of noise added to them. Returning the correct answer 
for difficult cases takes more time. Consequently you may end up with 
15 threads finishing their work quickly and then waiting 20 seconds for 
the unfortunate thread that got the difficult substring.
<br><br>
Organizing your program in a way that enables different threads to work 
simultaneously on the same substring is clearly much more difficult 
than using the simpler approach of one thread for each <b>u</b>. However, there
is obvious benefit to having multiple threads work on the same element of
<b>u</b> -- all processors can be kept busy during the entire execution.  To
this end, I used a job queue model where 8 threads took and put jobs to a global
job queue.  This way, all 8 threads were running at 100% most of the time.  
<br><br>

<span class="bigTitle">Low level hacking with ASM and SSE</span><br>
By&#160;<tc-webtag:handle coderId="7472513" /><br>
<strong>Runner-up</strong>
<br><br>
The very first realization that probably everyone in this contest came to was
that the exact solution (thus calculating the sum of squares of circular
differences for all possible locations) will never finish within the given time
limits.  Next, I tried to check if some incremental (Dynamic Programming)
solution existed.  Since the search strings' (<b>u[i]</b>) characters'
distribution is (ideally) uniform and independent, I'm pretty sure, there is no
such solution that could use the (partial) result for a given location to
calculate the result for the next location. (Actually, the way <b>u[i]</b>'s
are produced is the process of perfect encryption: If you add same level noise
to a signal, you will get noise again and you will never be able to reconstruct
the signal unless you can reconstruct the original noise exactly.)<br><br>

Thinking abstractly, if one wants to finish within time then the solution
should look like calculating some partial property of a location and deciding
if this is the location we are looking for or not. The tradeoff is between
speed and accuracy: The surer you want to tell if it is the right location the
more accurate you have to calculate the chosen partial property. When
implementing this method, you have several options:

<ul><li>You can have threshold values that decide if a location is almost
    surely bad or good, or if more samples are required to calculate
    whether it is bad or good.</li>

<li>Given some initial accuracy, you can calculate the property for all
locations, then check only the <b>n</b> best ones.</li></ul>

In my solution, I chose threshold values and the very first property I
calculated was the actual expression that should be minimized: the sum of
squares of circular differences for the first <b>n</b> characters. I picked
cutoff values based on simulating several millions of matches using different
<b>n</b>'s.<br><br>

Early results showed the right location is the location where <b>u[i]</b>'s
derive from unless the count of letters is low and the length of <b>u[i]</b> is
small (&lt;5000). (After taking a look at the tests, I probably paid too much
attention to this case since hardly any testcase included an <b>u[i]</b>
shorter than 10,000 characters, but I didn't want to risk the 100s penalty for
missing a better fit than the original location.)<br><br>

After this realization, I examined the statistical properties of how
<b>u[i]</b>'s were generated. It turned out that the expected average sum of a
random matching was much higher than the average sum when matching the original
location of <b>u[i]</b>. So I calculated the expected values for both cases
(random and original), taking always the worst case <b>k</b> for a given letter
count. (By worse I mean that the difference between a random and the original
matching is the lowest, thus giving the worst separation.)<br><br>

My solution using these considerations ranked number three so I was pretty
happy, however, that was still only the beginning of the contest.<br><br>

There were two possibilities for how I could speed up the solution:

<ul><li>Set thresholds to be stricter while risking accuracy. I decided to take
    this approach only towards the end of the contest when no other choice was
    left for me. (On a side note: Threshold values could be asymmetric in a
    sense: If they reject the correct location, the effect will be fatal.
    However, if they pass through bad locations, it's just a speed problem
    because calculating the sum further will reject them at a later stage. So
    threshold value selection needed to be tuned for never rejecting the right
    location.)</li>

<li>Speed up the calculation itself.  I took this approach. I used lookup
tables for squares, unrolled loops (tried several ways), and could make it more
than twice as fast but even that version ranked only at number 15 at that
time.</li></ul>

That was the point I began to look for assembly optimizations, namely using
some MMX/SSE code. All my efforts were in vain: lookup tables remained faster
because it took too many instructions to calculate the circular
difference.<br><br>

So
I had to find another property that could be calculated effectively using MMX.
(I really admire <b>Iquadrat</b> for <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>?module=Message&amp;messageID=536519">finding the simple sum</a> of absolute(!) difference for
which an MMX instruction exists.)<br><br>

Once
again, checking the way <b>u[i]</b>'s were generated, I noticed what many other
contestants also did: there is a heavy skew towards zero offsets, thus it's
enough to count the number of same characters in the two strings. Fortunately,
I could code this into three MMX instructions (movq, pcmpeqb, paddb). <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>?module=Message&amp;messageID=536416">The trick was</a> to simply add the results of pcmpeqb's
together. This instruction sets all bits to 1's for all matching bytes, which
is -1 in two's complement code. If the loop is short enough not to underflow,
then it's ok to negate the result only after the loop.<br><br>

Once
again, I calculated expected values for setting the threshold values, and this
time I tried to make them a bit stricter and fall back to the old version in
the case of a miss. I did some necessary memory aligning (MMX requires 8 bytes
alignment) for one of the operands. I was able to reach rank 2, then after some
minor tuning could jump to rank 1 (from rank 3 at that time), and just one day
was left before the deadline...<br><br>

That
final day was really nerve breaking for me (and for everyone else, I think).
Probably, many contestants tried to tune the thresholds so that they have to
calculate less but still do not miss a testcase. My problem was I often
couldn't tell if a submission of mine was worse or better than the previous one
if I had stayed on the same spot. (Results revealed they preformed worse but
not worse enough to fall back a spot. They always performed better on the
examples, though.)<br><br>

My final tunings included:
Perfect memory alignment of all operands (for both the fast and the fallback
code); enlarging lookup tables for fallback code to calculate multiple results
in a single step (virtually SIMDing it, <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>?module=Message&amp;messageID=536484">an approach <b>roma</b></a> has taken to the extreme!); more
unrolling. Every step brought some 10-15% improvement on the examples but may
have produced more fallbacks in the real tests. Of course, last second
submission potentially risked my rank 5 then but I was lucky (<b><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>?module=Message&amp;messageID=536528">unlike lquadrat</a></b>)
and could grab the runner-up position.<br><br>

Finally some thoughts about multithreading I had to consider:

<ul><li>8 or 16 threads: 8 threads performed better for me. Most likely the MMX
    and/or the memory load execution unit was almost fully loaded so there was
    no playing field for <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>?module=Message&amp;messageID=536525">hyperthreading</a>.</li>

<li>How to multithread: Because my
solution used early termination, if it found the right location, I assigned
every <b>u[i]</b> to a single thread. (In this case, half of <b>S</b> had to be
scanned on average. If <b>u[i]</b> had been split up between threads, only one
could have terminated early, thus 93.75% of <b>S</b> should have been scanned.)
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