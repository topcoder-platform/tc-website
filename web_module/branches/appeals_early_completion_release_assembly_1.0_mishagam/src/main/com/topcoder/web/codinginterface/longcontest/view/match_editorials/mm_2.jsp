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
<tc-webtag:forumLink forumID="506052" message="Discuss this match" />
</div>

<span class="bodySubtitle">Marathon Match 2</span><br>06.07.2006 - 06.14.2006
<br><br>

by <tc-webtag:handle coderId="159052" /><br>and <tc-webtag:handle coderId="274023" /><br>
<span class="smallText"><em>TopCoder Members</em></span>

<br><br><br>
<span class="bodySubtitle"><A href="/longcontest/?module=ViewProblemStatement&compid=5910&rd=10082">MasterMind</A></span>
<br><br>

Many of us probably played MasterMind as children.  However, the MasterMind we
played had no more than 6 pegs, and about 6 colors.  While this may be fun for a
person, it represents little challenge for a computer.  To make things
interesting, this problem required competitors to write a program that would
play with as many as 100 pegs and 20 colors, or as few as 5 pegs and 5 colors.
<br><br>

A quick search on the internet will reveal that this problem has a long history,
going back to the 1970's, when Knuth showed a simple greedy strategy which solves the
classic 4 peg, 6 color version in an average of 4.478 moves.  However, to
generalize his method, we would have to enumerate far too many possibilities in
the larger cases.  Luckily, an even simpler strategy does almost as well.
Consider all possible codes which would give the response to guesses seen so
far.  Call this set of codes the <i>consistent</i> codes.  From these consistent
codes, pick one at random -- this gives an average of 4.638 moves, almost as
good, but with much less computation.<br>
<br>

Of course, with 100 pegs and 20 colors, there are 20<sup>100</sup> possible
codes, so we won't be able to enumerate all consistent codes and then pick one
at random.  But, if we could just find one that was consistent, that would be
almost as good as picking one at random (maybe even better if we got lucky).  Unfortunately, it
has recently been shown that finding a consistent guess given a set of previous
guesses is an NP-Hard problem (<a href="http://arxiv.org/abs/cs/0512049">read
the paper</a>).
<br><br>

At first, this may sound like pretty bad news.  It says that even if we have all
the information we need from the guesses, it might be computationally hard to
put the pieces together and come up with the answer.  However, one should always
keep in mind that, while an NP-Hard problem may be hard in some cases, simple
heuristics will often perform well in the average case.<br>
<br>

Furthermore, we don't have to solve the NP-Hard problem in order to eventually
arrive at the right answer.  If we are having a hard time coming up with a
consistent guess, we can always ask for more information, which will only make
things easier.<br><br>

With this background we can now sketch the basic algorithm used by the top two
competitors:
<ul>
<li>Make some initial guesses:  Many competitors chose to make solid color
guesses to exactly determine the number of pegs of each color.  Other
competitors (notably venco) chose to essentially skip this phase.</li>
<li>
Somehow find a guess that is consistent.  If this proves too hard, find a guess
that is as close to consistent as possible (for some definition of close).
</li>
</ul>

Of course, the key to doing well is all in the details.  How much processing
time should one spend trying to find a consistent guess?  What function should
be used to evaluate closeness?  What information can be logically deduced from
the guesses to help find a consistent guess?  The list of potential tricks is
almost limitless.  <br><br>

<h3>Venco's solution</h3>

My first thought about how to solve the problem was to generate any guess
consistent with the results of all previous guesses.  It's known that in the
regular MasterMind game with just a few colors and pegs there are better
algorithms. One can make special inconsistent guesses that reduce the possible
number of secret keys further than any of the consistent guess would.  Of
course, it was clear that these sorts of algorithms were infeasible here, as
there were far too many colors and pegs.  So, I used the sub-optimal, but
still reasonably good approach of simply finding any consistent guess.  It turns
out this problem is also too complex (NP-Hard), probably with complexity similar
to number of possible orders of all the pegs.  So, in theory, this approach is
no better than the optimal one. But in practice we can be satisfied with almost
consistent guesses which are much easier to achieve.<br><br>
<div align="center">
<img src="/i/longcontest/match_editorials/mm2/mastermind.gif" alt="MasterMind" /><br>
venco's solution (top) beats out vdave by avoiding the solid color guesses (15 colors, 20 pegs).
</div>

