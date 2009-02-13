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
    <A href="/stat?c=round_overview&er=5&rd=10005">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506000" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 325</span><br>Thursday, November 2, 2006
<br><br>

<h2>Match summary</h2>
This 9pm EST SRM attracted many long established Topcoder members, but had slightly below average numbers for a money SRM.  It would appear as if it were a great opportunity to win a little bit of cash, but the high number of targets competing made it a tricky proposition.
<br><br>
Division 1 was once again the scene for some recordbreaking scores, as the targets cashed in on a relatively simple 1000 point problem.  The tricky 500 also led to ample opportunity for challenges.  Unsurprisingly, the top 3 were comprised of <tc-webtag:handle coderId="144400" context="algorithm"/>, <tc-webtag:handle coderId="8355516" context="algorithm"/> and <tc-webtag:handle coderId="10574855" context="algorithm"/> - all targets who got over 900 points of the hard problem.  <tc-webtag:handle coderId="144400" context="algorithm"/>'s fantastic 960 points, as well as 2 challenges, was good enough for a solid win and another spot on the <a href="http://www.topcoder.com/stat?&c=highest_totals&dn=1">Top 10 highest match totals</a>.  <tc-webtag:handle coderId="19929536" context="algorithm"/> and <tc-webtag:handle coderId="270505" context="algorithm"/> finished 4th and 5th, both with 800+ scores on the hard and an excellent challenge phase.
<br><br>
Special congratulations to <tc-webtag:handle coderId="19929536" context="algorithm"/> for racing to achieve target status in a mere 15 competitions!
<br><br>
Division 2 was dominated by newcomer <tc-webtag:handle coderId="22656338" context="algorithm"/>, who completed all problems within 33 minutes, and even managed 2 successful challenges on his first SRM.  <tc-webtag:handle coderId="22630219" context="algorithm"/>, <tc-webtag:handle coderId="22627682" context="algorithm"/>, <tc-webtag:handle coderId="20274005" context="algorithm"/> and <tc-webtag:handle coderId="15604762" context="algorithm"/> took second through fifth places.
<br><br>
In addition, the Topcoder College Tour was visiting SUNY Binghamton this week, introducing the competition to students who may not have competed before.  <tc-webtag:handle coderId="8405957" context="algorithm"/>, <tc-webtag:handle coderId="10601380" context="algorithm"/> and <tc-webtag:handle coderId="267465" context="algorithm"/> won themselves an iPod Nano, a 1GB flash drive and a $50 voucher from Amazon.com for their troubles.  Aaah, to be young and studying again...
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6822&amp;rd=10005" name="6822">SalaryCalculator</a></b>
</font>
<A href="Javascript:openProblemRating(6822)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506000" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      447 / 458 (97.60%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      407 / 447 (91.05%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Mloody2000</b> for 249.16 points (1 mins 39 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      226.47 (for 407 correct submissions)
    </td>
  </tr>
</table></blockquote>
There are just 2 cases to be considered here, each of which can be solved with simple algebra.  Either the worker can earn <b>salary</b> within his first 200 hours, or he cannot.  To test whether 200 hours is sufficient, we merely ask if <b>salary</b> &le; <b>P1</b> * <b>200</b>.
<ul><li>If 200 hours is sufficient, we can simply divide <b>salary</b> by his <b>P1</b> rate to calculate the hours required.</li>
<li>If he needs to work more than 200 hours, we calculate the salary he needs to earn <i>after</i> the initial 200 hours, and divide that by his <b>P2</b> rate.  Don't forget to add back the 200 hours he's already worked.</li></ul>

<pre>
<font color=blue>if</font> salary &le; P1 * 200
    <font color=blue>return</font> salary / P1
<font color=blue>else</font>
    <font color=blue>return</font> (salary - P1 * 200) / P2 + 200
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6680&amp;rd=10005" name="6680">RGBStreet</a></b>
</font>
<A href="Javascript:openProblemRating(6680)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506000" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      297 / 458 (64.85%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      232 / 297 (78.11%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>dymu</b> for 480.17 points (5 mins 49 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      361.79 (for 232 correct submissions)
    </td>
  </tr>
</table></blockquote>

With the largest possible input, there are only 3*2<sup>19</sup> possible house color permutations.  The first house can be any of the 3 colors, and each subsequent house can only be one of <i>2</i> colors - the color of the previous house is disallowed.  This meant that you could use simple recursion to solve this problem within the runtime, quite appropriate for a Division 2 medium problem.
<br><br>
The recursive function needed to know the color of the previous house, as well as what number house we were busy with.  The function attempts to paint the current house each possible color, excluding the previously painted color.  It adds the cost of painting the current house with the cost of painting the rest of the street.  The base case was when we had run out of houses to paint, and it would return 0.  Psuedocode follows:
<pre>
<font color=blue>int</font> minCost(<font color=blue>int</font> previousColor, <font color=blue>int</font> houseNum)
    <font color=blue>if</font> houseNum &ge; houseCount
        <font color=blue>return</font> 0      <font color=green>// we have reached the end of the street, no further painting necessary</font>
    <font color=blue>int</font> bestCost = <i>infinity</i>
    <font color=blue>if</font> previousColor != 0
        bestCost = <font color=blue>min</font>(bestCost,minCost(0,houseNum+1) + paintCost(0,houseNum))
    <font color=blue>if</font> previousColor != 1
        bestCost = <font color=blue>min</font>(bestCost,minCost(1,houseNum+1) + paintCost(1,houseNum))
    <font color=blue>if</font> previousColor != 2
        bestCost = <font color=blue>min</font>(bestCost,minCost(2,houseNum+1) + paintCost(2,houseNum))
    <font color=blue>return</font> bestCost
</pre>
To find the minimum cost for painting the entire street, you call the function with <b>houseNum</b> = <b>0</b>, and <b>previousColor</b> = <b>-1</b>, which allows the first house to be painted <i>any</i> color.
<br><br>
While this solution is sufficient given the small constraints, Division 2 coders wanting to take the next step should try learn to <i>memoize</i> the recursive function, or even implement the entire solution as dynamic programming.  There is an excellent tutorial on how to make this improvement <a href="http://www.topcoder.com/tc?module=Static&d1=features&d2=040104">here</a>.  As a challenge, use either of these improvements to get your program solving cases with 50 houses, or 10 colors.
<br><br>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6765&amp;rd=10005" name="6765">ModularInequality</a></b>
</font>
<A href="Javascript:openProblemRating(6765)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506000" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      118 / 458 (25.76%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      8 / 118 (6.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>zhanluwang</b> for 703.91 points (20 mins 18 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      478.81 (for 8 correct submissions)
    </td>
  </tr>
</table></blockquote>
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
      280 / 403 (69.48%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      114 / 280 (40.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 490.95 points (3 mins 52 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      309.52 (for 114 correct submissions)
    </td>
  </tr>
</table></blockquote>

This problem, so simple to state, could be approached in a variety of different ways.  Your level of insight  decided which approach you took, and in turn, how error-prone your solution would be.
<p/>  Browsing solutions, 3 basic approaches are apparent:
<font color=darkblue><i>
<ul><li>1. Testing each potential <b>X</b>, calculating the function value, and totalling up the number of <b>X</b>s for which <b>f(X)</b> &le; <b>P</b>.</li>
<li>2. Recognizing that <b>f(X)</b> was linear on each section between values of A.  Calculate how many values of <b>X</b> led to <b>f(X)</b> &le; <b>P</b> on each section using basic algebra.</li>
<li>3. Recognizing that <b>f(X)</b> was decreasing and then increasing (unimodal), and that finding a minimum value was trivial.  Then using binary search or other simple technique to find the end points for which <b>f(X)</b> &le; <b>P</b>.</li>
</ul></i></font>

I'll deal with each of these approaches in turn:
<ul><li><font color=darkblue><i>1. Testing each potential <b>X</b></i></font></li></ul>

This approach was doomed to fail simply based on the problem constraints.  There are up to 2 billion feasible values of <b>X</b> to test, and calculating <b>f(X)</b> that many times will exceed the 2 second time limit.
<ul><li><font color=darkblue><i>2. Segmenting <b>f(X)</b> into linear sections</i></font></li></ul>

This approach had merit, and many contestants used it.  It was reasonably slow to implement and had numerous corner cases and complications which had to be handled with care.
<br><br>
Once <b>A</b> is sorted, it is possible to consider each set of possible X values from <b>A[i]</b> to <b>A[i+1]</b>.  Since we now know for each value in <b>A</b> whether <b>X</b>&gt;<b>A[j]</b>, we can drop the absolutes from <b>f(X)</b> and express <b>f(X)</b> as a linear equation of the form: <b>f(X) = MX + C</b>
<br><br>
Knowing the linear equation of <b>f(X)</b> on a section from <b>A[i]</b> to <b>A[i+1]</b>, it is possible to calculate where <b>f(X)</b> crosses <b>P</b> (if at all), and calculate the number of <b>X</b> values in that section for which <b>f(X)</b> &le; <b>P</b>.
<br><br>
Off-by-one errors and boundary conditions such as duplicate values in <b>A</b> caused this implementation to have a high failure rate.  For an excellent and clean example, take a look <handle>mishagam</handle>'s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=250137&rd=10005&pm=6765&cr=299904">solution</a>.
<ul><li><font color=darkblue><i>3. Recognizing that <b>f(X)</b> was decreasing and then increasing (unimodal)</i></font></li></ul>

This approach was the quickest to implement and the least error prone.  It recognized that the function was measuring the total distance in 1-space between <b>X</b> and each point in <b>A</b>.  There are some very useful properties of this function:
<br>- While <b>X</b> lies to the left of the majority of the points in <b>A</b>, <b>f(X)</b> is decreasing.
<br>- While <b>X</b> has an equal number of points of <b>A</b> to its left and its right, <b>f(X)</b> is constant and equal to the minimum of <b>f(X).</b>
<br>- While <b>X</b> lies to the right of the majority of the points in <b>A</b>, <b>f(X)</b> is increasing.
<br><br>
These properties are intuitive when one thinks about the function.  As <b>X</b> increases by 1, it moves closer to each point of <b>A</b> that lies to its right, and gets further from each point of <b>A</b> that lies to its left.  When <b>X</b> has an equal number of points of <b>A</b> to its left and right, a move to the left or right will move it towards and away from an equal number of points, leaving <b>f(X)</b> unchanged.
<br><br>
What this allows us to do is to establish the minimum of <b>f(X)</b>, which is at <b>X</b>=<b>A[N/2]</b> (where N is the number of elements in A), because of the 2nd property above.
<br><br>
Once we have the <b>X</b> for which <b>f(X)</b> is a minimum, you can split <b>f(X)</b> into 2 halves - one decreasing and the other increasing, and use a simple binary search on each half of <b>f(X)</b> to find the furthest points at which <b>f(X)</b>&le;<b>P</b>.
<br><br>
If you skip over <handle>Eryx</handle>'s macros, the heart of his <a href="http://www.topcoder.com/stat?c=problem_solution&rm=250139&rd=10005&pm=6765&cr=8355516">solution</a> does exactly this in about 6 lines of code, very elegantly.  For future reference, I can strongly recommend overcoming your fear of <handle>Eryx<handle>'s macros - there's frequently the most beautiful solutions buried under them.<br>
  <br>
  <font size="+2"><b><a href="/stat?c=problem_statement&amp;pm=6827&amp;rd=10005" name="6827">FenceRepairing</a></b>
  </font>
  <A href="Javascript:openProblemRating(6827)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
  <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506000" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
  <br>
Used as: Division One - Level One: </p>
<blockquote><table cellspacing="2">
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
      357 / 403 (88.59%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      249 / 357 (69.75%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ACRush</b> for 297.01 points (2 mins 51 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      248.83 (for 249 correct submissions)
    </td>
  </tr>
</table></blockquote>

Non-standard points values tend to frighten experienced coders, but there was little cause for alarm on this 300 point problem.  The input constraints allowed fences up to 2500 units long, which caused timeouts for careless coders and several members who forgot to give enough space in their storage array.
<br><br>
The problem could be solved with either dynamic programming, or careful recursion with memoization, but they both have the same recurrence relation at their heart.
<br><br>
The cheapest way to repair the first <b>i</b> boards was the minimum of:
<br>- The cheapest way to repair the first <b>i-1</b> boards, if board <b>i</b> was not broken.
<br>- The cheapest way to repair the first <b>j</b> boards, plus repairing the section from <b>j+1</b> to <b>i</b>, inclusive. (For each <b>j</b> from <b>0</b> to <b>i-1</b>)
<br><br>
Psuedocode for the DP implementation:
<pre>
<font color=blue>for</font> (i=1;i&le;N;i++)
    c[i]=<i>infinity</i>
    <font color=blue>if</font> board[i]=='.'
        c[i]=c[i-1]
    <font color=blue>for</font> (j=0;j&lt;i;j++)
        c[i]=<font color=blue>min</font>(c[i],c[j]+<font color=blue>sqrt</font>(i-j))

<font color=blue>return</font> c[N]
</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6828&amp;rd=10005" name="6828">NewMoneySystem</a></b>
</font>
<A href="Javascript:openProblemRating(6828)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506000" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      88 / 403 (21.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      72 / 88 (81.82%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 960.18 points (5 mins 50 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      682.04 (for 72 correct submissions)
    </td>
  </tr>
</table></blockquote>

A reasonably easy "hard" problem saw many experienced coders cash in with 900+ scores.  Some key insights helped simplify this problem.
<ul>
<li><b>1. We should always use the bare minimum of each small denomination.</b>  This is easily shown by considering 2 consecutive denominations of value <b>v</b> and <b>a*v</b>.  (<b>a</b> must be between 2 and 5, in the problem constraints).  Assume that you have <b>x</b> notes of value <b>v</b>, where <b>x</b>&ge;<b>a</b>.  In this case, you could simply exchange <b>a</b> notes of value <b>v</b> for a single note of value <b>a*v</b>, lowering the number of notes.</li>
<li><b>2. The problem can be broken in sub-problems, each with a lower N and K.</b>  The first denomination is always 1.  After we have decided on the value of the second denomination, call it <b>d</b>, we immediately know that all other denominations will be multiples of <b>d</b>.  Because of the property above we will have exactly <b>N</b>%<b>d</b> notes of value 1.  Since we know this, the remaining problem is:
<br>- Allocate <b>N-(N%d)</b> using <b>K-1</b> denominations, where the smallest denomination is <b>d</b>.
<br>Every denomination hereafter will be a multiple of <b>d</b>, and this allows us to solve an identical problem by dividing all those values by <b>d</b>:
<br>- Allocate <b>N/d</b> using <b>K-1</b> denominations where the smallest denomination is once again <b>1</b>.</li></ul>

With these two insights, the problem becomes very simple to implement using a recursive function.  We need to take care to implement memoization, because otherwise the number of recursive calls will be <b>4<sup>K</sup></b>, which will timeout for any significant values of K.  Even though the maximum <b>N</b> is <b>10<sup>18</sup></b>, each recursion reduces <b>N</b> logarithmically - meaning that the state space is small enough to store and memoize.  However, the sparseness of the values of <b>N</b> (being spread from 0 to 10<sup>18</sup>) means that memoization cannot be done using an array, but must be implemented using a <i>map</i> or <i>hashtable</i>.
<br><br>
Pseudocode follows:
<pre>
<font color=blue>long</font> minNotes(<font color=blue>long</font> N, <font color=blue>int</font> K)
    <font color=blue>if</font> map[N,K]
        <font color=blue>return</font> map[N,K]
    <font color=blue>if</font> K==1
        <font color=blue>return</font> N
    <font color=blue>long</font> iBest=<i>infinity</i>
    <font color=blue>for</font> (d=2;d&le;5;d++)
        iBest=<font color=blue>min</font>(iBest,N%d + minNotes(N/d,K-1)
    map[N,K]=iBest
    <font color=blue>return</font> iBest
</pre>
</p>

<div class="authorPhoto">
    <img src="/i/m/HiltonLange_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10428762" context="algorithm"/><br />
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
