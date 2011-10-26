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
<tc-webtag:forumLink forumID="505902" message="Discuss this match" />
</div>

<span class="bodySubtitle">Intel&#174; Multi-Threading Competition 1</span><br>01.25.2006 - 02.15.2006
<br><br>

<img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
The first event in the Intel Multi-Threading Competition Series came to an exciting close last week
with a photo finish ending.  On Wednesday morning, it seemed almost
certain that haha would wind up walking away with the $2500.  His
submission had stood well above the pack for 4 days.  However, a
flurry of last minute submissions slowly whittled away at his score, and by
early afternoon a win seemed less certain.  bvs, submitting 7 hours before the
close of the contest put the first major chink in the armor, coming to within 0.03
points of haha.  From there it was clear that he could be beat, but it took
battyone, with a highly threaded solution to finally topple him and take home
the gold.
<br><br>

<div align="center"><img src="/i/longcontest/match_editorials/intel_mtcs_1/14.gif"/></div>

<br><br>

<span class="bodySubtitle">Overview of the Problem</span><br> In general,
routing problems are hard.  Numerous academic papers have been devoted
to the subject, and it is still an area of very active research.  This
particular problem was motivated by another hot topic: sensor networks.
Imagine that we have a bunch of small wireless devices, and the
devices need to simultaneously send large amounts of data between each
other.  Typically, however, routing is done in a decentralized fashion
and no single node knows the topography of the whole network.
However, if we imagine that the data being sent around is sufficiently
large, then it would make practical sense to plan centrally before
starting to send data.  Indeed, one could easily imagine situations
where the amount of data being routed was much larger than the size of
the routes.  With that motivation under our belts, lets look at the
problem in a little more detail.

<br><br>

The first thing to try to understand is the generation of the graphs.
In any graph, some nodes are going to be geometrically far away from
each other, and packets that go between them are likely to dominate
the maximum time required.  There will also be packets that go between nodes
that are close together, but those are less likely to cause problems.
Its reasonable to assume that we can route things that are close
together fairly easily, and focus more of our energy on the things
that are far apart and contribute to the maximum time.  This key fact
was the central intuition behind many of the clever optimizations and
tricks employed by the winners.

<br><br>

Another thing to notice is that in some cases there will be a
bottleneck which will dominate the time required to route all the
packets.  If there is some set of K edges, and N things must move
across one of those K edges, this will take at least N/K time steps.  So, if a set of
just a few bottleneck edges splits the graph roughly in half, the
situation is somewhat hopeless, and we shouldn't really try to
optimize very hard.
By noticing these sorts of situations, we can terminate early and use
less time, improving our score.  Also, in these situations, our
percent improvement is likely to be low, so we really want to be fast,
as time is a bigger relative factor in the score.

<br><br>

The final thing to notice is that the problem is almost certainly
NP-Hard.  If we take a graph, and make a copy of it for each time
step, then the problem of routing the packets becomes the problem of
finding disjoint paths in a graph.  This tells us that we shouldn't
try to bang our heads against the wall looking for some sort of
theoretically optimal solution -- its unlikely to be possible in
polynomial time.  Instead, its important to write code to generate
graphs so that one can test all sorts of clever heuristics against
graphs generated in the same way as the test cases.  Without a graph generator, you're
firing shots in the dark, and the time that it will take to test a new
idea goes up by orders of magnitude.

<br><br>

Now, its time to start coming up with ideas for good heuristics.  I've
already mentioned one obvious one: route packets with further to go
first.  But one will certainly need to be cleverer than that to win
$2500.  There are tons of different heuristics that one could try, and
I think that competitors really only scratched the surface in the
limited time window.  One thing that seemed to work well across the
board though was to start with a reasonable routing obtained in some
fairly simply way, and then try to improve that routing by selectively
rerouting certain parts of it.  So now, to the winner's
solution.

<br><br>

<span class="bodySubtitle"> battyone's Multi-Threaded Algorithm</span><br>
<img src="/i/m/battyone_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="7504863" context="algorithm"/><br>
<span class="smallText"><em>TopCoder Member</em></span>
<br><br><br>
My first submission was a greedy algorithm that, for each packet in
turn, found the fastest way that packet could reach its destination,
using classic breadth first search and keeping track of which edges were
already used at which times. By routing the packets further away from
their destinations first, I found one could achieve an average score
above 3000, which was a lot better than all the variants of the naive
solutions I had tried earlier. This makes sense if you consider that
nodes having different ranges, so in addition to 'highways' across the
network which only use the long-range nodes, there are a lot of 'back
roads' traveling through smaller-range nodes, and routing packets
along these increases network capacity tremendously. This relatively
simple algorithm scored 92%, which I found very encouraging.

