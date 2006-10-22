<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
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
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
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
<tc-webtag:forumLink forumID="505680" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 211</span><br>Tuesday, September 14, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p>

Just as every good rock band has a warm-up act and every fine meal
starts with an appetizer, the second round of the 2004 TopCoder Open
was preceded by an early-morning match. Call it the Time Zone Special:
it was a dewy 6 a.m. in Silicon Valley and a coffee-scented 9 a.m. at
TopCoder headquarters when the competition got underway, but a leisurely
3 p.m. in Oslo and a convenient 6:30 p.m. in Bombay, where in the past
they've typically landed the graveyard shift. Despite the new scheduling
and the looming prospect of the tournament round, a respectable roll of
400 competitors gathered for a quick coding session.

</p>
<p>

An eagle-eyed <b>jshute</b> spotted stack overflows that earned him
three successful challenges, yet he would have won the match without
lifting a finger during the challenge phase. "Feh," read the official
statement of <b>m00tz</b>, who found himself sitting pretty in second
place. (Are those zeros in his handle, or are they capital O's? I charge
obfuscation!) And <b>LunaticFringe</b> proved that he is, as he puts it,
"back, baby!" by notching a third-place finish. In Division Two, a trio
of first-time coders&#151;<b>tdeepakmanohar</b>, <b>iNHuMaToR</b>, and
<b>LuckyLibran</b>&#151;surged to the top of the scorecard, vaulting
them into the far less cushy ranks of Division One.

</p>



