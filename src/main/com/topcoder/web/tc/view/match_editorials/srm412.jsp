<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 412 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
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
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&er=5&amp;rd=13503">Match Overview</a><br />
    <tc-webtag:forumLink forumID="522583" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 412</span><br />Thursday, July 31, 2008
<br /><br />



<h2>Match summary</h2> 

<p>
Solutions to the Easy problem appeared quickly in Division I. 
The medium took longer; <tc-webtag:handle coderId="10574855" context="algorithm"/>
and <tc-webtag:handle coderId="251074" context="algorithm"/> had solved both easy and
medium problems after 18 minutes.
After 40 minutes many more coders have managed to solve both of these
problems. Then, the
first solution of 1000 appeared, by <tc-webtag:handle coderId="14946025" context="algorithm"/>. When the coding
phase was over, there were many solutions of the 1000 point problem.
<tc-webtag:handle coderId="14946025" context="algorithm"/> was in the lead (1325 points),
followed by <tc-webtag:handle coderId="22228040" context="algorithm"/> (1270 points), 
<tc-webtag:handle coderId="10574855" context="algorithm"/>, <tc-webtag:handle coderId="8357090" context="algorithm"/>,
and <tc-webtag:handle coderId="9928945" context="algorithm"/>.
Challenge phase and system tests killed most of the 1000
point problem solutions. But <tc-webtag:handle coderId="14946025" context="algorithm"/> was still in the lead,
followed by <tc-webtag:handle coderId="10574855" context="algorithm"/>, <tc-webtag:handle coderId="22511877" context="algorithm"/>, <tc-webtag:handle coderId="251074" context="algorithm"/>, and <tc-webtag:handle coderId="20275376" context="algorithm"/>.
Note that both <tc-webtag:handle coderId="14946025" context="algorithm"/> and
<tc-webtag:handle coderId="10574855" context="algorithm"/>
managed to keep their first two places after
resubmitting their 250 point problems.
<br /><br />
In Division II, two coders managed to solve all three problems
(<tc-webtag:handle coderId="22671388" context="algorithm"/> and <tc-webtag:handle coderId="22686636" context="algorithm"/>), followed by the five who solved the 1000
point problem without solving 500 correctly.
<%-- ### MATCH SUMMARY AND COMMENTARY GOES HERE ### --%>
</p> 
 
