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
<tc-webtag:forumLink forumID="505540" message="Discuss this match" /></div>
<span class="bodySubtitle">2002 TopCoder Invitational<br>Online Round #4</span><BR/>Wednesday, October 30, 2002
<br><br>

<span class="bigTitle">Summary</span>

<P>
And there was blood in the water.
</P>

<P>
Round 4 of the 2002 Topcoder Invitational, starting with the best and
luckiest 64, and narrowing down all the way to the top 16. A relatively easy
Level One problem, a Level Two problem with a few nasty bits, and a truly
devastating Level Three problem later, the results are in and complete.
</P>

<P>
<B>SnapDragon</B> blitzed the round with 1279.29 points and all three problems.
<B>John Dethridge</B> pulled off a similar feat, completing all three problems for
1024.74 points. <B>ZorbaTHut</B> got 837.82 points, from a Level One, Level Two,
and a pair of challenges.
</P>

<P>
The lowest seed remaining in the top 16 is, <B>FunOrPain</B>, who started at
position 228. <B>FunOrPain</B> set the cutoff at 659.13 points, the lowest score to
get to the onsite. <B>tjq</B> was the second lowest seed and the second lowest
score, at 666.15 points - less than a quarter of a point behind <B>reid</B>, the
second *highest* seed. The other semifinalists are, in order of score,
<B>ambrose</B>, <B>dgarthur</B>, <B>dmwright</B>, <B>radeye</B>, <B>malpt</B>, 
<B>obfuscator</B>, <B>lars</B>, <B>WishingBone</B>,
<B>NDBronson</B>, and <B>DjinnKahn</B>. Some of us have been there before, but quite a few
haven't - it's going to be nice to see some new faces.
</P>

