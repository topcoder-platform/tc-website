<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505528" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 111</span><br>Wednesday, September 4, 2002

<H1> 
The Problems 
</H1> 

<P>
<B>Division-II, Level 1,</B> "DigFilter": (250pt)<BR/>
Submission rate - 80% (171/214)<BR/>
Success rate - 36% (79/171)<BR/>
High score: <B>helloworldX</B>, 239.76 points<BR/>
</P>

<P>
This problem came with its own very confusing explanation. I found it
easiest to try to decipher it through the examples, and even that was
tricky. In the end, it was asking for a series of multiplications,
multiplying each element in "filter" by an element in "samples". The
elements in "samples" were also backwards, and offset by "time". I'm
honestly not sure how to describe this one any better.
</P>

<P>
<B>helloworldX</B> had a rather clever solution - it's rather inefficient, but at
most it involves 2500 tests, and that executes well under the maximum time
(I generally start worrying at the 10-million point or so.) He loops through
both arrays, testing every combination, and if the array offsets added
together == time, he adds their product to an accumulator. This is a good
technique - sometimes it's not worth doing what the instructions say, when
you could write an equivalent bit of code much faster that produces the
answer in a much easier way.
</P>

<P>
I wouldn't have seen it, and I would have done horribly on this problem.
Kudos, <B>helloworldX</B> :)
</P>

<P>
<B>Division-II, Level 2:</B> (500pt) &amp; <B>Division-I, Level 1:</B> (300pt)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505528" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
</P>

<P>
<B>Div-II</B><BR/>
Submission rate - 37% (79/214)<BR/>
Success rate - 67% (53/79)<BR/>
High score: <B>mongolianBeef</B>, 409.11 points<BR/>
</P>

<P>
<B>Div-I</B><BR/>
Submission rate - 85% (89/105)<BR/>
Success rate - 89% (79/89)<BR/>
High score: <B>SnapDragon</B>, 235.90 points<BR/>
</P>

<P>
This was also a rather icky problem, full of potential off-by-one errors -
luckily, most of them were caught by the example cases. The core of most (if
not all) successful solutions was a simple test. Try getting through the
lights with a speed of 1. If it doesn't work, increment the speed and try
again. You're guaranteed to get through eventually - a speed of 150 is, in
fact, the highest you'll ever need, I believe - so as long as you can check
150 possibilities, you're fine.
</P>

<P>
The actual implementation, unfortunately, was more than a little messy.
SnapDragon's code is the best I've seen for this - for each light, he
calculates the time the car was going through it, then checks to make sure
it wasn't red at the time (a simple modulus calculation works for that - a
light is red for one time unit every n time units, so "time % n == 0" works
nicely, perhaps with a + or - in one direction or another to account for the
"starting time" of the car and the stoplights.)
</P>

<P>
If the car gets through all the stoplights without hitting one, it works.
Return that value. Done.
</P>

<P>
<B>Division-II, Level 3:</B> (1000pt)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505528" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Submission rate - 4% (8/214)<BR/>
Success rate - 0% (0/8)<BR/>
High score: No successful submissions<BR/>
</P>

<P>
Here's something that you don't see often - not a single working submission.
It's somewhat straightforward, there's just a lot to keep track of.
</P>

<P>
You need to keep track of several things. You need a queue for the CPU jobs
to do next. Each entry needs to include the amount of CPU time left and the
CPU slice size for the next time it gets a chance to execute.
</P>

<P>
You also need to keep track of the current time it is in the simulation.
That's actually all you need, though.
</P>

<P>
Your basic loop will run until both all jobs have been added to the queue
*and* the queue is empty. You can have one iteration be one time unit if you
want, but it would be easier to have one iteration be one "slice". So: each
iteration, first you add all the jobs, in the appropriate order, that you
haven't yet added and that have insertion times equal to or less than the
current time. Then you check to see if there's a job in the queue. If there
isn't, you push the "current time" up to the first job remaining in your job
list. (If your job list is empty, you should have stopped already.)
</P>

<P>
Now look at the first job in your list. Add its "slice size" to your current
time, and subtract it from its CPU-time-left. If that job is finished, drop
it out of the queue, otherwise double the slice size and stick it on the end
of the queue again.
</P>

<P>
Once you're done, you have all the information you need.
</P>

<P>
"But wait!" I hear you yelling. "You haven't kept track of how much CPU time
each process has used, or how efficient it is, or how much time you've
actually spent in processes for the entire computer!"
</P>

<P>
Well, that's because we don't need to.
</P>