<br><br>

From the very beginning I had two stages to my guesses.  The first stage tries
to find the exact number of pegs of each color, not taking into account whether
the peg was in the right place or not. If we call the first number in the
results <tt>hits</tt>, and the second number <tt>misses</tt>, then total number
of correctly guessed colors can be calculated by adding <tt>hits</tt> and
<tt>misses</tt> together. This number can be computed more efficiently than it
is by the algorithm given in the problem, which has O(L<sup>2</sup>) complexity.
Instead, I always preprocess all my guesses by counting the number of each color
in the guess.  After that, the number of matching colors between two guesses can
be calculated in O(K) time:

<pre>
    int match = 0;
    for ( int k = 0; k &lt; K; ++k )
        match += min(cnt1[k], cnt2[k]);
</pre><br>

My first submission for the first stage tried to make some reasonable initial
guess, and then optimized it by switching pegs from one color to another.
In optimizing, I tried to find guesses that were as consistent as possible with
the previous guesses, just in terms of the number of correct colors (ignoring
location).  More specifically, when evaluating a guess <tt>g</tt> I examined
each previous guess <tt>g'</tt>.  I computed the value of <tt>hits+misses</tt>
that I would have received for <tt>g'</tt> if <tt>g</tt> were the correct code.
The error for <tt>g</tt> from <tt>g'</tt> is the difference between this
computed value and the actual value I received.  The total error for <tt>g</tt>
was simply the sum of the errors over all <tt>g'</tt>.<br><br>
I did the obvious thing of starting with a random guess and then changing one
color at a time to improve the error.  I restarted a few times, and picked the
best guess (lowest error) as my final guess.  To avoid timeout, I often did not
find completely consistent guesses.  Eventually, I would get a guess that would
have all the right colors in it, and then I'd advance to the second stage of my
algorithm.<br><br>

However, my tests showed that this approach failed to find the answer for large
L.  It turns out that it failed to find the correct color counts for a long
time, hundreds of guesses. I added an obvious fix for this by issuing unicolored
guesses for K-1 color just to find the color counts.  I did this for L &gt;=
15, and the code started to work reasonably well.  <br><br>

For the second stage, when I knew how many of every color were present, I simply
assigned <tt>hits</tt> pegs randomly based on the guess with the most
<tt>hits</tt> so far, and filled the rest randomly according to the known
numbers of pegs of each color.  This version score 62.11
which was quite good at the moment, although not the best.<br><br>

I ended up sticking with these essential two stages till the end. From here, I
made a number of important optimizations to each of the two parts.  First I
coded a better optimization function for the second stage. After making an
initial order, I counted how bad and how good each peg was in its place. For
example, if some guess actually has 2 hits, but my guess would give it 5,
all the matching pegs were given a negative score because they increased the
difference between current and required number of hits. So I created two arrays
kl_add, and kl_sub containing the difference in error function I can get by
adding specific color k at the place l, and by removing this peg. My
optimization routine was:

<ol>
<li>
Take several (2-8) pegs off the board so that the error is reduced as mach as possible.</li>
<li>Add them back in the places so that error is as small as possible again.</li>
<li>Repeat it until I cannot get any improvement in error for several times in a row.</li>
</ol>

Each time I remove or place a peg on the board I had to update kl_add and kl_sub
arrays, because the whole situation changes, and some pegs which were in a good
place, may now be in a bad place as the total number of hits for each guess
changes.  Fortunately, the change was usually small, and overall those arrays
save time (as opposed to recalculating the error after each possible change).
Unfortunately there are a lot of cases, the code is quite complex and not obvious,
and it's easy to make a mistake.  After implementing the above order
optimization function, my second submission went on top with score
106.02.<br><br>

