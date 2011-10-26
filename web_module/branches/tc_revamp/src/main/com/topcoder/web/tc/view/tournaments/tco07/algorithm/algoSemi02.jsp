<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="algorithm"/>
                    <jsp:param name="tabLev2" value="summary"/>
                    <jsp:param name="tabLev3" value="room2"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                                     <h1><span>Vitaliy wins Room 2!</span></h1>

                        <img src="/i/m/Olexiy_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=514955">Discuss this match</A><br>
Wednesday, June 27, 2007<br>
Introduction by <a href="/tc?module=MemberProfile&amp;cr=303644&amp;tab=alg" class="coderTextRed">Olexiy</a>

<img style="float:right; width:200px; 350px; padding-left:10px;" src="/i/tournament/tco07/shotR2.jpg">
<br><br>
<p>
For some minute-by-minute analysis, check out <tc-webtag:handle coderId="10574855" context="algorithm"/>'s latest <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=blogs&d4=Petr03">blog</a>.
</p>
<p>
<tc-webtag:handle coderId="21822659" context="algorithm"/> and <tc-webtag:handle coderId="14886245" context="algorithm"/> will be in the finals.
<tc-webtag:handle coderId="144400" context="algorithm"/>, <tc-webtag:handle coderId="7390224" context="algorithm"/>, <tc-webtag:handle coderId="311170" context="algorithm"/> and <tc-webtag:handle coderId="7442498" context="algorithm"/> will be in the wildcard round.
</p>
<p>
Congratulations to the advancers and good luck to the coders competing in the next rounds!
</p>

<p><span style="font-size:14px; font-weight:bold;">Curvy</span></p>
<p>by <tc-webtag:handle coderId="303185" context="algorithm"/></p>

<p>It's not hard to get the idea for solving this problem, but one needs to be careful and get all the details right case the examples don't take care of some corner cases. It's obvious that we have to simulate the steps in the problem. We start from a point in (0, 0) for example and we either do a translation if the current radius is 0 or a rotation. For simulating each step we need the current position of the point (curx, cury) and a vector (dx, dy) which specifies the current direction of the curve.</p>
<p>It's easy to handle the translation part:
</p>
<pre>
  curx += length[i] * dx;
  curx += length[i] * dy;
</pre>
For the rotation part we first need to know that to rotate a point (x1, y1) counter clockwise around another point (x, y) by an angle equal to ang we can use the following formula which is easy to prove:
<pre>
  x' = x + (x1 - x) * cos(ang) - (y1 - y) * sin(ang)
  y' = y + (x1 - x) * sin(ang) + (y1 - y) * cos(ang)
</pre>
To find the center of the circle we have to rotate the last point around at step i, we need to rotate the point (xx + dx * radius[i], yy + dy * radius[i]) for 90 degrees around point (curx, cury):
<pre>

  double xx = curx - dy * radius[i];
  double yy = cury + dx * radius[i];
</pre>
Now that we found the rotation center, we need to find the rotation angle:
<pre>
  double ang = length[i] * 1.0  / radius[i];
</pre>
Then we rotate the point so that we can find the new last point in the curve:
<pre>
  double newx = xx + (curx - xx) * Math.cos(ang) - (cury - yy)  * Math.sin(ang);
  double newy = yy + (curx - xx) * Math.sin(ang) + (cury - yy)  * Math.cos(ang);
</pre>
To get the slope at the new end of the curve, we use the slope perpendicular to the line which goes from the rotation center to the new ending point, and we find this slope by ... you guessed it, another rotation. One thing we have to check is if the radius was positive or negative so that we have the good direction for the vector. And another thing is that the vector (dx, dy) should always be one unit in size. After we've iterated trough all the pairs in the input we simply return sqrt( curx * curx + cury * cury).</p>
<p></p>
<p><span style="font-size:14px; font-weight:bold;">BigWheels</span></p>
<p>by <tc-webtag:handle coderId="287269" context="algorithm"/></p>
<p>
Deciding whether to stop or to spin again requires computing your probability of winning, given your current score.
This depends on what the other players will do, and their actions depend on the current highest score they are trying to beat.
These dependencies can all be untangled by forming a solution around recursive function that computes the probability that a player will win the game, given their score and the number of the next player to spin the wheel:
</p>

<pre>
    double ProbabilityOfWinning(int score, int next_player); </pre>

<p>
At the outermost loop, we can simply use this function to compute player 0's probability of winning with each number on the wheel, both if he stays or if he spins again.
All that's then left to write is the internals of this function.
</p>

<p>
First, the base case: if next_player is equal to the number of players (assuming 0-based indexing) then the current leader has won, and the function returns 1.0.
Otherwise, we return the average result for each of the possible values of next_player's first spin.
Each of these results is the maximum of their probability of winning if they stay with this number or if they spin again.  (Remember, they are all playing optimally.) The probability of winning if he spins again is also an average, computed from all the possible results of their second spin.
If their total score is less than or equal to the current high score, or greater than the maximum value on their wheel, that result is zero.
Otherwise, it is equal to the probability of this score standing up until the end of the game, which comes from a recursive call to this function with their higher score, and next_player+1.
</p>

<p>
Of course, given the size of the input, memoization on this function is necessary in order to make your solution finish in the time allowed.
</p>

<p><span style="font-size:14px; font-weight:bold;">NextBetter</span></p>
<p>by <tc-webtag:handle coderId="303185" context="algorithm"/></p>
<p>To get the next bigger solution, we first want to make sure our solution is larger in the lexicographic sense. As in most solutions that ask for the lexicographical minimal solution, we first try to fix some part of the result, and test if a valid solution still exists. Any solution can be split in three parts, first a prefix where the elements in the solution are equal to those in the candidate, this section can contain zero elements. Then either one element, which is larger than the corresponding element in the candidate but has a better quality match than the one in the candidate, or a sequence of elements where the first element is bigger than the corresponding element in the candidate and has equal quality match then the one in the candidate; then there are some more elements with equal quality match and one last element with larger quality match. The third section contains the remaining elements sorted. </p>
<p>The tricky part in this problem is dealing with the middle section. We keep the starting and the ending elements in this section fixed. What remains is to assign elements to the slots in the middle section and to make sure that all assigned elements have equal match quality with the matches in the candidate. This is in fact a maximum bipartite matching between the slots corresponding to the middle section and unused elements in the candidate sequence; the edges in this graph connect slots to elements such that the match quality resulted by placing the element in the slot is equal to the match quality in the candidate for the same slot. </p>
<p>After finding a matching which assigns one element to each slot in the middle section we know we have a valid solution. Now we have a way to check if a partial sequence can be part of a valid solution. Let's suppose we know the number of slots in the mid section (we can iterate over all possible lengths and return the minimum valid solution). To find the smallest valid solution we try to fix the first element in the middle section to be as close to the end of the sequence as possible, using the described matching to check for validity.  </p>
<p>Next we try to fix the next element to be as small as possible while checking again for validity. We repeat this until all slots are assigned. We add all the remaining elements in sorted order. </p>


<br /><br />
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
