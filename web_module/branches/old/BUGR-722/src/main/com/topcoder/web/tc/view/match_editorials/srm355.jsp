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
    <A href="/stat?c=round_overview&er=5&rd=10712">Match Overview</A><br>
    <tc-webtag:forumLink forumID="516052" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 355</span><br>Wednesday, June 20, 2007
<br><br>



<h2>Match summary</h2> 

<p>
The match in Division 1 started quietly, as most coders struggled
with an unusually tedious easy problem. However, the solutions 
finally started to pour in, as about 400 coders managed to submit
something, and several coders even submitted all three. However,
the challenge phase and the system tests proved most of the
submitted solutions wrong, leaving only 163 coders with positive scores, and
nobody with three problems correct. The pack was led by <tc-webtag:handle coderId="7485898" context="algorithm"/>
with the help of 3 successful challenges on top of his correct easy and hard submissions, 
followed by <tc-webtag:handle coderId="7504863" context="algorithm"/> (easy, medium and 100 challenge points) and <tc-webtag:handle coderId="14970299" context="algorithm"/> 
(easy and a very strong time on medium).</p> 

<p>Division 2 was won by <tc-webtag:handle coderId="21075542" context="algorithm"/> with a huge margin of about 270 points. He
was followed by newcomer <tc-webtag:handle coderId="10152824" context="algorithm"/> and <tc-webtag:handle coderId="22641525" context="algorithm"/>. Competitors encountered
another rather difficult set here, however, several coders managed to solve
all three problems.</p>

