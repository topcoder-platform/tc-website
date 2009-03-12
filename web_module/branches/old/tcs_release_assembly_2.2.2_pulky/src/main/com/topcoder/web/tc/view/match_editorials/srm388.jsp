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
    <A href="/stat?c=round_overview&er=5&rd=11122">Match Overview</A><br />
    <tc-webtag:forumLink forumID="518888" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 388</span><br />Tuesday, January 15, 2008
<br /><br />



<h2>Match summary</h2>
<p>The match started with registration troubles, which may have played a hand
in limiting the registration to <q>only</q> 1424 contestants in spite of the
prize money. Fortunately, <%-- TheFaxman --%><tc-webtag:handle coderId="7267401" context="algorithm"/> worked his usual magic
and the match was able to proceed.</p>

<p>In Division I, coders were treated to a quite simple easy, a technical but
straight-forward medium, and a hard that required little theory but a lot of
optimisation. <%-- jakubr --%><tc-webtag:handle coderId="8472826" context="algorithm"/> started out strong, solving
the easy in under 90 seconds and also getting the fastest solution to the
medium, but he wasn't able to solve the hard. At the end of coding,
<%-- ainu7 --%><tc-webtag:handle coderId="22653720" context="algorithm"/> was in first place, but a failed medium left him in
fourth. <%-- ardiankp --%><tc-webtag:handle coderId="7459080" context="algorithm"/> won the match, followed by
<%-- Revenger --%><tc-webtag:handle coderId="2058177" context="algorithm"/> and <%-- xhl_kogitsune --%><tc-webtag:handle coderId="22652597" context="algorithm"/>.</p>

<p>In Division II, the problems were mostly straight-forward, and scores were
quite high. <%-- Dottik --%><tc-webtag:handle coderId="21597572" context="algorithm"/> won the match, having submitted all three
problems in only 23 minutes.</p>
 