<br><br>

The next thing I did was start multiple independent threads of the
above algorithm, with each thread processing packets in a different,
randomized order, and take the best result in the end. Also half of
the threads would try to solve the problem backwards (destination to
source) for more variety. I tried 8 and 16 threads and got a slightly
better score with 16, about 95%. Later I tested that 16 threads took
almost twice as long to run as 8, so as my algorithm became more
efficient I just stuck with 8 threads because I suspected 16 would
cost me more in time points than would benefit in quality
points.

<br><br>

My next step was to optimize the solutions in each thread, by taking
the packet that took the longest, and determining which other packets
were preventing that packet from arriving faster at its destination.
Then for each of these I removed the one in the way and tried to
reroute the long packet first before putting the one in the way back
in. It turned out that this worked often enough to improve the
solution quite a bit, and this submission gave me a cool 98% and was
briefly number 1, though haha countered the next day with a 99%
solution.

<br><br>

Next, I added more cooperation between threads where, instead of each
trying to optimize its own solution as long as it worked, it would try
to beat the currently leading thread. I realized that only the best
solution found by a thread mattered, and so it was OK to do more risky
manipulations in the other threads if some of the time a better solution
could be found, even if usually that risky optimization would result
in a far worse solution, as a worse solution wouldn't be used
anyway.  So, instead of only rerouting pairs of packets when that
resulted in a faster combined path, these non-leader threads also
forcefully rerouted packets before trying to reroute any displaced
packets later.  Also sometimes the threads would completely start
over, using a new random initial order. Sometimes, a better solution
could be found that way. Since, unlike my previous methods, these
retry cycles could possibly go on forever, I realized it was necessary
to set a time limit at which threads would stop trying, and just
return whatever was found. I set the time to whenever a locally
optimal solution was first found, plus a 50% margin, plus extra time
if running the naive algorithm found that a high quality was already
achieved, because with the scoring system time was only a small 
factor compared to quality squared when quality is high. For instance,
a 70% improvement means a score of 4900, while an extra 5 seconds to
achieve 71% gives 5041 for the improved solution, and only costs 50
for the extra time, a net gain. On the other hand, spending 5 seconds
to go from 10% to 11% only goes from 100 to 121, but still costs 50, a
net loss.  I also added a check when finding a locally optimal
solution to see if the most used edge in the solution 
would disconnect the graph if removed.  If it would, then I counted
the number of packets that need to cross the edge, in order to get a
lower bound on the optimal number of steps needed. It turned out that
for quite a few of the graphs I generated I was able to achieve this
lower bound, stop trying to improve, and save processing time. With
all these improvements, my solution scored much better on the tests I
generated than my previous submission so I thought I had a winner.
After a long day of suspense between the testing delays and compiler
problems, I was relieved to find out that my work had indeed paid
off.

<br><br>

I think using threads the way I did gave me an edge over haha
and bvs's solutions, simply because performing calculations on 8 cores
allows exploring many more possibilities and the resulting higher
quality solutions more than makes up for the slight time overhead of
thread management (this effect might have been more apparent had the
problem constraints been larger). Some elements that I consider
important, when using threads, are to confine synchronization and
locking between different threads to a small time frame and have the
threads work completely independently and take advantage of memory
caching the rest of the time.  It's also important to minimize
redundant work between threads by varying as much as possible the data
or algorithm each thread is working on.

<br><br>

<span class="bodySubtitle">haha's solution</span><br>
by <tc-webtag:handle coderId="159052" />
<br><br>
Unfortunately, haha was unable to provide a full writeup explaining
all the different heuristics he used.  This is too bad, since he
clearly had a very strong grasp of the problem, and I think we were
all a little surprised when he didn't end up winning.  One wonders if
perhaps a multithreaded version of his solution would have ended
up staying on top.  Anyhow, he was kind enough to provide a few notes pertaining to his
solution, and though I'm sure I won't do justice to what must be 
great bag of tricks, I'll try to hit the highlights.

<br><br>

The first step (and I think that this should have been everyone's
first step) for haha was to built a graph generator.  Along with code
to generate the graph, one of course needs to be able to run a
potential submission against the generated graphs.  Ideally, the graph
generator will not only generate the graphs, but will also test and
score them, making sure that the new code is actually an improvement
and hasn't introduced any bugs.  To this end, haha used a set of 500
graphs for his testing, and by sticking with the same 500 graphs for
all testing was really able to compare apples to apples, rather than
worrying too much about random effects (though of course those 500
might potentially be biased).