<H1> 
The Problems 
</H1>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8477&amp;rd=13503" name="8477">TrueSpace</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8477)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522583" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      792 / 818 (96.82%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      649 / 792 (81.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>xiaowuc1</strong> for 249.39 points (1 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      224.74 (for 649 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
To solve this problem, one had to find the smallest multiple of 
<strong>clusterSize</strong> which is a multiple of <strong>sizes[i]</strong>, then
add these values for each <strong>i</strong>. There were many correct 
ways of finding such smallest multiple, for example, 
<strong>((sizes[i] + clusterSize - 1) / clusterSize) * clusterSize</strong>
always works correctly. A possible bug was to
perform the calculations on ints instead of longs.
<%-- ### PROBLEM WRITEUP GOES HERE --%>
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8481&amp;rd=13503" name="8481">BirthdayReminders</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8481)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522583" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      338 / 818 (41.32%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      92 / 338 (27.22%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>hamdanil</strong> for 348.32 points (20 mins 45 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      228.94 (for 92 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
A common way of solving this problem was to generate the next <strong>k</strong>
times each occasion type happens for each friend (thus, generating
<strong>k*o*f</strong> occasions in total, where <strong>o</strong> is the number of
occasion types, and <strong>f</strong> is the number of friends). Then, sort
these occasions by time, and output <strong>k</strong> earliest of them. It was
possible to timeout using this solution (if currentDate is 1000000, 
birthDate is 0, and days is 1, then a simple solution would generate
all the 1000000 occasions between 0 and 1000000 on the way; multipled
by 50 friends and 50 occasion types, this leads to a timeout).
<br /><br />
Another solution was to find all occasions which happen at <strong>currentDate</strong>,
then move to the next date. Again, checking the next day would lead to
a timeout; instead, you should skip to the next date when any of the
occasions happens. Repeat until <strong>k</strong> occasions have been found.
<%-- ### PROBLEM WRITEUP GOES HERE --%>
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8478&amp;rd=13503" name="8478">StringsAndTabs</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8478)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522583" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      15 / 818 (1.83%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 15 (40.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>soul3434</strong> for 588.90 points (28 mins 18 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      494.07 (for 6 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      313 / 571 (54.82%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      258 / 313 (82.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>bmerry</strong> for 435.00 points (11 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      265.07 (for 258 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem was hated by some for its length, lack of algorithmic subtleties,
and using music vocabulary, and liked by others for its
originality, "real" examples, and
music background. One had to understand the problem statement
and implement it. There were no difficult algorithms there, but 
care had to be taken to make sure that all the sorting
of notes and strings is done like requested by the problem statement
(although if it was not, the example cases would probably catch it).
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8480&amp;rd=13503" name="8480">ForbiddenStrings</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8480)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522583" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      553 / 571 (96.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      474 / 553 (85.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Im2Good</strong> for 248.03 points (2 mins 32 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200.25 (for 474 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
One of the fast ways of solving this problem was as follows.
Let's call a string <em>repeating</em> if it is not forbidden and
has the last two letters equal, and <em>non-repeating</em> if it is
not forbidden and has the last two letters different. 
Let <strong>r<sub>i</sub></strong> and <strong>n<sub>i</sub></strong>
be the number of repeating and non-repeating 
strings of length <strong>i</strong>, respectively.
We are asked for
<strong>r<sub>i</sub>+n<sub>i</sub></strong>. Now, how to find the values of
<strong>r<sub>i</sub></strong> and <strong>n<sub>i</sub></strong>? Well, each of
<strong>r<sub>i</sub></strong> repeating strings of length <strong>i</strong>
can be extended to length <strong>i+1</strong> by adding the same letter again
(thus obtaining a repeating string again) or by adding one of the
two different letters (thus obtaining two non-repeating strings).
For non-repeating strings, when you add the three letters possible,
you get one repeating, one non-repeating, and one forbidden string.
All the strings of length <strong>i+1</strong> are created in this way. This
gives us a recursive formula for <strong>r<sub>i</sub></strong> and <strong>n<sub>i</sub></strong>:
<strong>
r<sub>i+1</sub> = r<sub>i</sub> + n<sub>i</sub>,
n<sub>i+1</sub> = 2r<sub>i</sub> + n<sub>i</sub>
</strong>
.
See <tc-webtag:handle coderId="10574855" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&amp;rm=298198&amp;rd=13503&amp;pm=8480&amp;cr=10574855">solution</a>
for an example of this approach.
<br /><br />
Other solutions used similar approaches (for example, considering all
the possible endings of length 2 (or 3) separately, instead of categorizing them as repeating and
non-repeating).
<%-- ### PROBLEM WRITEUP GOES HERE --%>
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8479&amp;rd=13503" name="8479">ErrantKnight</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8479)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522583" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      54 / 571 (9.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      18 / 54 (33.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Michael_Levin</strong> for 713.64 points (19 mins 44 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      531.36 (for 18 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
<%-- ### PROBLEM WRITEUP GOES HERE --%>
The first thing to note in this problem is that what is important is not
the positions of both knights, but only their relative position 
(i.e., <strong>(x<sub>w</sub>-x<sub>b</sub>, y<sub>w</sub>-y<sub>b</sub>)</strong> where
<strong>(x<sub>b</sub>,y<sub>b</sub>)</strong> is the location of
the black knight and <strong>(x<sub>w</sub>,y<sub>w</sub>)</strong> is the location of the white knight).
Knowing that, we can assume that the black knight stands still at <strong>(0,0)</strong>,
and both players move the white knight (and win if they capture the black
knight).<br /><br />

The next thing to notice is that the problem has many symmetries. If you
know the winner for <strong>(x,y)</strong>, then we have the same winner for
<strong>(x,-y), (-x,y), (-x,-y), (y,x), (y,-x), (-y,x), </strong>and<strong> (-y,-x)</strong>. Thus,
we only have to solve the problem for one quarter of the plane (or even an
arc of 45 degrees).<br /><br />

Now, we can explain a simple O(n<sup>3</sup>) solution. We call a position <em>losing</em>
if the player who is to make move from this position has no winning strategy.
A position is losing if and only if it is impossible to move to a losing
position from it. Since only moves which reduce the Euclidean distance are
allowed, this definition is not circular. We can now write a O(n<sup>3</sup>) solution
which checks for each position whether it is losing, using either DP or
memoization (in the case of DP we have to make sure that we analyze all
squares in the order of Euclidean distance, or at least never analyze square
A after square B when there is a legal move from B to A).<br /><br />

This solution has time complexity of O(n<sup>3</sup>) and would timeout. So, how to
make it faster? There are several possible ways.<br /><br />

<h3>Noticing a rule.</h3>
Most coders who have successfully solved this problem have noticed that
all losing squares appear at positions of form <strong>(d,0)</strong>, <strong>(0,d)</strong>,
or <strong>(d,d)</strong> (and their counterparts in other quarters of the plane).
Noticing this allows one to write an O(n<sup>2</sup>) or even an O(n) solution.
Such a conjecture can be found by examining the results of Example #1,
or by writing an O(n<sup>3</sup>) solution and producing a map of losing
positions for, say, x, y &gt; 100.
I don't know any mathematical proof for this, but it is quite easy to
write a program which checks that the solution generated using this rule
is indeed correct for <strong>|x|, |y| &le; 4000</strong>.
For an example of this approach, see <tc-webtag:handle coderId="14946025" context="algorithm"/>'s 
<a href="#">quick solution</a>. It is the same as the simple O(n<sup>3</sup>)
solution, except one line: <tt> if(x != y &amp;&amp; x != 0 &amp;&amp; y != 0) return true;</tt>.

<br /><br />

<h3>Remembering winning directions.</h3>
This approach was used by testers, as well as several coders during the
match. Let's number the directions by numbers <strong>d</strong> from 0 to 7, and
<strong>dx[d], dy[d]</strong> are relative changes of coordinates for each move.
<br />
Now, when we find that a position is winning, we not only remember
that it is winning, but also we remember the set of directions in which we
can move in order to win (as a bit mask). Then, we can win from <strong>(x,y)</strong>
by moving in direction <strong>d</strong> if and only if <strong>(x+dx[d], y+dy[d])</strong> is
a losing position, or if we can win from there by moving in direction <strong>d</strong>
again (assuming that the later position is closer to <strong>(0,0)</strong> than 
<strong>(x,y)</strong>). This allows us to finding the answer for <strong>(x,y)</strong> by just
checking the 8 (or less) squares to which we can get in one chess knight's move, leading
to an O(n<sup>2</sup>) algorithm.
This solution probably needs to be optimized by analyzing
only squares satisfying 0 &le; x &le; y and obtaining the results for
the other ones by flipping. A
<a href="/stat?c=problem_solution&amp;rm=298190&amp;rd=13503&amp;pm=8479&amp;cr=14927744">solution</a>
using this approach
was submitted e.g. by <tc-webtag:handle coderId="14927744" context="algorithm"/>.
<br /><br />
<h3>Remembering losing positions on each line.</h3>
Let a <em>half-knight-line</em> be the sequence of squares <strong>s<sub>i</sub></strong>,
for <strong>i &ge; 0</strong>,
such that a knight can move from <strong>s<sub>i</sub></strong> to <strong>s<sub>j</sub></strong>
iff <strong>j</strong> is smaller <strong>i</strong>, by moving in direction <strong>d</strong> (which
is constant for a half-knight-line). There is at most one losing position
on each half-knight-line, otherwise the knight could move from one to another.
So, if we analyze all the squares, sorted by Euclidean distance from (0,0),
then to check whether we can win by moving in direction <strong>d</strong>, it is enough
to check whether we already know a losing position on a half-knight-line
in direction <strong>d</strong> going through our position. When we find a losing
position, we remember for all half-knight-lines containing it that we
have found a losing position on them. This also leads to an O(n<sup>2</sup>) solution
(which is a bit faster, but probably harder to implement than the previous
solution).
<br /><br />


<div class="authorPhoto">
    <img src="/i/m/Eryx_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8355516" context="algorithm"/><br />
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