<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8564&amp;rd=11122" name="8564">MonotoneSequence</a></b>
</font>
<A href="Javascript:openProblemRating(8564)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518888" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      662 / 708 (93.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      378 / 662 (57.10%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>mRefaat</b> for 248.65 points (2 mins 5 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      203.69 (for 378 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>This can be implemented in linear time, but as is often the case with
250's in TopCoder, the most efficient solution just isn't worth the effort.
The simplest solution is to iterate over all contiguous subsequences, then
check whether each one is strictly monotone or not (e.g., with one check for
increasing, another for decreasing).</p>

<p>Exercises</p>
<ol>
    <li>Write a solution that works in linear time.</li>
</ol>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8520&amp;rd=11122" name="8520">VoteRigging</a></b>
</font>
<A href="Javascript:openProblemRating(8520)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518888" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      618 / 708 (87.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      424 / 618 (68.61%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>morshed</b> for 498.22 points (1 mins 42 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      409.81 (for 424 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>If we are going to change a vote, we might as well take it from the
candidate with the most votes, and give it to our candidate. Keep doing this
until our candidate has more votes than any other.</p>

<p>Exercises:</p>
<ol>
    <li>Solve the problem assuming that the number of votes is very large, so
    that it is infeasible to work one vote at the time. The running time of
    your solution should be independent of the number of voters, assuming that
    you have an integer type large enough to manipulate vote counts.</li>
</ol>



<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8565&amp;rd=11122" name="8565">SmoothNumbersHard</a></b>
</font>
<A href="Javascript:openProblemRating(8565)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518888" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      209 / 708 (29.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      85 / 209 (40.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>A_A_Lunyov</b> for 928.13 points (8 mins 1 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      571.67 (for 85 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>Smooth numbers play a role in the <a
    href="http://en.wikipedia.org/wiki/Quadratic_sieve">Quadratic Sieve</a>, a
method for efficiently factoring large numbers. For the constraints in this
problem, a brute force approach will be too slow. The <a
    href="http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes">Sieve of
    Eratosthenes</a> provides a good template on which to build a solution.
The standard sieve simply marks numbers as prime or not prime, but we can
extend it to mark numbers with their largest prime factor. Whenever we find a
prime <i>p</i>, we promptly iterate through all multiples of <i>p</i> and
indicate that the largest prime factor is <i>p</i> (it will be the largest
known so far, since we discover primes in increasing order). In this part of
the algorithm, we ignore <b>k</b> completely, and run the loop right up to
<b>N</b>.</p>

<p>Since this is essentially performing the same steps as the Sieve of
Eratosthenes, the running time will have the same order of magnitude.
Computing this running time is far from trivial, but it turns out to be
O(<b>N</b> log log <b>N</b>). Since there are no divisions or mods in this
solution, the constant factor is quite small.</p>

<p>In the second part of the algorithm (or else concurrently with the first
part), we count all the numbers up to <b>N</b> whose largest prime factor is
at most <b>k</b>. Refer to <%-- A_A_Lunyov --%><tc-webtag:handle coderId="22711420" context="algorithm"/>'s <a
    href="/stat?c=problem_solution&amp;rm=268150&amp;rd=11122&amp;pm=8565&amp;cr=22711420">solution</a>
for an example.<p>

<p>Exercises:</p>
<ol>
    <li>Find a solution that takes O(<b>N</b> log log <b>k</b>) time.</li>
    <li>Find a solution for <b>k</b> = 100 and <b>N</b> up to 10<sup>18</sup>
    (hint: you don't need to identify the smooth numbers, just count
    them).</li>
</ol>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8519&amp;rd=11122" name="8519">SmoothNumbers</a></b>
</font>
<A href="Javascript:openProblemRating(8519)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518888" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
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
      618 / 629 (98.25%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      568 / 618 (91.91%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jakubr</b> for 249.63 points (1 mins 6 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      216.25 (for 568 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>This version of the problem was easily brute-forceable (see
<%-- jakubr --%><tc-webtag:handle coderId="8472826" context="algorithm"/>'s <a
    href="/stat?c=problem_solution&amp;rm=268116&amp;rd=11122&amp;pm=8519&amp;cr=8472826">solution</a>
for an example). For a discussion of
more efficient ways to solve it, refer to the writeup of SmoothNumbersHard in
Division II.</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8473&amp;rd=11122" name="8473">InformFriends</a></b>
</font>
<A href="Javascript:openProblemRating(8473)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518888" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      392 / 629 (62.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      246 / 392 (62.76%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jakubr</b> for 476.67 points (6 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      320.12 (for 246 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>The timing of this problem was rather unfortunate, coming so soon after
<a
    href="/stat?c=problem_statement&amp;pm=8540">PolygonCover</a>,
which can be solved in a similar way.</p>

<p>A subset with the property
required is known as a <dfn>dominating set</dfn>, and the maximum number of
independent dominating sets is known as the <dfn>domatic number</dfn>. The <a
    href="http://en.wikipedia.org/wiki/Domatic_number_problem">Domatic Number
    Problem</a> is an area of ongoing research. For this problem,
however, a basic O(3<sup>N</sup>) algorithm suffices.</p>

<p>The solution is based on dynamic programming: we compute the domatic number
for every subset, in the context of the whole set: that is, each dominating
set we consider must dominate the whole set, not merely the subset. To find
the domatic number of a subset A, we pick a dominating set D &sube; A and
note that the domatic number of A is at least one more than that of A &minus;
D. By iterating over all subsets D of A and checking a pre-computed table to
determine whether a particular D is dominating, this can be implemented in
O(3<sup>N</sup>) time. See <%-- jakubr --%><tc-webtag:handle coderId="8472826" context="algorithm"/>'s <a
    href="/stat?c=problem_solution&rm=268116&rd=11122&pm=8473&cr=8472826">solution</a>
as an example.</p>

<p>Exercises:</p>
<ol>
    <li>Prove that the running time of this algorithm is
    O(3<sup>N</sup>).</li>
</ol>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8518&amp;rd=11122" name="8518">TelephoneNumbers</a></b>
</font>
<A href="Javascript:openProblemRating(8518)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518888" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      23 / 629 (3.66%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      5 / 23 (21.74%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ainu7</b> for 671.71 points (22 mins 17 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      538.63 (for 5 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>There were only five correct solutions to this problem, and between them
they implemented 3 different solutions.
<%-- ardiankp --%><tc-webtag:handle coderId="7459080" context="algorithm"/>, <%-- ainu7 --%><tc-webtag:handle coderId="22653720" context="algorithm"/> and
<%-- xhl_kogitsune --%><tc-webtag:handle coderId="22652597" context="algorithm"/> used an approach based on wildcards: once a
number, say 1234567, has been allocated, mark any pattern with
<b>separation</b> - 1 of those bits replaced with a wildcard as unusable. For
example, if <b>separation</b> = 3, then ??34567, 1?3?567, 123?56? and so on
are all marked invalid. See <%-- ainu7 --%><tc-webtag:handle coderId="22653720" context="algorithm"/>'s <a
    href="/stat?c=problem_solution&amp;rm=268130&amp;rd=11122&amp;pm=8518&amp;cr=22653720">solution</a>
for an example.</p>

<p>The intended solution was more of a brute force, but with some
optimisations for the <b>separation</b> = 3 case. The most important
optimisation is to <dfn>meet in the middle</dfn>: instead of marking numbers
at a distance of 2 as illegal, mark those at a distance of 1, and check
whether a candidate is a distance of 1 from a marked number. Other
optimisations are mainly tricks to skip over candidates without explicitly
testing them, and low-level optimisations like storing booleans in bit vectors
instead of one per byte. See <%-- Jedi_Knight --%><tc-webtag:handle coderId="20557229" context="algorithm"/>'s <a
    href="/stat?c=problem_solution&amp;rm=268123&amp;rd=11122&amp;pm=8518&amp;cr=20557229">solution</a>
for an example.</p>

<p><%-- Revenger --%><tc-webtag:handle coderId="2058177" context="algorithm"/>'s <a
    href="/stat?c=problem_solution&amp;rm=268115&amp;rd=11122&amp;pm=8518&amp;cr=2058177">solution</a>
makes a clever optimisation to the brute force algorithm, based on an observed
pattern: for the numbers encountered in the constraints, the solution is
always just <b>k</b> - 1 (in hex), with two extra digits appended (this is not
true if the total number of digits is larger). It keeps a list of all the
allocated numbers, and uses the observation to quickly find the numbers in the
list that are of interest in testing a candidate.</p>

<p>There is yet another solution attempted by several contestants, but none
successfully. <%-- Revenger --%><tc-webtag:handle coderId="2058177" context="algorithm"/>'s observation can be taken further:
the last <b>separation</b> - 1 digits form a kind of checksum on the digits of
<b>k</b> - 1. I've written a solution based on this that passed all the system
tests, but I don't have a proof of correctness when <b>separation</b> is 3.

<p>Exercises:</p>
<ol>
    <li>What data structures would you use to implement the wildcard-based
    solution efficiently?</li>
    <li>Prove that the observation used in <%-- Jedi_Knight --%><tc-webtag:handle coderId="20557229" context="algorithm"/>'s
    solution eventually breaks down if the number of digits and <b>k</b> are
    unbounded.</li>
    <li>Find the checksum formulae referred to above (it is easiest by
    observation, so you should have a working solution handy).</li>
    <li>Prove the formulae you found. This is not too difficult when
    <b>separation</b> is 2, but I haven't solved this yet for
    <b>separation</b> = 3.</li>
</ol>


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
