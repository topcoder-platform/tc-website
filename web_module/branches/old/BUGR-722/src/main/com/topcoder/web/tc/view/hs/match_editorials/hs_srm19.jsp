<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
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
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10071&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506041" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 19</span><br>Monday, November 6, 2006
<br><br>

<h2>Match summary</h2>

 

<p>

The latest round of the TCHS division led competitors through a minefield of darts, sales, and parts.  Oh my!
</p><p>
The competition was fierce during the coding phase, as the competitors fought through a relatively easy problem set.
<tc-webtag:handle coderId="14886245" context="hs_algorithm"/> was the first to submit all three problems, but
resubmitted the 1000 point problem a few minutes later.  After the coding phase, <tc-webtag:handle coderId="22375930" context="hs_algorithm"/>
led all coders due to the fastest times on both the 500 and 1000, followed by <tc-webtag:handle coderId="22652504" context="hs_algorithm"/> and <tc-webtag:handle coderId="22285847" context="hs_algorithm"/>.
</p>
<p>
The challenge phase gave <tc-webtag:handle coderId="22652504" context="hs_algorithm"/> 50 points, vaulting him into the lead.  System tests were not kind, however,
knocking out his 1000 point problem, leaving <tc-webtag:handle coderId="22375930" context="hs_algorithm"/> (who also regained his red color) as the winner.
Filling out the rest of the top 5 were <tc-webtag:handle coderId="22285847" context="hs_algorithm"/>, 
<tc-webtag:handle coderId="20331303" context="hs_algorithm"/>,
<tc-webtag:handle coderId="22658394" context="hs_algorithm"/> (in his debut match), and
<tc-webtag:handle coderId="14886245" context="hs_algorithm"/>.

</p>

 

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6786&amp;rd=10071" name="6786">DartThrow</a></b>

</font>

<A href="Javascript:openProblemRating(6786)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506041" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      132 / 151 (87.42%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      120 / 132 (90.91%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>tomekkulczynski</b> for 247.78 points (2 mins 41 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      206.80 (for 120 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

The easiest way to solve this problem involves iterating over all possible targets to aim at.  For each
target, you can calculate the expected score, and keep track of the highest score found.  You have to 
be careful, though,  when checking the score at the first and last elements of <b>payout</b> to avoid going 
out of bounds; this can be fixed by hard-coding those cases, or by using modular arithmetic.  Java code
illustrating the latter follows:

<pre>
public class DartThrow
{

public double bestScore(int[] payout, int prob)
{
    // probability as a decimal
    double p = prob / 100.0;
    // probability of hitting a side target
    double p2 = (1 - p) / 2.0;
    int i, N=payout.length;
    double ret = 0.0;
    for(i=0; i&ltN; i++)
        ret = Math.max(ret, p*payout[i] + p2*payout[(i+1)%N] + p2*payout[(i-1+N)%N]);
    return ret;
}
}
</pre>


</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6825&amp;rd=10071" name="6825">SalePitch</a></b>

</font>

<A href="Javascript:openProblemRating(6825)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506041" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      101 / 151 (66.89%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      81 / 101 (80.20%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Weiqi</b> for 487.23 points (4 mins 37 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      382.42 (for 81 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

Let <b>r</b> be the cost of <b>regular</b> in cents.  Similarly, let <b>s</b> be the cost of <b>sale</b> in cents.
If you purchase <b>s</b> items at <b>regular</b> cost, then it is the same as buying <b>r</b> items at the <b>sale</b>
price, meaning that you get <b>free</b> = <b>s-r</b> items for free.  However, if <b>s</b> and <b>free</b> have
any common divisors, this is not the smallest possible solution.  To fix this, you need to find the greatest common divisor (or gcd for short)
of <b>s</b> and <b>free</b>, which can be found using the <a href="http://en.wikipedia.org/wiki/Euclidean_algorithm">Euclidean Algorithm</a>.
Finding the gcd turns out to be very useful in many TopCoder problems, so it is good to be able to quickly code this.
See <tc-webtag:handle coderId="21547660" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&cr=21547660&rd=10071&pm=6825">solution</a>
for a clean implementation of this.


</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6809&amp;rd=10071" name="6809">RubeGoldberg</a></b>

</font>

<A href="Javascript:openProblemRating(6809)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506041" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      50 / 151 (33.11%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      25 / 50 (50.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Weiqi</b> for 859.83 points (11 mins 52 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      603.92 (for 25 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

Helping Lucy out with her science project turns out to be an exercise in Dynamic Programming (see <a href="/tc?module=Static&d1=tutorials&d2=dynProg">this tutorial</a> for more information), a tool that
turns out to be very useful in TopCoder competitions.  To do this, we need to build a two-dimensional array.
dp[<i>time</i>][<i>e</i>] will be set to 1 if there is some configuration of parts that takes exactly <i>time</i>
seconds and ends with <i>e</i> energy; if this cannot happen, then it is set to 0.
</p>
<p>
Since we can start out with any type of energy, we can set dp[0][<i>i</i>] to 1 for all four types of energy,
and set the rest of the array to 0.  We then proceed to step through the array chronologically.  For each time <i>t</i>,
we see if dp[<i>t</i>][<i>e</i>] is equal to 1 for any energy <i>e</i>.  If it is, then we can extend the machine with
any parts that begin with <i>e</i> energy; this allows us to set dp[<i>t</i> + part_time][part_output]=1 for those parts.
  After looping through all values of <i>t</i>, we can then look in the <b>last</b>
column to find the closest element to <b>target</b> that is set to 1.
</p>
<p>
Although this method works, there was another trap to watch out for.  Sometimes, you had to go over the <b>target</b> to
get the closest time; example 4 was one example of this.  Extending your array and searching through a total of 2*<b>target</b> seconds 
was sufficient to avoid this scenario.
</p><p>
See <tc-webtag:handle coderId="15600321" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&cr=15600321&rd=10071&pm=6809">solution</a>
for a good example of this method.
</p>

 
<%--
<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
--%>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7296000" context="algorithm"/><br />    <em>TopCoder Member</em>
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