<P>
Each process is going to use the same amount of time, no matter when it's
scheduled. It'll use the smallest of (2^n-1) such that it can actually
complete. So the process efficiency calculations don't need the simulation
at all - we can do that seperately, sorting all the times by name, then just
start at n=1 and calculate (2^n-1) until it exceeds the process time.
There's the total amount of time that process will take - just divide the
actual CPU time by that (multiplying by 100 first, because if you don't,
we'll get 0 or 100 due to integer truncation), and there's our process
efficiency value.
</P>

<P>
The entire computer is just as easy. We add all the actual-time-needed
numbers from all the processes, then divide that by the current simulation
time (once we've finished the simulation). And just paste that on the end of
the array we've already generated.
</P>


<P>
Yes, that's the only thing we need the simulation for.
</P>

<P>
<B>Division-I, Level 2:</B> (450pt)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505528" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Submission rate - 64% (67/105)<BR/>
Success rate - 63% (42/67)<BR/>
High score: <B>ZorbaTHut</B>, 404.62<BR/>
</P>

<P>
Annoying to conceptualize, and once again lacking in explanation. I don't
know for certain, but this problem seems vaguely based off the recent batch
of games that allow construction. Rollercoaster Tycoon is the one I thought
of instantly, since in that game you can indeed lower individual corners,
and it does build "retaining walls".
</P>

<P>
"Retaining walls" confused a lot of people, but basically what this means is
that you can lower a single corner of a 9-high tower all the way to 1
without worrying about such minor details as "slope", or "the wall falling
over on your house".
</P>

<P>
In the end, I found this easy to do as a simple brute-force test. For each
possible starting coordinate in the map, try placing a house at every height
that makes sense (0 through 9 - why would you ever want to put a house at -1
or 10? It'll just be more expensive.) My implementation runs in under one
second for all cases, though I'm cropping out the cases where the house
can't fit in the plot at the current location (a 4x4 plot with a 3x3 house
starting at 2,2 for example). Thinking about it, I'd be worried about it
running fast enough if you didn't do that - it would take approximately
eight times longer in the worst case (50x50 plot, 49x49 house).
</P>

<P>
But anyway. My method is simply to "flatten" each square the house will
occupy. I have a function that I call to do the calculations - it counts the
deviation for each corner in that square and returns the total cost of
flattening the square at a new altitude. From there it's just a bunch of
loops, and keeping track of the best solution.
</P>

<P>
I'm not doing anything clever with the rotation either, just doing it again
with height and width switched. Yes, this means if the house is square I do
the same calculations twice.
</P>


<P>
<B>Division-I, Level 3:</B> (1100pt)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505528" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Submission rate - 7% (7/105)<BR/>
Success rate - 71% (5/7)<BR/>
High score: <B>John Dethridge</B>, 747.08<BR/>
</P>

<P>
This is me, hitting myself for not using 64-bit integers everywhere. Without
that, my solution would have worked beautifully.
</P>

<P>
But. Anyway. <B>SnapDragon</B>'s been saying my solution is cleaner than his,
despite that one bug, and looking at his code, I'm inclined to believe him.
And no offense to him, but <B>John Dethridge</B>'s code is an unintelligable jumble
of operators - of course, this is why he finished it so amazingly fast, so
it's not really an insult - and what it all comes down to is, if you need to
read someone's code, look at mine.
</P>

<P>
Just ignore the fact that it didn't work. It was close, okay?
</P>

<P>
The basic solution is, in fact, dynamic programming. Buried in the problem
specifications - and barely noticed by me - it says that upperConnection and
lowerConnection are between 2 and 10 elements. Most people know that 2^50 is
way way way too slow. Well, 2^10 is a little more than a thousand billion
times smaller - in fact, it's only 1024, which is small enough for most
purposes.
</P>

<P>
Since upperConnection and lowerConnection are only 10 elements long (at
most), that means we have ten shift registers at most, any of which can be 1
or 0, for a grand total of 1024 possibilities. Conceptually it's easy to see
that any two situations with the same shift register can generate the same
stream of output at that point, even if the process to get that shift
register is different (for example, with a shift register 3 long, 1001 would
generate the same register as 0001 - the first 1 is already gone.) Since the
entire register can change the upperRecieved and lowerRecieved, we have to
keep track of all of it, though.
</P>

<P>
I suppose now is a good time to mention that the existence of both upper and
lower is something of a red herring. Yes, you've got to pay attention to
both of them. However, the basic algorithm is the same if you only have one,
or, in fact, if you had several thousand different sets of bits. I'm going
to pretend we only have one for the time being, and I'll call it upper.
</P>

<P>
First let's make an array int wrongs[ 51 ][ 1 &lt;&lt; 10 ];. We'll have at most
51 steps, counting the first initialization step. Because we don't want to
have to consider the things that are impossible - starting with a shift
register with any 1's in it, for example - we'll set the entire array to
several million. We'll also have an array i64 datas[ 51 ][ 1 &lt;&lt; 10 ];, and
it doesn't really matter what we set it to.
</P>

<P>
Now for some semantics. wrongs[ i ][ j ]; means "the least number of
sequence mismatches, at step i, that ends with the shift register being j".
datas[ i ][ j ] is "the datastream we have at this point", bitpacked - 50
bits fits nicely into a 64-bit int.
</P>

<P>
We initialize wrongs[ 0 ][ 0 ] to 0, and the same with datas[ 0 ][ 0 ],
since that's the starting state.
</P>

<P>
Now we iterate, one time for each sequence bit. And we iterate over our
entire 1024 possibilities. We add a single 0 bit to the end of the shift
bits and see how many mismatches we get with our "upper" data - adding that
to the current wrongs[ i ][ j ] and comparing it to wrongs[ i + 1 ][ newj ].
If your new solution is "better" - fewer wrongs *or* the same number of
wrongs and a lower data (this satisfying the tiebreaker rule), replace the
wrongs and the datas as appropriate. Then do the same thing with a 1 bit
instead.
</P>

<P>
Once you've gone through everything this way, all that's left is to scour
wrongs[ recieved.size() ][ j ] for the lowest value, de-bitpack it, and
return the array.
</P>

<P>
It's long and complex, but it works. :)
</P>



<p>
<img src="/i/m/ZorbaTHut_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="152347" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
