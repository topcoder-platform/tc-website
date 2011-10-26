<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS09 Online Round 1</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/tc?module=HSRoundOverview&rd=13728&snid=3&er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="525285" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS09 Online Round 1</span><br />Saturday, January 3, 2008
<br /><br />
<h2>Match summary</h2> 
<p> 
Round 1 of 2009 TCHS Tournament attracted 399 competitors, 
which is more than twice the number of participants in 2008 TCHS Tournament.
With at most 500 advancers to Round 2 it was enough to get a positive score to advance,
and nearly 90% of the participants managed to accomplish this.
The round was much easier than a regular HS match, and some competitors were done with all 3 problems in
as little as 20 minutes. 
<br></br>
<tc-webtag:handle coderId="22712322" context="hs_algorithm"/>
took the lead after the coding phase due to the fastest total time on the problems, 
with 
<tc-webtag:handle coderId="22263204" context="hs_algorithm"/>
and 
<tc-webtag:handle coderId="11972352" context="hs_algorithm"/>
closely following. 
The challenge phase brought 
<tc-webtag:handle coderId="22663117" context="hs_algorithm"/>
+25 points and the win. 
<tc-webtag:handle coderId="22712322" context="hs_algorithm"/>
and 
<tc-webtag:handle coderId="22263204" context="hs_algorithm"/>
took second and third places, respectively.
</p> 
 
<H1> 
The Problems 
</H1>
</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10254&amp;rd=13728" name="10254">SubwayTrip</a></b> 
</font> 
<A href="Javascript:openProblemRating(10254)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525285" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      353 / 386 (91.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      329 / 353 (93.20%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>merc90</b> for 249.44 points (1 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      201.92 (for 329 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
If you stand still, it will take you <b>L</b>/<b>Ve</b> minutes to reach the bottom of the escalator.
If you prefer to walk instead, it will take you <b>L</b>/(<b>Ve</b>+<b>Vy</b>) minutes, 
so you will arrive to the station <b>t</b><sub>1</sub>=(<b>L</b>/<b>Ve</b> - <b>L</b>/(<b>Ve</b>+<b>Vy</b>)) minutes earlier.
This will allow you to catch an earlier train if it arrives not earlier than <b>t</b><sub>1</sub>
minutes before the moment of your arrival to the station if you choose to stand on the escalator.
As follows from the statement, the probability of this event is equal to <b>t</b><sub>1</sub>/<b>T</b>. 
<br></br>
Note that if <b>t</b><sub>1</sub> is greater than <b>T</b>, 
you will catch an earlier train for sure,
so the probability of this event is 1 instead of <b>t</b><sub>1</sub>/<b>T</b>.
Most of the failed submissions on this problem either didn't consider this special case or 
processed it in a wrong way.
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=9929&amp;rd=13728" name="9929">BankLoans</a></b> 
</font> 
<A href="Javascript:openProblemRating(9929)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525285" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      336 / 386 (87.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      312 / 336 (92.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>xiaowuc1</b> for 492.96 points (3 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      384.67 (for 312 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Since the debtors turn out to be unreliable independently, the expected profit for the set of loans 
is simply the sum of expected profits for each individual loan.
If the debtor turns out to be unreliable, he returns no money, and the bank loses the amount loaned out to him. 
If the debtor is reliable, he returns both the base amount of the loan and the interest, so the bank 
gets a profit equal to the amount of the interest.
Thus, the expected profit for each loan is PROB/100 * (-AMOUNT) + ( 1 - PROB/100 ) * ( INTEREST ).
<br></br>
To find out the value of PROB for the loan, one had to map the value of CLASS for the loan to a corresponding
value of PROB using the information given in <b>riskClasses</b>. This could be done either by using a map with CLASS as a key and 
PROB as a value or in a more straightforward manner - by storing CLASS and PROB in different arrays 
and iterating through them to find the wanted CLASS.
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=10004&amp;rd=13728" name="10004">MazeReconstruction</a></b> 
</font> 
<A href="Javascript:openProblemRating(10004)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=525285" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      237 / 386 (61.40%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      219 / 237 (92.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>v3ctor</b> for 964.24 points (5 mins 30 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      719.54 (for 219 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First, let's have a look at the representation of the position in the maze 
and moving between positions.
The position in the maze can be described with three parameters: x and y coordinates 
of the cell (its row and column, respectively) and the direction you're facing. 
A convenient way to describe the direction is a pair (dx, dy), 
dx and dy being the changes in x and y coordinates that will
take place if you move one cell in this direction (thus, facing south corresponds to (1,0),
west - to (0,-1) etc).
The three kinds of moves are represented as follows: 
<ul><li>
moving forward 'F' updates the coordinates without changing the direction: x<sub>F</sub> = x + dx, y<sub>F</sub> = y + dy;
</li><li>
turning left and right 'L' and 'R' updates the direction without changing the coordinates:
dx<sub>L</sub> = - dy, dy<sub>L</sub> = dx or dx<sub>R</sub> = dy, dy<sub>R</sub> = - dx.
</li></ul>
The first part of the problem is to find the size of the maze and the coordinates of your initial 
position within it (the direction you're facing is already known). 
This can be done as follows: set the initial coordinates to (0,0)
and simulate the process of walking through the maze 
while storing minimal and maximal values of each coordinate for all visited cells. 
The number of rows and coulmns of the maze will be equal to (x<sub>max</sub> - x<sub>min</sub> + 1)
and (y<sub>max</sub> - y<sub>min</sub> + 1), respectively. 
After adjustment to the new coordinate system (with (0,0) being the north-west corner of the maze)
your initial position will be (-x<sub>min</sub>, -y<sub>min</sub>).
<br></br>
After this, a template of the maze can be created, as a String[] of required size filled with 'X'.
The initial coordinates are set to (-x<sub>min</sub>, -y<sub>min</sub>), and the process of walking
through the maze is repeated once more, this time the visited cells being marked with '.'.
<br></br>
Alternatively, we could have stored the coordinates of the visited cells during the first simulation,
and for each stored cell (x, y) mark the cell (x - x<sub>min</sub>, y - y<sub>min</sub>) in the template
as visited.
</p>

<div class="authorPhoto">
    <img src="/i/m/Nickolas_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15635590" context="algorithm" /><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
