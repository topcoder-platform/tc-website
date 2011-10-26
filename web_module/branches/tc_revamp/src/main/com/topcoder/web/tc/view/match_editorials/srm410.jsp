<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 410 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=12182">Match Overview</a><br />
    <tc-webtag:forumLink forumID="522342" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 410</span><br />Saturday, July 19, 2008
<br /><br />



<h2>Match summary</h2> 

<p>In both divisions, coders faced 1000-point problems that were even tougher 
than I'd anticipated. In Division 1, the hard problem received only two submissions, neither of 
which passed. In the end, the battle was between <!-- Eryx --><tc-webtag:handle coderId="8355516" context="algorithm"/> and 
<!-- krijgertje --><tc-webtag:handle coderId="9906197" context="algorithm"/>. <!-- Eryx --><tc-webtag:handle coderId="8355516" context="algorithm"/> was ahead after the coding 
phase, and towards the end of the challenge phase both had three successful 
challenges. Unfortunately for <!-- Eryx --><tc-webtag:handle coderId="8355516" context="algorithm"/>, his next challenge 
failed, leaving him just two points behind <!-- krijgertje --><tc-webtag:handle coderId="9906197" context="algorithm"/>. 
<!-- Al.Cash --><tc-webtag:handle coderId="22700469" context="algorithm"/>, <!-- Petr --><tc-webtag:handle coderId="10574855" context="algorithm"/> and <!-- Gluk --><tc-webtag:handle coderId="8433628" context="algorithm"/> 
completed the top five.</p>

<p>In Division 2, new-comer <!-- KMOD --><tc-webtag:handle coderId="10384028" context="algorithm"/> looked strong at the end of 
the challenge phase, but with his hard problem failing system tests, had to 
settle for second place. This left <!-- snomak --><tc-webtag:handle coderId="22671772" context="algorithm"/> in first and 
<!-- li0n192 --><tc-webtag:handle coderId="22744274" context="algorithm"/> in third. <!-- iBob --><tc-webtag:handle coderId="22741711" context="algorithm"/>'s was the only 
successful solution to the hard problem, but this left him with insufficient 
time to solve either of the others.</p>

