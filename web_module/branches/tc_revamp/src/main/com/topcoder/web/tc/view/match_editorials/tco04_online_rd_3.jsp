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
<tc-webtag:forumLink forumID="505682" message="Discuss this match" /></div>
<span class="bodySubtitle">2004 TopCoder Open <br> Online Round 3</span><BR/>September 22, 2004
<br><br>

<span class="bigTitle">Summary</span> 

<p>
With an average rating of about 2317, the competitors in round 3 of the TCO were
some of the finest coders in the world.  However, only 50 of them could advance,
which meant that even some of these fine coders had to be eliminated.  Among the
titans to fall were notables radeye, WishingBone, and LunaticFringe.  On the
other end of the spectrum, dmytro, the lowest rated coder in the competition
beat the odds and moved one step away from the onsite rounds.  While there were
a few surprises, no one was too shocked when John Dethridge took first by over
60 points, and snewman was over 100 points ahead of third place coder, ambrose.
</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2977&amp;rd=5880"
name="2977">Boxing</a></b>
</font>
<A href="Javascript:openProblemRating(2977)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505682" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      97 / 100 (97.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      68 / 97 (70.10%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>reid</b> for 233.81 points (7 mins 34 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      174.99 (for 68 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem can be solved with a greedy algorithm.  First, find the earliest
interval less than or equal to 1 second that contains 3 judges scoring a hit.
Next, remove all hits that occur during that interval or before it, and repeat.
This works because if you can get N hits by time t, that is always better than
getting N hits by time t+1.  The details of how you do this vary, but all of the
algorithms I saw boiled down to this approach.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2959&amp;rd=5880" name="2959">Volleyball</a></b>
</font>
<A href="Javascript:openProblemRating(2959)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505682" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      73 / 100 (73.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      57 / 73 (78.08%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 486.15 points (4 mins 49 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      321.72 (for 57 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
There were a couple of ways to do this one.  The most common approach was to use
memoized recursion.  You want to fill in a 2D table, memo, such that memo[i][j]
is the probability that a serving team with i points will beat a non-serving
team with j points.  Then, you just write the standard recursive memoization
function:
<pre>
double win(int server, int nonserver){
    if(memo[server][nonserver] != -1)return memo[server][nonserver];
    if(server&gt;=15 &amp;&amp; server &gt;= nonserver + 2)return 1;
    if(nonserver&gt;=15 &amp;&amp; nonserver &gt;= server + 2)return 0;
    double ret = 0;
    ret = p*win(server+1,nonserver) + (1-p)*(1-win(nonserver+1,server));
    memo[server][nonserver] = ret;
    return ret;
}
</pre>
The question, however, is how far we recurse before we give up and call it
quits.  Since the probability is between 0.01 and 0.99, we're safe quitting when
one team gets to 1000 points.  Even when the probability is 0.01, the game is
sufficiently unlikely to get up to 1000 points that we can just return 0 or 1
if it does.<br/><br/>
An alternative approach is to handle tie games where the score is greater than
15 with a closed form solution (and deal with the rest of the game as above).  I
won't work out all the algebra here, but if you churn through it, you end up
with a probability of <tt>1/(3-2*probWinServe)</tt> that the serving team will
win a tie game.  Were the constraints less generous, the recursive approach
would not have been precise enough.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=926&amp;rd=5880" name="926">LawnMower</a></b>
</font>
<A href="Javascript:openProblemRating(926)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505682" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      16 / 100 (16.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      10 / 16 (62.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ZorbaTHut</b> for 654.09 points (23 mins 26 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      512.92 (for 10 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The first part to a solution for this problem is to iterate over all possible
placements of the shed.  With a yard no bigger than 12x12, there aren't that
many ways to place it.  Next, once you have the shed placed, how many spots can
you reach and still put the mower back in the shed?  The key to figuring this
out is to first observe that you may go through the shed as many times as you
like while mowing the lawn.  So, if you can reach a spot, and then get the mower
back in the shed the same way it started, you can mow that spot regardless of
which other spots you mow.  Furthermore, if you can't reach a spot and get the
mower back in the shed afterwards, there is no way to mow it.<br/><br/>
To figure out which spots we can reach and then return to the shed, we simply
run two depth first searches.  On the first pass, you mark all of the spot,
direction pairs which are reachable going forward from the shed.  On the second
pass, you mark all the spot, direction pairs which are reachable going backwards
from the shed.  If a spot and direction is reachable going both forwards and
backwards, then you know that you can get to it, and then back to the shed.
Since you can go in both directions with a single method, the implementation is
surprisingly easy, if only you can quickly figure out how to do it.
</p>

<div class="authorPhoto">
    <img src="/i/m/lbackstrom_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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