<P>
And on the unfortunate side of things, the highest seed to drop out was
<B>bigg_nate</B>, seed 7, a particularly bad round leaving him with only 322.30
points. Scores this round ranged all the way down to -100 (surprisingly one
of the higher seeds, and I'm not saying who it was), with seven people
getting zero points or below. And on the front of "it can't have been an
accident", one competitor finished with 7.81 points, and no, that's not a
typo.
</P>

<P>
Since I know you're probably sick of my rambling and just want to see how to
solve the problems, here they are.
</P>


<H1> The Problems </H1> 

<font size="+2"><b>GameOfLife</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505540" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
<BR/> 
Used as: Level 1<BR/>
<blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">300 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">63 / 64 (98.43%)  
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">53 / 63 (84.13%) 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>uglyfool</b> for 282.61 points
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          246.46
        </td>
      </tr>  
    </table>
    </blockquote>
<P>
Nothing more complex than brute-force here. At most we've got a 50x50 board,
and at most we've got 1000 iterations. Yes, that's 2.5 million, which is a
bit painful, but I don't even want to think about trying to do it any other
way.
</P>

<P>
The easiest method was to make a big 3d array, [ 1001 ][ 50 ][ 50 ]. Fill in
[ 0 ][ x ][ y ] using the input string and then just iterate over it
repeatedly to fill in each next generation. You'll want to make a get()
function that handles negative values and out-of-bound values by just
wrapping around the "edges". From there it's pretty simple - count the
number of living cells, make a switch() based off the provided rule, and
update the new array. When you get to the end, count the living cells and
call it a day.
</P>

<P>
If you worried about memory consumption, or wanted to take advantage of
caching a little better (both valid concerns) you could also use only two
arrays, one to store the next generation and one to store the last
generation. This is the approach I took.
</P>

<P>
The mistakes I'm noticing basically come down to serious conceptual flaws,
speed issues, and simple bugs. Most of the conceptual flaws I've seen would
have been found by doing the example cases, and I think I've beaten that
dead horse quite enough. Speed issues appear to be being caused by people
leaving debug information in inner loops or passing large structures by
value in C++ (use const reference, or make them global! And always test the
worst computational case if there's any chance of it crashing and burning.)
As for bugs - some people's code failing on 0 generations, for example - all
I can say is, look for the boundary cases.
</P>


<font size="+2"><b>Socialize</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505540" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
  
Used as: Level 2<BR/>
<blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">550 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">50 / 64 (78.13%)  
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">27 / 50 (54.00%) 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>ante</b> for 532.98 points
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          391.54
        </td>
      </tr>          
    </table>
    </blockquote>
<P>
This was actually very similar to the Doorknobs problem from Round 2, with a
lot of the same efficiency considerations, just far more of them. I wouldn't
be surprised in the least if Doorknobs inspired this problem.
</P>

<P>
The best way, by far, to do this was to scan the entire array for people.
For each person, do a floodfill (in a different array) of all the distances
from them. Then scan through it again - yes, inside your big loop - and for
each person, add to a distance accumulator and a distance counter. The worst
case efficiency-wise is a 50x50 matrix of people, and it comes out to be an
O( n^4 ) algorithm (n^2 for each person, and another n^2 because for each
person you're checking *each person*), which comes out to 50^4 or 6.25
million. Painful. Very painful. But if you're efficient, doable. Note that
we're counting each pair of people *twice* (starting once from each side),
but that's okay, because we're counting *every* pair of people twice, so the
average is unaffected.
</P>

<P>
But you have to be careful.
</P>

<P>
For one thing, finding the shortest-path between each two people
independently is going to crash and burn. I don't know if there's a
super-efficient algorithm possible on a grid like this - A* might be
tolerable - but with the naive n^2 floodfill algorithm that most people did,
that comes out to an O( n^6 ) algorithm, which certainly doesn't work with
n=50. (Approximately 15.6 billion, if you're curious, and an empty for loop
gets under a billion iterations before timeout in both C++ and Java.)
Luckily your floodfill algorithm will give you *all* the shortest distances,
if you just extract the information before getting rid of it.
</P>

<P>
Another thing that tripped up a lot of people is using depth-first
floodfill. Someone mentioned that depth-first in this case becomes an
exponential-time algorithm, which I can believe, and which will fail
dramatically in this case. In the case of a 50x50 grid, depth-first will
zigzag all the way down the grid before backing up to the most recent zig
and redoing every single location beneath it . . . once, for every single
location *above* it. Painfully slow. The only real way to do it was with
some sort of breadth-first algorithm. The implementation I used had two
arrays, one for "this pass", one for "next pass" - I saw someone else who
had a list of queues, and I expect this would work fine also.
</P>

<P>
Once we got past that, it was just speed.
</P>


<font size="+2"><b>Symmetry</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505540" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Level 3<BR/>
<blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">1000 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">21 / 64 (32.81%)  
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">3 / 21 (14.29%) 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>dmwright</b> for 501.48 points
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          419.13
        </td>
      </tr>          
    </table>
    </blockquote>
<P>
If you want a way to give many coders nightmares, computational geometry is
a pretty good one. Some people handle it easily - unfortunately I am not one
of them, and I bombed this problem pretty horribly. My algorithm was sound,
but my implementation was enormously flawed, so all I'm going to be able to
do here is give you an idea of how it *should* be done and let you pore over
the few surviving solutions for clues.
</P>

<P>
The weird bound of 200 points also serves to nicely eliminate an O( n^4 )
solution - in fact, this was its design. Luckily it's doable in O( n^3*log
n ) time without much trouble, probably much faster if you really know what
you're doing. SnapDragon's solution appears to be O( n^2*log n ), so there
ya go.
</P>

<P>
The basic algorithm I used was to take each pair of points seperately,
figure out the line of reflection centered between the two, then check to
make sure each point has a match on the other side. If they all do, add it
to a set (the C++ STL set&lt;&gt; structure guarantees uniqueness - you
could do something similar in other languages) in some canonical form.
Return the size of the set. A glitch that I didn't foresee that would have
killed me even if I *had* fixed all the other bugs is the situation that
happens when all the points are colinear, but that's easily fixed by adding
an identical check for a line of reflect passing through the two points.
</P>

<P>
Implementation is tricky.
</P>

<P>
What I'd done is try to first translate the entire field so that the line of
reflection passed through the origin (find the average of the two points,
subtract it from each point in series). Then rotate the field so the line of
reflect was vertical. Invert the X coordinate, un-rotate, un-translate, and
check for a match - easy to do if you have a C++ set&lt;&gt;, and I imagine
not hard in any other language. Java's HashTable will do the job nicely, for
example. I was trying to use matrices to rotate, and was sticking to
integers as much as possible - doing both rotations using the rise and the
run (and a distinctly non-unit vector) then doing it again and scaling it
down by the appropriate factor, checking first to make sure it was
integral - if it wasn't, it's all finished anyway, since the points are all
at integral locations.
</P>

<P>
It all seems pretty straightforward, but I still don't know where my bugs
were, so I'm not going to be much help at this point :P
</P>

<P>
The theory behind my implementation was that for any line of symmetry, a
point on the graph *must* map to a different point (except for that whole
colinear thing, but then we have a line that must go through two points). By
checking each combination of two points, you might get a few duplicates, but
you *would* get every line of reflection, and the canonical form would get
rid of any duplicates.
</P>

<P>
SnapDragon seems to have set something very similar up with vertices 0 and
n, for all n &gt;= 1, which makes sense, because vertex 0 is going to have
to map to something also. He then does the same thing with 1 and n for all n
&gt;= 2, first checking to see if points 0, 1, and n are all co-linear, then
doing the normal check. This makes some sense to me, but not enough so I can
explain it.
</P>

<P>
I think I'll just leave it at this.
</P>

<P>
Good luck all. I'll be seeing some of you in a month, and probably most of
you next week.
</P>

<BR/>
  
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