<p>Generally, this SRM's problems put the emphasis on creative thinking
and inventing new (albeit rather simple) ideas, and not on the knowledge
of existing algorithms. That has proven to be a tough experience even for some
top reds.</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7894&amp;rd=10712" name="7894">ValueAddedTax</a></b> </font> 
<A href="Javascript:openProblemRating(7894)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516052" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      558 / 574 (97.21%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      534 / 558 (95.70%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>bcsnmurthy</b> for 249.61 points (1 mins 7 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      231.98 (for 534 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem was very straightforward. One just needed to check if <b>product</b>
ever appears in <b>food</b>, and if it does, multiply <b>price</b> by 1.1 to get
the answer; otherwise multiply it by 1.18. See <tc-webtag:handle coderId="21075542" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=265245&rd=10712&pm=7894&cr=21075542">code</a> for a sample implementation.</p>
<p>When using Java, one had to be careful to avoid <tt>==</tt> and use <tt>.equals()</tt> instead.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7759&amp;rd=10712" name="7759">NoEights</a></b> </font> 
<A href="Javascript:openProblemRating(7759)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516052" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      505 / 574 (87.98%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      143 / 505 (28.32%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>GAZZASharp</b> for 514.71 points (7 mins 32 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      370.52 (for 143 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem allowed several different correct approaches. In my view,
the most elegant and easy to implement one was: return the number of eights in
the longest common prefix of <b>low</b> and <b>high</b>, but pay attention
to the length: if <b>low</b> is shorter than <b>high</b>, one needs to pad it with
zeroes and thus the answer will be 0 as there will be no common prefix.</p>
<p>For example, let <b>low</b> be 1838583, and <b>high</b> be 1838683. They have
a common prefix of 1838, and thus the answer is 2. However, if <b>low</b> was just 
183858, then padding it to the length of <b>high</b> yields 0183858, and no
common prefix, thus returning 0.</p>
<p>Once we have come up with such an idea, we need to prove it. Suppose the longest
common prefix of <b>low</b> and <b>high</b> is &alpha;, the digit following
it in <b>low</b> is <i>x</i>, and the digit following it in <b>high</b> is <i>y</i>.
I.e., <b>low</b> = &alpha;<i>x</i>..., <b>high</b> = &alpha;<i>y</i>..., both
ellipses have the same length and <i>x</i> is less than <i>y</i>. First, it's easy to see that
&alpha; will start every number between <b>low</b> and <b>high</b>, and thus
such a number of eights is unavoidable. But how do we not get more? If <i>y</i> is not equal to 8,
the number &alpha;<i>y</i>00..0 yields the required number of eights (and lies
between <b>low</b> and <b>high</b>), and if <i>y</i> equals 8, the number
&alpha;799..9 will do.</p>
<p>See <tc-webtag:handle coderId="21075542" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265245&rd=10712&pm=7759&cr=21075542">code</a> for a sample implementation.</p>
<p>The solution for this problem remains the same if we change the digit
8 to 1, 2, ..., 7. However, changing it to 0 or 9 makes it a little more tricky
&mdash; the correct solution for that modification (and its proof) is left
to the reader.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7886&amp;rd=10712" name="7886">MixingLiquids</a></b> </font> 
<A href="Javascript:openProblemRating(7886)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516052" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      950 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      85 / 574 (14.81%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      17 / 85 (20.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Msching</b> for 601.53 points (24 mins 53 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      428.11 (for 17 correct submissions) 
    </td>
  </tr>
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2">
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
      274 / 444 (61.71%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      97 / 274 (35.40%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>liympanda</b> for 271.31 points (9 mins 26 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      176.44 (for 97 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Consider <i>i</i>-th bottle. It contains <b>amount</b>[<i>i</i>] liters of
<b>percent</b>[<i>i</i>]-% liquid, which means <b>amount</b>[<i>i</i>]*<b>percent</b>[<i>i</i>]/100
liters of substance and <b>amount</b>[<i>i</i>]*(100-<b>percent</b>[<i>i</i>])/100
liters of water.</p>
<p>Suppose we pour together all the bottles we have. We can calculate the total
amount of substance and water we have by summing the above expressions; let
these amounts be <i>totalSubstance</i> and <i>totalWater</i>. To avoid division,
we can calculate them in centiliters (1/100 of a liter). Having done that,
we find the concentration (percentage) of the solution as 
<i>totalSubstance</i>/(<i>totalWater</i>+<i>totalSubstance</i>). We need that number to
be <b>need</b>/100. If it is, we're done &mdash; the answer is just the sum of all <b>amounts</b>.</p>
<p>In the other case, it is either more or less than required; suppose it's more.
Then we need to somehow reduce the 'substance' part of our mix. It is clear
that to achieve that faster we need to remove the bottle with the highest
available percentage of the substance. If that is not enough, remove the
bottle with the next highest percentage, and so on until we get the required percentage.
In most of the cases, however, we will at some point 'jump over' the required
percentage, which means that we need to take the last removed bottle partially.</p>
<p>The only remaining question is how to calculate how much of that bottle we
should take. At the first glance the most obvious way seems to be binary search.
However, let's examine the situation more carefully. Suppose all the remaining
bottles have <i>a</i> liters of substance and <i>b</i> liters of water, and
the last removed bottle had <i>c</i> liters of substance and <i>d</i> liters of water.
We need to find such <i>x</i> that (<i>a</i>+<i>x</i>*<i>c</i>)/(<i>a</i>+<i>b</i>+<i>x</i>*(<i>c</i>+<i>d</i>))=<b>need</b>/100. <i>x</i> denotes
the fraction of that bottle we should take.
Getting rid of the division, we get (<i>a</i>+<i>x</i>*<i>c</i>)*100=(<i>a</i>+<i>b</i>+<i>x</i>*(<i>c</i>+<i>d</i>))*<b>need</b> &mdash;
but that's a simple linear equation on <i>x</i>, so we can solve it easily and obtain the answer.</p>
<p>If the 'full mix's percentage is less than <b>need</b>, we do the same
thing, but start with the bottles with the lowest percentage instead of the highest.</p>
<p>A similar approach was <a href="/stat?c=problem_solution&rm=265204&rd=10712&pm=7886&cr=7485898">implemented</a>
by <tc-webtag:handle coderId="7485898" context="algorithm"/>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7539&amp;rd=10712" name="7539">Tetrahedron</a></b> </font> 
<A href="Javascript:openProblemRating(7539)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516052" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      135 / 444 (30.41%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      53 / 135 (39.26%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Egor</b> for 523.18 points (11 mins 13 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      334.64 (for 53 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Spatial geometry... Is it usually tough? Yes. Is this problem that tough? No! Strangely
enough, this problem allows an almost planar solution.</p>
<p>Let's name our vertices <i>A</i>, <i>B</i>, <i>C</i> and <i>D</i>. At the first step, we check if
triangles <i>ABC</i> and <i>ABD</i> are possible &mdash; that is, the triangle
inequality holds for them: <i>AB</i>+<i>BC</i>>=<i>AC</i>, <i>AB</i>+<i>AC</i>>=<i>BC</i>,
<i>AC</i>+<i>BC</i>>=<i>AB</i>, <i>AB</i>+<i>BD</i>>=<i>AD</i>, <i>AB</i>+<i>AD</i>>=<i>BD</i>,
<i>AD</i>+<i>BD</i>>=<i>AB</i>. If at least one of the above doesn't hold,
the answer is surely "NO".</p>
<p>In case they do, imagine the segment <i>AB</i> fixed in space, and triangles
<i>ABC</i> and <i>ABD</i> rotating around it. What is the maximal and minimal possible value for <i>CD</i>, then?
It is logical that the minimal possible value is achieved when they are in the same
plane and 'co-aligned' &mdash; that is, points <i>C</i> and <i>D</i> are in the same
semiplane with respect to <i>AB</i>, and the maximal possible value is achieved
when they are in the same plane but 'counter-aligned' (one can prove this
by applying the Pythagoras' theorem, I will omit the formulas, and just note
that if <i>AB</i> is along the Ox axis, then rotating the triangles around it keeps
the x-coordinates of <i>C</i> and <i>D</i> the same, thus the question is again
reduced to a planar question in the Oyz plane).</p>
<p>To calculate that bounds, we need to find the possible coordinates of <i>C</i>
and <i>D</i> in that plane. Suppose <i>A</i> has coordinates (0,0), <i>B</i>
is at (<i>b</i>,0), and C is at (<i>x</i>,<i>y</i>). To find <i>x</i>, we apply
the law of cosines: <i>x</i>=<i>AC</i>*cos(<i>A</i>), and
cos(<i>A</i>)=(<i>AC</i><sup>2</sup>+<i>AB</i><sup>2</sup>-<i>BC</i><sup>2</sup>)/(2*<i>AC</i>*<i>AB</i>).
Then we find <i>y</i> with the help of Pythagoras. Finding the coordinates of <i>D</i>
is done similarly, and then we just need to compute the required distances and
check <i>CD</i> against them.</p>
<p>See <tc-webtag:handle coderId="14970299" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265218&rd=10712&pm=7539&cr=14970299">code</a> for a simple implementation of this approach.</p>
<p><tc-webtag:handle coderId="16056366" context="algorithm"/> used a different approach not requiring any floating-point computations.
The formula given at <a href="http://www.mathpages.com/home/kmath424.htm">this page</a>
allows us to find the squared volume of a tetrahedron given its six sides. It turns out
that substituting impossible lengths of sides into that formula yields a negative
value for that square, and that fact was employed in <tc-webtag:handle coderId="16056366" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265218&rd=10712&pm=7539&cr=16056366">code</a>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7761&amp;rd=10712" name="7761">BeautifulHexagonalTilings</a></b>
</font>
<A href="Javascript:openProblemRating(7761)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516052" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      15 / 444 (3.38%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      7 / 15 (46.67%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Burunduk3</b> for 507.99 points (30 mins 26 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      427.39 (for 7 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
First, we need to somehow enumerate all the unit hexagons in our grid.
Let's introduce a coordinate system, like shown on the following picture:
<img src="/i/srm/srm355.gif"></p>
<p>That picture gives us a clue on how to find the coordinates of all
required unit hexagons: suppose the first coordinate is <i>x</i>,
and the second is <i>y</i>, then the equations limiting our
grid are:</p><ul>
<li><i>x</i>>=0</li>
<li><i>y</i>>=0</li>
<li><i>x</i>&lt;=<b>s</b>[2]+<b>s</b>[3]-2</li>
<li><i>y</i>&lt;=<b>s</b>[1]+<b>s</b>[2]-2</li>
<li><i>x</i>-<i>y</i>&lt;=<b>s</b>[0]-1</li>
<li><i>y</i>-<i>x</i>&lt;=<b>s</b>[1]-1</li>
</ul>
<p>So, basically, we just enumerate over all <i>x</i>'s and <i>y</i>'s between
0 and 100 and check the above constraints to get the list of unit hexagons.
It turns out that everything we need from now is just a simple backtracking.
We try to color each unit hexagon with each color, and prune if some colored hexagon
has too much neighbors of some color. It turns out that this
solution is quite fast, solving the biggest case in several tenths of a second.</p>
<p><tc-webtag:handle coderId="7485898" context="algorithm"/> is determining the list of eligible cells in a slightly
different manner in his <a href="/stat?c=problem_solution&rd=10712&rm=265204&cr=7485898&pm=7761">solution</a>,
however, you can surely refer to it for the backtracking part implementation.</p>
<p>The main difficulty was to convince oneself that such backtracking will run
in time. Many high-rated coders failed to do that, started to implement
difficult solutions involving dynamic programming, and couldn't do that
successfully. I can't really think of any reasonable advice on that &mdash; one 
probably needed to use his/her intuition, or go for that backtracking from
the lack of other implementable ideas.</p>
<p>Another interesting thing to notice is that by doing backtracking in the 'spiral'
order from the center of the grid helps to solve this problem with the grid side lengths
up to 8.
</p>


<br /><br />






<div class="authorPhoto">
    <img src="/i/m/Petr_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10574855" context="algorithm"/><br />
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