<br><br>

The first step in the solution that ended up almost winning was to
find a reasonably good initial routing.  Here, haha's approach was
somewhat different than battyone's.  Rather than routing packets all
the way from start to end one by one, haha routes all packets at once,
one time step at a time, the same way the naive algorithm described in
the problem does.  However, that algorithm isn't called naive for
nothing, and haha does it in a smarter way that clearly yields much
better results.  At each time step, the solution starts by generating
a list of packets for each edge.  This list of packets for an edge
contains all the packets that could get closer to their destination by
moving along that edge.  Once all these lists have been generated, the
edges are sorted by ascending order by list size.  Then, one edge at a
time, in order, a packet which hasn't moved yet but can get closer is
routed along the edge.  If there are multiple such packets (and there
often are) then the one with the furthest to go is given priority.
The intuition behind this approach is that if an edge can only get a
couple of packets closer to their destinations, then its important to
utilize that edge and move at least one of those packets along the
edge, otherwise we are wasting that resource (the edge).  While sorting by list
length is not necessarily an optimal way to do this (matching would do
it optimally) it is pretty good in practice, and its very fast.  Besides,
we're going to try to improve our initial routing anyway.

<br><br>

Naturally, since the score depends only on when the last packets gets to its
destination, the goal to improving a routing should be to improve the time for
the current longest packets.  The simplest way we might be able to improve our
solution is to simply reroute a packet that takes the longest, while leaving
all the other routes the same.  It's pretty likely that the routing method used
to generate the initial routing made some poor decisions about how to route
some of the packets.  Thus, in many cases a better path for a single packet can
easily be found.  Of course, after a while, there will be no more such simple
reroutings, so in order to get things to the end of the road faster, we need to
make some room.  To do this, haha followed the same approach as battyone:
select some other packet and delete it, then reroute the packet that took the
longest, and finally reroute the deleted packets.  If this leads to an
improvement, then we move on trying to make more such optimizations.  If it
makes things worse, then we reset the routing to the way it was.  If the
maximum time stays the same, no matter which other packet we delete, then it
still might be good to accept the new routing -- at least we aren't back where
we started.

<br><br> 

Finally, because of the execution time part of the score, we need to be able
to stop whenever we're not making progress.  To do this, haha used a
couple of different techniques to find lower bounds on the number of
steps.  The obvious one is longest path length: clearly we can't
finish faster than the time it takes for the packet which has furthest
to go.  The more complicated stopping criteria uses the concept of
bottlenecks.  The hard part is finding the set of edges which might be
a bottleneck.  haha took a very clever approach to this.  He noticed
that the packet which takes longest to get to its destination is
probably getting stuck because there is no way for it to cross some
set of bottleneck edges.  So, he asked: what nodes can this packet
reach before the last timestep.  Clearly it can't reach its target,
but given the geometric nature of the graphs, that means it probably
can't reach a large group of nodes.  From this, he defined the
bottleneck edges to be those which went between this group of nodes,
and the rest of the graph.  Using these edges, its easy to find a
lower bound on the number of steps, as described.  In this case, we
can terminate if we ever reach one of the lower bounds we've
found.  In fact, using this technique, haha was able to find an
optimal routing on 92% of the graphs he generated, which makes one
wonder if speed was what did him in.

<br><br>

<span class="bodySubtitle">Summary</span><br>
by <tc-webtag:handle coderId="159052" />
<br><br>
While two submissions is not a very big sample size, they are similar in a
surprising number of ways (and round table discussions suggest that many other
top submissions used similar approaches).  The hallmark of top submissions
seems to have been that they all started with an initial routing, and then
optimized one path at a time from there.  To my knowledge, no one came up with
a particularly brilliant way to optimize everything at once, in one pass.
Instead, it seems it was best to start simple, and then look for incremental
improvements.  The quality of the submission then is based on two factors: how good
the initial routing is and how good the rerouting is.  Of these two, I get the
impression that the rerouting is the really important part.  It's so hard to do
anything really good in the starting routing that it seems like the rerouting
must be the crux.  The other common element to these two submissions, which I
think many near winners were missing, was that they both contain relatively
sophisticated mechanisms to determine when to stop.  This allows both
submissions to keep working when it looks like that will help, but also to give
up when that seems like the best choice.

<br><br>

