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
    <A href="/stat?c=round_overview&er=5&rd=10006">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506001" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 326</span><br>Saturday, November 11, 2006
<br><br>

<h2>Match summary</h2> 

<tc-webtag:handle coderId="10574855" context="algorithm"/> continued his streak of impressive performances with a fairly wide margin of victory on a difficult problem set.  He was followed in Div I by targeteer <tc-webtag:handle coderId="19849563" context="algorithm"/> and standout TCHS competitor <tc-webtag:handle coderId="14886245" context="algorithm"/>.  A tough 550 point medium problem provided for an eventful challenge phase, with only 4 competitors making it through system tests with all problems intact. 
<br><br>
<tc-webtag:handle coderId="21886152" context="algorithm"/> finished at the top of Div II with 3 fast submissions and 3 successful challenges. He was followed by <tc-webtag:handle coderId="21835098" context="algorithm"/> and newcomer <tc-webtag:handle coderId="22658608" context="algorithm"/>, who appears to be one to watch out for.

<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6736&amp;rd=10006" name="6736">AdditionCycles</a></b> 
</font> 
<A href="Javascript:openProblemRating(6736)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506001" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      501 / 536 (93.47%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      468 / 501 (93.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>nfs</b> for 247.59 points (2 mins 48 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      212.16 (for 468 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
 

<p>The main challenge here is separating a number into individual digits.  This can be done a couple different ways:</p>

<ol>
<li>By converting the number into a string, and then looking at the individual characters of the string.</li>
<li>By using the modulo operator ("%", or "mod" in VB) to figure out the remainder of the number when divided by 10.  For example, 16 % 10 is 6 - which is the last digit in the number.  Once we've found the last digit, we divide by 10 in order to remove that digit, and repeat the process until we've processed all digits.</li>
</ol>

<p>Once we're able to separate a number into its digits, we can process one step of our cycle fairly simply.  Once we can process one step, we simply need to repeat that step until we arrive back at the original number (and count each step along the way).  None of the cycles are longer than 60 steps, so we need not have any performance concerns.</p>

<p><tc-webtag:handle coderId="21886152" context="algorithm"/>, the overall Div 2 winner, got a head start on the "shortest solution" competition by processing each step with the following terse bit of code: i=i%10*10+(i%10+i/10)%10; </p>
 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6803&amp;rd=10006" name="6803">PositiveID</a></b> 
</font> 
<A href="Javascript:openProblemRating(6803)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506001" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      277 / 536 (51.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      168 / 277 (60.65%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>miroslavb</b> for 463.93 points (8 mins 2 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      308.76 (for 168 correct submissions) 
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
      415 / 451 (92.02%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      365 / 415 (87.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>uxy</b> for 247.99 points (2 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      198.76 (for 365 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>Basically, the problem here is to discover the largest set of facts that apply to more than one suspect (and thus don't identify one subject uniquely).  The key realization to solving this problem is that we only have to consider two suspects at a time.  We don't have to worry about whether a set of facts applies to 3 or more suspects, as if a set of facts applies to 2 suspects that is enough.  On the other side, if a given set of facts doesn't apply completely to at least two suspects then it will either apply to no subjects or it will identify one suspect uniquely.  This leads to a fairly simple strategy: for each possible pair of suspects we count how many characteristics they share.  We then return the maximum number of shared characteristics found for any pairing.</p>

<p>The remaining challenge, then, is this: given two comma-delimited lists of facts, find the number of facts that are shared between the two.  A simple way to approach this is to use the split function on each string in order to make two arrays of strings.  You can then loop through the first array, and for each item loop through the second array to see whether it is present in the first list.  If it is, increment a counter.  Since duplicate and blank characteristics were disallowed, this is fairly straightforward.</p>
 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6731&amp;rd=10006" name="6731">PoolFiller</a></b> 
</font> 
<A href="Javascript:openProblemRating(6731)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506001" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      65 / 536 (12.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      15 / 65 (23.08%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>VictorAlushin</b> for 833.92 points (13 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      581.72 (for 15 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 


<p>The most natural way to solve this problem is by simulation.  Basically, we fill every square of the pool up to 9 (the highest level) and then simulate the water flowing out until it's done flowing.  We can then total up the amount of water remaining in the pool area, and that will be our pool's total capacity.</p>

<p>The hard part, then, is the simulation.  For each square of our grid, we should track two numbers: the height of the pool wall at that square, and the current "flow level" at that square.  The flow level represents the working height of that square, which can be either the current water level or the height of the wall if there is no water there.  Once we have set our wall heights (set by parsing the input <b>layout</b>) and set our "flow level"s (all 9s, the maximum), we can then repeatedly call a "FlowOut" function that will simulate  the water's flow.  We'll keep doing that until "FlowOut" returns a value indicating that no flowing occurred, and thus that our simulation is complete.</p>

<p>At each iteration, "FlowOut" will process each square of the grid as follows: </p>

<ol>
<li>Find the lowest "flow level" among the surrounding grid squares.  Treat the "flow level" of a square off the grid as zero.</li>
<li>Set this square's "flow level" to match that of its lowest neighbor.</li>
<li>If this makes the "flow level" in this square a value lower than the height of the wall in this square, then set the "flow level" back to the wall height (as walls do not flow).</li>
</ol>

<p>The above approach is not optimal - and it may take many repetitions of the above in order to move out all the excess water.  However, the constraints are such that the above approach proves to be fast enough.</p>
 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6730&amp;rd=10006" name="6730">InscribedTriangles</a></b> 
</font> 
<A href="Javascript:openProblemRating(6730)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506001" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      550 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      87 / 451 (19.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      33 / 87 (37.93%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 473.30 points (11 mins 50 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      283.62 (for 33 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>Geometry problems have a reputation for being tricky, and this problem will do nothing to dispel that perception.  Since there are too many possible angles to try a brute force solution, we need to prune the possibilities we consider by having some idea of what our possible maximum triangles can look like.  We can categorize these possible maximum triangles by the number of points that are constrained in at least one direction (ie. points that lie on the edge of a degree range):</p>

<b>0. Our best triangle has no constrained points</b>

<p>We can be certain that if a maximum triangle exists with no points on degree range boundaries then another triangle exists with at least one point on a degree range boundary.  This holds because rotating our triangle has no effect on area and thus we can simply rotate the triangle until at least one point is constrained.  This allows us to effectively ignore this case.</p>

<b>1. Our best triangle has one constrained point</b>

<p>If our best triangle has only one constrained point, then we can be sure that the triangle is equilateral.  Otherwise, we could move one or both of the unconstrained points in order to increase the triangle's area (as at least one of the two unconstrained points would not be on the midpoint of the arc between the other two points).  Since we know one point is constrained, it is sufficient to loop through all boundary points and for each of them test whether an equilateral can be made involving that point.  To check, we see if the points at (boundary angle+120&deg;) and (boundary angle+240&deg;) are available for use.  If they are, we have found an equilateral and we're done - as this will always be the largest triangle.</p>

<b>2. Our best triangle has 2 constrained points</b>

<p>If we pick any two points on a circle, the maximum area triangle will be formed by having the third point halfway between the first two points on either one side or the other.  Therefore, we can iterate through each pair of boundary points and check whether their midpoint on either side of the circle is in a usable space.  If it is not, then the best available triangle involving those two points will have all 3 points constrained and will be found during our last step.</p>

<b>3. Our best triangle has 3 constrained points</b>

<p>This is the simplest case to check - we simply iterate through each set of 3 boundary points and find the angles of all triangles formed.  As we have at most 60 boundary points, this does not present a time challenge.  If we had a larger set, we could prune the number of possibilities tried by only considering points nearest to the midpoint of each two points (and then only in cases where the precise midpoint was unavailable).</p>

<b>Putting it together</b>

<p>If we don't find an equilateral triangle, as per 1 above, we loop through all the possible triangles described in 2 and 3 above and keep track of the largest area found.  To calculate the area of a given triangle from the angles involved, we use the normal triangle area formula involving the cross product (see the <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=geometry1">geometry tutorial</a>).  That formula requires x/y co-ordinates, which on our circle are simply radius*cos(angle) and radius*sin(angle) respectively.</p>

 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6597&amp;rd=10006" name="6597">BerryPacker</a></b> 
</font> 
<A href="Javascript:openProblemRating(6597)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506001" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      34 / 451 (7.54%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      17 / 34 (50.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 712.08 points (19 mins 49 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      515.40 (for 17 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>The first thing we need to know in order to decide how to do the packing is the total number of boxes we are going to use - we'll refer to this as <b>n</b>.  This number is difficult to decide on, but for any given <b>n</b> the value of the best packing can be determined fairly quickly.  Therefore, we simply try every possible <b>n</b>.</p>

<p>Given <b>n</b>, the best packing can be determined greedily - but the evaluation is still somewhat complicated. I'll outline one possible strategy:</p>

<p>For each box from 0 to n-1, find out which inspectors will see this box.  We will categorize boxes based on the which inspectors will see the box, as boxes that are seen by the same set of inspectors can be treated the same way.  It is clear that when assigning berries we should fill boxes that will be seen by all inspectors before boxes that will be seen by only one.  However, it is less clear, for example, whether a box that is seen by inspectors 1, 2 and 3 should be filled before a box seen by inspectors 0 and 1.  This is because the value of showing a berry to an inspector varies with the number of boxes that inspector will see.  Showing a berry to an inspector who sees only a few boxes will have more impact on the final evaluation than showing a berry to an inspector who sees many boxes.</p>

<p>Moving forward then, our next step is to figure out how many boxes each inspector will see (given our current <b>n</b>).  As we count through the boxes, we can simply tally the number of boxes each inspector sees as we go.    Because an inspector's estimate is equal to "berries seen"*"number of boxes"/"boxes seen", showing that inspector one berry has an overall value of "number of boxes"/"boxes seen"/"number of inspectors."</p>

<p>We can now calculate the value of one berry in each category of box by looking at which inspectors see that category of box and summing the value of one berry to each of those inspectors.  For example, if inspectors 0 and 2 do not see a lot of boxes, we could find that each berry we put in a box that is seen by them is worth 20 berries in the final evaluation.  Remember that this evaluation is going to shift with <b>n</b>, as the number of boxes seen by each inspector will change.</p>

<p>Once we know the value of a berry in each category of box (and how many boxes we have of each category), we can greedily assign berries to box categories in order from highest to lowest value.  We must also remember that each box must be assigned at least one berry - so we can pre-assign those berries before we start.  As we assign berries to boxes, we  keep score of the total value of the shipment, and set our overall return value if this <b>n</b> has the best value we've seen thusfar.</p>

<p>The constraints are such that we do not need to be very efficient in performing the above evaluations, but it's  worth precalculating which inspectors will see each box, and coming up with an efficient way to find out how many boxes each inspector will see for a given value of <b>n</b>.  Because there are only 32 possible box categories, we don't need to be terribly efficient in sorting them at each step.</p>

<div class="authorPhoto">
    <img src="/i/m/jmzero_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15498334" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
