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
<tc-webtag:forumLink forumID="505669" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 206</span><br>Wednesday, August 4, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p>
After winning Division II on Saturday, TopCoder member <b>&#45;&#95;&#45;</b> went two for two, winning Division I by a margin of over 140 points.  <b>&#45;&#95;&#45;</b> is now red, with a ranking of 2378 after competing in only two matches.  <b>SnapDragon</b> came in second, the only other coder to solve all three problems.  Rounding out the top five were <b>Eryx</b>, <b>jms137</b>, and <b>radeye</b>.
</p>
<p>
In Division II, <b>anikov</b> took the title by a margin of almost 200 points of <b>alsomagic</b>.  These top two were the only coders to solve all three problems.  <b>gmenhorn</b>, <b>ToadX</b>, and <b>lujo</b> (the only other coder to solve the 1000-point problem) took the 3rd, 4th, and 5th spots.
</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=520&amp;rd=5852"name="520">Bits</a> </b>
</font>
<A href="Javascript:openProblemRating(520)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505669" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
       174 / 181 (96.13%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       154 / 174 (88.51%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>coshx</b> for 249.65 points (1 mins 4 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       230.11 (for 154 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
With <i>b</i> bits, computers can represent numbers in the range 0 to 2<sup><i>b</i></sup>-1.
So, this problem is asking you to find the smallest <i>b</i> such that 2<sup><i>b</i></sup> > <i>n</i>.
This can be done by counting how many times you must divide <i>n</i> by 2 (throwing away the remainder) until you get zero:
</p>
<pre>
     int b = 0;
     while (n &gt; 0) {
         n = n / 2;
         b++;
     }
     return b;
</pre>
<p>
Others solved the problem by using Java's Integer.toBinaryString() method (or a similar function from their personal library of pre-written code), and returning the length of the string.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2435&amp;rd=5852" name="2435">OmahaLow</a></b>
</font>
<A href="Javascript:openProblemRating(2435)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505669" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
       101 / 181 (55.80%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       52 / 101 (51.49%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>gmenhorn</b> for 389.33 points (16 mins 8 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       238.24 (for 52 correct submissions)
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
       164 / 176 (93.18%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       136 / 164 (82.93%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>SnapDragon</b> for 242.41 points (5 mins 3 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       169.67 (for 136 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
Many people tried to solve this problem in clever ways, but this problem is most easily solved by brute force.  Five nested loops can easily give you all possible combinations of 3 of the five shared cards and 2 of the player's four
cards:
</p>
<pre>
     for (int s1=0; s&lt;5; s1++)
       for (int s2=s1+1; s2&lt;5; s2++)
         for (int s3=s2+1; s3&lt;5; s3++)
           for (int p1=0; p1&lt;4; p1++)
             for (int p2=p1+1; p2&lt;4; p2++) {
               string hand;
               hand += sharedCards[s1];
               hand += sharedCards[s2];
               hand += sharedCards[s3];
               hand += sharedCards[p1];
               hand += sharedCards[p2];
               ...
             }
</pre>
<p>
Inside the loop, you sort the characters in the string (high to low), make sure it's a legal low hand, and then check if it's lower than the lowest low hand you've seen so far.
</p>
<p>
That's not to say that there is anything wrong with clever solutions.
<b>SnapDragon</b> made use of STL sort() and next_permutation() methods and noticed that a simple string comparison was sufficient to test of one hand was lower than another, and coded up an elegant solution in just over 5 minutes (the fastest time for this problem).
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2919&amp;rd=5852" name="2919">Untypeset</a></b>
</font>
<A href="Javascript:openProblemRating(2919)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505669" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
       5 / 181 (2.76%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       3 / 5 (60.00%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>anikov</b> for 585.77 points (28 mins 33 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       481.73 (for 3 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
This problem was actually quite straightforward, and the example in the problem statement basically spelled out how to solve it.
But, as evidenced by only 3 successful solutions (out of 5 submissions total), the implementation was a bit on the tricky side.
</p>
<p>
This problem is best solved by recursion.
You write a recursive function that takes an array of strings as input and returns an integer.
This function determines if the input is an addition, division, or integer constant.
If the input is an integer constant, the function simply returns the value of that integer.
Otherwise, the input is addition or division, and the function breaks the array of strings into two subexpressions (the left and right for addition, or the top and bottom for subtraction).
It then recursively calls itself on the two subexpressions, adds or divides the two results, and returns that value.
</p>
<p>
To determine if the input is an integer, addition, or subtraction, loop over all the rows and see if any contain only '-' characters.
If so, then it is division.
Otherwise, loop over all columns and see if any contain a row of only spaces except for a single '+' character.
If so, then it is addition.
Otherwise, since the input is guaranteed to be legal and well-formed, it must be an integer constant.
</p>
<p>
Dealing with the spaces inserted around subexpressions can be done at the top of the recursive function, by simply trimming all blank rows and columns along the 4 edges.
</p>
<p>
See <b>anikov</b>'s solution for an example of a nice implementation of this solution.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2906&amp;rd=5852" name="2906">SensorGrid</a></b>
</font>
<A href="Javascript:openProblemRating(2906)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505669" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
       83 / 176 (47.16%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       43 / 83 (51.81%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>Ruberik</b> for 434.69 points (11 mins 22 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       298.90 (for 43 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
People tried many approaches to solving this problem, from a brute-force
O(n^5) search to some very clever algorithms.  It was my intention that the input size would be too large for O(n^5) searches, but they squeaked by in the time allowed.  Computers are just too fast these days...
</p>
<p>
A helpful observation is that the largest rectangle will be bounded on all four sides by a defective sensor or the edge of the grid.
The O(n^5) search loops over all points (and relevant edge) for each of the 4 sides.
Then with a 5th loop, it checks that no other points are inside this rectangle.
If there are none, then it checks if this rectangle is larger that the largest rectangle found so far (or higher if they have the same area, or further to the left if they have the same area and vertical position, or wider if they have the same area and upper-left position).
For an example of this approach see <b>Ruberik</b>'s solution, which he coded in under 11 and a half minutes for the fastest time on this problem.
</p>
<p>
<b>jms137</b> improved this search to O(n^4) with three loops to bound the left, right, and top sides of the rectangle, and then a fourth loop to find the highest point inside this region to give the bottom edge. </p> <p> <b>&#45;&#95;&#45;</b> and <b>SnapDragon</b> both implemented elegant O(n^3) solutions which are worth taking a look at.
<b>Cosmin.ro</b> claims to have an O(n^2) solution, which I hope he will share with us in the forums. </p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2920&amp;rd=5852" name="2920">HexagonIntersections</a></b>
</font>
<A href="Javascript:openProblemRating(2920)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505669" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2">
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Value</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       1100
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Submission Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       6 / 176 (3.41%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       2 / 6 (33.33%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>&#45;&#95;&#45;</b> for 485.17 points (47 mins 13 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       407.58 (for 2 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
This problem was simple to state, but the solution was elusive.
When dealing with geometry, you should be very worried about using floating-point numbers in your solution, as they can lead to numerical inaccuracies.
You should be even more worried when you see a problem that requires some exact math as this one does: you must count hexagons if the line segment passes through the interior, but not if it only intersects an edge or a corner.
Nonetheless, <b>&#45;&#95;&#45;</b> got his solution to work using floating point for the fastest time for this problem.  On the other hand, <b>SnapDragon</b>, the only other coder to solve this problem, used integer math.
That is what I had in mind for this problem, and I will describe how this works below.
</p>
<p>
The first important thing to realize is that you can convert the hexagonal grid so that the corners lie on integer coordinates.
An <i>affine transformation</i> (translation, scaling, rotation, shearing, and
reflection) applied to any two-dimensional figure will preserve straight lines.
That is to say, you can draw a straight line on a hexagonal grid, and then rotate, scale, and shear the image all you want, and the hexagons will still have 6 straight edges, and the line will still be straight and pass through the same hexagons as it did before.  By scaling the grid vertically and shearing it horizontally, you can get an equivalent grid shown in the figure below:
</p>
<center>
<img src="/i/srm/srm206_1.gif" border="0"></img>
</center>
<p>
The transformation from coordinates identifying hexagon centers given in the problem to coordinates on this grid is:
<blockquote>
<i>x<sup>'</sup></i> = <i>x</i> + <i>y</i> <br/> <i>y<sup>'</sup></i> = 2*<i>y</i> - <i>x</i> </blockquote> </p>

<p>
To simplify things a bit, you can first translate the line so that it starts at the origin (by subtracting (x0,y0) from (x1,y1)).
Then, using symmetry, you can reduce the range of directions of the line to limit the number of cases you need to consider.  In my solution, I rotated the line so that it would always point in the the range shown by the blue arrows in the figure below.
</p>

<center>
<img src="/i/srm/srm206_2.gif" border="0"></img>
</center>

<p>
Once everything is set up, you start at the origin and walk from hexagon to hexagon until you reach the destination.
Deciding which hexagon to move to can be done by checking what sides of the current hexagon's corners the line passes.  Referring to the figure above:
</p>
<ul>
<li>
If the line passes to the right (or clockwise) of point A, you step to the hexagon below.</li> <li>Otherwise, if the line passes to the right of point B, you step to the hexagon diagonally down and to the right.  (Note, this includes the case of the line passing through point A.)</li> <li>Otherwise, if the line passes to the left (counter clockwise) of point C, you step to the hexagon above.</li> <li>Otherwise, if the line passes to the left of point B, you step to the hexagon above and to the right.  (Note, this includes the case of the line passing through point C, and makes use of the limited range of directions for the line.)</li> <li>Otherwise, the line passes through point B you then check it against point D:</li> <li>If the line passes to the left of point D, you step to the hexagon above and to the right.</li> <li>Otherwise, if the line passes to the right of point D, you step to the hexagon below and to the right.</li> <li>Otherwise, the line passes through point D and you step to the hexagon to the right of point D (not shown).</li> </ul> <p> Note that the range of possible directions for the line limit the number of cases you need to consider to those cases above.
Testing which side of a point the line passes is done with a two-dimensional cross product:
<blockquote>
<i>c</i> = (x1 * corner_y) - (y1 * corner_x) </blockquote> If <i>c</i> is negative, the line passes to the left, if <i>c</i> is positive the line passes to the right, and if <i>c</i> is zero, the line passes through the point.
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

