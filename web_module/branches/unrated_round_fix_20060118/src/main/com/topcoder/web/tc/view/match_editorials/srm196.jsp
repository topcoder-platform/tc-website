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
<tc-webtag:forumLink forumID="505659" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 196</span><br>Thursday, May 27, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
This match seemed relatively uneventful, with the expected quick submissions of SnapDragon (He did reclaim 1st place overall - a "Yay! Back in first!" was seen almost immediately after the match was over and decided). Congratulations to him on an excellent performance, with the highest score on two of the three problems, and the divisions high total score. The Division 1 250 / Division 2 500 was relatively straightforward, but a surprising number of coders in both divisions failed it either during the challenge phage or the system test, due to some hard-to-detect off-by-one errors. To anyone who recognizes and uses DP on a regular basis, the Division 1 650 was probably straightforward - SnapDragon submitted in just under 7 minutes, well ahead of the next coders near the 12 minute mark. The Division 1 900 dealt with string manipulation - not often seen as a Div 1 hard these days, but it was relatively straightforward as well, causing the top coders very little trouble.
</p>
<p>Division 2 had a very math-oriented night, as two of the three problems were almost strictly about solving equations. While not extremely complicated, there was enough detail required in the correct formulae that a large percentage of Div 2 coders did not even submit the 1000 pointer, and an equally large percentage of those who did submit it failed in either the challenge phage or the system test.
</p> 
 
<p>
<H1> 
The Problems 
</H1>
</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2826&amp;rd=5071">Education</a></b> 
</font> 
<A href="Javascript:openProblemRating(2826)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505659" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      171 / 185 (92.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      128 / 171 (74.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>sbh4duke</b> for 243.59 points (4 mins 38 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      204.89 (for 128 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
<p>
Overall, a pretty simple math problem. Calculate the sum of the tests and subtract this sum from the total number of tests (including the last test) multiplied by the lowest grade you want (A = 90, B = 80, etc.).
</p>

<ul>
<li>If the result is less than 0, return 0.</li>
<li>If the result is greater than 100, it is not possible to achieve the score you want, so return -1.</li>
<li>Otherwise, round the result up to the nearest integer and return that.</li>
</ul>
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2340&amp;rd=5071">ClapLight</a></b> 
</font> 
<A href="Javascript:openProblemRating(2340)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505659" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      132 / 185 (71.35%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      41 / 132 (31.06%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>HappyDude</b> for 470.04 points (7 mins 15 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      325.94 (for 41 correct submissions) 
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
      138 / 139 (99.28%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      68 / 138 (49.28%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>antimatter</b> for 247.21 points (3 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      205.23 (for 68 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
There are a couple ways to do this, but the constraints are low enough that a simple loop will from 0 to 1001 suffice:
</p>

<p>
for i = 0 to 1001
<br/>
&#160;&#160;&#160;&#160;if the number of background values less than i is less than or equal to 50% of the total number of background values, continue
<br/>
&#160;&#160;&#160;&#160;for j = 1 to background.length - 3
<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;if background[j] &lt; i &amp;&amp; background[j+1] &gt;= i &amp;&amp; background[j+2] &gt;= i &amp;&amp; background[j+3] &lt; i then
<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;continue loop i
<br/>
&#160;&#160;&#160;&#160;next j
<br/>
&#160;&#160;&#160;&#160;return i
<br/>
next i
</p>

<p>
An alternate way to do this is binary search, but again, the constraints are too low to warrant such effort.
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2263&amp;rd=5071">WaterLevel</a></b> 
</font> 
<A href="Javascript:openProblemRating(2263)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505659" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      43 / 185 (23.24%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      10 / 43 (23.26%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Billmaan</b> for 898.95 points (9 mins 45 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      566.18 (for 10 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Here we have what appears to be a relatively simple problem, but is slightly complicated because the lake can change from flooded to normal  state within a day (changing the evaporation rate) and vice versa. Even so, this problem requires only a simple loop with some switching logic depending on the day's rain amount and current level.
</p>

<p>
Because the flood plain is infinitely high, and the lake infinitely deep, it makes sense to use a double (can't use an int because of partial day issues) to represent the level of the lake, with 0 meaning exactly full - the starting state of the lake.
</p>

<p>
For each day, we need to determine that the change in the lake level will be. The logic for how much the level changes is identical whether flooded or not, with the exception of whether or not we use the flooded evaporation rate or the normal evaporation rate. (That may seem obvious if you recognize this problem as essentially being one function composed of two linear functions). Basically, there are three options for each day:
</p>
<ol>
   <li>The lake will stay in the same state (although the level may change).</li>
   <li>The change in lake level is enough to make it reach the boundary between states, but not so much that it actually changes. This happens when the expected change given the current state and rain is greater than the current level and when the rain for the day is between the flooded evaporation rate and the normal evaporation rate. In this case, an equilibrium is reached, and the lake ends up at exactly the full level.</li>
   <li>The lake will change states. This option requires determining during what fraction of the day the lake will be flooded and during what fraction of the day the lake will be normal - this is what tripped up many coders for this problem.</li>
</ol>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=1283&amp;rd=5071">Assemble</a></b> 
</font> 
<A href="Javascript:openProblemRating(1283)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505659" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
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
      79 / 139 (56.83%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      67 / 79 (84.81%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 628.28 points (5 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      423.14 (for 67 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
While I'm still not the best at programming with DP, I do recognize it fairly readily, and this problem simply screamed <b>DYNAMIC PROGRAMMING</b> at me as soon as I saw it. (As with most DP problems, a recursive approach with memorization also works well). I'll explain the recursive approach here.
</p>

<p>
Basically, you have a recursive function which takes a <b>from</b> index, a <b>to</b> index, and the array of connect values. Within the recursion, there are a few base cases:
</p>
<ol>
   <li>If you've calculated this result before, return it as stored.</li>
   <li>(<b>from</b> == <b>to</b>) - this simply returns 0.</li>
   <li>(<b>from</b> + 1 == <b>to</b>) - adjacent components. For this, you use the formula given.</li>
</ol>

<p>
Otherwise, you loop from <b>from</b> to <b>to</b>, splitting it into two segments, calculating the minimum cost of all combinations. For instance, if <b>from</b> is 2 and <b>to</b> is 6, you would recurse on ((2,2), (3,6)), ((2,3), (4,6)), ((2,4), (5,6)), and ((2,5), (6,6)). Once the minimum value is calculated, store it somewhere (a two dimensional array works nicely here).
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2825&amp;rd=5071">Lister</a></b> 
</font> 
<A href="Javascript:openProblemRating(2825)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505659" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      26 / 139 (18.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      14 / 26 (53.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 635.50 points (20 mins 11 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      443.05 (for 14 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem seems a little tricky at first, and indeed it is. The first thing to do is sort the names alphabetically. The constraints here are small enough to use an iterative approach on the number of rows to use. Basically, just start with 1 row, and increment until you find a solution. Within each trial for a number of rows, iterate over the number of columns to try. Now, within each column iteration, do the following:
</p>
<ul>
   <li>Append the current name to the next row in the output, keeping track of how long the longest one is in the current column.</li>
   <li>At the end of the column, pad each row with enough spaces to make it equivalent to the longest, plus one more for spacing between columns.</li>
   <li>If, at any point in appending names to a row, it becomes wider than the page is, fail and go to the next highest number of rows.</li>
   <li>Once a solution is found, store it if it is the best (determining best by the "rightmost non-space character as far to the left as possible" and "fewest columns" rules).</li>
</ul>

<p>
<img src="/i/m/zoidal_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112939" context="algorithm"/><br />
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
  