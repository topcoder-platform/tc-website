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
<tc-webtag:forumLink forumID="505605" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 167</span><br>Tuesday, October 14, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
The competition before the first online TCO round had some surprising results. Aside from a 
devious 750 point problem in division 1, division 2 had a seemingly difficult level 1. In fact, 
some people in division 2 ended up gaining rating points with a final score of 0.</p> 

<p><b>snewman</b> continued his advance towards the top ten, with the most significant jump in rating for 
  division 1. So far, he has submitted and passed everything that has been thrown his way. In addition, 
  this is his first official division 1 competition, his first division 1 win, and I believe he is the first 
  C# coder to do so. Division 2 saw an amazing 50 new coders, with one of them (<b>Andrew_Lazarev</b>) claiming 1st. Also of note is 
  <b>scn</b> who got 250 points on 5 successful challenges.
</p> 
 
<p>
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b>EyeDrops</b> 
</font> 
<A href="Javascript:openProblemRating(1750)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505605" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      184 / 278 (66.19%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      93 / 184 (50.54%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>splurk</b> for 284.75 points (6 mins 38 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      216.87 (for 93 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>Usually, the div 2 easy is a gimme. Not so this time. Only about half of the coders who submitted got points for it. At first glance, it seems like there is more than meets the eye. However, upon further examination, we happliy latch onto a correct greedy algorithm. There are two cases, one is if we can take pills on an optimal schedule. The second is if the sleep time is too long to fit within an optimal time period. In the first case, the answer is just (24 * 60) / k. In the second, we position times for taking the pills just before and after bedtime. Then, counting the gaps besides the sleeping gap, there are k - 1 gaps. So the answer in this case is (24 - sleepTime) * 60 / (k - 1).</p> 
  <p>One of the most common errors in this problem was to not cast the values to doubles before doing the division.</p>

<font size="+2"> 
<b>Animation</b> 
</font> 
<A href="Javascript:openProblemRating(1914)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505605" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      158 / 278 (56.83%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      115 / 158 (72.78%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ggrot</b> for 421.26 points (12 mins 47 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      304.80 (for 115 correct submissions) 
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
      226 / 233 (97.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      205 / 226 (90.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ZorbaTHut</b> for 244.20 points (4 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      202.73 (for 205 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>This was a simple simulation. The only tough part was to keep track of particles when they overlapped eachother. The two general methods used were to use a different character for when a L and R particle are overlapping, or keep track of each particle in a separate array. As an extension to the separate array method, you could use two 64-bit bitmasks to represent the left and right particles. This has the nice feature that the movement step is one line (just a bit shift), and worrying about overflow isn't necessary. The simulation is over when all the particles leave the string.</p>

<font size="+2"> 
<b>Orchard</b> 
</font> 
<A href="Javascript:openProblemRating(1859)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505605" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      44 / 278 (15.83%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      16 / 44 (36.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Andrew_Lazarev</b> for 676.46 points (17 mins 35 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      547.53 (for 16 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>This problem was a search for the best breadth-first search return value. The straightforward solution is to run a bfs from each location and find the first point at which we reach another tree or a wall. If we iterate over the rows in the outer loop, and the columns in the inner loop, we can avoid having to break ties. Simply return the coordinates of the best bfs starting location.</p>

<font size="+2"> 
<b>TeamPhoto</b> 
</font> 
<A href="Javascript:openProblemRating(1614)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505605" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      750 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      110 / 233 (47.21%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      31 / 110 (28.18%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>snewman</b> for 611.29 points (14 mins 13 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      457.06 (for 31 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
  In my entire topcoder career, this is the first time I've seen a 750. Surprisingly, 31 people got it right (not including myself), and there were many scores over 500. As it turns out, this problem is one of those "oh, darn, if only I'd thought of that" problems. That's right, a simple property of the problem makes it very easy to comprehend a solution. The property is, given a list of numbers that starts at one value, and ends at another, the minimum sum of all the adjacent differences is acheived by sorting the points that are not on the end in either increasing or decreasing order. After they are sorted, the only two values which are important in the sorted list are the minimum and maximum. So, the minimum answer for a range of numbers with end values of A and B, minimum value L, and maximum value H is (in java): 
  <br /> 
  <br /> 
  <pre>H - L + Math.min(Math.abs(A - L) + Math.abs(B - H), Math.abs(B - L) + Math.abs(A - H));</pre> 
  <br /> 
  Now there is the question of which side of the head coach to put the team players on. As it turns out, if you sort the list of ALL the players (without the coaches), the minimum return value can be acheived if you split the players at the median. However, if there are an odd number of players, you have to experiment with putting the middle guy on either side of the head coach. All in all, you have 4 independent variables, each of which can be one of two values, which gives you 16 tests to do. The variables are: 
<ol>
  <li>left side sort ascending or descending (handled by the min statement above)</li> 
  <li>right side sorted ascending or descending (handled by the min statement above)</li> 
  <li>middle player on left or right</li> 
  <li>assistant coach 1 on left or right</li> 
  </ol>
  </p>


<font size="+2"> 
<b>AlphaDice</b> 
</font> 
<A href="Javascript:openProblemRating(1761)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505605" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      80 / 233 (34.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      34 / 80 (42.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Xu Chuan</b> for 685.11 points (17 mins 4 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      474.43 (for 34 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>Don't you just hate problems where you have to rotate 3d objects in your mind? I know I do. I made the very big mistake in this problem of believing that multiple sides could have the same letter, even though an example showed otherwise. In any case, this problem consisted of two parts. One was determining if a roll given could match a cube with pre-assigned letters. The way I solved this is to establish two functions rotate() and flip(). The first rotates the cube around the top-bottom axis, the second rotates the cube around the left-right axis. With these two rotations, I can systematically place the cube in all 24 orientations that are possible, and see if the appropriate three letters match the roll.</p> 
  <p>The second part of the problem is to determine which letters should be on the other side of the first roll. We could just blindly assign all letters to the hidden sides, but why do that when we know which letters are required from the letters in the rolls. Alas, with 50 rolls, all the letters in the alphabet could be used, which brings us back to brute force. However, we can use a simple deduction to reduce our search space significantly. If any sequence of rolls has more than 6 distinct letters, then we know for sure that sequence is invalid. Therefore, there is no reason to try any more than 3 letters for the hidden sides. We simply use the letters from the largest sequence of rolls which does not exceed 6 letters. With only 3 letters to try, there are only 6 possible cubes that can be made. With our algorithm above, we can compare each of the 6 cubes with the given rolls, stopping if one doesn't match. We then return the maximum roll attained, or -1 if all rolls matched for one of the 6 cubes. In the case where less than 6 letters are specified in all the rolls, we simply assign invalid characters to the leftover sides. In my practice room solution I used lowercase 'x', 'y' and 'z' for any leftover spaces.</p>


<div class="authorPhoto">
    <img src="/i/m/schveiguy_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="273217" context="algorithm"/><br />
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
