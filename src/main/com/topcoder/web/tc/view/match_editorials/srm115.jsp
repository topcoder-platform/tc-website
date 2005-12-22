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
<tc-webtag:forumLink forumID="505532" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 115</span><br>Monday, September 30, 2002
<br><br>

<H1> 
The Problems 
</H1> 

<font size="+2"><b>CoinStacks</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505532" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 1:
  <blockquote>
    <table cellspacing="2">
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
        <td style="background: #eee;" class="bodyText">207 / 247 (84%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">90 / 207 (43%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>dudedude</b> for 275.69 points
                </td>
      </tr>
    </table>
  </blockquote>
  
<P>
One of the more annoying problems, this was a straight-forward simulation.
Just code the rules, in order, and you'd get the right answer.
Unfortunately, mildly confusing wordiage made the problem trickier than it
had to be.
</P>

<P>
In all honesty, your best approach to this would be to simply avoid
thinking. Don't try to be clever, don't try to save time, just write code
that corresponds exactly to what they tell you to do, one coin (or five
coins, depending on the step) at a time. Since the number of coins is
limited to 10,000 you won't have any speed problems. Many failed solutions
included attempts to speed up the execution, or avoid having to write as
much code, and obviously this is a bad idea if your resulting code doesn't
work.
</P>

<P>
dudedude managed his high score with some clever tricks to reduce coding
time, proving that yes, it can work. Judging by the number of people whose
tricks failed, I wouldn't consider it worth the risk, though kudos to him
for pulling it off.
</P>

<p>&#160;</p>

<font size="+2"><b>Mail</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505532" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 2 &amp; Division-I, Level 1:
 <blockquote>
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
        <td style="background: #eee;" class="bodyText">500 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">142/247 (57%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">76/142 (54%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>UFP2161</b> for 395.88  points
                </td>
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
        <td style="background: #eee;" class="bodyText">128/134 (96%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">89/128 (70%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>ZorbaTHut</b> for 233.09   points
                </td>
      </tr>
    </table>
  </blockquote>
<P>
Definitely another case of "don't try to be too clever". The easiest way to
do this was first to make an array of 0's, the same size as the number of
offices. Then for each letter, find the score for each office relative to
that letter. Keep the best one. If it's 10 or above, add one to the array
item for that office. Otherwise move on.
</P>

<P>
Finding the score, however, proved slightly trickier. A lot of potentially
painful code. Some people decided to do one pass through both zip codes and
just do the tests in the appropriate order. I personally passed through once
for each test and changed the digits in each code to something that would
never match up ('a' for the first code, 'q' for the second - 'b' wouldn't
work because 'b' is one character away from 'a', so it would have matched
the off-by-one test!)
</P>

<P>
In any case, once that part was working, the problem was solved.
</P>

<font size="+2"><b>Shaws</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505532" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 3:
 <blockquote>
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
        <td style="background: #eee;" class="bodyText">17/247 (7%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">3/17 (18%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>fiddlybit</b> for 540.06 points
                </td>
      </tr>
    </table>
   </blockquote>
<P>
Definitely not the kind of problem I'd do for fun, with lots of - if you'll
excuse the expression - fiddly bits. On first inspection this problem looks
like pure death. Tons of special cases and things you just plain don't want
to deal with. I've come up with a solution that seems relatively simple,
though.
</P>

<P>
You're going to need a few variables and arrays. First off, your output
string array - you're just going to be adding things on the end of this.
Second, you'll need a running total cost, started at 0. Third, you'll need a
running taxable total - I don't know about you, but I'd much rather not have
to go back and figure this out. Fourth, you'll need a flag for whether the
rewards card has been scanned yet. Fifth (yeah, I know, I'm sorry) you'll
need either one array or three arrays, to store the name, reward amount, and
taxability of any unclaimed rewards.
</P>

<P>
Does this sound painful to you? I know it sure sounds painful to me.
</P>

<P>
On the other hand, it turns out it's actually all quite simple.
</P>

<P>
First off you may want to parse the input arrays into something useful. I
personally would end up doing a map&lt; string, Item &gt; with a custom Item
class. Some people might find it easier to just have a set of four arrays:
"name", "taxability", "cost", and "rebate". Searching through all 50 items
will be fast enough, we're only going to be doing it 50 times. Not a
problem. The actual mechanics of the parsing and arrays depend entirely on
your language, and I'm a C++ coder - arguably the worst TopCoder language at
parsing - so I'll leave the parsing up to you.
</P>

<P>
Now, as for the actual process . . .
</P>

<P>
Read an item in. If it's the rewards card, add "Rewards Card Scanned" to
your output array and flip on the "rewards card" flag. If it's not the
rewards card, check your arrays. Add the appropriate string to the output
array ("Itemname: cost" or "Itemname(T): cost" if it's taxable), add to the
total cost and the taxable total (if applicable) and, here's the interesting
part, add the rebate information to the end of your rebate array. No, not to
the output array!
</P>

<P>
Then, if your reward card flag is set, *now* take everything in your rebate
array - no matter how many that might be - and add them one at a time to
your output array, removing the appropriate amounts from your total cost and
your taxable total as you go (which you have cleverly stored in your rebate
array, to keep you from having to look them up again.) And then clear your
rebate array. If your reward card flag is *not* set, just leave your rebate
array intact and move on.
</P>

<P>
Once you're done with your array, add tax, if applicable - make sure you
don't accidentally write "Tax: 0" - and then print out the total.
Congratulations, you're done.
</P>

<P>
Now, as for why that thing with the rebate array works . . . If you don't
have a rebate card scanned in, you'll just accumulate more and more items as
you go. If you do have it scanned in, it'll end up dumping the rebate for
each item immediately after the item. If you go halfway, it'll end up
dumping *all* the rebates for all the previous items immediately after the
rebate card. Which is exactly what you want.
</P>

<P>
So there's *that* problem. Moving on.
</P>

<font size="+2"><b>Animals</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505532" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 2:
  <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">450 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">73/134 (54%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">36/73 (49%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>ZorbaTHut</b> for 440.73 points
                </td>
      </tr>
    </table>
   </blockquote>
<P>
Look at that score. So, what's your secret, you're asking? How did you do it
so fast?
</P>

<P>
"Animals" is a textbook dynamic programming problem. Literally textbook.
Make a big array, "feet" by "heads" large. I added a little buffer around
the edge so I didn't have to worry about bounds, and even hardcoded the size
to be the maximum size. I'll snag whatever data I want out of the middle.
Initialize the entire thing to 0, except the 0,0 point, which should be set
to 1 (after all, it's easy to have zero heads and zero feet - it's called
having zero animals.)
</P>

<P>
Now, for each animal, you want two nested loops. If we could have
negative-legged animals we'd want the "legs" loop to be the inner one, but
we can't, so I believe either way works. Now, if we have animal "curanimal",
"curheads" heads, "curlegs" legs, and animal leg counts "legcounts", we end
up with the line animalcombinations[ curheads + 1 ][ curlegs + legcounts[
curanimal ] ] += animalcombinations[ curheads ][ curlegs ]. Representing
adding one animal of the current type to whatever combinations we currently
have.
</P>

<P>
Then we return animalcombinations[ goalheads ][ goallegs ]. And we're done.
</P>

<P>
Yes, it's possible for this to return 0 (1 head, 2 legs, but it has to be
all cows - can't be done.) This solution does so easily.
</P>

<P>
Note that it's possible to do this with nested loops. Not fun, but possible.
I wouldn't believe it if I hadn't seen it, but vorthys's solution in Room 1
took down four challengers before people gave up trying, and made it
straight through systests.
</P>

<font size="+2"><b>Uniscraper</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505532" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 3:
 <blockquote>
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
        <td style="background: #eee;" class="bodyText">21/134 (16%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">6/21 (29%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>Yarin</b> for 649.87 points
                </td>
      </tr>
    </table>
   </blockquote>
   
<P>
I don't know about you, but I get scared when I see an 1100pt problem. 1100
points is a lot. And that might have something to do with my
overly-efficient solution.
</P>

<P>
Now, a solution that *works* is much simpler than mine.
</P>

<P>
In effect, it's just another dynamic programming deal. For any possible
combination of board layout and current card, there may be half a dozen ways
to get there, but only one "best" way. In this case, "best" is defined as
"lexicographically smaller". You can throw out all the other ways to get
there, they will never be better than the lexicographically smaller one.
This gives us a lot of options.
</P>

<P>
The easiest way, by far, is to represent the current state as a large
string. In fact, as the large string that's given to you as input. Hey, it
works, and it's cacheable. Your function should check the cache for that
string and return what's there if there is something. If there isn't, it
should just check all possible moves and recursively call itself, choose the
best of those moves, tack its own card on the beginning of that move list,
and return that. If there are no valid moves it should return an empty move
list.
</P>

<P>
Yes. That's all there is. I'm not joking here, and it works.
</P>

<P>
Part of the *reason* it works is a very limited number of possible board
states. The card numbers are set from the beginning. The only thing that
varies is whether a card is there or whether a card is not there. 36 board
positions would seem to yield almost 70 billion possible states, but most of
those aren't valid. For example, you can't have a solid pyramid with the tip
of it removed. There's no way to remove the tip, it's still full!
</P>

<P>
It turns out, for reasons I do not pretend to have the math background to
understand, that the number of states can be represented by a series called
Catalan numbers. With a height of 8, we end up with the 9th Catalan number,
or 4862 states. 4862 is not very many at all - consider this is *all* the
possible states, including all run lengths. In fact we'd have to go up to a
height of 11, with 208012 states, before I'd even begin worrying about
speed, and you might even be able to manage a height of 13 - 2674440
states - before things started breaking.
</P>

<P>
In any case. 4862 is a very small number of states, and so this apparently
brute-force solution will, in fact, work beautifully.
</P>

<P>
Stop here if you want to keep your sanity. If you want to read about my
solution, which finishes the worst case in a hundreth of a second, read on.
My solution would be great if we had an enormous height - as it is, it's
rather redundant.
</P>

<P>
In my case, I did many evil things involving bitmasks. I represented the
board as 36 bits (stored in a 64-bit int), one for each card. From there I
made an associative array, with that bitmask and an integer ("current card
value") used for finding an array of ints. Each step I'd take every item in
that array, make all possible moves, and put it into a new array. Any board
states I already had, I'd throw away the inferior move order and replace it.
Then I'd basically swap arrays and do it again, until I ended up with zero
states in the new array - in which case it was merely a matter of searching
through the previous array for the best chain of that length. This is, in
effect, a breadth-first search.
</P>

<P>
But wait! The process of "making all possible moves", which I've glossed
over, was a bit trickier than that. I'd loop from 0 to 36 - one for each
possible move. First I'd check to see if the card in that location would
work with the card I had (the card locations were a global array, since they
never changed.) Then I'd make sure that card actually *existed*. And then
I'd refer to another global array, this one of 64-bit bitmasks, representing
which cards couldn't exist for this move to be valid. Some of them were
simply 0 (the bottom cards, which obviously have no requirements to use),
but the rest included two bits set to 1. I'd do a bitwise-and with my bit
array, and if there were any bits left 1, that meant there were cards in the
important locations, and I couldn't make that move.
</P>

<P>
So there's my complex unnecessary solution. But it sure is fast!
</P>

<P>
And it sure took a long time to debug.
</P>

<P>
This competition's lesson: never make things more complicated than they have
to be.
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

