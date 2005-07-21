<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>TCCC05 Online Round 3 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#FFFFFF">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr valign="top">
                    <td class="bodyText" width="100%">

<!--body contextual links-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle">
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC05 Online Round 3 Problem Set</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">January 26, 2005</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
Round 3 proved to be leaps and bounds harder than round 2.  Only 3 coders
submitted the easy problems in the first 10 minutes.  In fact, it was so hard
that tomek had to resubmit the easy problem once, and the medium problem twice.
reid, a regular at most onsite events didn't make it past the first problem
during the coding phase.  After an agonizing 75 minutes, however, 90 coders had
scraped together solutions for the easy, while 62 had solutions for the
medium.<br/><br/>
However, about two thirds of all the submissions couldn't make it past the 
system tests, and no one was able to solve all three problems successfully.
Im2Good ended up with the highest score, based solely on his submission for the
hard problem.  Eryx was closest to solving all three, but his medium was
challenged, and he ended up in second.  In third place, John Dethridge had the
highest score from the first two problems.<br/><br/>
tomek, the defending champ, had a good showing, taking a respectable
8<sup>th</sup> place.  reid the third highest rated coder in the round, was the
only target not to advance, but was in good company as antimatter, m00tz,
pparys, and a slew of other red coders didn't make the cut.  From the other end
of the spectrum, kindloaf was the lowest rated coder to advance, while dexy was
the coder who advanced with the worst odds (9.07% according to radeye).  One
final noteworthy event was that this was the first time the tiebreaker rules
were applied to determine advancers, as there was a 6-way tie for
46<sup>th</sup> place - with 50 points.<br/><br/>
I guess that the lesson from this round, if one was inclined to take one, was that when the
problems are hard, it's often worth a bit of extra time to make sure you get them
right.  With harder problems, correct solutions are more important that fast
solutions.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3483&amp;rd=6530" name="3483">AutoAdjust</a></b>
</font>
<A href="Javascript:openProblemRating(3483)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      250
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      90 / 97 (92.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      30 / 90 (33.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>misof</b> for 214.37 points (11 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      162.54 (for 30 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>


The algorithm for adjusting the brightness and contrast of a particular image
boiled down to a fairly simple formula:
<pre>
    newColor = (oldColor - 63.5 + brightness) * contrast / 100 + 63.5
</pre>
The idea is that you are first adjusting the brightness, and then pushing the
color values away from grey so that there ends up being more of a difference
between the different colors (or shades of grey) in the image.  This problem
asks you to find values for the brightness and constrast that cause the darkest
colors to be black, and the brightest colors to be white.  The idea here is that
you want to use the full range of available colors, but not lose any details by
adjusting the contrast too much.  <br/><br/>

If you understand what adjusting the brightness and contrast is doing, it should
be clear that the brightest pixels will remain the brightest pixels after making
the adjustment, and that the darkest pixels will also remain the same.  So, to
find the values of the brightness and contrast that provide the adjustment you
need, you only need to know the color of the brightest pixel, and the color of
the darkest pixel.  From here, you could determine the values of brightness and
contrast by solving a system of two equations with two unknowns:

<pre>
    (darkest - 63.5 + brightness) * contrast / 100 + 63.5 = 32
    (brightest - 63.5 + brightness) * contrast / 100 + 63.5 = 95
</pre>

Rather than doing the algebra, the symmetry of the problem dictates
that the brightness should be selected so that after adjusting the brightness,
the darkest and brightest color values are equidistant from 63.5.  Once you know
the brightness, its easy to figure out the constrast:
<pre>
    brightness = 63.5 - (darkest + brightest) / 2
    contrast = (32 - 63.5) * 100 / (darkest - 63.5 + brightness)
</pre>
One difficulty with this is that solving these equations will not necessarily
give you integers for brightness and contrast.  Additionally, while a contrast
of 200, for example, might be the value needed to give 32 and 95, a contrast of
199 might give 32.4 and 94.6, which then round to 32 and 95.  The problem
statement indicates that, in this case, you should use the smaller contrast
- 199.  While you can work around all of these issues with a bit of
cleverness, it's a lot harder than the problem needs to be.  <br/><br/>

Instead of doing all this math, most coders noticed that the brightness only
ranges from -100 to 100, and the contrast only ranges from 100 to 20,000, which
means that there are only about 4,000,000 different combinations, few enough to
just try them all, and see which ones have the desired properties.  In fact,
there is no reason to use a brightness less than -31 or greater than 31, or a
contrast greater than 6201.  So, we can simply iterate over all contrasts,
starting at 100, and for each contrast iterate over all brightnesses.  By
designing our loops properly, we can assure that we find the smallest contrast
that works first, and with that the smallest absolute brightness.  Then all that
remains is to adjust each pixel in the image, and return the result.  </p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3481&amp;rd=6530" name="3481">PackageShipping</a></b>
</font>
<A href="Javascript:openProblemRating(3481)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      500
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      62 / 97 (63.92%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      23 / 62 (37.10%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>overwise</b> for 328.52 points (23 mins 15 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      240.35 (for 23 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

There are a couple of very different ways to approach this problem.  One way
requires dynamic programming or memoization, coupled with a breadth first
search, or something similar.  The second is simple brute force.  I'm going to
start with the harder solution, which scales quite a bit better, and come back
to the brute force approach at the end.

As in any dynamic programming problem, the question you should ask is, what are
my states?  In this case, a state is a combination of a location, a time, and a
cost.  For each such triple, you want to find the route to that state that has
the minimum probability of damaging the package.  To compute this minimum, you
should perform a breadth first search.  Starting at the start
state, you should calculate all states that are reachable from the start state
- these correspond to the various routes leaving the start location.
Given the probability, p, corresponding to a particular <tt>(location, cost, time)</tt>
and a route to <tt>(location -&gt; destination, route_cost, route_time, probability)</tt>, you can then
reach the state <tt>(destination, cost+route_cost, time+route_time)</tt> with a damage
probability of <tt>1 - (1-p) * (1-probability)</tt>.  So, if this probability is
better than the current probability for that state (all states are initialized
to 1), then update the probability for that state and add the state to a list
of states that still need to be processed.  To make this really fast, you should
use a priority queue so that you process the states in the queue with the better
probabilities earlier.  As in Dijkstra's shortest path algorithm, this will 
guarantee that you never look at a state more than once.
However, in this problem, that was not necessary, and a simple first in first
out queue was sufficient.  
<pre>
  queue q
  map&lt;state -&gt; probability&gt; best
  start = state(origin,0,0,0) 
  insert start into q
  best(start) = 0
  while(q is not empty)
    s = q.remove_first()
    if(s.prob != best(s)) continue<font color="blue">//this helps to avoid doing extra work</font>
    foreach (route r with r.origin = s.location)
      state next(r.destination, s.cost + r.cost, s.time + r.time, 1-(1-s.prob)*(1-r.prob))
      if(next.time &#8804; MAX_TIME and next.prob &lt; best(s))
        insert next into q
      end
    end
  end
</pre>
Once you have the best probabilities for all of the states, you should consider
each state that is at the destination, and compute the expected cost to reach
that state: the cost of the state plus the package cost times the probability of
damaging the package.  Once you find the minimum, simply return that
value.  There are a couple of caveats to this problem.  One thing to watch for
is that you don't run out of memory, depending on your implementation details.
If you remove routes that you know you won't use, it can help you for some
pathological cases.<br/><br/>
Now, for the promised brute force solution.  Since there are only 50 routes,
there are not that many different paths from the origin to the destination.  It
seems like there could be a lot, and in fact there are an exponential number of
them, but with only 50 routes there are few enough paths that you can consider them
all - so long as you don't go around in circles.  So, the basic algorithm
is a quite simple recursive function:
<pre>
  map&lt;location -&gt; bool&gt; visited
  best = INFINITY
  recurse(location, cost, time, prob)
    if(location == FINAL_DESTINATION)
      total = cost + prob * PACKAGE_COST
      if(total &lt; best)
        best = total
      end
      return
    end
    foreach (route r with r.origin = location)
      if(!visited(r.destination) and time + r.time &#8804; MAX_TIME)
        visited(r.destination) = true
        recurse(r.destination, cost+r.cost,time+r.time,1-(1-prob)*(1-r.prob))
        visited(r.destination) = false
      end
    end
  end
</pre>
Surprisingly, the most recursive calls you will need to make with this algorithm
is comfortably under a million, and in Java it runs in under a second on all
inputs.  However, the runtime is at least as bad as O(&#966;<sup>N/2</sup>), where N is
the number of routes, and &#966; is the golden ratio.  There are also certainly
cases that have a worse runtime, but their runtimes are harder to evaluate, and
I'm not sure what the worst case is.  I'd be interested to see how bad a case
someone can construct with 50 edges.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3441&amp;rd=6530" name="3441">DFAReversal</a></b>
</font>
<A href="Javascript:openProblemRating(3441)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1000
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      3 / 97 (3.09%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      2 / 3 (66.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Im2Good</b> for 895.25 points (9 mins 57 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      728.81 (for 2 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>


First, a bit of background for this problem.  There are two different kinds of
finite automata - deterministic and non-deterministic.  The determinisitc ones
are described in the problem statement, and for every state there is exactly one
outgoing edge corresponding to each symbol in the alphabet.  In a
non-deterministic finite automata, this is not the case.  A state may have
multiple outgoing edges corresponding to the same symbol, or 0 outgoing edges
for a symbol.  In the case of multiple edges, when we reach a state, we can
follow any one of the edges corresponding to the next symbol in the input
sequence.  If there are no outgoing edges, then the sequence is rejected.  The
NFA accepts a sequence if and only if there is some way to choose which edge to
follow at each point where a decision must be made such that it ends up in an
accept state.  For example, consider an NFA with a single symbol in its
alphabet, with states 0 and 1, and with two edges - one from 0 to 0 and
another from 0 to 1.  If the start state is 0, and 1 is an accept state then this
NFA will accept any sequence of 1 or more symbols.  So long as we choose to
follow the loop edge from 0 to 0 for every symbol except the last, we will end
up in state 1 at the end - an accept state.<br/><br/>

If we had followed the wrong edge at any point, we would not have ended up in an
accept state.  However, by definition the NFA accepts the input as long as there
is some way to choose which edges to follow that lead to acceptance.  The
problem, it might seem, is that if you have to consider all possible paths, the
time it takes to determine whether a sequence is accepted or not would be
painfully long.  However, a bit of dynamic programming can help us out here.
Rather than considering all paths, we can keep track of the set of states
that we could be in after some sequence of symbols.  For example, if the start
state is 0, then after 0 symbols, our set is {0} - we can only be in
one state at the start of execution.  If, there are edges from
state 0 to states 0, 1 and 3 corresponding to the first symbol in a sequence,
then after the first symbol in the sequence, we could be in any of those three
states, which we represent as the set {0,1,3}.  Now, lets say that there are
edges from state 1 to state 2 and from state 3 to state 4 corresponding to the
next symbol in the input.  That would mean that from the states {0,1,3} we could
reach states {2,4}, so after two symbols, considering all possible paths, we
could be in either state 2 or state 4.  In general, we are keeping track of
the set of states that we could be in after the first K symbols.  To compute
the set for the first K+1 symbols, we need only see which states are
reachable on symbol K+1 from one of the states reachable after the first K
symbols.  This is the basis of any regular expression matcher.  The regular expression
is typically converted to an NFA, and then the input sequence is evaluated using
sets of states as described here.
<pre>
    <font color="blue">//Code to compute whether a sequence is accepted by an NFA</font>
    current = {start}
    for(K = 1 to length(sequence))
        s = sequence[K]
        next = &#8709;
        foreach (state u &#8712; current)
            foreach (edge (u,v) corresponding to s)
                next = next &#8746; {v}
            end
        end
        current = next
    end
    if(current &#8745; accept &#8800; &#8709;)
        return true
    else
        return false
</pre>
This suggests an algorithm to convert an NFA into a DFA.  First, create a new
DFA where each state in the DFA corresponds to a set of states in the NFA.
Then, for each set of states, U, and each symbol, s, compute the set of states,
V, that are reachable from a state in U on s, and add an edge from U to V on s.
The start state in the DFA is {start}, and each state U in the DFA where 
<tt>U &#8745; accept &#8800; &#8709;</tt> is an accept state.  Unfortunately, there are
2<sup>N</sup> states in this DFA, where N is the number of states in the NFA, but this is
the best we can do in some cases.  The reason this works is that traversing the states in the
constructed DFA is exactly the same as traversing sets of states in the NFA, as
described above.<br/><br/>
Now, back to the problem (finally!).  You are given a DFA, M, and want to find a
DFA, M', that accepts the reverse of each sequence accepted by M.  The simplest
way to do this is simply to reverse all the edges in M.  This gives you an NFA.
You then set your start state to the set of all accept states in M (we're going
to be converting the NFA to a DFA later, so its ok to have multiple start states
for now).  The accept state in the NFA is identical to the start state in M.
If a sequence is accepted by M, then there is a path from the start state in M
to one of the accept states.  Therefore, with all the edges reversed, there is a
path from one of the accept states in M back to the start state in M on a sequence
s if and only if there was a path from the start state in M to an accept state
on reverse(s).<br/><br/>

Now, from the NFA, we can construct a new DFA, using the
subset construction described.  The only problem is that we need to generate
a minimal DFA - one with as few states as possible.  It turns out that
there is a very simple way to do that in this case.  Starting from the start
state in the reversed DFA (which is the set of all accept states in the input)
do a simple depth first search, to find all the sets of states in the reversed
DFA that are reachable from the start state.   Clearly, if a state is not
reachable from the start state, it can be removed, but proving that this DFA is
minimal requires a bit more insight.  The first step in this proof is to note
that any DFA can be made minimal by first finding all pairs of states such that
for every sequence s, the outcome (accept or reject) will be the same regardless
of which of the two states you start from.  Any such pair of states can be
merged into a single state, while any pair of states for which this is not true
may not be merged.<br/><br/>

Now, consider two sets of states in the input DFA (M), u and v,
representing states in the reversed DFA (M').  u and v can be merged in M' if
and only if every sequence in M' has the same outcome (accept or reject) when
leaving either u or v.  What this means in relation to M is that for every
sequence s, there is a path backwards from one of the states in u and also
backwards from one of the states in v that goes to the start state in M.  However,
if there is a path backwards from state x &#8712; u to the start state on s, that
means that M goes from the start state to x on rev(s), as it is deterministic.
Therefore, it must be true that x &#8712; v also, since there must be a path
backwards from a state in v to the start state on s.  This leads to the conclusion
that u and v must in fact be the same (assuming all states in M are reachable).  <br/><br/>

At long last, we can implement an algorithm to solve the problem, which turns
out to be quite simple:
<pre>
    map&lt;state -&gt; bool&gt; visited
    dfs(DFA M, state cur)
        if(visited(cur))return 0;
        visited(cur) = 0
        ret = 1
        foreach (symbol s)
            state next = &#8709;
            foreach (u &#8712; cur)
                foreach (edge (u,v) corresponding to s)
                    next = next &#8746; {v}
                end
            end
            ret = ret + dfs(M,next)
        end
        return ret
    end
    reverse(DFA M)
        start = M.accept
        return dfs(M,start)
    end
</pre>
As an implementation detail, the state can best be implemented as a bitmask, in
which case <tt>visited</tt> can be a simple array.  The solution can be under 25 lines long, without doing anything too clever.
</p>

                        <p>
                        <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                        </p>
                    </td>
                </tr>
            </table>

            <p><br /></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

    </xsl:template>
</xsl:stylesheet>