<h1> 
The Problems 
</h1>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9729&amp;rd=12182" name="9729">ContiguousCacheEasy</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9729)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522342" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      688 / 961 (71.59%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      560 / 688 (81.40%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Valco</strong> for 235.88 points (7 mins 2 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      156.50 (for 560 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>The problem describes exactly what needs to be done, so solving it is a matter 
of handling the details. Let's say that we have the end-points of the current 
range stored in P and Q, with Q = P + k - 1. When a new byte at address A is 
requested, we can consider three cases. In the first case, A &lt; P, and so 
the new range start becomes P' = A. In the second case, A &gt; Q, and the new 
range end becomes Q' = A, and hence P' = A - k + 1. Finally, if P &le; A &le; 
Q then nothing needs to be done.</p>

<p>If the range moves, we have to calculate how many reads are required. Let d 
= |P - P'| be the distance of the move. If d &ge; k then the old and the new 
ranges have no overlap, so k reads are required. Otherwise, d reads are 
required.</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8817&amp;rd=12182" name="8817">AddElectricalWires</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8817)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522342" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      258 / 961 (26.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      47 / 258 (18.22%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>KMOD</strong> for 393.04 points (15 mins 44 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      260.86 (for 47 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      607 / 645 (94.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      326 / 607 (53.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>tmyklebu</strong> for 242.60 points (4 mins 59 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      169.39 (for 326 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>To start with, let's assign a <q>colour</q> to each mains node. We can then 
colour every connected node with the same colour, for example, using a 
depth-first search. Two nodes with the same colour can always be connected, 
two nodes with different colours can never be connected. The only decisions 
left are what to do with the nodes that currently have no colour, i.e., are 
not yet connected up to the grid. If there is just one such node, it is 
obviously best to connect it to all the nodes of one colour, choosing the 
colour that is most common. In fact, the same applies if we there are many 
such nodes, because doing so also allows us to add every missing connection 
between uncoloured nodes.</p>

<p>See <!-- dzhulgakov --><tc-webtag:handle coderId="22074135" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=298034&amp;rd=12182&amp;pm=8817&amp;cr=22074135">solution</a> 
for an example implementation.</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9727&amp;rd=12182" name="9727">ClosestRegex</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9727)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522342" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      11 / 961 (1.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 11 (9.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>iBob</strong> for 381.56 points (65 mins 18 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      381.56 (for 1 correct submission) 
    </td> 
  </tr> 
</table></blockquote> 
<p>Let's consider just the first character of the text and the first atom of 
the regular expression (regex). If the first atom is just a character, then 
there is only one option: the first character of the text must match it, and 
if it doesn't currently, it must be changed.</p>

<p>Things are more interesting when the first atom is of the form <tt>x*</tt>. 
There are now two cases to consider: either the <tt>x*</tt> matches zero 
characters, and can be removed, or the first character of the text must be (or 
become) an <tt>x</tt>, and the rest of the text must match the original regex, 
including the <tt>x*</tt>.</p>

<p>This leads to a natural recursive approach, trying both options in each 
case and taking the best, but it will be too slow. Fortunately, this can 
easily be handled with <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=dynProg">dynamic programming</a>. The table for DP is indexed 
by the length of a suffix of the text (in characters) and a suffix of the 
regex (in atoms).</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9728&amp;rd=12182" name="9728">ContiguousCache</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9728)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522342" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      259 / 645 (40.16%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      168 / 259 (64.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>myprasanna</strong> for 452.20 points (9 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      306.95 (for 168 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>The key to this problem is to consider two types of cache moves: those that 
overlap the previous range and those that don't. In the former case, one will 
always want to move the range by the smallest amount: larger amounts may save 
reads later, but by at most the number of extra reads now. On the other hand, 
when moving to a non-overlapping range, it may be advantageous to move the 
range further than necessary for now, to save on reads later.</p>

<p>Let's start by just considering moves that always keep an overlapping 
range, and try to determine where to place the range for the first read. 
Obviously, we would like as many subsequent reads as possible to fall in this 
range. We can do this by tracking the highest and lowest address read, and 
when they fall too far apart to cover with one range, place the initial range 
to just cover the earlier read while being as close as possible to the later 
read.</p>

<p>What about moves that split the range? It's not always clear where to use 
them, since in some cases they are not required in the present but are 
beneficial in the future. We can attack this with dynamic programming: let 
dp[i] be the minimum number of reads necessary for the first i reads. To 
compute dp[i], we first decide how many reads fall into this block of 
overlap-only moves (by trying all the options). If there are r reads in the 
current range, then the total cost is dp[i - r] plus the cost of the current 
range using only overlapping moves, solved as described above. Note that we 
don't need, in the DP, to keep track of where the range was left at the end of 
the block, since we assume that the initial range for the new block will not 
overlap it.</p>

<p><!-- krijgertje --><tc-webtag:handle coderId="9906197" context="algorithm"/> took a slightly simpler <a href="/stat?c=problem_solution&rm=298034&rd=12182&pm=9728&cr=9906197">approach</a>. 
He used dynamic programming, tracking the cost of doing the first i accesses 
and finishing with the range in position j. Normally this would be too 
expensive (since there are too many possible positions), but he noticed that 
the only useful ones are those at the very start and end of memory, and those 
with an end-point that is accessed by the program.</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9733&amp;rd=12182" name="9733">WifiPlanet</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9733)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522342" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 645 (0.31%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 2 (0.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td> 
  </tr> 
</table></blockquote> 
<p>This problem consists of two fairly separate parts. In the geometric part, 
one needs to break the arbitrary polygon into simpler shapes whose area can be 
more easily calculated. In the second, numerical part, one must determine the 
number of lattice points inside a simple shape.</p>

<p>Let's start with the geometry. One way to measure the area of a polygon to 
add up, for each edge, the signed area of the trapezium formed by that edge, 
two vertical sides and the X axis. The area of such a trapezium is 0.5(x2 - 
x1)(y1 + y2).</p>

<p>Of course, we're not interested in areas as such, we want to know how many 
lattice points fall within the polygon. Nevertheless, this will equal the sum 
of the numbers of lattice points inside each of the simple shapes (subtracting 
rather than adding when the area formula is negative), provided we are careful 
about the boundary conditions.</p>

<p>We can count the number of lattice points in each vertical strip and sum 
them up. This will give an expression of the form</p>
<div>
    <img src="/i/education/srm410_WifiPlanet0x.png" alt="WifiPlanet0x" />
</div>
<p>for some integers a, d and m. If either a or d lies outside the range [0, 
m), then the integer part can be moved outside of the floor and summed in the 
usual way for an arithmetic progression. Also, if d = 0, then the summation is 
trivial. So let us assume that both a lies in [0, m) and d in (0, m). 
We arrived at this expression by counting vertical strips, but with this 
assumption, we can also count horizontal strips, and obtain the formula 
(proving it is left as an exercise to the reader)</p>
<div>
    <img src="/i/education/srm410_WifiPlanet1x.png" alt="WifiPlanet1x" />
    <img src="/i/education/srm410_WifiPlanet2x.png" alt="WifiPlanet2x" />
</div>

<p>This is another expression of the original form, so you might think that 
we're no better off than when we started. However, we've replaced the 
denominator with a smaller one, in exactly the same way that the Euclidean 
algorithm efficiently finds the greatest common divisor. We will thus only 
need to perform a logarithmic number of these transformations before we find 
that d = 0 and we can terminate.</p>

<p>Exercises:</p>
<ol>
    <li>Show how the number of lattice points within a trapezoid whose left and right edges are at x1/<strong>denom</strong> and x2/<strong>denom</strong> can be written in the form shown, with a denominator of <strong>denom</strong>(x2 - x1).</li>
    <li>Show how the formula you just obtained can be simplified to eliminate <strong>denom</strong> from the denominator.</li>
    <li>Prove the equation above.</li>
    <li>Prove that the equation need only be applied O(log m) times.</li>
    <li>How would you check that the input data are valid? Specifically, how would you check whether the boundary of the polygon passes through any lattice points?</li>
    <li>If you want a real challenge, try to solve the problem without the restriction that the boundary does not hit a lattice point. This is how I originally set the problem, but it is extremely difficult to ensure that each boundary lattice point is counted exactly once.</li>
</ol>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/bmerry_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="251074" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
