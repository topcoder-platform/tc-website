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
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10798">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516075" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 378</span><br />Tuesday, November 20, 2007
<br /><br />



<h2>Match summary</h2> 

 

<p>In division 1, the mid-match division summary had a familiar sight:
<%-- Petr --%><tc-webtag:handle coderId="10574855" context="algorithm"/> sitting at the top. However, coders were faced
with a 500 that had a tempting but incorrect solution, and a 1000 with
some subtleties that were not exposed by system tests, and by the end
of the coding phase, <%-- Eryx --%><tc-webtag:handle coderId="8355516" context="algorithm"/> was in the lead. The 500
proved a ripe opportunity for challenges, and by the end of system
testing, only four 1000's had survived. <%-- gawry --%><tc-webtag:handle coderId="7390224" context="algorithm"/> won the
match and was the only contestant to solve all three problems, followed
by <%-- krijgertje --%><tc-webtag:handle coderId="9906197" context="algorithm"/> and <%-- JongMan --%><tc-webtag:handle coderId="7446789" context="algorithm"/>, each with
the 250 and 1000. <%-- asaveljevs --%><tc-webtag:handle coderId="8493941" context="algorithm"/> was the only other coder
to solve the 1000.</p>

<p>In division 2, the medium problem was simple to code but perhaps
less simple to understand, while the hard problem was fairly challenging.
<%-- Li_Mon --%><tc-webtag:handle coderId="22654735" context="algorithm"/> won the match with a very quick solution to the
hard, while newcomers <tc-webtag:handle coderId="22705587" context="algorithm"/>
and <tc-webtag:handle coderId="22664646" context="algorithm"/> placed 2nd and
3rd.</p>

 

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8304&amp;rd=10798" name="8304">TwoRotationCypher</a></b>

</font>

