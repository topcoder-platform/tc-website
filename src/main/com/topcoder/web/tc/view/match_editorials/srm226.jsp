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
<tc-webtag:forumLink forumID="505703" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 226</span><br>Wednesday, January 5, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
In Division 2, <b>Oleksiy</b> took top honors with a commanding lead, while <b>bluequark</b>
and <b>wickedman</b> took second and third.  A special mention goes to <b>wickedman</b> for being
the highest scoring newbie.</p>

<p>In Division 1, <b>haha</b> picked up his second SRM victory (his first was way back in SRM 187),
with <b>John Dethridge</b> and <b>natori</b> coming in a close second and third.</p>

<p>The Division 1 coders saw a quirky problem set, wherein the hard problem had a 95% success rate,
while the others were successfully solved by less than 40% of those who submitted a response.  In
fact, the total number of correct submissions was nearly equal for all three problems (44, 37, and
40, respectively).</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3489&amp;rd=6515" name="3489">VLNString</a></b>
</font>
<A href="Javascript:openProblemRating(3489)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505703" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      149 / 170 (87.65%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      119 / 149 (79.87%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>lingo</b> for 248.68 points (2 mins 4 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      212.18 (for 119 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The basic idea behind this problem is to work from left to right, building words, and stopping
the build when you get to one or more spaces, then adding the first letter if it wasn't "and", "or",
or "the".  Trying to use a standard library split function could get you into trouble because of
multiple consecutive spaces; a simple parsing approach is safer.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3493&amp;rd=6515" name="3493">ExperimentalAnalyzer</a></b>
</font>
<A href="Javascript:openProblemRating(3493)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505703" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      600
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      83 / 170 (48.82%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      63 / 83 (75.90%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>nickel</b> for 522.10 points (11 mins 19 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      323.80 (for 63 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem is not too difficult to code, once the methodology is determined.  A simple approach
is, for each variable, determine the minimum and maximum value of that variable where the result is 0,
and where the result is 1.  If those two ranges are non-overlapping (note however, that all result 1
values could be less than the result 0 values, or vice versa), that variable is a predictor.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3498&amp;rd=6515" name="3498">ManhattanMovement</a></b>
</font>
<A href="Javascript:openProblemRating(3498)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505703" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      800
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      60 / 170 (35.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      14 / 60 (23.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Oleksiy</b> for 669.55 points (13 mins 4 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      514.14 (for 14 correct submissions)
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
      115 / 129 (89.15%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      44 / 115 (38.26%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>haha</b> for 245.78 points (3 mins 44 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      201.56 (for 44 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>This is a classic type of problem that can be solved very easily once you see the "ah-ha".
In this case, the big "ah-ha" is that the answer is always a single vertical or horizontal line.
There is never any advantage in changing direction.  Need further convincing?  If the road is
vertical or horizontal, then only one direction is possible to travel towards the road, and it's
trivial.  For any diagonal road, consider the two direct paths (vertical and horizontal).  If both
direct paths are the same, the case is again trivial.  In any other case, one or the other is shorter.
Now, suppose you were to do some of your travel along the short path, then change directions.  After
travelling the short path, you're left at another point, with the same setup, whereby the same
direction is still shorter.  Thus, it always makes sense to continue on the short path.</p>

<p>So, calculate the distance to the line horizontally and vertically (be careful of cases
where <i>a</i> or <i>b</i> is 0!) and return the shorter of the two.  Also, it's important
to cast all of the variables to double before calculating, otherwise an overflow can result.
This is possibly the biggest gotcha that left percentages so low.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3443&amp;rd=6515" name="3443">OneArmedBandit</a></b>
</font>
<A href="Javascript:openProblemRating(3443)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505703" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      103 / 129 (79.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      37 / 103 (35.92%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>LuckyLibran</b> for 438.05 points (11 mins 0 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      310.45 (for 37 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>In spite of a lot of numbers floating around, this problem is fairly straightforward.  Knowing
that expected outcome = probability * payout, we really have all the information we need to calculate
our result.</p>
<p>First, we determine the expected outcome of each of the non-jackpot payout lines.
This is simply the probability of each wheel landing on the appropriate symbol (or 1, if the symbol
is a wildcard) multiplied by the payout.  We add these together.  If this is greater than or equal to
1, then the slot machine is a winner, even without the jackpot, and we return 0.</p>
<p>Finally, we determine the probability of the jackpot line coming up.  If it's 0, then we return -1,
since it doesn't matter what the jackpot is if we can never win it.  Otherwise, we know that the
expected outcome of the jackpot payoff must be sufficient to make our total expected outcome
at least 1.  So, solving the simple formula, the payout then needs to be at least
(1 - non-jackpot expected payout) / jackpot percentage.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3486&amp;rd=6515" name="3486">TestScores</a></b>
</font>
<A href="Javascript:openProblemRating(3486)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505703" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      800
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      42 / 129 (32.56%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      40 / 42 (95.24%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 769.78 points (5 mins 40 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      548.22 (for 40 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>This is the type of problem where either you saw the solution and coded it, or you didn't.  With
a very high success rate among those who submitted a solution, obviously many saw the solution.</p>

<p>The first thing to realize is that calculating the mean is simple: sum the probabilities of each
question being answered correctly; standard deviation is a little more subtle.  But, for a very large
set of data, knowing the probability of obtaining each raw score (which, in the worst case ranged
from 0 to 50) suffices to calculate the standard deviation.  The procedure to do this is pretty simple:</p>

<ul>
   <li>For each raw score value, multiply the probability times the square of the deviation from the mean</li>
   <li>Add up each of the values obtained above.</li>
   <li>Calculate the square root of that sum.</li>
</ul>

<p>I'll leave it as an exercise to the reader to work out exactly why that works.</p>

<p>The final piece of the puzzle is simply calculating the probabilities of each raw score.  Obviously,
with 50 questions, there are 2^50 possible ways the questions could each be correct/incorrect, so a 
more efficient calculation is necessary.</p>

<p>A simple dynamic programming approach works well.  If <i>P(a, n)</i> is the probability that <i>a</i>
of the first <i>n</i> questions were answered correctly, and <i>Q(a)</i> is the probability of an
arbitrary person answering question <i>a</i> correctly, then we can use the recurrence
<i>P(a, n) = P(a - 1, n - 1) * Q(a) + P(a, n - 1) * (1 - Q(a)), P(0, 0)</i> = 1 to build our DP.</p>


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