Now, what else to do? Seeing the improvement from optimization of stage two I
decided to implement a similar thing in stage one, so instead of moving one peg at
a time from one color to another, I move several pegs. Again, I first remove
several (2-8) pegs from the board, and take them back with another colors so
that total error is minimized.  In addition I have noticed that some information
about color counts can be obtained analytically. Consider the example (we are
talking about color counts here, so order doesn't matter):
<pre>
guess 1: abbcccdef, 5 matched colors.
guess 2: aaabccedf, 4 matched color.
</pre>

As we see, the number of matched colors decreased by 1. But if we consider each
color separately, we see that number of pegs with color <tt>a</tt> increased by
2, while <tt>b</tt> and <tt>c</tt> both decreased by 1 and <tt>d</tt>,
<tt>e</tt> and <tt>f</tt> stayed the same.  Looking at individual
colors, there are three ways to get an overall decrease of 1 match (columns
represent change in number of matches for one color): 
<pre>
Change in
 a  b  c
---------
 0  0 -1
 0 -1  0
+1 -1 -1
</pre>

From this, we can immediately conclude that there are at most 2 pegs of color
<tt>a</tt>, since it could have increased by at most 1, and there could have
been at most one match to begin with.  In this case, we can actually get a bit
more information, though my code does not do this.  Assume there are 2 pegs of
color <tt>a</tt>.  Looking at the table, the number of <tt>b</tt>'s and
<tt>c</tt>'s must have each decreased by 1.  Thus, the number must have been at
least 2 and 3, respectively (otherwise they wouldn't have gone down).  But now,
we have too many matches, since <tt>b</tt>'s, three <tt>c</tt>'s and an
<tt>a</tt> add up to more than 5 matches.  Thus, there can be at most one
<tt>a</tt>.<br><br>

Another example
<pre>
guess 1: abbccc, 1 matched color.
guess 2: aaabcc, 3 matched colors.
</pre>
Here things are simple, as the only color which increased was color <tt>a</tt>.
Thus, the only way to get an increase of two is for there to be at least three
<tt>a</tt>'s.  While there are many more complex rules and further deductions
one might make, just this simple one usually lead to the right color counts
quite quickly.<br>
<br>

In reality, there is usually much less information that can be easily gleaned
analytically, but if we consider all pairs of previous guesses we can deduce the
exact number of colors in many fewer guesses.  It turned out, with all those
rules implemented, the stage of unicolor guesses is not needed at all.  My code
finds exact number of colors in about the same K-1 guesses on average.  Although
it may be seen as no improvement, but if we recall that with K-1 unicolor
guesses we do not get any order information at all, the new approach takes a
lead with a score of 142.99.<br><br>

Later, I optimized my code a lot to avoid timeout in some rare cases,
removed a lot of unused and debugging code, switched to standard random
function, increased number of iterations to find the guess from original
2000/L to 50000000/(L*L*L), because for small cases I can run much more
iterations in time.
All this gives slight improvement on average, so I submitted 4th version,
and even though it scored slightly less on 50 test cases, I'm sure it's better
on average.<br><br>

I think that the biggest advantage I had over the competition was that my
initial stage gave me more information.  While many people did a good job on the
second stage, they used K-1 guesses to obtain the color counts in the first
stage, and just the color counts.  By contrast, I used an average of about that
many, but also gained a significant amount of information about the ordering at
the same time.

<h3>Second and Third Place Submissions</h3>
vdave used the same basic approach as venco, except that his discovery of the
color counts gave him less information.  He recognized that guessing solid
colors was clearly not optimal though, and he did improve on it somewhat, but he
probably still fell short of the amount of information venco gained with the
first few guesses.  In addition he worked hard to optimize his code so he could
find the most consistent guess possible when working in the second stage.  In
the end though, the early guesses cost too much, especially on the cases where
the number of colors was large compared to the number of pegs.<br><br>

A more radical approach came from flagitious.  I'm not sure I exactly understand
how it works, but the basic idea seems to be to work on one color at a time.
This strategy does quite poorly when there are just a few colors or pegs (with
10 pegs and 5 colors it makes at least twice as many guesses as venco).
However, on the larger cases, it almost always wins.  In fact, looking at the
breakdown of which solutions won the most cases, we have:
<br><br>
<table cellpadding="3" cellspacing="0" border="1" class="bodyText">
<tr><th>Coder</th><th>Cases Won</th></tr>
<tr><td>venco</td><td align="right">158</td></tr>
<tr><td>vdave</td><td align="right">59</td></tr>
<tr><td>flagitious</td><td align="right">155</td></tr>
<tr><td>lyc1977</td><td align="right">21</td></tr>
<tr><td>Psyho</td><td align="right">3</td></tr>
</table>
<br><br>
But, the way the scoring works, flagitious got only half as many points as venco
on the easy cases, while venco -- though he took many more guesses -- got almost full
points on the hard cases.
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