<A href="Javascript:openProblemRating(8304)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516075" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division Two - Level One: <blockquote><table cellspacing="2">

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

      582 / 717 (81.17%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      551 / 582 (94.67%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Delusion</b> for 248.43 points (2 mins 15 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      170.51 (for 551 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>There are no tricks here: just process the string one character at a
time, applying the rules. If a character <code>c</code> is not a space,
then it is in the first group if <code>c &lt; 'a' + <b>firstSize</b></code>.
In this case, it is replaced with <code>'a' + (c - 'a' +
<b>firstRotate</b>) % <b>firstSize</b></code>. If it is in the second
group, the code is similar but
<code>'a'</code> is replaced by <code>'a' + <b>firstSize</b></code>,
<b>firstRotate</b> by <b>secondRotate</b>, and
<b>firstSize</b> by 26 - <b>firstSize</b>.</p>

<p><%-- 3xP053r --%><tc-webtag:handle coderId="15553685" context="algorithm"/> submitted a short but clear 
<a href="/stat?c=problem_solution&amp;rm=267370&amp;rd=10798&amp;pm=8304&amp;cr=15553685">implementation</a>.</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8390&amp;rd=10798" name="8390">TrueStatements</a></b>

</font>

<A href="Javascript:openProblemRating(8390)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516075" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">

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

      512 / 717 (71.41%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      275 / 512 (53.71%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Effect</b> for 497.28 points (2 mins 6 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      401.33 (for 275 correct submissions)

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

      537 / 540 (99.44%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      451 / 537 (83.99%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Soultaker</b> for 249.50 points (1 mins 16 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      230.42 (for 451 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>Trying to make sense out of all the statements and from that work
out which are true is a recipe for a complicated and probably incorrect
solution. Instead, it is best to work backwards: take a guess at how
many statements are true, then check if you're right. In fact, you'll
find that a guess of T statements being true will fit the facts if and
only if there are T statements that say <q>Exactly T of these
statements are true.</q> All that is left is to try all possible
values of T (0 to 50) and return the largest one that fits, or -1 if
none of them do.</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8303&amp;rd=10798" name="8303">HanoiState</a></b>

</font>

<A href="Javascript:openProblemRating(8303)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516075" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">

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

      35 / 717 (4.88%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      17 / 35 (48.57%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Li_Mon</b> for 715.68 points (19 mins 37 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      473.14 (for 17 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
The Towers-of-Hanoi problem is a classic problem used to illustrate
recursion, and the variation in this problem is no exception. Let's
start by working out the optimal strategy, as a recursive procedure.
If the largest disc N is already in the right place, then it can be
completely ignored. Otherwise, suppose the largest disc needs to move
from A to C. We can do this as follows:</p>
<ol>
<li>Move discs 1 to N - 1 to peg B.</li>
<li>Move disc N disc to peg C.</li>
<li>Move discs 1 to N - 1 to their target positions.</li>
</ol>
<p>Now we need to turn this into an algorithm to find the state after
<b>moves</b> moves. To do this, we just need to work out which of the
recursive sub-problems above applies, and how many moves into that
sub-problem we are. Since step 1 above will take 2<sup>N - 1</sup> - 1
moves and step 2 takes exactly one move, this is not too difficult.</p>

<p>The only remaining complication is that when we are dealing with
step 3 above, discs 1 to N - 1 are on peg B instead of peg A. This is
easily handled by swapping the labels of pegs A and B in the target
string, and restoring the original labels on the return value.</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8273&amp;rd=10798" name="8273">SolvePolynomial</a></b>

</font>

<A href="Javascript:openProblemRating(8273)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516075" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      316 / 540 (58.52%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      43 / 316 (13.61%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>gawry</b> for 420.18 points (12 mins 53 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      249.97 (for 43 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>There are two parts to this problem: identifying candidate roots,
and testing which of them are actually roots. To start off with, if
a<sub>0</sub> = 0 then we can note that zero is a solution and divide
the whole polynomial by x. We can keep doing this until we get a
non-zero value for a<sub>0</sub>. Now let us write the
polynomial as P(x) = a<sub>0</sub> + xQ(x). It's clear that the second
term is always a multiple of x, so for P(x) to be zero, a<sub>0</sub>
must be a multiple of x as well. A loop up to the square root of
a<sub>0</sub> is a sufficient way to find all the factors, although
some coders computed a complete factorisation into primes.</p>

<p>Next, we need to test these candidate roots. The obvious approach
is simply to evaluate the polynomial for each candidate and check
whether it comes out as zero. However, to make this calculation
accurate, it is necessary to use big integers, and this makes the cost
of testing each candidate quadratic in <b>n</b>. Since there can be up
to 2688 candidates, this is too expensive.</p>

<p>A better alternative is to ask whether P(x) = 0, or more generally
whether P(x) = y, without actually computing P(x). This is equivalent
to asking whether y - a<sub>0</sub> = xQ(x). If x does not divide y -
a<sub>0</sub> then the answer is of course no; otherwise, it is
equivalent to asking whether Q(x) = (y - a<sub>0</sub>) / x. This is a
question of the same form, but of lower degree, so it can be answered
recursively. See <%-- Smylic --%><tc-webtag:handle coderId="22629574" context="algorithm"/>'s
<a href="/stat?c=problem_solution&amp;rm=267341&amp;rd=10798&amp;pm=8273&amp;cr=22629574">solution</a>
for an implementation of
this approach.</p>

<p>Most coders just evaluated the polynomial modulo some number, and
hoped that it would never equal a multiple of that number. Variations
included working implicitly modulo
2<sup>32</sup> or 2<sup>64</sup> (by just ignoring overflow in 32- or
64-bit integers), modulo some prime, and modulo each of a collection of
primes (which is equivalent to working modulo their product, but
without the headaches of big integers). This
is incorrect unless the modulus is astronomically large (larger than
the maximum possible value of P(10<sup>9</sup>)), but there is no way
to check for every possibility in the system tests. On the other hand,
it made the challenge phase more important and more lucrative than
usual, since it is
relatively easy to construct a challenge case once you have the
modulus.</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8282&amp;rd=10798" name="8282">TwistyPassages</a></b>

</font>

<A href="Javascript:openProblemRating(8282)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516075" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      31 / 540 (5.74%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      4 / 31 (12.90%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>krijgertje</b> for 592.78 points (27 mins 58 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      508.42 (for 4 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>The key to the problem is to consider each possible orientation of each
room as a separate entity; call this an <i>oriented</i> room. Two
oriented rooms A and B can be told apart if</p>
<ul>
<li>they are of different types (different number of passages); or
<li>corresponding passages from A and B lead to oriented rooms that can
be told apart.</li>
</ul>
<p>This definition is recursive and it is not clear where to start, since
the definition may cycle back on itself. The trick is to start by
assuming that oriented rooms of the same type are all
indistinguishable, then use a flood-fill to propagate information about
oriented rooms that are distinguishable. One way to formalise this is
to see pairs of oriented rooms as nodes on a graph, the first condition
as seed nodes, and the second condition as edges for flood-filling.</p>

<p>For it to be possible for two rooms to be told apart (regardless of
orientation), it must be possible to tell them apart at any
orientation. An easy mistake to make is to decide that isolated rooms
(with zero passages, and thus perhaps zero orientations) can be told
apart, whereas of course any sealed room looks the same as any
other.</p>

<p>Implementing all this as described should pass system tests (as seen with
<%-- gawry --%><tc-webtag:handle coderId="7390224" context="algorithm"/>'s <a
href="/stat?c=problem_solution&amp;rm=267327&amp;rd=10798&amp;pm=8282&amp;cr=7390224">solution</a>),
but it can be made more efficient. A simple optimisation is to note that
rotating both rooms in a pair of oriented rooms does not really change
anything, since the same pairs of passages will correspond. Thus the
states in the graph can be described by two rooms and their relative
orientation, rather than two rooms and two absolute orientations.</p>

<p><%-- krijgertje --%><tc-webtag:handle coderId="9906197" context="algorithm"/> used a <a
href="/stat?c=problem_solution&amp;rm=267332&amp;rd=10798&amp;pm=8282&amp;cr=9906197">variation</a>
on this approach. Initially,
he marked every room as being of the same class. Then in each iteration,
he looked at the classes of all the rooms connected to each room, and
used this to generate a <q>signature</q> for the room (after
normalising for orientation). Rooms that were of the same class but with
different signatures are then labelled as being different classes. The
algorithm terminates when no more relabelling is possible, and rooms
are distinguishable if and only if they are of different classes.</p>






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
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
