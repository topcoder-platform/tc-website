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
<tc-webtag:forumLink forumID="505728" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 237</span><br>Wednesday, April 6, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
With the fastest time on the hard problem, <b>Eryx</b> finished first in division 1 by well over 100 points and moved up to number 3 in the overall ranking.
Coders <b>krijgertje</b> and <b>ivan_metelsky</b> finished in second and third place, each by a comfortable margin.
In division 2, <b>karavanas</b> took the top spot, followed by <b>syntaxglitch</b> and <b>Kentaro</b> in second and third.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4484&amp;rd=6536" name="4484">Cards </a></b> </font> 
<A href="Javascript:openProblemRating(4484)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505728" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
       193 / 207 (93.24%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       152 / 193 (78.76%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>nickel</b> for 246.32 points (3 mins 29 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       210.80 (for 152 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
When possible, it's nice to have the solution's structure mimic what's actually occurring in the problem.  Here we have that luxury.
First set up the variable you will be returning (String[], vector&lt;STRING&gt;,...).
Then loop through the deck, as a dealer would, and deal one to each player.
The only extra bit of information, is to check whether to deal another round.
Java code follows:
</p>

<blockquote>
<pre>
public String[] dealHands(int numPlayers, String deck) {
     String[] players = new String[numPlayers];
     java.util.Arrays.fill(players,""); //null Strings are annoying
     for (int left = deck.length(); left &gt;= numPlayers; )
    for (int i = 0; i &lt; numPlayers; i++, left--)
        players[i]+=deck.charAt(deck.length()-left);
     return players;
}
</pre>
</blockquote>

<p>
An alternate way would use modulus:
</p>

<blockquote>
<pre>
public String[] dealHands(int numPlayers, String deck) {
     String[] players = new String[numPlayers];
     java.util.Arrays.fill(players,""); //null Strings are still annoying
     for (int i = 0; i &lt; deck.length(); i++) {
    if (i%numPlayers==0 &amp;&amp; deck.length()-i&lt;numPlayers) break;
    players[i%numPlayers]+=deck.charAt(i);
     }
     return players;
}
</pre>
</blockquote>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4463&amp;rd=6536" name="4463">BoxUnion</a></b> </font>
<A href="Javascript:openProblemRating(4463)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505728" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
       55 / 207 (26.57%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       29 / 55 (52.73%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>BhaGeera</b> for 357.56 points (19 mins 39 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       255.30 (for 29 correct submissions)
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
       141 / 164 (85.98%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       128 / 141 (90.78%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>tomek</b> for 240.95 points (5 mins 32 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       174.43 (for 128 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
One approach to computing the area of the union would be to loop over all squares, and count those that are inside of at least one rectangle.
Unfortunately, because the maximum coordinate values are 20000, such a solution would be too slow.
A better approach is to use the
<a href="http://mathworld.wolfram.com/Inclusion-ExclusionPrinciple.html">
inclusion-exclusion principle</a>.
Considering the example from the problem statement:
</p>

<center>
<img src="/i/srm/srm237.gif" />
</center>

<p>
you start by summing the area of the three rectangles individually:
</p>

<blockquote><pre>
   4*3 + 5*3 + 4*4
= 12 + 15 + 16
= 43
</pre></blockquote>

<p>
Notice that we have overcounted the squares where any two rectangles overlap.
To correct this, we subtract the area of the <i>intersection</i> of each pair of rectangles:
</p>

<blockquote><pre>
   43 - 1*2 - 3*1 - 2*2
= 43 - 2 - 3 - 4
= 34
</pre></blockquote>

<p>
But now consider the area where <i>all three</i> rectangles overlap.
We counted this area three times in the first step, and then subtracted it three times in the second step.
To make sure it gets counted exactly once, we need to add the area of the intersection of all three rectangles back in:
</p>

<blockquote><pre>
   34 + 1*1
= 34 + 1
= 35
</pre></blockquote>

<p>
And this is the correct answer.  More generally, you compute the area of the intersection of all non-empty subsets of rectangles (with three rectangles, there are 7 non-empty subsets).  If the subset contains an odd number of rectangles, you add its area to the total, and if it contains an even number of rectangles, you subtract it from the total.
</p>

<p>
Notice that we only ever need to find the intersection of rectangles, which is easier than finding the union because the intersection of two rectangles is always either empty or another rectangle.
To intersect two rectangles, you simply
take the maximum of their left coordinates, the maximum of their bottom coordinates, the minimum of their right coordinates, and the minimum of their top coordinates.
</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4462&amp;rd=6536" name="4462">MirrorPath</a></b> </font> 
<A href="Javascript:openProblemRating(4462)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505728" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
       31 / 207 (14.98%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       17 / 31 (54.84%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>syntaxglitch</b> for 660.85 points (23 mins 0 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       546.57 (for 17 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
This problem is solved in two steps: finding the location and direction to begin in, and then tracing the path through the maze.
To find the initial square, you simple loop over all boundary squares until you find a '.' character.
There will be exactly 2, and it doesn't matter which one you select.
The initial direction will depend on which side of the maze you found the '.' character.  You don't need to worry about what to do if you start in a corner, because this is specifically disallowed in the problem statement.
</p>

<p>
Tracing the path through the maze involves implementing a simple state machine.
At each step, you decide what to do based on the character at that location of the map.
If it is a '.', you replace it with either a '-' (if the laser is currently traveling left or right) or a '|' (if the laser is currently traveling up or down).
If it is a '/' mirror, you change direction: left &lt;--&gt; down, right &lt;--&gt; up.
If it is a '`' mirror, you change direction: left &lt;--&gt; up, right &lt;--&gt; down.
If it is a '-' or '|' character, you replace it with '+' (more on this below).
You do not need to worry about hitting a '#', as the problem statement guarantees that the path will exit the maze (and therefore not hit any walls).
After each step, you update the laser's position by moving it one square in the current direction.
</p>

<p>
Note that if you encounter a '|' or '-' character, the laser is crossing its own path.  You can simply replace the character with a '+', without worrying about your current direction.  Why?  Because it is impossible for the laser to retrace any part of its own path, forward or backward.
The only possible way for the laser to enter the same square twice is if it is crossing in the perpendicular direction.
It is impossible for it to enter the same square more than twice.
</p>

<p>
See coder <b>Kentaro</b>'s submission for a clean and easy-to-understand solution to this problem.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3944&amp;rd=6536" name="3944">CakeDivision</a></b> </font> 
<A href="Javascript:openProblemRating(3944)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505728" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
       71 / 164 (43.29%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       65 / 71 (91.55%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>evgeni</b> for 554.00 points (8 mins 19 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       387.69 (for 65 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
The key to solving this problem is to realize that there are a limited number of cuts you can make at any one time.
To divide a rectangle into N equal-area pieces, you know that the first cut will divide the rectangle into two pieces with area proportional to
1 and N-1, or 2 and N-2, or 3 and N-3, etc.
Therefore, there are only N-1 possible first cuts in the horizontal direction, and N-1 possible first cuts in the vertical direction.
Because of symmetry, you can eliminate about half of these.
</p>

<p>
This leads to a nice recursive algorithm, where at each step you consider all possible cuts, and recurse on the two resulting pieces.
The recursive function takes as parameters the width and height of the rectangle it is dividing and the number of pieces it is to divide it into.  It returns the smallest possible maximum aspect ratio it has found of the resulting pieces.  The base case for the recursion is when the number of pieces is equal to 1, in which case you simply return the aspect ratio of the rectangle.
</p>

<p>
Although not necessary given the limits on the input for this problem, the recursive algorithm could be sped up with memoization.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4461&amp;rd=6536" name="4461">MirrorPlacement</a></b>
</font>
<A href="Javascript:openProblemRating(4461)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505728" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
       14 / 164 (8.54%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       11 / 14 (78.57%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>Eryx</b> for 719.89 points (15 mins 0 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       471.74 (for 11 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
The key to solving this problem is to convince yourself that it can be solved with a simple breadth-first search, and that you do not need to keep track of the positions of any mirrors you have placed.  I'll describe the search first, and then explain why this works afterward.
</p>

<p>
After you have determined the starting square (either one will do), you perform a breadth-first search starting at that square.
The state is the laser's position and direction.
At each step, the weights to neighboring states depend on (and only on) the characters given in the map:
</p>
<ul>
<li>If the character is a '.', it can continue in the same direction with a cost of zero, or it can turn 90 degrees (i.e. placing a mirror) with a cost of 1.</li> <li>If the character is a '/' or '`', it hits a pre-existing mirror and must turn in the reflected direction, but with a cost of zero.</li> <li>If the character is a '#', you terminate that branch of the search.</li> </ul>

<p>
Once you have searched the entire space, the distance associated with the ending square (in the direction pointing out of the maze) is the number of mirrors you would have had to add to arrive there.
If you structure you search well, such that you consider all states in order of distance, you can stop the search as soon as you reach the exit square.
</p>

<p>
Now, you may be wondering how you can get away with not remembering the locations of mirrors you have already placed.
For example, when encountering a '.' character, it would be wrong to assume that you can go straight through it if you have already placed a mirror there.  Or worse, it would be wrong to assume you can place a mirror if you have already placed one there oriented in the other direction.
Finally, it seems that it would be important to know that the laser could bounce off the back of a previously-placed mirror "for free", without having to place it in the same square a second time.
But there's no way to know this if you don't keep trace of the mirrors you've placed.
</p>

<p>
All of these concerns vanish in a puff of logic when you consider what you are searching for: the number of mirrors in the optimal path from the start to end.
An optimal path <i>never</i> does any of the following:
</p>
<ul>
<li>retraces any part of its own path in the same direction (a cycle could never improve the optimality of a path)</li> <li>retraces any part of its own path in the opposite direction (backtracking would lead the laser back out the opening in which it started)</li> <li>requires placing two conflicting mirrors on the same square (this would cause part of the path to be retraced, which is non-optimal)</li> <li>bounces off both sides of the same mirror (replacing the mirror with the opposite mirror would lead to a more optimal path)</li> </ul>

<p>
In other words, we don't have to disallow any illegal behavior because <i>the breadth-first search finds the optimal path</i>, and <i>the optimal path does not include anything illegal</i>.
The only time an optimal path were to enter the same square twice is if it were crossing itself perpendicularly, with no mirror in that square.
</p>

<p>
<img src="/i/m/legakis_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="287269" context="algorithm"/><br />
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
