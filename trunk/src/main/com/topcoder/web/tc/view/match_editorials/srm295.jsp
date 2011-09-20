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
<tc-webtag:forumLink forumID="505861" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 295</span><br>Wednesday, March 29, 2006
<br><br>

<span class="bigTitle">Match summary</span>
<p>
Being the second money match in a row, SRM 295 attracted 864 participants with 380 competing in division 1 and 484 in division 2. In division 1 <b>SnapDragon</b> took the lead 75.57 points ahead of the second placed <b>Tomek</b> who was followed closely by <b>Ying</b>, <b>Eryx</b> and <b>WSX</b>, all within one challenge. This is SnapDragon's 40th SRM victory! Congratulations! In division 2 it was a close race but in the end <b>need4speed</b> took the lead, followed by <b>FreePeter</b> and <b>amiune</b>.
</p>

<H1>
The Problems
</H1>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=5996&amp;rd=9816" name="5996">PaperRockScisQuals</a></b>

</font>

<A href="Javascript:openProblemRating(5996)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505861" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

360 / 450 (80.00%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Success Rate</b>

</td>

<td class="bodyText" style="background: #eee;">

181 / 360 (50.28%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>High Score</b>

</td>

<td class="bodyText" style="background: #eee;">

<b>LS8464</b> for 299.15 points (1 mins 31 secs)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Average Score</b>

</td>

<td class="bodyText" style="background: #eee;">

202.86 (for 181 correct submissions)

</td>

</tr>

</table></blockquote>

<p>

The solution for this problem is a straightforward simulation. The trick is implementing 2 completely different scoring systems, one to score individual head-to-head games, and one to rank the players. Scoring games is simple, just follow the rules in the problem statement and transform them in a bunch of if-s. Ranking the players however can be done a bit more cleaner than suggested in the problem statement. Instead of using 0, 0.5 and 1 point, you can use 0,1 and 2 points instead, since it will not change the order of players, but is easier to implement. Another thing worth noticing here is that, with the problem value of 300 points it is wise to spend a few moments proofreading your code than to make a fast, but flawed submission.

For a clean implementation check <b>FreePeter</b>'s code in the arena.

 

</p>

 

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6122&amp;rd=9816" name="6122">BuildBridge</a></b>

</font>

<A href="Javascript:openProblemRating(6122)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505861" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

264 / 450 (58.67%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Success Rate</b>

</td>

<td class="bodyText" style="background: #eee;">

217 / 264 (82.20%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>High Score</b>

</td>

<td class="bodyText" style="background: #eee;">

<b>letusplay</b> for 498.21 points (1 mins 42 secs)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Average Score</b>

</td>

<td class="bodyText" style="background: #eee;">

357.18 (for 217 correct submissions)

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

321 / 361 (88.92%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Success Rate</b>

</td>

<td class="bodyText" style="background: #eee;">

308 / 321 (95.95%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>High Score</b>

</td>

<td class="bodyText" style="background: #eee;">

<b>antimatter</b> for 249.33 points (1 mins 28 secs)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Average Score</b>

</td>

<td class="bodyText" style="background: #eee;">

196.47 (for 308 correct submissions)

</td>

</tr>

</table></blockquote>

<p>

This problem was a bit more pen&paper oriented because once you figure out the correct solution, implementing it is quite easy. The basic idea is that if we already have a stack of N cards, we can use that stack to create a new stack, sized N+1 by sliding a card under the old stack. The center of mass of the stack of N cards is known to hold N times the mass of a single card, so the resulting center of mass for N+1 cards is

1/(2*(N+1)) of card lengths right from the edge of the new card.
</p>
<p>

This idea was hinted in the problem statement, with detailed explanation of calculating the center of mass of 3 cards. Now that we can calculate the extension for any number of cards, due to small input we can simply iteratively add cards until we reach the required extension. To simplify the problem, the biggest testcase was given in the examples. This idea comes down to the following code:
<pre>
public int howManyCards(int d, int l){
	int ret = 0;
	double n = 0.0;
	double x = 2.0 * d / l;
	for (ret = 1; ; ++ret) {
		n += 1.0 / ret;
		if ( n - x > -1e-12 ) break;
	}
	return ret;
}
</pre>

Those of you that would like to learn more about this problem can do so <a href="http://mathworld.wolfram.com/BookStackingProblem.html">here</a>.

</p>

 

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6102&amp;rd=9816" name="6102">JimmyLightning</a></b>

</font>

<A href="Javascript:openProblemRating(6102)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505861" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">

<tr>

<td class="bodyText" style="background: #eee;">

<b>Value</b>

</td>

<td class="bodyText" style="background: #eee;">

1050

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Submission Rate</b>

</td>

<td class="bodyText" style="background: #eee;">

55 / 450 (12.22%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Success Rate</b>

</td>

<td class="bodyText" style="background: #eee;">

6 / 55 (10.91%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>High Score</b>

</td>

<td class="bodyText" style="background: #eee;">

<b>johann</b> for 817.52 points (16 mins 8 secs)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Average Score</b>

</td>

<td class="bodyText" style="background: #eee;">

613.42 (for 6 correct submissions)

</td>

</tr>

</table></blockquote>

 

 

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

257 / 361 (71.19%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Success Rate</b>

</td>

<td class="bodyText" style="background: #eee;">

117 / 257 (45.53%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>High Score</b>

</td>

<td class="bodyText" style="background: #eee;">

<b>krijgertje</b> for 471.11 points (7 mins 7 secs)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Average Score</b>

</td>

<td class="bodyText" style="background: #eee;">

328.36 (for 117 correct submissions)

</td>

</tr>

</table></blockquote>

<p>

In division 2 this problem was worth 1050 points, and with a good reason. Even though the algorithm is a simple knapsack, there were tricks all around. Rooms are numbered starting from 1, Jimmy must leave before the door closes, more than one diamond type per room...<br>

The basic solution is DP, more precisely - knapsack. If diamond X(V T R) can be stolen at time N then the value for N is equal to (V + (value for N - T)).
</p>
<p>

Of all such possible values for N, we choose the largest and proceed to N + 1. Now all we need to do is determine if diamond X can be stolen at time N. We do this by checking weather N is <i>STRICTLY</i> smaller than all door times from room 1 to room R.<br>

Here is the part of the code that does the actual calculation (array d is of type diamond where time is the last time it can be stolen at, diff is the time required to steal it and value is the diamonds value):

<pre>
int[] s = new int[1001];
s[0] = 1;
for (int t = 1; t < 1001; ++t) {
	s[t] = s[t - 1];
	for (int i = 0; i < d.length; ++i)
	if ((t < d[i].time) &&
	(t - d[i].diff > -1) &&
	(s[t] < s[ t - d[i].diff ] + d[i].value)) {
		s[t] = s[ t - d[i].diff ] + d[i].value;
	}
}
return s[1000] - 1;
}

</pre>

<br>

For clean implementations in C++ check <b>antimatter</b>'s solution, and for C# check <b>Petr</b>'s.

</p>

 

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6094&amp;rd=9816" name="6094">TribbloTrouble</a></b>

</font>

<A href="Javascript:openProblemRating(6094)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505861" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

82 / 361 (22.71%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Success Rate</b>

</td>

<td class="bodyText" style="background: #eee;">

15 / 82 (18.29%)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>High Score</b>

</td>

<td class="bodyText" style="background: #eee;">

<b>SnapDragon</b> for 634.03 points (24 mins 50 secs)

</td>

</tr>

<tr>

<td class="bodyText" style="background: #eee;">

<b>Average Score</b>

</td>

<td class="bodyText" style="background: #eee;">

497.49 (for 15 correct submissions)

</td>

</tr>

</table></blockquote>

<p>

The most common error coders did on this problem was to try a DP solution. The problem with DP solution is that the code can form loops of 'W'-s, and this is incorrectly handled. The correct approach was simulation. However, the straightforward simulation that moves the tribbles square by square will fail because there can be loops 2500 steps long and you would need to iterate 72000 times to get enough precision (barely, check testcase 40.). This will by far exceed the 2 second time limit. What you need to notice at this point is that only objects 'S', 'W' and 'T' affect the returned value, so instead of square by square you can move tribbles object by object. This gives us at most 25 objects that can be reached from the starting point (testcase 7 is an example of this). This can be safely iterated well above the limit needed to reach 1E-9.<br>

The code for this problem is a bit too long to be placed completely within the summary, however my code has been uploaded in the practice room for your convenience. One implementation detail you will notice is that instead of 25 objects I split each object into 4 objects corresponding to 4 cardinal directions the tribble can move in, thus getting 100 objects max.<br>

For all you math lovers out there, there is also a solution involving linear equations. See <b>lovro</b>'s solution in the practice room.

</p>

<%--<div class="authorPhoto">
    <img src="/i/m/legakis_big.jpg" alt="Author" />
</div>
<div class="authorText">
--%>
  By&#160;<tc-webtag:handle coderId="7396310" context="algorithm"/><br />
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
