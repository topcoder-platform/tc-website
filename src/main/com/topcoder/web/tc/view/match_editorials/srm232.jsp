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
<tc-webtag:forumLink forumID="505718" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 232</span><br>Wednesday, February 23, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>This match seemed to have a lot less challenges than other matches, but the
systests were brutal for many coders, especially on the division 1 650 and 900.
The top three slots in division 1 were taken by <b>SnapDragon</b>, <b>tomek</b>,
and <b>haha</b>.
</p>

<p>In division 2, seven coders plowed their way through all three problems, with
<b>tomekW</b>, <b>palmcron</b>, and <b>dgott</b> taking the top three slots.</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1862&amp;rd=6521" name="1862">BritishCoins</a></b></font>
<A href="Javascript:openProblemRating(1862)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505718" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level One: <blockquote><table cellspacing="2" ID="Table1">
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
      216 / 228 (94.74%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      207 / 216 (95.83%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>supernova</b> for 248.98 points (1 mins 49 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      229.59 (for 207 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>This problem is fairly straightforward, utilizing integer division and the modulus operator.
First, note that there are 240 pence in a pound.  Thus, pounds = pence / 240 (integer division).
After that, we're left with pence % 240 (modulus operator) more pence.  Then, divide the
remaining pence by 12 to get the number of shillings.  Take the remainder again, and that's 
the number of pence.  Package those three values into an array, in that order, and we're done.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3972&amp;rd=6521" name="3972">WordFind</a></b>
</font>
<A href="Javascript:openProblemRating(3972)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505718" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2" ID="Table2">
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
      131 / 228 (57.46%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      73 / 131 (55.73%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>logged</b> for 442.97 points (10 mins 28 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      286.32 (for 73 correct submissions)
    </td>
  </tr>
</table></blockquote>


Used as: Division One - Level One: <blockquote><table cellspacing="2" ID="Table3">
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
      166 / 172 (96.51%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      139 / 166 (83.73%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 245.38 points (3 mins 54 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      204.07 (for 139 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>The word search problem probably brought back the days of childhood, when we would do those
puzzles in school, or just for fun.  The requirement about how to deal with a word that appears
more than once in the puzzle was hopefully a clue to how to proceed with the problem.  If
we search top to bottom, left to right, in each of the three directions, noting the location
we find any of the words we're searching for, we know that we will always find the "first"
match for any given word.  We can optimize this a little by only checking words when we have
a first character match, but given the size of the puzzle and the number of words, this
was not necessary, and even a very unoptimized solution can run in time.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3971&amp;rd=6521" name="3971">StockHistory</a></b>
</font>
<A href="Javascript:openProblemRating(3971)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505718" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Three: <blockquote><table cellspacing="2" ID="Table4">
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
      32 / 228 (14.04%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      15 / 32 (46.88%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>palmcron</b> for 602.63 points (27 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      470.46 (for 15 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>The annotation on the last example of this problem was intended to not only clarify the goal
of the problem, but was supposed to be a hint about how to proceed about coding a solution.  With
the requirement that we can only ever sell all of our holdings at the very end, the decision
each month is only whether we should buy that month, or wait until some month in the future to
buy.</p>
<p>One solution works like this:  work backwards from the end, and for each month, determine which
stock offers the biggest percentage gain between that month and the end.  Then, working from
beginning to end, each month we either buy the best stock of that month or hold onto our money
to buy the best stock in some future month, if it offers a better percentage return.  Since
we can buy fractional shares, we always invest all or nothing in a single best stock.  Then, we
do the same thing the next month, always picking either the best of the current month or any future
month to invest all of our money for that month.</p>
<p>Then, we simply total up our sales price, subtract out our initial investments, round off to the
nearest integer, and we're done.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3924&amp;rd=6521" name="3924">CommunicableDisease</a></b>
</font>
<A href="Javascript:openProblemRating(3924)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505718" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2" ID="Table5">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      650
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      54 / 172 (31.40%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      21 / 54 (38.89%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 507.61 points (16 mins 0 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      373.93 (for 21 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>This problem was, in theory, representative of an experiment frequently done in high school
biology classes to help demonstrate how quickly disease can spread.  The biggest observation
to make is that a small group of people can, after only a few contacts with others, result in many
people becoming infected.  Furthermore, once many people are infected, and have been in contact
with several others, there is really no longer any way to trace the point(s) of origin.  But,
I digress...</p>
<p>One efficient way to solve this problem is using bitmasks.  You need to use a 64-bit integer to
hold the 50 bits (so be careful to use 1L &lt;&lt; i, or the similar appropriate long-type declarator
in your code) needed.  Then, from round to round, use the bitmasks to keep track of whose samples
are in whose vials.  For instance, if vial #2 has bitmask 10110, then it contains solution from 
vials 0, 2 and 3.  The bitwise-or operator is the key here.</p>
<p>In pseudocode:</p>
<pre>mask[vial][round + 1] = mask[vial][round] | mask[donor1][round] | mask[donor2][round] ...</pre>
<p>Once you've calculated the final contents of each vial, you know that anyone who donated (directly
or indirectly) to someone who ended non-contaminated, must have themselves begun the simulation
non-contaminated.  Taking the bitmasks of those who ended contaminated, and removing the bits
corresponding to those vials known to have started negative leaves a bitmask of the potential
contamination sources.  If there's only one potential source, you know it was contaminated to 
begin with.  If there's no potential source of the contamination, then you have invalid data.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3923&amp;rd=6521" name="3923">SalesPromotion</a></b>
</font>
<A href="Javascript:openProblemRating(3923)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505718" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2" ID="Table6">
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
      41 / 172 (23.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      7 / 41 (17.07%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>marian</b> for 709.62 points (15 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      588.07 (for 6 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>This problem had fewer submissions (and even fewer correct) than I would have
suspected.  I think part of the problem was a harder than usual medium leaving
little time to work on the hard.  Also, timeouts on large inputs, rounding errors,
and a few other gotchas were all easy to do.</p>

<p>It should come as no surprise that this is a dynamic programming problem.  The DP
is done in two dimensions, on total number of points used, and total number of half
price items used.  We can either keep track of the best possible total savings (in
which case we initialize the array elements to 0) or the lowest total cost (in which
case we initialize the array elements to some really high number).  Then, we
loop over each of the items, and work backwards through our array to check if adding
the current item as half price or points will be better than our current best for
the number of points and half price items.  Working backwards is necessary to
ensure we don't count the same item twice for points or half price.</p>

<p>Then, since we have to use all of our points and half price items exactly, we
just grab dp[points][halfPrice] to generate our result.</p>
 
 
<p>
<img src="/i/m/timmac_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="10407399" context="algorithm"/><br />
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
