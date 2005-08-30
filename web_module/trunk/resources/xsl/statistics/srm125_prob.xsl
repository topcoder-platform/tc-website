<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%">
    <TR>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
   <TR><TD COLSPAN="2" BGCOLOR="#43515E" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
   <TR>
      <TD VALIGN="top" BGCOLOR="#43515E" CLASS="moduleTitle">&#160; &#160;</TD>
      <TD BGCOLOR="#43515E" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
   </TR>                    
   <TR>
       <TD COLSPAN="2" VALIGN="top" BGCOLOR="#43515E">
      <TABLE BORDER="0" WIDTH="100%" CELLSPACING="1" CELLPADDING="" BGCOLOR="#FFFFFF">
      <TR>
         <!-- <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="15"><A HREF="/?t=statistics&amp;c=srm104_prob" CLASS="bodyGeneric">&#160;Problem&#160;Set&#160;</A></TD>
         <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/?t=statistics&amp;c=srm103_rookie" CLASS="bodyGeneric">&#160;Rookie&#160;Review&#160;</A></TD> -->
         <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyGeneric">&#160;Archive&#160;</A></TD>
          <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas?&#160;</A></TD>
      </TR>          
      </TABLE>
      </TD>
   </TR>               
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<B>Single Round Match 125</B><BR/>
Monday, December 16, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>


<font size="+2">
  <b>Taxes</b>
</font>
<BR/>

    Used as: Division-II, Level 1:<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">350 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">172 / 206 (86.43%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">129 / 172 (75.00%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>MisterZimbu</b> for 332.11 points
                </td>
      </tr>     
    </table>
  </blockquote>
  
<P>
Seems confusing at first glance, but it's actually not that difficult,
especially due to one of the constraints. It says the amount of money must
be divisible by 100 . . . so that means you won't have to deal with
floating-point. And not dealing with floating-point is *always* a good
thing.
</P>

<P>
First you'll want a variable to store "Tax Collected So Far". Next you'll
start at the very bottom of the "cutoffs" array. For each item in the array,
first calculate how much money exists in that bracket (it's min(
totalmoney - bracket[ i - 1 ], bracket[ i ] - bracket[ i - 1 ] ).) Divide it
by 100, multiply it by the bracket percentage, and add it to your Collected
So Far. If you've gotten to a bracket that there isn't any money in, stop.
To simplify the algorithm (and eliminate a special case) you might want to
set the final "bracket" value to something extremely large, say, 100,000,000
(the maximum amount of money you can have is 10,000,000, so that's a
suitable "infinity" value.)
</P>

<P>
Now you just return the "Tax Collected So Far". End of story.
</P>


<p>&#160;</p>

<font size="+2">
  <b>BoardGame</b>
