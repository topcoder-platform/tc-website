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
<tc-webtag:forumLink forumID="505664" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 201</span><br>Tuesday, June 29, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
Congratulations to tomek for being the only one to successfully solve all three problems in Division 1. Also of note is a newcomer, shuniu, scoring the highest in Division 2. The match tonight was relatively smooth - a few issues with input verification surfaced late in the game, but were solved with minimal impact to the contest.
</p>
<p>
The Division 1 500 point problem took many contestance quite a while to code, likely due to the long and detailed problem statement. Division 1 1000 posed much more of a problem, unless you know trigonometry very well; even though you were given most of the algorithm and formulae necessary to solve, it was still a headache to code within the time limits. Overall, Division 2 had a moderate day, with relatively straightforward problem, but the 500 point problem seemed to trip people up with all the min/max code.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=343&amp;rd=5872">Multiples</a></b> 
</font> 
<A href="Javascript:openProblemRating(343)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505664" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      133 / 135 (98.52%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      111 / 133 (83.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Sleeve</b> for 249.81 points (0 mins 47 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      233.84 (for 111 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This is about as easy as they come. Very nice score, Sleeve, with only 47 seconds to solve. The simplest solution, which works because the constraints are so low, is best here: loop from <b>min</b> to <b>max</b> and check each number to see if it is divisible by <b>factor</b>.
</p>
<p>
If you want to get more efficient, you can increment <b>min</b> until you hit a number divisible by <b>factor</b>, decrement <b>max</b> until you hit a number divisible by <b>factor</b>, then subtract <b>min</b> from <b>max</b>, divide by <b>factor</b> and add 1.
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=1965&amp;rd=5872">ElevatorLimit</a></b> 
</font> 
<A href="Javascript:openProblemRating(1965)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505664" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      85 / 135 (62.96%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      42 / 85 (49.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>KSUGuy</b> for 472.96 points (6 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      313.99 (for 42 correct submissions) 
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
      127 / 130 (97.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      99 / 127 (77.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 247.79 points (2 mins 41 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      207.63 (for 99 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem is all about minimums and maximums. The basic algorithm is as follows:
Initialize a counter to 0, a minimum to a very high number (2<sup>31</sup> - 1 works well), and a maximum to a very low number (-2<sup>31</sup> would work here). The minimum and maximum will keep track of the lowest and highest counter ever gets.
For each stop x the elevator makes, decrement counter by exit[x], update your minimum, increment counter by enter[x], and update your maximum.
Once you're done, you know the how big the range of people is that were on the elevator throughout the simulation (maximum - minimum).
If the range is bigger than <b>physicalLimit</b> return an empty array because it's an impossible situation. Otherwise, the return value is {max(-minimum, 0), min(physicalLimit, physicalLimit - maximum)}.
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=1044&amp;rd=5872">WordSpaces</a></b> 
</font> 
<A href="Javascript:openProblemRating(1044)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505664" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      53 / 135 (39.26%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      22 / 53 (41.51%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>shuniu</b> for 832.96 points (13 mins 17 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      563.26 (for 22 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem involves nested loops - one for each word given in the array, one for each starting point in the sentence, and one for how many characters to skip. My approach was simply to append the characters from a starting point, skipping the right number of characters, and see if the final result started with the word I was looking for. If so, that's the return, otherwise keep looking. If one is never found, return -1 for that word.
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2888&amp;rd=5872">RPGRobot</a></b> 
</font> 
<A href="Javascript:openProblemRating(2888)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505664" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      58 / 130 (44.62%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      36 / 58 (62.07%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>antimatter</b> for 323.68 points (23 mins 54 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      228.81 (for 36 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
A favorite of mine (because I actually wanted to do this in the past), this one is maybe a little tricker than it looks. You have to consider three states of a "wall": on, off, and unknown. The unknown state is used for anything which is off the given map. Because we're guaranteed self-consistent input, we don't even have to keep track of the unknown area - if we see it, we can forget about it because the next time the robot moves into an adjacent (or the same) square, the same data will be presented to us. The solution that I used (and many others) is to initially assume that all spaces are valid (all spaces with an odd x and y coordinate, because those are the &lt;GAMESPACE&gt;s mentioned). After this, you iterate through each move the robot makes - if the description given makes a starting location invalid, mark it as invalid. Once you're done iterating through each move, return all the leftover ones.
</p>
<p>
An edge case that seemed to catch some people off guard was that the very edges of the given map do in fact border spaces off the map - and you have to take this into account and make sure that just because the robot could be off the map that you don't ignore the known walls there.
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2887&amp;rd=5872">DogWoods</a></b> 
</font> 
<A href="Javascript:openProblemRating(2887)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505664" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      2 / 130 (1.54%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 2 (50.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 557.95 points (31 mins 3 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      557.95 (for 1 correct submission) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
For this problem, you were basically given the algorithm and left to do the math yourself. The boring formulae for intersection of two circles was given, so you just had to plug that in and hope you didn't mistype something. What you weren't given was how to determine the arc length given two points on a circle; however, a background in trigonometry would lead you to a relatively simple solution using arctan (of course, you have to write your own, most likely, because the real function arctan has a range from -pi to pi, and you need a range that covers the whole circle.
</p>
<p>
Since all the really interesting cases were gotten rid of by the constraints (intersecting trees, trees whose closest points to the center were at the same distance from the center as another tree's furthest point from the center, trees that covered the center), all you really had to do was iterate until the dog hit the center:
<ul>
   <li>Find the tree that you would hit first in this diameter (if there isn't one, return -1).</li>
   <li>Travel around that tree until you are closest to the center. There are two cases here:</li>
<ol>
      <li>The point on that tree closest to the center is outside the circle of radius 10 (simpler).</li>
      <li>The point on that tree closest to the center is inside the circle of radius 10. In this case, you then have to intersect that tree with the circle of radius 10 at the center of the woods and use that point instead.</li>
</ol>
</ul>
Add up the distances as you go (distance around an arc is pi * radians * radius), and return. Simple double arithmetic works here, there's nothing fancy you have to do to avoid precision problems.
</p> 

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
