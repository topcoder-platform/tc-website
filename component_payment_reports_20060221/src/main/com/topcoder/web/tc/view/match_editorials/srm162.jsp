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
<tc-webtag:forumLink forumID="505598" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 162</span><br>Wednesday, September 3, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
About 15 minutes into the competition, both <b>SnapDragon</b> and <b>tomek</b>
had submitted the easy and medium, with <b>SnapDragon</b> leading by only 17
hundredths of  a point.  However, by submitting the level 3 in under 14
minutes, <b>tomek</b> pulled ahead and ended up winning the division.  With his
second contest win, <b>tomek</b> pushed his rating up to become the second
highest rated coder.  The problem set provided some interesting stats, with
some of the highest success rates among submissions that I've seen in a while.
In Division 1 alone, over 80% of all problems submitted passed system tests.
In Division 2, newcomers <b>EugeneY</b> and <b>iforiq</b> took the first and
second spots.  A good mix of topics, the problems covered simulation, geometry,
combinatorics, and of course, brute force.
</p> 
  
<H1> 
The Problems 
</H1> 

<font size="+2"> 
<b>LCMRange</b> 
</font><A href="Javascript:openProblemRating(1792)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505598" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      155 / 188 (82.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      120 / 155 (77.42%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>sh_maestro</b> for 247.72 points (2 mins 43 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      202.09 (for 120 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
There is a very straightforward solution to this problem which involves knowing
the greatest common denominator (gcd) formula.  Fortunately, this was a
division 2 easy, so brute force also works.  Simply start at 1 and increment
until you get a number which is divisible by all the numbers in the range.  To
check if a number is divisible, use the mod operator (% in Java, C++, and C#,
Mod in Visual Basic .net).  If a % b = 0, then a is divisible by b.  Since
1-12 was the worst case, and the answer was only 27720, the worst case only
does 12 * 27720 operations.
</p>

<p>
If you know gcd, then the lcm of two numbers is simply:
</p>
<p>
a / gcd(a, b) * b
</p>

<p>
The lcm of a sequence of numbers is:
</p>
<p>
lcm(a<sub>0</sub>, lcm(a<sub>1</sub>, ... lcm(a<sub>n-1</sub>, a<sub>n</sub>)...))
</p>
<p>
so the code can be written:
</p>

<pre>
int ret = first;
for(int i = first; i &lt;= last; i++)
  ret = ret / gcd(ret, i) * i;
return ret;
</pre>

<font size="+2"> 
<b>PaperFold</b> 
</font><A href="Javascript:openProblemRating(1846)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505598" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      137 / 188 (72.87%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      75 / 137 (54.74%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>EugeneY</b> for 470.44 points (7 mins 12 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      327.50 (for 75 correct submissions) 
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
      137 / 143 (95.80%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      122 / 137 (89.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>sjelkjd</b> for 248.54 points (2 mins 10 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      213.92 (for 122 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
I think I remember Mr. Wizard proving that you can't fold a paper more than 8
times.  In any case, this problem is solved with a simple brute force
algorithm.  Since folding the paper in one direction is independent of folding
it in another direction, it makes sense to consider both directions
independently.  Also, since you can rotate 90 degrees, you should try fitting
each dimension of the paper in each dimension of the box.  If the number of
folds required for either orientation exceeds 8, then that orientation is
invalid.  If neither is valid, return -1, otherwise, return the minimum of the
valid ones.
</p>

<p>
I saw three approaches to representing the numbers in this problem.  First, and
easiest, was with doubles.  Since we are only ever dividing by 2, doubles can
accurately represent the numbers with no problems.  The second is by
multiplying everything by 2<sup>8</sup>.  Since you will only ever divide any
value 8 times, the precision will be there.  The final, and probably most
creative method (as seen in <b>sjelkjd</b>'s solution), is to multiply the box by 2
instead of dividing the paper by 2 for each fold.
</p> 

<font size="+2"> 
<b>SMBus</b> 
</font><A href="Javascript:openProblemRating(1841)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505598" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      23 / 188 (12.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      22 / 23 (95.65%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>PadawanLearner</b> for 707.89 points (20 mins 4 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      527.14 (for 22 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem was a straightforward simulation.  To solve it, you must keep
track of which masters have transmitted their messages, which masters still
need to transmit their messages, and which masters are currently transmitting
their messages.  When the bus is free, each master that has not yet transmitted
tries to transmit.  For each byte transmitted, you must first check for the
slowest master currently transmitting the byte, and add its transmission time
to the total time.  Then, check to see the lowest byte transmitted.  Finally,
any masters that did not transmit the lowest byte should lose their currently
transmitting status.  The message is over when one master reaches the end of
its transmission.  At this point, all masters who have not transmitted their
messages should retry transmitting.  The simulation ends when all masters have
transmitted their messages.
</p> 

<font size="+2"> 
<b>JarBox</b> 
</font><A href="Javascript:openProblemRating(1586)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505598" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      83 / 143 (58.04%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      69 / 83 (83.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 440.69 points (10 mins 43 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      296.67 (for 69 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Inspired by trying to fit too many jars into my refrigerator, this problem
involves some fundamental geometry and some looping.
</p>

<p>
First, we must establish how to calculate the width of a box that holds jars.
It becomes quite clear from looking at the examples that there are two
possibilities.  One where all the odd rows have one more jar than the even
rows, and one where both the even and odd rows have the same number of jars.
In the first case the width is just enough to fit the odd rows of jars.  In
the second case, the width is enough to hold the odd rows of jars, plus one
more radius to hold the even rows, since the rows are skewed by one radius.
</p>

<p>
Second, we must establish how to calculate the length.  This is where the
geometry comes in.  Since a jar in row <i>n</i> is touching two jars in row
<i>n-1</i>, and the two jars in row <i>n-1</i> are both touching each other, it
is clear that the distance between the centers of any two of these jars is
2*radius, or 2r.  We can form a triangle between the three centers, and since
all sides of this triangle are equal, we have an equilateral triangle.  If we
split the triangle in half down the center, we have two right triangles, with a
width of r, and a hypotenuse of 2r (see diagram).  If we use the pythagorean
theorem, we can calculate the length:
</p>
<p>
<img src="/i/srm_162.gif" width="203" height="190" border="0"/>
</p>

<pre>
r<sup>2</sup> + L<sup>2</sup> = (2r)<sup>2</sup>
L<sup>2</sup> = 4r<sup>2</sup> - r<sup>2</sup>
L<sup>2</sup> = 3r<sup>2</sup>
L = sqrt(3) * r.
</pre>

<p>
This means that the center of each row is sqrt(3) * r away from the center of
the previous row.  So the length of a box will be:
</p>
<p>
r + sqrt(3) * r * (rows-1) + r
</p>
<p>
The two r's on the ends are for the distance from the bottom of the box to the
center of the first row, and the distance from the center of the last row to
the top of the box.
</p>

<p>
Once the math is done, we can iterate through all the possible widths (one
radius at a time) and fit as many rows as possible into the resulting height.
We then take the maximum of these values.
</p> 

<font size="+2"> 
<b>PermutationCounter</b> 
</font><A href="Javascript:openProblemRating(1752)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505598" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      27 / 143 (18.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      22 / 27 (81.48%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>NGBronson</b> for 866.05 points (11 mins 32 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      629.30 (for 22 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
The name of this problem, although it is never really mentioned in the problem
statement, is a big clue on how to solve it.  Basically, you need to calculate
all the permutations that are lexicographically smaller than the given
permutation.  However, using a function like next_permutation isn't going to
help because there are just too many permutations to loop through.  So we need
to establish a way to calculate the number of permutations up to a certain
point quickly.
</p>

<p>
First, we define the choice function as the number of ways to choose exactly n
locations out of m possible locations.  There is a nice closed formula for
this:
</p>

<p>
C(n,m) = m!/((m-n)! * n!)
</p>

<p>
However, these numbers can get very large, even if the result of the formula is
very small.  There is also a recursive way to define the choice function, which
will guarantee that the largest number you calculate is the answer.  However,
if you use this method, you should use some kind of memoization to avoid
timeouts.  The recursive relationship is:
</p>

<p>
C(0,m) = 1<br/>
C(n,0) = 0<br/>
C(n,m) = C(n-1, m-1) + C(n,m-1)<br/>
</p>

<p>
Now, we can calculate the number of permutations that are less than a given
number.  Let's say that we have the number 20012011211.  The most significant
digit of this number is the 2 at the front.  There are a certain number of ways
to arrange this group of digits.  Some of them are below the current
arrangement lexicographically, and some are above.  We know that at least all
the arrangements that start with a digit lower than '2' are below.  If we use a
'1' as the first digit, we have four 1's and three 2's left to arrange.  This
can be done by picking all possible places for each of the digits.  First we
count all the ways to choose 4 locations out of the 10 remaining for the '1'
digits.  Then we count all the ways to choose 3 locations out of the remaining
6 for the '2' digits.  The result is:
</p>
<p>
C(4,10) * C(3,6).
</p>
<p>
Next, we know that all permutations that are less than 11 digits long
(i.e. start with a '0') are less than the current permutation.  So we choose 5
out of 10 locations for the '1' digits, and 3 out of 5 locations for the '2'
digits.  The result is:
</p>
<p>
C(5,10) * C(3,5).  
</p>

<p>
Once we have exhausted all the digits lower than the original first digit,
there is no nice formula to use, but we can simply move on to the next non-zero
digit and repeat the process.  So the number of permutations less than
20012011211 is the number of permutations of this number which start with 0 or
1 plus the number of permutations of 12011211 that are less than that number.
</p> 

<p>
<img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="273217" context="algorithm"/><br />
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
