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
<tc-webtag:forumLink forumID="505639" message="Discuss this match" /></div>
<span class="bodySubtitle">2004 TopCoder Collegiate Challenge <br> Online Round 1</span><BR/>Saturday, February 28, 2004
<br><br>

<span class="bigTitle">Summary</span>

<p> 
With some of the fastest submission times, and some of the highest scores seen
in recent times, the first round of the Collegiate Challenge 2004 proved to be
an exciting event.  An ambiguity in the medium problem which slipped past the
testers and I caused quite a bit of confusion on what should have been a very
simple medium problem.  It ended up costing many dearly, as the success rate of
the medium problem was much lower than the other two problems, and in fact,
more people successfully submitted the hard problem than the medium.  However,
due to a very easy level 1 problem, the zero void did not consume otherwise
eligible contestants as it did for some of the qualification rounds.
</p> 
  
<p>
In just under 2 minutes, <b>antimatter</b> started off the match with a 199 point
submission for the level 1.  After that, watching the scoreboard was like
watching the lights in a house turn on after a loud noise woke everyone up.
Within a few minutes, almost every room had a score on the board.  Oddly enough, very early on in the competition a green coder by the name of 
<b>yuranlu</b>
had submitted all three problems, making it clear that his only intention for
participating was to receive a free t-shirt.  At the end of the coding phase, <b>antimatter</b> had edged
out the favorite, <b>tomek</b>, by about 3 points.  However, both coders weren't
finished yet.  <b>tomek</b> fought back with a challenge, which <b>antimatter</b> answered
with his own.  But late in the challenge phase, <b>tomek</b> submitted another
challenge against the same coder, propelling him to his first tournament round
win.  Returning champion <b>dgarthur</b>, and tournament regulars <b>ZorbaTHut</b> and <b>reid</b> rounded out the top 5.</p>

<H1> The Problems </H1> 

<font size="+2"> <b>Hawaiian</b> </font> 
<A href="Javascript:openProblemRating(2358)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505639" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      363 / 376 (96.54%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      339 / 363 (93.39%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>antimatter</b> for 199.03 points (1 mins 59 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      178.66 (for 339 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Aloha!  This problem asks you to identify words that only consist of a given
set of characters.  There are two parts to this problem -- the tokenization of
the words, and the identification of Hawaiian words.  </p>

<p>
First, the tokenization.  Java has the split method for string, and
StringTokenizer, giving it an advantage.  C++ users can use istringstream to
parse the words. I'm not too familiar with C# and VB.net, so I'm not sure how
it's done there.  In any case, tokenization is a well-solved problem here at
topcoder, and should be in every coder's library of knowledge.
</p>

<p>
Next, the identification of Hawaiian words.  The easiest way to do this is with
regex in Java:
</p>

<pre>
if(word.toLowerCase().matches("[aeiouhklmnpw]+"))
</pre>

<p>
Of course, checking each character is the language agnostic method, and works
very efficiently.  The last step is to add all matched words to an array and
return that array.
</p>


<font size="+2"> 
<b>FlowerGarden</b> 
</font> 
<A href="Javascript:openProblemRating(1918)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505639" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Level Two: <blockquote><table cellspacing="2"> 
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
      230 / 376 (61.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      109 / 230 (47.39%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 469.94 points (7 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      311.32 (for 109 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This problem is pretty simple to solve -- as long as you are solving the
correct problem!  A subtle ambiguity in the problem statement made the problem
seem more difficult than it really was.  For those of you who missed the
broadcast, the problem statement will be updated soon to make the statement
clear for the practice room.  In short, you are looking to make flowers which
are closest to the front of the garden as tall as possible, not trying to put
the tallest flower as close as possible.
</p>

<p>
Sorting the flowers in this garden isn't as simple as writing a sort comparison
routine, because you can't always tell what the ordering will be with just two
elements.  In reality, the ordering is easy to compute if you think about the
flowers one at a time.  The first step is to determine which flowers cannot go
in front of other flowers.  This is done by comparing the bloom date of each
flower with the bloom and wilt date of every other flower.  If two flowers
conflict, then the bloom date of one will lay between the bloom and wilt date
of the other.  Within a conflict, the larger of the two cannot be placed in
front of the other, or blockage will occur.
</p>

<p>
When figuring out which type of flower to place next, you can only place
flowers that can go in front of all the flowers left to place.  Of those, you
should place the type which is tallest.  For the next type, the flower type
just placed no longer can be blocked, so it could allow more flower types to be
placed.  Because there can be no circular dependencies, this algorithm can be
used to place the entire garden.
</p>

<font size="+2"> 
<b>RockSkipping</b> 
</font> 
<A href="Javascript:openProblemRating(1954)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505639" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Level Three: <blockquote><table cellspacing="2"> 
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
      134 / 376 (35.64%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      119 / 134 (88.81%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>mathijs</b> for 958.39 points (5 mins 58 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      731.11 (for 119 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
A simple-minded simulation of rock skipping, this problem asks you to determine
how successful the skipping of a rock will be on a lake riddled with lily pads.
This problem requires DP or memoization as a simple DFS would most certainly
time out.  There are two ways to represent the state of the system.  One is to
represent each state as the distance from the shore, combined with the number
of skips left in a 2 dimensional array.  The other method is to reduce the lake
into one pattern, and assume rocks that travel off the edge of the pattern on
the right, re-enter the lake from the left.  Since the pattern repeats every n
characters, the space which is D spaces from the shore can be represented by
the pattern space D % n.  In this method, each skip creates a new set of
probabilities which continues with the next step.
</p>

<p>
I'll go over the specifics of the first method.  If each skip travels the
maximum distance, the furthest space acheived will be the sum of all the
numbers from 1 to maxDist.  The formula for this sum is maxDist * (maxDist + 1)
/ 2.  With maxDist = 100, this comes out to a 5050x100 array.
</p>

<p>
The base is the first lake space, which is represented by state[0][maxDist],
and we set its probability to 1.0.  Then for each lake space and each number of
skips left (n), the probability is spread over the n spaces ahead evenly.  If
we traverse the lake in increasing distance from the shore, then we will be
sure to get to each space and each number of skips left after all the spaces it
depends on.  However, we will not process spaces which have lily pads, and each
time the number of skips left reaches 0, we add the probability to a global
variable which represents the successful rock skips.  After processing the
entire lake, the global variable will contain the probability of a successful
skip.
</p>

<p>
The second method is similar, but I'll leave it as an exercise for the reader.
</p>


<p>
<img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="273217" context="algorithm"/><br />
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

