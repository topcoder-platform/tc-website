<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/stat?c=round_overview&er=5&rd=10770">Match Overview</A><br>
    <tc-webtag:forumLink forumID="516056" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 359</span><br>Saturday, July 21, 2007
<br><br>



<h2>Match summary</h2> 

<p>
In Division 1, 
<tc-webtag:handle coderId="19849563" context="algorithm"/>
made a strong start with the first submission on
the 500, but fell behind as he was overtaken by competitors submitting
fast 1000s. At the start of the challenge phase, 
<tc-webtag:handle coderId="8355516" context="algorithm"/>
was in first
with a very fast submissions on the 250 and 1000. Unfortunately, his
500 failed system testing. This left 
<tc-webtag:handle coderId="22657480" context="algorithm"/>
as the surprise winner
and <tc-webtag:handle coderId="9958883" context="algorithm"/> in second place, with reds 
<tc-webtag:handle coderId="269554" context="algorithm"/>,
<tc-webtag:handle coderId="7433858" context="algorithm"/>
and
<tc-webtag:handle coderId="8362207" context="algorithm"/>
rounding out the top 5.
</p>

<p>
In Division 2, coders faced a harder than usual hard problem.
Many of the submissions were successfully challenged, and system tests
took down many of the rest. Only three submissions survived, and these
put 
<tc-webtag:handle coderId="22687073" context="algorithm"/>,
<tc-webtag:handle coderId="22651527" context="algorithm"/>
and 
<tc-webtag:handle coderId="16063200" context="algorithm"/>
in the top places.
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7707&amp;rd=10770" name="7707">CricketScores</a></b> </font> 
<A href="Javascript:openProblemRating(7707)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516056" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      533 / 654 (81.50%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      505 / 533 (94.75%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>bozzball</b> for 246.31 points (3 mins 29 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      185.84 (for 505 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Cricket seems a simple enough game to those of us who live in
cricket-playing nations, but trying to explain it to the uninitiated
turns out to be quite complex. Once you've understood the basics of the
game, the coding is straightforward. You need a two-element array to
hold the two scores, and an index, which is either 0 or 1, to keep
track of which batsman is going to face the next ball. After each ball,
you add the runs to the appropriate array entry, then flip this
variable (x = 1 - x works nicely) if the number of runs was odd. You
also flip it (possibly for the second time) after every sixth ball.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7702&amp;rd=10770" name="7702">DriveFailures</a></b> </font> <A href="Javascript:openProblemRating(7702)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516056" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      263 / 654 (40.21%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      237 / 263 (90.11%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>lihuansen</b> for 496.71 points (2 mins 19 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      320.69 (for 237 correct submissions) 
    </td>
  </tr>
</table></blockquote> 

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
      518 / 551 (94.01%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      512 / 518 (98.84%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>JongMan</b> for 248.94 points (1 mins 51 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      211.81 (for 512 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
It is possible to solve this problem with dynamic programming, but the
small constraints make it unnecessary. Simply consider every possible
subset of the drives, and compute the possibility that exactly that
subset is working. For example, the probability that drives 0, 1 and 3
out of 5 drives will work is (p0)(p1)(1-p2)(p3)(1-p4). Then add each
probability to the appropriate element of the output array.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7862&amp;rd=10770" name="7862">UTF8Decode</a></b> </font> <A href="Javascript:openProblemRating(7862)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516056" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      14 / 654 (2.14%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      3 / 14 (21.43%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ikki</b> for 586.69 points (28 mins 29 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      538.59 (for 3 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Wikipedia has a nice <a href="http://en.wikipedia.org/wiki/UTF8">page</a> with
lots of information about UTF-8. One of the facts that can be found is that
certain bytes never appear in a valid UTF-8 file: 0xC0 and 0xC1 are illegal
because they would start a two-byte sequence for a value that should be
encoded with one byte, and 0xF5 and above would encode values greater than
0x10FFFF. Any value from 0x00 to 0x7F is a valid one-byte character, and any
value from 0xC2 to 0xF4 is a valid start of a multi-byte character, the rest
of whose bytes must be in the range 0x80 to 0xBF.
</p>

<p>
Unfortunately, this is not the end of the story, as we still need
to take care of</p>
<ul>
    <li>Values over 0x10FFFF. If the first byte is 0xF4, then the
    next byte must be at most 0x8F.</li>
    <li>Overlong sequences, which are values encoded using more bytes than
    they should (e.g., values less than 0x7FF encoded using 3 or 4 bytes).
    If the first byte is 0xE0, then the next byte must be at least 0xA0,
    and if the first byte is 0xF0, then the next byte must be at least
    0x90.</li>
</ul>

<p>
This is the exact approach taken by 
<tc-webtag:handle coderId="22687073" context="algorithm"/>,
but no other competitor
succeeded with it. Rather than working out the rules, it is easier to
write general code that determines whether a byte is valid.
Suppose we have some bytes that we have accepted but not yet formed
into a complete character, and
we are examining a candidate byte. We can provisionally add this byte
to the sequence, then check whether it is a prefix of a valid sequence.
<tc-webtag:handle coderId="22651527" context="algorithm"/>'s
elegant
<a href="http://www.topcoder.com/stat?c=problem_solution&amp;rm=265601&amp;rd=10770&amp;pm=7862&amp;cr=22651527">solution</a>
checks for the smallest and largest values
that could be built from the partial character we have, and checks
whether that range overlaps the valid range for the sequence length.
<tc-webtag:handle coderId="16063200" context="algorithm"/>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&amp;rm=265589&amp;rd=10770&amp;pm=7862&amp;cr=16063200">solution</a>
generates the encodings of all 1114112 characters in
advance, then uses that to check whether a partial character is a
prefix of any full character. He managed to make it fast enough using a
linear search, but a feature of UTF-8 is that the byte sequences are in
lexicographical order, making it possible to binary search the list.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7701&amp;rd=10770" name="7701">CropCircles</a></b> </font> <A href="Javascript:openProblemRating(7701)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516056" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      343 / 551 (62.25%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      126 / 343 (36.73%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Abednego</b> for 467.30 points (7 mins 37 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      302.45 (for 126 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
There are two ways in which the number of circles may be lower than
expected: three points may lie on a straight line (and hence fail to
form a circle), or four or more points may lie on the same circle.
Armed with the <a
    href="http://www.topcoder.com/tc?module=Static&amp;d1=tutorials&amp;d2=geometry1#cross_product">cross
    product</a>, it is a simple matter to identify
straight lines. Let's see how to count the number of unique circles
from those that remain. Let each circle be defined by the first
(smallest index) three points that lie on it, in order. In order to
check if an ordered triplet is in fact a defining triplet, it suffices
to check whether these three points are concyclic with any point before
the last of the three. So once we have a method for checking whether
four points are concyclic, we can proceed.
</p>

<p>
The circumcentre of a triangle can be found by taking the <a
    href="http://www.topcoder.com/tc?module=Static&amp;d1=tutorials&amp;d2=geometry2#circle">intersection
    of two perpendicular bisectors</a>. So a straightforward approach is to
use this to find the center of three of the four points, then of a different
subset of three, and check if they coincide. The constraints are low enough
that no fancy integer arithmetic is required.</p>

<p>
A more compact solution found by several competitors (see 
<tc-webtag:handle coderId="7433858" context="algorithm"/>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&amp;rm=265567&amp;rd=10770&amp;pm=7701&amp;cr=7433858">solution</a>
for a clean implementation that works in integer arithmetic)
is based on Ptolemy's theorem: ABCD is a cyclic quadrilateral if and
only if AB.CD + AD.BC = AC.BD.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7854&amp;rd=10770" name="7854">BubbleSortIterations</a></b>
</font>
<A href="Javascript:openProblemRating(7854)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516056" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      117 / 551 (21.23%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      100 / 117 (85.47%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>{dano}</b> for 929.98 points (7 mins 54 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      641.91 (for 100 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Start by considering just the smallest element: on each iteration of
the bubblesort, it will move one place toward the front, until it is in
the first position. So the number of iterations required for it is
simply its original index.
</p>

<p>
Now consider some arbitrary intermediate order, and the effect of
running an iteration over it. The smallest element moves one place to
the left, but it has no effect on what happens to the other elements -
they end up in the same order as if the smallest element wasn't there.
The number of iterations required for the second-largest element is
thus its index once the smallest element is removed. Put another way,
it is the number of elements that are both larger than it and before it
in the original array. The same logic can be repeated to remove each
successive element in turn, and the same rule applies: the number of
iterations required to correctly position X is the number of elements
larger than X that occurred before X. The number of iterations required
to sort the whole array is simply the largest of these values.
</p>

<p>This can be computed in O(N.log N) time using either a clever
algorithm or a clever data structure, which was my intended solution,
but many competitors noticed a simplification and makes this much
easier to code. Consider the rightmost item which required the largest
number of iterations. There cannot be any number after it which is no
greater than it smaller, since otherwise that number would have at
least as many larger numbers before it, and it would be better. This
means that every time this item is swapped, which is every iteration,
it will move to the left. The number of iterations is thus the distance
between its initial and final positions. Thus, the answer is simply the
maximum movement towards the front of any element.
</p>
<br /><br />






<div class="authorPhoto">
    <img src="/i/m/bmerry_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="251074" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