Finally, what would a good writeup be without some statistics.  First off,
there were five test cases where it seems that the naive solution was optimal
-- no solution received a positive score for those cases.  Of the rest, it may
be surprising to learn that of the top submissions, haha made the largest
improvement over the naive algorithm for 67 of the test cases, while bvs beat out
battyone and haha on 17 of them.  bvs and haha tied on two of the cases while
still beating battyone.  This leaves battyone with the largest improvement on only 9
cases.  However, for the cases that he didn't do best on, he was quite close,
while he did much better on a few of the ones that he did win.  Not only were
some of his gains large (on the order of 2%) but they tended to be on the cases
with larger improvement relative to the naive algorithm, where the square
kicked in and worked well for him -- those extra milliseconds working on those
cases seem to have paid off.

<br><br>

The next thing that may come as a surprise is that even though his
solution was multithreaded, battyone used more time on average.  Not
counting the cases where his score was 0, he spent an average of .75
seconds on each test case.  In contrast, haha spent less than half a
second, and bvs only spent a little more than half a second.  But, as
discussed, not all seconds are created equal.  Furthermore, haha's
solution despite its low average time has a much higher maximum time:
over 4 seconds.  Yet, even so, the times weren't different enough that
they made a big difference.  In fact, when we look at the raw scores
per test case, it turns out that the number of cases where battyone
beats haha and bvs goes down to 8, while haha continues to win 67, and
bvs goes up to winning on 18.  So, how in the heck did he win overall, if he
only did better on 8/100 test cases.  The answer is that on average, haha and bvs
did 6% worse on each of those 8 cases, which resulted in roughly 0.48 fewer
points overall.  On the other hand, battyone did on average only 0.4% worse on the rest
of the test cases, giving him a slightly higher score, even with this rough
approximation (which doesn't take into account the rest of the competitors).
Finally, it is quite interesting to note that of the 8 test cases (9, 11, 14,
20, 28, 45, 47, 53) battyone only received the very best score one one of them:
14 (the image in the beginning shows this test case).  This just goes to show
how strong the field was and what a wide variety there was among solutions.

<br><br>
For images of the rest of the test cases, download an SVG viewer, and navigate
to the following links:<br>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/1.svg">1</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/2.svg">2</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/3.svg">3</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/4.svg">4</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/5.svg">5</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/6.svg">6</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/7.svg">7</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/8.svg">8</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/9.svg">9</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/10.svg">10</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/11.svg">11</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/12.svg">12</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/13.svg">13</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/14.svg">14</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/15.svg">15</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/16.svg">16</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/17.svg">17</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/18.svg">18</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/19.svg">19</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/20.svg">20</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/21.svg">21</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/22.svg">22</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/23.svg">23</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/24.svg">24</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/25.svg">25</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/26.svg">26</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/27.svg">27</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/28.svg">28</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/29.svg">29</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/30.svg">30</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/31.svg">31</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/32.svg">32</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/33.svg">33</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/34.svg">34</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/35.svg">35</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/36.svg">36</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/37.svg">37</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/38.svg">38</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/39.svg">39</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/40.svg">40</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/41.svg">41</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/42.svg">42</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/43.svg">43</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/44.svg">44</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/45.svg">45</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/46.svg">46</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/47.svg">47</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/48.svg">48</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/49.svg">49</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/50.svg">50</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/51.svg">51</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/52.svg">52</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/53.svg">53</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/54.svg">54</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/55.svg">55</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/56.svg">56</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/57.svg">57</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/58.svg">58</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/59.svg">59</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/60.svg">60</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/61.svg">61</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/62.svg">62</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/63.svg">63</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/64.svg">64</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/65.svg">65</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/66.svg">66</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/67.svg">67</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/68.svg">68</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/69.svg">69</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/70.svg">70</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/71.svg">71</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/72.svg">72</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/73.svg">73</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/74.svg">74</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/75.svg">75</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/76.svg">76</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/77.svg">77</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/78.svg">78</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/79.svg">79</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/80.svg">80</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/81.svg">81</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/82.svg">82</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/83.svg">83</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/84.svg">84</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/85.svg">85</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/86.svg">86</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/87.svg">87</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/88.svg">88</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/89.svg">89</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/90.svg">90</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/91.svg">91</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/92.svg">92</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/93.svg">93</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/94.svg">94</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/95.svg">95</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/96.svg">96</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/97.svg">97</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/98.svg">98</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/99.svg">99</a>
<a href="/i/longcontest/match_editorials/intel_mtcs_1/100.svg">100</a>
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