</font>
<BR/>

    Used as: Division-II, Level 2 &amp; Division-I, Level 1:<blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-II stats</b>
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
        <td style="background: #eee;" class="bodyText">113 / 199 (56.78%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">31 / 113 (27.43%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>ChristopherH</b> for 486.53 points</td>
      </tr>      
    </table>
   <BR/>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I stats</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">102 / 106 (96.22%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">54 / 102 (52.94%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>SnapDragon</b> for 234.29 points</td>
      </tr>       
    </table>
  </blockquote>
<P>
Simulations are easy because they give you every single step, and all you
have to do is implement it. On the other hand, they're tough because there
are usually weird special cases. As in most simulations, the most important
thing to do is not outsmart yourself. Just follow the instructions, do what
they say, don't try to improvise or optimize - It Just Isn't Worth It.
</P>

<P>
In this case, what you're going to need is two states for each player -
their current location, and whether or not they're in the hospital. Keep in
mind that it's perfectly possible to be in square 32 and yet not in the
hospital - 32 is just where the hospital is located.
</P>

<P>
Now, personally, I'd write this to be 0-based. Number the squares 0 to 63,
and have the hospital be at square 31, then just add one to everyone's
position afterwards. It's simpler to code. But the basic algorithm is very
simple. Keep track of which die roll and which player you're on. Now, for
the player, keep a "double count" variable (just temporary, it only applies
to this set of rolls.) Move the player forward, then check to see if they're
doubles. If they're not, move to the next player - if they are, increment
the doublecount and stay with this player. If the doublecount reaches 3,
dump the player in the hospital, set his sick flag, and move to the next
player. Of course, if the player's sick flag is already set, what you want
to do is *not* move the player forward *unless* it's doubles, then move on
to the next player anyway. There's no real clean way to do this that I can
think of besides just an if( sick ) test, and two different chunks of code
for each one. But as I said, stop trying to think "clean" and just get it
done.
</P>

<P>
Other things to make sure of is that you don't mess up at the end of the
game - finish the last roll, do all the consequences, then stop. Reading
dice off the end of the array is a bad idea.
</P>

<P>
And honestly, that's all there is to it. Just follow the rules.
</P>



  <font size="+2">
  <b>TurnFinder</b>
</font>
<BR/>

    Used as: Division-II, Level 3:<blockquote>
    <table cellspacing="2">
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
        <td style="background: #eee;" class="bodyText">23 / 206 (11.17%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">3 / 23 (13.04%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>ChristopherH</b> for 792.47 points</td>
      </tr>     
    </table>
  </blockquote>
<P>
And you all know how much I love computational geometry.
</P>

<P>
Some people have done clever things involving the dot product and arccos. I
am almost certain this is the best way to do it. Unfortunately, that's not
how I would have done it, since I don't particularly understand it. I
*believe* it's something along the lines of "find the vector B-A and the
vector C-B, take the dot product, take the arccos - which gives you the
angle between the two - turn it into degrees, and compare. Which seems
plenty simple.
</P>

<P>
How I would have done it would have been to find the slope of the line AB
and the slope of the line BC, take the arctan of each (giving me each one's
angle), then subtracting them to get the angle between them. Obviously
there's a special case or two when the slope is infinite, which is why this
one is a much worse idea. But it would still work.
</P>

<P>
After you've gotten the angle between them in *some* way, it's just a set of
if statements and a bit of string manipulation to get the output value. And
that isn't really a problem.
</P>

<P>
Floating-point inaccuracy isn't a problem either, since the question comes
with a built-in guarantee that the answers won't be too close together.
Sometimes we should be grateful to our problem writers, they do a pretty
good job. And watch me grumble at the Division I Level Three soon, but
before that . . .
</P>

  <font size="+2">
  <b>NextRuler</b>
</font>
<BR/>

    Used as: Division-I, Level 2:<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">500 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">74 / 106 (69.81%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">32 / 74 (43.24%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>kv</b> for 457.99 points</td>
      </tr>     
    </table>
  </blockquote>
<P>
I'm not sure whether this one seems hard but isn't, or seems easy but isn't.
I think whichever one you start with you're going to find yourself surprised
at least once.
</P>

<P>
We have a constraint that there are no circular dependencies (i.e. people
who are their own fathers, i.e. time travellers) so that makes it much
easier. Calculating the ratios isn't much trouble - we actually have two
problems in front of us, but luckily, they're both easy. The first one is
calculating them efficiently. The second one is storing them.
</P>

<P>
For the first one, it's entirely possible to have a single person mating
with each of his (or her) offspring in turn to generate an entire fifty
inbred generations. I don't particularly want to think about the genetics
involved (or the scandal), but badly programmed this can be an exponential
process. Luckily, there's a solution, which everyone in Division-I should
know by now: caching. Just use your language's associative map class to
store the answer given a particular name. You'll generate each answer when
needed, then store it for future use. Not hard. It's worth mentioning that
this gives our algorithm a quick benefit - instead of trying to come up with
some way to generate all the answers then refer to them, our central loop
just becomes a loop through each of the claimants, asking how much Royal
Blood each one has, comparing them in order, and letting your caching take
care of the dirty work.
</P>

<P>
A second, slightly more serious problem, is storing these results.
Floating-point is probably a bad idea - a quick look at the problem should
make you very suspicious that two answers could be with 1/(2^50) of each
other. I don't think it can actually be that low, I think it has to be at
least a few times larger than that, but it's usually a bad idea to compare
numbers that are identical to within a dozen orders of magnitude.
</P>

<P>
Luckily, this problem is easy to solve also. Instead of considering the King
to have 1 unit of royal blood, consider him to have 2^50 units of royal
blood (2^55 if you want to be safe from off-by-one errors.) Obviously you'll
need a 64-bit int, but that's easily provided in all the languages. Now you
can safely divide by two 50 times without worrying about truncation.
</P>

<P>
And this is actually all you need, aside from the base cases. The only ones
to worry about are "if this is the Ruler, he has 2^55 units of royal blood"
and "if this person has no parents listed, he has 0 units of royal blood".
From there . . . well, it's just a little parsing and a bunch of
calculations.
</P>


  <font size="+2">
  <b>Cassette</b>
</font>
<BR/>

    Used as: Division-I Level 3:<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">1100 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">2 / 106 (1.99%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">0 / 2 (0.00%)</td>
      </tr>     
    </table>
</blockquote>
<P>
Ouch. That's really all I can say about this one.
</P>

<P>
Luckily for me, <B>Yarin</B> sent me a very detailed proof of how to solve it.
Luckily for you, I'm going to give a summary of it. :) I am including his
entire proof at the bottom - I'm not a big fan of proofs, I tend to work on
instinct, but I imagine quite a few people would want to see Real Evidence
that it works. Plus he's put a lot of work into it and it would really be a
shame to ignore it, especially since I'll probably get my summary wrong.
</P>

<P>
The first thing you need to realize, very quickly, is that you can't reverse
direction more than twice. Since the tape reverses direction also, you'd end
up running over stuff you'd already heard (which you're not allowed to do.)
There are really three situations, ranging from "never reverse" to "reverse
twice". Of course, then you also have to figure out when you reverse and
when you start, but that's another matter altogether.
</P>

<P>
<B>Yarin</B>'s solution requires you to be able to accumulate the enjoyment of any
given segment on the tape in constant time. Basically you store the sum of
[0,n) for all n, then to calculate [m,n), it's [0,n)-[0,m). Incidentally, if
you're not used to the [x,y) segment semantics, get used to them. They work
fantastically, and they're what STL is based around. The first value is
inclusive and the second is exclusive, so [3,6) means 3, 4, and 5. (And not
6.)
</P>

<P>
For the first case, "never reverse", the solution is obvious - you can just
brute-force it, now that we've got this nice constant-time segment tester.
If you want to be faster (and you do) you can easily observe that the
beginning or the end (or both) of the segment *must* be at the beginning or
the end of a song, simply by observing that any segment that doesn't have
that property can be scooted to the side until it does. Either scooting in
one direction will increase the quality (in which case it's better anyway),
decrease the quality (in which case scooting it in the other direction will
increase it), or keep in the same (in which case we don't care, and it works
anyway.) Yarin goes into this in more technical detail. Remember to check
both sides of the tape.
</P>

<P>
For the third case, "reverse twice", it's trickier. I'm going to follow
Yarin's variable names here, even though I think they're weird. Obviously
we're going to have two endpoints - the reversal points. Let's call them A
and B. There's also going to be a gap in the middle where the segments don't
quite meet up, and let's call that one C and D. (Note that C can equal D, in
which case there's no gap, just a circle of music. This is fine.) We now
know that the total quality of this listening segment is [A,B) on both
sides, minus [C,D) on one side. (Well, each side - we probably want to
calculate it twice.) Now all we have to do is try every possibility! Well,
not quite. That's 5400^4 tests, and that's way too many. However, D can be
calculated from the positions of A, B, and C (since we must use all the
listening time) so that brings it down to 5400^3, which is still way too
many.
</P>

<P>
We can also do the same scooting thing with regards to C and D (well, C),
thereby constraining C to only song endpoints and beginningpoints on that
side. This brings it down to 5400^2*50, which is a lot, but is actually
doable. However, it's possible to bring that down even more. You can
constrain that either A or B is an endpoint also, in much the same way -
visualize a tank tread, the top segment being one side of the tape, the
bottom segment being the other side of the tape. You can "roll" the A point
towards the B point (and the B point away at the same speed), sacrificing
the two listening qualities at A (one on each side) for the two at B. Once
again, if B is better, we're increasing the quality and this is a Good
Thing. If A is better, we're decreasing the quality and we can go in the
opposite direction to increase it instead. And if they're the same, we don't
care.
</P>

<P>
So: constraining either A or B to an endpoint (you'll want to loop through
twice, using each one as an endpoint), and C or D to an endpoint (okay, four
times - one AC, one AD, one BC, one BD), and running through all the
possible "tread length" values, we get an O(N*M^2) solution, where N is the
track length and M is the song count.
</P>

<P>
I'm not going to go into detail on the reverses-once case, but you can
probably figure it out at this point. In any case, given A and B as the
start and end points, and C as the reversal point, you can just iterate
through all values of A and B, calculating C as you go (remember to
calculate *both* C's, depending on which tape side you start on!)
</P>

<P>
And that's the solution. I'm not going to go into any deeper detail, or try
to prove this any more formally.
</P>

<P>
Luckily, Yarin is, and I'm repasting his email right here --&gt;
</P>

<P>
This is a very thorough solution description for the Div 1 hard problem
Cassette, feel free to use any part of it you find necessary, be it nothing
or everything :) I guess there's no point in including everything though,
it's way too elaborate (I like writing proofs though ;-) )
</P>

<P><BR/></P>

<P>
<B>Solution to Cassette</B><BR/>
First we store in a int[2][tapelength] for each second unit the value of the
song at this position (and 0 if no song), exactly the way it's done in
example 0 (thus, songs on side B are stored backwards).
</P>

<P>
Next, we want to make sure it's possible calculate the listening enjoyment
of any given interval on some side very fast, O(1). This is done by storing
the accumulated sum in a int[2][tapelength+1], so element [0][8] is the
listening enjoyment of the first 8 seconds of side A. To calculate the sum
of second 17 (inclusive) to 45 (exclusive) on side A, we simply subtract
element [0][17] from [0][45].
</P>

<P>
By looking at the first example, we can get an idea how the optimal solution
looks like by looking at the X's: during some interval, say [A,B), we listen
to every second on both sides _except_ for a gap on one side. Lets call this
gap interval [C,D). The use of the interval notation [) means that the first
element is inclusive and the second element is exclusive, thus [17,19) means
listening to the 17th second and 18th second of some side of the tape.
</P>

<P>
So, we have 4 variables, A,B,C and D. The extremely naive solution is to
check all possible values of A-D, check if this actually corresponds to
listening to listeningtime seconds, and then calculate the sum of [A,B) on
both sides and subtract this with [C,D) on one side (both sides must be
tried of course). This algorithm is O(N^4) where N can be 5400, so this is
no good.
</P>

<P>
The first observation one should make is that you only have to loop A,B and
C as D can be calculated from these other three variables using the
listeningtime parameter. Still this is O(N^3) which is also way too slow.
</P>

<P>
What we need to do is to reduce the number of points where it's actually
necessary to consider switching sides and start/stop listening. Below I will
use the term "stopping point" which is a point where a song either begins or
ends. Stopping points are not assigned to a specific side of the tape, they
are just an integer value between 0 and the tapelength,
inclusive.
</P>

<P>
First we shall prove that an optimal solution can be found by only
considering that you either start or stop listen at a stopping point:
</P>

<P>
Assume that we have found an optimal solution and that we neither start
listening when a song starts or stop listening when a song ends. Then it's
possible to _shift_ the part of the tape to listen to and still retain the
same total listening value (With shift I mean you either start listen one
second earlier, and stop one second earlier, OR start listen one second
later and stop one second later - always preserving the same switch points).
Why is this so? If the new value would be less than the optimal, then we
could have shifted in the other direction to get a _better_ value than the
optimal, obviously a contradiction. This is because, by assumpution, we both
start and stop listening in the middle of a song. Both these songs must thus
have the same listening value, and we can then continually shifting until we
reach either the beginning of one song or the end of the other.
</P>

<P>
This is enough to get a working solution to run in time, but just barely.
The time complexity is O(N^2*M) where M is the number of songs.
</P>

<P>
But we can do even better! Assume the optimal solution requires that we
switch sides exactly two times (for the sake of this proof we assume that we
first listen &gt;0 seconds, switch sides, listen &gt;0 seconds, switch sides again
and listen &gt;0 seconds - otherwise the optimal solution requires at most one
side switch - we need to make a special case for this).
</P>

<P>
If we plot the structure of the solution, using X to mark to parts of the
tape where we listen and . for position we don't listen, it will look
something like this:
</P>


<PRE>
   A    C      D  B
----------------------
....XXXXXXXXXXXXXXX....
....XXXXX.......XXX....
</PRE>

<P>
Note that X exactly covers the half-open intervals [A,B) and [C,D). Above we
proved that either C or D (the start and stop points) is a stopping point.
Now we will prove that either A or B is also a stopping point.
</P>

<P>
Again, assume the contrary, that neither A nor B is a stoppoing point. This
means that the tape value at A-1 is the same as A, and the tape value at B-1
is the same as B, on BOTH sides. If the sum of the values of both sides at
A-1 is NOT the same as the sum of the values of both sides B, then we could
move both switching points either left or right one second (preserving
points C and D) to get a better solution than the optimal - obviously a
contradiction. Thus these sums must be the same, which means we can keep
shifting until either A or B is a stopping point. If it happens that during
this shift, A becomes equal to C or B becomes equal to D, we have found that
the optimal solution can be yielded with only one side switch, in which case
we can use another solution.
</P>

<P>
It's also important to realize that both of these conditions hold together
simulataneously, since the shifting of A and B doesn't affect C and D and
vice versa.
</P>

<P>
When switching sides only once is required to get the optimal solution, it's
slightly easier. We now only have three points, call them A, B and C, where
A and B is the start and stop point and C is the switching point. Now either
A or B is a stopping poing (as shown above) and if we know A and B, we can
calculate where C must be (usually two different places is possible, both
must be checked). So the complexity for this case is O(N*M).
</P>

<P>
Altogether the best (??) solution is O(N*M^2) where N is the length of the
tape and M is the number of songs. I'd be very interested if anyone could
figure out an even faster algorithm.
</P>


  
<IMG SRC="/i/m/ZorbaTHut_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;ZorbaTHut<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
               </TD>
               <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR>
               <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>      
            <TR>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>   
            <TR>
               <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
         </TABLE>
      </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

   <!-- Gutter -->
      <TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   <!-- Right Column Begins -->
      <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
   <!-- Right Column Ends -->
   <!-- Gutter -->
      <TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