<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2996&amp;rd=5857" name="2996">grafixClick</a></b>
</font>
<A href="Javascript:openProblemRating(2996)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505680" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      300
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      195 / 202 (96.53%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      183 / 195 (93.85%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>LuckyLibran</b> for 296.69 points (3 mins 0 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      254.70 (for 183 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Go look at the problem statement, if you haven't already, and feast
your eyes on the magnified illustration of the Save button. I have it on
good authority that a team of designers spent minutes, entire minutes,
assembling that <i>objet d'art</i>. Each pixel was hand-painted with a
particular shade of blue chosen in consultation with two portrait painters
and a monkey. Furthermore, because all of the button's pixels lie between
two fixed columns and two fixed rows, the task of determining whether
a mouse click falls on one of them is an exercise in inequalities and
ampersands. You should be fine as long as you keep your rows and columns
straight. In window coordinates, remember, the vertical distance from
the origin is specified first, whereas Cartesian coordinates give the
horizontal distance first.

</p>
<p>

Then there's the business of putting the mouse-click indices into an
array. The orthodox way to do this depends on your choice of language. In
Java, you could push the indices into a <code>Vector</code>, then dump
its contents into an <code>int[]</code>. There are dynamic-array classes
in other languages, too, but you can always do without them. Instead,
run through the mouse clicks twice, the first time to count how many of
them activate the Save button. This lets you allocate a static array of
requisite size, and on the second pass you can fill it with the indices.

</p>



<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2997&amp;rd=5857" name="2997">grafixCorrupt</a></b>
</font>
<A href="Javascript:openProblemRating(2997)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505680" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      400
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      187 / 202 (92.57%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      170 / 187 (90.91%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>agilag</b> for 399.86 points (0 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      353.68 (for 170 correct submissions)
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
      173 / 175 (98.86%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      171 / 173 (98.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 249.17 points (1 mins 38 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      242.46 (for 171 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

So there's a word made of <i>n</i> letters, and you're looking through
a dictionary of <i>n</i>-letter words to find one that shares the most
characters with it and comes earliest in the dictionary, in that order of
preference. Think about the problem this way: when you're considering a
given word in the dictionary, you already have in mind the best candidate
among all the words you've seen previously. So the question is whether
the current word is even better than that.

</p>
<p>

If the current word and the previous best word both have the same
number of characters at the same positions as the target word, or if
the current word has fewer, then the previous best is still the best,
so you move on. But if the current word has more shared characters, it
becomes the new best candidate. Instead of storing the best candidate
itself, you should store its number of matching characters and its array
index. This lets you perform further comparisons with ease, and once
you've gone through the dictionary, you have the best index in hand,
ready to return. And when you start out with the first word in the
dictionary? The best index previous to that is -1, as defined by the
problem statement, and the greatest number of shared characters is zero.

</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2999&amp;rd=5857" name="2999">grafixGlobs</a></b>
</font>
<A href="Javascript:openProblemRating(2999)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505680" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      900
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      100 / 202 (49.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      67 / 100 (67.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>sosiBularca</b> for 677.16 points (17 mins 33 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      443.02 (for 67 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

A sequence of image-grouping instructions are coming at you. You
have to parse the instructions and simulate their execution, keeping
track of which images, or <i>objects</i>, belong to which groups, or
<i>globs</i>. At this juncture, I should admit that I have a weakness
for built-in string manipulation. Although I consider myself a stoic
programmer in general, preferring to code my systems in C++ or straight
C, I'll run crying to a higher-level language when an impromptu parsing
problem comes along. Given the selection of languages available in the
Arena, this means I'll reach for Java's <code>String</code> class and,
in this case, its <code>split</code> method.

</p>
<p>

Here's what I would do. After parsing the current instruction and reading
its numerical operands, if any, with the <code>Integer.parseInt</code>
static method, I want to record its effect on the glob world. The problem
doesn't require that I associate a unique identifier with each graphical
object, which would complicate matters. It's enough to remember how
many objects of each of the three types are currently in each glob, so
I declare a two-dimensional integer array of length 100 and width 3, as
it were. This lets me look up, for a given ID, the count of each of the
three object types. And why 100? With a maximum of 50 <code>make</code>
instructions, I'll never have more than 50 globs, but I allocate double
the necessary number as a matter of practice. RAM is cheap; segmentation
faults are not. It's also nice to have a boolean array to tell you which
of the 100 IDs are in use.  The rest is a matter of incrementing, summing,
and zeroing object counts as necessary.

</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2998&amp;rd=5857" name="2998">grafixMask</a></b>
</font>
<A href="Javascript:openProblemRating(2998)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505680" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      136 / 175 (77.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      106 / 136 (77.94%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Yarin</b> for 484.42 points (5 mins 7 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      320.39 (for 106 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Mask, schmask. Let me recast this problem into a different metaphor. You
have a 400-by-600 grid, rectangular portions of which are washed out by
the sea. The remainder forms an archipelago, each island being a maximal
collection of contiguous cells. Now, to tally the area of each island,
what do we do? Flood each one with more of the sea! The problem statement
is screaming <i>floodfill! floodfill!</i> at you, which should bring you
great relief because it amounts to a pleasant grid search in depth-first
or breadth-first order. But you have to be careful with the depth-first,
as I'll explain shortly.

</p>
<p>

The conceit here is that we're dealing with a bitmap's masking layer in
grafix, a fictional application that sprang from the problem writer's
fevered imagination. (Who ever heard of graphics software that combines
vector drawing with bitmaps? Preposterous!) Given the modest dimensions
of the masking layer, you can set up a boolean or integer array to mark
off pixels in the course of the search. If you're going to search using
depth-first recursion, think twice about the cost of function calls. The
stack size imposes a limit on how deeply you can recurse, and in some
language environments, the stack frame for each function call eats up a
large chunk of the stack. Using the TopCoder Java setup, I was unable to
code a depth-first recursion without running out of memory on the heavier
problem instances. However, the system tests let many coders get away
with it in C++, which I believe uses slimmer stack frames. Then again,
you could write a depth-first recursion manually, allocating an integer
array to use as your stack. As long as you're at it, you can use the
same integer array as a queue, just by pushing on items at the other
end. Then, of course, you're doing a breadth-first floodfill.

</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3000&amp;rd=5857" name="3000">grafixDither</a></b>
</font>
<A href="Javascript:openProblemRating(3000)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505680" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      900
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      47 / 175 (26.86%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      44 / 47 (93.62%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>m00tz</b> for 760.16 points (12 mins 40 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      500.91 (for 44 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

You're asked to implement the Riemersma dithering algorithm, which really
does work like this in practical applications, except it typically uses
a backlog of four or more pixels, rather than one, to compute the error
between source and target. The task of error propagation is just a facade
on the serious business of computing the path of the Hilbert curve through
a square grid. The problem statement describes this fractal by example,
showing its first three iterations and leaving up to you the task of
formulating a precise definition, which will lead almost directly to
an implementation.

</p>
<p>

One way to view the recursion is by rotating the four child cups in each
generation in relation to their parent. If we're looking at a parent
cup in such a way that it opens toward the top, then the links between
its children, starting from the upper left corner, go down, right,
and then up. The child cups themselves, counterclockwise from the top
left, are rotated thus in relation to the parent cup: a quarter turn
counterclockwise; not at all; not at all; a quarter turn clockwise. So
before descending recursively into each quadrant of the parent cup,
we should rotate our perspective accordingly.

</p>
<p>

I, however, had a crick in my neck from playing squash and didn't
want to swivel my head to analyze the problem, so I solved the problem
without explicit rotation. Instead, I consider each cup as a sequence
of three directed segments laid end-to-end at right angles. Eight such
sequences are possible, since a cup can open to the top, right, bottom,
or left, and for each of these orientations, the cup segments can be
laid in two directions. I assign an integer code to each of the eight
types of cup and to each of the four types of segment. Now, by looking
at the sample diagrams, I can figure out, for each of the eight cups,
(a) to what four child cups it gives rise and (b) what three segments
link the child cups. Hence, I have seven codes to precompute for each
of the eight cups. Once I've set up these 56 values in an array, I'm
nearly done. Look for my Java solution in the practice room.

</p>

<div class="authorPhoto">
    <img src="/i/m/Eeyore_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="273434" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
